[#]: collector: (lujun9972)
[#]: translator: (name1e5s)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (When debugging, your attitude matters)
[#]: via: (https://jvns.ca/blog/debugging-attitude-matters/)
[#]: author: (Julia Evans https://jvns.ca/)

When debugging, your attitude matters
======

A while back I wrote [What does debugging a program look like?][1] on what to do when debugging (change one thing at a time! check your assumptions!).

But I was debugging some CSS last week, and I think that post is missing something important: **your attitude**.

Now – I’m not a very good CSS developer yet. I’ve never written CSS professionally and I don’t understand a lot of basic CSS concepts (I think I finally understood for the first time recently how `position: absolute` works). And last week I was working on the most complicated CSS project I’d ever attempted.

While I was debugging my CSS, I noticed myself doing some bad things that I normally would not! I was:

  * making random changes to my code in the hopes that it would work
  * googling a lot of things and trying them without understanding what they did
  * if something broke, reverting my changes and starting again



This strategy was exactly as effective as you might imagine (not very effective!), and it was because of my attitude about CSS! I had this unusual-for-me belief that CSS was Too Hard and impossible for me to understand. So let’s talk about that attitude a bit!

### the problem attitude: “this is too hard for me to understand”

One specific problem I was having was – I had 2 divs stacked on top of one another, and I wanted Div A to be on top of Div B. My model of CSS stacking order at the start of this was basically “if you want Thing A to be on top of Thing B, change the z-index to make it work”. So I changed the z-index of Div A to be 5 or something.

But it didn’t work! In Firefox, div A was on top, but in Chrome, Div B was on top. Argh! Why? CSS is impossible!!!

I googled a bit, and I found out that a possible reason z-index might not work was because Div A and Div B were actually in different “stacking contexts”. If that was true, even if I set the z-index of Div A to 999999 it would still not put it on top of Div B. ([here’s a small example of what this z-index problem looks like, though I think my specific bug had some extra complications][2])

I thought “man, this stacking context thing seems really complicated, why is it different between Firefox and Chrome, I’m not going to be able to figure this out”. So I tried a bunch of random things a bunch of blog posts suggested, which as usual did not work.

Finally I gave up this “change random things and pray” strategy and thought “well, what if I just read the documentation on stacking order, maybe it’s not that bad”.

So I read the [MDN page on stacking order][3], which says:

> When the z-index property is not specified on any element, elements are stacked in the following order (from bottom to top):
>  1\. The background and borders of the root element
>  2\. Descendant non-positioned blocks, in order of appearance in the HTML
>  3\. Descendant positioned elements, in order of appearance in the HTML

This is SO SIMPLE! It just depends on the order in the HTML! I put Div A after Div B in the HTML (as a sibling) and it made everything work in both browsers.

### better attitude: “let’s learn the basics and see if that helps”

This whole stacking problem turned out to really not be that complicated – all I needed to do was read a very short and simple documentation page to understand how stacking works!

Of course, computer things are not always this simple (and even in this specific case the [rules about what creates a new stacking context][4] are pretty complicated.). But I did not need to understand those more complicated rules in order to put Div A on top of Div B! I only needed to know the much simpler 3 rules above.

So – calm down for a second, learn a few of the basics, and see if that helps.

### watching people who know what they’re doing is inspiring

Another area of CSS that I thought was “too hard” for me to understand was this whole `position: absolute` and `position: relative` business. I kept seeing (and sometimes using!) examples where people made complicated CSS things with `position: absolute` but I didn’t understand how they worked. Doesn’t `position: absolute` mean that the element is always in the same place on the screen? Why are these `position: absolute` things moving when I scroll like the rest of the document? (spoiler: no, that’s `position: fixed`.)

But last week, I paired with someone who’s a lot better at CSS than me on some code, and I saw that they were just typing in `position: absolute` and `position: relative` confidently into their code without seeming confused about it!! Could that be me?

I looked up the [documentation on MDN][5] on `position: absolute`, and it said:

> The element is removed from the normal document flow, and no space is created for the element in the page layout. It is positioned relative to its closest positioned ancestor… Its final position is determined by the values of top, right, bottom, and left.

So things with `position: absolute` are positioned relative to their closest positioned ancestor! And you just use `top/bottom/right/left` to pick where! That’s so simple!

### documentation that you can trust makes a big difference

I think another big source of my frustration with CSS is that I didn’t have the best grasp of where to find accurate information &amp; advice. I knew that MDN was a reliable reference, but MDN doesn’t really help answer questions like “ok but seriously how do I center a div???” and I found myself reading a lot of random Stack Overflow answers/blog posts that I wasn’t 100% sure were correct.

This week I learned about [CSS Tricks][6] which has a lot of GREAT articles like [Centering in CSS: A Complete Guide][7] which seems very reputable and is written in a super clear way.

### that’s all!

I don’t really know why I started to believe that it was “impossible” to understand basic CSS concepts since I don’t believe that about computers in general. Maybe because I’ve been writing CSS at a beginner level for a very long time but hadn’t ever really tried to do a more involved CSS project than “let’s arrange some divs in a grid with flexbox”!

But this attitude really got in the way of me writing the CSS I wanted to write! And once I let go of it and used my normal debugging techniques I was able to get a lot more things to work the way I wanted.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/debugging-attitude-matters/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/2019/06/23/a-few-debugging-resources/
[2]: https://codepen.io/jvns-css-fun/pen/YzXMMdQ
[3]: https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index/Stacking_without_z-index
[4]: https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index/The_stacking_context
[5]: https://developer.mozilla.org/en-US/docs/Web/CSS/position
[6]: https://css-tricks.com
[7]: https://css-tricks.com/centering-css-complete-guide/
