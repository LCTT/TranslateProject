[#]: subject: "How my team built an open source learning experience platform"
[#]: via: "https://opensource.com/article/21/8/open-source-lms"
[#]: author: "Tesh Patel https://opensource.com/users/tesh"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How my team built an open source learning experience platform
======
Open source powers innovation through community and shared experiences.
![Student desk for open education][1]

Learning is based on the open exchange of ideas and experiences. By sharing, testing, and practicing what we've learned with others, we're able to develop in our lives and careers. It follows that openness is the ideal state for any successful learning organization. 

I am passionate about learning, building teams, and technology. At Red Hat, we believe that open source powers innovation and results in better solutions. Five years ago, our learning management system was proprietary and closed. All of our learning platforms existed as islands with limited integration and provided a mediocre user experience. Over the past five years, our team has embraced the open source ethos. We've built and implemented new open source platforms, integrated our disparate learning platforms allowing us to freely exchange data and create a superior user experience.

If you're a fellow member of a learning organization, I hope you might find it helpful to hear about our experience so far and perhaps even join us as we seek to influence the future of learning. 

### Unlocking potential

Our previous LMS served as the primary back-office system, system of record, and front-end experience for our learners. To put it plainly, it didn't serve any of those functions well. Our data was locked up in the vendor's vault. We had to live with the LMS's limited reporting capability or extract the data and manually manipulate it in spreadsheets. Perhaps worst of all, our learners faced a mediocre front-end system with a less-than-intuitive user experience. To live with our LMS, we had to create inefficient processes and workarounds.

And so, in 2016, we began our journey to open source learning by replacing our proprietary LMS with [Totara Learn, an open source LMS][2]. 

By moving to Totara Learn, we unlocked our data and turned our attention to improving the user experience for our learners. 

### Identifying the ecosystem

Our learning ecosystem consists of more than just an LMS. In addition to our own content, we have access to content from third-party libraries, user-generated video content, virtual classroom tools for delivering online classes, and virtualized labs.

We knew we needed a single interface to disguise our complex learning platforms and tools and deliver one seamless experience to the learner. Initially, we tried customizing Totara Learn for this purpose. It's a great platform, but we eventually realized it wasn't cost-effective for us to remodel it from the ground up. What we needed was a platform designed for our unique requirements.

### Focusing on the learner

In 2017, as my team pondered our learning ecosystem challenges, an emerging category of products called learning experience platforms (LXP) emerged. I found several LXP vendors who claimed to solve problems with the learning experience. Many described their platform's experience as the "Netflix of learning." 

In my experience, I've found that learning isn't suited to a Netflix-like environment. The notion of randomly perusing learning, enrolling in a program, and then abandoning as it gets more challenging or less interesting—as you do with Netflix shows—is the antithesis of what our continuous learning philosophy encourages. Real learning that builds skills and capabilities requires an intentional focus and an ongoing commitment with a learn, practice, reflection, feedback loop. 

As my team compiled the requirements for an LXP, we quickly realized we were just at the beginning of determining what we'd need to build to create the best learning experience for our users. The requirements would continue to grow and evolve, so we needed a platform that could do the same. The idea for the Open Learning Platform (OLP) was born.

### Our open invitation

The OLP is a learning experience platform (LXP) that provides a personalized, online learning experience for users—typically employees at large enterprises. It consolidates disparate learning resources into a single portal. These days, learning can happen anywhere and in many forms. An LXP helps employees discover learning opportunities—offering ways to enhance them and manages their education. We've spent three years developing and building the OLP to meet the learning needs of users and educators. The OLP has come a long way, but we also know we're very much still on the journey. 

Since the inception of the OLP, we knew we wanted it to be an open source project. Why invest time and energy in open sourcing the platform we've built over several years? Simple. We want to learn from the experiences and innovation of others and form a community that will help determine what the LMS and LXP of the future should be. We want to move past a cost-per-user licensing model and the limitations in thinking when the sole focus is to monetize a product. If even one other learning organization benefits from our open source project, then it will have been worth the investment of our time. We welcome you to join the conversation at[ Open Learning Platform][3].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/open-source-lms

作者：[Tesh Patel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tesh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003588_01_rd3os.combacktoschoolseriesgen_rh_032x_0.png?itok=cApG9aB4 (Student desk for open education)
[2]: https://github.com/totara
[3]: https://www.openlearningplatform.org/
