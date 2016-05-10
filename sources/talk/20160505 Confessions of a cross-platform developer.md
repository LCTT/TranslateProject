Confessions of a cross-platform developer
=============================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/business_clouds.png?itok=cucHuJnU)

[Andreia Gaita][1] is giving a talk at this year's OSCON, titled [Confessions of a cross-platform developer][2]. She's a long-time open source and [Mono][3] contributor, and develops primarily in C#/C++. Andreia works at GitHub, where she's focused on building the GitHub Extension manager for Visual Studio.

I caught up with Andreia ahead of her talk to ask about cross-platform development and what she's learned in her 16 years as a cross-platform developer.

![](https://opensource.com/sites/default/files/images/life/Interview%20banner%20Q%26A.png)

**What languages have you found easiest and hardest to develop cross-platform code for?**

It's less about which languages are good and more about the libraries and tooling available for those languages. The compilers/interpreters/build systems available for languages determine how easy it is to do cross-platform work with them (or whether it's even possible), and the libraries available for UI and native system access determine how deep you can integrate with the OS. With that in mind, I found C# to be the best for cross-platform work. The language itself includes features that allow fast native calls and accurate memory mapping, which you really need if you want your code to talk to the OS and native libraries. When I need very specific OS integration, I switch to C or C++.

**What cross-platform toolkits/abstractions have you used?** 

Most of my cross-platform work has been developing tools, libraries and bindings for other people to develop cross-platform applications with, mostly in Mono/C# and C/C++. I don't get to use a lot of abstractions at that level, beyond glib and friends. I mostly rely on Mono for any cross-platform app that includes a UI, and Unity3D for the occasional game development. I play with Electron every now and then.

**What has been your approach to build systems, and how does this vary by language or platform?** 

I try to pick the build system that is most suited for the language(s) I'm using. That way, it'll (hopefully) give me less headaches. It needs to allow for platform and architecture selection, be smart about build artifact locations (for multiple parallel builds), and be decently configurable. Most of the time I have projects combining C/C++ and C# and I want to build all the different configurations at the same time from the same source tree (Debug, Release, Windows, OSX, Linux, Android, iOS, etc, etc.), and that usually requires selecting and invoking different compilers with different flags per output build artifact. So the build system has to let me do all of this without getting (too much) in my way. I try out different build systems every now and then, just to see what's new, but in the end, I end up going back to makefiles and a combination of either shell and batch scripts or Perl scripts for driving them (because if I want users to build my things, I'd better pick a command line script language that is available everywhere).

**How do you balance the desire for native look and feel with the need for uniform user interfaces?** 

Cross-platform UI is hard! I've implemented several cross-platform GUIs over the years, and it's the one thing for which I don't think there's an optimal solution. There's basically two options. You can pick a cross-platform GUI toolkit and do a UI that doesn't feel quite right in all the platforms you support, with a small codebase and low maintenance cost. Or you can choose to develop platform-specific UIs that will look and feel native and well integrated with a larger codebase and higher maintenance cost. The decision really depends on the type of app, how many features it has, how many resources you have, and how many platforms you're shipping to.

In the end, I think there's an increase in users' tolerance for "One UI To Rule Them All" with frameworks like Electron. I have a Chromium+C+C# framework side project that will one day hopefully allow me build Electron-style apps in C#, giving me the best of both worlds.

**Has building/packaging dependencies been an issue for you?** 

I'm very conservative about my use of dependencies, having been bitten so many times by breaking ABIs, clashing symbols, and missing packages. I decide which OS version(s) I'm targeting and pick the lowest common denominator release available of a dependency to minimize issues. That usually means having five different copies of Xcode and OSX Framework libraries, five different versions of Visual Studio installed side-to-side on the same machine, multiple clang and gcc versions, and a bunch of VMs running various other distros. If I'm unsure of the state of packages in the OS I'm targeting, I will sometimes link statically and sometimes submodule dependencies to make sure they're always available. And most of all, I avoid the bleeding edge unless I really, really need something there.

