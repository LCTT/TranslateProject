polebug is translating

How Machines Learn: A Practical Guide
============================================================

![](https://cdn-images-1.medium.com/max/1000/1*MxSBSJIqK19z2qhfspPL-g.png)

You may have heard about machine learning from interesting applications like spam filtering, optical character recognition, and computer vision.

Getting started with machine learning is long process that involves going through several resources. There are books for newbies, academic papers, guided exercises, and standalone projects. It’s easy to lose track of what you need to learn among all these options.

So in today’s post, I’ll list seven steps (and 50+ resources) that can help you get started in this exciting field of Computer Science, and ramp up toward becoming a machine learning hero.

Note that this list of resources is not exhaustive and is meant to get you started. There are many more resources around.

### 1\. Get the necessary background knowledge

You might remember from DataCamp’s [Learn Data Science][77] infographic that mathematics and statistics are key to starting machine learning (ML). The foundations might seem quite easy because it’s just three topics. But don’t forget that these are in fact three broad topics.

There are two things that are very important to keep in mind here:

*   First, you’ll definitely want some further guidance on what exactly you need to cover to get started.

*   Second, these are the foundations of your further learning. Don’t be scared to take your time. Get the knowledge on which you’ll build everything.

The first point is simple: it’s a good idea to cover linear algebra and statistics. These two are the bare minimum that one should understand. But while you’re at it, you should also try to cover topics such as optimization and advanced calculus. They will come in handy when you’re getting deeper into ML.

Here are some pointers on where to get started if you are starting from zero:

*   [Khan Academy][1] is a good resource for beginners. Consider taking the Linear Algebra and Calculus courses.

*   Go to [MIT OpenCourseWare][2] and take the[ Linear Algebra][3] course.

*   Take [this Coursera course][4] for an introduction to descriptive statistics, probability theory, and inferential statistics.


![](https://cdn-images-1.medium.com/max/800/1*Uw8YXNlt5VGKTXFDbtFEig.png)
Statistics is one of the keys to learning ML

If you’re more into books, consider the following:

*   [_Linear Algebra and Its Applications_][5]  _,_ 

*   [_Applied Linear Algebra_][6] ,

*   [_3,000 Solved Problems in Linear Algebra_][7]  _,_ 

*   [MIT Online Texbooks][8]

However, in most cases, you’ll start off already knowing some things about statistics and mathematics. Or maybe you have already gone through all the theory resources listed above.

In these cases, it’s a good idea to recap and assess your knowledge honestly. Are there any areas that you need to revise or are you good for now?

If you’re all set, it’s time to go ahead and apply all that knowledge with R or Python. As a general guideline, it’s a good idea to pick one and get started with that language. Later, you can still add the other programming language to your skill set.

Why is all this programming knowledge necessary?

Well, you’ll see that the courses listed above (or those you have taken in school or university) will provide you with a more theoretical (and not applied) introduction to mathematics and statistics topics. However, ML is very applied and you’ll need to be able to apply all the topics you have learned. So it’s a good idea to go over the materials again, but this time in an applied way.

If you want to master the basics of R and Python, consider the following courses:

*   DataCamp’s introductory Python or R courses: [Intro to Python for Data Science][9] or [Introduction to R Programming][10].

*   Introductory Python and R courses from Edx: [Introduction to Python for Data Science][11] and [Introduction to R for Data Science][12].

*   There are many other free courses out there. Check out [Coursera][13] or [Codeacademy][14] for more.

When you have nailed down the basics, check out DataCamp’s blog on the [40+ Python Statistics For Data Science Resources][78]. This post offers 40+ resources on the statistics topics you need to know to get started with data science (and by extension also ML).

Also make sure you check out [this SciPy tutorial][79] on vectors and arrays and [this workshop][80] on Scientific Computing with Python.

To get hands-on with Python and calculus, you can check out the [SymPy package][81].

### 2\. Don’t be scared to invest in the “theory” of ML

A lot of people don’t make the effort to go through some more theoretical material because it’s “dry” or “boring.” But going through the theory and really investing your time in it is essential and invaluable in the long run. You’ll better understand new advancements in machine learning, and you’ll be able to link back to your background knowledge. This will help you stay motivated.

Additionally, the theory doesn’t need to be boring. As you read in the introduction, there are so many materials that will make it easier for you to get into it.

Books are one of the best ways to absorb the theoretical knowledge. They force you to stop and think once in a while. Of course, reading books is a very static thing to do and it might not agree with your learning style. Nonetheless, try out the following books and see if it might be something for you:

*   [_Machine Learning textbook_][15] , by Tom Mitchell might be old but it’s gold. This book goes over the most important topics in machine learning in a well-explained and step-by-step way.

*   _Machine Learning: The Art and Science of Algorithms that Make Sense of Data _ (you can see the slides of the book [here][16]): this book is great for beginners. There are many real-life applications discussed, which you might find lacking in Tom Mitchell’s book.

*   [_Machine Learning Yearning_][17] : this book by Andrew Ng is not yet complete, but it’s bound to be an excellent reference for those who are learning ML.

*   [_Algorithms and Data Structures_][18]  by Jurg Nievergelt and Klaus Hinrichs

*   Also check out the  [_Data Mining for the Masses_][19]  by Matthew North. You’ll find that this book guides you through some of the most difficult topics.

*   [_Introduction to Machine Learning_][20]  by Alex Smola and S.V.N. Vishwanathan.


![](https://cdn-images-1.medium.com/max/800/1*TpLLAIKIRVHq6VQs3Q9IJA.png)
Take your time to read books and to study the material covered in them

Videos / MOOCs are awesome for those who learn by watching and listening. There are a lot of MOOCs and videos out there, but it can also be hard to find your way through all those materials. Below is a list of the most notable ones:

*   [This well-known Machine Learning MOOC][21], taught by Andrew Ng, introduces you to Machine Learning and the theory. Don’t worry — it’s well-explained and takes things step-by-step, so it’s excellent for beginners.

*   The [playlist of the MIT Open Courseware 6034 course][22]: already a bit more advanced. You’ll definitely need some previous work on ML theory before you start this series, but you won’t regret it.

At this point, it’s important for you to go over the separate techniques and grasp the whole picture. This starts with understanding key concepts: the distinction between supervised and unsupervised learning, classification and regression, and so on. Manual (written) exercises can come in handy. They can help you understand how algorithms work and how you should go about them. You’ll most often find these written exercises in courses from universities. Check out [this ML course][82] by Portland State University.

### 3\. Get hands-on

Knowing the theory and understanding the algorithms by reading and watching is all good. But you also need to surpass this stage and get started with some exercises. You’ll learn to implement these algorithms and apply the theory that you’ve learned.

First, you have tutorials which introduce you to the basics of machine learning in Python and R. The best way is, of course, to go for interactive tutorials:

*   In [Python Machine Learning: Scikit-Learn Tutorial][23], you will learn more about well-known algorithms KMeans and Support Vector Machines (SVM) to construct models with Scikit-Learn.

*   [Machine Learning in R for beginners][24] introduces you to ML in R with the class and caret packages.

*   [Keras Tutorial: Deep Learning in Python covers ][25]how to build Multi-Layer Perceptrons (MLPs) for classification and regression tasks, step-by-step.

Also check out the following tutorials, which are static and will require you to work in an IDE:

*   [Machine Learning in Python, Step By Step][26]: step-by-step tutorial with Scikit-Learn.

*   [Develop Your First Neural Network in Python With Keras Step-By-Step][27]: learn how to develop your first neural network with Keras thanks to this tutorial.

*   There are many more that you can consider, but the tutorials of [Machine Learning Mastery][28] are very good.

Besides the tutorials, there are also courses. Taking courses will help you apply the concepts that you’ve learned in a focused way. Experienced instructors will help you. Here are some interactive courses for Python and ML:

*   [Supervised Learning with scikit-learn][29]: you’ll learn how to build predictive models, tune their parameters, and predict how well they will perform on unseen data. All while using real world datasets. You’ll do so with Scikit-Learn.

*   [Unsupervised Learning in Python][30]: shows you how to cluster, transform, visualize, and extract insights from unlabeled datasets. At the end of the course, you’ll build a recommender system.

*   [Deep Learning in Python][31]: you’ll gain hands-on, practical knowledge of how to use deep learning with Keras 2.0, the latest version of a cutting-edge library for deep learning in Python.

*   [Applied Machine Learning in Python][32]: introduces the learner to applied ML and focuses more on the techniques and methods than on the statistics behind these methods.



![](https://cdn-images-1.medium.com/max/800/1*xYFavqTjvPDUCfMVrfPr-A.png)
After the theory, take your time to apply the knowledge you have gained.

For those who are learning ML with R, there are also these interactive courses:

*   [Introduction to Machine Learning][33] gives you a broad overview of the discipline’s most common techniques and applications. You’ll gain more insight into the assessment and training of different ML models. The rest of the course focuses on an introduction to three of the most basic ML tasks: classification, regression, and clustering.

*   [R: Unsupervised Learning][34] provides a basic introduction to clustering and dimensionality reduction in R from a ML perspective. This allows you to get from data to insights as quickly as possible.

*   [Practical Machine Learning][35] covers the basic components of building and applying prediction functions with an emphasis on practical applications.

Lastly, there are also books that go over ML topics in a very applied way. If you’re looking to learn with the help of text and an IDE, check out these books:

*   The  [_Python Machine Learning Book_][36]  by Sebastian Raschka

*   The [Introduction to Artificial Neural Networks and Deep Learning: A Practical Guide with Applications in Python][37] by Sebastian Raschka

*   [_Machine Learning with R_][38]  by Brett Lantz

### 4\. Practice

Practice is even more important than getting hands-on and revising the material with Python. This step was probably the hardest one for me. Check out how other people have implemented ML algorithms when you have done some exercises. Then, get started on your own projects that illustrate your understanding of ML algorithms and theories.

One of the most straightforward ways is to see the exercises a tiny bit bigger. You want to do a bigger exercise which requires you to do more data cleaning and feature engineering.

*   Start with[ Kaggle][39]. If you need additional help to conquer the so-called “data fear,” check out the [Kaggle Python Tutorial on Machine Learning][40]and[ Kaggle R Tutorial on Machine Learning][41]. These will bring you up to speed in no time.

*   Afterwards, you can also start doing challenges by yourself. Check out these sites, where you can find lots of ML datasets: [UCI Machine Learning Repository][42], [Public datasets for machine learning][43], and [data.world][44].


![](https://cdn-images-1.medium.com/max/800/1*ZbZrcoYWENMQuKLbDkdG4A.png)
Practice makes perfect.

### 5\. Projects

Doing small exercises is good. But in the end, you’ll want to make a project in which you can demonstrate your understanding of the ML algorithms with which you’ve been working.

The best exercise is to implement your own ML algorithm. You can read more about why you should do this exercise and what you can learn from it in the following pages:

*   [Why is there a need to manually implement machine learning algorithms when there are many advanced APIs like tensorflow available?][45]

*   [Why Implement Machine Learning Algorithms From Scratch?][46]

*   [What I Learned Implementing a Classifier from Scratch in Python][47]

Next, you can check out the following posts and repositories. They’ll give you some inspiration from others and will show how they have implemented ML algorithms.

*   [How to Implement a Machine Learning Algorithm][48]

*   [ML From Scratch][49]

*   [Machine Learning Algorithms From Scratch][50]



![](https://cdn-images-1.medium.com/max/800/1*k0vqKBz-LwnMElA0o2FhOg.png)
Projects can be hard at start, but they’ll increase your understanding even more.

### 6\. Don’t stop

Learning ML is something that should never stop. As many will confirm, there are always new things to learn — even when you’ve been working in this area for a decade.

There are, for example, ML trends such as deep learning which are very popular right now. You might also focus on other topics that aren’t central at this point but which might be in the future. Check out this [interesting question and the answers][83] if you want to know more.

Papers may not be the first thing that spring to mind when you’re worried about mastering the basics. But they are your way to get up to date with the latest research. Papers are not for those who are just starting out. They are definitely a good fit for those who are more advanced.

*   [Top 20 Recent Research Papers on Machine Learning and Deep Learning][51]

*   [Journal of Machine Learning Research][52]

*   [Awesome Deep Learning Papers][53]

*   [What are some of the best research papers/books for Machine learning?][54]

Other technologies are also something to consider. But don’t worry about them when you’re just starting out. You can, for example, focus on adding Python or R (depending on which one you already know) to your skill set. You can look through this post to find interesting resources.

If you also want to move towards big data, you could consider looking into Spark. Here are some interesting resources:

*   [Introduction to Spark in R with sparklyr][55]

*   [Data Science And Engineering With Spark][56]

*   [Introduction to Apache Spark][57]

*   [Distributed Machine Learning with Apache Spark][58]

*   [Big Data Analysis with Apache Spark][59]

*   [Apache Spark in Python: Beginner’s Guide][60]

*   [PySpark RDD Cheat Sheet][61]

*   [PySpark SQL Cheat Sheet][62].

Other programming languages, such as Java, JavaScript, C, and C++ are gaining importance in ML. In the long run, you can consider also adding one of these languages to your to-do list. You can use these blog posts to guide your choice:

*   [Most Popular Programming Languages for Machine Learning and Data Science][63]

*   [The Most Popular Language For Machine Learning And Data Science Is…][64]


![](https://cdn-images-1.medium.com/max/800/1*6J6tjlMIi0OcNdm7tyJQ4Q.png)
You’re never done learning.

### 7\. Make use of all the material that is out there

Machine learning is a difficult topic which can make you lose your motivation at some point. Or maybe you feel you need a change. In such cases, remember that there’s a lot of material on which you can fall back. Check out the following resources:

Podcasts. Great resource for continuing your journey into ML and staying up-to-date with the latest developments in the field:

*   [Talking Machines][65]

*   [Data Skeptic][66]

*   [Linear Digressions][67]

*   [This Week in Machine Learning & AI][68]

*   [Learning Machines 101][69]

There are, of course, many more podcasts.

Documentation and package source code are two ways to get deeper into the implementation of the ML algorithms. Check out some of these repositories:

*   [Scikit- Learn][70]: Well-known Python ML package

*   [Keras][71]: Deep learning package for Python

*   [caret][72]: very popular R package for Classification and Regression Training

Visualizations are one of the newest and trendiest ways to get into the theory of ML. They’re fantastic for beginners, but also very interesting for more advanced learners. The following visualizations will intrigue you and will help you gain more understanding into the workings of ML:

*   [A visual introduction to machine learning][73]

*   [Distill][74] makes ML Research clear, dynamic and vivid.

*   [Tensorflow — Neural Network Playground][75] if you’re looking to play around with neural network architectures.

*   More here:[ What are the best visualizations of machine learning algorithms?][76]


![](https://cdn-images-1.medium.com/max/800/1*nCt9ZsXRksdOMown4vuxJA.png)
Some variety in your learning can and will motivate you even more.

### You Can Get Started Now

Now it’s up to you. Learning ML is something that’s a continuous process, so the sooner you get started, the better. You have all of the tools in your hands now to get started. Good luck and make sure to let us know how you’re progressing.

 _This post is based on an answer I gave to the Quora question _  [_How Does A Total Beginner Start To Learn Machine Learning_][84]  _._

--------------------------------------------------------------------------------
作者简介：

Karlijn Willems

Data Science Journalist 

-----------------------

via: https://medium.freecodecamp.org/how-machines-learn-a-practical-guide-203aae23cafb

作者：[ Karlijn Willems][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.freecodecamp.org/@kacawi
[1]:http://www.khanacademy.org/
[2]:https://ocw.mit.edu/index.htm
[3]:https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/
[4]:https://www.coursera.org/learn/basic-statistics
[5]:https://www.amazon.com/Linear-Algebra-Its-Applications-4th/dp/0030105676
[6]:https://www.amazon.com/Applied-Linear-Algebra-3rd-Noble/dp/0130412600
[7]:https://www.amazon.de/Solved-Problems-Linear-Algebra-Schaums/dp/0070380236
[8]:https://ocw.mit.edu/courses/online-textbooks/
[9]:https://www.datacamp.com/courses/intro-to-python-for-data-science
[10]:https://www.datacamp.com/courses/free-introduction-to-r
[11]:https://www.edx.org/course/introduction-python-data-science-microsoft-dat208x-5
[12]:https://www.edx.org/course/introduction-r-data-science-microsoft-dat204x-4
[13]:http://www.coursera.org/
[14]:https://www.codecademy.com/
[15]:http://www.cs.cmu.edu/~tom/mlbook.html
[16]:http://www.cs.bris.ac.uk/~flach/mlbook/materials/mlbook-beamer.pdf
[17]:http://www.mlyearning.org/
[18]:https://www.amazon.com/Algorithms-Data-Structures-Applications-Practitioner/dp/0134894286
[19]:https://www.amazon.com/Data-Mining-Masses-Matthew-North/dp/0615684378
[20]:http://alex.smola.org/drafts/thebook.pdf
[21]:https://www.coursera.org/learn/machine-learning
[22]:https://youtu.be/TjZBTDzGeGg?list=PLnvKubj2-I2LhIibS8TOGC42xsD3-liux
[23]:https://www.datacamp.com/community/tutorials/machine-learning-python
[24]:https://www.datacamp.com/community/tutorials/machine-learning-in-r
[25]:https://www.datacamp.com/community/tutorials/deep-learning-python
[26]:http://machinelearningmastery.com/machine-learning-in-python-step-by-step/
[27]:http://machinelearningmastery.com/tutorial-first-neural-network-python-keras/
[28]:http://www.machinelearningmastery.com/
[29]:https://www.datacamp.com/courses/supervised-learning-with-scikit-learn
[30]:https://www.datacamp.com/courses/unsupervised-learning-in-python
[31]:https://www.datacamp.com/courses/deep-learning-in-python
[32]:https://www.coursera.org/learn/python-machine-learning
[33]:https://www.datacamp.com/courses/introduction-to-machine-learning-with-r
[34]:https://www.datacamp.com/courses/unsupervised-learning-in-r
[35]:https://www.coursera.org/learn/practical-machine-learning
[36]:https://github.com/rasbt/python-machine-learning-book
[37]:https://github.com/rasbt/deep-learning-book
[38]:https://books.google.be/books/about/Machine_Learning_with_R.html?id=ZQu8AQAAQBAJ&source=kp_cover&redir_esc=y
[39]:http://www.kaggle.com/
[40]:https://www.datacamp.com/community/open-courses/kaggle-python-tutorial-on-machine-learning
[41]:https://www.datacamp.com/community/open-courses/kaggle-tutorial-on-machine-learing-the-sinking-of-the-titanic
[42]:http://archive.ics.uci.edu/ml/
[43]:http://homepages.inf.ed.ac.uk/rbf/IAPR/researchers/MLPAGES/mldat.htm
[44]:https://data.world/
[45]:https://www.quora.com/Why-is-there-a-need-to-manually-implement-machine-learning-algorithms-when-there-are-many-advanced-APIs-like-tensorflow-available
[46]:http://www.kdnuggets.com/2016/05/implement-machine-learning-algorithms-scratch.html
[47]:http://www.jeannicholashould.com/what-i-learned-implementing-a-classifier-from-scratch.html
[48]:http://machinelearningmastery.com/how-to-implement-a-machine-learning-algorithm/
[49]:https://github.com/eriklindernoren/ML-From-Scratch
[50]:https://github.com/madhug-nadig/Machine-Learning-Algorithms-from-Scratch
[51]:http://www.kdnuggets.com/2017/04/top-20-papers-machine-learning.html
[52]:http://www.jmlr.org/
[53]:https://github.com/terryum/awesome-deep-learning-papers
[54]:https://www.quora.com/What-are-some-of-the-best-research-papers-books-for-Machine-learning
[55]:https://www.datacamp.com/courses/introduction-to-spark-in-r-using-sparklyr
[56]:https://www.edx.org/xseries/data-science-engineering-apache-spark
[57]:https://www.edx.org/course/introduction-apache-spark-uc-berkeleyx-cs105x
[58]:https://www.edx.org/course/distributed-machine-learning-apache-uc-berkeleyx-cs120x
[59]:https://www.edx.org/course/big-data-analysis-apache-spark-uc-berkeleyx-cs110x
[60]:https://www.datacamp.com/community/tutorials/apache-spark-python
[61]:https://www.datacamp.com/community/blog/pyspark-cheat-sheet-python
[62]:https://www.datacamp.com/community/blog/pyspark-sql-cheat-sheet
[63]:https://fossbytes.com/popular-top-programming-languages-machine-learning-data-science/
[64]:http://www.kdnuggets.com/2017/01/most-popular-language-machine-learning-data-science.html
[65]:http://www.thetalkingmachines.com/
[66]:https://dataskeptic.com/
[67]:http://lineardigressions.com/
[68]:https://twimlai.com/
[69]:http://www.learningmachines101.com/
[70]:https://github.com/scikit-learn/scikit-learn
[71]:http://www.github.com/fchollet/keras
[72]:http://topepo/caret
[73]:http://www.r2d3.us/visual-intro-to-machine-learning-part-1/
[74]:http://distill.pub/
[75]:http://playground.tensorflow.org/
[76]:https://www.quora.com/What-are-the-best-visualizations-of-machine-learning-algorithms
[77]:https://www.datacamp.com/community/tutorials/learn-data-science-infographic
[78]:https://www.datacamp.com/community/tutorials/python-statistics-data-science
[79]:https://www.datacamp.com/community/tutorials/python-scipy-tutorial
[80]:http://www.math.pitt.edu/~siam/workshops/python10/python.pdf
[81]:http://docs.sympy.org/latest/tutorial/calculus.html
[82]:http://web.cecs.pdx.edu/~mm/MachineLearningSpring2017/
[83]:https://www.quora.com/Should-I-quit-machine-learning
[84]:https://www.quora.com/How-does-a-total-beginner-start-to-learn-machine-learning/answer/Karlijn-Willems-1
