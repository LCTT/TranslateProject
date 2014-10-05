# Practical Lessons in Peer Code Review #

Millions of years ago, apes descended from the trees, evolved opposable thumbs and—eventually—turned into human beings.

We see mandatory code reviews in a similar light: something that separates human from beast on the rolling grasslands of the software
development savanna.

Nonetheless, I sometimes hear comments like these from our team members:

"Code reviews on this project are a waste of time."
"I don't have time to do code reviews."
"My release is delayed because my dastardly colleague hasn't done my review yet."
"Can you believe my colleague wants me to change something in my code? Please explain to them that the delicate balance of the universe will
be disrupted if my pristine, elegant code is altered in any way."

### Why do we do code reviews? ###

Let us remember, first of all, why we do code reviews. One of the most important goals of any professional software developer is to
continually improve the quality of their work. Even if your team is packed with talented programmers, you aren't going to distinguish
yourselves from a capable freelancer unless you work as a team. Code reviews are one of the most important ways to achieve this. In
particular, they:

provide a second pair of eyes to find defects and better ways of doing something.
ensure that at least one other person is familiar with your code.
help train new staff by exposing them to the code of more experienced developers.
promote knowledge sharing by exposing both the reviewer and reviewee to the good ideas and practices of the other.
encourage developers to be more thorough in their work since they know it will be reviewed by one of their colleagues.

### Doing thorough reviews ###

However, these goals cannot be achieved unless appropriate time and care are devoted to reviews. Just scrolling through a patch, making sure
that the indentation is correct and that all the variables use lower camel case, does not constitute a thorough code review. It is
instructive to consider pair programming, which is a fairly popular practice and adds an overhead of 100% to all development time, as the
baseline for code review effort. You can spend a lot of time on code reviews and still use much less overall engineer time than pair
programming.

My feeling is that something around 25% of the original development time should be spent on code reviews. For example, if a developer takes
two days to implement a story, the reviewer should spend roughly four hours reviewing it.

Of course, it isn't primarily important how much time you spend on a review as long as the review is done correctly. Specifically, you must
understand the code you are reviewing. This doesn't just mean that you know the syntax of the language it is written in. It means that you
must understand how the code fits into the larger context of the application, component or library it is part of. If you don't grasp all the
implications of every line of code, then your reviews are not going to be very valuable. This is why good reviews cannot be done quickly: it
takes time to investigate the various code paths that can trigger a given function, to ensure that third-party APIs are used correctly
(including any edge cases) and so forth.

In addition to looking for defects or other problems in the code you are reviewing, you should ensure that:

All necessary tests are included.
Appropriate design documentation has been written.
Even developers who are good about writing tests and documentation don't always remember to update them when they change their code. A
gentle nudge from the code reviewer when appropriate is vital to ensure that they don't go stale over time.

### Preventing code review overload ###

If your team does mandatory code reviews, there is the danger that your code review backlog will build up to the point where it is
unmanageable. If you don't do any reviews for two weeks, you can easily have several days of reviews to catch up on. This means that your
own development work will take a large and unexpected hit when you finally decide to deal with them. It also makes it a lot harder to do
good reviews since proper code reviews require intense and sustained mental effort. It is difficult to keep this up for days on end.

For this reason, developers should strive to empty their review backlog every day. One approach is to tackle reviews first thing in the
morning. By doing all outstanding reviews before you start your own development work, you can keep the review situation from getting out of
hand. Some might prefer to do reviews before or after the midday break or at the end of the day. Whenever you do them, by considering code
reviews as part of your regular daily work and not a distraction, you avoid:

Not having time to deal with your review backlog.
Delaying a release because your reviews aren't done yet.
Posting reviews that are no longer relevant since the code has changed so much in the meantime.
Doing poor reviews since you have to rush through them at the last minute.

### Writing reviewable code ###

The reviewer is not always the one responsible for out-of-control review backlogs. If my colleague spends a week adding code willy-nilly
across a large project then the patch they post is going to be really hard to review. There will be too much to get through in one session.
It will be difficult to understand the purpose and underlying architecture of the code.

This is one of many reasons why it is important to split your work into manageable units. We use scrum methodology so the appropriate unit
for us is the story. By making an effort to organize our work by story and submit reviews that pertain only to the specific story we are
working on, we write code that is much easier to review. Your team may use another methodology but the principle is the same.

There are other prerequisites to writing reviewable code. If there are tricky architectural decisions to be made, it makes sense to meet
with the reviewer beforehand to discuss them. This will make it much easier for the reviewer to understand your code, since they will know
what you are trying to achieve and how you plan to achieve it. This also helps avoid the situation where you have to rewrite large swathes
of code after the reviewer suggests a different and better approach.

Project architecture should be described in detail in your design documentation. This is important anyway since it enables a new project
member to get up to speed and understand the existing code base. It has the further advantage of helping a reviewer to do their job
properly. Unit tests are also helpful in illustrating to the reviewer how components should be used.

If you are including third-party code in your patch, commit it separately. It is much harder to review code properly when 9000 lines of
jQuery are dropped into the middle.

One of the most important steps for creating reviewable code is to annotate your code reviews. This means that you go through the review
yourself and add comments anywhere you feel that this will help the reviewer to understand what is going on. I have found that annotating
code takes relatively little time (often just a few minutes) and makes a massive difference in how quickly and well the code can be
reviewed. Of course, code comments have many of the same advantages and should be used where appropriate, but often a review annotation
makes more sense. As a bonus, studies have shown that developers find many defects in their own code while rereading and annotating it.

### Large code refactorings ###

Sometimes it is necessary to refactor a code base in a way that affects many components. In the case of a large application, this can take
several days (or more) and result in a huge patch. In these cases a standard code review may be impractical.

The best solution is to refactor code incrementally. Figure out a partial change of reasonable scope that results in a working code base and
brings you in the direction you want to go. Once that change has been completed and a review posted, proceed to a second incremental change
and so forth until the full refactoring has been completed. This might not always be possible, but with thought and planning it is usually
realistic to avoid massive monolithic patches when refactoring. It might take more time for the developer to refactor in this way, but it
also leads to better quality code as well as making reviews much easier.

If it really isn't possible to refactor code incrementally (which probably says something about how well the original code was written and
organized), one solution might be to do pair programming instead of code reviews while working on the refactoring.

### Resolving disputes ###

Your team is doubtless made up of intelligent professionals, and in almost all cases it should be possible to come an agreement when
opinions about a specific coding question differ. As a developer, keep an open mind and be prepared to compromise if your reviewer prefers a
different approach. Don't take a proprietary attitude to your code and don't take review comments personally. Just because someone feels
that you should refactor some duplicated code into a reusable function, it doesn't mean that you are any less of an attractive, brilliant
and charming individual.

As a reviewer, be tactful. Before suggesting changes, consider whether your proposal is really better or just a matter of taste. You will
have more success if you choose your battles and concentrate on areas where the original code clearly requires improvement. Say things like
"it might be worth considering..." or "some people recommend..." instead of "my pet hamster could write a more efficient sorting algorithm
than this."

If you really can't find middle ground, ask a third developer who both of you respect to take a look and give their opinion.

--------------------------------------------------------------------------------

via: http://blog.salsitasoft.com/practical-lessons-in-peer-code-review/
作者：[Matt][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出


