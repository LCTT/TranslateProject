[A Programmer’s Introduction to Unicode][18]
============================================================


Ｕｎｉｃｏｄｅ! 🅤🅝🅘🅒🅞🅓🅔‽ 🇺‌🇳‌🇮‌🇨‌🇴‌🇩‌🇪! 😄 The very name strikes fear and awe into the hearts of programmers worldwide. We all know we ought to “support Unicode” in our software (whatever that means—like using `wchar_t` for all the strings, right?). But Unicode can be abstruse, and diving into the thousand-page [Unicode Standard][27] plus its dozens of supplementary [annexes, reports][28], and [notes][29]can be more than a little intimidating. I don’t blame programmers for still finding the whole thing mysterious, even 30 years after Unicode’s inception.

A few months ago, I got interested in Unicode and decided to spend some time learning more about it in detail. In this article, I’ll give an introduction to it from a programmer’s point of view.

I’m going to focus on the character set and what’s involved in working with strings and files of Unicode text. However, in this article I’m not going to talk about fonts, text layout/shaping/rendering, or localization in detail—those are separate issues, beyond my scope (and knowledge) here.

*   [Diversity and Inherent Complexity][10]
*   [The Unicode Codespace][11]
    *   [Codespace Allocation][2]
    *   [Scripts][3]
    *   [Usage Frequency][4]
*   [Encodings][12]
    *   [UTF-8][5]
    *   [UTF-16][6]
*   [Combining Marks][13]
    *   [Canonical Equivalence][7]
    *   [Normalization Forms][8]
    *   [Grapheme Clusters][9]
*   [And More…][14]

### [][30]Diversity and Inherent Complexity

As soon as you start to study Unicode, it becomes clear that it represents a large jump in complexity over character sets like ASCII that you may be more familiar with. It’s not just that Unicode contains a much larger number of characters, although that’s part of it. Unicode also has a great deal of internal structure, features, and special cases, making it much more than what one might expect a mere “character set” to be. We’ll see some of that later in this article.

When confronting all this complexity, especially as an engineer, it’s hard not to find oneself asking, “Why do we need all this? Is this really necessary? Couldn’t it be simplified?”

However, Unicode aims to faithfully represent the  _entire world’s_  writing systems. The Unicode Consortium’s stated goal is “enabling people around the world to use computers in any language”. And as you might imagine, the diversity of written languages is immense! To date, Unicode supports 135 different scripts, covering some 1100 languages, and there’s still a long tail of [over 100 unsupported scripts][31], both modern and historical, which people are still working to add.

Given this enormous diversity, it’s inevitable that representing it is a complicated project. Unicode embraces that diversity, and accepts the complexity inherent in its mission to include all human writing systems. It doesn’t make a lot of trade-offs in the name of simplification, and it makes exceptions to its own rules where necessary to further its mission.

Moreover, Unicode is committed not just to supporting texts in any  _single_  language, but also to letting multiple languages coexist within one text—which introduces even more complexity.

Most programming languages have libaries available to handle the gory low-level details of text manipulation, but as a programmer, you’ll still need to know about certain Unicode features in order to know when and how to apply them. It may take some time to wrap your head around it all, but don’t be discouraged—think about the billions of people for whom your software will be more accessible through supporting text in their language. Embrace the complexity!

### [][32]The Unicode Codespace

Let’s start with some general orientation. The basic elements of Unicode—its “characters”, although that term isn’t quite right—are called  _code points_ . Code points are identified by number, customarily written in hexadecimal with the prefix “U+”, such as [U+0041 “A” latin capital letter a][33] or [U+03B8 “θ” greek small letter theta][34]. Each code point also has a short name, and quite a few other properties, specified in the [Unicode Character Database][35].

The set of all possible code points is called the  _codespace_ . The Unicode codespace consists of 1,114,112 code points. However, only 128,237 of them—about 12% of the codespace—are actually assigned, to date. There’s plenty of room for growth! Unicode also reserves an additional 137,468 code points as “private use” areas, which have no standardized meaning and are available for individual applications to define for their own purposes.

### [][36]Codespace Allocation

