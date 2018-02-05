How Mycroft used WordPress and GitHub to improve its documentation
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/doc-dish-lead-2.png?itok=lPO6tqPd)

Image credits : Photo by Unsplash; modified by Rikki Endsley. CC BY-SA 4.0

Imagine you've just joined a new technology company, and one of the first tasks you're assigned is to improve and centralize the organization's developer-facing documentation. There's just one catch: That documentation exists in many different places, across several platforms, and differs markedly in accuracy, currency, and style.

So how did we tackle this challenge?

### Understanding the scope

As with any project, we first needed to understand the scope and bounds of the problem we were trying to solve. What documentation was good? What was working? What wasn't? How much documentation was there? What format was it in? We needed to do a **documentation audit**. Luckily, [Aneta Šteflova][1] had recently [published an article on OpenSource.com][2] about this, and it provided excellent guidance.

![mycroft doc audit][4]

Mycroft documentation audit, showing source, topic, medium, currency, quality and audience

Next, every piece of publicly facing documentation was assessed for the topic it covered, the medium it used, currency, and quality. A pattern quickly emerged that different platforms had major deficiencies, allowing us to make a data-driven approach to decommission our existing Jekyll-based sites. The audit also highlighted just how fragmented our documentation sources were--we had developer-facing documentation across no fewer than seven sites. Although search engines were finding this content just fine, the fragmentation made it difficult for developers and users of Mycroft--our primary audiences--to navigate the information they needed. Again, this data helped us make the decision to centralize our documentation on to one platform.

### Choosing a central platform

As an organization, we wanted to constrain the number of standalone platforms in use. Over time, maintenance and upkeep of multiple platforms and integration touchpoints becomes cumbersome for any organization, but this is exacerbated for a small startup.

One of the other business drivers in platform choice was that we had two primary but very different audiences. On one hand, we had highly technical developers who we were expecting would push documentation to its limits--and who would want to contribute to technical documentation using their tools of choice--[Git][5], [GitHub][6], and [Markdown][7]. Our second audience--end users--would primarily consume technical documentation and would want to do so in an inviting, welcoming platform that was visually appealing and provided additional features such as the ability to identify reading time and to provide feedback. The ability to capture feedback was also a key requirement from our side as without feedback on the quality of the documentation, we would not have a solid basis to undertake continuous quality improvement.

Would we be able to identify one platform that met all of these competing needs?

