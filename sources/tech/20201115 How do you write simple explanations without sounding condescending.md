[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How do you write simple explanations without sounding condescending?)
[#]: via: (https://jvns.ca/blog/2020/11/15/simple-explanations-without-sounding-condescending/)
[#]: author: (Julia Evans https://jvns.ca/)

How do you write simple explanations without sounding condescending?
======

Sumana Harihareswara wrote an interesting blog post [Plain Language Choices][1] recently, about writing about complicated topics using simple language and how it can sometimes come off as condescending.

I really like explaining complicated topics while trying to avoid unnecessary jargon, and I realized that I’ve thought a lot about how to do it well. So here are a bunch of things I try to do when I use simple language to avoid coming off as condescending.

### use some jargon to give the reader search terms

Sometimes I see writing that completely avoids all jargon and instead substitutes simple language for all “jargon”-y words.

I like to include some jargon in my explanations because otherwise it’s impossible for the reader to search &amp; learn more about the concept they’re trying to learn about.

### write (mostly) true explanations

Something else I see sometimes in ELI5-type explanations is an explanation in plain language that’s not actually true in a useful way. I’m pretty sympathetic to why people do this – it’s super hard to write simple explanations that are also true!

And actually sometimes when I’m trying to write down a simple/clear explanation for a concept, I realize that I don’t actually understand the concept as well as I thought and that I’m not able to explain it. That’s okay!

I think there are a few options here:

  * try to say only things that are true (or at least which are a useful model for how the world works even if they’re not 100% true)
  * write things that are not really true / that you’re not sure of, but point out that they may not be true (“I think it works like X, but I realize now that it might be Y instead, I’m not sure!“)



### only use “fun” visual elements on explanations that are actually well written &amp; easy to understand

This happens more with visual aids than with simple language but I’ll include it anyway. Sometimes I see explanations which have “fun” elements to it to make it them seem more approachable where the explanation itself is still pretty unclear.

I try to be careful about this in my own work – I try to only attach “fun” elements (like a fun illustrated cover) to explanations that I’ve spent a lot of time on making really clear. Basically to me “fun” things are a signal that the content itself is really clear/accessible, and I try to not misuse that signal.

I think [why’s poignant guide to ruby][2] is a nice example of something that’s fun and clear and which has helped a lot of people learn Ruby.

Another nice example of this is: I know someone who got her master’s thesis printed as a paperback book and illustrated with some great drawings related to the topic of her thesis (trans represensentation in media). It’s called “I’m supposed to relate to this?”, here’s the [PDF][3] and here’s the [paperback][4]. I ended up reading the whole thing because, in addition to having the fun illustrations, her master’s thesis was really well written and interesting! The fact that she did the work to print a paperback book of her thesis and get it illustrated was a sign that she’d worked on making the writing accessible to a non-academic audience, and it was true!

### tell a relevant story

Stories can really help people learn! For example, something I’ve done a lot on this blog is talk about a problem I ran into in the course of my job and what I did to solve that problem.

Some kinds of stories that I think work well:

  * a real problem that someone ran into, to motivate why the concept is interesting / important to learn
  * something that’s happening on a computer, framed as a “story” (for example <https://howdns.works/> tells a story about how DNS works. Everything in the story literally corresponds to exactly what happens when you make a DNS query)



Sometimes I see stories used to explain concepts that don’t fit into either of these and feel kind of pasted on, like they’re there to help the concept seem “fun” but don’t actually illustrate the concept or motivate why it might be useful to learn it.

### have a specific audience in mind

I try to write relatively simple explanations, but when I write I also generally assume a lot of knowledge on the part of my audience.

Sometimes I see explanations of complicated concepts that start with explaining the very basics of the topic. This usually isn’t that effective: if someone is trying to understand some super technical aspect of containers, they probably understand the basics of containers already!

“Have an audience” is more of a general writing tip so I’ll leave it at that.

### on using simple language as a joke for people who already understand the idea

Here’s a very fun explanation of a complicated thing using simple language: [Gödel’s Second Incompleteness Theorem Explained in Words of One Syllable][5].

On one hand, this is fun! I enjoyed reading it. On the other hand, I think the main audience for this is probably people who already more or less understand Gödel’s Second Incompleteness Theorem.

For example, someone pointed out that “if math is a not a load of bunk” in this text is code for “Peano arithmetic is consistent” with (“math” being “Peano arithmetic” and “not a load of bunk” meaning “consistent”). Which I find very charming, but also I found it a little hard to decode when reading it.

And (as we talked about before about jargon), if you know that “Peano arithmetic is consistent” is the relevant bit of jargon, you can find all kind of fascinating things, like [a blog post by John Baez from 2011 discussing an attempted proof that Peano arithmetic was inconsistent][6])

(I’m also reminded here of the XKCD [up goer five][7], which is very delightful, but I don’t think I learned anything about spaceships from reading it)

### that’s all!

I’d love to hear more thoughts on this – I think there are probably more ways that simple explanations can feel condescending that I’ve missed!

I really don’t think they _need_ to feel condescending though – to me the point of writing a clear/simple explanation is usually that I think the idea is _not actually fundamentally that complicated_ and so I’m just explaining it in a way that’s exactly as complicated as it needs to be.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/11/15/simple-explanations-without-sounding-condescending/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://www.harihareswara.net/sumana/2020/11/12/0
[2]: https://poignant.guide/
[3]: https://ruor.uottawa.ca/bitstream/10393/32929/1/Clayman_Valerie_2015_thesis.pdf
[4]: https://www.amazon.ca/Supposed-Relate-Issues-Identification-Moving/dp/0994961200
[5]: https://www2.kenyon.edu/Depts/Math/Milnikel/boolos-godel.pdf
[6]: https://golem.ph.utexas.edu/category/2011/09/the_inconsistency_of_arithmeti.html
[7]: https://xkcd.com/1133/
