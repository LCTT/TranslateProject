# Recognizing correct code

Automatic bug-repair system fixes 10 times as many errors as its predecessors.
------
DongShuaike is translating.

MIT researchers have developed a machine-learning system that can comb through repairs to open-source computer programs and learn their general properties, in order to produce new repairs for a different set of programs.

The researchers tested their system on a set of programming errors, culled from real open-source applications, that had been compiled to evaluate automatic bug-repair systems. Where those earlier systems were able to repair one or two of the bugs, the MIT system repaired between 15 and 18, depending on whether it settled on the first solution it found or was allowed to run longer.

While an automatic bug-repair tool would be useful in its own right, professor of electrical engineering and computer science Martin Rinard, whose group developed the new system, believes that the work could have broader ramifications.

“One of the most intriguing aspects of this research is that we’ve found that there are indeed universal properties of correct code that you can learn from one set of applications and apply to another set of applications,” Rinard says. “If you can recognize correct code, that has enormous implications across all software engineering. This is just the first application of what we hope will be a brand-new, fabulous technique.”

Fan Long, a graduate student in electrical engineering and computer science at MIT, presented a paper describing the new system at the Symposium on Principles of Programming Languages last week. He and Rinard, his advisor, are co-authors.

Users of open-source programs catalogue bugs they encounter on project websites, and contributors to the projects post code corrections, or “patches,” to the same sites. So Long was able to write a computer script that automatically extracted both the uncorrected code and patches for 777 errors in eight common open-source applications stored in the online repository GitHub.

**Feature performance**

As with [all][1] machine-learning systems, the crucial aspect of Long and Rinard’s design was the selection of a “[feature set][2]” that the system would analyze. The researchers concentrated on values stored in memory — either variables, which can be modified during a program’s execution, or constants, which can’t. They identified 30 prime characteristics of a given value: It might be involved in an operation, such as addition or multiplication, or a comparison, such as greater than or equal to; it might be local, meaning it occurs only within a single block of code, or global, meaning that it’s accessible to the program as a whole; it might be the variable that represents the final result of a calculation; and so on.

Long and Rinard wrote a computer program that evaluated all the possible relationships between these characteristics in successive lines of code. More than 3,500 such relationships constitute their feature set. Their machine-learning algorithm then tried to determine what combination of features most consistently predicted the success of a patch.

“All the features we’re trying to look at are relationships between the patch you insert and the code you are trying to patch,” Long says. “Typically, there will be good connections in the correct patches, corresponding to useful or productive program logic. And there will be bad patterns that mean disconnections in program logic or redundant program logic that are less likely to be successful.”

**Ranking candidates**

In earlier work, Long had developed an algorithm that attempts to repair program bugs by systematically modifying program code. The modified code is then subjected to a suite of tests designed to elicit the buggy behavior. This approach may find a modification that passes the tests, but it could take a prohibitively long time. Moreover, the modified code may still contain errors that the tests don’t trigger.

Long and Rinard’s machine-learning system works in conjunction with this earlier algorithm, ranking proposed modifications according to the probability that they are correct before subjecting them to time-consuming tests.

The researchers tested their system, which they call Prophet, on a set of 69 program errors that had cropped up in eight popular open-source programs. Of those, 19 are amenable to the type of modifications that Long’s algorithm uses; the other 50 have more complicated problems that involve logical inconsistencies across larger swaths of code.

When Long and Rinard configured their system to settle for the first solution that passed the bug-eliciting tests, it was able to correctly repair 15 of the 19 errors; when they allowed it to run for 12 hours per problem, it repaired 18.

Of course, that still leaves the other 50 errors in the test set untouched. In ongoing work, Long is working on a machine-learning system that will look at more coarse-grained manipulation of program values across larger stretches of code, in the hope of producing a bug-repair system that can handle more complex errors.

“A revolutionary aspect of Prophet is how it leverages past successful patches to learn new ones,” says Eran Yahav, an associate professor of computer science at the Technion in Israel. “It relies on the insight that despite differences between software projects, fixes — patches — applied to projects often have commonalities that can be learned from. Using machine learning to learn from ‘big code’ holds the promise to revolutionize many programming tasks — code completion, reverse-engineering, et cetera.”

--------------------------------------------------------------------------------

via: http://news.mit.edu/2016/faster-automatic-bug-repair-code-errors-0129

作者：Larry Hardesty
译者：[译者ID](https://github.com/翻译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://news.mit.edu/2013/teaching-computers-to-see-by-learning-to-see-like-computers-0919
[2]:http://news.mit.edu/2015/automating-big-data-analysis-1016

