[#]: subject: (New open source project helps musicians jam together even when they’re not together)
[#]: via: (https://www.linux.com/news/new-open-source-project-helps-musicians-jam-together-even-when-theyre-not-together/)
[#]: author: (Jason Perlow https://www.linux.com/author/jperlow/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

New open source project helps musicians jam together even when they’re not together
======

Today, the Linux Foundation announced that it would be adding [Rend-o-matic][1] to the list of [Call for Code][2] open source projects that it hosts. The Rend-o-matic technology was originally developed as part of the [Choirless][3] project during a Call for Code challenge as a way to enable musicians to jam together regardless of where they are. Initially developed to help musicians socially distance because of COVID 19, the application has many other benefits, including bringing together musicians from different parts of the world and allowing for multiple versions of a piece of music featuring various artist collaborations. The artificial intelligence powering Choirless ensures that the consolidated recording stays accurately synchronized even through long compositions, and this is just one of the pieces of software being released under the new Rend-o-matic project.

[Developer Diaries – Uniting musicians with AI and IBM Cloud Functions
][4]

Created by a team of musically-inclined IBM developers, the Rend-o-matic project features a web-based interface that allows artists to record their individual segments via a laptop or phone. The individual segments are processed using acoustic analysis and AI to identify common patterns across multiple segments which are then automatically synced and output as a single track. Each musician can record on their own time in their own place with each new version of the song available as a fresh MP3 track. In order to scale the compute needed by the AI, the application uses IBM Cloud Functions in a serverless environment that can effortlessly scale up or down to meet demand without the need for additional infrastructure updates. Rend-o-matic is itself built upon open source technology, using Apache OpenWhisk, Apache CouchDB, Cloud Foundry, Docker, Python, Node.js, and FFmpeg. 

Since its creation, Choirless has been incubated and improved as a Call for Code project, with an [enhanced algorithm][3], increased availability, real-time audio-level visualizations, and more. The solution has been released for testing, and as of January, users of the hosted Choirless service built upon the Rend-o-matic project – including school choirs, professional musicians, and bands – have recorded 2,740 individual parts forming 745 distinct performances.

Call for Code invites developers and problem-solvers around the world to build and contribute to sustainable, open source technology projects that address social and humanitarian issues while ensuring the top solutions are deployed to make a demonstrable difference.  [Learn more about Call for Code][2]. You can learn more about Rend-o-matic, sample the technology, and contribute back to the project at <https://choirless.github.io/> 

The post [New open source project helps musicians jam together even when they’re not together][5] appeared first on [Linux Foundation][6].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/new-open-source-project-helps-musicians-jam-together-even-when-theyre-not-together/

作者：[Jason Perlow][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/jperlow/
[b]: https://github.com/lujun9972
[1]: https://www.linuxfoundation.org/projects/call-for-code/%5D
[2]: https://developer.ibm.com/callforcode
[3]: https://www.ibm.com/thought-leadership/passion-projects/choirless
[4]: https://developer.ibm.com/videos/dev-diaries-app-modernization-serverless/
[5]: https://www.linuxfoundation.org/en/blog/new-open-source-project-helps-musicians-jam-together-even-when-theyre-not-together/
[6]: https://www.linuxfoundation.org/
