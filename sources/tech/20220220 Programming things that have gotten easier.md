[#]: subject: "Programming things that have gotten easier"
[#]: via: "https://jvns.ca/blog/2022/02/20/things-that-used-to-be-hard-and-are-now-easy/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Programming things that have gotten easier
======

Hello! I was talking to some friends the other day about the types of conference talks we enjoyed.

One category we came up with was “you know this thing that used to be super hard? Turns out now it’s WAY EASIER and maybe you can do it now!“.

So I asked on Twitter about [programming things that used to be hard and are now easy][1]

Here are some of the answers I got. Not all of them are equally “easy”, but I found reading the list really fun and it gave me some ideas for things to learn. Maybe it’ll give you some ideas too.

  * SSL certificates, with Let’s Encrypt
  * Concurrency, with async/await (in several languages)
  * Centering in CSS, with flexbox/grid
  * Building fast programs, with Go
  * Image recognition, with [transfer learning][2] (someone pointed out that the joke in [this XKCD][3] doesn’t make sense anymore)
  * Building cross-platform GUIs, with Electron
  * VPNs, with Wireguard
  * Running your own code inside the Linux kernel, with eBPF
  * Cross-compilation (Go and Rust ship with cross-compilation support out of the box)
  * Configuring cloud infrastructure, with Terraform
  * Setting up a dev environment, with Docker
  * Sharing memory safely with threads, with Rust



Things that involve hosted services:

  * CI/CD, with GitHub Actions/CircleCI/GitLab etc
  * Making useful websites by only writing frontend code, with a variety of “serverless” backend services
  * Training neural networks, with Colab
  * Deploying a website to a server, with Netlify/Heroku etc
  * Running a database, with hosted services like RDS
  * Realtime web applications, with Firebase
  * Image recognition, with hosted ML services like Teachable Machine



Things that I haven’t done myself but that sound cool:

  * Cryptography, with opinionated crypto primitives like libsodium
  * Live updates to web pages pushed by the web server, with LiveView/Hotwire
  * Embedded programming, with MicroPython
  * Building videogames, with Roblox / Unity
  * Writing code that runs on GPU in the browser (maybe with Unity?)
  * Building IDE tooling with LSP (the language server protocol)
  * Interactive theorem provers (not sure with what)
  * NLP, with HuggingFace
  * Parsing, with PEG or parser combinator libraries
  * ESP microcontrollers
  * Batch data processing, with Spark



Language specific things people mentioned:

  * Rust, with non-lexical lifetimes
  * IE support for CSS/JS



### what else?

I’d love more examples of things that have become easier over the years.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/02/20/things-that-used-to-be-hard-and-are-now-easy/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://twitter.com/b0rk/status/1494301227533967369?s=20&t=M_RYvWzEOymZ--YjE9jvpQ
[2]: https://simonwillison.net/2018/Oct/29/transfer-learning/
[3]: https://xkcd.com/1425/
