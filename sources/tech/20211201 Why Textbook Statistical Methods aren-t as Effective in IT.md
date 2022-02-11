[#]: subject: "Why Textbook Statistical Methods aren't as Effective in IT"
[#]: via: "https://theartofmachinery.com/2021/12/01/textbook_stats_and_tech.html"
[#]: author: "Simon Arneaud https://theartofmachinery.com"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Why Textbook Statistical Methods aren't as Effective in IT
======

If you work with tech, there’s a good chance you’ve come across some of the following statistical tools:

  * Averages
  * Standard deviations
  * t-tests
  * Least-squares line of best fit



These are the most common tools in a kit that’s typically taught in undergraduate statistics classes and widely used in the outside world. However, this toolkit just isn’t that effective in most IT applications (such as analysing performance benchmarks). Fortunately, there are other tools that do work well. They’re normally taught in “advanced” statistics classes, but I think some of them should become the standard toolkit for tech work (and possibly elsewhere).

In this post I want to talk a bit about why the usual toolkit doesn’t work well. First, let me give an example.

### A password timing attack

Here’s a minimal Python web app. It takes HTTP `POST` requests and checks the body data for a super-secret password:

```

    from http.server import SimpleHTTPRequestHandler, HTTPServer
    from http import HTTPStatus

    class Handler(SimpleHTTPRequestHandler):
      def do_POST(self):
        body_len = int(self.headers.get('content-length', 0))
        body = self.rfile.read(body_len)
        if body.rstrip() == b'hunter2':
          self.response(HTTPStatus.OK, b'OK\n')
        else:
          self.response(HTTPStatus.FORBIDDEN, b'ACCESS DENIED\n')

      def response(self, status, content):
        self.send_response(status)
        self.send_header('Content-Type', 'text/plain')
        self.send_header('Content-Length', len(content))
        self.end_headers()
        self.wfile.write(content)


    with HTTPServer(('', 8080), Handler) as s:
      s.serve_forever()

```

If I run it in one terminal with `python3 server.py`, I can send it `POST` requests with [`httpie`][1] in another:

```

    $ echo asdf | http post :8080
    HTTP/1.0 403 Forbidden
    Content-Length: 14
    Content-Type: text/plain
    Date: Sun, 28 Nov 2021 04:40:47 GMT
    Server: SimpleHTTP/0.6 Python/3.7.3

    ACCESS DENIED
    $ echo hunter2 | http post :8080
    HTTP/1.0 200 OK
    Content-Length: 3
    Content-Type: text/plain
    Date: Sun, 28 Nov 2021 04:43:06 GMT
    Server: SimpleHTTP/0.6 Python/3.7.3

    OK

```

I’ve written the server app in a non-smart way that contains a famous timing vulnerability in the way it checks the password. The standard string comparison in typical programming languages is written to be as fast as possible. That’s bad in this case because “as fast as possible” depends on how closely the user input matches the password. E.g., if you send `hunter3`, the server will check the first six characters and only return `ACCESS DENIED` when it sees that the last character doesn’t match the password. That makes the response to `hunter3` slightly slower than the response to something completely wrong like `nope`. By making several guesses and carefully watching how the response time varies, an attacker can home in on the real password in a game of hotter-colder. At least, that’s the theory. Modern gigahertz-range computers can count to seven much faster than an HTTP request can travel through a network link, and the variability of network delays would be orders of magnitude larger than the variation in string comparison timing. Not only that, the string comparison is implemented in compiled C, but the rest of the web server is in interpreted Python (a garbage-collected language, at that). Is the timing attack even feasible?

Here’s some stupid D code that collects some timing data. It simply sends a canned HTTP request over and over, measuring the time between the `send()` and the end of `receive()`ing the response. The output is in nanoseconds, but it really has 100ns accuracy. It would be smarter to measure timing of packets entering/leaving the network stack in the kernel, which would avoid some of the timing noise from context switching, etc., in user space. Plenty of noise makes the game more fun, though.

```

    import std.array : join;
    import std.conv : to;
    import std.datetime.stopwatch;
    import std.socket;
    import std.stdio;

    int main(string[] args)
    {
      if (args.length != 3)
      {
        writeln("Usage: client HOST PORT PASSWORD");
        return 1;
      }
      const host = args[1];
      const port_s = args[2];
      const guess = args[3];
      const req = [
        "POST / HTTP/1.1",
        "Host: " ~ host ~ ":" ~ port_s,
        "User-Agent: test client",
        "Accept: */*",
        "Content-Length: " ~ guess.length.to!string,
        "Content-Type: text/plain",
        "Connection: close",
        "",
        guess
      ].join("\r\n");

      StopWatch sw;
      ubyte[1024] buf;
      while (true)
      {
        auto sock = new TcpSocket(new InternetAddress(host, port_s.to!ushort));
        scope (exit) sock.close();
        sw.start();
        sock.send(req);
        while (sock.receive(buf) > 0) {}
        sw.stop();
        writeln(sw.peek.total!"nsecs");
        stdout.flush();
        sw.reset();
      }
    }

```

I ran the Python server on my phone, connected to my home wireless network router. Then I ran the above client code on a laptop, on the same network. I.e., the link was laptop -&gt; wireless router -&gt; phone. I ran two client instances simultaneously: one guessing password `xxxxxxx` and one guessing password `hxxxxxx`. Each instance collected half a million samples, for a total of a million response time measurements, which I loaded up into the [PSPP stats program][2].

The starting-with-`h` group of measurements should tend to be slightly slower than the starting-with-`x` group of measurements because the password starts with `h`. A real attacker wouldn’t know that, and would want to apply some statistical test to see whether one of the measurement groups were faster than the other. (They could be the same if the real password started with a different letter altogether, such as `p`.) Most science students are taught to use a Student t-test to check if there’s any statistically significant difference between two groups of measurements. Here’s what a t-test tells us here:

First, we get the descriptive stats for the groups. The t-test works by calculating the mean (average) and variance of each group, and calculating how plausibly the gap between the means could be explained just by the variance in the values.

| x | h
---|---|---
N | 500000 | 500000
Mean | 223428773.12 | 223472937.97
S.E. of mean | 197782.37 | 197775.67

This already don’t look too good. The mean for the `h` group happens to be slightly larger than that of the `x` group, but the standard error of the mean calculation is much bigger than that difference. The t-test clinches it:

t | -.16
---|---
2-tailed p for equality of mean | .875
Mean diff. 95% CI lower bound | -592370.91
Mean diff. 95% CI upperbound | 504041.22

The `p` value is .875. If your stats is rusty: that’s the probability of seeing something like this (or more surprising) by chance in a world in which there’s no real difference. Normally we’d want the value to be very low (e.g., less than 0.05 or some other threshold) so we can say the difference is unlikely to be a fluke. As an alternative to the `p` value, we can look at the 95% confidence interval for the difference in means. The number zero is within that range, meaning zero statistical difference in mean is completely plausible. Either way, overall, everything is within the range of random chance variation. For all the attacker could know, the `xxxxxxx` and `hxxxxxx` guesses could be equally wrong. That is, assuming the attacker relies on the t-test.

If you’ve read my older post on [the (lack of) effect of `const` on C/C++ performance][3], you might remember I used a Mann-Whitney U test to detect a tiny performance difference. Next I’ll do a U-test on this dataset, too.

Instead of averaging the measurement values themselves, the U test works with their _ranks_. I.e., all the data values are pooled together and sorted, and the lowest value gets rank 1, and the second lowest value gets rank 2, and so on. Here are the summary stats:

| x | h
---|---|---
N | 500000 | 500000
Mean rank | 498931.87 | 501069.13

The `x` group has lower average rank, as you’d expect if it tended to be faster. Is the difference statistically significant?

U | 124465682654.00
---|---
Z | -3.70
2-tailed p value | &lt;0.001

Yep. In fact, this time the `p` value is too small for PSPP to show. The t-test couldn’t detect a difference with 1M samples, but with the U-test, 1M samples is complete overkill.

### The problem with the textbook stats toolkit

There’s a whole lot more analysis that could be done with that dataset (e.g., comparing convergence of various stats like the mean, median and minimum), but for this post I’ll stick to answering the original question. What’s wrong with the “textbook” statistical toolkit? There are specific problems in specific applications, but the most fundamental problem is that it effectively assumes you’re analysing something linear. (I.e., that you can just divide values up however you like, look at the components independently, and simply add up the results.)

For example, suppose you’re looking at response times to clicks on interactive webpages. A page that consistently responds in &lt;100ms feels nicer to use than one that usually takes 10ms but sometimes takes 500ms — even if those pages have the same average response time. The average isn’t useful because our subjective experience of delays isn’t linear. If a page responds in 10ms already, then making it 80ms slower doesn’t make a very noticeable difference because our engagement with the page distracts us from delays faster than about 100ms. If the page response is 200ms, anything that slows it down makes it noticeably more annoying. On the other hand, if it takes &gt;1s, an extra 80ms isn’t noticeable again because our minds have wandered and we’re paying attention to something else. You can’t just add delays however you like and expect them to have a consistent marginal annoyance effect. But the average is calculated by adding up all the values, so it’s only meaningful if adding up delays is meaningful in the first place. That’s why percentile distributions are far more useful in this scenario.

As another example, suppose you have a web app that talks to another API server. Each request to the app depends on several API calls. If the API calls are done in parallel, the overall app response time will depend on the slowest API call response time. Again, this is a non-linear effect. Knowing the average API call time won’t tell you much about the web app response time because adding up the delays from the API is meaningless. The ranking of delays from the API is what matters, which is why percentiles are more useful.

Computer systems have many other sources of non-linearity. A cache might store up to 128 entries; a buffer might get flushed whenever it fills up; access time might depend on locality with earlier accesses; CPU usage might be throttled to half a core; a system might hit several different bottlenecks as load varies.

A common assumption in textbook stats is that errors have a Gaussian (normal, a.k.a. bell curve) distribution. If your system is linear, and a large number of unknowns contribute independently to the error, the total error will be approximately Gaussian thanks to the [central limit theorem][4]. However, if your system is highly non-linear (like most computer systems), all bets are off.

A related common assumption is homoscedasticity of errors — i.e., that the error has about the same size whether you’re measuring a small value or large one or whatever. Again, this is true by definition if your errors add linearly to your measurement, otherwise not.

### Robustness wins

I remember doing my first practical statistics assignment as an undergraduate. It used real-world data that was pretty messy, just like real-world data typically is. I figured that the first step was to “clean up” the data to make it fit the tools I was using. Eventually I learned that you can’t simply “clean up” the data. You can sometimes improve it a bit, but most of the time you get diminishing returns and end up just adding your own bias to the dataset.

Later I got taught about so-called robust statistical methods. These were actually taught as a kind of optional extra, as an alternative for when the more traditional toolkit doesn’t work. They were presented in terms of a tradeoff: The robust tools are less likely to be fooled by bad data, but to do that they have to make weaker, more conservative assumptions that don’t let them converge as quickly as the traditional tools. I.e., a t-test might detect a difference when a U-test doesn’t have enough data (theoretically, the t-test is more “statistically powerful”).

In theory that tradeoff is true. However, working as an engineer since then I’ve come to think that robustness wins. A tool that’s always approximately right is more useful than one that’s one-part-in-a-million accurate under ideal conditions. Traditional statistical tools might converge faster when your dataset matches all the assumptions in the fine print, but in practice your dataset probably doesn’t. Inaccurate assumptions can hurt more than they help. That’s why robust techniques are frequently more powerful in practice, as we just saw in the password timing attack above.

By the way, theorists often divide statistics into “parametric” and “non-parametric” categories. “Non-parametric” doesn’t mean the same thing as “robust”, but if you’re researching this stuff yourself, you’ll tend to find robust tools under the heading of _non-parametric statistical methods_.

### So why is the t-test, etc., the de-facto standard?

You might wonder who I am to say that things like the U-test are often better in practice when most undergraduate texts are still teaching things like the t-test. Well, I’m not the only one or even the first by far; it’s just that there’s so much inertia behind the traditional tools.

The traditional tools are based on centuries-old theory, and typically have neat derivations using that theory. For example, least-squares linear regression has a really elegant formulation in terms of linear algebra, which corresponds nicely to an intuitive geometric diagram. The robust techniques are much newer and typically don’t have that kind of elegance. They’re a product of the computer age, not the pen-paper-and-calculus age. Textbooks tend to prefer things with theoretical elegance.

The traditional tools also have nothing-up-my-sleeve value. If you’re publishing a research paper on a topic that’s even slightly controversial, you’d better use well-known statistical tools or else you’ll raise suspicions. Unfortunately, that’s true even when alternatives are much more appropriate. Most people treat statistical analysis like the sideshow in whatever problem they’re solving, and very few people want to learn multiple tools to do the same job. That all makes tradition a very powerful force.

Personally, I’m sold on robust techniques, especially in computer engineering. Percentiles have already won against averages in computer engineering, and I hope this post might inspire you to try using other tools.

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2021/12/01/textbook_stats_and_tech.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://httpie.io/
[2]: https://www.gnu.org/software/pspp/
[3]: https://theartofmachinery.com/2019/08/12/c_const_isnt_for_performance.html
[4]: https://mathworld.wolfram.com/CentralLimitTheorem.html
