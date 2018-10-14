Why pair writing helps improve documentation
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/doc-dish-lead-2.png?itok=lPO6tqPd)

Professional writers, at least in the Red Hat documentation team, nearly always work on docs alone. But have you tried writing as part of a pair? In this article, I'll explain a few benefits of pair writing.
### What is pair writing?

Pair writing is when two writers work in real time, on the same piece of text, in the same room. This approach improves document quality, speeds up writing, and allows writers to learn from each other. The idea of pair writing is borrowed from [pair programming][1].

When pair writing, you and your colleague work on the text together, making suggestions and asking questions as needed. Meanwhile, you're observing each other's work. For example, while one is writing, the other writer observes details such as structure or context. Often discussion around the document turns into sharing experiences and opinions, and brainstorming about writing in general.

At all times, the writing is done by only one person. Thus, you need only one computer, unless you want one writer to do online research while the other person does the writing. The text workflow is the same as if you are working alone: a text editor, the documentation source files, git, and so on.

### Pair writing in practice

My colleague Aneta Steflova and I have done more than 50 hours of pair writing working on the Red Hat Enterprise Linux System Administration docs and on the Red Hat Identity Management docs. I've found that, compared to writing alone, pair writing:

  * is as productive or more productive;
  * improves document quality;
  * helps writers share technical expertise; and
  * is more fun.



### Speed

Two writers writing one text? Sounds half as productive, right? Wrong. (Usually.)

Pair writing can help you work faster because two people have solutions to a bigger set of problems, which means getting blocked less often during the process. For example, one time we wrote urgent API docs for identity management. I know at least the basics of web APIs, the REST protocol, and so on, which helped us speed through those parts of the documentation. Working alone, Aneta would have needed to interrupt the writing process frequently to study these topics.

### Quality

Poor wording or sentence structure, inconsistencies in material, and so on have a harder time surviving under the scrutiny of four eyes. For example, one of our pair writing documents was reviewed by an extremely critical developer, who was known for catching technical inaccuracies and bad structure. After this particular review, he said, "Perfect. Thanks a lot."

### Sharing expertise

Each of us lives in our own writing bubble, and we normally don't know how others approach writing. Pair writing can help you improve your own writing process. For example, Aneta showed me how to better handle assignments in which the developer has provided starting text (as opposed to the writer writing from scratch using their own knowledge of the subject), which I didn't have experience with. Also, she structures the docs thoroughly, which I began doing as well.

As another example, I'm good enough at Vim that XML editing (e.g., tags manipulation) is enjoyable instead of torturous. Aneta saw how I was using Vim, asked about it, suffered through the learning curve, and now takes advantage of the Vim features that help me.

Pair writing is especially good for helping and mentoring new writers, and it's a great way to get to know professionally (and have fun with) colleagues.

### When pair writing shines

In addition to benefits I've already listed, pair writing is especially good for:

  * **Working with[Bugzilla][2]** : Bugzillas can be cumbersome and cause problems, especially for administration-clumsy people (like me).
  * **Reviewing existing documents** : When documentation needs to be expanded or fixed, it is necessary to first examine the existing document.
  * **Learning new technology** : A fellow writer can be a better teacher than an engineer.
  * **Writing emails/requests for information to developers with well-chosen questions** : The difficulty of this task rises in proportion to the difficulty of technology you are documenting.



Also, with pair writing, feedback is in real time, as-needed, and two-way.

On the downside, pair writing can be a faster pace, giving a writer less time to mull over a topic or wording. On the other hand, generally peer review is not necessary after pair writing.

### Words of caution

To get the most out of pair writing:

  * Go into the project well prepared, otherwise you can waste your colleague's time.
  * Talkative types need to stay focused on the task, otherwise they end up talking rather than writing.
  * Be prepared for direct feedback. Pair writing is not for feedback-allergic writers.
  * Beware of session hijackers. Dominant personalities can turn pair writing into writing solo with a spectator. (However, it _can _ be good if one person takes over at times, as long as the less-experienced partner learns from the hijacker, or the more-experienced writer is providing feedback to the hijacker.)



### Conclusion

Pair writing is a meeting, but one in which you actually get work done. It's an activity that lets writers focus on the one indispensable thing in our vocation--writing.

_This post was written with the help of pair writing with Aneta Steflova._

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/11/try-pair-writing

作者：[Maxim Svistunov][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/maxim-svistunov
[1]:https://developer.atlassian.com/blog/2015/05/try-pair-programming/
[2]:https://www.bugzilla.org/
