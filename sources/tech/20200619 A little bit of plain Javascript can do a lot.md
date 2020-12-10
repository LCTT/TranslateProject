[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A little bit of plain Javascript can do a lot)
[#]: via: (https://jvns.ca/blog/2020/06/19/a-little-bit-of-plain-javascript-can-do-a-lot/)
[#]: author: (Julia Evans https://jvns.ca/)

A little bit of plain Javascript can do a lot
======

I’ve never worked as a professional frontend developer, so even though I’ve been writing HTML/CSS/JS for 15 years for little side projects, all of the projects have been pretty small, sometimes I don’t write any Javascript for years in between, and I often don’t quite feel like I know what I’m doing.

Partly because of that, I’ve leaned on libraries a lot! Ten years ago I used to use jQuery, and since maybe 2017 I’ve been using a lot of vue.js for my little Javascript projects (you can see a [little whack-a-mole game I made here as an intro to Vue][1]).

But last week, for the first time in a while, I wrote some plain Javascript without a library and it was fun so I wanted to talk about it a bit!

### experimenting with just plain Javascript

I really like Vue. But last week when I started building <https://questions.wizardzines.com>, I had slightly different constraints than usual – I wanted to use the same HTML to generate both a PDF (with [Prince][2]) and to make an interactive version of the questions.

I couldn’t really see how that would work with Vue (because Vue wants to create all the HTML itself), and because it was a small project I decided to try writing it in plain Javascript with no libraries – just write some HTML/CSS and add a single `<script src="js/script.js"> </script>`.

I hadn’t done this in a while, and I learned a few things along the way that made it easier than I thought it would be when I started.

### do almost everything by adding &amp; removing CSS classes

I decided to implement almost all of the UI by just adding &amp; removing CSS classes, and using [CSS transitions][3] if I want to animate a transition.

here’s a small example, where clicking the “next” question button adds the “done” class to the parent div.

```
div.querySelector('.next-question').onclick = function () {
    show_next_row();
    this.parentElement.parentElement.classList.add('done');
}
```

This worked pretty well. My CSS as always is a bit of a mess but it felt manageable.

### add/remove CSS classes with `.classList`

I started out by editing the classes like this: `x.className = 'new list of classes'`. That felt a bit messy though and I wondered if there was a better way. And there was!

You can also add CSS classes like this:

```
let x = document.querySelector('div');
x.classList.add('hi');
x.classList.remove('hi');
```

`element.classList.remove('hi')` is way cleaner than what I was doing before.

### find elements with `document.querySelectorAll`

When I started learning jQuery I remember thinking that if you wanted to easily find something in the DOM you had to use jQuery (like `$('.class')`). I just learned this week that you can actually write `document.querySelectorAll('.some-class')` instead, and then you don’t need to depend on any library!

I got curious about when `querySelectorAll` was introduced. I Googled a tiny bit and it looks like the [Selectors API was built sometime between 2008 and 2013 – I found a [post from the jQuery author discussing the proposed implementation in 2008][4], and [a blog post from 2011][5] saying it was in all major browsers by then, so maybe it didn’t exist when I started using jQuery but it’s definitely been around for quite a while :)

### set `.innerHTML`

In one place I wanted to change a button’s HTML contents. Creating DOM elements with `document.createElement` is pretty annoying, so I tried to do that as little as possible and instead set `.innerHTML` to the HTML string I wanted:

```
button.innerHTML = `<i class="icon-lightbulb"></i>I learned something!
<object data="/confetti.svg" width="30" height = "30"> </object>
`;
```

### scroll through the page with `.scrollIntoView`

The last fun thing I learned about is `.scrollIntoView` – I wanted to scroll down to the next question automatically when someone clicked “next question”. Turns out this is just one line of code:

```
row.classList.add('revealed');
row.scrollIntoView({behavior: 'smooth', block: 'center'});
```

### another vanilla JS example: peekobot

Another small example of a plain JS library I thought was nice is [peekobot][6], which is a little chatbot interface that’s 100 lines of JS/CSS.

Looking at [its Javascript][7], it uses some similar patterns – a lot of `.classList.add`, some adding elements to the DOM, some `.querySelectorAll`.

I learned from reading peekobot’s source about [.closest][8] which finds the closest ancestor that matches a given selector. That seems like it would be a nice way to get rid of some of the `.parentElement.parentElement` that I was writing in my Javascript, which felt a bit fragile.

### plain Javascript can do a lot!

I was pretty surprised by how much I could get done with just plain JS. I ended up writing about 50 lines of JS to do everything I wanted to do, plus a bit extra to collect some anonymous metrics about what folks were learning.

As usual with my frontend posts, this isn’t meant to be Serious Frontend Engineering Advice – my goal is to be able to write little websites with less than 200 lines of Javascript that mostly work. If you are also flailing around in frontend land I hope this helps a bit!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/06/19/a-little-bit-of-plain-javascript-can-do-a-lot/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/2017/06/26/vue-js-fun/
[2]: https://www.princexml.com/
[3]: https://3dtransforms.desandro.com/card-flip
[4]: https://johnresig.com/blog/thoughts-on-queryselectorall/
[5]: https://tiffanybbrown.com/2011/08/12/meet-the-selectors-api/
[6]: https://peekobot.github.io/peekobot/
[7]: https://github.com/Peekobot/peekobot/blob/master/peekobot.js
[8]: https://developer.mozilla.org/en-US/docs/Web/API/Element/closest
