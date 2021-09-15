[#]: subject: "A conversation about open source design and ethical funding"
[#]: via: "https://opensource.com/article/21/9/open-source-design"
[#]: author: "Clayton Dewey https://opensource.com/users/cedewey"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A conversation about open source design and ethical funding
======
The CEO and co-founder of Kaleidos and Taiga shares about his latest
project, Penpot, an open source, online interface design tool.
![Painting art on a computer screen][1]

Pablo Ruiz-Múzquiz is the CEO and co-founder of Kaleidos and Taiga. I contacted him for an interview to learn more about his latest project: Penpot, an open source, online interface design tool.

**Clayton Dewey: I reached out to you because I recently learned about Penpot, an excellent design tool similar to Figma and Sketch. How did Penpot get started?**

**Pablo Ruiz-Múzquiz:** I think some context here is interesting because Penpot is not something that spontaneously just came to be. Penpot is a design and prototyping tool. It competes with Figma, Sketch, Invision, and Adobe XD. It's a bit more pictorial—not so much Photoshop, although I'm not an expert on bitmap software. You could say that there are two separate categories. Penpot is in the pictorial prototype arena rather than the bitmap raster image arena.

Penpot was not a pet project by some people in a garage or anything. It comes from a company called Kaleidos, which I'm CEO of, which is ten years old and was created to do some experiments around IT—partnering with startups or big corporations that might need that super-great-talented team to develop their projects. Not _our_ projects, but _theirs_. At the same time, we wanted to incubate our ideas and say we're all about open source and free software. The full name of the company is Kaleidos Open Source.

We wanted to make sure that we had this hybrid mode to create software for other people and be happy for them, for the future of their businesses on the internet. But also, at the same time, protect quality time to develop our stuff. Penpot is just one of those products.

Penpot does exist because at some point—six or seven years ago—Kaleidos was a very developer-centric company and didn't have UX or UI in-house. We saw the potential for multi-functional teams where you would have design—UX/UI design, in general—and code working together, but we needed to use open source because that's our ethos. Kaleidos would use open source as an end in itself but also as a means to an end.

We started by creating Taiga, which is a project management platform. We're all about processes and how to do stuff, not just what, but how we achieve things and team management and all that. We were happy to have that agile mindset built in a tool for teams like ourselves. But as you can imagine, at some point, designers at Kaleidos, being open source proponents, said: Look, we are not first-class citizens in open source. We are happy with Inkscape, GIMP, and some tools, but you developers have everything to choose from. You can choose the best of the best. You live in this paradise world where you don't know how privileged you are. We agree with you. We are all about open source, absolutely, but you have to understand that we are frustrated with the professional quality of some tools. We want to achieve parity with you developers.

We came to this point where designers asked the company, meaning their peers, because it's an employee-owned company: Look, could we make an exception and use Figma to have a professional quality design tool?

We said: We knew this was coming. This is terrible news. We understand where you're coming from, have empathy, and understand your frustration. Is there anything else we could do?

They said: Well, we tried to make some UI revamps on Inkscape as a product called Rethinkscape, but we don't own that project. It's other developers that know what is best for that tool. So we cannot trust that they will use our feedback. It's not just feedback. It was a lot of work. Sorry, but there's nothing you can do. It's Figma or frustration.

So we said: Okay, we're going to make that an exception to the rule of using only open source tools, but we're going to develop a Figma alternative as a compromise.

### An open source Figma alternative

**PRM:** It's a nice compromise. We will allow ourselves to accept that Figma has to be here, but we might have the ability, the talent, the creativity, the mindset, and the ambition to create an open source Figma alternative. We typically say "Figma alternative" and not "Sketch alternative" and not "Invision alternative." People reading this could say, "Why aren't you saying that?" Well, it's just a shortcut—Figma is the leader. If you aim at Figma, you're aiming at the leader. You're doing the collateral effect, which is that you could be better than Sketch and better than Invision. This is a nice shortcut for us.

It's very easy to say: Oh yes, let's develop an open source Figma alternative. Fortunately, at Kaleidos, we have the talent because this is not your typical tool to develop. When people think of Penpot, they have to understand that for Penpot to be successful, you would have to develop a web-based platform. It's browser first—the technology you have to use is what the browser allows you to use. It needs to be super-efficient in terms of performance. It has to be the slickest UI you can imagine. Designers need to have immediate feedback and response in their micro-interactions with a design tool. It has to be very, very bug-free. You cannot accept small errors or margin errors, or rotations that are not mathematically perfect. So you have all these challenges.

And then, of course, you've got online collaboration. People are joining together to design simultaneously from different browsers—from various locations in the world. That has to work flawlessly. If it doesn't work flawlessly, it doesn't work at all. It's great to have a tool just for yourself, but the magic happens when you have this collaboration scheme when people can join not only _asynchronously_ but actually _synchronously_.

We released that to the world last February in alpha, and I think it was about time people could enjoy something like Penpot.

**CD: It was well received! I remember going and seeing the Product Hunt page—all glowing reviews. I was so impressed that I made the first-reaction video because it's like: Oh wow, people are talking this up.**

**PRM:** Yeah, we saw it! That was great. I was like: Oh, that's a very nice, very cute first impression for a reaction. It's honest. The team was watching it and taking notes, and responding: That's good feedback. Oh, he doesn't see this. That was good—only a few months in the wild.

**CD: After I checked it out and realized this is the real deal—it's quite polished for an initial release. Then I got curious. How is this possible? I don't see a pricing page anywhere. That's when I learned about Kaleidos and the incubator program and thought: Wow like you said, there's a whole backstory to this project and a lot of thought that goes into incubating it and sustaining it. I'd love to dive deeper into that aspect of it.**

**The impression that I get is that Kaleidos is for hire and builds out apps, websites, and web apps for other companies. I see you've worked in the health space, for example. It sounds like you've actually worked in a lot of different industries.**

### Pivoting to full-time open source product development

**PRM:** 

That is the thing from the past now, but what you say is true—up until last month. A little trick was we would divert revenue, profit from these team-for-hire projects—super-big projects. We would be asked by startups with a lot of money and great ideas but no team to be their team for a couple of years. We would accept it if the technology was challenging, their business aligned with our ethos, and it was a big project. 

We're not cheap—not super expensive, but you know, not cheap. Instead of distributing profits among us, we put that money into having teams devoted to our things, to our products.

That worked okay for some years—Penpot got that sustainability. But eventually, both Taiga and Penpot begged: Can these projects receive full attention? Meaning we need to say no to external clients so that the team-for-hire thing is over.

So, where is the money coming from?

It came from our savings, some business annuals, some seed VCs that trust and support us, and monetization strategies from Taiga that have been working for several years now—people paying for Taiga services.

So we had these monetary and talent resources we needed to focus on Taiga and Penpot for the following years entirely. We were very excited that we could make that transition swiftly this year.

So when you go to [kaleidos.net][2], you won't see many traces of the old Kaleidos where you could contact us and see if we could accept your project.

**CD:**

**Okay, thank you. I thought I was losing my mind! When I recently visited the site, I asked, "Where are all the big names I remember seeing on the website?" So that explains it.**

**PRM:** Yes, machine learning projects—massive stuff. We're very proud of that portfolio, but it doesn't make sense to show it now. Who would care about that when we are focusing on our products? It's something that we keep, and we will keep. It's a pedigree, in a way. Just think, a month ago, we just shut it down—everything that was related to the old Kaleidos.

Now it's all about our incubation process. It doesn't stop with Taiga and Penpot, but it's now 100% Taiga and Penpot.

We're very excited about this because it allows us to make a significant impact using open source in technology and society for something targeted to technology teams. For us, the _team_ means _design and code together_. We cannot see them separate any longer. We believe in mixing code and design, engineering and creativity, working together to create great stuff. And we think that if you don't have access to great open source tools to do that, then the products that are going to be created will be limited to what certain sectors of society can afford—paying to design. And we're against that. We are okay with people paying whatever they want, but we are *more *okay with allowing people to enjoy professional tools that give them everything they need to create their work.

Now we have to be sustainable. We cannot just do this with our savings month after month. We have business models that we are identifying and analyzing for the future. Of course, when we launched Penpot on Product Hunt and Hacker News, there was great feedback. No haters. Amazing. Some people were saying: Who could guarantee that this is not a trap? That this is not a smart move from a commercial proprietary software company that is choosing open source to lure us into their plans? Then make it closed? You read that, and you say that makes a lot of sense—if I were to be that kind of business guy, it makes sense—it's a plan.

**CD: It's a bit conspiratorial, but it could happen.**

**PRM:** It's the first in open source design, and the market is very exciting. Figma was valued at nine billion dollars a month ago. I understand people would see this from that particular angle, but then the community would reply with: But this is the guy that developed Taiga five years ago, and do you see any suspicious moves? No. This is trust. They can be trusted. They've done it before. There are no hidden traps.

We were glad to see that we got credit for our past actions. There's no trap. It's just people trying to make sure that design and open source are finally together for the next decade.

### PI (personal innovation week)

**CD:**

**Well, congratulations on that shift for the business. In the Drupal world, it's common to have what Google popularized—use 10–15% of your time to do what you like. Often that time is used to contribute back to open source, but it's always the first thing to go when there's a client priority. Of course, that makes sense. You're being paid to deliver for the client.**

**PRM:** We had a hack for that because that 10% Google thing was there back ten years ago when we created Kaleidos. We wanted to be innovative and have quality time to explore and be creative and all that. People told us to do the Google 10%, and we said: I don't think that's going to work. If you cannot commit that time and you cannot do that with peers who also decide to share their 10% at the same time as your 10%, then it will be pretty individualistic. Also, the scale of what you can achieve is going to be relatively small. Google has immense resources, so anything small gets multiplied by orders of magnitude. For a company of 15 people, you need everyone on board.
So, we said no to google 10%, and we created our PI weeks. PI weeks are personal innovation weeks. Every July and every December, the company would stop its daily work for clients. Those projects we would still get paid for because our clients understand there's another value in that, and everyone at the same time would suggest projects and work together for the whole week.

**CD: Like a hackathon.**

**PRM:** Right, but no prizes, no contest, no rules. Well, just two rules: Use open source and be ready to show something functional by Friday. By doing that, we shifted from that 10% individualistic approach to a team effort, and guess what? Penpot, Taiga, and 200 other projects were born in our now 20 PI weeks.

**CD:**

**Wow. Nice. That's such a great team-building opportunity. Often what I'll do is tinker around, usually on my own, help with a specific issue in an issue queue, but working collaboratively on a project for a week with your co-workers...**

**PRM:** I can tell you about this past PI week, to give you an example. On purpose, I looked for people I'm not working with daily. We created this Exquisite Corpse type of project. Instead of literature, you know, short tales, it was about drawings. We created this collaborative canvas where you get just a few pixels from the bottom layer. The bottom part is from the previous drawing, and you continue. Then someone continues your drawing, and then you put everything together. Real creativity, and it's like, wow, this is amazing!

That happened because of that very intense week. We shared the processes and ethos. Even if we didn't work together every day, we knew that we were compatible with interfaces, like human interfaces.

Now we got eight projects like that one. People don't have to look at this incubation process as always potentially another product you will launch. Of course, Penpot was, but this could be a pet project just for fun. Who knows? It could evolve into other stuff, a plugin for Penpot. I don't know, it could be a plugin, but we don't go into the PI week with any objective other than having fun, experimenting, and learn together. Then you get things like Penpot. But again, you cannot just say I will develop a tool like this and do it. It's no surprise that there are only a handful of tools of that type. You get thousands of e-commerce sites, even tens of project management tools, but you only get half a dozen design tools. That's for a reason.

### Ethical funding

**CD:**

**What are the options for starting a business, growing it, and making it sustainable in a way that maintains those core values?**

**PRM:** 

That's a great question. At Kaleidos, since its inception, we quickly concluded that we were privileged. We were born in a financial crisis here in Spain, and 2011 was a harsh year, but we could take risks. Why? Because of privilege—we would not have any issues finding jobs and payrolls and all that. So we said: Okay, let's use that privilege for good. Let's use it to make sure that we don't have to make compromises we don't like—that we don't have to negotiate and always fall back and concede little by little, just for money or exposure or whatever.

We had this ethical committee that would evaluate potential projects. Back then, we had this very clear stance that we have a lot of talent, and we are not going to use this talent in any way that they're are _not_ aligned with benefit. We would think: Okay, this is a client that is going to develop this product. It's very challenging and a lot of money but do we want this product to exist?

When it comes to this shift, you said this is a big deal. It is a big deal because we also need to keep that ethos. We need to recognize ourselves. We need to see that we are the same team, same people. We're getting some investment, but we know who is supporting the project.

We've got many VCs interested in us, and we picked the one that we liked—that aligns with open source and our values, and the type of team we are. We have a great deal.

But if you only want VCs for the money, you have to be ready for those VCs, all those investors, to be there only for the money back. Don't fool yourself. If you only want the money, expect to be asked just about the money.

There are ways to ask for just the amount of money you need to prove something, and what we need to establish here is not that we can raise a lot of money. The point here is that we can make this business sustainable, that people can trust that this will be scalable and that this will continue to be developed and new features get added. This is a global product.

You mentioned Penpot, but the same with Taiga, and we don't need any more money than is asked for proof.

If you go and ask for more money that you really don't need or that is intended to go for just the next VC round, and this is about speculation, you're in a different business. You're in a round-driven business model.

It might sound a bit weird, but we're not here for the money. We're here for the impact. We like to be correct. We want to make a point and be right about it. It's really exciting when you say something that you believe. You have a strong opinion, and people follow you, and you think that you're creating a better world by doing that. Technology is so vital for that. This is fundamental for us, and internally, we asked this dozens of times before the shift. We understand this next move and what it entails because, in the past, we would say no to certain things. We are going to keep saying no to perhaps to a bunch of things.

**CD:**

**It makes a lot of sense to me that you all collectively decided on a path that's more focused on impact than on making a ton of money. Communicating your values and communicating the impact you want to have is one of the prevailing reasons people choose one company over another to work.**

**PRM:** That means being very transparent about your decisions and your decision-making process. Allowing yourself to make mistakes and always have full approval.

VCs have asked me: Yeah, yeah, that's great, but do you want to become rich or not?

This is a serious question by VCs. And we respond: Well, no. I mean, life is short. Let's just have fun. A bit of money is okay but not beyond a certain point. And they're not interested in investing because if you don't want to become rich, they don't think you have the ambition. The stakes for you are not that big. From VC's worldview, only founders wanting to become rich are the ones that are going to make the business successful. That's their pattern matching.

**CD: It's a good screening question for them, and for you, I suppose.**

**PRM:** That's great. Go ahead and ask that question. Instead of 20 minutes, we'll just spend five.

Fortunately, more and more, those questions are not being asked. Still, this is a very Silicon Valley-type of a question but not only Silicon Valley. In Europe, you get that question too, but I think more and more VCs and private investors are looking at how cohesive the team is, how they work together, what their values are, and their ambitions as a collective. Founders are important because they sometimes serve as some sort of leadership, but I think, fortunately, they're looking more at how to scale up a company and not just fail at keeping the ethos and the culture. That was there at the beginning, you know. There's a big challenge, though.

**CD:**

**It's encouraging to see more traction in the ethical investment space. Rather than unicorns, **[**Zebras Unite**][3]** is an excellent movement. Do you have any resources on groups or funds that you all found helpful in that journey that you've been on?**

**PRM:** There's nothing like that, unfortunately. There's not a structured database, filter segmented for that. It's a lot of hit and miss and chance.

One thing I want to stress here is that we want to win this. It's one thing not to want to personally have any excitement about becoming rich like some VCs expect you to do. However, that doesn't mean you don't want to win. We want open source to rule design. We want to go after all the major players. We are ready to leave a lot of money on the table in the process. We don't have an issue with that at all. We have big ambitions. We're not here to be a category-three player or anything like that. We dream.

### Designers as first-class citizens in open source

**CD:**

**Which is a good segue because I want to circle back to the design and open source space. What are some things—practical, process, or philosophical—that you see Figma and other proprietary design tools unable to do that Penpot can do?**

**PRM:** Well, many things. The most obvious one is philosophical, but it has to do with open source and open standards. We use SVG as a native format—zero interest in proprietary formats with Penpot. We know SVG has enormous potential. Whatever we inject there, HTML for text management is the sole thing that SVG handles differently from what you would expect a design tool to behave like. We want to make sure that data formats and data interoperability is 100% future-proof.

Non-open source tools purposefully have this vendor locking strategy with formats. You can export to SVG and import from SVG, but there's a loss in translation every single time.

Penpot doesn't have any loss in translation because you export SVG, which is the native format. That means that when designers communicate the design with developers, it is already considered the code. We are in this position where a designer for the first time can consider themselves coders. They can go to the repository, which is the golden standard for where the source of truth remains for a project. Indirectly through Penpot, they know that their design is first-class-citizen input to the repository because you could connect Penpot to your git repository. Developers can take it, use it, transform it without the constant fear from the designer that something might not be quite right in that translation because there's no translation.

You couldn't try to do that without being open source.

**CD: By adopting open standards and using things like SVG, you are getting closer and closer to a single source of truth that everyone is working from.**

**PRM:** Just picture this. A designer considers that certain products are designed, and it's finished. They commit and push right to the repository. The ripple effect of that is that it goes into production with no human intervention because it's code. It's not just that you get the properties on a sidebar. Your design is code—valid code.

That also means tighter integration between designing code, which creates a more fruitful conversation between designers and developers. A developer then sees value in being welcomed into the design process. The developer will see themselves as being welcome here because this is code. When you narrow that gap between design and code, magic happens. You have more functional conversations.

Of course, being open source gives you the innovation that comes from the community. Open source gives you a global reach. Figma's architecture for plugins initially backfired because it wasn't meant to be open to other people to tinker with. I think they've sorted that out, but Penpot has been given birth with the idea that people will be able to create on top of Penpot. This contribution framework is essential. We should see Penpot grow in unexpected ways for people to enjoy their particular view of what a design tool has to be.

Because Penpot is open source, you can run it on your server, which is groundbreaking stuff. You cannot do that with any other tool. You can have that as a desktop native thing, like Sketch, if you use a Mac, of course. Penpot allows you to run your own Penpot design server, which is one of the last few remnants of core tools in terms of productivity for teams that were not allowed to be in your private cloud. This has to be Software-as-a-service (SaaS).

That's no longer true. With Penpot, you can have it alongside all the tools that you're using. You have complete control. Design material is sometimes delicate, and you have to keep it for yourself. You might want to integrate with your crazy ideas about processing or whatever. You can run it on your laptop and have a solo experience like a client-server. We will eventually have the native desktop experience just by bundling this with probably the [Electron framework][4]. That's great, and that serves some use cases, a bit corner use cases, but useful nonetheless. But having your own server for the first time opens up a lot of possibilities.

Open source here in design is fresh. It's very, very new to the design arena, which has evolved slowly for the past 20 years because open source was not there and collaborative work was not there, in terms of contribution. I think it's great that we have at least one good example of a design tool that can scale up and be for everyone, not just for technical people.

**CD:**

**Penpot serves as a great example of what can happen when you create a team of equally respected designers and developers where each person's discipline is valued. Many people philosophically understand the value of design in the open source world, but I think putting it into practice is still difficult for many.**

**PRM:** When you go to open source events like FOSDEM and others, you see the open source design track and designers struggling with how to contribute to open source projects. There are tips and tricks and all that, but the best approach here—the neat shortcut is not for designers to struggle, to find ways but for developers to be very welcoming and respecting that work. That's super fast into the success path.

That's what happened at Kaleidos six or seven years ago. We decided to take that leap of faith, allowing alien people like designers with their very fashionable mindsets and all that because it's all about fashion and trending things. And we are developing solid sustainable back-end architectures and all that. This is not how we thought about it, but you could picture it in a very comical way. Who are these people that belong to this other type of breed? We said: Let's see what happens, and it was an immediate success because we welcomed them, we looked for them, we respected them, and we gave them ownership, agency, and listened. And in a way, obeyed when it was essential to do. You are the one that knows what to do.

From that realization comes Penpot. We like to be in that type of team. We want other teams to have it, and we're here to help those teams. Sometimes tools help too, and so Kalelidos. We experimented with the joy of having code and design together but for real, not subordinated like a feudal system or where developers are still on the top in the hierarchy.

**CD: It seemed like because Penpot came out of one of the PI weeks and designers planting the seed beforehand, you started a project with designers as co-participants and co-leaders from the beginning—having a more holistic approach. The fact that you all were able to do that from the beginning helps it succeed in a true collaboration between the disciplines.**

**PRM:** I think when we created Taiga, which is agile project management, we developed it in a way for developers to make it exciting for designers to go into agile—to do Scrum and Kanban and this iterative process where there's uncertainty along the way, and you cannot just design everything from beginning to end and then finish. This is evolving all the time, and for a designer, that's tough. We said: Okay, we're going to create Taiga to make sure that they enjoy the process, enjoy the ride, and they get it. This is a little trick to welcome them to agile in a way that they can enjoy.

With Penpot, we're doing the reverse. We're making sure that designers welcome developers to the design process—respected, appreciated, be part of it. There's a symmetry between the two tools that we have, but it comes out of respect for the other type of mindset.

We hope that with Penpot, people will have a great open source design tool and see the potential for that conversation between design and code to be more productive, more insightful, and more fun, and we cannot have that ruled by non-open source software. We believe this will be big for this next decade, and we cannot have open source lagging. We have to provide the toolset for that and keep developing the next framework, the next database, the next messaging system, the next low-level kernel. I have come from that since 1996. I know what this one's like, and it's about time that we go to the non-technical end-user tool that enables great processes to happen in a team, and open source knows a lot about teams.

So it's not a new concept. It's just that we have to open up what a team means. Once we get that, it's going to feel natural.

**CD:**

**Absolutely. Very exciting. Is there anything else you want to share about Penpot, Taiga, or Kaleidos that we haven't touched upon before we wrap things up?**

**PRM:** The only thing is that Kaleidos is a nice bunch of people, strong values, a strong culture about open source, sharing, generosity, and open source, of course. We are committed to this. We have some funding, but most importantly, we have our passion and talent. We're here for the long term.

We expect big news this year, but also next year. Next year, 2022, should be, for us, big time in terms of engagement, features, and competition. Watch what we're doing, ask questions, participate in whatever you're interested in. If you're into agile and about team processes and all that, then take a look at Taiga. If you're into design process and bridging that gap between design and code, go for Penpot. You can go for both of course.

Follow us on social networks and all that. We're very open and transparent about what we're doing—dev diaries and all that. We're a small team, but we have quality time to devote to the community and anyone coming to respectfully contribute and give feedback—requesting a bug fix, translating something, or suggesting a feature.

I just hope you're as excited as we are about all this.

### Try Penpot

You can try Penpot at [penpot.app][5].

If you're a developer, go to [github.com/penpot][6] to get involved.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/open-source-design

作者：[Clayton Dewey][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cedewey
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/painting_computer_screen_art_design_creative.png?itok=LVAeQx3_ (Painting art on a computer screen)
[2]: https://opensource.com/article/21/9/kaleidos.net
[3]: https://zebrasunite.coop/
[4]: https://www.electronjs.org/
[5]: https://penpot.app/
[6]: https://github.com/penpot
