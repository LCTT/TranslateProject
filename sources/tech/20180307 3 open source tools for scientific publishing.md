3 open source tools for scientific publishing
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_science.png?itok=WDKARWGV)
One industry that lags behind others in the adoption of digital or open source tools is the competitive and lucrative world of scientific publishing. Worth over £19B ($26B) annually, according to figures published by Stephen Buranyi in [The Guardian][1] last year, the system for selecting, publishing, and sharing even the most important scientific research today still bears many of the constraints of print media. New digital-era technologies present a huge opportunity to accelerate discovery, make science collaborative instead of competitive, and redirect investments from infrastructure development into research that benefits society.

The non-profit [eLife initiative][2] was established by the funders of research, in part to encourage the use of these technologies to this end. In addition to publishing an open-access journal for important advances in life science and biomedical research, eLife has made itself into a platform for experimentation and showcasing innovation in research communication—with most of this experimentation based around the open source ethos.

Working on open publishing infrastructure projects gives us the opportunity to accelerate the reach and adoption of the types of technology and user experience (UX) best practices that we consider important to the advancement of the academic publishing industry. Speaking very generally, the UX of open source products is often left undeveloped, which can in some cases dissuade people from using it. As part of our investment in OSS development, we place a strong emphasis on UX in order to encourage users to adopt these products.

All of our code is open source, and we actively encourage community involvement in our projects, which to us means faster iteration, more experimentation, greater transparency, and increased reach for our work.

The projects that we are involved in, such as the development of Libero (formerly known as [eLife Continuum][3]) and the [Reproducible Document Stack][4], along with our recent collaboration with [Hypothesis][5], show how OSS can be used to bring about positive changes in the assessment, publication, and communication of new discoveries.

### Libero

Libero is a suite of services and applications available to publishers that includes a post-production publishing system, a full front-end user interface pattern suite, Libero's Lens Reader, an open API, and search and recommendation engines.

Last year, we took a user-driven approach to redesigning the front end of Libero, resulting in less distracting site “furniture” and a greater focus on research articles. We tested and iterated all the key functional areas of the site with members of the eLife community to ensure the best possible reading experience for everyone. The site’s new API also provides simpler access to content for machine readability, including text mining, machine learning, and online application development.

The content on our website and the patterns that drive the new design are all open source to encourage future product development for both eLife and other publishers that wish to use it.

### The Reproducible Document Stack

In collaboration with [Substance][6] and [Stencila][7], eLife is also engaged in a project to create a Reproducible Document Stack (RDS)—an open stack of tools for authoring, compiling, and publishing computationally reproducible manuscripts online.

Today, an increasing number of researchers are able to document their computational experiments through languages such as [R Markdown][8] and [Python][9]. These can serve as important parts of the experimental record, and while they can be shared independently from or alongside the resulting research article, traditional publishing workflows tend to relegate these assets as a secondary class of content. To publish papers, researchers using these languages often have little option but to submit their computational results as “flattened” outputs in the form of figures, losing much of the value and reusability of the code and data references used in the computation. And while electronic notebook solutions such as [Jupyter][10] can enable researchers to publish their code in an easily reusable and executable form, that’s still in addition to, rather than as an integral part of, the published manuscript.

The [Reproducible Document Stack][11] project aims to address these challenges through development and publication of a working prototype of a reproducible manuscript that treats code and data as integral parts of the document, demonstrating a complete end-to-end technology stack from authoring through to publication. It will ultimately allow authors to submit their manuscripts in a format that includes embedded code blocks and computed outputs (statistical results, tables, or graphs), and have those assets remain both visible and executable throughout the publication process. Publishers will then be able to preserve these assets directly as integral parts of the published online article.

### Open annotation with Hypothesis

Most recently, we introduced open annotation in collaboration with [Hypothesis][12] to enable users of our website to make comments, highlight important sections of articles, and engage with the reading public online.

Through this collaboration, the open source Hypothesis software was customized with new moderation features, single sign-on authentication, and user-interface customization options, giving publishers more control over its implementation on their sites. These enhancements are already driving higher-quality discussions around published scholarly content.

The tool can be integrated seamlessly into publishers’ websites, with the scholarly publishing platform [PubFactory][13] and content solutions provider [Ingenta][14] already taking advantage of its improved feature set. [HighWire][15] and [Silverchair][16] are also offering their publishers the opportunity to implement the service.

### Other industries and open source

Over time, we hope to see more publishers adopt Hypothesis, Libero, and other projects to help them foster the discovery and reuse of important scientific research. But the opportunities for innovation eLife has been able to leverage because of these and other OSS technologies are also prevalent in other industries.

The world of data science would be nowhere without the high-quality, well-supported open source software and the communities built around it; [TensorFlow][17] is a leading example of this. Thanks to OSS and its communities, all areas of AI and machine learning have seen rapid acceleration and advancement compared to other areas of computing. Similar is the explosion in usage of Linux as a cloud web host, followed by containerization with Docker, and now the growth of Kubernetes, one of the most popular open source projects on GitHub.

All of these technologies enable organizations to do more with less and focus on innovation instead of reinventing the wheel. And in the end, that’s the real benefit of OSS: It lets us all learn from each other’s failures while building on each other's successes.

We are always on the lookout for opportunities to engage with the best emerging talent and ideas at the interface of research and technology. Find out more about some of these engagements on [eLife Labs][18], or contact [innovation@elifesciences.org][19] for more information.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/scientific-publishing-software

作者：[Paul Shanno][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/pshannon
[1]:https://www.theguardian.com/science/2017/jun/27/profitable-business-scientific-publishing-bad-for-science
[2]:https://elifesciences.org/about
[3]:https://elifesciences.org/inside-elife/33e4127f/elife-introduces-continuum-a-new-open-source-tool-for-publishing
[4]:https://elifesciences.org/for-the-press/e6038800/elife-supports-development-of-open-technology-stack-for-publishing-reproducible-manuscripts-online
[5]:https://elifesciences.org/for-the-press/81d42f7d/elife-enhances-open-annotation-with-hypothesis-to-promote-scientific-discussion-online
[6]:https://github.com/substance
[7]:https://github.com/stencila/stencila
[8]:https://rmarkdown.rstudio.com/
[9]:https://www.python.org/
[10]:http://jupyter.org/
[11]:https://elifesciences.org/labs/7dbeb390/reproducible-document-stack-supporting-the-next-generation-research-article
[12]:https://github.com/hypothesis
[13]:http://www.pubfactory.com/
[14]:http://www.ingenta.com/
[15]:https://github.com/highwire
[16]:https://www.silverchair.com/community/silverchair-universe/hypothesis/
[17]:https://www.tensorflow.org/
[18]:https://elifesciences.org/labs
[19]:mailto:innovation@elifesciences.org
