
translating by HardworkFish

How to answer questions in a helpful way
============================================================

Your coworker asks you a slightly unclear question. How do you answer? I think asking questions is a skill (see [How to ask good questions][1]) and that answering questions in a helpful way is also a skill! Both of them are super useful.

To start out with – sometimes the people asking you questions don’t respect your time, and that sucks. I’m assuming here throughout that that’s not what happening – we’re going to assume that the person asking you questions is a reasonable person who is trying their best to figure something out and that you want to help them out. Everyone I work with is like that and so that’s the world I live in :)

Here are a few strategies for answering questions in a helpful way!

### If they’re not asking clearly, help them clarify

Often beginners don’t ask clear questions, or ask questions that don’t have the necessary information to answer the questions. Here are some strategies you can use to help them clarify.

*   **Rephrase a more specific question** back at them (“Are you asking X?”)

*   **Ask them for more specific information** they didn’t provide (“are you using IPv6?”)

*   **Ask what prompted their question**. For example, sometimes people come into my team’s channel with questions about how our service discovery works. Usually this is because they’re trying to set up/reconfigure a service. In that case it’s helpful to ask “which service are you working with? Can I see the pull request you’re working on?”

A lot of these strategies come from the [how to ask good questions][2] post. (though I would never say to someone “oh you need to read this Document On How To Ask Good Questions before asking me a question”)

### Figure out what they know already

Before answering a question, it’s very useful to know what the person knows already!

Harold Treen gave me a great example of this:

> Someone asked me the other day to explain “Redux Sagas”. Rather than dive in and say “They are like worker threads that listen for actions and let you update the store!” 
> I started figuring out how much they knew about Redux, actions, the store and all these other fundamental concepts. From there it was easier to explain the concept that ties those other concepts together.

Figuring out what your question-asker knows already is important because they may be confused about fundamental concepts (“What’s Redux?”), or they may be an expert who’s getting at a subtle corner case. An answer building on concepts they don’t know is confusing, and an answer that recaps things they know is tedious.

One useful trick for asking what people know – instead of “Do you know X?”, maybe try “How familiar are you with X?”.

### Point them to the documentation

“RTFM” is the classic unhelpful answer to a question, but pointing someone to a specific piece of documentation can actually be really helpful! When I’m asking a question, I’d honestly rather be pointed to documentation that actually answers my question, because it’s likely to answer other questions I have too.

I think it’s important here to make sure you’re linking to documentation that actually answers the question, or at least check in afterwards to make sure it helped. Otherwise you can end up with this (pretty common) situation:

*   Ali: How do I do X?

*   Jada: <link to documentation>

*   Ali: That doesn’t actually explain how to X, it only explains Y!

If the documentation I’m linking to is very long, I like to point out the specific part of the documentation I’m talking about. The [bash man page][3] is 44,000 words (really!), so just saying “it’s in the bash man page” is not that helpful :)

### Point them to a useful search

Often I find things at work by searching for some Specific Keyword that I know will find me the answer. That keyword might not be obvious to a beginner! So saying “this is the search I’d use to find the answer to that question” can be useful. Again, check in afterwards to make sure the search actually gets them the answer they need :)

### Write new documentation

People often come and ask my team the same questions over and over again. This is obviously not the fault of the people (how should  _they_  know that 10 people have asked this already, or what the answer is?). So we’re trying to, instead of answering the questions directly,

1.  Immediately write documentation

2.  Point the person to the new documentation we just wrote

3.  Celebrate!

Writing documentation sometimes takes more time than just answering the question, but it’s often worth it! Writing documentation is especially worth it if:

a. It’s a question which is being asked again and again b. The answer doesn’t change too much over time (if the answer changes every week or month, the documentation will just get out of date and be frustrating)

### Explain what you did

As a beginner to a subject, it’s really frustrating to have an exchange like this:

*   New person: “hey how do you do X?”

*   More Experienced Person: “I did it, it is done.”

*   New person: ….. but what did you DO?!

If the person asking you is trying to learn how things work, it’s helpful to:

*   Walk them through how to accomplish a task instead of doing it yourself

*   Tell them the steps for how you got the answer you gave them!

This might take longer than doing it yourself, but it’s a learning opportunity for the person who asked, so that they’ll be better equipped to solve such problems in the future.

Then you can have WAY better exchanges, like this:

