[Considering Python's Target Audience][40]
============================================================

Who is Python being designed for?

*   [Use cases for Python's reference interpreter][8]

*   [Which audience does CPython primarily serve?][9]

*   [Why is this relevant to anything?][10]

*   [Where does PyPI fit into the picture?][11]

*   [Why are some APIs changed when adding them to the standard library?][12]

*   [Why are some APIs added in provisional form?][13]

*   [Why are only some standard library APIs upgraded?][14]

*   [Will any parts of the standard library ever be independently versioned?][15]

*   [Why do these considerations matter?][16]

Several years ago, I [highlighted][38] "CPython moves both too fast and too slowly" as one of the more common causes of conflict both within the python-dev mailing list, as well as between the active CPython core developers and folks that decide that participating in that process wouldn't be an effective use of their personal time and energy.

I still consider that to be the case, but it's also a point I've spent a lot of time reflecting on in the intervening years, as I wrote that original article while I was still working for Boeing Defence Australia. The following month, I left Boeing for Red Hat Asia-Pacific, and started gaining a redistributor level perspective on [open source supply chain management][39] in large enterprises.

### [Use cases for Python's reference interpreter][17]

While it's a gross oversimplification, I tend to break down CPython's use cases as follows (note that these categories aren't fully distinct, they're just aimed at focusing my thinking on different factors influencing the rollout of new software features and versions):

*   Education: educator's main interest is in teaching ways of modelling and manipulating the world computationally,  _not_  writing or maintaining production software). Examples:
    *   Australia's [Digital Curriculum][1]

    *   Lorena A. Barba's [AeroPython][2]

*   Personal automation & hobby projects: software where the main, and often only, user is the individual that wrote it. Examples:
    *   my Digital Blasphemy [image download notebook][3]

    *   Paul Fenwick's (Inter)National [Rick Astley Hotline][4]

*   Organisational process automation: software where the main, and often only, user is the organisation it was originally written to benefit. Examples:
    *   CPython's [core workflow tools][5]

    *   Development, build & release management tooling for Linux distros

*   Set-and-forget infrastructure: software where, for sometimes debatable reasons, in-life upgrades to the software itself are nigh impossible, but upgrades to the underlying platform may be feasible. Examples:
    *   most self-managed corporate and institutional infrastructure (where properly funded sustaining engineering plans are disturbingly rare)

    *   grant funded software (where maintenance typically ends when the initial grant runs out)

    *   software with strict certification requirements (where recertification is too expensive for routine updates to be economically viable unless absolutely essential)

    *   Embedded software systems without auto-upgrade capabilities

*   Continuously upgraded infrastructure: software with a robust sustaining engineering model, where dependency and platform upgrades are considered routine, and no more concerning than any other code change. Examples:
    *   Facebook's Python service infrastructure

    *   Rolling release Linux distributions

    *   most public PaaS and serverless environments (Heroku, OpenShift, AWS Lambda, Google Cloud Functions, Azure Cloud Functions, etc)

*   Intermittently upgraded standard operating environments: environments that do carry out routine upgrades to their core components, but those upgrades occur on a cycle measured in years, rather than weeks or months. Examples:
    *   [VFX Platform][6]

    *   LTS Linux distributions

    *   CPython and the Python standard library

    *   Infrastructure management & orchestration tools (e.g. OpenStack, Ansible)

    *   Hardware control systems

*   Ephemeral software: software that tends to be used once and then discarded or ignored, rather than being subsequently upgraded in place. Examples:
    *   Ad hoc automation scripts

    *   Single-player games with a defined "end" (once you've finished them, even if you forget to uninstall them, you probably won't reinstall them on a new device)

    *   Single-player games with little or no persistent state (if you uninstall and reinstall them, it doesn't change much about your play experience)

    *   Event-specific applications (the application was tied to a specific physical event, and once the event is over, that app doesn't matter any more)

*   Regular use applications: software that tends to be regularly upgraded after deployment. Examples:
    *   Business management software

    *   Personal & professional productivity applications (e.g. Blender)

    *   Developer tools & services (e.g. Mercurial, Buildbot, Roundup)

    *   Multi-player games, and other games with significant persistent state, but no real defined "end"

    *   Embedded software systems with auto-upgrade capabilities

*   Shared abstraction layers: software components that are designed to make it possible to work effectively in a particular problem domain even if you don't personally grasp all the intricacies of that domain yet. Examples:
    *   most runtime libraries and frameworks fall into this category (e.g. Django, Flask, Pyramid, SQL Alchemy, NumPy, SciPy, requests)

    *   many testing and type inference tools also fit here (e.g. pytest, Hypothesis, vcrpy, behave, mypy)

    *   plugins for other applications (e.g. Blender plugins, OpenStack hardware adapters)

    *   the standard library itself represents the baseline "world according to Python" (and that's an [incredibly complex][7] world view)

### [Which audience does CPython primarily serve?][18]

Ultimately, the main audiences that CPython and the standard library specifically serve are those that, for whatever reason, aren't adequately served by the combination of a more limited standard library and the installation of explicitly declared third party dependencies from PyPI.

To oversimplify the above review of different usage and deployment models even further, it's possible to summarise the single largest split in Python's user base as the one between those that are using Python as a  _scripting language_  for some environment of interest, and those that are using it as an  _application development language_ , where the eventual artifact that will be distributed is something other than the script that they're working on.

Typical developer behaviours when using Python as a scripting language include:

*   the main working unit consists of a single Python file (or Jupyter notebook!), rather than a directory of Python and metadata files

*   there's no separate build step of any kind - the script is distributed  _as_  a script, similar to the way standalone shell scripts are distributed

*   there's no separate install step (other than downloading the file to an appropriate location), as it is expected that the required runtime environment will be preconfigured on the destination system

*   no explicit dependencies stated, except perhaps a minimum Python version, or else a statement of the expected execution environment. If dependencies outside the standard library are needed, they're expected to be provided by the environment being scripted (whether that's an operating system, a data analysis platform, or an application that embeds a Python runtime)

*   no separate test suite, with the main test of correctness being "Did the script do what you wanted it to do with the input that you gave it?"

*   if testing prior to live execution is needed, it will be in the form of a "dry run" or "preview" mode that conveys to the user what the software  _would_  do if run that way

*   if static code analysis tools are used at all, it's via integration into the user's software development environment, rather than being set up separately for each individual script

By contrast, typical developer behaviours when using Python as an application development language include:

*   the main working unit consists of a directory of Python and metadata files, rather than a single Python file

*   these is a separate build step to prepare the application for publication, even if it's just bundling the files together into a Python sdist, wheel or zipapp archive

*   whether there's a separate install step to prepare the application for use will depend on how the application is packaged, and what the supported target environments are

*   external dependencies are expressed in a metadata file, either directly in the project directory (e.g. `pyproject.toml`, `requirements.txt`, `Pipfile`), or as part of the generated publication archive (e.g. `setup.py`, `flit.ini`)

*   a separate test suite exists, either as unit tests for the Python API, integration tests for the functional interfaces, or a combination of the two

*   usage of static analysis tools is configured at the project level as part of its testing regime, rather than being dependent on

As a result of that split, the main purpose that CPython and the standard library end up serving is to define the redistributor independent baseline of assumed functionality for educational and ad hoc Python scripting environments 3-5 years after the corresponding CPython feature release.

For ad hoc scripting use cases, that 3-5 year latency stems from a combination of delays in redistributors making new releases available to their users, and users of those redistributed versions taking time to revise their standard operating environments.

In the case of educational environments, educators need that kind of time to review the new features and decide whether or not to incorporate them into the courses they offer their students.

### [Why is this relevant to anything?][19]

This post was largely inspired by the Twitter discussion following on from [this comment of mine][20] citing the Provisional API status defined in [PEP 411][21] as an example of an open source project issuing a de facto invitation to users to participate more actively in the design & development process as co-creators, rather than only passively consuming already final designs.

The responses included several expressions of frustration regarding the difficulty of supporting provisional APIs in higher level libraries, without those libraries making the provisional status transitive, and hence limiting support for any related features to only the latest version of the provisional API, and not any of the earlier iterations.

My [main reaction][22] was to suggest that open source publishers should impose whatever support limitations they need to impose to make their ongoing maintenance efforts personally sustainable. That means that if supporting older iterations of provisional APIs is a pain, then they should only be supported if the project developers themselves need that, or if somebody is paying them for the inconvenience. This is similar to my view on whether or not volunteer-driven projects should support older commercial LTS Python releases for free when it's a hassle for them to do: I [don't think they should][23], as I expect most such demands to be stemming from poorly managed institutional inertia, rather than from genuine need (and if the need  _is_  genuine, then it should instead be possible to find some means of paying to have it addressed).

However, my [second reaction][24], was to realise that even though I've touched on this topic over the years (e.g. in the original 2011 article linked above, as well as in Python 3 Q & A answers [here][25], [here][26], and [here][27], and to a lesser degree in last year's article on the [Python Packaging Ecosystem][28]), I've never really attempted to directly explain the impact it has on the standard library design process.

And without that background, some aspects of the design process, such as the introduction of provisional APIs, or the introduction of inspired-by-but-not-the-same-as, seem completely nonsensical, as they appear to be an attempt to standardise APIs without actually standardising them.

### [Where does PyPI fit into the picture?][29]

The first hurdle that  _any_  proposal sent to python-ideas or python-dev has to clear is answering the question "Why isn't a module on PyPI good enough?". The vast majority of proposals fail at this step, but there are several common themes for getting past it:

*   rather than downloading a suitable third party library, novices may be prone to copying & pasting bad advice from the internet at large (e.g. this is why the `secrets` library now exists: to make it less likely people will use the `random` module, which is intended for games and statistical simulations, for security-sensitive purposes)

*   the module is intended to provide a reference implementation and to enable interoperability between otherwise competing implementations, rather than necessarily being all things to all people (e.g. `asyncio`, `wsgiref`, `unittest``, and `logging` all fall into this category)

*   the module is intended for use in other parts of the standard library (e.g. `enum` falls into this category, as does `unittest`)

*   the module is designed to support a syntactic addition to the language (e.g. the `contextlib`, `asyncio` and `typing` modules fall into this category)

*   the module is just plain useful for ad hoc scripting purposes (e.g. `pathlib`, and `ipaddress` fall into this category)

*   the module is useful in an educational context (e.g. the `statistics` module allows for interactive exploration of statistic concepts, even if you wouldn't necessarily want to use it for full-fledged statistical analysis)

Passing this initial "Is PyPI obviously good enough?" check isn't enough to ensure that a module will be accepted for inclusion into the standard library, but it's enough to shift the question to become "Would including the proposed library result in a net improvement to the typical introductory Python software developer experience over the next few years?"

The introduction of `ensurepip` and `venv` modules into the standard library also makes it clear to redistributors that we expect Python level packaging and installation tools to be supported in addition to any platform specific distribution mechanisms.

### [Why are some APIs changed when adding them to the standard library?][30]

While existing third party modules are sometimes adopted wholesale into the standard library, in other cases, what actually gets added is a redesigned and reimplemented API that draws on the user experience of the existing API, but drops or revises some details based on the additional design considerations and privileges that go with being part of the language's reference implementation.

For example, unlike its popular third party predecessor, `path.py`, ``pathlib` does  _not_  define string subclasses, but instead independent types. Solving the resulting interoperability challenges led to the definition of the filesystem path protocol, allowing a wider range of objects to be used with interfaces that work with filesystem paths.

The API design for the `ipaddress` module was adjusted to explicitly separate host interface definitions (IP addresses associated with particular IP networks) from the definitions of addresses and networks in order to serve as a better tool for teaching IP addressing concepts, whereas the original `ipaddr` module is less strict in the way it uses networking terminology.

In other cases, standard library modules are constructed as a synthesis of multiple existing approaches, and may also rely on syntactic features that didn't exist when the APIs for pre-existing libraries were defined. Both of these considerations apply for the `asyncio` and `typing` modules, while the latter consideration applies for the `dataclasses` API being considered in PEP 557 (which can be summarised as "like attrs, but using variable annotations for field declarations").

The working theory for these kinds of changes is that the existing libraries aren't going away, and their maintainers often aren't all that interested in putitng up with the constraints associated with standard library maintenance (in particular, the relatively slow release cadence). In such cases, it's fairly common for the documentation of the standard library version to feature a "See Also" link pointing to the original module, especially if the third party version offers additional features and flexibility that were omitted from the standard library module.

### [Why are some APIs added in provisional form?][31]

While CPython does maintain an API deprecation policy, we generally prefer not to use it without a compelling justification (this is especially the case while other projects are attempting to maintain compatibility with Python 2.7).

However, when adding new APIs that are inspired by existing third party ones without being exact copies of them, there's a higher than usual risk that some of the design decisions may turn out to be problematic in practice.

When we consider the risk of such changes to be higher than usual, we'll mark the related APIs as provisional, indicating that conservative end users may want to avoid relying on them at all, and that developers of shared abstraction layers may want to consider imposing stricter than usual constraints on which versions of the provisional API they're prepared to support.

### [Why are only some standard library APIs upgraded?][32]

The short answer here is that the main APIs that get upgraded are those where:

*   there isn't likely to be a lot of external churn driving additional updates

*   there are clear benefits for either ad hoc scripting use cases or else in encouraging future interoperability between multiple third party solutions

*   a credible proposal is submitted by folks interested in doing the work

If the limitations of an existing module are mainly noticeable when using the module for application development purposes (e.g. `datetime`), if redistributors already tend to make an improved alternative third party option readily available (e.g. `requests`), or if there's a genuine conflict between the release cadence of the standard library and the needs of the package in question (e.g. `certifi`), then the incentives to propose a change to the standard library version tend to be significantly reduced.

This is essentially the inverse to the question about PyPI above: since PyPI usually  _is_  a sufficiently good distribution mechanism for application developer experience enhancements, it makes sense for such enhancements to be distributed that way, allowing redistributors and platform providers to make their own decisions about what they want to include as part of their default offering.

Changing CPython and the standard library only comes into play when there is perceived value in changing the capabilities that can be assumed to be present by default in 3-5 years time.

### [Will any parts of the standard library ever be independently versioned?][33]

Yes, it's likely the bundling model used for `ensurepip` (where CPython releases bundle a recent version of `pip` without actually making it part of the standard library) may be applied to other modules in the future.

The most probable first candidate for that treatment would be the `distutils` build system, as switching to such a model would allow the build system to be more readily kept consistent across multiple releases.

Other potential candidates for this kind of treatment would be the Tcl/Tk graphics bindings, and the IDLE editor, which are already unbundled and turned into an optional addon installations by a number of redistributors.

### [Why do these considerations matter?][34]

By the very nature of things, the folks that tend to be most actively involved in open source development are those folks working on open source applications and shared abstraction layers.

The folks writing ad hoc scripts or designing educational exercises for their students often won't even think of themselves as software developers - they're teachers, system administrators, data analysts, quants, epidemiologists, physicists, biologists, business analysts, market researchers, animators, graphical designers, etc.

When all we have to worry about for a language is the application developer experience, then we can make a lot of simplifying assumptions around what people know, the kinds of tools they're using, the kinds of development processes they're following, and the ways they're going to be building and deploying their software.

Things get significantly more complicated when an application runtime  _also_  enjoys broad popularity as a scripting engine. Doing either job well is already difficult, and balancing the needs of both audiences as part of a single project leads to frequent incomprehension and disbelief on both sides.

This post isn't intended to claim that we never make incorrect decisions as part of the CPython development process - it's merely pointing out that the most reasonable reaction to seemingly nonsensical feature additions to the Python standard library is going to be "I'm not part of the intended target audience for that addition" rather than "I have no interest in that, so it must be a useless and pointless addition of no value to anyone, added purely to annoy me".

--------------------------------------------------------------------------------

via: http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html

作者：[Nick Coghlan ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.curiousefficiency.org/pages/about.html
[1]:https://aca.edu.au/#home-unpack
[2]:https://github.com/barbagroup/AeroPython
[3]:https://nbviewer.jupyter.org/urls/bitbucket.org/ncoghlan/misc/raw/default/notebooks/Digital%20Blasphemy.ipynb
[4]:https://github.com/pjf/rickastley
[5]:https://github.com/python/core-workflow
[6]:http://www.vfxplatform.com/
[7]:http://www.curiousefficiency.org/posts/2015/10/languages-to-improve-your-python.html#broadening-our-horizons
[8]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#use-cases-for-python-s-reference-interpreter
[9]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#which-audience-does-cpython-primarily-serve
[10]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#why-is-this-relevant-to-anything
[11]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#where-does-pypi-fit-into-the-picture
[12]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#why-are-some-apis-changed-when-adding-them-to-the-standard-library
[13]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#why-are-some-apis-added-in-provisional-form
[14]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#why-are-only-some-standard-library-apis-upgraded
[15]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#will-any-parts-of-the-standard-library-ever-be-independently-versioned
[16]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#why-do-these-considerations-matter
[17]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id1
[18]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id2
[19]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id3
[20]:https://twitter.com/ncoghlan_dev/status/916994106819088384
[21]:https://www.python.org/dev/peps/pep-0411/
[22]:https://twitter.com/ncoghlan_dev/status/917092464355241984
[23]:http://www.curiousefficiency.org/posts/2015/04/stop-supporting-python26.html
[24]:https://twitter.com/ncoghlan_dev/status/917088410162012160
[25]:http://python-notes.curiousefficiency.org/en/latest/python3/questions_and_answers.html#wouldn-t-a-python-2-8-release-help-ease-the-transition
[26]:http://python-notes.curiousefficiency.org/en/latest/python3/questions_and_answers.html#doesn-t-this-make-python-look-like-an-immature-and-unstable-platform
[27]:http://python-notes.curiousefficiency.org/en/latest/python3/questions_and_answers.html#what-about-insert-other-shiny-new-feature-here
[28]:http://www.curiousefficiency.org/posts/2016/09/python-packaging-ecosystem.html
[29]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id4
[30]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id5
[31]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id6
[32]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id7
[33]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id8
[34]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id9
[35]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#
[36]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#disqus_thread
[37]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.rst
[38]:http://www.curiousefficiency.org/posts/2011/04/musings-on-culture-of-python-dev.html
[39]:http://community.redhat.com/blog/2015/02/the-quid-pro-quo-of-open-infrastructure/
[40]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#
