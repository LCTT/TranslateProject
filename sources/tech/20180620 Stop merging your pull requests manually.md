Stop merging your pull requests manually
======

![](https://julien.danjou.info/content/images/2018/06/github-branching.png)

If there's something that I hate, it's doing things manually when I know I could automate them. Am I alone in this situation? I doubt so.

Nevertheless, every day, they are thousands of developers using [GitHub][1] that are doing the same thing over and over again: they click on this button:

![Screen-Shot-2018-06-19-at-18.12.39][2]

This does not make any sense.

Don't get me wrong. It makes sense to merge pull requests. It just does not make sense that someone has to push this damn button every time.

It does not make any sense because every development team in the world has a known list of pre-requisite before they merge a pull request. Those requirements are almost always the same, and it's something along those lines:

  * Is the test suite passing?
  * Is the documentation up to date?
  * Does this follow our code style guideline?
  * Have N developers reviewed this?



As this list gets longer, the merging process becomes more error-prone. "Oops, John just clicked on the merge button while there were not enough developer that reviewed the patch." Rings a bell?

In my team, we're like every team out there. We know what our criteria to merge some code into our repository are. That's why we set up a continuous integration system that runs our test suite each time somebody creates a pull request. We also require the code to be reviewed by 2 members of the team before it's approbated.

When those conditions are all set, I want the code to be merged.

Without clicking a single button.

That's exactly how [Mergify][3] started.

![github-branching-1][4]

[Mergify][3] is a service that pushes that merge button for you. You define rules in the `.mergify.yml` file of your repository, and when the rules are satisfied, Mergify merges the pull request.

No need to press any button.

Take a random pull request, like this one:

![Screen-Shot-2018-06-20-at-17.12.11][5]

This comes from a small project that does not have a lot of continuous integration services set up, just Travis. In this pull request, everything's green: one of the owners reviewed the code, and the tests are passing. Therefore, the code should be already merged: but it's there, hanging, chilling, waiting for someone to push that merge button. Someday.

With [Mergify][3] enabled, you'd just have to put this `.mergify.yml` a the root of the repository:
```
rules:
 default:
 protection:
 required_status_checks:
 contexts:
 - continuous-integration/travis-ci
 required_pull_request_reviews:
 required_approving_review_count: 1

```

With such a configuration, [Mergify][3] enables the desired restrictions, i.e., Travis passes, and at least one project member reviewed the code. As soon as those conditions are positive, the pull request is automatically merged.

We built [Mergify][3] as a **free service for open-source projects**. The [engine powering the service][6] is also open-source.

Now go [check it out][3] and stop letting those pull requests hang out one second more. Merge them!

If you have any question, feel free to ask us or write a comment below! And stay tuned — as Mergify offers a few other features that I can't wait to talk about!

--------------------------------------------------------------------------------

via: https://julien.danjou.info/stop-merging-your-pull-request-manually/

作者：[Julien Danjou][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://julien.danjou.info/author/jd/
[1]:https://github.com
[2]:https://julien.danjou.info/content/images/2018/06/Screen-Shot-2018-06-19-at-18.12.39.png
[3]:https://mergify.io
[4]:https://julien.danjou.info/content/images/2018/06/github-branching-1.png
[5]:https://julien.danjou.info/content/images/2018/06/Screen-Shot-2018-06-20-at-17.12.11.png
[6]:https://github.com/mergifyio/mergify-engine
