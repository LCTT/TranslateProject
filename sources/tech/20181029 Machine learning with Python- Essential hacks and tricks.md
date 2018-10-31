Machine learning with Python: Essential hacks and tricks
======
Master machine learning, AI, and deep learning with Python.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop.png?itok=pGfEfu2S)

It's never been easier to get started with machine learning. In addition to structured massive open online courses (MOOCs), there are a huge number of incredible, free resources available around the web. Here are a few that have helped me.

  2. Learn to clearly differentiate between the buzzwords—for example, machine learning, artificial intelligence, deep learning, data science, computer vision, and robotics. Read or listen to talks by experts on each of them. Watch this [amazing video by Brandon Rohrer][1], an influential data scientist. Or this video about the [clear differences between various roles][2] associated with data science.


  3. Clearly set a goal for what you want to learn. Then go and take [that Coursera course][3]. Or take the one [from the University of Washington][4], which is pretty good too.


  5. If you are enthusiastic about taking online courses, check out this article for guidance on [choosing the right MOOC][5].


  6. Most of all, develop a feel for it. Join some good social forums, but resist the temptation to latch onto sensationalized headlines and news. Do your own reading to understand what it is and what it is not, where it might go, and what possibilities it can open up. Then sit back and think about how you can apply machine learning or imbue data science principles into your daily work. Build a simple regression model to predict the cost of your next lunch or download your electricity usage data from your energy provider and do a simple time-series plot in Excel to discover some pattern of usage. And after you are thoroughly enamored with machine learning, you can watch this video.

<https://www.youtube.com/embed/IpGxLWOIZy4>

### Is Python a good language for machine learning/AI?

Familiarity and moderate expertise in at least one high-level programming language is useful for beginners in machine learning. Unless you are a Ph.D. researcher working on a purely theoretical proof of some complex algorithm, you are expected to mostly use the existing machine learning algorithms and apply them in solving novel problems. This requires you to put on a programming hat.

There's a lot of talk about the best language for data science. While the debate rages, grab a coffee and read this insightful FreeCodeCamp article to learn about [data science languages][6] . Or, check out this post on KDnuggets to dive directly into the [Python vs. R debate][7]

For now, it's widely believed that Python helps developers be more productive from development to deployment and maintenance. Python's syntax is simpler and at a higher level when compared to Java, C, and C++. It has a vibrant community, open source culture, hundreds of high-quality libraries focused on machine learning, and a huge support base from big names in the industry (e.g., Google, Dropbox, Airbnb, etc.).

### Fundamental Python libraries

Assuming you go with the widespread opinion that Python is the best language for machine learning, there are a few core Python packages and libraries you need to master.

#### NumPy

Short for [Numerical Python][8], NumPy is the fundamental package required for high-performance scientific computing and data analysis in the Python ecosystem. It's the foundation on which nearly all of the higher-level tools, such as [Pandas][9] and [scikit-learn][10], are built. [TensorFlow][11] uses NumPy arrays as the fundamental building blocks underpinning Tensor objects and graphflow for deep learning tasks. Many NumPy operations are implemented in C, making them super fast. For data science and modern machine learning tasks, this is an invaluable advantage.

