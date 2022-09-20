[#]: subject: "How I switched from Docker Desktop to Colima"
[#]: via: "https://opensource.com/article/22/9/docker-desktop-colima"
[#]: author: "Michael Anello https://opensource.com/users/ultimike"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I switched from Docker Desktop to Colima
======
Colima is a Docker Desktop alternative for macOS and Linux that's now supported by DDEV.

![Getting started with Perlbrew][1]

Image by: freephotocc via Pixabay CC0

[DDEV][2] is an open source tool that makes it simple to get local PHP development environments up and running within minutes. It’s powerful and flexible as a result of its per-project environment configurations, which can be extended, version controlled, and shared. In short, DDEV aims to allow development teams to use containers in their workflow without the complexities of bespoke configuration.

DDEV replaces more traditional AMP stack solutions (WAMP, MAMP, XAMPP, and so on) with a flexible, modern, container-based solution. Because it uses containers, DDEV allows each project to use any set of applications, versions of web servers, database servers, search index servers, and other types of software.

In March 2022, the DDEV team [announced support for C][3][olima][4], an open source Docker Desktop replacement for macOS and Linux. [Colima][5] is open source, and by all reports it’s got [performance gains][6] over its alternative, so using Colima seems like a no-brainer.

### Migrating to Colima

First off, Colima is *almost* a drop-in replacement for Docker Desktop. I say *almost* because some reconfiguration is required when using it for an existing DDEV project. Specifically, databases must be reimported. The fix is to first export your database, then start Colima, then import it. Easy.

Colima requires that either the Docker or [Podman][7] command is installed. On Linux, it also requires Lima.

Docker is installed by default with Docker Desktop for macOS, but it’s also available as a stand-alone command. If you want to go 100% pure Colima, you can uninstall Docker Desktop for macOS, and install and configure the Docker client independently. [Full installation instructions can be found on the DDEV docs site][8].

![An image of the container technology stack.][9]

Image by: (Mike Anello,CC BY-SA 4.0)

If you choose to keep using both Colima and Docker Desktop, then when issuing docker commands from the command line, you must first specify which container you want to work with. More on this in the next section.

### Install Colima on macOS

I currently have some local projects using Docker, and some using Colima. Once I understood the basics, it’s not too difficult to switch between them.

1. To get started, install Colima using Homebrew `brew install colima`
2. ddev poweroff (just to be safe)
3. Next, start Colima with `colima start `--cpu` 4 `--memory` 4.` The --cpu and --memory options only have to be done once. After the first time, only `colima start` is necessary.
4. If you’re a DDEV user like me, then you can spin up a fresh Drupal 9 site with the usual `ddev` commands (ddev config, ddev start, and so on.) It’s recommended to enable DDEV’s mutagen functionality to maximize performance.

### Switching between a Colima and Docker Desktop

If you’re not ready to switch to Colima wholesale yet, it’s possible to have both Colima and Docker Desktop installed.

1. First, poweroff ddev:ddev poweroff
2. Then stop Colima: `colima stop`
3. Now run `docker context use `default`` to tell the Docker client which container you want to work with. The name default refers to Docker Desktop for Mac. When `colima start` is run, it automatically switches Docker to the `colima` context.
4. To continue with the default (Docker Desktop) context, use the `ddev start` command.

Technically, starting and stopping Colima isn’t necessary, but the `ddev poweroff` command when switching between two contexts is.

Recent versions of Colima revert the Docker context back to `default` when Colima is stopped, so the `docker context use default` command is no longer necessary. Regardless, I still use `docker context show` to verify that either the `default` (Docker Desktop for Mac) or `colima` context is in use. Basically, the term `context` refers to which container provider the Docker client routes commands to.

### Try Colima

Overall, I’m liking what I see so far. I haven’t run into any issues, and Colima-based sites seem a bit snappier (especially when DDEV’s Mutagen functionality is enabled). I definitely foresee myself migrating project sites to Colima over the next few weeks.

*This article originally appeared on the* [DrupalEasy blog][10] *and is republished with permission.*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/docker-desktop-colima

作者：[Michael Anello][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ultimike
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/coffee_cafe_brew_laptop_desktop.jpg
[2]: https://github.com/drud/ddev
[3]: https://ddev.com/ddev-local/docker-desktop-alternatives-arrive-for-ddev-colima/
[4]: https://ddev.com/ddev-local/docker-desktop-alternatives-arrive-for-ddev-colima/
[5]: https://github.com/abiosoft/colima
[6]: https://ddev.com/ddev-local/docker-desktop-and-colima-benchmarking-on-macos/
[7]: https://opensource.com/article/22/2/start-running-containers
[8]: https://ddev.readthedocs.io/en/stable/users/docker_installation/#macos-installation-colima
[9]: https://opensource.com/sites/default/files/2022-09/docker-desktop-colima.png
[10]: https://www.drupaleasy.com/news