To get a feel for how the codespace is laid out, it’s helpful to visualize it. Below is a map of the entire codespace, with one pixel per code point. It’s arranged in tiles for visual coherence; each small square is 16×16 = 256 code points, and each large square is a “plane” of 65,536 code points. There are 17 planes altogether.

[
 ![Map of the Unicode codespace (click to zoom)](http://reedbeta.com/blog/programmers-intro-to-unicode/codespace-map.png "Map of the Unicode codespace (click to zoom)") 
][37]

White represents unassigned space. Blue is assigned code points, green is private-use areas, and the small red area is surrogates (more about those later). As you can see, the assigned code points are distributed somewhat sparsely, but concentrated in the first three planes.

Plane 0 is also known as the “Basic Multilingual Plane”, or BMP. The BMP contains essentially all the characters needed for modern text in any script, including Latin, Cyrillic, Greek, Han (Chinese), Japanese, Korean, Arabic, Hebrew, Devanagari (Indian), and many more.

(In the past, the codespace was just the BMP and no more—Unicode was originally conceived as a straightforward 16-bit encoding, with only 65,536 code points. It was expanded to its current size in 1996\. However, the vast majority of code points in modern text belong to the BMP.)

Plane 1 contains historical scripts, such as Sumerian cuneiform and Egyptian hieroglyphs, as well as emoji and various other symbols. Plane 2 contains a large block of less-common and historical Han characters. The remaining planes are empty, except for a small number of rarely-used formatting characters in Plane 14; planes 15–16 are reserved entirely for private use.

### [][38]Scripts

Let’s zoom in on the first three planes, since that’s where the action is:

[
 ![Map of scripts in Unicode planes 0–2 (click to zoom)](http://reedbeta.com/blog/programmers-intro-to-unicode/script-map.png "Map of scripts in Unicode planes 0–2 (click to zoom)") 
][39]

This map color-codes the 135 different scripts in Unicode. You can see how Han <nobr>()</nobr> and Korean <nobr>()</nobr>take up most of the range of the BMP (the left large square). By contrast, all of the European, Middle Eastern, and South Asian scripts fit into the first row of the BMP in this diagram.

Many areas of the codespace are adapted or copied from earlier encodings. For example, the first 128 code points of Unicode are just a copy of ASCII. This has clear benefits for compatibility—it’s easy to losslessly convert texts from smaller encodings into Unicode (and the other direction too, as long as no characters outside the smaller encoding are used).

### [][40]Usage Frequency

One more interesting way to visualize the codespace is to look at the distribution of usage—in other words, how often each code point is actually used in real-world texts. Below is a heat map of planes 0–2 based on a large sample of text from Wikipedia and Twitter (all languages). Frequency increases from black (never seen) through red and yellow to white.

[
 ![Heat map of code point usage frequency in Unicode planes 0–2 (click to zoom)](http://reedbeta.com/blog/programmers-intro-to-unicode/heatmap-wiki+tweets.png "Heat map of code point usage frequency in Unicode planes 0–2 (click to zoom)") 
][41]

You can see that the vast majority of this text sample lies in the BMP, with only scattered usage of code points from planes 1–2\. The biggest exception is emoji, which show up here as the several bright squares in the bottom row of plane 1.

### [][42]Encodings

We’ve seen that Unicode code points are abstractly identified by their index in the codespace, ranging from U+0000 to U+10FFFF. But how do code points get represented as bytes, in memory or in a file?

The most convenient, computer-friendliest (and programmer-friendliest) thing to do would be to just store the code point index as a 32-bit integer. This works, but it consumes 4 bytes per code point, which is sort of a lot. Using 32-bit ints for Unicode will cost you a bunch of extra storage, memory, and performance in bandwidth-bound scenarios, if you work with a lot of text.

Consequently, there are several more-compact encodings for Unicode. The 32-bit integer encoding is officially called UTF-32 (UTF = “Unicode Transformation Format”), but it’s rarely used for storage. At most, it comes up sometimes as a temporary internal representation, for examining or operating on the code points in a string.

Much more commonly, you’ll see Unicode text encoded as either UTF-8 or UTF-16\. These are both _variable-length_  encodings, made up of 8-bit or 16-bit units, respectively. In these schemes, code points with smaller index values take up fewer bytes, which saves a lot of memory for typical texts. The trade-off is that processing UTF-8/16 texts is more programmatically involved, and likely slower.

### [][43]UTF-8

In UTF-8, each code point is stored using 1 to 4 bytes, based on its index value.

UTF-8 uses a system of binary prefixes, in which the high bits of each byte mark whether it’s a single byte, the beginning of a multi-byte sequence, or a continuation byte; the remaining bits, concatenated, give the code point index. This table shows how it works:

| UTF-8 (binary) | Code point (binary) | Range |
| --- | --- | --- |
| 0xxxxxxx | xxxxxxx | U+0000–U+007F |
| 110xxxxx 10yyyyyy | xxxxxyyyyyy | U+0080–U+07FF |
| 1110xxxx 10yyyyyy 10zzzzzz | xxxxyyyyyyzzzzzz | U+0800–U+FFFF |
| 11110xxx 10yyyyyy 10zzzzzz 10wwwwww | xxxyyyyyyzzzzzzwwwwww | U+10000–U+10FFFF |

A handy property of UTF-8 is that code points below 128 (ASCII characters) are encoded as single bytes, and all non-ASCII code points are encoded using sequences of bytes 128–255\. This has a couple of nice consequences. First, any strings or files out there that are already in ASCII can also be interpreted as UTF-8 without any conversion. Second, lots of widely-used string programming idioms—such as null termination, or delimiters (newlines, tabs, commas, slashes, etc.)—will just work on UTF-8 strings. ASCII bytes never occur inside the encoding of non-ASCII code points, so searching byte-wise for a null terminator or a delimiter will do the right thing.

Thanks to this convenience, it’s relatively simple to extend legacy ASCII programs and APIs to handle UTF-8 strings. UTF-8 is very widely used in the Unix/Linux and Web worlds, and many programmers argue [UTF-8 should be the default encoding everywhere][44].

However, UTF-8 isn’t a drop-in replacement for ASCII strings in all respects. For instance, code that iterates over the “characters” in a string will need to decode UTF-8 and iterate over code points (or maybe grapheme clusters—more about those later), not bytes. When you measure the “length” of a string, you’ll need to think about whether you want the length in bytes, the length in code points, the width of the text when rendered, or something else.

### [][45]UTF-16

The other encoding that you’re likely to encounter is UTF-16\. It uses 16-bit words, with each code point stored as either 1 or 2 words.

Like UTF-8, we can express the UTF-16 encoding rules in the form of binary prefixes:

| UTF-16 (binary) | Code point (binary) | Range |
| --- | --- | --- |
| xxxxxxxxxxxxxxxx | xxxxxxxxxxxxxxxx | U+0000–U+FFFF |
| 110110xxxxxxxxxx 110111yyyyyyyyyy | xxxxxxxxxxyyyyyyyyyy + 0x10000 | U+10000–U+10FFFF |

A more common way that people talk about UTF-16 encoding, though, is in terms of code points called “surrogates”. All the code points in the range U+D800–U+DFFF—or in other words, the code points that match the binary prefixes `110110` and `110111` in the table above—are reserved specifically for UTF-16 encoding, and don’t represent any valid characters on their own. They’re only meant to occur in the 2-word encoding pattern above, which is called a “surrogate pair”. Surrogate code points are illegal in any other context! They’re not allowed in UTF-8 or UTF-32 at all.

Historically, UTF-16 is a descendant of the original, pre-1996 versions of Unicode, in which there were only 65,536 code points. The original intention was that there would be no different “encodings”; Unicode was supposed to be a straightforward 16-bit character set. Later, the codespace was expanded to make room for a long tail of less-common (but still important) Han characters, which the Unicode designers didn’t originally plan for. Surrogates were then introduced, as—to put it bluntly—a kludge, allowing 16-bit encodings to access the new code points.

Today, Javascript uses UTF-16 as its standard string representation: if you ask for the length of a string, or iterate over it, etc., the result will be in UTF-16 words, with any code points outside the BMP expressed as surrogate pairs. UTF-16 is also used by the Microsoft Win32 APIs; though Win32 supports either 8-bit or 16-bit strings, the 8-bit version unaccountably still doesn’t support UTF-8—only legacy code-page encodings, like ANSI. This leaves UTF-16 as the only way to get proper Unicode support in Windows.

By the way, UTF-16’s words can be stored either little-endian or big-endian. Unicode has no opinion on that issue, though it does encourage the convention of putting [U+FEFF zero width no-break space][46] at the top of a UTF-16 file as a [byte-order mark][47], to disambiguate the endianness. (If the file doesn’t match the system’s endianness, the BOM will be decoded as U+FFFE, which isn’t a valid code point.)

### [][48]Combining Marks

In the story so far, we’ve been focusing on code points. But in Unicode, a “character” can be more complicated than just an individual code point!

Unicode includes a system for  _dynamically composing_  characters, by combining multiple code points together. This is used in various ways to gain flexibility without causing a huge combinatorial explosion in the number of code points.

In European languages, for example, this shows up in the application of diacritics to letters. Unicode supports a wide range of diacritics, including acute and grave accents, umlauts, cedillas, and many more. All these diacritics can be applied to any letter of any alphabet—and in fact,  _multiple_  diacritics can be used on a single letter.

If Unicode tried to assign a distinct code point to every possible combination of letter and diacritics, things would rapidly get out of hand. Instead, the dynamic composition system enables you to construct the character you want, by starting with a base code point (the letter) and appending additional code points, called “combining marks”, to specify the diacritics. When a text renderer sees a sequence like this in a string, it automatically stacks the diacritics over or under the base letter to create a composed character.

For example, the accented character “Á” can be expressed as a string of two code points: [U+0041 “A” latin capital letter a][49] plus [U+0301 “◌́” combining acute accent][50]. This string automatically gets rendered as a single character: “Á”.

Now, Unicode does also include many “precomposed” code points, each representing a letter with some combination of diacritics already applied, such as [U+00C1 “Á” latin capital letter a with acute][51] or [U+1EC7 “ệ” latin small letter e with circumflex and dot below][52]. I suspect these are mostly inherited from older encodings that were assimilated into Unicode, and kept around for compatibility. In practice, there are precomposed code points for most of the common letter-with-diacritic combinations in European-script languages, so they don’t use dynamic composition that much in typical text.

Still, the system of combining marks does allow for an  _arbitrary number_  of diacritics to be stacked on any base character. The reductio-ad-absurdum of this is [Zalgo text][53], which works by ͖͟ͅr͞aṋ̫̠̖͈̗d͖̻̹óm̪͙͕̗̝ļ͇̰͓̳̫ý͓̥̟͍ ̕s̫t̫̱͕̗̰̼̘͜a̼̩͖͇̠͈̣͝c̙͍k̖̱̹͍͘i̢n̨̺̝͇͇̟͙ģ̫̮͎̻̟ͅ ̕n̼̺͈͞u̮͙m̺̭̟̗͞e̞͓̰̤͓̫r̵o̖ṷs҉̪͍̭̬̝̤ ̮͉̝̞̗̟͠d̴̟̜̱͕͚i͇̫̼̯̭̜͡ḁ͙̻̼c̲̲̹r̨̠̹̣̰̦i̱t̤̻̤͍͙̘̕i̵̜̭̤̱͎c̵s ͘o̱̲͈̙͖͇̲͢n͘ ̜͈e̬̲̠̩ac͕̺̠͉h̷̪ ̺̣͖̱ḻ̫̬̝̹ḙ̙̺͙̭͓̲t̞̞͇̲͉͍t̷͔̪͉̲̻̠͙e̦̻͈͉͇r͇̭̭̬͖,̖́ ̜͙͓̣̭s̘̘͈o̱̰̤̲ͅ ̛̬̜̙t̼̦͕̱̹͕̥h̳̲͈͝ͅa̦t̻̲ ̻̟̭̦̖t̛̰̩h̠͕̳̝̫͕e͈̤̘͖̞͘y҉̝͙ ̷͉͔̰̠o̞̰v͈͈̳̘͜er̶f̰͈͔ḻ͕̘̫̺̲o̲̭͙͠ͅw̱̳̺ ͜t̸h͇̭͕̳͍e̖̯̟̠ ͍̞̜͔̩̪͜ļ͎̪̲͚i̝̲̹̙̩̹n̨̦̩̖ḙ̼̲̼͢ͅ ̬͝s̼͚̘̞͝p͙̘̻a̙c҉͉̜̤͈̯̖i̥͡n̦̠̱͟g̸̗̻̦̭̮̟ͅ ̳̪̠͖̳̯̕a̫͜n͝d͡ ̣̦̙ͅc̪̗r̴͙̮̦̹̳e͇͚̞͔̹̫͟a̙̺̙ț͔͎̘̹ͅe̥̩͍ a͖̪̜̮͙̹n̢͉̝ ͇͉͓̦̼́a̳͖̪̤̱p̖͔͔̟͇͎͠p̱͍̺ę̲͎͈̰̲̤̫a̯͜r̨̮̫̣̘a̩̯͖n̹̦̰͎̣̞̞c̨̦̱͔͎͍͖e̬͓͘ ̤̰̩͙̤̬͙o̵̼̻̬̻͇̮̪f̴ ̡̙̭͓͖̪̤“̸͙̠̼c̳̗͜o͏̼͙͔̮r̞̫̺̞̥̬ru̺̻̯͉̭̻̯p̰̥͓̣̫̙̤͢t̳͍̳̖ͅi̶͈̝͙̼̙̹o̡͔n̙̺̹̖̩͝ͅ”̨̗͖͚̩.̯͓

A few other places where dynamic character composition shows up in Unicode:

*   [Vowel-pointing notation][15] in Arabic and Hebrew. In these languages, words are normally spelled with some of their vowels left out. They then have diacritic notation to indicate the vowels (used in dictionaries, language-teaching materials, children’s books, and such). These diacritics are expressed with combining marks.

    | A Hebrew example, with [niqqud][1]: | אֶת דַלְתִּי הֵזִיז הֵנִיעַ, קֶטֶב לִשְׁכַּתִּי יָשׁוֹד |
    | Normal writing (no niqqud): | את דלתי הזיז הניע, קטב לשכתי ישוד |

*   [Devanagari][16], the script used to write Hindi, Sanskrit, and many other South Asian languages, expresses certain vowels as combining marks attached to consonant letters. For example, “ह” + “​ि” = “हि” (“h” + “i” = “hi”).

*   Korean characters stand for syllables, but they are composed of letters called [jamo][17] that stand for the vowels and consonants in the syllable. While there are code points for precomposed Korean syllables, it’s also possible to dynamically compose them by concatenating their jamo. For example, “ᄒ” + “ᅡ” + “ᆫ” = “한” (“h” + “a” + “n” = “han”).

### [][54]Canonical Equivalence

In Unicode, precomposed characters exist alongside the dynamic composition system. A consequence of this is that there are multiple ways to express “the same” string—different sequences of code points that result in the same user-perceived characters. For example, as we saw earlier, we can express the character “Á” either as the single code point U+00C1,  _or_  as the string of two code points U+0041 U+0301.

Another source of ambiguity is the ordering of multiple diacritics in a single character. Diacritic order matters visually when two diacritics apply to the same side of the base character, e.g. both above: “ǡ” (dot, then macron) is different from “ā̇” (macron, then dot). However, when diacritics apply to different sides of the character, e.g. one above and one below, then the order doesn’t affect rendering. Moreover, a character with multiple diacritics might have one of the diacritics precomposed and others expressed as combining marks.

For example, the Vietnamese letter “ệ” can be expressed in  _five_  different ways:

*   Fully precomposed: U+1EC7 “ệ”
*   Partially precomposed: U+1EB9 “ẹ” + U+0302 “◌̂”
*   Partially precomposed: U+00EA “ê” + U+0323 “◌̣”
*   Fully decomposed: U+0065 “e” + U+0323 “◌̣” + U+0302 “◌̂”
*   Fully decomposed: U+0065 “e” + U+0302 “◌̂” + U+0323 “◌̣”

Unicode refers to set of strings like this as “canonically equivalent”. Canonically equivalent strings are supposed to be treated as identical for purposes of searching, sorting, rendering, text selection, and so on. This has implications for how you implement operations on text. For example, if an app has a “find in file” operation and the user searches for “ệ”, it should, by default, find occurrences of  _any_  of the five versions of “ệ” above!

### [][55]Normalization Forms

To address the problem of “how to handle canonically equivalent strings”, Unicode defines several _normalization forms_ : ways of converting strings into a canonical form so that they can be compared code-point-by-code-point (or byte-by-byte).

The “NFD” normalization form fully  _decomposes_  every character down to its component base and combining marks, taking apart any precomposed code points in the string. It also sorts the combining marks in each character according to their rendered position, so e.g. diacritics that go below the character come before the ones that go above the character. (It doesn’t reorder diacritics in the same rendered position, since their order matters visually, as previously mentioned.)

The “NFC” form, conversely, puts things back together into precomposed code points as much as possible. If an unusual combination of diacritics is called for, there may not be any precomposed code point for it, in which case NFC still precomposes what it can and leaves any remaining combining marks in place (again ordered by rendered position, as in NFD).

There are also forms called NFKD and NFKC. The “K” here refers to  _compatibility_  decompositions, which cover characters that are “similar” in some sense but not visually identical. However, I’m not going to cover that here.

### [][56]Grapheme Clusters

As we’ve seen, Unicode contains various cases where a thing that a user thinks of as a single “character” might actually be made up of multiple code points under the hood. Unicode formalizes this using the notion of a  _grapheme cluster_ : a string of one or more code points that constitute a single “user-perceived character”.

[UAX #29][57] defines the rules for what, precisely, qualifies as a grapheme cluster. It’s approximately “a base code point followed by any number of combining marks”, but the actual definition is a bit more complicated; it accounts for things like Korean jamo, and [emoji ZWJ sequences][58].

The main thing grapheme clusters are used for is text  _editing_ : they’re often the most sensible unit for cursor placement and text selection boundaries. Using grapheme clusters for these purposes ensures that you can’t accidentally chop off some diacritics when you copy-and-paste text, that left/right arrow keys always move the cursor by one visible character, and so on.

Another place where grapheme clusters are useful is in enforcing a string length limit—say, on a database field. While the true, underlying limit might be something like the byte length of the string in UTF-8, you wouldn’t want to enforce that by just truncating bytes. At a minimum, you’d want to “round down” to the nearest code point boundary; but even better, round down to the nearest  _grapheme cluster boundary_ . Otherwise, you might be corrupting the last character by cutting off a diacritic, or interrupting a jamo sequence or ZWJ sequence.

### [][59]And More…

There’s much more that could be said about Unicode from a programmer’s perspective! I haven’t gotten into such fun topics as case mapping, collation, compatibility decompositions and confusables, Unicode-aware regexes, or bidirectional text. Nor have I said anything yet about implementation issues—how to efficiently store and look-up data about the sparsely-assigned code points, or how to optimize UTF-8 decoding, string comparison, or NFC normalization. Perhaps I’ll return to some of those things in future posts.

Unicode is a fascinating and complex system. It has a many-to-one mapping between bytes and code points, and on top of that a many-to-one (or, under some circumstances, many-to-many) mapping between code points and “characters”. It has oddball special cases in every corner. But no one ever claimed that representing  _all written languages_  was going to be  _easy_ , and it’s clear that we’re never going back to the bad old days of a patchwork of incompatible encodings.

Further reading:

*   [The Unicode Standard][21]
*   [UTF-8 Everywhere Manifesto][22]
*   [Dark corners of Unicode][23] by Eevee
*   [ICU (International Components for Unicode)][24]—C/C++/Java libraries implementing many Unicode algorithms and related things
*   [Python 3 Unicode Howto][25]
*   [Google Noto Fonts][26]—set of fonts intended to cover all assigned code points

--------------------------------------------------------------------------------

作者简介：

I’m a graphics programmer, currently freelancing in Seattle. Previously I worked at NVIDIA on the DevTech software team, and at Sucker Punch Productions developing rendering technology for the Infamous series of games for PS3 and PS4.

I’ve been interested in graphics since about 2002 and have worked on a variety of assignments, including fog, atmospheric haze, volumetric lighting, water, visual effects, particle systems, skin and hair shading, postprocessing, specular models, linear-space rendering, and GPU performance measurement and optimization.

You can read about what I’m up to on my blog. In addition to graphics, I’m interested in theoretical physics, and in programming language design.

You can contact me at nathaniel dot reed at gmail dot com, or follow me on Twitter (@Reedbeta) or Google+. I can also often be found answering questions at Computer Graphics StackExchange.

-------------------

via: http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311

作者：[ Nathan][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://reedbeta.com/about/
[1]:https://en.wikipedia.org/wiki/Niqqud
[2]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#codespace-allocation
[3]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#scripts
[4]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#usage-frequency
[5]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#utf-8
[6]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#utf-16
[7]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#canonical-equivalence
[8]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#normalization-forms
[9]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#grapheme-clusters
[10]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#diversity-and-inherent-complexity
[11]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#the-unicode-codespace
[12]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#encodings
[13]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#combining-marks
[14]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#and-more
[15]:https://en.wikipedia.org/wiki/Vowel_pointing
[16]:https://en.wikipedia.org/wiki/Devanagari
[17]:https://en.wikipedia.org/wiki/Hangul#Letters
[18]:http://reedbeta.com/blog/programmers-intro-to-unicode/
[19]:http://reedbeta.com/blog/category/coding/
[20]:http://reedbeta.com/blog/programmers-intro-to-unicode/#comments
[21]:http://www.unicode.org/versions/latest/
[22]:http://utf8everywhere.org/
[23]:https://eev.ee/blog/2015/09/12/dark-corners-of-unicode/
[24]:http://site.icu-project.org/
[25]:https://docs.python.org/3/howto/unicode.html
[26]:https://www.google.com/get/noto/
[27]:http://www.unicode.org/versions/latest/
[28]:http://www.unicode.org/reports/
[29]:http://www.unicode.org/notes/
[30]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#diversity-and-inherent-complexity
[31]:http://linguistics.berkeley.edu/sei/
[32]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#the-unicode-codespace
[33]:http://unicode.org/cldr/utility/character.jsp?a=A
[34]:http://unicode.org/cldr/utility/character.jsp?a=%CE%B8
[35]:http://www.unicode.org/reports/tr44/
[36]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#codespace-allocation
[37]:http://reedbeta.com/blog/programmers-intro-to-unicode/codespace-map.png
[38]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#scripts
[39]:http://reedbeta.com/blog/programmers-intro-to-unicode/script-map.png
[40]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#usage-frequency
[41]:http://reedbeta.com/blog/programmers-intro-to-unicode/heatmap-wiki+tweets.png
[42]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#encodings
[43]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#utf-8
[44]:http://utf8everywhere.org/
[45]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#utf-16
[46]:http://unicode.org/cldr/utility/character.jsp?a=FEFF
[47]:https://en.wikipedia.org/wiki/Byte_order_mark
[48]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#combining-marks
[49]:http://unicode.org/cldr/utility/character.jsp?a=A
[50]:http://unicode.org/cldr/utility/character.jsp?a=0301
[51]:http://unicode.org/cldr/utility/character.jsp?a=%C3%81
[52]:http://unicode.org/cldr/utility/character.jsp?a=%E1%BB%87
[53]:https://eeemo.net/
[54]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#canonical-equivalence
[55]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#normalization-forms
[56]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#grapheme-clusters
[57]:http://www.unicode.org/reports/tr29/
[58]:http://blog.emojipedia.org/emoji-zwj-sequences-three-letters-many-possibilities/
[59]:http://reedbeta.com/blog/programmers-intro-to-unicode/?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311#and-more
