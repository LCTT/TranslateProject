[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why we open sourced our Python platform)
[#]: via: (https://opensource.com/article/20/7/why-open-source)
[#]: author: (Meredydd Luff https://opensource.com/users/meredydd-luff)

Why we open sourced our Python platform
======
Open source development philosophy makes Anvil's entire solution more
useful and trustworthy.
![neon sign with head outline and open source why spelled out][1]

The team at Anvil recently open sourced the [Anvil App Server][2], a runtime engine for hosting web apps built entirely in Python.

The community reaction has been overwhelmingly positive, and we, at Anvil, have already incorporated lots of that feedback into our [next release][3]. But one of the questions we keep getting asked is, "Why did you choose to open source such a core part of your product?"

### Why we created Anvil

[Anvil][4] is a tool that makes it as simple as possible to build a web app. We do that by enabling you to build the whole application in one language—Python.

Before Anvil, if you wanted to build a web app, you'd have to write code using a bunch of technologies like HTML, Javascript, CSS, Python, SQL, React, Redux, Bootstrap, Sass, Webpack, etc. That's a lot to learn. And that's just for a simple app; trust me, it can get [way more complicated][5].

![A complex framework of development tools needed for a simple web app][6]

Yes, really. All of these, for a simple web app.

But even then, you're not done! You need to know all about Git and cloud hosting providers, how to secure the (most-likely) Linux operating system, how to tune the database, and then you're on call to keep it running. Forever.

So, instead, we built Anvil, an online IDE where you can build your UI with a [drag-and-drop designer][7] and write all your [logic in Python][8], then Anvil takes care of the rest. We replace that whole teetering stack with "just write Python."

### Simple web hosting is important, but not enough

Anvil can also host your apps for you. And why not? There is so much complexity in deploying a web app, so running our own cloud hosting service was the only way to provide the simplicity we need. Build an app in the Anvil editor, [click a button][9], and it's live on the Internet.

But we kept hearing from people who said, "That's great, but…"

  * "I need to run this on an offshore platform without reliable internet access."
  * "I want to package my app into an IoT device I sell."
  * "If I'm putting my eggs in this basket, how can I be sure I can still run my app in ten years?"



These are all good points! A cloud service isn't the right solution for everyone. If we want to serve these users, there's got to be some way for them to get their apps out of Anvil and run them locally, under their own complete control.

### Open source is an escape hatch, not an ejector seat

At conferences, we sometimes get asked, "Can I export this as a Flask+JS app?" Sure, it would be possible to export an Anvil project into its respective Python and JavaScript—we could generate a server package, compile the client-side Python to Javascript, and spit out a classic web app. But it would have serious drawbacks, because: **code generation is an ejector seat.**

![Code generation is an ejector seat from a structured platform][10]

([Image][11] licensed as public domain)

Generated code is better than nothing; at least you can edit it! But the moment you've edited that code, you've lost all the benefits of the system that generated it. If you're using Anvil because of its [drag-and-drop editor][12] and [Python in the browser][13], why should you have to use vim and Javascript in order to host your app locally?

We believe in [escape hatches, not ejector seats][14]. So we did it the right way—we [open-sourced Anvil's runtime engine][2], which is the same code that serves your app in our hosted service. It's a standalone app; you can edit your code with a text editor and run it locally. But you can also `git push` it right back into our online IDE. It's not an ejector seat; there's no explosive transition. It's an escape hatch; you can climb out, do what you need to do, and climb right back in.

### If it's open, is it reliable?

A seeming contradiction in open source is that its free availability is its strength, but also sometimes creates a perception of instability. After all, if you're not charging for it, how are you keeping this platform up and healthy for the long term?

We're doing what we always have—providing a development tool that makes it drastically simpler to build web applications, though the apps you build using Anvil are 100% yours. We provide hosting for Anvil apps and we offer the entire development and hosting platform onsite for [enterprise customers][15]. This enables us to offer a free plan so that everyone can use Anvil for hobby or educational purposes, or to start building something and see where it goes.

### More to gain, little to lose

Open sourcing our runtime engine isn't a detractor from our business—it makes our online IDE more useful and more trustworthy, today and in the future. We've open-sourced the Anvil App Server for the people who need it, and to provide the ultimate insurance policy. It's the right move for our users—now they can build with confidence, knowing that the open source code is [right there][3] if they need it.

If our development philosophy resonates with you, why not try Anvil yourself?
 

\-----

_This post is an adaptation of [Why We Open Sourced the Anvil App Server][16] and is reused with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/why-open-source

作者：[Meredydd Luff][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/meredydd-luff
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUS_OSwhy_520x292_ma.png?itok=lqfhAs8L (neon sign with head outline and open source why spelled out)
[2]: https://anvil.works/blog/open-source
[3]: https://github.com/anvil-works/anvil-runtime
[4]: https://anvil.works/
[5]: https://github.com/kamranahmedse/developer-roadmap#introduction
[6]: https://opensource.com/sites/default/files/uploads/frameworks.png (A complex framework of development tools needed for a simple web app)
[7]: https://anvil.works/docs/client/ui
[8]: https://anvil.works/docs/client/python
[9]: https://anvil.works/docs/deployment
[10]: https://opensource.com/sites/default/files/uploads/ejector-seat-opensourcecom.jpg (Code generation is an ejector seat from a structured platform)
[11]: https://commons.wikimedia.org/wiki/File:Crash.arp.600pix.jpg
[12]: https://anvil.works/docs/editor
[13]: https://anvil.works/docs/client
[14]: https://anvil.works/blog/escape-hatches-and-ejector-seats
[15]: https://anvil.works/docs/overview/enterprise
[16]: https://anvil.works/blog/why-open-source
