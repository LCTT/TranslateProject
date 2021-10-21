[#]: subject: "How to get useful answers to your questions"
[#]: via: "https://jvns.ca/blog/2021/10/21/how-to-get-useful-answers-to-your-questions/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to get useful answers to your questions
======

5 years ago I wrote a post called [how to ask good questions][1]. I still really like that post, but it’s missing a few of the tactics I use to get useful answers like “interrupt people when they’re going off on an irrelevant tangent”.

### what can go wrong when asking questions

Often when I ask a vague or underspecified question, what happens is one of:

  1. the person starts by explaining a bunch of stuff I already know
  2. the person explains some things which I don’t know, but which I don’t think are relevant to my problem
  3. the person starts giving a relevant explanation, but using terminology that I don’t understand, so I still end up being confused



None of these give me the answer to my question and this can be quite frustrating (it often feels condescending when someone embarks on a lengthy explanation of things I already know, even if they had no way of knowing that I already know those things), so let’s talk about I try to avoid situations like this and get the answers I need.

Before we talk about interrupting, I want to talk about my 2 favourite question-asking tactics again – asking yes/no questions and stating your understanding.

### ask yes/no questions

My favourite tactic is to ask a yes/no question. What I love about this is that there’s a much lower chance that the person answering will go off on an irrelevant tangent – they’ll almost always say something useful to me.

I find that it’s often possible to come up with yes/no questions even when discussing a complicated topic. For example, here are a bunch of yes/no questions I asked a friend when trying to learn a little bit about databases from them:

  * how often do you expect db failovers to happen? like every week?
  * do you need to scale up by hand?
  * are fb/dropbox both using mysql?
  * does fb have some kind of custom proprietary mysql management software?
  * is this because mysql and postgres were designed at a time when people didn’t think failover was something you’d have to do that frequently?
  * i still don’t really understand that blog post about replsets, like is he saying that mongodb replication is easier to set up than mysql replication?
  * is orchestrator a proxy?
  * is the goal of the replicas you’re talking about to be read replicas for performance?
  * do you route queries to a shard based on the id you’re searching for?
  * is the point that with compression it takes extra time to read but it doesn’t matter because you almost never read?



The answers to yes/no questions usually aren’t just “yes” or “no” – for all of those questions my friend elaborated on the answer, and the elaborations were always useful to me.

You’ll notice that some of those questions are “check my understanding” questions – like “do you route queries to a shard based on the id you’re searching for?” was my previous understanding of how database sharding worked, and I wanted to check if it was correct or not.

I also find that yes/no questions get me answers faster because they’re relatively easy to answer quickly.

### state your current understanding

My second favourite tactic is to state my understanding of how the system works.

Here’s an example from the “asking good questions” post of a “state your understanding” [email I sent to the rkt-dev mailing list][2]:

> I’ve been trying to understand why the tree store / image store are designed the way they are in rkt.
>
> My current understanding of how _Docker_’s image storage on disk works right now (from <https://docs.docker.com/engine/userguide/storagedriver/imagesandcontainers/>) is:
>
>   * every layer gets one directory, which is basically that layer’s filesystem
>   * at runtime, they all get stacked (via whatever CoW filesystem you’re using)
>   * every time you do IO, you go through the stack of directories (or however these overlay drivers work)
>

>
> my current understanding of rkt’s image storage on disk is: (from the “image lifecycle” section here: <https://github.com/coreos/rkt/blob/master/Documentation/devel/architecture.md>)
>
>   * every layer gets an image in the image store
>   * when you run an ACI file, all the images that that ACI depends on get unpacked and copied into a single directory (in the tree store)
>

>
> guess at why rkt decided to architect its storage differently from Docker:
>
>   1. having very deep overlay filesystems can be expensive
>   2. so if you have a lot of layers, copying them all into a directory (the “tree store”) results in better performance
>

>
> So rkt is trading more space used on disk (every image in the image store gets copied at least once) for better runtime performance (there are no deep chains of overlays)
>
> Is this right? Have I misunderstood what rkt does (or what Docker does?) Are there other reasons for the difference?

This:

  * states my goal (understand rkt’s design choices)
  * states my understanding of how rkt and docker work
  * makes some guesses at the goal so that people can confirm/deny



This question got a [great reply][3], which among other things pointed out something that I’d totally missed – that the ACI format is a DAG instead of a linked list, which I think means that you could install Debian packages in any order and not have to rebuild everything if you remove an `apt-get install` in the middle of your Dockerfile.

I also find the process of writing down my understanding is really helpful by itself just to clarify my own thoughts – sometimes by the time I’m done I’ve answered my own question :)

Stating your understanding is a kind of yes/no question – “this is my understanding of how X works, is that right or wrong?”. Often the answer is going to be “right in some ways and wrong in others”, but even so it makes the job of the answerer a lot easier.

Okay! Now let’s talk about interrupting a little bit.

### be willing to interrupt

If someone goes off on a very long explanation that isn’t helping me at all, I think it’s important to interrupt them. This can feel rude, but ultimately it’s more efficient for everyone – it’s a waste of both their time and my time to continue.

Usually I’ll interrupt by asking a more specific question, because usually if someone has gone off on a long irrelevant explanation it’s because I asked an overly vague question to start with.

### don’t accept responses that don’t answer your question

If someone finishes a statement that doesn’t answer you question, it’s important not to leave it there! Keep asking questions!

a couple of ways you can do this:

  1. ask a much more specific question (like a yes/no question) that’s in the direction of what you actually wanted to know
  2. ask them to clarify some terminology you didn’t understand (what’s an X?)



### take a minute to think

Sometimes when asking someone a question, they’ll tell me new information that’s really surprising. For example, I recently learned that Javascript async/await isn’t implemented with coroutines (I thought it was because AFAIK Python async/await is implemented with coroutines).

I was pretty surprised by this, and I really needed to stop and think about what the implications of that were and what other questions I had about how Javascript works based on that new piece of information.

If this happens in a real-time conversation sometimes I’ll literally say something like “wait, that’s surprising to me, let me think for a minute” and try to incorporate the new data and come up with another question.

### it takes a little bit of confidence

All of these things – being willing to interrupt, not accepting responses that don’t answer your questions, and asking for a minute to think – require a little bit of confidence!

In the past when I’ve struggled with confidence, I’ve sometimes thought “oh, this explanation is probably really good, I’m just not smart enough to understand it”, and kind of accepted it. And even today I sometimes find it hard to keep asking questions when someone says a lot of words I don’t understand.

It helps me to remember that:

  1. people usually want to help (even if their first explanation was full of confusing jargon)
  2. if I can get even 1 useful piece of information by the end of the conversation, it’s a victory (like the answer to a yes/no question that I previously didn’t know the answer to)



One of the reasons I dislike a lot of “how to ask questions” advice out there is that it actually tries to _undermine_ the reader’s confidence – the assumption is that the people answering the questions are Super Smart Perfect People and you’re probably wasting their time with your dumb questions. But in reality (at least when at work) your coworkers answering the questions are probably smart well-meaning people who want to help but aren’t always able to answer questions very clearly, so you need to ask follow up questions to get answers.

### how to give useful answers

There’s also a lot you can do to try not to be the person who goes off on a long explanation that doesn’t help the person you’re talking to at all.

I wrote about this already in [how to answer question in a helpful way][4], but the main thing I do is pause periodically and check in. I’ll often say something like “does that make sense?“. (though this doesn’t always work, sometimes people will say “yes” even if they’re confused)

It’s especially important to check in if:

  1. You haven’t explained a concept before (because your initial explanation will probably not be very good)
  2. You don’t know the person you’re talking to very well (because you’ll probably make incorrect assumptions about what they know / don’t know)



### being good at extracting information is a superpower

Some developers know a lot but aren’t very good at explaining what they know. I’m not trying to make a value judgement about that here (different people have different strengths! explaining things is extremely hard to do well!).

I’ve found that instead of being mad that some people aren’t great at explaining things, it’s more effective for me to get better at asking questions that will get me the answers I need.

This really expands the set of people I can learn from – instead of finding someone who can easily give a clear explanation, I just need to find _someone_ who has the information I want and then ask them specific questions until I’ve learned what I want to know. And I’ve found that most people really do want to be helpful, so they’re very happy to answer questions.

And if you get good at asking questions, you can often find a set of questions that will get you the answers you want pretty quickly, so it’s a good use of everyone’s time!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/10/21/how-to-get-useful-answers-to-your-questions/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/good-questions/
[2]: https://groups.google.com/g/rkt-dev/c/bhGeR3pUfPY
[3]: https://groups.google.com/g/rkt-dev/c/bhGeR3pUfPY/m/PYEKLIr9AwAJ
[4]: https://jvns.ca/blog/answer-questions-well/
