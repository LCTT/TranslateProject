[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Some CSS comics)
[#]: via: (https://jvns.ca/blog/2020/07/25/some-comics-about-css/)
[#]: author: (Julia Evans https://jvns.ca/)

Some CSS comics
======

Hello! I’ve been writing some comics about CSS this past week, and I thought as an experiment I’d post them to my blog instead of only putting them on Twitter.

I’m going to ramble about CSS at the beginning a bit but you can skip to the end if you just want to read the comics :)

### why write about CSS?

I’ve been writing a tiny bit more CSS recently, and I’ve decided to [actually take some time to learn CSS][1] instead of just flailing around and deciding “oh no, this is impossible”.

CSS feels a little like systems programming / Linux to me – there are a lot of counterintuitive facts that you need to learn to be effective with it, but I think once you learn those facts it gets a lot easier.

So I’m writing down some facts that I found counterintuitive when learning CSS, like the fact that `position: absolute` isn’t absolute!

### why try to read the specs?

I’ve been having a lot of fun reading through the [CSS2 spec][2] and finding out that some things about CSS that I was intimidated by (like selector specificity) aren’t as complicated as I thought.

I think reading (parts of) the CSS specs is fun because I’m so used to learning CSS by reading a lot of websites which sometimes have conflicting information. ([MDN][3] is an incredible resource but I don’t think it’s 100% always correct either.)

So it’s fun to read a more authoritative source! Of course, it’s not always true that the CSS specs correspond to reality – browser implementations of the specs are inconsistent.

But expecially for parts of CSS that are older &amp; better-established (like the basics of how `position: absolute` works) I like reading the specs.

### how are the CSS specs organized?

CSS used to be defined by a single specification (CSS2), but as of CSS 3 each part of CSS has its own specification. For example, there’s a CSS 3 specification [for colours][4].

Here are the links I’ve been using:

  * there’s a PDF of the [CSS2 spec here][2]
  * [CSS Snapshot 2018][5] lists all the CSS specifications as of 2018, which is where I’ve been looking for links to the CSS 3 specifications
  * [Understanding the CSS Specifications][6] is an explanation of how to approach reading the CSS specs. For example, it recommends reading [CSS sizing][7] which I haven’t tried reading yet.



I’ve been kind of alternating between the CSS 2 spec and the CSS 3 specs – because the CSS 2 spec is smaller, I find it easier to digest and understand the big picture of how things are supposed to work without getting lost in a lot of details.

### a few comics

Okay, here are the comics! As always when I start working on a set of comics / a potential zine, there’s no specific order or organization.

### the box model

[![][8]][9] Permalink: <https://wizardzines.com/comics/box-model>

### CSS units

[![][10]][11] Permalink: <https://wizardzines.com/comics/units>

Reference material: I found [this section on lengths][12] from “CSS Values and Units Module Level 3” pretty straightforward.

### selectors

[![][13]][14] Permalink: <https://wizardzines.com/comics/selectors>

Reference material: section [6.4.1 to 6.4.3][15] from the CSS 2 spec.

### `position: absolute`

[![][16]][17] Permalink: <https://wizardzines.com/comics/position-absolute>

### inline vs block

[![][18]][19] Permalink: <https://wizardzines.com/comics/inline-vs-block>

One piece of errata for this one: you actually can set the width on an inline element if it’s a “replaced” element

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/07/25/some-comics-about-css/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/debugging-attitude-matters/
[2]: https://www.w3.org/TR/CSS2/css2.pdf
[3]: https://developer.mozilla.org
[4]: https://www.w3.org/TR/css-color-3/
[5]: https://www.w3.org/TR/CSS/
[6]: https://www.w3.org/Style/CSS/read.en.html
[7]: https://www.w3.org/TR/css-sizing-3/
[8]: https://wizardzines.com/comics/box-model/box-model.png
[9]: https://wizardzines.com/comics/box-model
[10]: https://wizardzines.com/comics/units/units.png
[11]: https://wizardzines.com/comics/units
[12]: https://www.w3.org/TR/css-values-3/#lengths
[13]: https://wizardzines.com/comics/selectors/selectors.png
[14]: https://wizardzines.com/comics/selectors
[15]: https://www.w3.org/TR/CSS2/cascade.html#cascade
[16]: https://wizardzines.com/comics/position-absolute/position-absolute.png
[17]: https://wizardzines.com/comics/position-absolute
[18]: https://wizardzines.com/comics/inline-vs-block/inline-vs-block.png
[19]: https://wizardzines.com/comics/inline-vs-block
