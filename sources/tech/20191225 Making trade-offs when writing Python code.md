[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Making trade-offs when writing Python code)
[#]: via: (https://opensource.com/article/19/12/zen-python-trade-offs)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Making trade-offs when writing Python code
======
This is part of a special series about the Zen of Python focusing on the
seventh, eighth, and ninth principles: readability, special cases, and
practicality.
![Brick wall between two people, a developer and an operations manager][1]

Software development is a discipline rife with trade-offs. For every choice, there is an equally defensible but opposite choice. Make a method private? You're encouraging copy-paste. Make a method public? You're committing prematurely to an interface.

Software developers make hard choices every minute. While all the principles in the [Zen of Python][2] cover trade-offs to some extent, the following principles take the hardest, coldest look at some trade-offs.

### Readability counts.

In some sense, this middle principle is indeed the center of the entire Zen of Python. The Zen is not about writing efficient programs. It is not even about writing robust programs, for the most part. It is about writing programs that _other people can read_.

Reading code, by its nature, happens after the code has been added to the system. Often, it happens long after. Neglecting readability is the easiest choice since it does not hurt right now. Whatever the reason for adding new code—a painful bug or a highly requested feature—it does hurt. Right now.

In the face of immense pressure to throw readability to the side and just "solve the problem," the Zen of Python reminds us: readability counts. Writing the code so it can be read is a form of compassion for yourself and others.

### Special cases aren't special enough to break the rules.

There is always an excuse. This bug is particularly painful; let's not worry about simplicity. This feature is particularly urgent; let's not worry about beauty. The domain rules covering this case are particularly hairy; let's not worry about nesting levels.

Once we allow special pleading, the dam wall breaks, and there are no more principles; things devolve into a Mad Max dystopia with every programmer for themselves, trying to find the best excuses.

Discipline requires commitment. It is only when things are hard, when there is a strong temptation, that a software developer is tested. There is always a valid excuse to break the rules, and that's why the rules must be kept the rules. Discipline is the art of saying no to exceptions. No amount of explanation can change that.

### Although, practicality beats purity.

> "If you think only of hitting, springing, striking, or touching the enemy, you will not be able actually to cut him."
>  — Miyamoto Musashi, _[The Book of Water][3]_

Ultimately, software development is a practical discipline. Its goal is to solve real problems, faced by real people. Practicality beats purity: above all else, we must _solve the problem_. If we think only about readability, simplicity, or beauty, we will not be able to actually _solve the problem_.

As Musashi suggested, the primary goal of every code change should be to _solve a problem_. The problem must be foremost in our minds. If we waver from it and think only of the Zen of Python, we have failed the Zen of Python. This is another one of those contradictions inherent in the Zen of Python.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/zen-python-trade-offs

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/devops_confusion_wall_questions.png?itok=zLS7K2JG (Brick wall between two people, a developer and an operations manager)
[2]: https://www.python.org/dev/peps/pep-0020/
[3]: https://en.wikipedia.org/wiki/The_Book_of_Five_Rings#The_Book_of_Water
