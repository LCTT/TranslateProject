[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (SODA Foundation: Autonomous data management framework for data mobility)
[#]: via: (https://www.linux.com/audience/developers/soda-foundation/)
[#]: author: (Swapnil Bhartiya https://www.linux.com/author/swapnil/)

SODA Foundation: Autonomous data management framework for data mobility
======

SODA Foundation is an open source project under Linux Foundation that aims to establish an open, unified, and autonomous data management framework for data mobility from the edge, to core, to cloud. We talked to Steven Tan, SODA Foundation Chair, to learn more about the project.

_Here is a transcript of the interview:_

Swapnil Bhartiya: Hi, this is Swapnil Bhartiya, and today we have with us Steven Tan, chair of the SODA foundation. First of all, welcome to the show.
Steven Tan: Thank you.

Swapnil Bhartiya: Tell us a bit about what is SODA?
Steven Tan: The foundation is actually a collaboration among vendors and users to focus on data management for, how do you call, autonomous data mesh management. And the point of this whole thing is how do we serve the users? Because a lot of our users are getting a lot of data challenges, and that’s what this foundation is for. To get users and vendors together to help to address these data challenges.

Swapnil Bhartiya: What kind of data are we talking about?
Steven Tan: The data that we’re talking about is referring to anything like data protection, data governance, data replication, data copy management and stuff like that. And also data integration, how to connect the different data silos and stuff.

Swapnil Bhartiya: Right. But are we talking about enterprise data or are we talking consumer data? Like there is a lot of data with Facebook, Google, and Gmail, and then there are a lot of enterprise data, which companies … Sorry, as an enterprise, I might put something on this cloud, I can put it on this cloud. So can you please clarify what data are we talking about?
Steven Tan: Actually, the data that we’re talking about is … It depends on the users. There’re all kinds of data. Like for example, I mean, in the keynote that I gave two days ago, the example I gave was from Toyota. So Toyota use case is actually car data. So car data refers to things like the car sensor data, videos, map data and stuff. And then we have users like China Unicom. I mean, they have enterprise companies going to the cloud and so on. So they’ve all kinds of enterprise data over there. And then we also have other users like Yahoo Japan, and they have like a website. So the data that you’re talking about is web data, consumer data and stuff like that. So it’s across the board.

Swapnil Bhartiya: Oh, so it’s not as specific to an industry or any space or sector, okay. But why do you need it? What is the problem that you see in the market and in the current sphere that you’re like, hey, we should create something like that?
Steven Tan: So the problem that came, I mean the reason why all these companies came together is that they are building data centers that are from small to big. But a lot of the challenges that you have is like, it’s hard for a single project to address. It’s not like a business where we have a specific problem and then we need this to be solved and so on, it’s not like that. A lot of it is like, how do you connect the different pieces together in the data center together?
So there’s nothing like, no organization like that that can help them solve this kind of problem. Like how do you have, in order to address the data of … Or how do you address things like taking care of data protection and data privacy at the same time? And at the same time, you want to make sure that this data can be governed properly. So there isn’t any single organization that can help to take care of this kind of stuff, so we’re helping these users understand their problems and then come together and then we plan projects and roadmaps based on their problems and try to address them through these projects in the SODA foundation.

Swapnil Bhartiya: And you gave an example of data from the cars and all these things. Does that also mean that open source has helped solving a lot of problems by breaking down a lot of silos so that there’s a lot of interaction between different silos, which were like earlier separated and isolated? Today, as you mentioned, we are living in a data driven world. No matter what we do all the way from the Ring, to what we are doing right now, talking to each other, to the product that we’ll create in the end. But most of this data is living in their own silos. There may be a lot of value in that data, which cannot be extracted because one, it is locked into the silos. The second problem is that these days, data is kind of becoming the next oil. These companies are trying to capture all the data, irrespective of the fact of what value do they see in that data today? And by leveraging machine learning and deep learning, they can in the future … So how do you look at that, and how is SODA foundation going to break those silos, without compromising on our privacy, yet allow companies … Because the fact is, as much as I prefer my privacy, I also want Google Maps to tell me the fastest route where I want to go.
Steven Tan: Right. So I think there are certain, I mean, there are different levels of privacy that we’re going to take care of. And in terms of like, first of all, there are all kinds of … I mean, in terms of the different countries or different States or different provinces like in different countries, there are different kinds of regulations and so on. So first of all, like the data silos you talk about. Yes, that’s one of the key problems that we’re trying to solve. How to connect all the different data silos so as to reduce fragmentation, and then try to minimize the so called dark data that you’re talking about, and then extract all the values over there. So that’s one of the things that we try to get here. I mean, we try to connect all the different pieces, like in the different … The data may be sitting in the edge in the data center or different data centers and in the cloud. We try to connect all these pieces together.

I mean, that’s one of the first things that we tried to do. And then we tried to have data policies. I think this is a critical piece of things that a lot of the solutions out there don’t address. You have data policies, but it may be the data policies just for a single vendor solution. But once the data gets out, that solution then is out of control. So what we’re trying to do here is say, how do you have data policies across different solutions, so no matter where the data is it’s governed the same way, consistently? That’s the key. So then you can talk about how can you really protect the data in terms of privacy or govern the data or control the data? And in terms of the, I mentioned about the regions, right? So you know where the data is, and you know what kind of regulations that need to be taken care of and you apply it right there. That’s how it should work.

Swapnil Bhartiya: When we look at the kind of a scenario you talked about, I see it as two-fold. One is there is a technology problem and the second is people problem. So is SODA foundation going to deal with both, or are you going to just deal with the technology aspect of it?
Steven Tan: The technology part that we talk about, we try to define in terms of the API and so on to all the data policies and so on, and try to get as many companies to support this as possible. And then the next thing that we try to do is actually try to work with standards organizations to try to make this into a standard. I mean, that’s what we’re trying to do here.

And then government aspects, there are certain organizations that we are talking to. Like there’s the CESI, it’s China Electronic Standards organizations that we’re talking to that’s trying to work things into their … Actually, I’m not sure about China, because it’s, I mean, we don’t know about their sphere of influence within the CSI and so on. And then for the industry standards, there’s [inaudible 00:09:05] and so on, we’re trying to work with them and trying to get it to work.

Swapnil Bhartiya: Can we talk about the ecosystem that you’re trying to build around SODA foundation? One would be the participants who are actually contributing either the code or the vision, and then the users community who would actually be benefiting from it?
Steven Tan: So the ecosystem that we are trying to build, that’s the core part, which is actually the framework. So the framework, I mean, this part will be more of the data vendors or the storage vendors that will be involved in trying to build this ecosystem. And then the outer part, what I call the outer part of the ecosystem will be things like the platforms. Things like Kubernetes, VMware, all these different vendors, and then networking kind of stuff that you need to take care of like the big data analytics and stuff.

And then for the users, actually, if you can see from the SODA end-user advisory committee, I mean, that’s where most of our users are participating in the communication. So most of these users, I mean, they are from different regions and different countries and different industries. So we try to serve, I mean, whichever participant is interested in, they can participate in this thing. But the main thing is that because they may be from different industries, but actually most of the issues that they have is still the same thing. So there are some commonalities among all these users.

Swapnil Bhartiya: We are in the middle of 2020, because of COVID-19 everything has slowed down, things have changed. What does your roadmap, what does your plan look like? The structure, the governance and the plan for ’21 or end of the year?
Steven Tan: We are very, how do you call it? Very community-driven or focused kind of organization. We hold a lot of meetups and events and so on where we get together the users and the vendors and so on and the community in general. So with this COVID-19 thing, a lot of the plans has been upset. I mean, it’s in chaos right now. So most of the things are like what everybody is doing, moving online. So we are having some webinars and stuff, even as of right now when we are talking, we are having a mini summit going on with the Open Source Summit North America right now.

So for the rest of this year, most of our events will be online. We’re going to have some webinars and some meetups, you can find it out from our website. And the other plans that we have is that we are going to have, we just released the SODA federal release, which is the 1.0 release. And through the end of this year, we’re going to have two more releases, the G release and the H release at the end of this year. G release is going to be in September, and H is in the end of the year. And we’re trying to engage our users with things like the POC testing for the federal. Because each release that we have, we try to get them to do the testing, and then so that’s the way of them trying to provide feedback to us. Whether that works for them or how can we improve to make the code work for what they need.

Swapnil Bhartiya: Awesome. So thank you so much for taking your time out and explaining more about SODA foundation, and I look forward to talking to you again because I can see that you have a very exciting pipeline ahead. So thank you.
Steven Tan: Thank you, thank you very much.
--------------------------------------------------------------------------------

via: https://www.linux.com/audience/developers/soda-foundation/

作者：[Swapnil Bhartiya][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/swapnil/
[b]: https://github.com/lujun9972
