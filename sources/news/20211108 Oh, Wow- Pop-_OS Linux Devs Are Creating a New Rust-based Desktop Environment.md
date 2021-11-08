[#]: subject: "Oh, Wow! Pop!_OS Linux Devs Are Creating a New Rust-based Desktop Environment"
[#]: via: "https://news.itsfoss.com/pop-os-cosmic-rust/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Oh, Wow! Pop!_OS Linux Devs Are Creating a New Rust-based Desktop Environment
======

Earlier this year, [System76 introduced their desktop environment][1] (DE) “COSMIC” based on GNOME.

The [COSMIC desktop][2] aimed to offer a polished and more functional experience when compared to GNOME.

Considering my previous experience with Pop!_OS, System76 always seems to have top-notch implementations to offer the best possible user experience with Pop!_OS.

While they tried to evolve with their desktop environment flavor, it looks like it isn’t feasible anymore.

In a [Reddit poll][3] (via Pop!_OS Sub-reddit), Pop!_OS users wondered if Pop!_OS would introduce a KDE-flavoured desktop environment.

To their surprise, **Michael Murphy**, a System76 Engineer, responded that it would have its own desktop instead, developed from scratch without GNOME as its base.

### Ditching GNOME as the Base for COSMIC Desktop?

![][4]

The new desktop environment will continue to use the name “COSMIC”

To clarify, the disagreement with GNOME developers and System76 did not speed up their decision to create a new desktop environment.

Michael mentioned in the same thread that it just wouldn’t end up as a good thing if they try to incorporate everything they want in the Gnome shell to realize the vision they have for the future of Pop!_OS.

Hence, a new desktop environment should enable them to achieve their goal for Pop!_OS users and System76 customers.

Here’s what Michael mentioned:

> There are things we’d like to do that we can’t simply achieve through extensions in GNOME. Extensions in general feel like a hack. And what we want to do with our desktop differs from GNOME, so it’s not like the option to merge pop-shell and COSMIC into GNOME Shell would be a welcome thing.

### Here’s What We Know About the New Desktop So Far…

![COSMIC Desktop Environment based on GNOME][5]

The new desktop environment will be written in Rust following the freedesktop specifications and will not be a fork of GNOME.

With their desktop environment, System76 plans to provide an experience to its users that they’ve always wanted.

As of now, no official details have been shared about its features or its planned UI.

But, considering the type of changes we see in Pop!_OS, they may not want something entirely different in terms of its look compared to what COSMIC is. Instead, it would probably retain a similar look but without using “GNOME extensions” for the extra features out-of-the-box.

And, I believe, doing away with GNOME extensions would be a good change because it isn’t an excellent solution to constantly add more GNOME extensions to provide what Pop!_OS wants for its users.

When a Redditor asked if there is a possibility of a new GUI library built from scratch or if it uses GTK, the engineer shared some technical details:

> We’re already using gtk-rs for all of our stuff. My assumption is that it’s likely to see some components in GTK for the foreseeable future. The shell itself though is lower level than a traditional desktop GUI toolkit. It’ll use primitives from the window manager it builds upon. If a mature Rust GUI turns up, then it could be used in the future of course. I’d generally like to use the best tools where possible.

Michael also explains that they plan to build the DE while leveraging the best available tools:

> Using tooling that already exists (mutter, kwin, wlroots), but implementing the surrounding shell in Rust from scratch, yes.

### Yet Another Desktop Environment?

![][4]

I don’t think that System76 intends to introduce its desktop environment as a new kid in the block. They’re clever enough to experiment with it and only introduce it when they think of it as a mature platform.

Considering their ambitious plans with Pop!_OS, it should be worth looking out for. If you’re wondering: if introducing another desktop environment is a good choice instead of using the resources to fix the available options, Michael responded:

> Choice is the best part about open source. None of us would be here today if people weren’t brave enough to take the next step with a new solution to an existing problem. You’re likely now using some software that was just recently developed as an alternative to something. Distributions and people will naturally gravitate towards the best solutions over time. And sometimes the best solution for an individual is not the most popular desktop environment.
>
> Whether a person should contribute to something that already exists or create something new depends on whether their goals align with the goals of something that already exists.

Fair enough. And, I agree with the thought.

### When Can You Expect the New Desktop Environment for Pop!_OS?

The idea for a new desktop environment sounds experimental. So, you shouldn’t expect anything soon.

I would remain optimistic considering what System76 has managed to achieve in recent years. However, one cannot underestimate the resources required to pull this off, regarding it as a long-term goal:

> We’re expanding, but I think it’s viable long term.

So, even if you find something related to their new desktop environment, it should be safe to consider it experimental unless System76 says otherwise.

I wouldn’t be so sure about its compatibility with other distributions, but it should be exciting to know more about it when there’s some development activity on this.

_What_ _do you think about a COSMIC desktop ditching GNOME to provide something better? Do you see it happening anytime soon?_

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/pop-os-cosmic-rust/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/cosmic-desktop-pop-os/
[2]: https://news.itsfoss.com/pop_os-21-04-release/
[3]: https://www.reddit.com/r/pop_os/comments/qnvrou/will_pop_os_ever_do_an_officially_kde_flavor_or/hjji8hh/?utm_source=reddit&utm_medium=web2x&context=3
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
