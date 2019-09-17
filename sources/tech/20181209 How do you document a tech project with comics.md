[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How do you document a tech project with comics?)
[#]: via: (https://jvns.ca/blog/2018/12/09/how-do-you-document-a-tech-project-with-comics/)
[#]: author: (Julia Evans https://jvns.ca/)

How do you document a tech project with comics?
======

Every so often I get email from people saying basically “hey julia! we have an open source project! we’d like to use comics / zines / art to document our project! Can we hire you?“.

spoiler: the answer is “no, you can’t hire me” – I don’t do commissions. But I do think this is a cool idea and I’ve often wished I had something more useful to say to people than “no”, so if you’re interested in this, here are some ideas about how to accomplish it!

### zine != drawing

First, a terminology distinction. One weird thing I’ve noticed is that people frequently refer to individual tech drawings as “zines”. I think this is due to me communicating poorly somehow, but – drawings are not zines! A zine is a **printed booklet**, like a small maga**zine**. You wouldn’t call a photo of a model in Vogue a magazine! The magazine has like a million pages! An individual drawing is a drawing/comic/graphic/whatever. Just clarifying this because I think it causes a bit of unnecessary confusion.

### comics without good information are useless

Usually when folks ask me “hey, could we make a comic explaining X”, it doesn’t seem like they have a clear idea of what information exactly they want to get across, they just have a vague idea that maybe it would be cool to draw some comics. This makes sense – figuring out what information would be useful to tell people is very hard!! It’s 80% of what I spend my time on when making comics.

You should think about comics the same way as any kind of documentation – start with the information you want to convey, who your target audience is, and how you want to distribute it (twitter? on your website? in person?), and figure out how to illustrate it after :). The information is the main thing, not the art!

Once you have a clear story about what you want to get across, you can start trying to think about how to represent it using illustrations!

### focus on concepts that don’t change

Drawing comics is a much bigger investment than writing documentation (it takes me like 5x longer to convey the same information in a comic than in writing). So use it wisely! Because it’s not that easy to edit, if you’re going to make something a comic you want to focus on concepts that are very unlikely to change. So talk about the core ideas in your project instead of the exact command line arguments it takes!

Here are a couple of options for how you could use comics/illustrations to document your project!

### option 1: a single graphic

One format you might want to try is a single, small graphic explaining what your project is about and why folks might be interested in it. For example: [this zulip comic][1]

This is a short thing, you could post it on Twitter or print it as a pamphlet to give out. The information content here would probably be basically what’s on your project homepage, but presented in a more fun/exciting way :)

You can put a pretty small amount of information in a single comic. With that Zulip comic, the things I picked out were:

  * zulip is sort of like slack, but it has threads
  * it’s easy to keep track of threads even if the conversation takes place over several days
  * you can much more easily selectively catch up with Zulip
  * zulip is open source
  * there’s an open zulip server you can try out



That’s not a lot of information! It’s 50 words :). So to do this effectively you need to distill your project down to 50 words in a way that’s still useful. It’s not easy!

### option 2: many comics

Another approach you can take is to make a more in depth comic / illustration, like [google’s guide to kubernetes][2] or [the children’s illustrated guide to kubernetes][3].

To do this, you need a much stronger concept than “uh, I want to explain our project” – you want to have a clear target audience in mind! For example, if I were drawing a set of Docker comics, I’d probably focus on folks who want to use Docker in production. so I’d want to discuss:

  * publishing your containers to a public/private registry
  * some best practices for tagging your containers
  * how to make sure your hosts don’t run out of disk space from downloading too many containers
  * how to use layers to save on disk space / download less stuff
  * whether it’s reasonable to run the same containers in production &amp; in dev



That’s totally different from the set of comics I’d write for folks who just want to use Docker to develop locally!

### option 3: a printed zine

The main thing that differentiates this from “many comics” is that zines are printed! Because of that, for this to make sense you need to have a place to give out the printed copies! Maybe you’re going present your project at a major conference? Maybe you give workshops about your project and want to give our the zine to folks in the workshop as notes? Maybe you want to mail it to people?

### how to hire someone to help you

There are basically 3 ways to hire someone:

  1. Hire someone who both understands (or can quickly learn) the technology you want to document and can illustrate well. These folks are tricky to find and probably expensive (I certainly wouldn’t do a project like this for less than $10,000 even if I did do commissions), just because programmers can usually charge a pretty high consulting rate. I’d guess that the main failure mode here is that it might be impossible/very hard to find someone, and it might be expensive.
  2. Collaborate with an illustrator to draw it for you. The main failure mode here is that if you don’t give the illustrator clear explanations of your tech to work with, you.. won’t end up with a clear and useful explanation. From what I’ve seen, **most folks underinvest in writing clear explanations for their illustrators** – I’ve seen a few really adorable tech comics that I don’t find useful or clear at all. I’d love to see more people do a better job of this. What’s the point of having an adorable illustration if it doesn’t teach anyone anything? :)
  3. Draw it yourself :). This is what I do, obviously. stick figures are okay!



Most people seem to use method #2 – I’m not actually aware of any tech folks who have done commissioned comics (though I’m sure it’s happened!). I think method #2 is a great option and I’d love to see more folks do it. Paying illustrators is really fun!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2018/12/09/how-do-you-document-a-tech-project-with-comics/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://twitter.com/b0rk/status/986444234365521920
[2]: https://cloud.google.com/kubernetes-engine/kubernetes-comic/
[3]: https://thenewstack.io/kubernetes-gets-childrens-book/
