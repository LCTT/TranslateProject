[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Woothee (HTTP User Agent Parser))
[#]: via: (https://theartofmachinery.com/2020/11/14/woothee.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

Woothee (HTTP User Agent Parser)
======

I’ve written [a D implementation of the Project Woothee multi-language HTTP user agent parser][1]. Here are some notes about what it’s useful for, and few things special about the D implementation.

### Project Woothee

HTTP clients (like normal browsers and search engine crawlers) usually identify themselves to web servers with a user agent string. These strings often contain interesting information like the client name, client version and operating system, but the HTTP spec makes no rules about how this information should be structured (it’s free-form text). Parsing them requires a bunch of rules based on what real clients use in the wild.

There’s a project called [ua-parser][2] that maintains a list of (currently) ~1000 regular expressions for parsing user agent strings. Project Woothee is another project that’s less comprehensive, but faster than testing 1000 regexes. Sometimes you want a more comprehensive parser, but sometimes it doesn’t really help. For example, suppose you want to estimate the proportion of your users running Firefox versus Chrome versus whatever by processing a big web log dump. The answer will never be 100% accurate (even with 100% accurate parsing) because bots pretending to be Chrome browsers will skew the results a bit anyway.

Woothee has some quirks (e.g., it doesn’t distinguish RSS reader clients) but it has uses, too.

### The D version

I wanted to keep the D version code simple so that it can be easily updated when the upstream project data gets updated. I took some easy opportunities to make it faster, though. In a quick, unscientific test, it parsed ~1M strings from a web log on a five-year-old laptop in about 5s. I’m sure it could be made faster, but that’s good enough for me right now.

#### Preprocessing regexes and HTTP client data

Woothee still uses some regexes (about 50). In most languages, these are strings that need to be processed at runtime, every time the program is run. I don’t know if [Boost Xpressive][3] was the first to support compile-time regex parsing, but I remember being impressed by it at the time. The downside is having to use an operator overloading hack that manages to make regexes even harder to read:

```
sregex re = '$' >> +_d >> '.' >> _d >> _d;
```

We’ve come a long way since 2007. [D’s standard library has a compile-time regex][4], but it’s not even needed. This works:

```
void foo()
{
    import std.regex;
    static immutable re = regex(`\$\d+\.\d\d`);
    // ...
}
```

If you’re wondering: `static` puts the `re` into the same storage space as a global variable would be in (instead of the stack, which is run time only), while `immutable` allows the compiler to avoid copying the variable into thread-local storage for every thread. If you’re from C++, you might expect that `regex()` will still get called once at run time to initialise `re`, but thanks to [CTFE][5] it’s processed at compile time and turned into normal data in the compiled binary.

There’s one big downside: this kind of complex CTFE is still slow. Compiling all the regexes using DMD takes ~10s, long enough to be annoying. So I added a [version flag][6] `WootheePrecompute`. Switching regex CTFE is simpler because the regex matching functions in `std.regex` also have overloads that take plain strings for regexes (which then get compiled and passed to the overload that takes a pre-compiled regex). `woothee-d` uses a helper function defined like this:

```
version(WootheePrecompute)
{
    auto buildRegex(string r)
    {
        return regex(r);
    }
}
else
{
    auto buildRegex(string r)
    {
        return r;
    }
}
```

Then regexes get used in the code like this:

```
static immutable version_re = buildRegex(`Sleipnir/([.0-9]+)`);
const caps = _agent.matchFirst(version_re);
```

Without `WootheePrecompute`, `buildRegex()` has no effect, and `version_re` is just a plain string that gets compiled on use. With `WootheePrecompute` enabled, `buildRegex()` actually compiles the regex using CTFE.

`WootheePrecompute` also enables processing the Project Woothee HTTP client data at compile time instead of at startup.

#### More precomputation for faster string searching

Woothee requires a lot of searching for strings inside the user agent string. Here’s a small sample:

```
if (contains!"Yahoo" || contains!"help.yahoo.co.jp/help/jp/" || contains!"listing.yahoo.co.jp/support/faq/")
{
    if (contains!"compatible; Yahoo! Slurp") return populateDataset("YahooSlurp");
    if (contains!"YahooFeedSeekerJp" || contains!"YahooFeedSeekerBetaJp" || contains!"crawler (http://listing.yahoo.co.jp/support/faq/" || contains!"crawler (http://help.yahoo.co.jp/help/jp/" || contains!"Y!J-BRZ/YATSHA crawler" || contains!"Y!J-BRY/YATSH crawler") return populateDataset("YahooJP");
    if (contains!"Yahoo Pipes") return populateDataset("YahooPipes");
}
```

You may have noticed that `contains` is a template function taking the “needle” string as compile-time parameter. There are many famous ways to make searching for a “needle” string in a “haystack” string faster if you can preprocess either one. The Boyer-Moore algorithm is one algorithm, and there’s actually [an implementation in Phobos][7], but sadly it doesn’t work in CTFE.

I tried another trick that’s simple and fast for short strings. The key idea is that there’s no point searching for a needle like “foo” if the haystack doesn’t even contain both the letters “f” and “o” in the first place. We can create a 64b hash of both strings that lets us do an approximate character subset test with a super-fast bitwise operation (like a [bloom filter][8]). The hashes for all the needle strings can be calculated at compile time, and the hash for the haystack (the user agent string) only needs to calculated once.

The hash is super simple. Each byte in the string just sets one of the 64 bits of the output. Specifically, the hash takes each byte in the string, calculates the value modulo 64 (equivalently, takes the lower 6 bits), then sets the corresponding bit of the 64b output. Here’s the code:

```
ulong bloomHashOf(string s) pure
{
    ulong ret;
    foreach (char c; s)
    {
        ret |= 1UL << (c & 63);
    }
    return ret;
}
```

Here’s an example with the string, “X11; FreeBSD ”:

![Bloom-filter-style 64b hash of the string “X11; FreeBSD ”. The string starts with the letter “X”, which has ASCII code 88, which is 64 + 24, which is why bit #24 is set.][9]

Note that the hash doesn’t count occurrences of a character; it just flags whether a particular character occurs at all. It also loses all information about order. It’s still useful for avoiding a lot of futile searches. For example, “Tiny Tiny RSS/20.05-c8243b0 (<http://tt-rss.org/)”> doesn’t contain the character “X”, so there’s no way it can contain the string “X11; FreeBSD ”, as is easily detected by the hashes:

![Hashes of the string “Tiny Tiny RSS/20.05-c8243b0 \(http://tt-rss.org/\)” and the string “X11; FreeBSD ”. The first hash doesn't have bit #24 set, proving that the first string can't contain a letter “X”, proving that the second string can't be contained inside it.][10]

Here’s the D code. It does a quick bitwise op to check if _all_ the bits set in the needle hash are also set in the (previously calculated) user agent string hash. `bloomHashOf(needle)` is calculated as a constant at compile time. In fact, LDC with `-O2` inlines very sensibly, basically putting some bit ops with a 64b constant in front of a conditional jump in front of the call to `canFind()`. This precomputation is dirt cheap, so I didn’t even bother putting a `version(WootheePrecompute)` in there, as you can see for yourself:

```
bool contains(string needle)()
{
    import std.algorithm.searching : canFind;
    enum needle_bloom = bloomHashOf(needle);
    if ((needle_bloom & _agent_bloom) != needle_bloom) return false;
    return _agent.canFind(needle);
}
```

The quick check is one sided. If it fails, we know we don’t need to search. If it passes, that doesn’t prove we have a substring match because the hash doesn’t account for repeated characters, or character order, and can also have different characters colliding to set the same bit value.

Simply taking the bottom 6 bits is a pretty unsophisticated hashing technique, but if you look at an ASCII chart (`man ascii`), most of the characters that typically appear in HTTP user agents are in the range 64-127, which all have different values in the bottom 6 bits. So collisions aren’t a real problem, and actually [most pseuodorandom hashes would do a worse job][11].

In a simple test with real HTTP user agents from a log, 89% of potential `canFind()` calls were skipped thanks to the quick check, 9% were followed but failed and 2% were followed and found a real match. Overall, the quick check made `woothee-d` almost twice as fast, which is a nice win for some cheap precomputation. I think there’s more performance that could be gained, but it looks like most of the low-hanging fruit for string search has been taken.

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2020/11/14/woothee.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://gitlab.com/sarneaud/woothee-d
[2]: https://github.com/ua-parser
[3]: https://www.boost.org/doc/libs/1_74_0/doc/html/xpressive/user_s_guide.html#boost_xpressive.user_s_guide.creating_a_regex_object.static_regexes
[4]: https://dlang.org/phobos/std_regex.html#ctRegex
[5]: https://tour.dlang.org/tour/en/gems/compile-time-function-evaluation-ctfe
[6]: https://dlang.org/spec/version.html
[7]: https://dlang.org/phobos/std_algorithm_searching.html#boyerMooreFinder
[8]: https://en.wikipedia.org/wiki/Bloom_filter
[9]: https://theartofmachinery.com/images/woothee/bloom.svg
[10]: https://theartofmachinery.com/images/woothee/bloom_mismatch.svg
[11]: https://theartofmachinery.com/2020/01/27/systems_programming_probability.html
