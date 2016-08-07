+@noobfish translating since Aug 2nd,2016.
+
+


>This is the third in a series of posts on how to build a Data Science Portfolio. If you like this and want to know when the next post in the series is released, you can [subscribe at the bottom of the page][1].

Data science companies are increasingly looking at portfolios when making hiring decisions. One of the reasons for this is that a portfolio is the best way to judge someone’s real-world skills. The good news for you is that a portfolio is entirely within your control. If you put some work in, you can make a great portfolio that companies are impressed by.

The first step in making a high-quality portfolio is to know what skills to demonstrate. The primary skills that companies want in data scientists, and thus the primary skills they want a portfolio to demonstrate, are:

- Ability to communicate
- Ability to collaborate with others
- Technical competence
- Ability to reason about data
- Motivation and ability to take initiative

Any good portfolio will be composed of multiple projects, each of which may demonstrate 1-2 of the above points. This is the third post in a series that will cover how to make a well-rounded data science portfolio. In this post, we’ll cover how to make the second project in your portfolio, and how to build an end to end machine learning project. At the end, you’ll have a project that shows your ability to reason about data, and your technical competence. [Here’s][2] the completed project if you want to take a look.

### An end to end project

As a data scientist, there are times when you’ll be asked to take a dataset and figure out how to [tell a story with it][3]. In times like this, it’s important to communicate very well, and walk through your process. Tools like Jupyter notebook, which we used in a previous post, are very good at helping you do this. The expectation here is that the deliverable is a presentation or document summarizing your findings.

However, there are other times when you’ll be asked to create a project that has operational value. A project with operational value directly impacts the day-to-day operations of a company, and will be used more than once, and often by multiple people. A task like this might be “create an algorithm to forecast our churn rate”, or “create a model that can automatically tag our articles”. In cases like this, storytelling is less important than technical competence. You need to be able to take a dataset, understand it, then create a set of scripts that can process that data. It’s often important that these scripts run quickly, and use minimal system resources like memory. It’s very common that these scripts will be run several times, so the deliverable becomes the scripts themselves, not a presentation. The deliverable is often integrated into operational flows, and may even be user-facing.

The main components of building an end to end project are:

- Understanding the context
- Exploring the data and figuring out the nuances
- Creating a well-structured project, so its easy to integrate into operational flows
- Writing high-performance code that runs quickly and uses minimal system resources
- Documenting the installation and usage of your code well, so others can use it

In order to effectively create a project of this kind, we’ll need to work with multiple files. Using a text editor like [Atom][4], or an IDE like [PyCharm][5] is highly recommended. These tools will allow you to jump between files, and edit files of different types, like markdown files, Python files, and csv files. Structuring your project so it’s easy to version control and upload to collaborative coding tools like [Github][6] is also useful.

![](https://www.dataquest.io/blog/images/end_to_end/github.png)
>This project on Github.

We’ll use our editing tools along with libraries like [Pandas][7] and [scikit-learn][8] in this post. We’ll make extensive use of Pandas [DataFrames][9], which make it easy to read in and work with tabular data in Python.

### Finding good datasets

A good dataset for an end to end portfolio project can be hard to find. [The dataset][10] needs to be sufficiently large that memory and performance constraints come into play. It also needs to potentially be operationally useful. For instance, this dataset, which contains data on the admission criteria, graduation rates, and graduate future earnings for US colleges would be a great dataset to use to tell a story. However, as you think about the dataset, it becomes clear that there isn’t enough nuance to build a good end to end project with it. For example, you could tell someone their potential future earnings if they went to a specific college, but that would be a quick lookup without enough nuance to demonstrate technical competence. You could also figure out if colleges with higher admissions standards tend to have graduates who earn more, but that would be more storytelling than operational.

These memory and performance constraints tend to come into play when you have more than a gigabyte of data, and when you have some nuance to what you want to predict, which involves running algorithms over the dataset.

A good operational dataset enables you to build a set of scripts that transform the data, and answer dynamic questions. A good example would be a dataset of stock prices. You would be able to predict the prices for the next day, and keep feeding new data to the algorithm as the markets closed. This would enable you to make trades, and potentially even profit. This wouldn’t be telling a story – it would be adding direct value.

Some good places to find datasets like this are:

- [/r/datasets][11] – a subreddit that has hundreds of interesting datasets.
- [Google Public Datasets][12] – public datasets available through Google BigQuery.
- [Awesome datasets][13] – a list of datasets, hosted on Github.

As you look through these datasets, think about what questions someone might want answered with the dataset, and think if those questions are one-time (“how did housing prices correlate with the S&P 500?”), or ongoing (“can you predict the stock market?”). The key here is to find questions that are ongoing, and require the same code to be run multiple times with different inputs (different data).

For the purposes of this post, we’ll look at [Fannie Mae Loan Data][14]. Fannie Mae is a government sponsored enterprise in the US that buys mortgage loans from other lenders. It then bundles these loans up into mortgage-backed securities and resells them. This enables lenders to make more mortgage loans, and creates more liquidity in the market. This theoretically leads to more homeownership, and better loan terms. From a borrowers perspective, things stay largely the same, though.

Fannie Mae releases two types of data – data on loans it acquires, and data on how those loans perform over time. In the ideal case, someone borrows money from a lender, then repays the loan until the balance is zero. However, some borrowers miss multiple payments, which can cause foreclosure. Foreclosure is when the house is seized by the bank because mortgage payments cannot be made. Fannie Mae tracks which loans have missed payments on them, and which loans needed to be foreclosed on. This data is published quarterly, and lags the current date by 1 year. As of this writing, the most recent dataset that’s available is from the first quarter of 2015.

Acquisition data, which is published when the loan is acquired by Fannie Mae, contains information on the borrower, including credit score, and information on their loan and home. Performance data, which is published every quarter after the loan is acquired, contains information on the payments being made by the borrower, and the foreclosure status, if any. A loan that is acquired may have dozens of rows in the performance data. A good way to think of this is that the acquisition data tells you that Fannie Mae now controls the loan, and the performance data contains a series of status updates on the loan. One of the status updates may tell us that the loan was foreclosed on during a certain quarter.

![](https://www.dataquest.io/blog/images/end_to_end/foreclosure.jpg)
>A foreclosed home being sold.

### Picking an angle

There are a few directions we could go in with the Fannie Mae dataset. We could:

- Try to predict the sale price of a house after it’s foreclosed on.
- Predict the payment history of a borrower.
- Figure out a score for each loan at acquisition time.

The important thing is to stick to a single angle. Trying to focus on too many things at once will make it hard to make an effective project. It’s also important to pick an angle that has sufficient nuance. Here are examples of angles without much nuance:

- Figuring out which banks sold loans to Fannie Mae that were foreclosed on the most.
- Figuring out trends in borrower credit scores.
- Exploring which types of homes are foreclosed on most often.
- Exploring the relationship between loan amounts and foreclosure sale prices

All of the above angles are interesting, and would be great if we were focused on storytelling, but aren’t great fits for an operational project.

With the Fannie Mae dataset, we’ll try to predict whether a loan will be foreclosed on in the future by only using information that was available when the loan was acquired. In effect, we’ll create a “score” for any mortgage that will tell us if Fannie Mae should buy it or not. This will give us a nice foundation to build on, and will be a great portfolio piece.

