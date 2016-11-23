OneNewLife translating

Apache Vs Nginx Vs Node.js And What It Means About The Performance Of WordPress Vs Ghost
============================================================

 ![Node vs Apache vs Nginx](https://iwf1.com/wordpress/wp-content/uploads/2016/11/Node-vs-Apache-vs-Nginx-730x430.jpg)

Ultimate battle of the giants: can the rising star Node.js prevail against the titans Apache and Nginx?


Just like you, I too have read the various kinds of opinions / facts which are scattered all over the Internet throughout all sorts of sources, some of which I consider reliable, while others, perhaps shady or doubtful.

Many of the sources I read were quite contradicting, ahm – did someone say StackOverflow?[1][2], others showed a clear yet surprising results[3] thus having a crucial role in pushing me towards running my own tests and experiments.

At first, I did some thought experiments thinking I may avoid all the hassle of building and running physical tests of my own – I was drowning deep in those before I even knew it.

Nonetheless, looking backwards on it, it seem that my initial thoughts were quite accurate after all and have been reaffirmed by my tests; a fact which reminds me of what I learned back in school regarding Einstein and his photoelectric effect experiments where he faced a wave–particle duality and initially concluded that the experiments were affected by his state of mind, that is, when he expected the result would be a wave then so it was and vice versa.

That said, I’m pretty sure my results won’t prove to be a duality anytime in the near future, although my own state of mind probably did had an effect, to some extents, on them.

### About The Comparison

One of the sources I read came up with a revolutionary way, in my view, to deal with the natural subjectiveness and personal biases an author may have.

A way which I decided to embrace as-well, thus I declare the following in advance:

Developers spend many years honing their craft. Those who reach higher levels usually make their own choice based on a host of factors. It’s subjective; you’ll promote and defend your technology decision.

That said, the point of this comparison is not to become another “use whatever suits you, buddy” article. I will make recommendations based on my own experience, requirements and biases. You’ll agree with some points and disagree with others; that’s great — your comments will help others make an informed choice.

And thank you to Craig Buckler of [SitePoint][2] for re-enlightening me regarding the purpose of comparisons – a purpose I tend re-forgetting as I’m trying to please all visitors.

### About The Tests

All test were ran locally on an:

*   Intel core i7-2600k machine of 4 cores and 8 threads.
*   **[Gentoo Linux][1]** is the operating system used to run the tests.

The tool used for benchmarking: ApacheBench, Version 2.3 <$Revision: 1748469 $>.

The tests included a series of benchmarks, starting from 1,000 to 10,000 requests and a concurrency of 100 to 1,000 – the results were quite surprising.

In addition, stress test to measure server function under high load was also issued.

As for the content, the main focus was about a static file containing a number of Lorem Ipsum verses with headings and an image.

[
 ![Lorem Ipsum and ApacheBenchmark](http://iwf1.com/wordpress/wp-content/uploads/2016/11/Lorem-Ipsum-and-ApacheBenchmark-730x411.jpg)
][3]

Lorem Ipsum and ApacheBenchmark

The reason I decided to focus on static files is because they remove all sorts of rendering factors that may have an effect on the tests, such as: the speed of a programming language interpreter, how well is an interpreter integrated with the server, etc…

Also, based on my own experience, a substantial part of the average page load time is usually being spent on static content such as images for example, therefore in order to see which server could save us the most of that precious time it seem more realistic to focus on that part.

That aside, I also wanted to test a more real case scenario where I benchmarked each server upon running a dynamic page of different CMSs (more details about that later on).

### The Servers

As I’m running Gentoo Linux, you could say that either one of my HTTP servers is starting from an optimized state to begin with, since I built them using only the use-flags I actually needed. I.e there shouldn’t be any unnecessary code or module loading or running in the background while I ran my tests.

[
 ![Apache vs Nginx vs Node.js use-flags](http://iwf1.com/wordpress/wp-content/uploads/2016/10/Apache-vs-Nginx-vs-Node.js-use-flags-730x241.jpg)
][4]

Apache vs Nginx vs Node.js use-flags

### Apache

`$: curl -i http://localhost/index.html
HTTP/1.1 200 OK
Date: Sun, 30 Oct 2016 15:35:44 GMT
Server: Apache
Last-Modified: Sun, 30 Oct 2016 14:13:36 GMT
ETag: "2cf2-54015b280046d"
Accept-Ranges: bytes
Content-Length: 11506
Cache-Control: max-age=600
Expires: Sun, 30 Oct 2016 15:45:44 GMT
Vary: Accept-Encoding
Content-Type: text/html`

Apache was configured with “event mpm”.

### Nginx

`$: curl -i http://localhost/index.html
HTTP/1.1 200 OK
Server: nginx/1.10.1
Date: Sun, 30 Oct 2016 14:17:30 GMT
Content-Type: text/html
Content-Length: 11506
Last-Modified: Sun, 30 Oct 2016 14:13:36 GMT
Connection: keep-alive
Keep-Alive: timeout=20
ETag: "58160010-2cf2"
Accept-Ranges: bytes`

Nginx included various tweaks, among them: “sendfile on”, “tcp_nopush on” and “tcp_nodelay on”.

### Node.js

`$: curl -i http://127.0.0.1:8080
HTTP/1.1 200 OK
Content-Length: 11506
Etag: 15
Last-Modified: Thu, 27 Oct 2016 14:09:58 GMT
Content-Type: text/html
Date: Sun, 30 Oct 2016 16:39:47 GMT
Connection: keep-alive`

The Node.js server used in the static tests was custom built from scratch, tailor made to be as lightweight and fast as possible – no external modules (outside of Node’s core) were used.

### The Results

Click on the images to enlarge:

[
 ![Apache vs Nginx vs Node: performance under requests load (per 100 concurrent users)](http://iwf1.com/wordpress/wp-content/uploads/2016/11/requests-730x234.jpg)
][5]

Apache vs Nginx vs Node: performance under requests load (per 100 concurrent users)

[
 ![Apache vs Nginx vs Node: performance under concurrent users load](http://iwf1.com/wordpress/wp-content/uploads/2016/11/concurrency-730x234.jpg)
][6]

Apache vs Nginx vs Node: performance under concurrent users load (per 1,000 requests)

### Stress Testing

[
 ![Apache vs Nginx vs Node: time to complete 100,000 requests with concurrency of 1,000](http://iwf1.com/wordpress/wp-content/uploads/2016/11/stress.jpg)
][7]

Apache vs Nginx vs Node: time to complete 100,000 requests with concurrency of 1,000

### What Can We Learn From The Results?

Judging by the results above, it appears that Nginx can complete the highest amount of requests in the least amount of time, in other words, **Nginx** is the fastest HTTP server.

Another thing we can learn, which is quite surprising as a matter of fact, is that Node.js can be faster than Nginx and Apache in some cases, given the right amount of concurrent users and requests.

To those who wonder, the answer is NO, when the number of requests was raised during the concurrency test then Nginx would return to a leading position.

Unlike Apache and Nginx, Node.js, especially clustered Node, seem to be indifferent to the number of concurrent users hitting it. As the chart shows, clustered Node keeps a straight line at around 0.1 seconds while both Apache and Nginx suffer a variation of about 0.2 seconds.

A conclusion that can be drawn based on the above statistics is that the smaller the site is the less it matters which server it uses. However, as the site grows larger audience, the more apparent the impact an HTTP server has.

At the bottom line, when it comes to the raw speed of each server, as it’s depicted by the stress test, my sense is that the most crucial factor behind the performance is not some special algorithm but what it comes down to is actually the programming language each server is running.

As both Apache and Nginx are using C language – which is AOT (Ahead Of Time) compiled language, Node.js on the other hand is using JavaScript – which is an interpreted / JIT (Just In Time) compiled language. This means there’s additional work for the Node.js server on its way to execute a program.

This sense I base not only upon the results above but also upon further results, which you’ll see below, where I got pretty much the same performance parity even when using an optimized Node.js server built with the popular Express framework.

### The Bigger Picture

At the end of the day, an HTTP server is quite useless without the content it serves. Therefore when looking to compare web servers, a vital part we must take into account is the content we wish to run on top of it.

Although other function exists as well, the most widely popular use done with an HTTP server is running a website. Hence, to see the real life implications of each server’s performance I decided to compare WordPress – the most widely used CMS (Content Management System) in the world, with Ghost – a rising star with a gimmick of using JavaScript at its core.

Will a Ghost web-page based on JavaScript alone be able to outperform a WordPress page running on top of PHP and Apache / Nginx?

That’s an interesting question since Ghost has the advantage of using a single, coherent tool for its actions – no additional layers needed, whereas WordPress needs to rely on the integration between Apache / Nginx and PHP, an integration which might incur significant performance drawbacks.

Adding to that, there’s also a significant performance difference between PHP and Node.js in favor of the latter, which I’ll briefly talk about below, things might come out a bit differently than initially seemed.

### PHP Vs Node.js

In order to compare WordPress and Ghost we must first consider an essential component which affects both.

Essentially, WordPress is a PHP based CMS while Ghost is Node.js (JavaScript) based. Unlike PHP, Node.js enjoys the following advantages:

*   Non-blocking I/O
*   Event driven
*   Modern, less legacy code encumbered

Since there are plenty of comparisons out there explaining and demonstrating Node.js raw speed over PHP (including PHP 7) I shall not elaborate further on the subject, Google it, I implore you.

So, given that Node.js outperforms PHP in general, will it be significant enough to make a Node.js website faster than Apache / Nginx with PHP?

### WordPress Vs Ghost

When comparing WordPress to Ghost some would say it’s like comparing apples to oranges and for the most part I’ll agree, as WordPress is a fully fledged CMS while Ghost is basically just a blogging platform at the moment.

However, the two still share many overlapping areas where both can be used to publish thoughts to the world.

Given that premise, how can we compare the 2 while one runs on totally different code base than the other, including themes and core features.

Indeed, a scientific lab-conditioned test would be hard to devise. However, in this comparison I’m interested in a more real life case scenario, where WordPress gets to keep its theme and so does Ghost. Thus, the goal here is to have both platform’s web-pages similar in size as possible and let PHP and Node.js do their magic behind the scenes.

Since the results were measured against different criteria and most importantly not exact same sizes, it wouldn’t be fair to display them side by side in a chart. Hence a table is used instead:

[
 ![Node vs Nginx vs Apache comparison table](http://iwf1.com/wordpress/wp-content/uploads/2016/11/Node-vs-Nginx-vs-Apache-comparison-table-730x185.jpg)
][8]

Node vs Nginx vs Apache running WordPress & Ghost. Top 2 rows are WordPress, bottom 2 are Ghost

As you can see, despite the fact Ghost (Node.js) is loading a smaller sized page (you’d be surprised how much difference can 1kB make) it still remains slower than both WordPress with Nginx and with Apache.

Also, does preempting every Node server hit with Nginx proxy that serves as a load balancer actually contributes or detracts from performance?

Well, according to the table above, if it has any effect at all then it is a detracting one – which is a reasonable outcome as adding another layer should make things slower. However, the numbers above shows it just might be negligible.

But the most important thing the table above shows us is that even though Node.js is faster than PHP, the role an HTTP server has, may surpass the importance of what type of programming language a certain web platform uses.

Of course, on the other hand, if the page loaded was a lot more reliant on server-side script serving, then the results would of wind up a bit different, I suspect.

At the end of it, if a web platform really wants to beat WordPress at its own game, performance-wise that is, the conclusion rising from this comparison is it’ll have to have some sort of customized tool a-la PHP-FPM, that will communicate with JavaScript directly (instead of running it as a server) thus it could fully harness JS power to reach a better performance.


--------------------------------------------------------------------------------

via: https://iwf1.com/apache-vs-nginx-vs-node-js-and-what-it-means-about-the-performance-of-wordpress-vs-ghost/

作者：[Liron][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://iwf1.com/tag/linux
[1]:http://iwf1.com/5-reasons-use-gentoo-linux/
[2]:https://www.sitepoint.com/sitepoint-smackdown-php-vs-node-js/
[3]:http://iwf1.com/wordpress/wp-content/uploads/2016/11/Lorem-Ipsum-and-ApacheBenchmark.jpg
[4]:http://iwf1.com/wordpress/wp-content/uploads/2016/10/Apache-vs-Nginx-vs-Node.js-use-flags.jpg
[5]:http://iwf1.com/wordpress/wp-content/uploads/2016/11/requests.jpg
[6]:http://iwf1.com/wordpress/wp-content/uploads/2016/11/concurrency.jpg
[7]:http://iwf1.com/wordpress/wp-content/uploads/2016/11/stress.jpg
[8]:http://iwf1.com/wordpress/wp-content/uploads/2016/11/Node-vs-Nginx-vs-Apache-comparison-table.jpg
