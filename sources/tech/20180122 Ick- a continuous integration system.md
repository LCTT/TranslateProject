Ick: a continuous integration system
======
**TL;DR:** Ick is a continuous integration or CI system. See <http://ick.liw.fi/> for more information.

More verbose version follows.

### First public version released

The world may not need yet another continuous integration system (CI), but I do. I've been unsatisfied with the ones I've tried or looked at. More importantly, I am interested in a few things that are more powerful than what I've ever even heard of. So I've started writing my own.

My new personal hobby project is called ick. It is a CI system, which means it can run automated steps for building and testing software. The home page is at <http://ick.liw.fi/>, and the [download][1] page has links to the source code and .deb packages and an Ansible playbook for installing it.

I have now made the first publicly advertised release, dubbed ALPHA-1, version number 0.23. It is of alpha quality, and that means it doesn't have all the intended features and if any of the features it does have work, you should consider yourself lucky.

### Invitation to contribute

Ick has so far been my personal project. I am hoping to make it more than that, and invite contributions. See the [governance][2] page for the constitution, the [getting started][3] page for tips on how to start contributing, and the [contact][4] page for how to get in touch.

### Architecture

Ick has an architecture consisting of several components that communicate over HTTPS using RESTful APIs and JSON for structured data. See the [architecture][5] page for details.

### Manifesto

Continuous integration (CI) is a powerful tool for software development. It should not be tedious, fragile, or annoying. It should be quick and simple to set up, and work quietly in the background unless there's a problem in the code being built and tested.

A CI system should be simple, easy, clear, clean, scalable, fast, comprehensible, transparent, reliable, and boost your productivity to get things done. It should not be a lot of effort to set up, require a lot of hardware just for the CI, need frequent attention for it to keep working, and developers should never have to wonder why something isn't working.

A CI system should be flexible to suit your build and test needs. It should support multiple types of workers, as far as CPU architecture and operating system version are concerned.

Also, like all software, CI should be fully and completely free software and your instance should be under your control.

(Ick is little of this yet, but it will try to become all of it. In the best possible taste.)

### Dreams of the future

In the long run, I would ick to have features like ones described below. It may take a while to get all of them implemented.

  * A build may be triggered by a variety of events. Time is an obvious event, as is source code repository for the project changing. More powerfully, any build dependency changing, regardless of whether the dependency comes from another project built by ick, or a package from, say, Debian: ick should keep track of all the packages that get installed into the build environment of a project, and if any of their versions change, it should trigger the project build and tests again.

  * Ick should support building in (or against) any reasonable target, including any Linux distribution, any free operating system, and any non-free operating system that isn't brain-dead.

  * Ick should manage the build environment itself, and be able to do builds that are isolated from the build host or the network. This partially works: one can ask ick to build a container and run a build in the container. The container is implemented using systemd-nspawn. This can be improved upon, however. (If you think Docker is the only way to go, please contribute support for that.)

  * Ick should support any workers that it can control over ssh or a serial port or other such neutral communication channel, without having to install an agent of any kind on them. Ick won't assume that it can have, say, a full Java run time, so that the worker can be, say, a micro controller.

  * Ick should be able to effortlessly handle very large numbers of projects. I'm thinking here that it should be able to keep up with building everything in Debian, whenever a new Debian source package is uploaded. (Obviously whether that is feasible depends on whether there are enough resources to actually build things, but ick itself should not be the bottleneck.)

  * Ick should optionally provision workers as needed. If all workers of a certain type are busy, and ick's been configured to allow using more resources, it should do so. This seems like it would be easy to do with virtual machines, containers, cloud providers, etc.

  * Ick should be flexible in how it can notify interested parties, particularly about failures. It should allow an interested party to ask to be notified over IRC, Matrix, Mastodon, Twitter, email, SMS, or even by a phone call and speech syntethiser. "Hello, interested party. It is 04:00 and you wanted to be told when the hello package has been built for RISC-V."




### Please give feedback

If you try ick, or even if you've just read this far, please share your thoughts on it. See the [contact][4] page for where to send it. Public feedback is preferred over private, but if you prefer private, that's OK too.

--------------------------------------------------------------------------------

via: https://blog.liw.fi/posts/2018/01/22/ick_a_continuous_integration_system/

作者：[Lars Wirzenius][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.liw.fi/
[1]:http://ick.liw.fi/download/
[2]:http://ick.liw.fi/governance/
[3]:http://ick.liw.fi/getting-started/
[4]:http://ick.liw.fi/contact/
[5]:http://ick.liw.fi/architecture/
