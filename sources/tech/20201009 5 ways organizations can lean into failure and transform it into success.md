[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 ways organizations can lean into failure and transform it into success)
[#]: via: (https://opensource.com/article/20/10/organizations-can-lean-failure)
[#]: author: (Dawn Parzych https://opensource.com/users/dawnparzych)

5 ways organizations can lean into failure and transform it into success
======
Removing the fear of failure fosters innovation and open-mindedness,
turning mistakes into opportunities for growth and improvement.
![failure sign at a party, celebrating failure][1]

> "If failure is not an option, then neither is success."—Seth Godin

Success is something we all strive toward, but the road to success has twists and turns, which are also known as our failures. But instead of giving up when things don't go my way, I have learned to look at failures as learning opportunities. In fact, I now proudly admit that I'm a failure:

  * I failed my driving test the first time I took it.
  * I have not gotten every job I've ever applied or interviewed for.
  * Most of the articles I've written have not gone viral.



As software engineers, our industry may be competitive, but we need to remove the stigma associated with failing. One way of doing that is to talk about our failures. The more we hear and talk about failures, the more acceptable it becomes. We need to think about failures as learning opportunities, not a time to shame and ridicule others (or ourselves).

When we have failed, or think we have made a mistake, most of us get that pit in the bottom of our stomach, and the negative self-talk can kick in almost instantly. This reaction occurs because there are often consequences for mistakes, which can impact us personally as well as the organizations we work for.

Let's consider a hypothetical example: A software engineer submits a pull request for a new feature. It gets merged and released to production. Something goes wrong, and the application begins throwing errors. Customers can't log in. Sadly this isn't the first time this has happened. Some customers are fed up with the application breaking and have canceled their contracts. The CTO is furious. They want to know who is responsible for this feature being released. The team is understaffed because several team members have left the company, and those that remain are [burned out][2]. The incident takes way longer than usual to be resolved, and everyone is grumpy at the end.

This worst-case scenario doesn't mean we should always play it safe and not take risks. We need to balance the risks with the rewards when making technical decisions at work and with the open source projects we work on. I like to visualize success and failure as two opposite banks of a river, connected by a bridge. That bridge is built out of knowledge, learning, and understanding. Failure is when we grow, but only if we're learning from those failures and have a good mixture of success sprinkled in.

### What is needed to accept failure?

Embracing failure from a personal and organizational point of view doesn't happen overnight. It takes both time and the right culture. Start with one of the five areas outlined below.

#### Have a growth mindset

In the book _Growth_, Carol Dweck describes two types of mindsets: growth and fixed. A person with a fixed mindset believes in innate capabilities—you're either born with it, or you're not. Failure represents a limit on one's abilities.

A person with a growth mindset believes that individual effort and attitude determine one's abilities and that they can learn and improve as long as they put in the effort. Failure represents an opportunity to grow.

To encourage growth means to encourage failure. But saying "it's OK to fail" is not the same as creating a culture where it honestly is OK to fail. That requires psychological safety and a blameless culture.

#### Create a blameless culture

A blameless culture focuses on _where_ a system or a process failed, not on _who_ is responsible. If you spend time after an incident looking for and attributing root cause to human error, you are assigning blame. Instead, look for how things can be improved. What broke? How did it break? How can you prevent it in the future?

![Image of swampy area with overlaid quote reading "If a junior engineer asks where outages come from, I think a cute thing to tell them is 'The server is crying.' And if they ask why the server is crying, another cute thing to tell them is 'probably becaus][3]

Published with permission from Joshua Zimmerman (@TheJewberwocky)

#### Foster psychological safety

A blameless culture cannot exist without psychological safety. Psychological safety is the ability to show up to work without fear; you feel included in the whole, that it is safe to learn, safe to contribute, and safe to challenge the status quo without fear of consequences. Employees need to feel empowered to speak up if they see processes that need to be improved if they are concerned with security or lack of security procedures in place. They need to feel they won't be blamed for taking a risk where the end result wasn't quite what was expected.

One way to create a blameless culture and provide psychological safety is to eliminate the word "why" from your vocabulary. Why is used quite frequently—there are problem-solving techniques called ["The "5 Whys."][4] The problem with "why" is it is subtly coded instead as "explain yourself." Having to answer "why" questions put people on the defensive, and they spend time focusing on what the "right" answer is instead of answering honestly. Instead, switch to using "what" or "how" questions. "How" and "what" questions promote concrete action.

Consider the difference in these questions:

  * Why did last night's release cause a series of exceptions?
vs.
  * How were the exceptions triggered?



> "Recently, I was asked if I was going to fire an employee who made a mistake that cost the company $600,000. 'No,' I replied, 'I just spent $600,000 training him. Why would I want somebody else to hire his experience?'"— Thomas J. Watson, Chairman &amp; CEO of IBM, 1914-1956

#### Remember the importance of play

The final aspect of embracing failure is to make time to play. Play shapes our brains and fosters empathy. From a young age, we learn to play games, play on a sports team, play on our own, etc. Chances are you didn't always play on an undefeated sports team or win every single game you've ever played, but practice helped you get better over time no matter what. These experiences teach us to be comfortable with failure and to take it in stride with growth and improvement.

#### Experimentation leads to learning

Now that you're ready to embrace failure in your DevOps or engineering practices, where do you start? One of the first processes to look at is the build process. As you most likely know, builds can sometimes result in failures. Changing your build process to include [progressive delivery][5] techniques helps you release features in a controlled manner as opposed to a big bang. Using ring deployments or a canary launch, you can see how a feature performs for a small group of users. If there is a failure, the blast radius has been minimized.

Another process that can help you learn about your applications and systems is experimentation. Experiments provide a number of learning opportunities, and they don't always go as expected. Some failures can turn into wild successes; for example—[Post-it Notes][6]. Experiments allow us to test a hypothesis and learn new things. Experimenting with software can look like running an A/B test to see which look and feel leads to greater engagement or collecting page load time metrics to see if adding pagination to search results negatively impacts performance.

A popular type of experimentation is to run a chaos day or game day. With a game day, you purposely cause a system or application to fail. This combines the notion of play, failure, and learning. During this controlled experiment, you learn how your system behaves during failure scenarios. The knowledge gained during game days can be used to put safety measures in place or define processes for what to do when a specific failure occurs.

### Lean into failure

Failure can be scary; it is seen as a negative and something we want to avoid. I call on you to change your perspective on this. If you're not failing, you're not learning.

I challenge you to normalize failure and help reduce the stigma by sharing a failure of yours. Share your failures in the comments below or tag me on social media.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/organizations-can-lean-failure

作者：[Dawn Parzych][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dawnparzych
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_failure_celebrate.png?itok=LbvDAEZF (failure sign at a party, celebrating failure)
[2]: https://opensource.com/article/19/11/burnout-open-source-communities
[3]: https://opensource.com/sites/default/files/uploads/quote-failure-opensource_0.png
[4]: https://en.wikipedia.org/wiki/Five_whys
[5]: https://launchdarkly.com/blog/all-the-canaries-lived-its-time-to-adopt-progressive-delivery/
[6]: https://www.ideatovalue.com/insp/nickskillicorn/2017/04/true-story-post-notes-almost-failed/
