### Understanding the data

Let’s take a quick look at the raw data files. Here are the first few rows of the acquisition data from quarter 1 of 2012:

```
100000853384|R|OTHER|4.625|280000|360|02/2012|04/2012|31|31|1|23|801|N|C|SF|1|I|CA|945||FRM|
100003735682|R|SUNTRUST MORTGAGE INC.|3.99|466000|360|01/2012|03/2012|80|80|2|30|794|N|P|SF|1|P|MD|208||FRM|788
100006367485|C|PHH MORTGAGE CORPORATION|4|229000|360|02/2012|04/2012|67|67|2|36|802|N|R|SF|1|P|CA|959||FRM|794
```

Here are the first few rows of the performance data from quarter 1 of 2012:

```
100000853384|03/01/2012|OTHER|4.625||0|360|359|03/2042|41860|0|N||||||||||||||||
100000853384|04/01/2012||4.625||1|359|358|03/2042|41860|0|N||||||||||||||||
100000853384|05/01/2012||4.625||2|358|357|03/2042|41860|0|N||||||||||||||||
```

Before proceeding too far into coding, it’s useful to take some time and really understand the data. This is more critical in operational projects – because we aren’t interactively exploring the data, it can be harder to spot certain nuances unless we find them upfront. In this case, the first step is to read the materials on the Fannie Mae site:

- [Overview][15]
- [Glossary of useful terms][16]
- [FAQs][17]
- [Columns in the Acquisition and Performance files][18]
- [Sample Acquisition data file][19]
- [Sample Performance data file][20]

After reading through these files, we know some key facts that will help us:

- There’s an Acquisition file and a Performance file for each quarter, starting from the year 2000 to present. There’s a 1 year lag in the data, so the most recent data is from 2015 as of this writing.
- The files are in text format, with a pipe (|) as a delimiter.
- The files don’t have headers, but we have a list of what each column is.
- All together, the files contain data on 22 million loans.
- Because the Performance files contain information on loans acquired in previous years, there will be more performance data for loans acquired in earlier years (ie loans acquired in 2014 won’t have much performance history).

These small bits of information will save us a ton of time as we figure out how to structure our project and work with the data.

### Structuring the project

Before we start downloading and exploring the data, it’s important to think about how we’ll structure the project. When building an end-to-end project, our primary goals are:

- Creating a solution that works
- Having a solution that runs quickly and uses minimal resources
- Enabling others to easily extend our work
- Making it easy for others to understand our code
- Writing as little code as possible

In order to achieve these goals, we’ll need to structure our project well. A well structured project follows a few principles:

- Separates data files and code files.
- Separates raw data from generated data.
- Has a README.md file that walks people through installing and using the project.
- Has a requirements.txt file that contains all the packages needed to run the project.
- Has a single settings.py file that contains any settings that are used in other files.
    - For example, if you are reading the same file from multiple Python scripts, it’s useful to have them all import settings and get the file name from a centralized place.
- Has a .gitignore file that prevents large or secret files from being committed.
- Breaks each step in our task into a separate file that can be executed separately.
    - For example, we may have one file for reading in the data, one for creating features, and one for making predictions.
- Stores intermediate values. For example, one script may output a file that the next script can read.
    - This enables us to make changes in our data processing flow without recalculating everything.

Our file structure will look something like this shortly:

```
loan-prediction
├── data
├── processed
├── .gitignore
├── README.md
├── requirements.txt
├── settings.py
```

### Creating the initial files

To start with, we’ll need to create a loan-prediction folder. Inside that folder, we’ll need to make a data folder and a processed folder. The first will store our raw data, and the second will store any intermediate calculated values.

Next, we’ll make a .gitignore file. A .gitignore file will make sure certain files are ignored by git and not pushed to Github. One good example of such a file is the .DS_Store file created by OSX in every folder. A good starting point for a .gitignore file is here. We’ll also want to ignore the data files because they are very large, and the Fannie Mae terms prevent us from redistributing them, so we should add two lines to the end of our file:

```
data
processed
```

[Here’s][21] an example .gitignore file for this project.

Next, we’ll need to create README.md, which will help people understand the project.  .md indicates that the file is in markdown format. Markdown enables you write plain text, but also add some fancy formatting if you want. [Here’s][22] a guide on markdown. If you upload a file called README.md to Github, Github will automatically process the markdown, and show it to anyone who views the project. [Here’s][23] an example.

For now, we just need to put a simple description in README.md:

```
Loan Prediction
-----------------------

Predict whether or not loans acquired by Fannie Mae will go into foreclosure.  Fannie Mae acquires loans from other lenders as a way of inducing them to lend more.  Fannie Mae releases data on the loans it has acquired and their performance afterwards [here](http://www.fanniemae.com/portal/funding-the-market/data/loan-performance-data.html).
```

Now, we can create a requirements.txt file. This will make it easy for other people to install our project. We don’t know exactly what libraries we’ll be using yet, but here’s a good starting point:

```
pandas
matplotlib
scikit-learn
numpy
ipython
scipy
```

The above libraries are the most commonly used for data analysis tasks in Python, and its fair to assume that we’ll be using most of them. [Here’s][24] an example requirements file for this project.

After creating requirements.txt, you should install the packages. For this post, we’ll be using Python 3. If you don’t have Python installed, you should look into using [Anaconda][25], a Python installer that also installs all the packages listed above.

Finally, we can just make a blank settings.py file, since we don’t have any settings for our project yet.

