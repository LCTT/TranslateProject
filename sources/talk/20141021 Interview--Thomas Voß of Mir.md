Interview: Thomas Voß of Mir
================================================================================
**Mir was big during the space race and it’s a big part of Canonical’s unification strategy. We talk to one of its chief architects at mission control.**

Not since the days of 2004, when X.org split from XFree86, have we seen such exciting developments in the normally prosaic realms of display servers. These are the bits that run behind your desktop, making sure Gnome, KDE, Xfce and the rest can talk to your graphics hardware, your screen and even your keyboard and mouse. They have a profound effect on your system’s performance and capabilities. And where we once had one, we now have two more – Wayland and Mir, and both are competing to win your affections in the battle for an X replacement.

We spoke to Wayland’s Daniel Stone in issue 6 of Linux Voice, so we thought it was only fair to give equal coverage to Mir, Canonical’s own in-house X replacement, and a project that has so far courted controversy with some of its decisions. Which is why we headed to Frankfurt and asked its Technical Architect, Thomas Voß, for some background context…

![](http://www.linuxvoice.com/wp-content/uploads/2014/10/voss_1.jpg)

**Linux Voice: Let’s go right back to the beginning, and look at what X was originally designed for. X solved the problems that were present 30 years ago, where people had entirely different needs, right?**

**Thomas Voß**: It was mainframes. It was very expensive mainframe computers with very cheap terminals, trying to keep the price as low as possible. And one of the first and foremost goals was: “Hey, I want to be able to distribute my UI across the network, ideally compressed and using as little data as possible”. So a lot of the decisions in X were motivated by that.

A lot of the graphics languages that X supports even today have been motivated by that decision. The X developers started off in a 2D world; everything was a 2D graphics language, the X way of drawing rectangles. And it’s present today. So X is not necessarily bad in that respect; it still solves a lot of use cases, but it’s grown over time.

One of the reasons is that X is a protocol, in essence. So a lot of things got added to the protocol. The problem with adding things to a protocol is that they tend to stick. To use a 2D graphics language as an example, XVideo is something that no-one really likes today. It’s difficult to support and the GPU vendors actually cry out in pain when you start talking about XVideo. It’s somewhat bloated, and it’s just old. It’s an old proven technology – and I’m all for that. I actually like X for a lot of things, and it was a good source of inspiration. But then when you look at your current use cases and the current setup we are in, where convergence is one of the buzzwords – massively overrated obviously – but at the heart of convergence lies the fact that you want to scale across different form factors.

**LV: And convergence is big for Canonical isn’t it?**

**Thomas**: It’s big, I think, for everyone, especially over time. But convergence is a use case that was always of interest to us. So we always had this idea that we want one codebase. We don’t want a situation like Apple has with OS X and iOS, which are two different codebases. We basically said “Look, whatever we want to do, we want to do it from one codebase, because it’s more efficient.” We don’t want to end up in the situation where we have to be maintaining two, three or four separate codebases.

That’s where we were coming from when we were looking at X, and it was just too bloated. And we looked at a lot of alternatives. We started looking at how Mac OS X was doing things. We obviously didn’t have access to the source code, but if you see the transition from OS 9 to OS X, it was as if they entirely switched to one graphics language. It was pre-PostScript at that time. But they chose one graphics language, and that’s it. From that point on, when you choose a graphics language, things suddenly become more simple to do. Today’s graphics language is EGL ES, so there was inspiration for us to say we were converged on GL and EGL. From our perspective, that’s the least common denominator.

> We basically said: whatever we want to do, we want to do it from one codebase, because it’s more efficient.

Obviously there are disadvantages to having only one graphics language, but the benefits outweigh the disadvantages. And I think that’s a common theme in the industry. Android made the same decision to go that way. Even Wayland to a certain degree has been doing that. They have to support EGL and GL, simply because it’s very convenient for app developers and toolkit developers – an open graphics language. That was the part that inspired us, and we wanted to have this one graphics language and support it well. And that takes a lot of craft.

So, once you can say: no more weird 2D API, no more weird phong API, and everything is mapped out to GL, you’re way better off. And you can distill down the scope of the overall project to something more manageable. So it went from being impossible to possible. And then there was me, being very opinionated. I don’t believe in extensibility from the beginning – traditionally in Linux everything is super extensible, which has got benefits for a certain audience.

If you think about the audience of the display server, it’s one of the few places in the system where you’ve got three audiences. So you’ve got the users, who don’t care, or shouldn’t care, about the display server.

**LV: It’s transparent to them.**

**Thomas**: Yes, it’s pixels, right? That’s all they care about. It should be smooth. It should be super nice to use. But the display server is not their main concern. It obviously feeds into a user experience, quite significantly, but there are a lot of other parts in the system that are important as well.

Then you’ve got developers who care about the display server in terms of the API. Obviously we said we want to satisfy this audience, and we want to provide a super-fast experience for users. It should be rock solid and stable. People have been making fun of us and saying “yeah, every project wants to be rock solid and stable”. Cool – so many fail in doing that, so let’s get that down and just write out what we really want to achieve.

And then you’ve got developers, and the moment you expose an API to them, or a protocol, you sign a contract with them, essentially. So they develop to your API – well, many app developers won’t directly because they’ll be using toolkits – but at some point you’ve got developers who sign up to your API.

![](http://www.linuxvoice.com/wp-content/uploads/2014/10/voss_3.jpg)

**LV: The developers writing the toolkits, then?**

**Thomas**: We do a lot of work in that arena, but in general it’s a contract that we have with normal app developers. And we said: look, we don’t want the API or contract to be super extensible and trying to satisfy every need out there. We want to understand what people really want to do, and we want to commit to one API and contract. Not five different variants of the contract, but we want to say: look, this is what we support and we, as Canonical and as the Mir maintainers, will sign up to.

So I think that’s a very good thing. You can buy into specific shells sitting on top of Mir, but you can always assume a certain base level of functionality that we will always provide in terms of window management, in terms of rendering capabilities, and so on and so forth. And funnily enough, that also helps with convergence. Because once you start thinking about the API as very important, you really start thinking about convergence. And what happens if we think about form factor and we transfer from a phone to a tablet to a desktop to a fridge?

**LV: And whatever might come!**

**Thomas**: Right, right. How do we account for future developments? And we said we don’t feel comfortable making Mir super extensible, because it will just grow. Either it will just grow and grow, or you will end up with an organisation that just maintains your protocol and protocol extensions.

**LV: So that’s looking at Mir in relation to X. The obvious question is comparing Mir to Wayland – so what is it that Mir does, that Wayland doesn’t?**

**Thomas**: This might sound picky, but we have to distinguish what Wayland really is. Wayland is a protocol specification which is interesting because the value proposition is somewhat difficult. You’ve got a protocol and you’ve got a reference implementation. Specifically, when we started, Weston was still a test bed and everything being developed ended up in there.

No one was buying into that; no one was saying, “Look, we’re moving this to production-level quality with a bona fide protocol layer that is frozen and stable for a specific version that caters to application authors”. If you look at the Ubuntu repository today, or in Debian, there’s Wayland-cursor-whatever, so they have extensions already. So that’s a bit different from our approach to Mir, from my perspective at least.

There was this protocol that the Wayland developers finished and back then, before we did Mir and I looked into all of this, I wrote a Wayland compositor in Go, just to get to know things.

**LV: As you do!**

**Thomas**: And I said: you know, I don’t think a protocol is a good way of approaching this because versioning a protocol in a packaging scenario is super difficult. But versioning a C API, or any sort of API that has a binary stability contract, is way easier and we are way more experienced at that. So, in that respect, we are different in that we are saying the protocol is an implementation detail, at least up to a certain point.

I’m pretty sure for version 1.0, which we will call a golden release, we will open up the protocol for communication purposes. Under the covers it’s Google buffers and sockets. So we’ll say: this is the API, work against that, and we’re committed to it.

That’s one thing, and then we said: OK, there’s Weston, but we cannot use Weston because it’s not working on Android, the driver model is not well defined, and there’s so much work that we would have to do to actually implement a Wayland compositor. And then we are in a situation where we would have to cut out a set of functionality from the Wayland protocol and commit to that, no matter what happens, and ultimately that would be a fork, over time, right?.

**LV: It’s a difficult concept for many end users, who just want to see something working.**

**Thomas**: Right, and even from a developer’s perspective – and let’s jump to the political part – I find it somewhat difficult to have a party owning a protocol definition and another party building the reference implementations. Now, Gnome and KDE do two different Wayland compositors. I don’t see the benefit in that, to be quite frank, so the value proposition is difficult to my mind.

The driver model in Mir and Wayland is ultimately not that different – it’s GL/EGL based. That is kind of the denominator that you will find in both things, which is actually a good thing, because if you look at the contract to application developers and toolkit developers, most of them don’t want Mir or Wayland. They talk ELG and GL, and at that point, it’s not that much of a problem to support both.

> If there had been a full reference implementation of Wayland, our decision might have been different.

So we did this work for porting the Chromium browser to Mir. We actually took the Chromium Wayland back-end, factored out all the common pieces to EGL and GL ES, and split it up into Wayland and Mir.

And I think from a user’s or application developer’s perspective, the difference is not there. I think, in retrospect, if there would have been something like a full reference implementation of Wayland, where a company had signed up to provide something that is working, and committed to a certain protocol version, our decision might have been different. But there just wasn’t. It was five years out there, Wayland, Wayland, Wayland, and there was nothing that we could build upon.

**LV: The main experience we’ve had is with RebeccaBlackOS, which has Weston and Wayland, because, like you say, there’s no that much out there running it.**

**Thomas**: Right. I find Wayland impressive, obviously, but I think Mir will be significantly more relevant than Wayland in two years time. We just keep on bootstrapping everything, and we’ve got things working across multiple platforms. Are there issues, and are there open questions to solve? Most likely. We never said we would come up with the perfect solution in version 1. That was not our goal. I don’t think software should be built that way. So it just should be iterated.

![](http://www.linuxvoice.com/wp-content/uploads/2014/10/voss_2.jpg)

**LV: When was Mir originally planned for? Which Ubuntu release? Because it has been pushed back a couple of times.**

**Thomas**: Well, we originally planned to have it by 14.04. That was the kind of stretch goal, because it highly depends on the availability of proprietary graphics drivers. So you can’t ship an LTS [Long Term Support] release of Ubuntu on a new display server without supporting the hardware of the big guys.

**LV: We thought that would be quite ambitious anyway – a Long Term Support release with a whole new display server!**

**Thomas**: Yes, it was ambitious – but for a reason. If you don’t set a stretch goal, and probably fail in reaching it, and then re-evaluate how you move forward, it’s difficult to drive a project. So if you just keep it evolving and evolving and evolving, and you don’t have a checkpoint at some point…

**LV: That’s like a lot of open source projects. Inkscape is still on 0.48 or something, and it works, it’s reliable, but they never get to 1.0. Because they always say: “Oh let’s add this feature, and that feature”, and the rest of us are left thinking: just release 1.0 already!.**

**Thomas**: And I wouldn’t actually tie it to a version number. To me, that is secondary. To me, the question is whether we call this ready for broad public consumption on all of the hardware versions we want to support?

In Canonical, as a company, we have OEM contracts and we are enabling Ubuntu on a host of devices, and laptops and whatever, so we have to deliver on those contracts. And the question is, can we do that? No. Well, you never like a ‘no’.

> The question is whether we call this ready for broad public consumption on the hardware we want to support.

Usually, when you encounter a problem and you tackle it, and you start thinking how to solve the problem, that’s more beneficial than never hearing a no. That’s kind of what we were aiming for. Ubuntu 14.04 was a stretch goal – everyone was aware of that and we didn’t reach it. Fine, cool. Let’s go on.

So how do we stage ourself for the next cycle, until an LTS? Now we have this initiative where we have a daily testable image with Unity 8 and Mir. It’s not super usable because it’s just essentially the tethered UI that you are seeing there, but still it’s something that we didn’t have a year ago. And for me, that’s a huge gain.

And ultimately, before we can ship something, before any new display server can ship in an LTS release, you need to have buy-in from the GPU vendors. That’s what you need.

--------------------------------------------------------------------------------

via: http://www.linuxvoice.com/interview-thomas-vos-of-mir/

作者：[Mike Saunders][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxvoice.com/author/mike/