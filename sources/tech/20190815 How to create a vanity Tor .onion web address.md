[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to create a vanity Tor .onion web address)
[#]: via: (https://opensource.com/article/19/8/how-create-vanity-tor-onion-address)
[#]: author: (Kc Nwaezuoke https://opensource.com/users/areahintshttps://opensource.com/users/sethhttps://opensource.com/users/bexelbiehttps://opensource.com/users/bcotton)

How to create a vanity Tor .onion web address
======
Generate a vanity .onion website to protect your anonymity—and your
visitors' privacy, too.
![Password security with a mask][1]

[Tor][2] is a powerful, open source network that enables anonymous and non-trackable (or difficult to track) browsing of the internet. It's able to achieve this because of users running Tor nodes, which serve as intentional detours between two otherwise direct paths. For instance, if you are in New Zealand and visit python.nz, instead of being routed next door to the data center running python.nz, your traffic might be routed to Pittsburgh and then Berlin and then Vanuatu and finally to python.nz. The Tor network, being built upon opt-in participant nodes, has an ever-changing structure. Only within this dynamic network space can there exist an exciting, transient top-level domain identifier: the .onion address.

If you own or are looking to create a website, you can generate a vanity .onion site to protect your and your visitors' anonymity.

### What are onion addresses?

Because Tor is dynamic and intentionally re-routes traffic in unpredictable ways, an onion address makes both the information provider (you) and the person accessing the information (your traffic) difficult to trace by one another, by intermediate network hosts, or by an outsider. Generally, an onion address is unattractive, with 16-character names like 8zd335ae47dp89pd.onion. Not memorable, and difficult to identify when spoofed, but a few projects that culminated with Shallot (forked as eschalot) provides "vanity" onion addresses to solve those issues.

Creating a vanity onion URL on your own is possible but computationally expensive. Getting the exact 16 characters you want could take a single computer billions of years to achieve.

Here's a rough example (courtesy of [Shallot][3]) of how much time it takes to generate certain lengths of characters on a 1.5GHz processor:

Characters | Time
---|---
1 | Less than 1 second
2 | Less than 1 second
3 | Less than 1 second
4 | 2 seconds
5 | 1 minute
6 | 30 minutes
7 | 1 day
8 | 25 days
9 | 2.5 years
10 | 40 years
11 | 640 years
12 | 10 millennia
13 | 160 millennia
14 | 2.6 million years

I love how this table goes from 25 days to 2.5 years. If you wanted to generate 56 characters, it would take 1078 years.

An onion address with 16 characters is referred to as a version 2 onion address, and one with 56 characters is a version 3 onion address. If you're using the Tor browser, you can check out this [v2 address][4] or this [v3 address][5].

A v3 address has several advantages over v2:

  * Better crypto (v3 replaced SHA1/DH/RSA1024 with SHA3/ed25519/curve25519)
  * Improved directory protocol that leaks much less information to directory servers
  * Improved directory protocol with a smaller surface for targeted attacks
  * Better onion address security against impersonation



However, the downside (supposedly) of v3 is the marketing effort you might need to get netizens to type that marathon-length URL in their browser.

You can [learn more about v3][6] in the Tor docs.

### Why you might need an onion address

A .onion domain has a few key advantages. Its key feature is that it can be accessed only with a Tor browser. Many people don't even know Tor exists, so you shouldn't expect massive traffic on your .onion site. However, the Tor browser provides numerous layers of anonymity not available on more popular browsers. If you want to ensure near-total anonymity for both you and your visitors, onion addresses are built for it.

With Tor, you do not need to register with ICANN to create your own domain. You don't need to hide your details from Whois searches, and your ICANN account won't be vulnerable to malicious takeovers. You are completely in control of your privacy and your domain.

An onion address is also an effective way to bypass censorship restrictions imposed by a government or regime. Its privacy helps protect you if your site may be viewed as a threat to the interests of the political class. Sites like Wikileaks are the best examples.

### What you need to generate a vanity URL

To configure a vanity onion address, you need to generate a new private key to match a custom hostname.

Two applications that you can use for generating .onion addresses are [eschalot][7] for v2 addresses and [mkp224o][8] for v3 addresses.

Eschalot is a Tor hidden service name generator. It allows you to produce a (partially) customized vanity .onion address using a brute-force method. Eschalot is distributed in source form under the BSD license and should compile on any Unix or Linux system.

mkp224o is a vanity address generator for ed25519 .onion services that's available on GitHub with the CC0 1.0 Universal license. It generates vanity 56-character onion addresses.

Here's a simple explanation of how these applications work. (This assumes you are comfortable with Git.)

#### Eschalot

Eschalot requires [OpenSSL][9] 0.9.7 or later libraries with source headers. Confirm your version with this command:


```
$ openssl version
OpenSSL 1.1.1c FIPS  28 May 2019
```

You also need a [Make][10] utility (either BSD or GNU Make will do) and a C compiler (GCC, PCC, or LLVM/Clang).

Clone the eschalot repo to your system, and then compile:


```
$ git clone <https://github.com/ReclaimYourPrivacy/eschalot.git>
$ cd eschalot-1.2.0
$ make
```

If you're not using GCC, you must set the **CC** environment variable. For example, to use PCC instead:


```
$ make clean
$ env CC=pcc make
```

##### Using eschalot

To see Echalot's Help pages, type **./eschalot** in the terminal:


```
$ ./eschalot
Version: 1.2.0

usage:
eschalot [-c] [-v] [-t count] ([-n] [-l min-max] -f filename) | (-r regex) | (-p prefix)
  -v         : verbose mode - print extra information to STDERR
  -c         : continue searching after the hash is found
  -t count   : number of threads to spawn default is one)
  -l min-max : look for prefixes that are from 'min' to 'max' characters long
  -n         : Allow digits to be part of the prefix (affects wordlist mode only)
  -f filename: name of the text file with a list of prefixes
  -p prefix  : single prefix to look for (1-16 characters long)
  -r regex   : search for a POSIX-style regular expression

Examples:
  eschalot -cvt4 -l8-12 -f wordlist.txt &gt;&gt; results.txt
  eschalot -v -r '^test|^exam'
  eschalot -ct5 -p test

  base32 alphabet allows letters [a-z] and digits [2-7]
  Regex pattern examples:
    xxx           must contain 'xxx'
    ^foo          must begin with 'foo'
    bar$          must end with 'bar'
    b[aoeiu]r     must have a vowel between 'b' and 'r'
    '^ab|^cd'     must begin with 'ab' or 'cd'
    [a-z]{16}     must contain letters only, no digits
    ^dusk.*dawn$  must begin with 'dusk' and end with 'dawn'
    [a-z2-7]{16}  any name - will succeed after one iteration
```

You can use eschalot to generate an address using the prefix **-p** for _privacy_. Assuming your system has multiple CPU cores, use _multi-threading_ (**-t**) to speed up the URL generation. To _get verbose output_, use the **-v** option. Write the results of your calculation to a file named **newonion.txt**:


```
`./eschalot -v -t4 -p privacy >> newonion.txt`
```

The script executes until it finds a suitable match:


```
$ ./eschalot -v -t4 -p privacy &gt;&gt; newonion.txt
Verbose, single result, no digits, 4 threads, prefixes 7-7 characters long.
Thread #1 started.
Thread #2 started.
Thread #3 started.
Thread #4 started.
Running, collecting performance data...
Found a key for privacy (7) - privacyzofgsihx2.onion
```

To access the public and private keys eschalot generates, locate **newonion.txt** in the eschalot folder.

#### mkp224o

mkp224o requires a C99 compatible compiler, Libsodium, GNU Make, GNU Autoconf, and a Unix-like platform. It has been tested on Linux and OpenBSD.

To get started, clone the mkp224o repo onto your system, generate the required [Autotools infrastructure][11], configure, and compile:


```
$ git clone <https://github.com/cathugger/mkp224o.git>
$ cd mkp224o
$ ./autogen.sh
$ ./configure
$ make
```

##### Using mkp224o

Type **./mkp224o -h** to view Help:


```
$ ./mkp224o -h
Usage: ./mkp224o filter [filter...] [options]
       ./mkp224o -f filterfile [options]
Options:
        -h  - print help to stdout and quit
        -f  - specify filter file which contains filters separated by newlines
        -D  - deduplicate filters
        -q  - do not print diagnostic output to stderr
        -x  - do not print onion names
        -v  - print more diagnostic data
        -o filename  - output onion names to specified file (append)
        -O filename  - output onion names to specified file (overwrite)
        -F  - include directory names in onion names output
        -d dirname  - output directory
        -t numthreads  - specify number of threads to utilise (default - CPU core count or 1)
        -j numthreads  - same as -t
        -n numkeys  - specify number of keys (default - 0 - unlimited)
        -N numwords  - specify number of words per key (default - 1)
        -z  - use faster key generation method; this is now default
        -Z  - use slower key generation method
        -B  - use batching key generation method (&gt;10x faster than -z, experimental)
        -s  - print statistics each 10 seconds
        -S t  - print statistics every specified ammount of seconds
        -T  - do not reset statistics counters when printing
        -y  - output generated keys in YAML format instead of dumping them to filesystem
        -Y [filename [host.onion]]  - parse YAML encoded input and extract key(s) to filesystem
```

One or more filters are required for mkp224o to work. When executed, mkp224o creates a directory with secret and public keys, plus a hostname for each discovered service. By default, **root** is the current directory, but that can be overridden with the **-d** switch.

Use the **-t numthreads** option to define how many threads you want to use during processing, and **-v** to see verbose output. Use the **fast** filter, and generate four keys by setting the **-n** option:


```
$ ./mkp224o filter fast -t 4 -v -n 4 -d ~/Extracts
set workdir: /home/areahints/Extracts/
sorting filters... done.
filters:
        fast
        filter
in total, 2 filters
using 4 threads
fastrcl5totos3vekjbqcmgpnias5qytxnaj7gpxtxhubdcnfrkapqad.onion
fastz7zvpzic6dp6pvwpmrlc43b45usm2itkn4bssrklcjj5ax74kaad.onion
fastqfj44b66mqffbdfsl46tg3c3xcccbg5lfuhr73k7odfmw44uhdqd.onion
fast4xwqdhuphvglwic5dfcxoysz2kvblluinr4ubak5pluunduy7qqd.onion
waiting for threads to finish... done.
```

In the directory path set with **-d**, mkp224o creates a folder with the v3 address name it has generated, and within it you see your hostname, secret, and public files.

Use the **-s** switch to enable printing statistics, which may be useful when benchmarking different ed25519 implementations on your machine. Also, read the **OPTIMISATION.txt** file in mkp224o for performance-related tips.

### Notes about security

If you're wondering about the security of v2 generated keys, [Shallot][3] provides an interesting take:

> It is sometimes claimed that private keys generated by Shallot are less secure than those generated by Tor. This is false. Although Shallot generates a keypair with an unusually large public exponent **e**, it performs all of the sanity checks specified by PKCS #1 v2.1 (directly in **sane_key**), and then performs all of the sanity checks that Tor does when it generates an RSA keypair (by calling the OpenSSL function **RSA_check_key**).

"[Zooko's Triangle][12]" (which is discussed in [Stiegler's Petname Systems][13]) argues that names cannot be global, secure, and memorable at the same time. This means while .onion names are unique and secure, they have the disadvantage that they cannot be meaningful to humans.

Imagine that an attacker creates an .onion name that looks similar to the .onion of a different onion service and replaces its hyperlink on the onion wiki. How long would it take for someone to recognize it?

The onion address system has trade-offs, but vanity addresses may be a reasonable balance among them.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/how-create-vanity-tor-onion-address

作者：[Kc Nwaezuoke][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/areahintshttps://opensource.com/users/sethhttps://opensource.com/users/bexelbiehttps://opensource.com/users/bcotton
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security_password_mask_secret.png?itok=EjqwosxY (Password security with a mask)
[2]: https://www.torproject.org/
[3]: https://github.com/katmagic/Shallot
[4]: http://6zdgh5a5e6zpchdz.onion/
[5]: http://vww6ybal4bd7szmgncyruucpgfkqahzddi37ktceo3ah7ngmcopnpyyd.onion/
[6]: https://www.torproject.org/docs/tor-onion-service.html.en#four
[7]: https://github.com/ReclaimYourPrivacy/eschalot
[8]: https://github.com/cathugger/mkp224o
[9]: https://www.openssl.org/
[10]: https://en.wikipedia.org/wiki/Make_(software)
[11]: https://opensource.com/article/19/7/introduction-gnu-autotools
[12]: https://en.wikipedia.org/wiki/Zooko%27s_triangle
[13]: http://www.skyhunter.com/marcs/petnames/IntroPetNames.html
