[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Role Of SPDX In Open Source Software Supply Chain)
[#]: via: (https://www.linux.com/audience/developers/role-of-spdx-in-open-source-software-supply-chain/)
[#]: author: (Swapnil Bhartiya https://www.linux.com/author/swapnil/)

Role Of SPDX In Open Source Software Supply Chain
======

Kate Stewart is a Senior Director of Strategic Programs, responsible for the Open Compliance program at the Linux Foundation encompassing SPDX, OpenChain, Automating Compliance Tooling related projects. In this interview, we talk about the latest release and the role it’s playing in the open source software supply chain.

*Here is a transcript of our interview. *

Swapnil Bhartiya: Hi, this is Swapnil Bhartiya, and today we have with us, once again, Kate Stewart, Senior Director of Strategic Programs at Linux Foundation. So let’s start with SPDX. Tell us, what’s new going on in there in this specification?

Kate Stewart: Well, the SPDX specification just a month ago released auto 2.2 and what we’ve been doing with that is adding in a lot more features that people have been wanting for their use cases, more relationships, and then we’ve been working with the Japanese automotive-made people who’ve been wanting to have a light version. So there’s lots of really new technology sitting in the SPDX 2.2 spec. And I think we’re at a stage right now where it’s good enough that there’s enough people using it, we want to probably take it to ISO. So we’ve been re-formatting the document and we’ll be starting to submit it into ISO so it can become an international specification. And that’s happening.

Swapnil Bhartiya: Can you talk a bit about if there is anything additional that was added to the 2.2 specification. Also, I would like to talk about some of the use cases since you mentioned the automaker. But before that, I just want to talk about anything new in the specification itself.

Kate Stewart: So in the 2.2 specifications, we’ve got a lot more relationships. People wanted to be able to handle some of the use cases that have come up from containers now. And so they wanted to be able to start to be able to express that and specify it. We’ve also been working with the NTIA. Basically they have a software bill of materials or SBoM working groups, and SPDX is one of the formats that’s been adopted. And their framing group has wanted to see certain features so that we can specify known unknowns. So that’s been added into the specification as well.

And then there are, how you can actually capture notices since that’s something that people want to use. The license has called for it and we didn’t have a clean way of doing it and so some of our tool vendors basically asked for this. Not the vendors, I guess there are partners, there are open source projects that wanted to be able to capture this stuff. And so we needed to give them a way to help.

We’re very much focused right now on making sure that SPDX can be useful in tools and that we can get the automation happening in the whole ecosystem. You know, be it when you build a binary to ship to someone or to test, you want to have your SBoM. When you’ve downloaded something from the internet, you want to have your SBoM. When you ship it out to your customer, you want to be able to be very explicit and clear about what’s there because you need to have that level of detail so that you can track any vulnerabilities.

Because right now about, I guess, 19… I think there was a stat from earlier in the year from one of the surveys. And I can dig it up for you if you’d like, but I think 99% of all the code that was scanned by Synopsys last year had open source in it. And of which it was 70% of that whole build materials was open source. Open source is everywhere. And what we need to do is, be able to work with it and be able to adhere to the licenses, and transparency on the licenses is important as is being able to actually know what you have, so you can remediate any vulnerabilities.

Swapnil Bhartiya: You mentioned a couple of things there. One was, you mentioned tooling. So I’m kind of curious, what sort of tooling that is already there? Whether it’s open source or open source be it basically commercialization that worked with the SPDX documents.

Kate Stewart: Actually, I’ve got a document that basically lists all of these tools that we’ve been able to find and more are popping up as the day goes by. We’ve got common tools. Like, some of the Linux Foundation projects are certainly working with it. Like FOSSology, for instance, is able to both consume and generate SPDX. So if you’ve got an SPDX document and you want to pull it in and cross check it against your sources to make sure it’s matching and no one’s tampered with it, the FOSSology tool can let you do that pretty easily and codes out there that can generate FOSSology.

Free Software Foundation Europe has a Lindt tool in their REUSE project that will basically generate an SPDX document if you’re using the IDs. I guess there’s actually a whole bunch more. So like I say, I’ve got a document with a list of about 30 to 40, and obviously the SPDX tools are there. We’ve got a free online, a validator. So if someone gives you an SPDX document, you can paste it into this validator, and it’ll tell you if it’s a valid SPDX document or not. And we’re looking to it.

I’m finding also some tools that are emerging, one of which is decodering, which we’ll be bringing into the Act umbrella soon, which is looking at transforming between SPDX and SWID tags, which is another format that’s commonly in use. And so we have tooling emerging and making sure that what we’ve got with SPDX is usable for tool developers and that we’ve got libraries right now for SPDX to help them in Java, Python and Go. So hopefully we’ll see more tools come in and they’ll be generating SPDX documents and people will be able to share this stuff and make it automatic, which is what we need.

Another good tool, I can’t forget this one, is Tern. And actually Tern, and so what Tern does is, it’s another tool that basically will sit there and it will decompose a container and it will let you know the bill of materials inside that container. So you can do there. And another one that’s emerging that we’ll hopefully see more soon is something called OSS Review Toolkit that goes into your bill flow. And so it goes in when you work with it in your system. And then as you’re doing bills, you’re generating your SBoMs and you’re having accurate information recorded as you go.

As I said, all of this sort of thing should be in the background, it should not be a manual time-intensive effort. When we started this project 10 years ago, it was, and we wanted to get it automated. And I think we’re finally getting to the stage where it’s going to be… There’s enough tooling out there and there’s enough of an ecosystem building that we’ll get this automation to happen.

This is why getting it to ISO and getting the specification to ISO means it’ll make it easier for people in procurement to specify that they want to see the input as an SPDX document to compliment the product that they’re being given so that they can ingest it, manage it and so forth. But by it being able to say it’s an ISO standard, it makes the things a lot easier in the procurement departments.

OpenChain recognized that we needed to do this and so they went through and… OpenChain is actually the first specification we’re taking through to ISO. But for SPDX, we’re taking it through as well, because once they say you need to follow the process, you also need some for a format. And so it’s very logical to make it easy for people to work with this information.

Swapnil Bhartiya: And as you’ve worked with different players, different of the ecosystem, what are some of the pressing needs? Like improve automation is one of those. What are some of the other pressing needs that you think that the community has to work on?

Kate Stewart: So some of the other pressing needs that we need to be working on is more playbooks, more instructions, showing people how they can do things. You know, we figured it out, okay, here’s how we can model it, here’s how you can represent all these cases. This is all sort of known in certain people’s heads, but we have not done a good job of expressing to people so that it’s approachable for them and they can do it.

One of the things that’s kind of exciting right now is the NTIA is having this working group on these software bill of materials. It’s coming from the security side, but there’s various proof of concepts that are going on with it. One of which is a healthcare proof of concept. And so there’s a group of about five to six device manufacturers, medical device manufacturers that are generating SBoMs in SPDX and then there are handing them into hospitals to go and be able to make sure they can ingest them in.

And this level of bringing people up to this level where they feel like they can do these things, it’s been really eye-opening to me. You know, how much we need to improve our handholding and improve the infrastructure to make it approachable. And this obviously motivates more people to be getting involved. From the vendors and commercial side, as well as the open source, but it wouldn’t have happened, I think, to a large extent for SPDX without this open source and without the projects that have adopted it already.

Swapnil Bhartiya: Now, just from the educational awareness point of view, like if there’s an open source project, how can they easily create SBoM documents that uses the SPDX specification with their releases and keep it synced?

Kate Stewart: That’s exactly what we’d love to see. We’d love to see the upstream projects basically generate SPDX documents as they’re going forward. So the first step is to use the SPDX license identifiers to make sure you understand what the licensing should be in each file, and ideally you can document with eTags. But then there’s three or four tools out there that actually scan them and will generate an SPDX document for you.

If you’re working at the command line, the REUSE Lindt tool that I was mentioning from Free Software Foundation Europe will work very fast and quickly with what you’ve got. And it’ll also help you make sure you’ve got all your files tagged properly.

If you haven’t done all the tagging exercising and you wonder [inaudible 00:09:40] what you got, a scan code works at the command line, and it’ll give you that information as well. And then if you want to start working in a larger system and you want to store results and looking things over time, and have some state behind it all so like there’ll different versions of things over time, FOSSology will remember from one version to another and will help you create these [inaudible 00:10:01] off of bill materials.

Swapnil Bhartiya: Can you talk about some of the new use cases that you’re seeing now, which maybe you did not expect earlier and which also shows how the whole community is actually growing?

Kate Stewart: Oh yeah. Well, when we started the project 10 years ago, we didn’t understand containers. They weren’t even not on the raw mindset of people. And there’s a lot of information sitting in containers. We’ve had some really good talks over the last couple of years that illustrate the problems. There was a report that was put out from the Linux Foundation by Armijn Hemel, that goes into the details of what’s going on in containers and some of the concerns.

So being able to get on top of automating, what’s going on with concern inside a container and what you’re shipping and knowing you’re not shipping more than you need to, figuring out how we can improve these sorts of things is certainly an area that was not initially thought about.

We’ve also seen a tremendous interest in what’s going on in IOT space. And so that you need to really understand what’s going on in your devices when they’re being deployed in the field and to know whether or not, effectively is vulnerability going to break it, or can you recover? Things like that. The last 10 years we’ve seen tremendous spectrum of things we just didn’t anticipate. And the nice thing about SPDX is, you’ve got a use case that we’re not able to represent. If we can’t tell you how to do it, just open an issue, and we’ll start trying to figure it out and start to figure if we need to add fields in for you or things like that.

Swapnil Bhartiya:  Kate, thank you so much for taking your time out and talking to me today about this project.
--------------------------------------------------------------------------------

via: https://www.linux.com/audience/developers/role-of-spdx-in-open-source-software-supply-chain/

作者：[Swapnil Bhartiya][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/swapnil/
[b]: https://github.com/lujun9972
