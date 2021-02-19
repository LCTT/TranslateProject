[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How I programmed a virtual gift exchange)
[#]: via: (https://opensource.com/article/21/1/open-source-gift-exchange)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

How I programmed a virtual gift exchange
======
A book club takes its annual gift exchange online with the help of HTML,
CSS, and JavaScript.
![Package wrapped with brown paper and red bow][1]

Every year, my wife's book club has a book exchange during the holidays. Due to the need to maintain physical distance in 2020, I created an online gift exchange for them to use during a book club videoconference. Apparently, the virtual book exchange worked out (at least, I received kind compliments from the book club members), so I decided to share this simple little hack.

### How the book exchange usually works

In past years, the exchange has gone something like this:

  1. Each person buys a book and wraps it up.
  2. Everyone arrives at the host's home and puts the wrapped books in a pile.
  3. Each person draws a number out of a hat, which establishes their turn.
  4. The person who drew No. 1 selects a book from the pile and unwraps it. In turn, each subsequent person chooses to either take a wrapped book from the pile or to steal an unwrapped book from someone who has gone before.
  5. When someone's book is stolen, they can either replace it with a wrapped book from the pile or steal another book (but not the one that was stolen from them) from someone else.
  6. And so on… eventually, someone has to take the last unwrapped book to end the exchange.



### Designing the virtual book exchange

My first decision was which implementation platform to use for the book exchange. Because there would already be a browser open to host the videoconference, I decided to use HTML, CSS, and JavaScript.

Then it was design time. After some thinking, I decided to use rectangles to represent the book club members and the books. The books would be draggable, and when one was dropped on a member's rectangle, the book would unwrap (and stay unwrapped). I needed some "wrapping paper," so I used this source of [free-to-use images][2].

I took screenshots of the patterns I liked and used [GIMP][3] to scale the images to the right width and height.

I needed a way to handle draggable and droppable interactions; given that I've been using jQuery and jQuery UI for several years now, I decided to continue along that path.

For a while, I struggled with what a droppable element should do when something was dropped on it. Finally, I realized that all I needed to do was unwrap the dropped item (if it was still wrapped). I also spent some time fretting over how to lay stuff out until I realized that the easiest thing to do was just leave the elements floating.

Jumping to the results, here's a screenshot of the user interface at the beginning of the exchange:

![Virtual book exchange][4]

(Chris Hermansen, [CC BY-SA 4.0][5])

There are nine book club members: Wanda, Carlos, Bill, and so on. There are also nine fairly ugly wrapped parcels.

Let's say Wanda goes first and chooses the flower wrapping paper. The host clicks and drags that parcel to Wanda's name, and the parcel unwraps:

![Virtual book exchange][6]

(Chris Hermansen, [CC BY-SA 4.0][5])

Whoops! That title and author are a bit too long to fit on the book's "cover." Oh well, I'll fix that in the next version.

Carlos is next. He decides he really wants to read that book, so he steals it. Wanda then chooses the paisley pattern, and the screen looks like this:

![Virtual book exchange][7]

(Chris Hermansen, [CC BY-SA 4.0][5])

And so on until the exchange ends.

### The code

So what about the code? Here it is:


```
     1  &lt;!doctype html&gt;
     2  &lt;[html][8] lang="en"&gt;
     3  &lt;[head][9]&gt;
     4    &lt;[meta][10] charset="utf-8"&gt;
     5    &lt;[title][11]&gt;Book Exchange&lt;/[title][11]&gt;
     6    &lt;[link][12] rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css"&gt;
     7    &lt;[style][13]&gt;
     8    .draggable {
     9      float: left;
    10      width: 90px;
    11      height: 90px;
    12      background: #ccc;
    13      padding: 5px;
    14      margin: 5px 5px 5px 0;
    15    }
    16    .droppable {
    17      float: left;
    18      width: 100px;
    19      height: 125px;
    20      background: #999;
    21      color: #fff;
    22      padding: 10px;
    23      margin: 10px 10px 10px 0;
    24    }
    25    &lt;/[style][13]&gt;
    26    &lt;[script][14] src="[https://code.jquery.com/jquery-1.12.4.js"\&gt;\][15]&lt;/[script][14]&gt;
    27    &lt;[script][14] src="[https://code.jquery.com/ui/1.12.1/jquery-ui.js"\&gt;\][16]&lt;/[script][14]&gt;
    28  &lt;/[head][9]&gt;
    29  &lt;[body][17]&gt;
    30  &lt;[h1][18] style="color:#1a1aff;"&gt;Raffles Book Club Remote Gift Exchange&lt;/[h1][18]&gt;
    31  &lt;[h2][19] style="color:#aa0a0a;"&gt;The players, in random order, and the luxurious gifts, wrapped:&lt;/[h2][19]&gt;
    32   
    33  &lt;[div][20]&gt;
    34  &lt;[div][20] id="wanda" class="droppable"&gt;Wanda&lt;/[div][20]&gt;
    35  &lt;[div][20] id="carlos" class="droppable"&gt;Carlos&lt;/[div][20]&gt;
    36  &lt;[div][20] id="bill" class="droppable"&gt;Bill&lt;/[div][20]&gt;
    37  &lt;[div][20] id="arlette" class="droppable"&gt;Arlette&lt;/[div][20]&gt;
    38  &lt;[div][20] id="joanne" class="droppable"&gt;Joanne&lt;/[div][20]&gt;
    39  &lt;[div][20] id="aleks" class="droppable"&gt;Alekx&lt;/[div][20]&gt;
    40  &lt;[div][20] id="ermintrude" class="droppable"&gt;Ermintrude&lt;/[div][20]&gt;
    41  &lt;[div][20] id="walter" class="droppable"&gt;Walter&lt;/[div][20]&gt;
    42  &lt;[div][20] id="hilary" class="droppable"&gt;Hilary&lt;/[div][20]&gt;
    43  &lt;/[div][20]&gt;
    44  &lt;[div][20]&gt;
    45  &lt;[div][20] id="bows" class="draggable" style="background-image: url('bows.png');"&gt;&lt;/[div][20]&gt;
    46  &lt;[div][20] id="boxes" class="draggable" style="background-image: url('boxes.png');"&gt;&lt;/[div][20]&gt;
    47  &lt;[div][20] id="circles" class="draggable" style="background-image: url('circles.png');"&gt;&lt;/[div][20]&gt;
    48  &lt;[div][20] id="gerbers" class="draggable" style="background-image: url('gerbers.png');"&gt;&lt;/[div][20]&gt;
    49  &lt;[div][20] id="hippie" class="draggable" style="background-image: url('hippie.png');"&gt;&lt;/[div][20]&gt;
    50  &lt;[div][20] id="lattice" class="draggable" style="background-image: url('lattice.png');"&gt;&lt;/[div][20]&gt;
    51  &lt;[div][20] id="nautical" class="draggable" style="background-image: url('nautical.png');"&gt;&lt;/[div][20]&gt;
    52  &lt;[div][20] id="splodges" class="draggable" style="background-image: url('splodges.png');"&gt;&lt;/[div][20]&gt;
    53  &lt;[div][20] id="ugly" class="draggable" style="background-image: url('ugly.png');"&gt;&lt;/[div][20]&gt;
    54  &lt;/[div][20]&gt;
    55   
    56  &lt;[script][14]&gt;
    57  var books = {
    58      'bows': 'Untamed by Glennon Doyle',
    59      'boxes': "The Heart's Invisible Furies by John Boyne",
    60      'circles': 'The Great Halifax Explosion by John Bacon',
    61      'gerbers': 'Homes: A Refugee Story by Abu Bakr al Rabeeah, Winnie Yeung',
    62      'hippie': 'Before We Were Yours by Lisa Wingate',
    63      'lattice': "Hamnet and Judith by Maggie O'Farrell",
    64      'nautical': 'Shuggy Bain by Douglas Stewart',
    65      'splodges': 'Magdalena by Wade Davis',
    66      'ugly': 'Funny Boy by Shyam Selvadurai'
    67  };
    68  $( ".droppable" ).droppable({
    69    drop: function(event, ui) {
    70      var element = $(ui.draggable[0]);
    71      var wrapping = element.attr('id');
    72      /* alert( $(this).text() + " got " + wrapping); */
    73      $(ui.draggable[0]).css("background-image","url(book_cover.png)");
    74      $(ui.draggable[0]).text(books[wrapping]);
    75    },
    76    out: function() {
    77      /* alert( $(this).text() + " lost it" ); */
    78    }
    79  });
    80  $( ".draggable" ).draggable();
    81  &lt;/[script][14]&gt;
    82   
    83  &lt;/[body][17]&gt;
    84  &lt;/[html][8]&gt;
```

### Breaking it down

Let's go over this code bit by bit.

  * **Lines 1–6:** Upfront, I have the usual HTML boilerplate, `HTML`, `HEAD`, `META`, `TITLE` elements, followed by a link to the CSS for jQuery UI.
  * **Lines 7–25:** I added two new style classes: `draggable` and `droppable`. These define the layout for the books (draggable) and the people (droppable). Note that, aside from defining the size, background color, padding, and margin, I established that these need to float left. This way, the layout adjusts to the browser window width in a reasonably acceptable form.
  * **Line 26–27:** With the CSS out of the way, it's time for the JavaScript libraries, first jQuery, then jQuery UI.
  * **Lines 29–83:** Now that the `HEAD` element is done, next is the `BODY`:
    * **Lines 30–31:** These couple of titles, `H1` and `H2`, let people know what they're doing here.
    * **Lines 33–43:** A `DIV` to contain the people:
      * **Lines 34–42:** The people are defined as droppable `DIV` elements and given `ID` fields corresponding to their names.
    * **Lines 44–54:** A `DIV` to contain the books:
      * **Lines 45–53:** The books are defined as draggable `DIV` elements. Each element is declared with a background image corresponding to the wrapping paper with no text between the `<div>` and `</div>`. The `ID` fields correspond to the wrapping paper.
    * **Lines 56–81:** These contain JavaScript to make it all work.
      * **Lines 57–67:** This JavaScript object contains the book definitions. The keys (`'bows'`, `'boxes'`, etc.) correspond to the `ID` fields of the book `DIV` elements. The values (`'Untamed by Glennon Doyle',` `"The Heart's Invisible Furies by John Boyne"`, etc.) are the book titles and authors.
      * **Lines 68–79:** This JavaScript jQuery UI function defines the droppable functionality to be attached to HTML elements whose class is `droppable`.
      * **Lines 69–75:** When a `draggable` element is dropped onto a `droppable` element, the function `drop` is called.
        * **Line 70:** The `element` variable is assigned the draggable object that was dropped (this will be a `<div id="..." class="draggable"...></div>` element.
        * **Line 71:** The `wrapping` variable is assigned the value of the `ID` field in the draggable object.
        * **Line 72:** This line is commented out, but while I was learning and testing, calls to `alert()` were useful.
        * **Line 73:** This reassigns the draggable object's background image to a bland image on which text can be read; part 1 of unwrapping is getting rid of the wrapping paper.
        * **Line 74:** This sets the text of the draggable object to the title of the book, looked up in the book's object using the draggable object's ID; part 2 of the unwrapping is showing the book title and author.
      * **Lines 76–78:** For a while, I thought I wanted something to happen when a draggable object was removed from a droppable object (e.g., when a club member stole a book), which would require using the `out` function in a droppable object. Eventually, I decided not to do anything. But, this could note that the book was stolen and make it "unstealable" for one turn; or it could show a status line that says something like: _"Wanda's book Blah Blah by Joe Blogs was stolen, and she needs to choose another."_
      * **Line 80:** This JavaScript jQuery UI function defines the draggable functionality to be attached to HTML elements whose class is `draggable`. In my case, the default behavior was all I needed.



That's it!

### A few last thoughts

Libraries like jQuery and jQuery UI are incredibly helpful when trying to do something complicated in JavaScript. Look at the `$().draggable()` and `$().droppable()` functions, for example:


```
`$( ".draggable" ).draggable();`
```

The `".draggable"` allows associating the `draggable()` function with any HTML element whose class is "draggable." The `draggable()` function comes with all sorts of useful behavior about picking, dragging, and releasing a draggable HTML element.

If you haven't spent much time with jQuery, I really like the book [_jQuery in Action_][21] by Bear Bibeault, Yehuda Katz, and Aurelio De Rosa. Similarly, [_jQuery UI in Action_][22] by TJ VanToll is a great help with the jQuery UI (where draggable and droppable come from).

Of course, there are many other JavaScript libraries, frameworks, and what-nots around to do good stuff in the user interface. I haven't really started to explore all that jQuery and jQuery UI offer, and I want to play around with the rest to see what can be done.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/open-source-gift-exchange

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brown-package-red-bow.jpg?itok=oxZYQzH- (Package wrapped with brown paper and red bow)
[2]: https://all-free-download.com/free-vector/patterns-creative-commons.html#google_vignette
[3]: https://opensource.com/tags/gimp
[4]: https://opensource.com/sites/default/files/uploads/bookexchangestart.png (Virtual book exchange)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/bookexchangeperson1.png (Virtual book exchange)
[7]: https://opensource.com/sites/default/files/uploads/bookexchangeperson2.png (Virtual book exchange)
[8]: http://december.com/html/4/element/html.html
[9]: http://december.com/html/4/element/head.html
[10]: http://december.com/html/4/element/meta.html
[11]: http://december.com/html/4/element/title.html
[12]: http://december.com/html/4/element/link.html
[13]: http://december.com/html/4/element/style.html
[14]: http://december.com/html/4/element/script.html
[15]: https://code.jquery.com/jquery-1.12.4.js"\>\
[16]: https://code.jquery.com/ui/1.12.1/jquery-ui.js"\>\
[17]: http://december.com/html/4/element/body.html
[18]: http://december.com/html/4/element/h1.html
[19]: http://december.com/html/4/element/h2.html
[20]: http://december.com/html/4/element/div.html
[21]: https://www.manning.com/books/jquery-in-action-third-edition
[22]: https://www.manning.com/books/jquery-ui-in-action
