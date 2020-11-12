[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A new way I'm getting feedback on my zines: beta readers!)
[#]: via: (https://jvns.ca/blog/2020/11/07/a-new-way-i-m-getting-feedback-on-my-zines--beta-readers-/)
[#]: author: (Julia Evans https://jvns.ca/)

A new way I'm getting feedback on my zines: beta readers!
======

In the last few weeks I’ve been editing 2 [zines][1] and getting them ready to release: one on CSS and one on bash.

I have a lot of ways I get feedback on my zines to make them better, including:

  1. post individual pages on Twitter and see what people say
  2. hire someone to go over the zine in depth and see what they find confusing (I do this with my friend Dolly, who always points out a million things that don’t make sense and helps me come up with ideas for new pages on topics that I’ve totally forgotten to explain)
  3. hire a technical reviewer
  4. ask a friend to casually look at parts of it and see what they think (the diagrams in the SQL zine are thanks to my friend Anton who told me “these diagrams are confusing, what if you did them like this instead?”)
  5. ask my partner to read it
  6. hire a copy editor near the end



But I still felt like I wasn’t getting quite enough feedback about which parts of the zine were confusing and needed to be made more clear.

So this round of zine editing, I had an idea: what if I recruited 10-20 beta readers and got their thoughts? I thought this worked really well, so here’s my process for doing this in case it’s useful for someone else writing a book.

(and since a few people have offered: I’ll say to start out that I’m not looking for new beta readers right now, but I really appreciate everyone who has helped with this!)

### step 1: email my mailing list and ask for beta readers

I sent a quick note out to part of my mailing list, like this:

> If you’d be interested in reading through a draft of the zine and sending me some feedback about which parts are confusing, email me at REDACTED! I’m especially interested in hearing from people who know some basic CSS, but still get really confused &amp; frustrated every time they try to get something done.
>
> Anyone who gives me beta reader feedback on the zine will get a free copy of the zine when it comes out, as a thank you :)

Julia

I think there were 3 important things here:

  1. **the number of people I sent it to**: I sent this to about 300-600 people, and about 5% of the people I emailed replied – 10-30 beta readers. I think that gave me a good range of feedback and that I’d aim for a similar number in the future. I think that if I emailed way more people (like 2000), it would be hard to manage emailing all of them and digesting all the feedback
  2. **saying who specifically I want feedback from**. In this case, I said that I wanted to hear from “people who know some basic CSS, but still get really confused &amp; frustrated every time they try to get something done.” I think this is important because it lets me focus on feedback from people who are in the audience for the zine.
  3. **ask people to briefly summarize their experience with the topic**. This is something I _didn’t_ ask for, but that most people naturally did on their own when emailing me – they’d write a sentence or two about their experience with CSS. I think that next time I’d ask people to do this because I found it VERY helpful to understand a little bit about the person’s experience when reading their feedback.



### step 2: explain what kind of feedback I want

I think this was the most important step. I wanted a really specific _kind_ of feedback from my beta readers (to tell me which parts of the zine were confusing), and I knew that I wouldn’t get it if I didn’t ask for it specifically. So I wrote a pretty detailed email explaining the kinds of feedback I wanted and the kinds of feedback I _didn’t_ want.

I also tried to be respectful of people’s time – I knew that people were busy, so I said that I appreciated any amount of feedback, even if they didn’t have time to read the whole zine.

> Hi NAME! (sometimes a quick sentence personal to them here, like “You’re definitely who I want to hear from – I partly wrote this for people who wrote CSS 10 years ago and haven’t learned anything new since then”)
>
> Here’s a link to download the current zine draft: <https://www.dropbox.com/REDACTED> (please don’t share it!)
>
> Any amount of feedback really helps me – if you just read 5 pages of the zine and only have 2-3 small pieces of feedback, please send it! I’d like to get the feedback by Saturday. You can either leave comments on Dropbox or just download the PDF and send me an email with a bunch of notes like “page 6: I didn’t understand XYZ”. Whatever’s easier for you!
>
> here’s the kind of feedback that would help me the most:
>
>   1. Things you found confusing. Things like:
>     * On page 3 it uses the term “inline” and I had to look up what that meant
>     * Nothing on page 10 made sense to me, I was just really confused
>   2. Questions you have (either big questions like “what even is the point of this feature at all?” or small questions like “what is that code supposed to output?”)
>   3. Specific things you learned! (for example, “I never understood what X syntax meant, and now I get it!”)
>

>
> I’m generally _not_ looking for:
>
>   1. Things that you think _someone else_ might find confusing, but that you yourself understand. I find that most people (including me, which is why I’m asking for this feedback!) aren’t great at simulating what someone else might find confusing.
>   2. Technical review (I have someone else doing that and I find it’s simpler not to crowdsource tech review)
>

>
> (though if you have something in these categories that you think is especially important, I’m happy to hear it!)
>
> thanks again, and I’m excited to hear what you have to say!
>
> Julia

### step 3: consolidate the feedback!

People REALLY delivered and gave me really great feedback! I wasn’t sure if people responding would stick to the guidelines of “I found this confusing”, “here’s a question I have”, and “here’s something I learned”, but almost everyone did!

For both zines I gave people a pretty short deadline, about 6 days. So about a week later I went through all the feedback and organized everyone’s comments.

Pretty much everyone had organized their comments by page, so I created a text file that looked like this:

```
Page 10: specificity
NAME 1: some feedback
NAME 2: more feedback
NAME 2: a different point
```

Then I wrote a Python script to put all the comments for each page into the Trello card for that page (where I’ve been putting all the feedback I get from everyone)

### a side excursion into Dropbox’s comments API

One small surprising thing that initially I didn’t expect is: I’d given everyone a Dropbox link to download the zine, and I’d forgotten that Dropbox has a commenting feature. So people who happened to have a Dropbox account would comment inside the Dropbox commenting feature.

I was a bit confused about how to handle this at first, because it turns out that for some reason that page renders extremely slowly on my laptop and so it was almost impossible to copy the comments out.

But then I remembered that I’m a programmer, so I:

  1. went into the network tab and reloaded the page
  2. found the request for the `list_comments` endpoint (or whatever it was called).
  3. right clicked, clicked ‘copy as cURL`
  4. pasted it into my terminal, and voila! I had a JSON file of all the comments! Way easier than manually copying and pasting everything.
  5. wrote a little Python script to format the comments into a text file in a format I could use



### step 4: look for patterns

Unsurprisingly, there were a lot of patterns in the feedback – most pages had feedback from maybe 5 people, and there were a few places where everyone would be confused about the exact same thing. This was SO HELPFUL because it was a clear sign that I definitely needed to change it.

Of course, sometimes people disagreed – sometimes one person would say something “this is really clear and I learned X Y Z from this page” and another person would say “this is very confusing, I have all these questions”. In cases like that, I usually tried to think about which person was closer to who I thought the audience for the zine was (which is why it’s so helpful to get a sense for each person’s background!), as well as always trying to fix the confusing thing if I could find a way to do it.

### step 5: make the changes

Some confusing things were easy to fix, like “there’s a footnote here and I can’t figure out what it refers to”, or “you talk about ‘css reset’ stylesheets” but the explanation makes no sense”.

Some were harder, for example I have a page about stacking contexts that I _knew_ was confusing, and the beta readers confirmed it was in fact pretty confusing. I think the root cause here is that stacking contexts might be actually literally impossible to explain in 100 words / 6 panels, so I approached problems like that by finding some simpler concept I _could_ explain in a small space, like “if `z-index` isn’t working the way you expect, the reason is probably that you have 2 elements in different stacking contexts”.

One of the biggest changes I made to the CSS zine after getting the beta reader feedback was to add some examples (<https://css-examples.wizardzines.com>) focused on things that the beta readers had found confusing and mark the panels which have associated examples with a little “try me!” icon.

### it really helped me feel more confident about the zine!

I always have this moment of anxiety when I release a new zine like “OH NO MAYBE THIS IS AWFUL AND NOBODY WILL UNDERSTAND ANYTHING”. Getting feedback from the beta readers has helped with this – because people both told me what they learned and what questions they had, I could see that a lot of the parts of the zine _weren’t_ that confusing and that I was getting across a lot of the information that I’d hoped to get across.

### that’s all!

Thanks so much to everyone who was a beta reader for these two zines (you know who you are!). I should say that I’m not looking for new beta readers now, but if you’re on my [saturday comics][2] mailing list, you might get an email from me at some point asking if you’re interested in being a beta reader :)

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/11/07/a-new-way-i-m-getting-feedback-on-my-zines--beta-readers-/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://wizardzines.com
[2]: https://wizardzines.com/saturday-comics
