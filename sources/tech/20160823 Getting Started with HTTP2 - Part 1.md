Getting Started with HTTP/2: Part 1
============================================================
 ![](https://static.viget.com/_284x284_crop_center-center/http2-pizza.png?mtime=20160822160641) 

Using pizza to show how HTTP/2 beats HTTP/1.1 when your orders get too big.

_HTTP/2 has some really amazing changes to the way web sites and applications can be built. A year and a half after becoming published, almost [10% of websites support HTTP/2][4]. It has definitely had notable adoption, but the conversation should be pushed further for front-end developers on best practices when using HTTP/2\. This is a multi-part blog post to give front-end developers a guide on how to switch over to HTTP/2. _

_This post covers how HTTP/2 is an improvement to HTTP/1.1 and what that may look like to front-end developers._

### Remind me what HTTP is again...

Hyper Text Transfer Protocol, better known as HTTP, is the protocol that determines how content is transferred over the web. When HTTP/1.1 was standardized in 1999, the web was a very different place than it is today. Tables were king. Styles were usually done inline at the element level, or if the webmaster was more refined, they would put it in a `<style>` tag in the head. JavaScript, if used, was also placed on the document and full sites were generally no larger than a handful of pages.

HTTP/1.1 assumed that this was going to last for a while, so it did not put too much focus on allowing for many assets to be loaded with a site, since that wasn't really a thing developers needed. Therefore it had an extremely simple way of handling assets - you ask for an asset and the server looks for it and either returns what you asked for or it tells you the asset could not be found. This is called "head-of-line blocking" and it is fairly efficient, but when you have mulitple assets, this process happens for every asset in succession. This means that before you can even ask for your second asset, the server has to find your first one and load it or tell you it could not be found.

### The Growth of the Large-Scale Site

In the years that followed 1999, sites became much more complex, with the rise of php and other dynamic languages like Rails. CSS files grew much larger with the shift to responsive development, and thusly CSS compilers like Sass popped up to create a simpler working environment. JavaScript also became a much bigger player on the web, allowing for developers to make complex applications that were once only the work of C++ developers. Images also became much more defined, with the rise of Retina and HD monitors. With these changes, file sizes grew exponentially, so waiting for a few bytes worth of assets to load became kilobytes, even megabytes in some cases. And when you have several hundred kilobytes to load before you can even start loading something else on the page, you just have to optimistically assume that your users have fast internet.

Think of HTTP/1.1 as a quaint, order-at-the-counter neighborhood pizza place. You can show up by yourself and order a Sprite and 2 slices of Angry Hawaiian and be on your way in 3 minutes. They can handle that easily, in fact it's the business model they thrive on - just quick drop-ins with simple orders.

 ![](https://static.viget.com/_300xAUTO_crop_center-center/http2-pizzaorder1.png?mtime=20160823122331) 

However, once you decide to host the little league season awards ceremony at the same pizza place things get more complicated. With everyone ordering different things, it gets disorganized quickly and the wait times go up.

 ![](https://static.viget.com/_300xAUTO_crop_center-center/http2-pizzaorder2.png?mtime=20160823130750) 

### Where HTTP/2 Comes into Play

The major promise of HTTP/2 for a front-end developer is multiplexing. Multiplexing means that asset requests can happen at the same time and the server can then go find those assets. There's no wait time between requests because they all happen at once.

Using the same metaphor, HTTP/2 allows for the pizza place to set the party to its own area in the restaurant, send out a waiter to take orders and bring everything out as it becomes ready. There's no need to wait 30 minutes for your Sprite while everyone else's pizzas cook, so that comes out as one of the first items. This method makes it much easier to manage lots of orders and prevents people from waiting too long to start getting their orders.

The big change multiplexing seems to bring to web development is a change in the way we prepare files to be loaded. A really helpful method for getting around the HTTP/1.1 bottleneck of asset loading is through concatenating and minifying files to be loaded at once. All task runners do this either by default or with very little configuration. Often times too, developers will place their images in sprite sheets, which also cut down on the amount of requests to a server.

### Improvements over HTTP/1.1

Concatenating files was a really smart way to handle the problems of HTTP/1.1's request limits, but the major problem with concatenating your files is that it requires users to download all the assets for the entire site upon first visit. The browser will cache all the assets once they load, which is good and speeds up every following page the user visits, but having a heavy load upfront [is bad for bounce rates][5]. Also they are probably loading assets for pages they won't even visit. Expecting a user to visit every single page to see every style and interact with every script is unrealistic. Furthermore, in places like Canada and Europe and pretty much every US mobile provider, there is a monthly bandwidth cap. Not that loading 54 extra kilobytes of content is going to push someone over the edge for their monthly data allowance, but let's assume that the user wants to reserve those extra bytes for Taylor Swift reaction gifs.

With HTTP/2 and multiplexing, you can run some of the most efficient sites but it will require some rethinking, and even undoing, of previous best practices. Again, my intent is to speed up the conversation on HTTP/2 so we can discover these new best practices with the new tools we have.

In my next post [I'll explore some of the best ways to handle a site built on HTTP/2][6].


--------------------------------------------------------------------------------

via: https://www.viget.com/articles/getting-started-with-http-2-part-1?imm_mid=0eb24a&cmp=em-web-na-na-newsltr_20161130

作者：[Ben][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.viget.com/about/team/btinsley
[1]:https://twitter.com/home?status=Using%20pizza%20to%20show%20how%20HTTP%2F2%20beats%20HTTP%2F1.1%20when%20your%20orders%20get%20too%20big.%20https%3A%2F%2Fwww.viget.com%2Farticles%2Fgetting-started-with-http-2-part-1
[2]:https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.viget.com%2Farticles%2Fgetting-started-with-http-2-part-1
[3]:http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.viget.com%2Farticles%2Fgetting-started-with-http-2-part-1
[4]:https://w3techs.com/technologies/details/ce-http2/all/all
[5]:https://blog.kissmetrics.com/speed-is-a-killer/
[6]:https://www.viget.com/articles/getting-started-with-http-2-part-2
[7]:https://www.viget.com/about/team/btinsley
