[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Questions to help people decide what to learn)
[#]: via: (https://jvns.ca/blog/2020/06/14/questions-to-help-you-learn/)
[#]: author: (Julia Evans https://jvns.ca/)

Questions to help people decide what to learn
======

For the last few months, I’ve been working on and off on a way to help people evaluate their own learning &amp; figure out what to learn next.

This past week I built a new iteration of this: <https://questions.wizardzines.com>, which today has 2 sets of questions:

  1. [questions about UDP][1]
  2. [questions about sockets][1]



It’s still a work in progress, but I’ve been working on this for quite a while so I wanted to write down how I got here.

### the goal: help people learn on their own

First, let’s talk about my goal. I’m interested in helping people who are trying to learn on their own. I don’t have any specific materials I’m trying to teach – I want to help people learn what _they_ want to learn.

I’ve done a lot of this by writing blog posts &amp; [zines][2], but I felt like I was missing something – were people really learning what they wanted to learn? How could they tell if they’d learned it?

I felt like I wanted some kind of “quiz” or “test”, but I wasn’t sure what it should look like.

### formative assessment vs summative assessment

Let’s take a very quick detour into terminology. There are two kinds of assessment teachers use in school.

**formative assessment**: “evaluations used to modify teaching and learning activities to improve student attainment.”

**summative assessment**: used to determine grades

Grades are pretty pointless if you’re teaching yourself (who cares if you got an A in sockets?). But formative assessments! If you could take some kind of evaluation to help you decide what exactly you should teach yourself next! That seems more useful. So I got interested in building some kind of “formative assessment” tool.

(thanks to [Sumana][3] for reminding me of these terms!)

### next step: ask on Twitter how people feel about quizzes

So I asked on Twitter (in [this thread][4]):

> have you ever taken a class (online or offline!) where you were given a quiz first that you could use to check your understanding of the topic at the start? did it help you?

I got about 90 replies. Here are some themes I took away from the replies:

  * quizzes remind many people of bad school experiences
  * people like using quizzes if they can direct their own learning (“skip X section if I already know the thing”)
  * one person said they took a quiz where they got a low score at the beginning and it helped them realize that they didn’t actually know the course content as well as they thought



One thing I learned from this is that being told you _don’t_ know something is a bad experience for a lot of people.

### idea: build flashcards you can learn from

My first idea was to reframe a test as a way to **learn**. So instead of it being something that tells you what you **don’t** know (which, so what?), it helps you learn something new!

So I built a few sets of flashcards about various topics. Here’s the first set I built, [flashcards on containers][5], if you want to try it out.

If you didn’t try it – it looks like this:

[][6]

![][7]

Basically – there are 14ish questions, you click the card to see the answer, and for each card you categorize it as “I knew that!”, “I learned something”, or “that’s confusing” (which is meant to be a kind of “other” category, where you didn’t know that and you didn’t learn anything).

The idea is that the answers contain enough information that you could actually learn a little bit from them, and hopefully be inspired to go learn more on your own if you’re interested.

### good things about the flashcards

some of the positive feedback I got about the flashcards was:

  * it’s fun
  * people liked being able to reflect on what they learned by the end
  * they were fast to complete (maybe 3-5 minutes)



### problems with the flashcards

But there were some problems that were bothering me, too.

  * the word “flashcards” has a lot baggage I didn’t want – it’s strongly associated with language learning / memorization. I don’t use flashcards myself at all myself so it didn’t really resonate with me.
  * the format was constrained, and sometimes I wanted to include more information in the answer than there was space for
  * the UI was a bit confusing, some people couldn’t figure out that you were supposed to click on the card to flip it.



### people dislike questions that don’t match their mental model

Probably the most important thing I learned from making these flashcards is that it really matters how well the question matches the reader’s mental model.

I started out by writing questions by taking statements I’d normally make about a topic, and turning them into questions. Sometimes this really didn’t work.

Here’s an example of it not working: I think the statement “a HTTP request has 4 parts: a body, the headers, the request method, and the path being requested” is relatively unobjectionable. That how I think about what a HTTP request is.

But what if I ask you “what are the 4 parts of a HTTP request?” and the answer is “a body, the headers, the request method, and the URL being requested”? It turns out, that’s totally different!! Not everyone thinks about HTTP requests as having 4 parts – they might think of it has having 3 parts (the first line, the headers, and the body). Or 2 parts and 1 optional part (the first line, and the headers, and maybe an optional body). Or some other way! So it’s weird to be asked “what are the 4 parts of a HTTP request”.

There were a lot of other examples like this, where people reacted badly to some question I asked that didn’t match up with how they think about a topic. So I learned that if I’m asking a question, it gets held to a higher standard for how well it matches with the reader’s mental model than when making the same statement.

An example of what I think would be a better question here is “Does every HTTP request have headers?” (yes! the HTTP/1.1 RFC requires that the Host header be set!). But even that is maybe a little tricky – probably at least one HTTP/1.0 client implementation is out there in the world sending requests without headers, even though 99.99% of HTTP requests have headers.

Of course, it’s ok if the question/answer doesn’t match the reader’s mental model if their mental model is incorrect, but if their model is correct then I think it should match.

### get rid of multiple choice

The other thing I learned from these flashcards is that a lot of people dislike multiple choice. I haven’t thought about this that much, but honestly I don’t really like multiple choice either so I decided to get rid of it.

### next step: get reminded of The Little Schemer

I don’t remember why, but I’ve had The Little Schemer kicking around in my head for a while. I haven’t actually read the whole thing myself, but I kept hearing people talking about it. Here’s the first page of The Little Schemer, if you haven’t heard of it:

![][8]

This reminded me a lot of what I was trying to do – there are questions and answers, but the goal isn’t for you to get all the questions “right”. Instead, I think the goal is for you to think about whether you know the answer yet or not and learn as you go.

### switch to a side-by-side format

So, I kept a similar question/answer format, but switched to a side-by-side format, like the Little Schemer.

![][9]

What I like about putting the questions &amp; answers next to each other:

  * you can see both at the same time, so you don’t forget what the question was
  * it then makes more sense to just put all the questions &amp; answers on the same page, so you can easily go back and look at the previous question if you want



Basically I like that it gives the reader more control, which I think is important.

### call it “questions” instead of “flashcards”

I also renamed the project to “questions” because that’s really how I think about learning for myself – I don’t do “flashcards”, but I do constantly ask myself questions about topics I don’t understand, figure out the answers to those questions, and then repeat until I understand the topic as well as I want to.

But coming up with the right questions on your own is hard when you don’t a lot, so I’m hopeful that providing folks with a bunch of questions (and answers) to think about will help you decide what you want to learn next.

### keep the “I learned something” button

When I released the first set of questions on UDP, I didn’t include an “I learned something” button, and I noticed something weird – a lot of people were tweeting things like “I got 8⁄10”, “I got 10⁄10”.

I was a bit worried about this because the whole idea was to help people identify things they could learn, so saying “I got 8⁄10” felt like it was focusing on the things you already knew and ignoring the most important thing – the 2 questions where maybe you could learn something new!

So I added an “I learned something!” button back to each question and spent way too much time building a fun SVG+CSS animation that played when you pressed the button. And so far it seems to have worked – I see more people commenting “I learned something” and less “I got 9⁄10”.

### building small things is hard

As usual, building small simple things takes more time than I’d expect! The concept of “some questions and answers” seems really simple, but I’ve already learned a lot by building this and I think I still have a lot more to learn about this format.

But I’m excited to learn more, and I’d love to know your thoughts. Here it is again if you’d like to try it: <https://questions.wizardzines.com>.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/06/14/questions-to-help-you-learn/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://questions.wizardzines.com
[2]: https://wizardzines.com
[3]: https://www.harihareswara.net/
[4]: https://twitter.com/b0rk/status/1232058417302450178
[5]: http://flashcards.wizardzines.com/container-basics/
[6]: https://flashcards.wizardzines.com/tls/
[7]: https://jvns.ca/images/flashcards.png
[8]: https://jvns.ca/images/little-schemer.png
[9]: https://jvns.ca/images/side-by-side.png