We realised that two platforms covered all of our needs:

  * [WordPress][8]: Our existing website is built on WordPress, and we have some reasonably robust WordPress skills in-house. The flexibility of WordPress also fulfilled our requirements for functionality like reading time and the ability to capture user feedback.
  * [GitHub][9]: Almost [all of Mycroft.AI's source code is available on GitHub][10], and our development team uses this platform daily.



But how could we marry the two?


![](https://opensource.com/sites/default/files/images/life-uploads/wordpress-github-sync.png)

### Integrating WordPress and GitHub with WordPress GitHub Sync

Luckily, our COO, [Nate Tomasi][11], spotted a WordPress plugin that promised to integrate the two.

This was put through its paces on our test website, and it passed with flying colors. It was easy to install, had a straightforward configuration, which just required an OAuth token and webhook with GitHub, and provided two-way integration between WordPress and GitHub.

It did, however, have a dependency--on Markdown--which proved a little harder to implement. We trialed several Markdown plugins, but each had several quirks that interfered with the rendering of non-Markdown-based content. After several days of frustration, and even an attempt to custom-write a plugin for our needs, we stumbled across [Parsedown Party][12]. There was much partying! With WordPress GitHub Sync and Parsedown Party, we had integrated our two key platforms.

Now it was time to make our content visually appealing and usable for our user audience.

### Reading time and feedback

To implement the reading time and feedback functionality, we built a new [page template for WordPress][13], and leveraged plugins within the page template.

Knowing the estimated reading time of an article in advance has been [proven to increase engagement with content][14] and provides developers and users with the ability to decide whether to read the content now or bookmark it for later. We tested several WordPress plugins for reading time, but settled on [Reading Time WP][15] because it was highly configurable and could be easily embedded into WordPress page templates. Our decision to place Reading Time at the top of the content was designed to give the user the choice of whether to read now or save for later. With Reading Time in place, we then turned our attention to gathering user feedback and ratings for our documentation.

![](https://opensource.com/sites/default/files/images/life-uploads/screenshot-from-2017-12-08-00-55-31.png)

There are several rating and feedback plugins available for WordPress. We needed one that could be easily customized for several use cases, and that could aggregate or summarize ratings. After some experimentation, we settled on [Multi Rating Pro][16] because of its wide feature set, especially the ability to create a Review Ratings page in WordPress--i.e., a central page where staff can review ratings without having to be logged in to the WordPress backend. The only gap we ran into here was the ability to set the display order of rating options--but it will likely be added in a future release.

The WordPress GitHub Integration plugin also gave us the ability to link back to the GitHub repository where the original Markdown content was held, inviting technical developers to contribute to improving our documentation.

### Updating the existing documentation

Now that the "container" for our new documentation had been developed, it was time to update the existing content. Because much of our documentation had grown organically over time, there were no style guidelines to shape how keywords and code were styled. This was tackled first, so that it could be applied to all content. [You can see our content style guidelines on GitHub.][17]

As part of the update, we also ran several checks to ensure that the content was technically accurate, augmenting the existing documentation with several images for better readability.

There were also a couple of additional tools that made creating internal links for documentation pieces easier. First, we installed the [WP Anchor Header][18] plugin. This plugin provided a small but important function: adding `id` content in GitHub using the `[markdown-toc][19]` library, then simply copied in to the WordPress content, where they would automatically link to the `id` attributes to each `<h1>`, `<h2>` (and so on) element. This meant that internal anchors could be automatically generated on the command line from the Markdown content in GitHub using the `[markdown-toc][19]` library, then simply copied in to the WordPress content, where they would automatically link to the `id` attributes generated by WP Anchor Header.

Next, we imported the updated documentation into WordPress from GitHub, and made sure we had meaningful and easy-to-search on slugs, descriptions, and keywords--because what good is excellent documentation if no one can find it?! A final activity was implementing redirects so that people hitting the old documentation would be taken to the new version.

### What next?

[Please do take a moment and have a read through our new documentation][20]. We know it isn't perfect--far from it--but we're confident that the mechanisms we've baked into our new documentation infrastructure will make it easier to identify gaps--and resolve them quickly. If you'd like to know more, or have suggestions for our documentation, please reach out to Kathy Reid on [Chat][21] (@kathy-mycroft) or via [email][22].

_Reprinted with permission from[Mycroft.ai][23]._

### About the author
Kathy Reid - Director of Developer Relations @MycroftAI, President of @linuxaustralia. Kathy Reid has expertise in open source technology management, web development, video conferencing, digital signage, technical communities and documentation. She has worked in a number of technical and leadership roles over the last 20 years, and holds Arts and Science undergraduate degrees... more about Kathy Reid

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/rocking-docs-mycroft

作者：[Kathy Reid][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/kathyreid
[1]:https://opensource.com/users/aneta
[2]:https://opensource.com/article/17/10/doc-audits
[3]:/file/382466
[4]:https://opensource.com/sites/default/files/images/life-uploads/mycroft-documentation-audit.png (mycroft documentation audit)
[5]:https://git-scm.com/
[6]:https://github.com/MycroftAI
[7]:https://en.wikipedia.org/wiki/Markdown
[8]:https://www.wordpress.org/
[9]:https://github.com/
[10]:https://github.com/mycroftai
[11]:http://mycroft.ai/team/
[12]:https://wordpress.org/plugins/parsedown-party/
[13]:https://developer.wordpress.org/themes/template-files-section/page-template-files/
[14]:https://marketingland.com/estimated-reading-times-increase-engagement-79830
[15]:https://jasonyingling.me/reading-time-wp/
[16]:https://multiratingpro.com/
[17]:https://github.com/MycroftAI/docs-rewrite/blob/master/README.md
[18]:https://wordpress.org/plugins/wp-anchor-header/
[19]:https://github.com/jonschlinkert/markdown-toc
[20]:https://mycroft.ai/documentation
[21]:https://chat.mycroft.ai/
[22]:mailto:kathy.reid@mycroft.ai
[23]:https://mycroft.ai/blog/improving-mycrofts-documentation/
