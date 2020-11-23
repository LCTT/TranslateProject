[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (New zine: Hell Yes! CSS!)
[#]: via: (https://jvns.ca/blog/2020/11/22/new-zine--hell-yes--css-/)
[#]: author: (Julia Evans https://jvns.ca/)

New zine: Hell Yes! CSS!
======

Hello! Last Friday I released a new zine called Hell Yes! CSS!

You can get it for $12 here: <https://wizardzines.com/zines/css>, or get a [9-pack of all my zines here][1] for $88.

Here’s the cover and table of contents:

[![][2]][3] <https://jvns.ca/images/css-toc.png>

### why CSS?

I’ve been writing CSS on and off (mostly off) for about 15 years. For almost all of that time, CSS really felt impossible to me – every time I did a seemingly simple task (like the classic “center a div”), I had to Google how to do it, then it wouldn’t work the way I expected, than I’d change random things, and eventually the thing would kind of sort of work. Then I’d never really internalize what I’d learned and I’d start again from scratch the next time. I didn’t write CSS very often, and because it seemed “impossible”, I never put the effort in to get better.

### there’s a better way

But this year, I learned a different way to approach CSS. I’d hired [Melody Starling][4] to design &amp; implement <https://wizardzines.com> for me. In addition to being a great designer, I saw that their approach to writing CSS was COMPLETELY DIFFERENT from mine.

They:

  * didn’t Google basic CSS facts, if they needed to center something they would just center it
  * could do things that I thought were “impossible” (like using position: absolute) quickly and have them work the first thing
  * debugged CSS issues quickly &amp; seemed to clearly understand why the changes they made fixed the problem. They never made random changes.



Of course, a lot of this comes from their extensive experience writing CSS and I couldn’t just magically import their experience into my brain. But I realized something important.

### CSS isn’t arbitrary, it’s just counterintuitive sometimes

Here’s one example. For my first 13 years of occasionally writing CSS poorly, I didn’t understand how `position: absolute` worked. I thought it positioned things absolutely on the page (isn’t that what the absolute means??), but sometimes I’d see things that made that seem wrong, so I was just confused and sad about it.

But then I learned something that changed everything for me: `position: absolute` actually positions elements relatively to the closest positioned parent.

Here’s a codepen that shows an example of what I mean. It shows how to position 4 stars at the 4 corners of a box (it’s actually very easy!!) <https://codepen.io/wizardzines/pen/ZEOzqaN>

Actually taking the time to understand how `position: absolute` worked didn’t take that long (I just needed to learn 1 fact!!) and it meant that now I no longer have to blindly copy paste CSS to absolutely position things. I can figure them out myself, and I’m a lot more faster and confident.

### learning some CSS fundamentals can help a lot

Hell yes! CSS! explains some of the CSS fundamentals that have helped me get more WAY more confident with CSS this year. Since I learned them, I’ve been able to quickly make a lot of fun small websites with confidence, and CSS bugs have been a lot more tractable. I’ve been able to actually reason through a lot of my CSS problems – no more throwing spaghetti at the wall and hoping my website eventually looks the way I want! (ok, let’s be honest, there’s still a little of that, but it’s been WAY BETTER).

### and so does having the right attitude

The other thing Hell Yes! CSS! talks about a little bit is attitude! CSS can absolutely be difficult and frustrating. But did you know that if you write standards-compliant CSS, then browser backwards compatibility will ensure that your website keeps working FOREVER?!

So if you spend the effort to get your CSS right once, it’ll keep looking great for the next 10 years. I’ve changed my attitude towards CSS from “UGH WHY! CSS BAD! I AM SAD!” to “oh, interesting! Why doesn’t this work? I can probably figure it out!” and it’s helped a LOT.

So that’s what this zine is about!

### I also put together some CSS examples

The zine has a lot of counterintuitive CSS facts, and I know from experience that it’s very difficult to learn hard things just by reading some text – I always need to play around with some actual real CSS to understand how it works.

So I built [CSS examples][5] (<https://css-examples.wizardzines.com/>) to help with this a little bit. It has about 20 examples illustrating various CSS facts. Some of them are relatively straightforward (like the one on [border-radius][6]), and some of them are pretty surprising and confusing at first, like this one on how [left: 0; right: 0 is different from width: 100%;][7] and this super weird thing about how [inline-block elements are aligned differently depending on whether they have text in them][8].

You can edit them all using the amazing <https://codepen.io/> (click “Edit on Codepen”), and a lot of them have specific suggestions for changes to try to understand how the example works better.

### what’s next: a zine on bash scripting!

I have a zine on bash scripting called Bite Size Bash almost finished, and I’m going to release it pretty soon.

Another idea I have for the future is to put together a bunch of “CSS [études][9]” – basically “here’s a design, implement this in CSS”. If this already exists, I’d love to know about it!

Here’s a link to where to [get Hell Yes! CSS!][3] again :). As usual if you’re in a country where $12 USD is a lot of money, I have some country-specific discounts – if you click the link you should see them.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/11/22/new-zine--hell-yes--css-/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://wizardzines.com/zines/all-the-zines/
[2]: https://jvns.ca/images/css-cover.png
[3]: https://wizardzines.com/zines/css
[4]: https://melody.dev
[5]: https://css-examples.wizardzines.com/
[6]: https://css-examples.wizardzines.com/#different-border-radius
[7]: https://css-examples.wizardzines.com/#left-right-vs-width
[8]: https://css-examples.wizardzines.com/#inline-block-text
[9]: https://en.wikipedia.org/wiki/%C3%89tude
