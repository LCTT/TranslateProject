[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (AI system analyzes code similarities, makes progress toward automated coding)
[#]: via: (https://www.networkworld.com/article/3570389/ai-system-analyzes-code-similarities-makes-progress-toward-automated-coding.html)
[#]: author: (Patrick Nelson https://www.networkworld.com/author/Patrick-Nelson/)

AI system analyzes code similarities, makes progress toward automated coding
======
Researchers from Intel, MIT and Georgia Tech are working on an AI engine that can analyze code similarities to determine what code actually does, setting the stage for automated software writing.
Monsitj / Getty Images

With the rapid advances in artificial intelligence (AI), are we getting to the point when computers will be smart enough to write their own code and be done with human coders? New research suggests we might be getting closer to that milestone.

Researchers from MIT and Georgia Tech teamed with Intel to develop an AI engine, dubbed Machine Inferred Code Similarity (MISIM), that's designed to analyze software code and determine how it's similar to other code. What's most interesting is the potential for the system to learn what bits of code do, and then use that intelligence to change how software is written. Ultimately, a human could explain what it wants a software program to do, and then a machine programming (MP) system could come up with a coded app to accomplish it.

**READ MORE:** [How AI can create self-driving data centers][1]

"When fully realized, MP will enable everyone to create software by expressing their intention in whatever fashion that's best for them, whether that's code, natural language or something else," said Justin Gottschlich, principal scientist and director/founder of machine programming research at Intel, in the company's [press release][2]. "That's an audacious goal, and while there's much more work to be done, MISIM is a solid step toward it."

### How it works

Neural networks give similarity scores to snippets of code "based on the jobs they are designed to carry out," Intel explains. Two code samples may look completely different but be rated the same because they perform the same function, for example. The algorithm can then determine which code snippet is more efficient.

Primitive versions of code-similarity systems are used in plagiarism detection, for example. With MISIM, however, the algorithm looks at chunks of code and attempts to ascertain contextually whether the snippets have similar characteristics or are aiming for similar objectives. It can then offer improvements in performance, for example, or general efficiency.

What's critical with MISIM is the intent of the creator, and it marks an advancement towards intent-based programming, which could enable software to be designed based on what a non-programmer creator wants to achieve. With intent-based programming, an algorithm draws on a pool of open source code rather than relying on the traditional, manual method of compiling a series of step-like programming instructions, line-by-line, telling a computer how to do something.

"A core differentiation between MISIM and existing code-similarity systems lies in its novel context-aware semantic structure (CASS), which aims to lift out what the code actually does. Unlike other existing approaches, CASS can be configured to a specific context, allowing it to capture information that describes the code at a higher level. CASS can provide more specific insight into what the code does rather than how it does it," Intel explains.

This is accomplished without a compiler (a stage used in programming that converts human-readable code into the computer program). Conveniently, partial snippets can be executed just to see what happens in that piece of code. Plus, the system gets rid of some of the more tedious parts of software development, like line-by-line bug finding. More details are available in the group's paper ([PDF][3])

Intel says the team's MISIM system is 40-times more accurate identifying similar code than previous code similarity systems.

Heres_your_sign, a Redditor [commenting on blog coverage of MISIM][4], amusingly points out that thankfully the computers aren't writing the requirements too. That would be asking for trouble, the Redditor believes.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3570389/ai-system-analyzes-code-similarities-makes-progress-toward-automated-coding.html

作者：[Patrick Nelson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Patrick-Nelson/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3568354/how-ai-can-create-self-driving-data-centers.html
[2]: https://newsroom.intel.com/news/intel-mit-georgia-tech-machine-programming-code-similarity-system/#gs.d8qd40
[3]: https://arxiv.org/pdf/2006.05265.pdf
[4]: https://www.reddit.com/r/technology/comments/i2dxed/this_ai_could_bring_us_computers_that_can_write/
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
