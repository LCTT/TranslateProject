[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Dockter: A container image builder for researchers)
[#]: via: (https://opensource.com/article/19/1/dockter-image-builder-researchers)
[#]: author: (Nokome Bentley https://opensource.com/users/nokome)

Dockter: A container image builder for researchers
======
Dockter supports the specific requirements of researchers doing data analysis, including those using R.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/building_skyscaper_organization.jpg?itok=Ir5epxm8)

Dependency hell is ubiquitous in the world of software for research, and this affects research transparency and reproducibility. Containerization is one solution to this problem, but it creates new challenges for researchers. Docker is gaining popularity in the research community—but using it efficiently requires solid Dockerfile writing skills.

As a part of the [Stencila][1] project, which is a platform for creating, collaborating on, and sharing data-driven content, we are developing [Dockter][2], an open source tool that makes it easier for researchers to create Docker images for their projects. Dockter scans a research project's source code, generates a Dockerfile, and builds a Docker image. It has a range of features that allow flexibility and can help researchers learn more about working with Docker.

Dockter also generates a JSON file with information about the software environment (based on [CodeMeta][3] and [Schema.org][4]) to enable further processing and interoperability with other tools.

Several other projects create Docker images from source code and/or requirements files, including: [alibaba/derrick][5], [jupyter/repo2docker][6], [Gueils/whales][7], [o2r-project/containerit][8]; [openshift/source-to-image][9], and [ViDA-NYU/reprozip][10]. Dockter is similar to repo2docker, containerit, and ReproZip in that it is aimed at researchers doing data analysis (and supports R), whereas most other tools are aimed at software developers (and don't support R).

Dockter differs from these projects principally in that it:

  * Performs static code analysis for multiple languages to determine package requirements
  * Uses package databases to determine package system dependencies and generate linked metadata (containerit does this for R)
  * Installs language package dependencies quicker (which can be useful during research projects where dependencies often change)
  * By default but optionally, installs Stencila packages so that Stencila client interfaces can execute code in the container



### Dockter's features

Following are some of the ways researchers can use Dockter.

#### Generating Docker images from code

Dockter scans a research project folder and builds a Docker image for it. If the folder already has a Dockerfile, Dockter will build the image from that. If not, Dockter will scan the source code files in the folder and generate one. Dockter currently handles R, Python, and Node.js source code. The .dockerfile (with the dot at the beginning) it generates is fully editable so users can take over from Dockter and carry on with editing the file as they see fit.

If the folder contains an R package [DESCRIPTION][11] file, Dockter will install the R packages listed under Imports into the image. If the folder does not contain a DESCRIPTION file, Dockter will scan all the R files in the folder for package import or usage statements and create a .DESCRIPTION file.

If the folder contains a [requirements.txt][12] file for Python, Dockter will copy it into the Docker image and use [pip][13] to install the specified packages. If the folder does not contain either of those files, Dockter will scan all the folder's .py files for import statements and create a .requirements.txt file.

If the folder contains a [package.json][14] file, Dockter will copy it into the Docker image and use npm to install the specified packages. If the folder does not contain a package.json file, Dockter will scan all the folder's .js files for require calls and create a .package.json file.

#### Capturing system requirements automatically

One of the headaches researchers face when hand-writing Dockerfiles is figuring out which system dependencies their project needs. Often this involves a lot of trial and error. Dockter automatically checks if any dependencies (or dependencies of dependencies, or dependencies of…) require system packages and installs those into the image. No more trial and error cycles of build, fail, add dependency, repeat…

#### Reinstalling language packages faster

If you have ever built a Docker image, you know it can be frustrating waiting for all your project's dependencies to reinstall when you add or remove just one.

This happens because of Docker's layered filesystem: When you update a requirements file, Docker throws away all the subsequent layers—including the one where you previously installed your dependencies. That means all the packages have to be reinstalled.

Dockter takes a different approach. It leaves the installation of language packages to the language package managers: Python's pip, Node.js's npm, and R's install.packages. These package managers are good at the job they were designed for: checking which packages need to be updated and updating only them. The result is much faster rebuilds, especially for R packages, which often involve compilation.

Dockter does this by looking for a special **# dockter** comment in a Dockerfile. Instead of throwing away layers, it executes all instructions after this comment in the same layer—thereby reusing packages that were previously installed.

#### Generating structured metadata for a project

Dockter uses [JSON-LD][15] as its internal data structure. When it parses a project's source code, it generates a JSON-LD tree using vocabularies from schema.org and CodeMeta.

Dockter also fetches metadata on a project's dependencies, which could be used to generate a complete software citation for the project.

### Easy to pick up, easy to throw away

Dockter is designed to make it easier to get started creating Docker images for your project. But it's also designed to not get in your way or restrict you from using bare Docker. You can easily and individually override any of the steps Dockter takes to build an image.

  * **Code analysis:** To stop Dockter from doing code analysis and specify your project's package dependencies, just remove the leading **.** (dot) from the .DESCRIPTION, .requirements.txt, or .package.json files.

  * **Dockerfile generation:** Dockter aims to generate readable Dockerfiles that conform to best practices. They include comments on what each section does and are a good way to start learning how to write your own Dockerfiles. To stop Dockter from generating a .Dockerfile and start editing it yourself, just rename it Dockerfile (without the leading dot).




### Install Dockter

[Dockter is available][16] as pre-compiled, standalone command line tool or as a Node.js package. Click [here][17] for a demo.

We welcome and encourage all [contributions][18]!

A longer version of this article is available on the project's [GitHub page][19].

Aleksandra Pawlik will present [Building reproducible computing environments: a workshop for non-experts][20] at [linux.conf.au][21], January 21-25 in Christchurch, New Zealand.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/dockter-image-builder-researchers

作者：[Nokome Bentley][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nokome
[b]: https://github.com/lujun9972
[1]: https://stenci.la/
[2]: https://stencila.github.io/dockter/
[3]: https://codemeta.github.io/index.html
[4]: http://Schema.org
[5]: https://github.com/alibaba/derrick
[6]: https://github.com/jupyter/repo2docker
[7]: https://github.com/Gueils/whales
[8]: https://github.com/o2r-project/containerit
[9]: https://github.com/openshift/source-to-image
[10]: https://github.com/ViDA-NYU/reprozip
[11]: http://r-pkgs.had.co.nz/description.html
[12]: https://pip.readthedocs.io/en/1.1/requirements.html
[13]: https://pypi.org/project/pip/
[14]: https://docs.npmjs.com/files/package.json
[15]: https://json-ld.org/
[16]: https://github.com/stencila/dockter/releases/
[17]: https://asciinema.org/a/pOHpxUqIVkGdA1dqu7bENyxZk?size=medium&cols=120&autoplay=1
[18]: https://github.com/stencila/dockter/blob/master/CONTRIBUTING.md
[19]: https://github.com/stencila/dockter
[20]: https://2019.linux.conf.au/schedule/presentation/185/
[21]: https://linux.conf.au/
