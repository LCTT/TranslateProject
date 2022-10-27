[#]: subject: "Event-driven architecture explained in a coloring book"
[#]: via: "https://opensource.com/article/22/7/event-driven-architecture-coloring-book"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Event-driven architecture explained in a coloring book
======
Event-driven architecture is no small topic. A coloring book is a perfect way to explain its complexity in a friendly manner. Download this coloring book about event-driven architecture

"Explain it to me like I'm five."

When you want someone to get to the point as efficiently and as clearly as possible, that's what you say. Following that logic, you might be compelled to ponder the most powerful tool the average, everyday 5-year old wields: coloring books. What better way than a coloring book to transform a droll slideshow presentation into a fun and educational journey?

That's what artists Máirín Duffy and Madeline Peck thought, anyway, and it has turned out to be accurate. In the past, Máirín has helped produce [five open source coloring books][2] to help explain advanced topics including SELinux, Containers, Ansible, and more. It's a fun and easy way to learn about emerging technology, and you can either color your lessons yourself or hand it over to a resident specialist (an actual 5-year old) for project completion.

The latest coloring book in the series is all about [event driven architecture (EDA)][3]. As with all the previous coloring books, this one's not only free to download, but it's also open source. You can download the sources and assemble it yourself, or learn from the files so you can build your own about topics important to you.

Event-driven architecture is no small topic, so I sat down with Máirín and Madeline to discover how and why they took on the challenge.

**Q**: Presumably, you don't spend your days developing KNative serverless applications and pipelines. How do you learn so much about such a complex topic?

**Máirín Duffy**: I wrote the script for the coloring book. I have a lot of experience with OS-level technology, and I have experience working in teams that deploy applications as a service, but I do not have as much experience working with running and managing Kubernetes directly. And the concept of "serverless" was one I only knew of in passing.

Our colleague Kamesh Sampath gave a presentation he called [Knative and the Three Dwarves][4].

That gave us the idea to relate our story to Snow White. In fact, we use material from Kamesh's talk to serve as the basic scope of the technologies and technical scenarios we wanted to talk about.
All of the coloring books use an analogy of some form to help readers new to the technology relate to it using concepts they are likely to understand already or be familiar with.

For the EDA coloring book, we used the familiar fairy tale of Snow White and the Seven Dwarves and the analogy of running a bakery to explain the concepts of what it means to be serverless, and what the specific Kubernetes serverless components [Tekton][5], Serve Knative, and Event Knative are, and what they do.

In preparing to write a script for the book, I watched Kamesh's presentation, wrote out the questions I had, and met with Kamesh. He is a very gifted teacher and was able to answer all of my questions and help me feel comfortable about the subject matter. I formed an informal technical review board for the book. We have access to a lot of amazingly smart technology experts through Fedora and Red Hat, and they were excited about having a book like this available, so we got quite a few volunteers.

I bounced ideas off of them. I spent a lot of time pestering Langdon White, and we narrowed down on the concept of Snow White running a bakery and the scenarios of demonstrating auto-scaling (scaling the production of different baked goodies up and down based on the holidays), self-healing based on events (ordering new eggs when the supply is low), shutting down an app that isn't being used and spinning it up on demand (the cupcake decorator scenario), rolling back issues in production (the poisoned apple detector.)

I wrote up an initial draft, and then the technical review board reviewed it and provided a ton of suggestions and tweaks. We did another round, and I finalized the script so that Madeline could start illustrating.

**Madeline Peck**: That's where I come in. I was lucky: I was presented with the finished version of the script, so the coloring book taught me what I needed to know. The great technical writers who helped give feedback on the script and visuals correlating were a great help with this admittedly complex topic.

**Máirín Duffy**: And as Madeline completed storyboards, and then the initial draft of the fully illustrated book, we had a couple more technical board reviews to make sure it still all made sense.

**Q**: That's a lot more work than I realized. So how long does it take to create a coloring book?

**Madeline Peck**: This one took a lot longer because it was the first coloring book I had worked on. Mo has been churning them out for some time now, and has a great grasp on all the open source programs like [Inkscape][6] and [Scribus][7] that we use, as well as the connections and knowledge for topics that can be expanded upon in a simple but informative manner. This book started when I was an intern, and it's taught me a lot about each step in the process, as well as all the ways open source matters for projects like these.

**Q**: What tools do you use when you draw?

**Madeline Peck**: When I draw digitally, I use variations of different ink pens. But on paper, traditionally I use a color erase red pencil for sketching, a Pigma Micron 01 pen for inking (because it's water proof), and occasionally I add color with watercolors from Mijello.

**Q**: I don't work with physical materials often, and I don't have a kid to do the coloring in for me, but I'm enjoying using this as a digital coloring book. I've imported pages into Krita and it's given me the opportunity to experiment with different brushes and color mixing techniques.

**Madeline Peck**: I think Krita is a great coloring application! There's a great variety of brushes and tools. I used Krita for all the primary sketching for the frames in the coloring book. If people don't know, when you import PNGs into programs like Krita, you can set the layer mode with the image to multiply instead of normal. Then you can add a layer below it, and it's just like coloring in below the lines without the white background.

**Q**: Is it harder to draw things without considering color and shading? Does it feel incomplete to you?

**Madeline Peck**: I don't think so! There's a lot of gorgeous art in the world where artists only rely on line work. The weight of the lines, the way they interact — it's just another technique. It doesn't feel incomplete because I know there's going to be lots of people who are going to share pages of the book colored in their own way, which is really exciting!

**Q:** Who's this really meant for? Can people actually learn about going serverless from a coloring book?

**Máirín Duffy**: Another good question. We started this whole "coloring books to explain technology" thing when Dan Walsh came into my cube at Red Hat Westford almost 10 years ago and asked if I could draw him some illustrations for his [SELinux dogfood analogy][8]. He had come up with this analogy having had to explain how SELinux concepts worked repeatedly. He also found it to be an effective analogy in many presentations.

That coloring book was super basic compared to the EDA coloring book, but the bones are the same — making complex technology concepts less intimidating and more approachable with simple analogies and narrative. We have gotten overwhelming feedback over a long period of time that these coloring books have been very helpful in teaching about the technology. I've had customers tell me that they've been able to use specific coloring books to help explain the technology to their managers, and that they are a really non-intimidating way to get a good initial understanding.

**Madeline Peck**: I agree. The coloring books are meant for a variety of readers, with a wide range of prior knowledge on the subject. They can be used for people who have friends and family who work on serverless applications, for those working on the actual teams, or people who work adjacent to those developers.

**Máirín Duffy**: They also make a great handout on a conference expo floor, at talks, and even virtually as PDFs. Even if EDA isn't your thing, you can pick it up and your kids can have fun coloring the characters. I really do hope people can read this book and better understand what serverless is and that it could spark an interest for them to look more in depth into serverless and EDA processes.

### Get your copy

I love that there are free and open source coloring books that appeal to both kids needing something fun to color in, and the older crowd looking for clear and simple explanations of complex tech topics.

A lot of creativity goes into making these coloring books, but as with most open source endeavours, it inspires yet more creativity once it's in the hands of users.

Grab your copy of the Event-driven Architecture coloring book today! Download the PDF directly [here][9].

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/event-driven-architecture-coloring-book

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/EDUCATION_crayons.png
[2]: https://github.com/FOSS-Coloring-Books
[3]: https://github.com/FOSS-Coloring-Books/eda
[4]: https://www.youtube.com/watch?v=w-BBOxu8tqs
[5]: https://opensource.com/article/21/11/cicd-pipeline-kubernetes-tekton
[6]: https://opensource.com/article/21/12/linux-draw-inkscape
[7]: https://opensource.com/article/21/12/desktop-publishing-scribus
[8]: https://opensource.com/business/13/11/selinux-policy-guide
[9]: https://raw.githubusercontent.com/FOSS-Coloring-Books/eda/master/EDA%20and%20the%20Three%20Dwarves%20web%20version.pdf
