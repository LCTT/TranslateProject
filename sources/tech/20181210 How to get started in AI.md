[#]: collector: (lujun9972)
[#]: translator: (qhwdw)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to get started in AI)
[#]: via: (https://opensource.com/article/18/12/how-get-started-ai)
[#]: author: (Gordon Haff https://opensource.com/users/ghaff)

How to get started in AI
======
Before you can begin working in artificial intelligence, you need to acquire some human intelligence.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain-think-ai-intelligence-ccby.png?itok=C-gK01E_)

I've both asked and been asked about the best way to learn more about artificial intelligence (AI). What should I read? What should I watch? I'll get to that. But, first, it's useful to break down this question, given that AI covers a lot of territory.

One important distinction to draw is between the research side of AI and the applied side. Cassie Kozyrkov of Google [drew this distinction][1] in a talk at the recent O'Reilly Artificial Intelligence Conference in London, and it's a good one.

Research AI is rather academic in nature and requires a heavy dose of math across a variety of disciplines before you even get to those parts that are specific to AI. This aspect of AI focuses on the algorithms and tools that drive the state of AI forward. For example, what neural network structures might improve vision recognition results? How might we make unsupervised learning a more generally useful approach? Can we find ways to understand better how deep learning pipelines come up with the answers they do?

Applied AI, on the other hand, is more about using existing tools to obtain useful results. Open source has played a big role here in providing free and often easy-to-use software in a variety of languages. Public cloud providers have also devoted a lot of attention to providing machine learning services, models, and datasets that make the onramp to getting started with AI much simpler than it would be otherwise.

I'll add at this point that applied AI practitioners shouldn't treat their tools as some sort of black box that spits out answers for mysterious reasons. At a minimum, they need to understand the limits and potential biases of different techniques, models, and data collection approaches. It's just that they don't necessarily need to delve deeply into all the theory underpinning every part of their toolchain.

Although it's probably less important for working in AI on a day-to-day basis, it's also useful to understand the broader context of AI. It goes beyond the narrow scope of deep learning on neural networks that have been so important to the gains made in reinforcement learning and supervised learning to date. For example, AI is often viewed as a way to augment (rather than replace) human judgment and decisions. But the handoff between machine and human has its own pitfalls.

With that background, here are some study areas and resources you may find useful.

### Research AI

In a lot of respects, a list of resources for research AI mirror those in an undergraduate (or even graduate) computer science program that's focused on AI. The main difference is that the syllabus you draw up may be more interdisciplinary than more traditionally focused university curricula.

Where you start will depend on your computer science and math background.

If it's minimal or rusty, but you still want to develop a deep understanding of AI fundamentals, you'll benefit from taking some math courses to start. There are many options on massive online open courses (MOOCs) like the nonprofit [edX][2] platform and [Coursera][3]. (Both platforms charge for certifications, but edX makes all the content available for free to people just auditing the course.)

Typical foundational courses could include:

+ [MIT's Calculus courses][22], starting with differentiation
+ [Linear Algebra][23] (University of Texas)
+ Probability and statistics, such as MIT's [Probability—The Science of Uncertainty and Data][24]


To get deeper into AI from a research perspective, you'll probably want to get into all these areas of mathematics and more. But the above should give you an idea of the general branches of study that are probably most important before delving into machine learning and AI proper.

In addition to MOOCs, resources such as [MIT OpenCourseWare][4] provide the syllabus and various supporting materials for a wide range of mathematics and computer science courses.

With the foundations in place, you can move onto more specialized courses in AI proper. Andrew Ng's AI MOOC, from when he was teaching at Stanford, was one of the early courses to popularize the whole online course space. Today, his [Neural Networks and Deep Learning][5] is part of the Deep Learning specialization at Coursera. There are corresponding programs on edX. For example, Columbia offers an [Artificial Intelligence MicroMasters][6].

In addition to courses, a variety of textbooks and other learning material are also available online. These include:

  * [Neural Networks and Deep Learning][7]
  * [Deep Learning][8] from MIT Press by Ian Goodfellow and Yoshua Bengio and Aaron Courville

### Applied AI

Applied AI is much more focused on using available tools than building new ones. Some appreciation of the mathematical underpinnings, especially statistics, is still useful—arguably even necessary—but you won't be majoring in that aspect of AI to the same degree you would in a research mode.

Programming is a core skill here. While different programming languages can come into play, a lot of libraries and toolsets—such as [PyTorch][9]—rely on Python, so that's a good skill to have. Especially if you have some level of programming background, MIT's [Introduction to Computer Science and Programming Using Python][10], based on its on-campus 6.001 course, is a good primer. If you're truly new to programming, Charles Severance's [Programming for Everybody (Getting Started with Python)][11] from the University of Michigan doesn't toss you into the deep end of the pool the way the MIT course does.

[The R programming language][12] is also a useful skill to add to your toolbox. While it's less used in machine learning (ML) per se, it's common for a variety of other data science tasks, and applied AI/ML and data science often blend in practice. For example, many tasks associated with organizing and cleaning data apply equally whatever analysis techniques you'll eventually use. A MOOC sequence like Harvard's [Data Science certificate][13] is an example of a set of courses that provide a good introduction to working with data.

Another open source software library you're likely to encounter if you do any work with AI is [TensorFlow][14]. It was originally developed by researchers and engineers from the Google Brain team within Google's AI organization. [Google offers a variety of tutorials][15] to get started with TensorFlow using the high-level Keras API. You can run TensorFlow locally as well as online in Google Cloud.

In general, all of the big public cloud providers offer online datasets and ML services that can be an easy way to get started. However, especially as you move beyond "play" datasets and applications, you need to start thinking seriously about the degree to which you want to be locked into a single provider.

Datasets for your exploratory learning projects are available from many different sources. In addition to the public cloud providers, [Kaggle][16] is another popular source and also a good learning resource more broadly. Government data is also increasingly available in digital form. The US Federal Government's [Data.gov][17] claims over 300,000 datasets. State and local governments also publish data on everything from restaurant health ratings to dogs' names.

### Miscellany

I'll close by noting that AI is a broad topic that isn't just about math, programming, and data. AI as a whole touches many other fields, including cognitive psychology, linguistics, game theory, operations research, and control systems. Indeed, a concern among at least some AI researchers today is that the field has become too fixated on a small number of techniques that have become powerful and interesting only quite recently because of the intersection of processing power and big data. Many longstanding problems in understanding how humans learn and reason remain largely unsolved. Developing at least some appreciation for these broader problem spaces will better enable you to place AI within a broader context.

One of my favorite examples is the [Humans and Autonomy Lab][18] at Duke. The work in this lab touches on all the challenges of humans working with machines, such as how autopilots can create ["Children of the Magenta"][19] who are unable to take control quickly if the automation fails. A basic brain-science course, such as MIT's [Introduction to Psychology][20], provides some useful context for the relationship between human intelligence and machine intelligence. Another course in a similar vein, but taught by the late Marvin Minsky from MIT's Electrical Engineering and Computer Science department, is [The Society of Mind][21].

If there's one key challenge to learning about AI, it's not that raw materials and tools aren't readily available. It's that there are so many of them. My objective hasn't been to give you a comprehensive set of pointers. Rather, it's been to both point out the different paths you can take and provide you with some possible starting points. Happy learning!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/how-get-started-ai

作者：[Gordon Haff][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ghaff
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/watch?v=RLtI7r3QUyY
[2]: https://www.edx.org/
[3]: https://www.coursera.org/
[4]: https://ocw.mit.edu/index.htm
[5]: https://www.coursera.org/learn/neural-networks-deep-learning
[6]: https://www.edx.org/micromasters/columbiax-artificial-intelligence
[7]: http://neuralnetworksanddeeplearning.com/
[8]: http://www.deeplearningbook.org/
[9]: https://pytorch.org/
[10]: https://www.edx.org/course/introduction-to-computer-science-and-programming-using-python
[11]: https://www.coursera.org/learn/python
[12]: https://www.r-project.org/about.html
[13]: https://www.edx.org/professional-certificate/harvardx-data-science
[14]: https://www.tensorflow.org/
[15]: https://www.tensorflow.org/tutorials/
[16]: https://www.kaggle.com/
[17]: https://www.data.gov/
[18]: https://hal.pratt.duke.edu/
[19]: https://99percentinvisible.org/episode/children-of-the-magenta-automation-paradox-pt-1/
[20]: https://ocw.mit.edu/courses/brain-and-cognitive-sciences/9-00sc-introduction-to-psychology-fall-2011/
[21]: https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-868j-the-society-of-mind-fall-2011/
[22]: https://www.edx.org/course/calculus-1a-differentiation
[23]: https://www.edx.org/course/linear-algebra-foundations-to-frontiers
[24]: https://courses.edx.org/courses/course-v1:MITx+6.431x+3T2018/course/
