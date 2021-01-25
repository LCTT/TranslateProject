[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to tell if implementing your Python code is a good idea)
[#]: via: (https://opensource.com/article/19/12/zen-python-implementation)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

How to tell if implementing your Python code is a good idea
======
This is part of a special series about the Zen of Python focusing on the
17th and 18th principles: hard vs. easy.
![Brick wall between two people, a developer and an operations manager][1]

A language does not exist in the abstract. Every single language feature has to be implemented in code. It is easy to promise some features, but the implementation can get hairy. Hairy implementation means more potential for bugs, and, even worse, a maintenance burden for the ages.

The [Zen of Python][2] has answers for this conundrum.

### If the implementation is hard to explain, it's a bad idea.

The most important thing about programming languages is predictability. Sometimes we explain the semantics of a certain construct in terms of abstract programming models, which do not correspond exactly to the implementation. However, the best of all explanations just _explains the implementation_.

If the implementation is hard to explain, it means the avenue is impossible.

### If the implementation is easy to explain, it may be a good idea.

Just because something is easy does not mean it is worthwhile. However, once it is explained, it is much easier to judge whether it is a good idea.

This is why the second half of this principle intentionally equivocates: nothing is certain to be a good idea, but it always allows people to have that discussion.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/zen-python-implementation

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/devops_confusion_wall_questions.png?itok=zLS7K2JG (Brick wall between two people, a developer and an operations manager)
[2]: https://www.python.org/dev/peps/pep-0020/
