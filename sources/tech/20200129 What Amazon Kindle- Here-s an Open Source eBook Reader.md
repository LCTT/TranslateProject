[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What Amazon Kindle? Here’s an Open Source eBook Reader)
[#]: via: (https://itsfoss.com/open-book/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

What Amazon Kindle? Here’s an Open Source eBook Reader
======

When it comes to an eBook reader, the choices are limited. The market is dominated by [Amazon's proprietary Kindle][1] along with a few other options like Kobo, Nook and Onyx.

An interesting news for open source enthusiasts is that a developer, [Joey Castillo][2], is working on creating an open source eBook reader appropriately named Open Book.

### Open Book: An open source eBook reader

![][3]

The [Open Book][4] aims to be a simple ‘open’ device that “anyone with a soldering iron can build for themselves”.

It’s hackable so if you are into DIY stuff and you have some knowledge, you may tweak it to your liking. For example, Joey use [TensorFlow Lite][5] to give voice commands for flipping the pages on Open Book. You can do things like this on your own on this open hardware device.

> Voice commands on the [#OpenBook][6] with [#TensorFlowLite][7]. When I added a mic amp for voice, I considered this a “someday” feature; I didn’t imagine one could hack it together in an evening! Major credit to [@adafruit][8]; their TFL Arduino port makes this possible. <https://t.co/ix5UK03F3o> [pic.twitter.com/PfXZx99A9y][9]
>
> — joey castillo (@josecastillo) [December 13, 2019][10]

If that kind of scares you because you are not really into tinkering with hardware, I have a good news for you. Open Book was named winner of [Hackaday’s Take Flight with Feather contest][11]!

This means that when the hardware is ready, you should be able to purchase it from [DigiKey][12]. You should be able to fit the device as an eBook reader or experiment with it, if you feel like doing it.

It kind of reminds me of [Game Shell][13], a single board computer based retro gaming console that could be tinkered into many other things.

### Open Book specifications

![][14]

There are two versions of Open Book: Open Book Feather and E-Book Feather Wing. The eBook wing does less than the Open Book Feather, mainly because it’s limited to using only the pins available via the Feather header.

You may guess from the name that the project uses [Adafruit’s Feather development boards][15].

Here are the main specifications for the Open Book (both versions):

  * 4.2 inch, 400 x 300 pixel ePaper display
  * SAMD51 ARM Cortex-M4 32-bit processor
  * 7 buttons for navigation (directional pad, select button and page turn buttons)
  * status LED lights
  * A microSD card reader
  * Headphone jack



The display seems a bit small, isn’t it?

### Open Book release, pricing and availability

![][16]

Open Book is the winner of [Take Flight with Feather competition by Hackaday][11]. This means that at least 100 Open Book boards will be manufactured and made available for purchase.

[Liliputing][17] noted that [Adafruit][18] will be handling the manufacturing, and [Digi-Key][19] will eventually be selling Open Book boards.

At this point, it’s not clear how much will it cost and exactly when it will be available.

Remember that it’s an open source project. You can find all the circuit designs, source code on its GitHub page and if you have the skills, get the required hardware components and build an Open Book on your own.

[Open Book on GitHub][4]

Otherwise, wait for a couple of months (hopefully) for the release of the Open Book boards and then go about experimenting with the device.

If you like the project and want to support it, you can help [Joey on Pateron][20]. You can follow the updates on the Open Book on the Patreon page, [Joey’s mailing list][21] or Joey’s [Twitter account][2].

_Do you think the project has potential? Would you buy one when it is available? What do you think of it?_

--------------------------------------------------------------------------------

via: https://itsfoss.com/open-book/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.amazon.com/dp/B07DLPWYB7?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Amazon's proprietary Kindle)
[2]: https://twitter.com/josecastillo
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/open-book-under-development-feature.jpeg?ssl=1
[4]: https://github.com/joeycastillo/The-Open-Book
[5]: https://www.tensorflow.org/lite
[6]: https://twitter.com/hashtag/OpenBook?src=hash&ref_src=twsrc%5Etfw
[7]: https://twitter.com/hashtag/TensorFlowLite?src=hash&ref_src=twsrc%5Etfw
[8]: https://twitter.com/adafruit?ref_src=twsrc%5Etfw
[9]: https://t.co/PfXZx99A9y
[10]: https://twitter.com/josecastillo/status/1205549284403355648?ref_src=twsrc%5Etfw
[11]: https://hackaday.io/contest/168107-take-flight-with-feather
[12]: https://www.digikey.com/
[13]: https://itsfoss.com/gameshell-console/
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/open-book-board.jpg?ssl=1
[15]: https://www.adafruit.com/feather
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/open-book-demo.jpeg?ssl=1
[17]: https://liliputing.com/2020/01/the-open-book-ereader-will-be-a-real-thing-you-can-buy-eventually.html
[18]: https://www.adafruit.com/
[19]: https://www.digikey.com/en/resources/beta-1
[20]: https://www.patreon.com/joeycastillo
[21]: http://eepurl.com/gKOpQ9