![](https://opensource.com/sites/default/files/uploads/machine-learning-python_numpy-cheat-sheet.jpeg)

#### Pandas

Pandas is the most popular library in the scientific Python ecosystem for doing general-purpose data analysis. Pandas is built upon a NumPy array, thereby preserving fast execution speed and offering many data engineering features, including:

  * Reading/writing many different data formats
  * Selecting subsets of data
  * Calculating across rows and down columns
  * Finding and filling missing data
  * Applying operations to independent groups within the data
  * Reshaping data into different forms
  * Combing multiple datasets together
  * Advanced time-series functionality
  * Visualization through Matplotlib and Seaborn

![](https://opensource.com/sites/default/files/uploads/pandas_cheat_sheet_github.png)

#### Matplotlib and Seaborn

Data visualization and storytelling with data are essential skills for every data scientist because it's crtitical to be able to communicate insights from analyses to any audience effectively. This is an equally critical part of your machine learning pipeline, as you often have to perform an exploratory analysis of a dataset before deciding to apply a particular machine learning algorithm.

[Matplotlib][12] is the most widely used 2D Python visualization library. It's equipped with a dazzling array of commands and interfaces for producing publication-quality graphics from your data. This amazingly detailed and rich article will help you [get started with Matplotlib][13].

![](https://opensource.com/sites/default/files/uploads/matplotlib_gallery_-1.png)
[Seaborn][14] is another great visualization library focused on statistical plotting. It provides an API (with flexible choices for plot style and color defaults) on top of Matplotlib, defines simple high-level functions for common statistical plot types, and integrates with functionality provided by Pandas. You can start with this great tutorial on [Seaborn for beginners][15].

![](https://opensource.com/sites/default/files/uploads/machine-learning-python_seaborn.png)

#### Scikit-learn

Scikit-learn is the most important general machine learning Python package to master. It features various [classification][16], [regression][17], and [clustering][18] algorithms, including [support vector machines][19], [random forests][20], [gradient boosting][21], [k-means][22], and [DBSCAN][23], and is designed to interoperate with the Python numerical and scientific libraries NumPy and [SciPy][24]. It provides a range of supervised and unsupervised learning algorithms via a consistent interface. The library has a level of robustness and support required for use in production systems. This means it has a deep focus on concerns such as ease of use, code quality, collaboration, documentation, and performance. Look at this [gentle introduction to machine learning vocabulary][25] used in the Scikit-learn universe or this article demonstrating [a simple machine learning pipeline][26] method using Scikit-learn.

This article was originally published on [Heartbeat][27] under [CC BY-SA 4.0][28].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/machine-learning-python-essential-hacks-and-tricks

作者：[Tirthajyoti Sarkar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tirthajyoti
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/watch?v=tKa0zDDDaQk
[2]: https://www.youtube.com/watch?v=Ura_ioOcpQI
[3]: https://www.coursera.org/learn/machine-learning
[4]: https://www.coursera.org/specializations/machine-learning
[5]: https://towardsdatascience.com/how-to-choose-effective-moocs-for-machine-learning-and-data-science-8681700ed83f
[6]: https://medium.freecodecamp.org/which-languages-should-you-learn-for-data-science-e806ba55a81f
[7]: https://www.kdnuggets.com/2017/09/python-vs-r-data-science-machine-learning.html
[8]: http://numpy.org/
[9]: https://pandas.pydata.org/
[10]: http://scikit-learn.org/
[11]: https://www.tensorflow.org/
[12]: https://matplotlib.org/
[13]: https://realpython.com/python-matplotlib-guide/
[14]: https://seaborn.pydata.org/
[15]: https://www.datacamp.com/community/tutorials/seaborn-python-tutorial
[16]: https://en.wikipedia.org/wiki/Statistical_classification
[17]: https://en.wikipedia.org/wiki/Regression_analysis
[18]: https://en.wikipedia.org/wiki/Cluster_analysis
[19]: https://en.wikipedia.org/wiki/Support_vector_machine
[20]: https://en.wikipedia.org/wiki/Random_forests
[21]: https://en.wikipedia.org/wiki/Gradient_boosting
[22]: https://en.wikipedia.org/wiki/K-means_clustering
[23]: https://en.wikipedia.org/wiki/DBSCAN
[24]: https://en.wikipedia.org/wiki/SciPy
[25]: http://scikit-learn.org/stable/tutorial/basic/tutorial.html
[26]: https://towardsdatascience.com/machine-learning-with-python-easy-and-robust-method-to-fit-nonlinear-data-19e8a1ddbd49
[27]: https://heartbeat.fritz.ai/some-essential-hacks-and-tricks-for-machine-learning-with-python-5478bc6593f2
[28]: https://creativecommons.org/licenses/by-sa/4.0/
