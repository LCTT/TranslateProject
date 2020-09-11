[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Some notes on vector drawing apps)
[#]: via: (https://jvns.ca/blog/2019/11/18/some-notes-on-vector-drawing-apps/)
[#]: author: (Julia Evans https://jvns.ca/)

Some notes on vector drawing apps
======

For the last year and a half I’ve been using the iPad Notability app to draw my [zines][1]. Last week I decided I wanted more features, did a bit of research, and decided to switch to Affinity Designer (a much more complicated program). So here are a few quick notes about it.

The main difference between them is that Notability is a simple note taking app (aimed at regular people), and Affinity Designer is a vector graphics app (aimed at illustrators / graphic designers), like Adobe Illustrator.

I’ve never used a serious vector graphics program before, so it’s been cool to learn what kinds of features are available!

### Notability is super simple

This is what the Notability UI looks like. There’s a pencil, an eraser, a text tool, and a selection tool. That’s basically it. I LOVED this simplicity when I started using Notability, and I made 4 zines using it (help! i have a manager!, oh shit, git!, bite size networking!, and http: use your browser’s language).

<https://jvns.ca/images/notability.jpg>

Recently though, I’ve had a couple of problems with it, the main one being that text boxes and things drawn with the pencil tool don’t mix well. (In general Notability has been GREAT though and their support team has always been incredibly helpful when I’ve had questions.)

### Affinity Designer is really complicated

Affinity Designer, by comparison, is WAY more complicated. Here’s what the UI looks like:

<https://jvns.ca/images/affinity-designer.jpg>

There are

  * 14 tools on the left
  * 14 more panels on the right that alter what the tools do
  * a bottom toolbar which has different options for each tool
  * 2 menus which together have another 25 things or so that you can do



I still don’t understand what all the tools do (what’s the difference between Pencil and Vector Brush? I don’t know!). But I’m pretty excited about this because (unlike with Notability) there are so many options that if I’m frustrated about something, 90% of the time there’s a way to do the thing I want!

### switching from Notability to Affinity Designer is really easy

Switching to Notability wasn’t the best: I [reverse engineered the file format][2] to transfer some files over but the quality was never the best (probably because of problems with my script) and I ended up having to redraw a lot of them in practice.

With Affinity Designer, I can just

  * export a PDF with Notability (or anything else)
  * import the PDF with Affinity Designer
  * and then I can easily edit it and that’s it?!?



It’s not perfect – the vector paths it comes up with are kind of weird, probably because of the way the PDF is – but it’s very good! It makes me feel confident that if I need to make a small edit to something I made in the past I can just import the PDF!

### what can a vector drawing app do?

here are a few things Affinity Designer can do that Notability can’t:

  * **custom paper sizes**: In Notability every page is 8.5x11, but usually I want something more like 5.5x8.5 which is a different aspect ratio (this is technically sort of possible in Notability by importing a PDF of the correct size but it’s a pain and it means you can’t use a grid)
  * **custom colour palettes**: I can have the 10 colours I like to use in my comics all in one place
  * **grouping objects together** – I can “group” a bunch of objects together so that I can easily resize and move them all together
  * **two kinds of text box**. This is the kind of thing that I wouldn’t have understood 2 years ago but that now I LOVE – you can either have “art text” that acts like an image (no word wrap, gets bigger when you resize it) or “frame text” that has word wrap and doesn’t get bigger when you resize it.
  * **really great import** – I can import a PDF or SVG and individually edit / move around parts of the PDF. Notability doesn’t have any import tools that let you edit after importing.
  * **custom export options for printing**. I don’t understand what it **does** yet but there are export presets for print PDFs and it fixes some printing problems I was having!



There are also a LOT more features that I’m not interested in but I’m pretty excited about those 6 things and it feels like an app that I won’t grow out of.

### iPad apps are great

I’ve been exclusively using Linux for the last 15 years where the image editing/media tools aren’t always great (though I really like Inkscape and I hear good things about Krita!), so it’s really cool to have access to all these great iPad apps. And the prices seem pretty reasonable:

  * Notability is $12
  * Affinity Designer is $20
  * LumaFusion (a nice video editor I’ve been using a little) is $30



It doesn’t make me want a Mac (I like the Linux desktop experience!), but it’s nice to have access to a bunch of these great tools. And I think a lot of these art tools work better on an iPad than on a computer anyway since you can just draw on the screen :)

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2019/11/18/some-notes-on-vector-drawing-apps/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://wizardzines.com
[2]: https://jvns.ca/blog/2018/03/31/reverse-engineering-notability-format/
