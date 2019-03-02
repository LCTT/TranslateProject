[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Regex groups and numerals)
[#]: via: (https://leancrew.com/all-this/2019/02/regex-groups-and-numerals/)
[#]: author: (Dr.Drang https://leancrew.com)

Regex groups and numerals
======

A week or so ago, I was editing a program and decided I should change some variable names. I thought it would be a simple regex find/replace, and it was. Just not as simple as I thought.

The variables were named `a10`, `v10`, and `x10`, and I wanted to change them to `a30`, `v30`, and `x30`, respectively. I brought up BBEdit’s Find window and entered this:

![Mistaken BBEdit replacement pattern][2]

I couldn’t just replace `10` with `30` because there were instances of `10` in the code that weren’t related to the variables. And because I think I’m clever, I didn’t want to do three non-regex replacements, one each for `a10`, `v10`, and `x10`. But I wasn’t clever enough to notice the blue coloring in the replacement pattern. Had I done so, I would have seen that BBEdit was interpreting my replacement pattern as “Captured group 13, followed by `0`” instead of “Captured group 1, followed by `30`,” which was what I intended. Since captured group 13 was blank, all my variable names were replaced with `0`.

You see, BBEdit can capture up to 99 groups in the search pattern and, strictly speaking, we should use two-digit numbers when referring to them in the replacement pattern. But in most cases, we can use `\1` through `\9` instead of `\01` through `\09` because there’s no ambiguity. In other words, if I had been trying to change `a10`, `v10`, and `x10` to `az`, `vz`, and `xz`, a replacement pattern of `\1z` would have been just fine, because the trailing `z` means there’s no way to misinterpret the intent of the `\1` in that pattern.

So after undoing the replacement, I changed the pattern to this,

![Two-digit BBEdit replacement pattern][3]

and all was right with the world.

There was another option: a named group. Here’s how that would have looked, using `var` as the pattern name:

![Named BBEdit replacement pattern][4]

I don’t think I’ve ever used a named group in any situation, whether the regex was in a text editor or a script. My general feeling is that if the pattern is so complicated I have to use variables to keep track of all the groups, I should stop and break the problem down into smaller parts.

By the way, you may have heard that BBEdit is celebrating its [25th anniversary][5] of not sucking. When a well-documented app has such a long history, the manual starts to accumulate delightful callbacks to the olden days. As I was looking up the notation for named groups in the BBEdit manual, I ran across this note:

![BBEdit regex manual excerpt][6]

BBEdit is currently on Version 12.5; Version 6.5 came out in 2001. But the manual wants to make sure that long-time customers (I believe it was on Version 4 when I first bought it) don’t get confused by changes in behavior, even when those changes occurred nearly two decades ago.


--------------------------------------------------------------------------------

via: https://leancrew.com/all-this/2019/02/regex-groups-and-numerals/

作者：[Dr.Drang][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://leancrew.com
[b]: https://github.com/lujun9972
[1]: https://leancrew.com/all-this/2019/02/automation-evolution/
[2]: https://leancrew.com/all-this/images2019/20190223-Mistaken%20BBEdit%20replacement%20pattern.png (Mistaken BBEdit replacement pattern)
[3]: https://leancrew.com/all-this/images2019/20190223-Two-digit%20BBEdit%20replacement%20pattern.png (Two-digit BBEdit replacement pattern)
[4]: https://leancrew.com/all-this/images2019/20190223-Named%20BBEdit%20replacement%20pattern.png (Named BBEdit replacement pattern)
[5]: https://merch.barebones.com/
[6]: https://leancrew.com/all-this/images2019/20190223-BBEdit%20regex%20manual%20excerpt.png (BBEdit regex manual excerpt)
