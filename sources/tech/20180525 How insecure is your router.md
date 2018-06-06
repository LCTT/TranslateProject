How insecure is your router?
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/locks_keys_bridge_paris.png?itok=Bp0dsEc9)

I've always had a problem with the t-shirt that reads, "There's no place like 127.0.0.1." I know you're supposed to read it as "home," but to me, it says, "There's no place like localhost," which just doesn't have the same ring to it. And in this post, I want to talk about something broader: the entry point to your home network, which for most people will be a cable or broadband router.1 The UK and U.S. governments just published advice that "Russia"2 is attacking routers. This attack will be aimed mostly, I suspect, at organisations (see my previous post "[What's a state actor, and should I care?][1]"), rather than homes, but it's a useful wake-up call for all of us.

### What do routers do?

Routers are important. They provide the link between one network (in this case, our home network) and another one (in this case, the internet, via our ISP's network). In fact, for most of us, the box we think of as "the router"3 is doing a lot more than that. The "routing" bit is what is sounds like; it helps computers on your network find routes to send data to computers outside the network—and vice-versa, for when you're getting data back.

High among a router's other functions, many also perform as a modem. Most of us4 connect to the internet via a phone line—whether cable or standard landline—though there is a growing trend for mobile internet to the home. When you're connecting via a phone line, the signals we use for the internet must be converted to something else and then (at the other end) back again. For those of us old enough to remember the old "dial-up" days, that's what the screechy box next to your computer used to do.

But routers often do more things, sometimes many more things, including traffic logging, acting as a WiFi access point, providing a VPN for external access to your internal network, child access, firewalling, and all the rest.

Home routers are complex things these days; although state actors may not be trying to get into them, other people may.

Does this matter, you ask? Well, if other people can get into your system, they have easy access to attacking your laptops, phones, network drives, and the rest. They can access and delete unprotected personal data. They can plausibly pretend to be you. They can use your network to host illegal data or launch attacks on others. Basically, all the bad things.

Luckily, routers tend to come set up by your ISP, with the implication being that you can leave them, and they'll be nice and safe.

### So we're safe, then?

Unluckily, we're really not.

The first problem is that ISPs are working on a budget, and it's in their best interests to provide cheap kit that just does the job. The quality of ISP-provided routers tends to be pretty terrible. It's also high on the list of things to try to attack by malicious actors: If they know that a particular router model is installed in several million homes, there's a great incentive to find an attack, because an attack on that model will be very valuable to them.

Other problems that arise include:

  * Slowness to fix known bugs or vulnerabilities. Updating firmware can be costly to your ISP, so fixes may be slow to arrive (if they do at all).
  * Easily derived or default admin passwords, which means attackers don't even need to find a real vulnerability—they can just log in.



### Measures to take

Here's a quick list of steps you can take to try to improve the security of your first hop to the internet. I've tried to order them in terms of ease—simplest first. Before you do any of these, however, save the configuration data so you can bring it back if you need it.

  1. **Passwords:** Always, always, always change the admin password for your router. It's probably going to be one you rarely use, so you'll want to record it somewhere. This is one of the few times where you might want to consider taping it to the router itself, as long as the router is in a secure place where only authorised people (you and your family5) have access.
  2. **Internal admin access only:** Unless you have very good reasons and you know what you're doing, don't allow machines to administer the router unless they're on your home network. There should be a setting on your router for this.
  3. **WiFi passwords:** Once you've done item 2, also ensure that WiFi passwords on your network—whether set on your router or elsewhere—are strong. It's easy to set a  "friendly" password to make it easy for visitors to connect to your network, but if a malicious person who happens to be nearby guesses it, the first thing that person will do is to look for routers on the network. As they're on the internal network, they'll have access to it (hence why item 1 is important).
  4. **Turn on only the functions that you understand and need:** As I noted above, modern routers have all sorts of cool options. Disregard them. Unless you really need them, and you actually understand what they do and the dangers of turning them on, then leave them off. Otherwise, you're just increasing your attack surface.
  5. **Buy your own router:** Replace your ISP-supplied router with a better one. Go to your local computer store and ask for suggestions. You can pay an awful lot, but you can also get something fairly cheap that does the job and is more robust, performant, and easy to secure than the one you have at the moment. You may also want to buy a separate modem. Generally, setting up your modem or router is simple, and you can copy the settings from the ISP-supplied one and it will  "just work."
  6. **Firmware updates:** I'd love to move this further up the list, but it's not always easy. From time to time, firmware updates appear for your router. Most routers will check automatically and may prompt you to update when you next log in. The problem is that failure to update correctly can cause catastrophic results6 or lose configuration data that you'll need to re-enter. But you really do need to consider keeping a lookout for firmware updates that fix severe security issues and implement them.
  7. **Go open source:** There are some great open source router projects out there that allow you to take an existing router and replace all of its firmware/software with open source alternatives. You can find many of them on [Wikipedia][2], and a search for ["router" on Opensource.com][3] will open your eyes to a set of fascinating opportunities. This isn't a step for the faint-hearted, as you'll definitely void the warranty on your router, but if you want to have real control, open source is always the way to go.



### Other issues

I'd love to pretend that once you've improved the security of your router, all's well and good on your home network, but it's not. What about IoT devices in your home (Alexa, Nest, Ring doorbells, smart lightbulbs, etc.?) What about VPNs to other networks? Malicious hosts via WiFi, malicious apps on your children's phones…?

No, you won't be safe. But, as we've discussed before, although there is no such thing as "secure," it doesn't mean we shouldn't raise the bar and make it harder for the Bad Folks.™

  1. I'm simplifying—but read on, we'll get there.
  2. "Russian state-sponsored cyber actors"
  3. Or, in my parents' case, "the internet box," I suspect.
  4. This is one of these cases where I don't want comments telling me how you have a direct, 1TB/s connection to your local backbone, thank you very much.
  5. Maybe not the entire family.
  6. Your router is now a brick, and you have no access to the internet.



This article originally appeared on [Alice, Eve, and Bob – a security blog][4] and is republished with permission.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/how-insecure-your-router

作者：[Mike Bursell][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mikecamel
[1]:https://aliceevebob.com/2018/03/13/whats-a-state-actor-and-should-i-care/
[2]:https://en.wikipedia.org/wiki/List_of_router_firmware_projects
[3]:https://opensource.com/sitewide-search?search_api_views_fulltext=router
[4]:https://aliceevebob.com/2018/04/17/defending-our-homes/
