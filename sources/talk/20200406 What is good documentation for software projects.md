[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is good documentation for software projects?)
[#]: via: (https://opensource.com/article/20/4/documentation)
[#]: author: (Cameron Shorter https://opensource.com/users/cameronshorter)

What is good documentation for software projects?
======
Mixing experienced tech writers with open source communities reveals new
approaches for creating better docs.
![Typewriter with hands][1]

The [Open Geospatial (OSGeo) Foundation][2] recently participated in Google's first [Season of Docs][3], in which Google sponsored senior technical writers to contribute to open source projects. OSGeo is an umbrella organization for around 50 geospatial open source projects. I've contributed to a number of these projects over the years and recently co-mentored the two Season of Docs technical writers Google allocated to OSGeo.

We discovered during our involvement that, like many open source projects, we knew little about:

  * The state of our docs
  * What we were aiming for
  * Our priorities
  * The details of the challenges we faced
  * How to improve



We discovered:

  * How hard it is to keep tech docs current
  * Skillsets from multiple roles are needed to create good docs
  * Open source's docs and writing processes are immature when compared to software development



It is an exciting problem space with high-value challenges ready to be tackled. It reminds me of the early days of open source, before it became trendy with business.

### What should tech writers work on?

Open source communities welcomed the chance to have tech writers improve our docs and expressed a pressing need for it, but found it hard to articulate exactly what needed to be fixed:

  * People explained that their project docs often hadn't been updated between doc releases.
  * Some projects had new features that had not been documented.
  * Other projects had issue lists, collating observed deficiencies, but had no systematic review.
  * Most observed that docs were created by developers with no formal tech writing training.
  * Many noted that their English docs were written by non-native English speakers.



But where should we start? We needed to decide on what we wanted and what we should work on first.

### Defining good docs

We then realized that we didn't have a good definition of "good documentation." For our software projects, we have a comprehensive [incubation process][4] to assess the maturity of software and the project's community, but we couldn't find a similar set of metrics to define "good documentation." So we started the [Good Docs Project][5] to collate "best-practice templates and writing instructions for documenting open source software." This helped us define what we were aiming for and prioritize what we can achieve with our available resources.

### Documentation audit

Once we knew what good docs looked like, we could audit the status of a project's docs:

  * What documentation do we have?
  * Does it cover all the functionality?
  * Does it cover end-user needs?
  * Is the documentation any good?



We discovered that the quality, currency, and completeness of our OSGeo docs were immature when compared to the quality of the software they described.

### It takes a village to raise good docs

In researching open source projects' documentation needs, it became clear that crafting good docs requires multiple skillsets. Ideally, a doc team has access to:

  * A developer with a deep understanding of the software being described
  * A software user who can explain the application within the context of the application's domain
  * An educator who understands the principles of learning
  * An information architect who understands how to structure material
  * A writer who writes clearly and concisely with good grammar
  * Someone who speaks English as a first language (for English docs)
  * A translator who is good at translating docs into multiple languages
  * A DevOps person who can set up doc-build pipelines
  * A community builder, facilitator, and coordinator who can inspire collective action, capture offers of help, and help all these different personas collaborate



Technical writers usually have a high-level understanding of most of these domains, and their skills are often under-appreciated and under-utilized, especially if they are directed with a vague "just clean up the grammar and stuff."

However, the best docs typically have been influenced by multiple stakeholders. This can be partly achieved by [using templates to collaborate][6] between domains, timeframes, projects, and organizations.

### Tools for documenting open source projects are painful

We experienced significant pain in trying to convert between software and [writing toolsets][7]. We love the versioning of Git, are frustrated by clunky Markdown interfaces, and want access to editing and review workflows in Word and Google Docs along with grammar and syntax plugin tools such as Grammarly. Translation tools such as Transifex are pretty cool, too.

Could someone please write an application that addresses this use case? Maybe there is an idea in here for a future [Google Summer of Code][8]?

### Achievements during OSGeo's Season of Docs

We're quite proud of our achievements during OSGeo's participation in Google's Season of Docs. Our allocated tech writers amplified the effectiveness of our existing documentation communities, and our documentation communities amplified the effectiveness of these tech writers:

  * [Felicity Brand][9] worked with around 50 of OSGeo's open source projects to update the Quickstarts as part of our [OSGeoLive][10] distribution of software.
  * [Swapnil Ogale][11] worked directly with [GeoNetwork's][12] documentation team, auditing the breadth and quality of docs, setting up templates for future docs, and updating many of the docs.



Further:

  * We kicked off the Good Docs Project to establish "best-practice templates and writing instructions for documenting open source software."
  * In conjunction with the [OGC][13] and [ISO][14] spatial standards communities, we kicked off an [OSGeo Lexicon][15] project to coordinate official definitions for terminology used within the OSGeo context. This will apply best-practice definitions to previously haphazard glossaries.
  * We did a [deep-dive analysis][16] of the documentation challenges faced by QGIS, one of OSGeo's most successful projects. Surprisingly, its biggest problem isn't a lack of tech writers or complicated tools (although they are factors). Key problems center around:
    * Poorly capturing community goodwill and offers of assistance
    * Lack of direction
    * Struggling to keep up with a rapidly evolving software baseline
    * Insufficient writing expertise
    * A high technical barrier to entry
    * Documentation and training being generated outside of the core project
    * Awkward documentation tools and processes



### Thanks, Google

We are grateful to Google for sponsoring Season of Docs. We've learned plenty from Felicity and Swapnil, the great writers that Google provided to us, and we hope what we have learned will help make future Season of Docs initiatives even better.

* * *

_This originally appeared on [Cameron Shorter's blog][17] and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/documentation

作者：[Cameron Shorter][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cameronshorter
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/typewriter-hands.jpg?itok=oPugBzgv (Typewriter with hands)
[2]: https://www.osgeo.org/
[3]: https://developers.google.com/season-of-docs
[4]: https://www.osgeo.org/about/committees/incubation/graduation/
[5]: https://thegooddocsproject.dev/
[6]: http://cameronshorter.blogspot.com/2019/02/inspiring-techies-to-become-great.html
[7]: https://opensource.com/article/20/3/open-source-writing-tools
[8]: https://summerofcode.withgoogle.com/
[9]: https://flicstar.com/2019/11/27/project-report-for-season-of-docs-2019/
[10]: https://live.osgeo.org/en/index.html
[11]: https://docs.google.com/document/d/1sTGz8aWPTS6moxgrtsBRz19roemJlilcdQk6B-9IZOo
[12]: https://geonetwork-opensource.org/
[13]: https://www.ogc.org/
[14]: https://committee.iso.org/home/tc211
[15]: https://wiki.osgeo.org/wiki/Lexicon_Committee
[16]: http://cameronshorter.blogspot.com/2019/12/why-qgis-docs-team-is-struggling.html
[17]: https://cameronshorter.blogspot.com/2020/03/insights-from-mixing-writers-with-open.html
