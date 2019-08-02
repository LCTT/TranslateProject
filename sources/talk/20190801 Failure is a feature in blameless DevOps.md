[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Failure is a feature in blameless DevOps)
[#]: via: (https://opensource.com/article/19/8/failure-feature-blameless-devops)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

Failure is a feature in blameless DevOps
======
In blameless DevOps culture, failure is more than an option; it's our
friend.
![failure sign at a party, celebrating failure][1]

DevOps is just another term for _value stream development_. What does _value stream_ mean?

Value is what arises during our interactions with customers and stakeholders. Once we get into value stream development, we quickly realize that value is not an entity. Value constantly changes. Value is a process. Value is a flow.

Hence the term _stream_. Value is only value if it's a stream. And this streaming of value is what we call continuous integration (CI).

### How do we generate value?

No matter how carefully we specify value, its expectations tend to change. Therefore, the only realistic way to define and generate value is to solicit feedback.

But it's obvious that no one is volunteering feedback. People are busy. We need to solicit feedback from our customers and stakeholders, but somehow, they always have something more pressing to do. Even if we throw a tantrum and insist that they stop what they're doing and give us much-needed feedback, at best we'd get a few lukewarm comments. Very little to go by. People are busy.

We slowly learn that the most efficient and effective way to solicit feedback is to fail. Failure is a sure-fire way to make our customers and stakeholders drop everything, sit up, and pay attention. If we refuse to fail, we continue marching down the development path confidently, only to discover later that we're in the wrong.

Agile DevOps culture is about dropping this arrogant stance and adopting the attitude of humility. We admit that we don't know it all, and we commit to a more humble approach to working on the value stream.

It is of paramount importance to fail as soon as possible. That way, failure is not critical; it is innocuous, easy to overcome, easy to fix. But we need feedback to know how to fix it. The best feedback is reaction to failure.

Let's illustrate this dynamic visually:

![Value generation via feedback loop][2]

Value generation via a feedback loop from continuous solicitation

This figure illustrates the dynamics of producing value by soliciting feedback in a continuous, never-ending fashion.

### Where does failure fit?

Where in the above process do we see failure? Time for another diagram:

![Failure is central to feedback loop][3]

Failure is the central driving force enabling the delivery of value stream.

_Failure is center stage_. Without failure, nothing useful ever gets done. From this, we conclude that failure is our friend.

### How do we know we failed?

In the ~~good~~ bad old days of waterfall methodology, the prime directive was "Failure is not an option." We worked under the pressure that every step must be a fully qualified success. We were going out of our way to avoid getting any feedback. Feedback was reserved for the momentous Big Bang event; the point when we all got an earful on how much the system we built missed the mark.

That was, in a nutshell, the traditional way of learning that we failed. With the advent of agile and DevOps, we underwent cultural transformation and embraced incremental, iterative development processes. Each iteration starts with a mini failure, fixes it, and keeps going (mini being the keyword here). But how do we know if we failed?

The only way to know for sure is to have a measurable test or goal. The measurable test will let us know if—and how—we failed.

Now that we have set the stage and exposed the fundamentals of the blameless, failure-centric culture, the next article in this series will dive into a more detailed exposition on how to iterate over failed attempts to satisfy measurable tests and goals.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/failure-feature-blameless-devops

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_failure_celebrate.png?itok=LbvDAEZF (failure sign at a party, celebrating failure)
[2]: https://opensource.com/sites/default/files/uploads/valuestreamfeedbackloop.jpg (Value generation via feedback loop)
[3]: https://opensource.com/sites/default/files/uploads/valuestreamfeedbackloopfailure.jpg (Failure is central to feedback loop)
