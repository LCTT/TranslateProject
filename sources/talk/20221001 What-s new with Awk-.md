[#]: subject: "What's new with Awk?"
[#]: via: "https://opensource.com/article/22/10/whats-new-awk"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "connermemory"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What's new with Awk?
======
Brian Kernighan discusses the scripting tool Awk, from its creation to current work on Unicode support.

Awk is a [powerful scripting tool][4] that makes it easy to process text. Awk scripts use a pattern-action syntax, where Awk performs an action for every line in a file that matches a pattern. This provides a flexible yet powerful scripting language to deal with text. For example, the one-line Awk script `/error/ {print $1, $2, $3}` will print the first three space-delimited fields for any line that contains the word `error`.

While we also have the GNU variant of Awk, called Gawk, the original Awk remains under development. Recently, Brian Kernighan started a project to add Unicode support to Awk. I met with Brian to ask about the origins of Awk and his recent development work on Awk.

Jim Hall: Awk is a great tool to parse and process text. How did it start?

Brian Kernighan: The most direct influence was a tool that Marc Rochkind developed while working on the Programmer's Workbench system at Bell Labs. As I remember it now, Marc's program took a list of regular expressions and created a C program that would read an input file. Whenever the program found a match for one of the regular expressions, it printed the matching line. It was designed for creating error checking to run over log files from telephone operations data. It was such a neat idea—Awk is just a generalization.

Jim: AWK stands for the three of you who created it: Al Aho, Peter Weinberger, and Brian Kernighan. How did the three of you design and create Awk?

Brian: Al was interested in regular expressions and had recently implemented egrep, which provided a very efficient lazy-evaluation technique for a much bigger class of regular expressions than what grep provided. That gave us a syntax and working code.

Peter had been interested in databases, and as part of that he had some interest in report generation, like the RPG language that IBM provided. And I had been trying to figure out some kind of editing system that made it possible to handle strings and numbers with more or less equal ease.

We explored designs, but not for a long time. I think Al may have provided the basic pattern-action paradigm, but that was implicit in a variety of existing tools, like grep, the stream editor sed, and in the language tools YACC and Lex that we used for implementation. Naturally, the action language had to be C-like.

Jim: How was Awk first used at Bell Labs? When was Awk first adopted into Unix?

Brian: Awk was created in 1977, so it was part of 7th-edition Unix, which I think appeared in about 1979. I wouldn't say it was adopted, so much as it was just another program included because it was there. People picked it up very quickly, and we soon had users all over the Labs. People wrote much bigger programs than we had ever anticipated, too, even tens of thousands of lines, which was amazing. But for some kinds of applications, the language was a good match.

Jim: Has Awk changed over the years, or is Awk today more or less the same Awk from 1977?

Brian: Overall, it's been pretty stable, but there have been a fair number of small things, mostly to keep up with at least the core parts of Gawk. Examples include things like functions to do case conversion, shorthands for some kinds of regular expressions, or special filenames like `/dev/stderr`. Internally, there's been a lot of work to replace fixed-size arrays with arrays that grow. Arnold Robbins, who maintains Gawk, has also been incredibly helpful with Awk, providing good advice, testing, code, and help with Git.

Jim: You're currently adding Unicode support to Awk. This is one of those projects that seems obvious when you hear it, because Unicode is everywhere, but not every program supports it yet. Tell us about your project to add Unicode to Awk.

Brian: It's been sort of embarrassing for a while now that Awk only handled 8-bit input, though in fairness it predates Unicode by 10 or 20 years. Gawk, the GNU version, has handled Unicode properly for quite a while, so it's good to be up to date and compatible.

Jim: How big of a project is adding Unicode support? Did this require many changes to the source code?

Brian: I haven't counted, but it's probably 200 or 300 lines, primarily concentrated in either the regular expression recognizer or in the various built-in functions that have to operate in characters, not bytes, for Unicode input.

Jim: How far along are you in adding Unicode to Awk?

Brian: There's a branch of the code at GitHub that's pretty up to date. It's been tested, but there's always room for more testing.

One thing to mention: It handles UTF-8 input and output, but for Unicode code points, which are not the same thing as Unicode graphemes. This distinction is important but technically very complicated, at least as I understand it. As a simple example, a letter with an accent could be represented as two code points (letter and accent) or as a single character (grapheme). Doing this right, whatever that means, is very hard.

Jim: In a Computerphile video, you mention adding support for comma-separated values (CSV) parsing to Awk. How is that project going?

Brian: While I had my hands in the code again, I did add support for CSV input, since that's another bit of the language that was always clunky. I haven't done anything for CSV output, since that's easy to do with a couple of short functions, but maybe that should be revisited.

Jim: What kinds of things do you use Awk for in your day-to-day work?

Brian: Everything. Pretty much anything that fiddles text is a target for Awk. Certainly, the Awk program I use most is a simple one to make all lines in a text document the same length. I probably used it 100 times while writing answers to your questions.

Jim: What's the coolest (or most unusual) thing you have used Awk to do?

Brian: A long time ago, I wrote a C++ program that converted Awk programs into C++ that looked as close to Awk as I could manage, by doing things like overloading brackets for associative arrays. It was never used, but it was a fun exercise.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/10/whats-new-awk

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/coffee_tea_laptop_computer_work_desk.png
[2]: https://unsplash.com/@jonasleupe?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/tea-cup-computer?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://opensource.com/resources/what-awk
