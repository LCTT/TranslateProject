[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (New research article type embeds live code and data)
[#]: via: (https://opensource.com/article/19/8/reproducible-research)
[#]: author: (Giuliano Maciocci https://opensource.com/users/gmacioccihttps://opensource.com/users/etsang)

New research article type embeds live code and data
======
The non-profit scientific research publication platform eLife recently
announced the Reproducible Document Stack (RDS).
![magnifying glass on computer screen][1]

While science is supposed to be about building on each other's findings to improve our understanding of the world around us, reproducing and reusing previously published results remains challenging, even in the age of the internet. The basic format of the scientific paper—the primary means through which scientists communicate their findings—has more or less remained the same since the first papers were published in the 18th century.

This is particularly problematic because, thanks to the technological advancements in research over the last two decades, the richness and sophistication of the methods used by researchers have far outstripped the publishing industry's ability to publish them in full. Indeed, the Methods section in research articles remains primarily a huge section of text that does not reflect the complexity or facilitate the reuse of the methods used to obtain the published results.

### Working together on a solution

To counter these challenges, eLife [teamed up][2] with [Substance][3] and [Stencila][4] in 2017 to develop a stack of open source tools for authoring, compiling, and publishing computationally reproducible manuscripts online. Our vision for the project is to create a new type of research article that embeds live code, data, and interactive figures within the flow of the traditional manuscript and to provide authors and publishers with the tools to support this new format throughout the publishing lifecycle.

As a result of our collaboration, we published eLife's [first computationally reproducible article][5] in February 2019. It was based on [a paper][6] in the [Reproducibility Project: Cancer Biology][7] collection. The reproducible version of the article showcases some of the possibilities with the new RDS tools: scientists can share the richness of their research more fully, telling the complete story of their work, while others can directly interact with the authors, interrogate them, and build on their code and data with minimal effort.

The response from the research community to the release of our first reproducible manuscript was overwhelmingly positive. Thousands of scientists explored the paper's inline code re-execution abilities by manipulating its plots, and several authors approached us directly to ask how they might publish a reproducible version of their own manuscripts.

Encouraged by this interest and feedback, [in May we announced][8] our roadmap towards an open, scalable infrastructure for the publication of computationally reproducible articles. The goal of this next phase in the RDS project is to ship researcher-centered, publisher-friendly open source solutions that will allow for the hosting and publication of reproducible documents, at scale, by anyone. This includes:

  1. Developing conversion, rendering, and authoring tools to allow researchers to compose articles from multiple starting points, including GSuite tools, Microsoft Word, and Jupyter notebooks
  2. Optimizing containerization tools to provide reliant and performant reproducible computing environments
  3. Building the backend infrastructure needed to enable the options for live-code re-execution in the browser and PDF export at the same time
  4. Formalizing an open, portable format (DAR) for reproducible document archives



### What's next, and how can you get involved?

Our first step is to publish reproducible articles as companions of already accepted papers. We will endeavor to accept submissions of reproducible manuscripts in the form of DAR files by the end of 2019. You can learn more about the key areas of innovation in this next phase of development in our article "[Reproducible Document Stack: Towards a scalable solution for reproducible articles][8]."

The RDS project is being built with three core principles in mind:

  * **Openness:** We prioritize building on top of existing open technologies as well as engaging and involving a community of open source technologists and researchers to create an inclusive tool stack that evolves continuously based on user needs.
  * **Interoperability:** We want to make it easy for scientists to create and for publishers to publish reproducible documents from multiple starting points.
  * **Modularity:** We're developing tools within the stack in such a way that they can be taken out and integrated into other publisher workflows.



And you can help. We welcome all developers and researchers who wish to contribute to this exciting project. Since the release of eLife's first reproducible article, we have been actively collecting feedback from both the research and open source communities, and this has been (and will continue to be) crucial to shaping the development of the RDS.

If you'd like to stay up to date on our progress, please sign up for the [RDS community newsletter][9]. For any questions or comments, please [contact us][10]. We look forward to having you with us on the journey.

* * *

_This article is based in part on "[Reproducible Document Stack: Towards a scalable solution for reproducible articles][8]" by Giuliano Maciocci, Emmy Tsang, Nokome Bentley, and Michael Aufreiter._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/reproducible-research

作者：[Giuliano Maciocci][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gmacioccihttps://opensource.com/users/etsang
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_issue_bug_programming.png?itok=XPrh7fa0 (magnifying glass on computer screen)
[2]: https://elifesciences.org/for-the-press/e6038800/elife-supports-development-of-open-technology-stack-for-publishing-reproducible-manuscripts-online
[3]: https://substance.io/
[4]: https://stenci.la/
[5]: https://repro.elifesciences.org/example.html
[6]: https://elifesciences.org/articles/30274
[7]: https://osf.io/e81xl/wiki/home/
[8]: https://elifesciences.org/labs/b521cf4d/reproducible-document-stack-towards-a-scalable-solution-for-reproducible-articles
[9]: https://crm.elifesciences.org/crm/RDS-updates
[10]: mailto:innovation@elifesciences.org
