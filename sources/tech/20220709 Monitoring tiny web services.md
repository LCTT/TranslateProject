[#]: subject: "Monitoring tiny web services"
[#]: via: "https://jvns.ca/blog/2022/07/09/monitoring-small-web-services/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Monitoring tiny web services
======

Hello! I’ve started to run a few more servers recently ([nginx playground][1], [mess with dns][2], [dns lookup][3]), so I’ve been thinking about monitoring.

It wasn’t initially totally obvious to me how to monitor these websites, so I wanted to quickly write up what how I did it.

I’m not going to talk about how to monitor Big Serious Mission Critical websites at all, only tiny unimportant websites.

### goal: spend approximately 0 time on operations

I want the sites to mostly work, but I also want to spend approximately 0% of my time on the ongoing operations.

I was initially very wary of running servers at all because at my last job I was on a 24⁄7 oncall rotation for some critical services, and in my mind “being responsible for servers” meant “get woken up at 2am to fix the servers” and “have lots of complicated dashboards”.

So for a while I only made static websites so that I wouldn’t have to think about servers.

But eventually I realized that any server I was going to write was going to be very low stakes, if they occasionally go down for 2 hours it’s no big deal, and I could just set up some very simple monitoring to help keep them running.

### not having monitoring sucks

At first I didn’t set up any monitoring for my servers at all. This had the extremely predictable outcome of – sometimes the site broke, and I didn’t find out about it until somebody told me!

### step 1: an uptime checker

The first step was to set up an uptime checker. There are tons of these out there, the ones I’m using right now are [updown.io][4] and [uptime robot][5]. I like updown’s user interface and [pricing][6] structure more (it’s per request instead of a monthly fee), but uptime robot has a more generous free tier.

These

  1. check that the site is up
  2. if it goes down, it emails me



I find that email notifications are a good level for me, I’ll find out pretty quickly if the site goes down but it doesn’t wake me up or anything.

### step 2: an end-to-end healthcheck

Next, let’s talk about what “check that the site is up” actually means.

At first I just made one of my healthcheck endpoints a function that returned `200 OK` no matter what.

This is kind of useful – it told me that the server was on!

But unsurprisingly I ran into problems because it wasn’t checking that the API was actually _working_ – sometimes the healthcheck succeeded even though the rest of the service had actually gotten into a bad state.

So I updated it to actually make a real API request and make sure it succeeded.

All of my services do very few things (the nginx playground has just 1 endpoint), so it’s pretty easy to set up a healthcheck that actually runs through most of the actions the service is supposed to do.

Here’s what the end-to-end healthcheck handler for the nginx playground looks like. It’s very basic: it just makes another POST request (to itself) and checks if that request succeeds or fails.

```

    func healthHandler(w http.ResponseWriter, r *http.Request) {
        // make a request to localhost:8080 with `healthcheckJSON` as the body
        // if it works, return 200
        // if it doesn't, return 500
        client := http.Client{}
        resp, err := client.Post("http://localhost:8080/", "application/json", strings.NewReader(healthcheckJSON))
        if err != nil {
            log.Println(err)
            w.WriteHeader(http.StatusInternalServerError)
            return
        }
        if resp.StatusCode != http.StatusOK {
            log.Println(resp.StatusCode)
            w.WriteHeader(http.StatusInternalServerError)
            return
        }
        w.WriteHeader(http.StatusOK)
    }

```

### healthcheck frequency: hourly

Right now I’m running most of my healthchecks every hour, and some every 30 minutes.

I run them hourly because updown.io’s pricing is per healthcheck, I’m monitoring 18 different URLs, and I wanted to keep my healthcheck budget pretty minimal at $5/year.

Taking an hour to find out that one of these websites has gone down seems ok to me – if there is a problem there’s no guarantee I’ll get to fixing it all that quickly anyway.

If it were free to run them more often I’d probably run them every 5-10 minutes instead.

### step 3: automatically restart if the healthcheck fails

Some of my websites are on fly.io, and fly has a pretty standard feature where I can configure a HTTP healthcheck for a service and restart the service if the healthcheck starts failing.

“Restart a lot” is a very useful strategy to paper over bugs that I haven’t gotten around to fixing yet – for a while the nginx playground had a process leak where `nginx` processes weren’t getting terminated, so the server kept running out of RAM.

With the healthcheck, the result of this was that every day or so, this would happen:

  * the server ran out of RAM
  * the healthcheck started failing
  * it get restarted
  * everything was fine again
  * repeat the whole saga again some number of hours later



Eventually I got around to actually fixing the process leak, but it was nice to have a workaround in place that could keep things running while I was procrastinating fixing the bug.

These healthchecks to decide whether to restart the service run more often: every 5 minutes or so.

### this is not the best way to monitor Big Services

This is probably obvious and I said this already at the beginning, but “write one HTTP healthcheck” is not the best approach for monitoring a large complex service. But I won’t go into that because that’s not what this post is about.

### it’s been working well so far!

I originally wrote this post 3 months ago in April, but I waited until now to publish it to make sure that the whole setup was working.

It’s made a pretty big difference – before I was having some very silly downtime problems, and now for the last few months the sites have been up 99.95% of the time!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/07/09/monitoring-small-web-services/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://nginx-playground.wizardzines.com
[2]: https://messwithdns.net
[3]: https://dns-lookup.jvns.ca
[4]: https://updown.io/
[5]: https://uptimerobot.com/
[6]: https://updown.io/#pricing
