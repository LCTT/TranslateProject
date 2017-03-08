StdioA translating

How to make release notes count
============================================================

 ![How to make release notes count](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/rh_003784_02_os.comcareers_resume_rh1x.png?itok=CK6VJq5w "How to make release notes count") 
>Image by : opensource.com

Congratulations! You're ready to ship the latest release of your software package. Now you need to make sure your release notes are in order. Sure, you could just slap "bug fixes and performance improvements" on the box and call it a day, but that doesn't really tell your users anything.

Release notes are for both support and marketing. They tell your current users why this new release is important to them and showcase your software to potential users. Thus, you want to make the content clear, understandable, and most importantly, relevant. There's no one way to write release notes, so this is general advice, not an edict.

One popular trend is to make the release notes a narrative that includes a lot of silliness. If that's your thing, go for it—just remember that jokes are often context-sensitive, and what you think is hilarious might be totally lost on your readers. And, of course, you can't forget to include the important information.

### Getting started

Perhaps the single most important takeaway from this article is to write your release notes for the people who will read them. For user-facing software, focus on the user-facing behavior instead of the internal implementation. For example, say, "Clicking the 'Cancel' button will light your computer on fire," instead of "thermalEventTrigger defaulted to True in the cancelThatThing function."

Try to limit each note to a sentence or two. The point is to highlight the important part, not give a detailed explanation. If you have a public issue tracker, include a link (or at least an issue number) where readers can go find details if they're so inclined.

You don't have to lay out your release notes this way, but I like the following format. Start with the version number and release date. For major releases, you might also include a few sentences to highlight the major theme. For example, "This release focuses on adding an email client, because that's the eventual end state of all software."

### Compatibility changes

If the new release introduces changes in compatibility or default behavior, highlight those explicitly. Your users will thank you, as will anyone who provides user support. Describe the cases where the behavior change will be encountered, how to address the change, and what happens if the user doesn't act on the change. For minor releases, you probably don't have any incompatible changes, so you can leave out this section.

### Features and enhancements

Now is the time to brag about all of the cool, new stuff your software does, but remember to focus on the user's perspective. For example, "The software now supports the automatic detection of pictures of lunch and posts them to Instagram."

### Issues resolved

No software is perfect, and this is the section where you tell readers about all of the hard work your team did to make the project a little better. Write these notes in the past tense, because the bad behavior is dead and gone. If it's clear where the bug was introduced, include that information. Some projects include bugs in the documentation in this section as well.

### Known issues

Because no software is perfect, there are always bugs left unsquashed. This section is the place to list those. You don't have to confess everything; focus on the bugs that impact functionality, especially if they were discovered since the last release. Write these in the future tense, and when you've addressed it, you just have to change the verb tense and it's ready to move up a section.

--------------------------------------------------------------------------------

作者简介：

Ben Cotton - Ben Cotton is a meteorologist by training and a high-performance computing engineer by trade. Ben works as a technical evangelist at Cycle Computing. He is a Fedora user and contributor, co-founded a local open source meetup group, and is a member of the Open Source Initiative and a supporter of Software Freedom Conservancy. Find him on Twitter (@FunnelFiasco) 


--------------

via: https://opensource.com/article/17/3/how-to-improve-release-notes

作者：[Ben Cotton][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bcotton
[1]:https://opensource.com/article/17/3/how-to-improve-release-notes?rate=81ry_1MGfmsPXV6_y_4St2DQI4XyJAqIzs4yTNtUrpA
[2]:https://opensource.com/user/30131/feed
[3]:https://opensource.com/article/17/3/how-to-improve-release-notes#comments
[4]:https://opensource.com/users/bcotton