*   New person: “I’m seeing errors on the site, what’s happening?”

*   More Experienced Person: (2 minutes later) “oh that’s because there’s a database failover happening”

*   New person: how did you know that??!?!?

*   More Experienced Person: “Here’s what I did!”:
    1.  Often these errors are due to Service Y being down. I looked at $PLACE and it said Service Y was up. So that wasn’t it.

    2.  Then I looked at dashboard X, and this part of that dashboard showed there was a database failover happening.

    3.  Then I looked in the logs for the service and it showed errors connecting to the database, here’s what those errors look like.

If you’re explaining how you debugged a problem, it’s useful both to explain how you found out what the problem was, and how you found out what the problem wasn’t. While it might feel good to look like you knew the answer right off the top of your head, it feels even better to help someone improve at learning and diagnosis, and understand the resources available.

### Solve the underlying problem

This one is a bit tricky. Sometimes people think they’ve got the right path to a solution, and they just need one more piece of information to implement that solution. But they might not be quite on the right path! For example:

*   George: I’m doing X, and I got this error, how do I fix it

*   Jasminda: Are you actually trying to do Y? If so, you shouldn’t do X, you should do Z instead

*   George: Oh, you’re right!!! Thank you! I will do Z instead.

Jasminda didn’t answer George’s question at all! Instead she guessed that George didn’t actually want to be doing X, and she was right. That is helpful!

It’s possible to come off as condescending here though, like

*   George: I’m doing X, and I got this error, how do I fix it?

*   Jasminda: Don’t do that, you’re trying to do Y and you should do Z to accomplish that instead.

*   George: Well, I am not trying to do Y, I actually want to do X because REASONS. How do I do X?

So don’t be condescending, and keep in mind that some questioners might be attached to the steps they’ve taken so far! It might be appropriate to answer both the question they asked and the one they should have asked: “Well, if you want to do X then you might try this, but if you’re trying to solve problem Y with that, you might have better luck doing this other thing, and here’s why that’ll work better”.

### Ask “Did that answer your question?”

I always like to check in after I  _think_  I’ve answered the question and ask “did that answer your question? Do you have more questions?”.

It’s good to pause and wait after asking this because often people need a minute or two to know whether or not they’ve figured out the answer. I especially find this extra “did this answer your questions?” step helpful after writing documentation! Often when writing documentation about something I know well I’ll leave out something very important without realizing it.

### Offer to pair program/chat in real life

I work remote, so many of my conversations at work are text-based. I think of that as the default mode of communication.

Today, we live in a world of easy video conferencing & screensharing! At work I can at any time click a button and immediately be in a video call/screensharing session with someone. Some problems are easier to talk about using your voices!

For example, recently someone was asking about capacity planning/autoscaling for their service. I could tell there were a few things we needed to clear up but I wasn’t exactly sure what they were yet. We got on a quick video call and 5 minutes later we’d answered all their questions.

I think especially if someone is really stuck on how to get started on a task, pair programming for a few minutes can really help, and it can be a lot more efficient than email/instant messaging.

### Don’t act surprised

This one’s a rule from the Recurse Center: [no feigning surprise][4]. Here’s a relatively common scenario

*   Human 1: “what’s the Linux kernel?”

*   Human 2: “you don’t know what the LINUX KERNEL is?!!!!?!!!???”

Human 2’s reaction (regardless of whether they’re  _actually_  surprised or not) is not very helpful. It mostly just serves to make Human 1 feel bad that they don’t know what the Linux kernel is.

I’ve worked on actually pretending not to be surprised even when I actually am a bit surprised the person doesn’t know the thing and it’s awesome.

### Answering questions well is awesome

Obviously not all these strategies are appropriate all the time, but hopefully you will find some of them helpful! I find taking the time to answer questions and teach people can be really rewarding.

Special thanks to Josh Triplett for suggesting this post and making many helpful additions, and to Harold Treen, Vaibhav Sagar, Peter Bhat Harkins, Wesley Aptekar-Cassels, and Paul Gowder for reading/commenting.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/answer-questions-well/

作者：[ Julia Evans][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/about
[1]:https://jvns.ca/blog/good-questions/
[2]:https://jvns.ca/blog/good-questions/
[3]:https://linux.die.net/man/1/bash
[4]:https://jvns.ca/blog/2017/04/27/no-feigning-surprise/
