How to create mobile-friendly documentation
======
![配图](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/idea_innovation_mobile_phone.png?itok=RqVtvxkd)
I'm not sold on the whole idea of [mobile first][1], but I do know that more people than ever are using mobile devices like smartphones and tablets to get information on the go. That includes online software and hardware documentation, much of which is lengthy and poorly suited for small screens. Often, it doesn't scale properly, and it can be difficult to navigate.

When people access documentation using a mobile device, they usually want a quick hit of information to learn how to perform a task or solve a problem. They don't want to wade through seemingly endless pages to find the specific piece of information they need. Fortunately, it's not hard to address this problem. Here are a few tips to help you structure your documentation to meet the needs of mobile readers.

### Think short

That means short sentences, short paragraphs, and short procedures. You're not writing a novel or a piece of long-form journalism. Make your documentation concise. Use as few words as possible to get ideas and information across.

Use a radio news report as a guide: Focus on the key elements and explain them in simple, direct language. Don't make your reader wade through screen after screen of turgid text.

Focus on the key elements and explain them in simple, direct language.

Also, get straight to the point. Focus on the information readers need when they need it. Documentation published online shouldn't resemble the thick manuals of yore. Don't lump everything together on a single page. Break your information into smaller chunks. Here's how to do that:

### Think topics

Also, get straight to the point. Focus on the information readers need when they need it. Documentation published online shouldn't resemble the thick manuals of yore. Don't lump everything together on a single page. Break your information into smaller chunks. Here's how to do that:

In the technical writing world, topics are individual, stand-alone chunks of information. Each topic comprises a single page on your site. Readers should be able to get the information they need--and only that information--from a specific topic. To make that happen, choose which topics to include in your documentation and decide how to organize them:

### Think DITA

[Darwin Information Typing Architecture][2], or DITA, is an XML model for writing and publishing. It's been [widely adopted][3] in the technical writing world, especially for longer documentation sets.

I'm not suggesting that you convert your documentation to XML (unless you really want to). Instead, consider applying DITA's concept of separate types of topics to your documentation:

  * General: overview information
  * Task: step-by-step procedures
  * Concept: background or conceptual information
  * Reference: specialized information like API references or data dictionaries
  * Glossary: to define terms
  * Troubleshooting: information on problems users may encounter and how to fix them



You'll wind up with a lot of individual pages. To connect those pages:

### Think linking

Many content management systems, wikis, and publishing frameworks include some form of navigation--usually a table of contents or [breadcrumbs][4]. It's the kind of navigation that fades into the background on a mobile device.

For stronger navigation, add explicit links between topics. Place those links at the end of each topic with the heading **See Also** or **Related Topics**. Each section should contain two to five links that point to overview, concept, and reference topics related to the current topic.

If you need to point to information outside of your documentation set, make sure the link opens in a new browser tab. That sends the reader to another site while also keeping them on your site.

If you need to point to information outside of your documentation set, make sure the link opens in a new browser tab.

That takes care of the text. What about graphics?

### Think unadorned

That takes care of the text. What about graphics?

With a few exceptions, images don't add much to documentation. Take a critical look at each image in your documentation. Then ask:

  * Does it serve a purpose?
  * Does it enhance the documentation?
  * Will readers miss this image if I remove it?



With a few exceptions, images don't add much to documentation.

If the answer to those questions is no, remove the image.

If the answer to those questions is no, remove the image.

On the other hand, if you absolutely can't do without an image, make it [responsive][5]. That way, the image will automatically resize to fit in a smaller screen.

If you're still not sure about an image, Opensource.com community moderator Ben Cotton offers an [excellent explanation][6] of when to use screen captures in documentation.

### A final thought

With a little effort, you can structure your documentation to work well for mobile device users. Another plus: These changes improve documentation for desktop computer and laptop users, too.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/12/think-mobile

作者：[Scott Nesbitt][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/chrisshort
[1]:https://www.uxmatters.com/mt/archives/2012/03/mobile-first-what-does-it-mean.php
[2]:https://en.wikipedia.org/wiki/Darwin_Information_Typing_Architecture
[3]:http://dita.xml.org/book/list-of-organizations-using-dita
[4]:https://en.wikipedia.org/wiki/Breadcrumb_(navigation)
[5]:https://en.wikipedia.org/wiki/Responsive_web_design
[6]:https://opensource.com/business/15/9/when-does-your-documentation-need-screenshots
