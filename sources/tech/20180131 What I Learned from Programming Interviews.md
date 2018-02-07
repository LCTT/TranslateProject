What I Learned from Programming Interviews
============================================================

![](https://cdn-images-1.medium.com/max/1250/1*DXPdaGPM4oM6p5nSkup7IQ.jpeg)
Whiteboard programming interviews

In 2017, I went to the [Grace Hopper Celebration][1] of women in computing. It’s the largest gathering of this kind, with 17,000 women attending last year.

This conference has a huge career fair where companies interview attendees. Some even get offers. Walking around the area, I noticed that some people looked stressed and worried. I overheard conversations, and some talked about how they didn’t do well in the interview.

I approached a group of people that I overheard and gave them advice. I considered some of the advice I gave to be basic, such as “it’s okay to think of the naive solution first.” But people were surprised by most of the advice I gave them.

I wanted to help more people with this. I gathered a list of tips that worked for me and published a [podcast episode][2] about them. They’re also the topic of this post.

I’ve had many programming interviews both for internships and full-time jobs. When I was in college studying Computer Science, there was a career fair every fall semester where the first round of interviews took place. I have failed at the first and final rounds of interviews. After each interview, I reflected on what I could’ve done better and had mock up interviews with friends who gave me feedback.

Whether we find a job through a job portal, networking, or university recruiting, part of the process involves doing a technical interview.

In recent years we’ve seen different interview formats emerge:

*   Pair programming with an engineer

*   Online quiz and online coding

*   Whiteboard interviews

I’ll focus on the whiteboard interview because it’s the one that I have experienced. I’ve had many interviews. Some of them have gone well, while others haven’t.

### What I did wrong

First, I want to go over the things I did wrong in my interviews. This helps see the problems and what to improve.

When an interviewer gave me a technical problem, I immediately went to the whiteboard and started trying to solve it.  _Without saying a word._ 

I made two mistakes here:

#### Not clarifying information that is crucial to solve a problem

For example, are we only working with numbers or also strings? Are we supporting multiple data types? If you don’t ask questions before you start working on a question, your interviewer can get the impression that you won’t ask questions before you start working on a project at their company. This is an important skill to have in the workplace. It is not like school anymore. You don’t get an assignment with all the steps detailed for you. You have to find out what those are and define them.

#### Thinking without writing or communicating

Often times I stood there thinking without writing. When I was doing a mock interview with a friend, he told me that he knew I was thinking because we had worked together. To a stranger, it can seem that I’m clueless, or that I’m thinking. It is also important not to rush on a solution right away. Take some time to brainstorm ideas. Sometimes the interviewer will gladly participate in this. After all, that’s how it is at work meetings.

### Coming up with a solution

Before you begin writing code, it helps if you come up with the algorithm first. Don’t start writing code and hope that you’ll solve the problem as you write.

This is what has worked for me:

1.  Brainstorm

2.  Coding

3.  Error handling

4.  Testing

#### 1\. Brainstorm

For me, it helps to visualize first what the problem is through a series of examples. If it’s a problem related to trees, I would start with the null case, one node, two nodes, three nodes. This can help you generalize a solution.

On the whiteboard, write down a list of the things the algorithm needs to do. This way, you can find bugs and issues before writing any code. Just keep track of the time. I made a mistake once where I spent too much time asking clarifying questions and brainstorming, and I barely had time to write the code. The downside of this is that your interviewer doesn’t get to see how you code. You can also come off as if you’re trying to avoid the coding portion. It helps to wear a wrist watch, or if there’s a clock in the room, look at it occasionally. Sometimes the interviewer will tell you, “I think we have the necessary information, let’s start coding it.”

#### 2\. Coding and code walkthrough

If you don’t have the solution right away, it always helps to point out the obvious naive solution. While you’re explaining this, you should be thinking of how to improve it. When you state the obvious, indicate why it is not the best solution. For this it helps to be familiar with big O notation. It is okay to go over 2–3 solutions first. The interviewer sometimes guides you by saying, “Can we do better?” This can sometimes mean they are looking for a more efficient solution.

#### 3\. Error handling

While you’re coding, point out that you’re leaving a code comment for error handling. Once an interviewer said, “That’s a good point. How would you handle it? Would you throw an exception? Or return a specific value?” This can make for a good short discussion about code quality. Mention a few error cases. Other times, the interviewer might say that you can assume that the parameters you’re getting already passed a validation. However, it is still important to bring this up to show that you are aware of error cases and quality.

#### 4\. Testing

After you have finished coding the solution, re-use the examples from brainstorming to walk through your code and make sure it works. For example you can say, “Let’s go over the example of a tree with one node, two nodes.”

After you finish this, the interviewer sometimes asks you how you would test your code, and what your test cases would be. I recommend that you organize your test cases in different categories.

Some examples are:

1.  Performance

2.  Error cases

3.  Positive expected cases

For performance, think about extreme quantities. For example, if the problem is about lists, mention that you would have a case with a large list and a really small list. If it’s about numbers, you’ll test the maximum integer number and the smallest. I recommend reading about testing software to get more ideas. My favorite book on this is [How We Test Software at Microsoft][3].

For error cases, think about what is expected to fail and list those.

For positive expected cases, it helps to think of what the user requirements are. What are the cases that this solution is meant to solve? Those are the positive test cases.

### “Do you have any questions for me?”

Almost always there will be a few minutes dedicated at the end for you to ask questions. I recommend that you write down the questions you would ask your interviewer before the interview. Don’t say, “I don’t have any questions.” Even if you feel the interview didn’t go well, or you’re not super passionate about the company, there’s always something you can ask. It can be about what the person likes and hates most about his or her job. Or it can be something related to the person’s work, or technologies and practices used at the company. Don’t feel discouraged to ask something even if you feel you didn’t do well.

### Applying for a job

As for searching and applying for a job, I’ve been told that you should only apply to a place that you would be truly passionate to work for. They say pick a company that you love, or a product that you enjoy using, and see if you can work there.

I don’t recommend that you always do this. You can rule out many good options this way, especially if you’re looking for an internship or an entry-level job.

You can focus on other goals instead. What do I want to get more experience in? Is it cloud computing, web development, or artificial intelligence? When you talk to companies at the career fair, find out if their job openings are in this area. You might find a really good position at a company or a non-profit that wasn’t in your list.

#### Switching teams

After a year and a half at my first team, I decided that it was time to explore something different. I found a team I liked and had 4 rounds of interviews. I didn’t do well.

I didn’t practice anything, not even simply writing on a whiteboard. My logic had been, if I have been working at the company for almost 2 years, why would I need to practice? I was wrong about this. I struggled to write a solution on the whiteboard. Things like my writing being too small and running out of space by not starting at the top left all contributed to not passing.

I hadn’t brushed up on data structures and algorithms. If I had, I would’ve been more confident. Even if you’ve been working at a company as a Software Engineer, before you do a round of interviews with another team, I strongly recommend you go through practice problems on a whiteboard.

As for finding a team, if you are looking to switch teams at your company, it helps to talk informally with members of that team. For this, I found that almost everyone is willing to have lunch with you. People are mostly available at noon too, so there is low risk of lack of availability and meeting conflicts. This is an informal way to find out what the team is working on, and see what the personalities of your potential team members are like. You can learn many things from lunch meetings that can help you in the formal interviews.

It is important to know that at the end of the day, you are interviewing for a specific team. Even if you do really well, you might not get an offer because you are not a culture fit. That’s part of why I try to meet different people in the team first, but this is not always possible. Don’t get discouraged by a rejection, keep your options open, and practice.

This content is from the [“Programming interviews”][4] episode on [The Women in Tech Show: Technical Interviews with Prominent Women in Tech][5].

--------------------------------------------------------------------------------

作者简介：

Software Engineer II at Microsoft Research, opinions are my own, host of www.thewomenintechshow.com

------------

via: https://medium.freecodecamp.org/what-i-learned-from-programming-interviews-29ba49c9b851

作者：[Edaena Salinas ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.freecodecamp.org/@edaenas
[1]:https://anitab.org/event/2017-grace-hopper-celebration-women-computing/
[2]:https://thewomenintechshow.com/2017/12/18/programming-interviews/
[3]:https://www.amazon.com/How-We-Test-Software-Microsoft/dp/0735624259
[4]:https://thewomenintechshow.com/2017/12/18/programming-interviews/
[5]:https://thewomenintechshow.com/