**Do you use continuous integration, code review, and related tools?** 

All the time! It's the only way to keep sane. The first thing I do on a project is set up cross-platform build scripts to ensure everything is automateable as early as possible. When you're targeting multiple platforms, CI is essential. It's impossible for everyone to build all the different combinations of platforms in one machine, and as soon as you're not building all of them you're going to break something without being aware of it. In a shared multi-platform codebase, different people own different platforms and features, so the only way to guarantee quality is to have cross-team code reviews combined with CI and other analysis tools. It's no different than other software projects, there's just more points of failure.

**Do you rely on automated build testing, or do you tend to build on each platform and test locally?** 

For tools and libraries that don't include UIs, I can usually get away with automated build testing. If there's a UI, then I need to do both—reliable, scriptable UI automation for existing GUI toolkits is rare to non-existent, so I would have to either invest in creating UI automation tools that work across all the platforms I want to support, or I do it manually. If a project uses a custom UI toolkit (like, say, an OpenGL UI like Unity3D does), then it's fairly easy to develop scriptable automation tools and automate most of that stuff. Still, there's nothing like the human ability to break things with a couple of clicks!

**If you are developing cross-platform, do you support cross-editor build systems so that you can use Visual Studio on Windows, Qt Creator on Linux, and XCode on Mac? Or do you tend toward supporting one platform such as Eclipse on all platforms?** 

I favor cross-editor build systems. I prefer generating project files for different IDEs (preferably in a way that makes it easier to add more IDEs), with build scripts that can drive builds from the IDEs for the platform they're on. Editors are the most important tool for a developer. It takes time and effort to learn them, and they're not interchangeable. I have my favorite editors and tools, and everyone else should be able to use their favorite tool, too.

**What is your preferred editor/development environment/IDE for cross-platform development?** 

The cross-platform developer is cursed with having to pick the lowest common denominator editor that works across the most platforms. I love Visual Studio, but I can't rely on it for anything except Windows work (and you really don't want to make Windows your primary cross-compiling platform), so I can't make it my primary IDE. Even if I could, an essential skill of cross-platform development is to know and use as many platforms as possible. That means really knowing them—using the platform's editors and libraries, getting to know the OS and its assumptions, behaviors, and limitations, etc. To do that and keep my sanity (and my shortcut muscle memory), I have to rely on cross-platform editors. So, I use Emacs and Sublime.

**What are some of your favorite past and current cross-platform projects?** 

Mono is my all-time favorite, hands down, and most of the others revolve around it in some way. Gluezilla was a Mozilla binding I did years ago to allow C# apps to embed web browser views, and that one was a doozy. At one point I had a Winforms app, built on Linux, running on Windows with an embedded GTK view in it that was running a Mozilla browser view. The CppSharp project (formerly Cxxi, formerly CppInterop) is a project I started to generate C# bindings for C++ libraries so that you could call, create instances of, and subclass C++ classes from C#. It was done in such a way that it would detect at runtime what platform you'd be running on and what compiler was used to create the native library and generate the correct C# bindings for it. That was fun!

**Where do you see cross-platform development heading in the future?** 

The way we build native applications is already changing, and I feel like the visual differences between the various desktop operating systems are going to become even more blurred so that it will become easier to build cross-platform apps that integrate reasonably well without being fully native. Unfortunately, that might mean applications will be worse in terms of accessibility and less innovative when it comes to using the OS to its full potential. Cross-platform development of tools, libraries, and runtimes is something that we know how to do well, but there's still a lot of work to do with cross-platform application development.


--------------------------------------------------------------------------------

via: https://opensource.com/business/16/5/oscon-interview-andreia-gaita

作者：[Marcus D. Hanwell ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mhanwell
[1]: https://twitter.com/sh4na
[2]: http://conferences.oreilly.com/oscon/open-source-us/public/schedule/detail/48702
[3]: http://www.mono-project.com/
