[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Solus Linux Creator Ikey Doherty Enters the Game Dev Business With a New Open Source Game Engine)
[#]: via: (https://itsfoss.com/ikey-doherty-serpent-interview/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Solus Linux Creator Ikey Doherty Enters the Game Dev Business With a New Open Source Game Engine
======

[Ikey Doherty][1], the creator and former lead dev of [Solus][2], is back with a new project. His new company, [Lispy Snake, Ltd][3], uses open source technology to create games, with a focus on Linux support.

I asked Ikey some questions about his new project. Here are his answers.

![][4]

_**It’s FOSS: What made you decide to get into game development?**_

**Ikey**: Honestly I would have to say a respect for older games. The creativity that came from so much limitation is frankly amazing. If you think of how limited the NES or C64 were, (or indeed my [Amstrad CPC][5]) – yet how much joy people experienced from those platforms. It’s a buzz I can’t avoid. Even though we’re a long way now from that world, I still look to model that technical excellence and creativity as best I can. I’m a sucker for good stories.

_**It’s FOSS: There are already several open-source game engines. Why did you decide to make your own? What is Serpent’s killer feature?**_

**Ikey**: There are a good number of open and closed source ones, each with a great set of features. However, I’m a pretty old school developer and there is nothing I hate more than an IDE or ‘drag n drop’ codeless environment. I simply wanted to create indie games with the least fuss possible and using a framework where I didn’t have to compromise. Once you get to ‘must work nicely on Linux and be open source’ you’re kinda short on choice.

I collected a set of projects that I’d use as the foundation for Lispy Snake’s first games, but needed something of a framework to tie them all together, as a reusable codebase across all games and updates.

I wouldn’t say killer features are present yet – just a set of sensible decisions. Serpent is written in D so it’s highly performant with a lower barrier of entry than say C or C++. It’s allowing me to flesh out a framework that suits my development ideals and pays attention to industry requirements, such as a performant multithreading Entity Component System or the sprite batching system.

When you rope together all the features and decisions, you get a portable codebase, that thanks to its choice of libraries like SDL and bgfx, will eventually run on all major platforms with minimal effort on our part. That basically means we’re getting OpenGL, DirectX, Vulkan and Metal “for free”.

Being able to target the latest APIs and create indie games easily, with industry standard features emerging constantly, from a framework that doesn’t impose itself on your workflow…that’s a pretty good combination.

![][6]

_**It’s FOSS: Why did you name your company LispySnake? Did you have a pet snake with a speech impediment when you were a kid?**_

**Ikey**: Honestly? [Naughty Dog][7] was taken. Gotta love some Bandicoot. Plus, originally we were taking on some Python contracting work and I found the name amusing. It’s pretty much a nonsensical name like many of my previous projects (Like Dave. Or Dave2.)

_**It’s FOSS: After being an operating system developer for many years, how does it feel to be working on something smaller? Would you say that your time as an OS developer gives you an edge as a game dev?**_

**Ikey**: OS dev needs a very high level view constantly, with the ability to context switch from macro to micro and back again. Many, many moving parts in a large ecosystem.

Serpent is much more task orientated – though similarities in the workflow exist in terms of defining macro systems and interleaving micro features to build a cohesive whole. My background in OS dev is obviously a huge help here.

Where it especially shines is dealing with the ‘guts’. I think a lot of indie devs (forgive me for being sweeping) are generally happy to just build from an existing kit and either embrace it or workaround the issues. There are some true gems out there like Factorio that go above and beyond and I have to hold my hat to them.

In terms of building a new kit we get to think, properly, about cache coherency, parallel performance, memory fragmentation, context switching and such.

Consumers of Serpent (when released in a more stable form) will know that the framework has been designed to leverage Linux features, not just spitting out builds for it.

![][8]

_**It’s FOSS: Recently you ported your [Serpent][9] game engine from C to the [D language][10]. Why did you make this move? What features does D have over C?**_

**Ikey**: Yeah honestly that was an interesting move. We were originally working on a project called lispysnake2d which was to be a trivial wrapper around SDL to give us a micro-game library. This simply used SDL_Renderer APIs to blit 2D sprites and initially seemed sufficient. Unfortunately as development progressed it was clear we needed a 3D pipeline for 2D, so we could utilize shaders and special effects. At that point SDL_Renderer is no good to you anymore and you need to go with Vulkan or OpenGL. We began abstracting the pipelines and saw the madness ensue.

After taking a step back, I analyzed all the shortcomings in the approach, and tired of the portability issues that would definitely arise. I’m not talking in terms of libraries, I’m talking about dealing with various filepaths, encodings, Win32 APIs, DirectX vs OpenGL vs Vulkan…etc. Then whack in boilerplate time, C string shortcomings, and the amount of reinventing required to avoid linking to bloated “cross-platform” standard library style libraries. It was a bad picture.

Having done a lot of [Go][11] development, I started researching alternatives to C that were concurrency-aware, string-sane, and packed with a powerful cross-platform standard library. This is the part where everyone will automatically tell you to use Rust.

Unfortunately, I’m too stupid to use [Rust][12] because the syntax literally offends my eyes. I don’t get it, and I never will. Rust is a fantastic language and as academic endeavours go, highly successful. Unfortunately, I’m too practically minded and seek comfort in C-style languages, having lived in that world too long. So, D was the best candidate to tick all the boxes, whilst having C &amp; C++ interoptability.

It took us a while to restore feature parity but now we have a concurrency-friendly framework which is tested with both OpenGL and Vulkan, supports sprite batching and has nice APIs. Plus, much of the reinvention is gone as we’re leveraging all the features of SDL, bgfx and the DLang standard library. Win win.

![The first game from LispySnake][13]

_**It’s FOSS: How are you planning to distribute your games?**_

**Ikey**: Demo wise we’ll initially only focus on Linux, and it’s looking like we’ll use Flatpak for that. As time goes on, when we’ve introduced support and testing for macOS + Windows, we’ll likely look to the Steam Store. Despite the closed source nature, Valve have been far more friendly and supportive of Linux over the years, whilst the likes of Epic Games have a long history of being highly anti-Linux. So that’s a no go.

_**It’s FOSS: How can people support and contribute to the development of the Serpent game engine?**_

**Ikey**: We have a few different methods, for what it’s worth. The easiest is to [buy a Lifetime License][14] – which is $20. This grants you lifetime access to all of our 2D games and helps fund development of our game titles and Serpent.

Alternatively, you can [sponsor me directly on GitHub][15] to work on Serpent and upstream where needed. Bit of FOSS love.

[Support with Lifetime License][16]

[Sponsor the development on GitHub][15]

* * *

I would like to thank Ikey for taking the time to answer my questions about his latest project.

Have any of you created a game with open source tools? If so, what tools and how was the experience? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][17].

--------------------------------------------------------------------------------

via: https://itsfoss.com/ikey-doherty-serpent-interview/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://twitter.com/ikey_doherty
[2]: https://getsol.us/home/
[3]: https://lispysnake.com/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/ikey_doherty_serpent_interview.png?ssl=1
[5]: https://en.wikipedia.org/wiki/Amstrad_CPC
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/lipsy_snake_screenshot.png?ssl=1
[7]: https://www.naughtydog.com/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/lipsy_snake.png?ssl=1
[9]: https://github.com/lispysnake/serpent
[10]: https://dlang.org/
[11]: https://golang.org/
[12]: https://www.rust-lang.org/
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/02/last_peacekeeper_game.png?ssl=1
[14]: https://lispysnake.com/the-game-raiser/
[15]: https://github.com/sponsors/ikeycode
[16]: https://lispysnake.com/the-game-raiser
[17]: https://reddit.com/r/linuxusersgroup
