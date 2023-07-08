[#]: subject: "Open sourcing the nginx playground"
[#]: via: "https://jvns.ca/blog/2023/07/08/open-sourcing-the-nginx-playground/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Open sourcing the nginx playground
======

Hello! In 2021 I released a small playground for testing nginx configurations called [nginx playground][1]. There’s a [blog post about it here][2].

This is an extremely short post to say that at the time I didn’t make it open source, but I am making it open source now. It’s not a lot of code but maybe it’ll be interesting to someone.

Here’s [the github repo][3]. The frontend is in `static/` and the backend is in `api/`. The README is mostly an extended apology for the developer experience and note that the project is unmaintained. But I did test that the build instructions work!

### why didn’t I open source this before?

I’m not very good at open source. Some of the problems I have with open sourcing things are:

  * I dislike (and am very bad at) maintaining open source projects – I usually ignore basically all feature requests and most bug reports and then feel bad about it. I handed off maintainership to both of the open source projects that I started ([rbspy][4] and [rust-bcc][5]) to other people who are doing a MUCH better job than I ever did.
  * Sometimes the developer experience for the project is pretty bad
  * Sometimes there’s configuration in the project (like the `fly.toml` or the analytics I have set up) which don’t really make sense for other people to copy



### new approach: don’t pretend I’m going to improve it

In the past I’ve had some kind of belief that I’m going to improve the problems with my code later. But I haven’t touched this project in more than a year and I think it’s unlikely I’m going to go back to it unless it breaks in some dramatic way.

So instead of pretending I’m going to improve things, I decided to just:

  * tell people in the README that the project is unmaintained
  * write down all the security caveats I know about
  * test the build instructions I wrote to make sure that they work (on a fresh machine, even!)
  * explain (but do not fix!!) some of the messy parts of the project



### that’s all!

Maybe I will open source more of my tiny projects in the future, we’ll see! Thanks to [Sumana Harihareswara][6] for helping me think through this.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2023/07/08/open-sourcing-the-nginx-playground/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://nginx-playground.wizardzines.com/
[2]: https://jvns.ca/blog/2021/09/24/new-tool--an-nginx-playground/
[3]: https://github.com/jvns/nginx-playground/
[4]: https://github.com/rbspy/rbspy
[5]: https://github.com/rust-bpf/rust-bcc
[6]: https://www.changeset.nyc/
