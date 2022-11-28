[#]: subject: (A DevOps guide to documentation)
[#]: via: (https://opensource.com/article/21/3/devops-documentation)
[#]: author: (Will Kelly https://opensource.com/users/willkelly)
[#]: collector: (lujun9972)
[#]: translator: (Veryzzj)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
A DevOps guide to documentation
======

Bring your documentation writing into the DevOps lifecycle.
![Typewriter with hands][1]

DevOps is challenging technical documentation norms like at no other time in IT history. From automation to increased delivery velocity to dismantling the waterfall software development lifecycle model, these all spell the need for making dramatic changes to business and the philosophy of technical documentation.

Here are some ways DevOps is influencing technical documentation.

### The technical writer's changing role

The technical writer's role must adapt to DevOps. The good news is that many technical writers are already embedded in development teams, and they may have a leg up by already having collaborative relationships and growing knowledge of the product.

But you have some pivoting to do if your technical writers are used to working in siloes and relying on drafts written by subject matter experts as the basis for documentation.

Make the investments to ensure your documentation and other project-related content development efforts gain the tools, structure, and support they require. Start by changing your [technical writer hiring practices][2]. Documentation at the [speed of DevOps][3] requires rethinking your content strategy and breaking down longstanding silos between your DevOps team and the technical writer assigned to support the project.

DevOps also causes development teams to break away from the rigors of traditional documentation practices. Foremost, documentation's [definition of done][4] must change. Some corporate cultures make the technical writer a passive participant in software development. DevOps makes new demands—as the DevOps cultural transformation goes, so does the technical writer's role. Writers will need (and must adjust to) the transparency DevOps offers. They must integrate into DevOps teams. Depending on how an organization casts the role, bringing the technical writer into the team may present skillset challenges.

### Documentation standards, methodologies, and specifications

While DevOps has yet to influence technical documentation itself, the open source community has stepped up to help with application programming interface (API) documentation that's finding use among DevOps teams in enterprises of all sizes.

Open source specifications and tools for documenting APIs are an exciting area to watch. I'd like to think it is due to the influence of [Google Season of Docs][5], which gives open source software projects access to professional technical writing talent to tackle their most critical documentation projects.

Open source APIs are available and need to become part of the DevOps documentation discussion. The importance of cloud-native application integration requirements is on the rise. The [OpenAPI specification][6]—an open standard for defining and documenting an API—is a good resource for API documentation in DevOps environments. However, a significant criticism is that the specification can make documentation time-consuming to create and keep current.

There were brief attempts to create a [Continuous Documentation][7] methodology. There was also a movement to create a [DocOps][8] Framework that came out of CA (now Broadcom). Despite its initial promise, DocOps never caught on as an industry movement.

The current state of DevOps documentation standards means your DevOps teams (including your technical writer) need to begin creating documentation at the earliest stages of a project. You do this by adding documentation as both an agile story and (just as important) as a management expectation; you enforce it by tying it to annual performance reviews.

### Documentation tools

DevOps documentation authoring should occur online in a format or a platform accessible to all team members. MediaWiki, DokuWiki, TikiWiki, and other [open source wikis][9] offer DevOps teams a central repository for authoring and maintaining documentation.

Let teams choose their wiki just as you let them choose their other continuous integration/continuous development (CI/CD) toolchains. Part of the power of open source wikis is their extensibility. For example, DokuWiki includes a range of extensions you can install to create an authoring platform that meets your DevOps team's authoring requirements.

If you're ambitious enough to bolster your team's authoring and collaboration capabilities, [Nextcloud][10] (an open source cloud collaboration suite) is an option for putting your DevOps teams online and giving them the tools they need to author documentation.

### DevOps best practices

Documentation also plays a role in DevOps transformation. You're going to want to document the best practices that help your organization realize efficiency and process gains from DevOps. This information is too important to communicate only by word of mouth across your DevOps teams. Documentation is a unifying force if your organization has multiple DevOps teams; it promotes standardization of best practices and sets you up to capture and benchmark metrics for code quality.

Often it's developers who shoulder the work of documenting DevOps practices. Even if their organizations have technical writers, they might work across development teams. Thus, it's important that developers and sysadmins can capture, document, and communicate their best practices. Here are some tips to get that effort going in the right direction:

* Invest the time upfront to create a standard template for your DevOps best practices. Don't fall into the trap of copying a template you find online. Interview your stakeholders and teams to create a template that meets your team's needs.
* Look for ways to be creative with information gathering, such as recording your team meetings and using chat system logs to serve as a foundation for your documentation.
* Establish a wiki for publishing your best practices. Use a wiki that lets you maintain an audit trail of edits and updates. Such a platform sets your teams up to update and maintain best practices as they change.

It's smart to document dependencies as you build out your CI/CD toolchains. Such an effort pays off when you onboard new team members. It's also a little bit of insurance when a team member forgets something.

Finally, automation is enticing to DevOps stakeholders and practitioners alike. It's all fun and games until automation breaks. Having documentation for automation run books, admin guides, and other things in place (and up to date) means your staff can get automation working again regardless of when it breaks down.

### Final thoughts

DevOps is a net positive for technical documentation. It pulls content development into the DevOps lifecycle and breaks down the siloes between developers and technical writers within the organizational culture. Without the luxury of a technical writer, teams get the tools to accelerate their document authoring's velocity to match the speed of DevOps.

What is your organization doing to bring documentation into the DevOps lifecycle? Please share your experience in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/devops-documentation

作者：[Will Kelly][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/willkelly
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/typewriter-hands.jpg?itok=oPugBzgv (Typewriter with hands)
[2]: https://opensource.com/article/19/11/hiring-technical-writers-devops
[3]: https://searchitoperations.techtarget.com/opinion/Make-DevOps-documentation-an-integral-part-of-your-strategy?_ga=2.73253915.980148481.1610758264-908287796.1564772842
[4]: https://www.agilealliance.org/glossary/definition-of-done
[5]: https://developers.google.com/season-of-docs
[6]: https://swagger.io/specification/
[7]: https://devops.com/continuous-documentation
[8]: https://www.cmswire.com/cms/information-management/the-importance-of-docops-in-the-new-era-of-business-027489.php
[9]: https://opensource.com/article/20/7/sharepoint-alternative
[10]: https://opensource.com/article/20/7/nextcloud
