Translated by Yoo-4x

Building a data science portfolio: Storytelling with data
========


>This is the first in a series of posts on how to build a Data Science Portfolio. If you like this and want to know when the next post in the series is released, you can [subscribe at the bottom of the page][35].

Data science companies are increasingly looking at portfolios when making hiring decisions. One of the reasons for this is that a portfolio is the best way to judge someone’s real-world skills. The good news for you is that a portfolio is entirely within your control. If you put some work in, you can make a great portfolio that companies are impressed by.

The first step in making a high-quality portfolio is to know what skills to demonstrate. The primary skills that companies want in data scientists, and thus the primary skills they want a portfolio to demonstrate, are:

*   Ability to communicate
*   Ability to collaborate with others
*   Technical competence
*   Ability to reason about data
*   Motivation and ability to take initiative

Any good portfolio will be composed of multiple projects, each of which may demonstrate 1-2 of the above points. This is the first post in a series that will cover how to make a well-rounded data science portfolio. In this post, we’ll cover how to make your first project for a data science portfolio, and how to tell an effective story using data. At the end, you’ll have a project that will help demonstrate your ability to communicate, and your ability to reason about data.

### Storytelling with data

Data science is fundamentally about communication. You’ll discover some insight in the data, then figure out an effective way to communicate that insight to others, then sell them on the course of action you propose. One of the most critical skills in data science is being able to tell an effective story using data. An effective story can make your insights much more compelling, and help others understand your ideas.

A story in the data science context is a narrative around what you found, how you found it, and what it means. An example might be the discovery that your company’s revenue has dropped 20% in the last year. It’s not enough to just state that fact – you’ll have to communicate why revenue dropped, and how to potentially fix it.

The main components of storytelling with data are:

*   Understanding and setting the context
*   Exploring multiple angles
*   Using compelling visualizations
*   Using varied data sources
*   Having a consistent narrative

The best tool to effectively tell a story with data is [Jupyter notebook][34]. If you’re unfamiliar, [here’s][33] a good tutorial. Jupyter notebook allows you to interactively explore data, then share your results on various sites, including Github. Sharing your results is helpful both for collaboration, and so others can extend your analysis.

We’ll use Jupyter notebook, along with Python libraries like Pandas and matplotlib in this post.

### Choosing a topic for your data science project

The first step in creating a project is to decide on your topic. You want the topic to be something you’re interested in, and are motivated to explore. It’s very obvious when people are making projects just to make them, and when people are making projects because they’re genuinely interested in exploring the data. It’s worth spending extra time on this step, so ensure that you find something you’re actually interested in.

A good way to find a topic is to browse different datasets and seeing what looks interesting. Here are some good sites to start with:

*   [Data.gov][20] – contains government data.
*   [/r/datasets][19] – a subreddit that has hundreds of interesting datasets.
*   [Awesome datasets][18] – a list of datasets, hosted on Github.
*   [rs.io][17] – a great blog post with hundreds of interesting datasets.

In real-world data science, you often won’t find a nice single dataset that you can browse. You might have to aggregate disparate data sources, or do a good amount of data cleaning. If a topic is very interesting to you, it’s worth doing the same here, so you can show off your skills better.

For the purposes of this post, we’ll be using data about New York city public schools, which can be found [here][32].

### Pick a topic

It’s important to be able to take the project from start to finish. In order to do this, it can be helpful to restrict the scope of the project, and make it something we know we can finish. It’s easier to add to a finished project than to complete a project that you just can’t seem to ever get enough motivation to finish.

In this case, we’ll look at the [SAT scores][31] of high schoolers, along with various demographic and other information about them. The SAT, or Scholastic Aptitude Test, is a test that high schoolers take in the US before applying to college. Colleges take the test scores into account when making admissions decisions, so it’s fairly important to do well on. The test is divided into 3 sections, each of which is scored out of 800 points. The total score is out of 2400 (although this has changed back and forth a few times, the scores in this dataset are out of 2400). High schools are often ranked by their average SAT scores, and high SAT scores are considered a sign of how good a school district is.

There have been allegations about the SAT being unfair to certain racial groups in the US, so doing this analysis on New York City data will help shed some light on the fairness of the SAT.

We have a dataset of SAT scores [here][30], and a dataset that contains information on each high school [here][29]. These will form the base of our project, but we’ll need to add more information to create compelling analysis.

### Supplementing the data

Once you have a good topic, it’s good to scope out other datasets that can enhance the topic or give you more depth to explore. It’s good to do this upfront, so you have as much data as possible to explore as you’re building your project. Having too little data might mean that you give up on your project too early.

In this case, there are several related datasets on the same website that cover demographic information and test scores.

Here are the links to all of the datasets we’ll be using:

*   [SAT scores by school][16] – SAT scores for each high school in New York City.
*   [School attendance][15] – attendance information on every school in NYC.
*   [Math test results][14] – math test results for every school in NYC.
*   [Class size][13] – class size information for each school in NYC.
*   [AP test results][12] – Advanced Placement exam results for each high school. Passing AP exams can get you college credit in the US.
*   [Graduation outcomes][11] – percentage of students who graduated, and other outcome information.
*   [Demographics][10] – demographic information for each school.
*   [School survey][9] – surveys of parents, teachers, and students at each school.
*   [School district maps][8] – contains information on the layout of the school districts, so that we can map them out.

All of these datasets are interrelated, and we’ll be able to combine them before we do any analysis.

### Getting background information

Before diving into analyzing the data, it’s useful to research some background information. In this case, we know a few facts that will be useful:

*   New York City is divided into `5` boroughs, which are essentially distinct regions.
*   Schools in New York City are divided into several school district, each of which can contains dozens of schools.
*   Not all the schools in all of the datasets are high schools, so we’ll need to do some data cleaning.
*   Each school in New York City has a unique code called a `DBN`, or District Borough Number.
*   By aggregating data by district, we can use the district mapping data to plot district-by-district differences.

### Understanding the data

In order to really understand the context of the data, you’ll want to spend time exploring and reading about the data. In this case, each link above has a description of the data, along with the relevant columns. It looks like we have data on the SAT scores of high schoolers, along with other datasets that contain demographic and other information.

We can run some code to read in the data. We’ll be using [Jupyter notebook][28] to explore the data. The below code will:

*   Loop through each data file we downloaded.
*   Read the file into a [Pandas DataFrame][7].
*   Put each DataFrame into a Python dictionary.

In [100]:
```
import pandas
import numpy as np

files = ["ap_2010.csv", "class_size.csv", "demographics.csv", "graduation.csv", "hs_directory.csv", "math_test_results.csv", "sat_results.csv"]

data = {}
for f in files:
    d = pandas.read_csv("schools/{0}".format(f))
    data[f.replace(".csv", "")] = d

```

Once we’ve read the data in, we can use the [head][27] method on DataFrames to print the first `5` lines of each DataFrame:

In [103]:
```
for k,v in data.items():
    print("\n" + k + "\n")
    print(v.head())

```

```
math_test_results

      DBN Grade  Year      Category  Number Tested Mean Scale Score Level 1 #  \
0  01M015     3  2006  All Students             39              667         2
1  01M015     3  2007  All Students             31              672         2
2  01M015     3  2008  All Students             37              668         0
3  01M015     3  2009  All Students             33              668         0
4  01M015     3  2010  All Students             26              677         6

  Level 1 % Level 2 # Level 2 % Level 3 # Level 3 % Level 4 # Level 4 %  \
0      5.1%        11     28.2%        20     51.3%         6     15.4%
1      6.5%         3      9.7%        22       71%         4     12.9%
2        0%         6     16.2%        29     78.4%         2      5.4%
3        0%         4     12.1%        28     84.8%         1        3%
4     23.1%        12     46.2%         6     23.1%         2      7.7%

  Level 3+4 # Level 3+4 %
0          26       66.7%
1          26       83.9%
2          31       83.8%
3          29       87.9%
4           8       30.8%

ap_2010

      DBN                             SchoolName AP Test Takers   \
0  01M448           UNIVERSITY NEIGHBORHOOD H.S.              39
1  01M450                 EAST SIDE COMMUNITY HS              19
2  01M515                    LOWER EASTSIDE PREP              24
3  01M539         NEW EXPLORATIONS SCI,TECH,MATH             255
4  02M296  High School of Hospitality Management               s

  Total Exams Taken Number of Exams with scores 3 4 or 5
0                49                                   10
1                21                                    s
2                26                                   24
3               377                                  191
4                 s                                    s

sat_results

      DBN                                    SCHOOL NAME  \
0  01M292  HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES
1  01M448            UNIVERSITY NEIGHBORHOOD HIGH SCHOOL
2  01M450                     EAST SIDE COMMUNITY SCHOOL
3  01M458                      FORSYTH SATELLITE ACADEMY
4  01M509                        MARTA VALLE HIGH SCHOOL

  Num of SAT Test Takers SAT Critical Reading Avg. Score SAT Math Avg. Score  \
0                     29                             355                 404
1                     91                             383                 423
2                     70                             377                 402
3                      7                             414                 401
4                     44                             390                 433

  SAT Writing Avg. Score
0                    363
1                    366
2                    370
3                    359
4                    384

class_size

   CSD BOROUGH SCHOOL CODE                SCHOOL NAME GRADE  PROGRAM TYPE  \
0    1       M        M015  P.S. 015 Roberto Clemente     0K       GEN ED
1    1       M        M015  P.S. 015 Roberto Clemente     0K          CTT
2    1       M        M015  P.S. 015 Roberto Clemente     01       GEN ED
3    1       M        M015  P.S. 015 Roberto Clemente     01          CTT
4    1       M        M015  P.S. 015 Roberto Clemente     02       GEN ED

  CORE SUBJECT (MS CORE and 9-12 ONLY) CORE COURSE (MS CORE and 9-12 ONLY)  \
0                                    -                                   -
1                                    -                                   -
2                                    -                                   -
3                                    -                                   -
4                                    -                                   -

  SERVICE CATEGORY(K-9* ONLY)  NUMBER OF STUDENTS / SEATS FILLED  \
0                           -                               19.0
1                           -                               21.0
2                           -                               17.0
3                           -                               17.0
4                           -                               15.0

   NUMBER OF SECTIONS  AVERAGE CLASS SIZE  SIZE OF SMALLEST CLASS  \
0                 1.0                19.0                    19.0
1                 1.0                21.0                    21.0
2                 1.0                17.0                    17.0
3                 1.0                17.0                    17.0
4                 1.0                15.0                    15.0

   SIZE OF LARGEST CLASS DATA SOURCE  SCHOOLWIDE PUPIL-TEACHER RATIO
0                   19.0         ATS                             NaN
1                   21.0         ATS                             NaN
2                   17.0         ATS                             NaN
3                   17.0         ATS                             NaN
4                   15.0         ATS                             NaN

demographics

      DBN                       Name  schoolyear fl_percent  frl_percent  \
0  01M015  P.S. 015 ROBERTO CLEMENTE    20052006       89.4          NaN
1  01M015  P.S. 015 ROBERTO CLEMENTE    20062007       89.4          NaN
2  01M015  P.S. 015 ROBERTO CLEMENTE    20072008       89.4          NaN
3  01M015  P.S. 015 ROBERTO CLEMENTE    20082009       89.4          NaN
4  01M015  P.S. 015 ROBERTO CLEMENTE    20092010                    96.5

   total_enrollment prek   k grade1 grade2    ...     black_num black_per  \
0               281   15  36     40     33    ...            74      26.3
1               243   15  29     39     38    ...            68      28.0
2               261   18  43     39     36    ...            77      29.5
3               252   17  37     44     32    ...            75      29.8
4               208   16  40     28     32    ...            67      32.2

  hispanic_num hispanic_per white_num white_per male_num male_per female_num  \
0          189         67.3         5       1.8    158.0     56.2      123.0
1          153         63.0         4       1.6    140.0     57.6      103.0
2          157         60.2         7       2.7    143.0     54.8      118.0
3          149         59.1         7       2.8    149.0     59.1      103.0
4          118         56.7         6       2.9    124.0     59.6       84.0

  female_per
0       43.8
1       42.4
2       45.2
3       40.9
4       40.4

[5 rows x 38 columns]

graduation

    Demographic     DBN                            School Name    Cohort  \
0  Total Cohort  01M292  HENRY STREET SCHOOL FOR INTERNATIONAL      2003
1  Total Cohort  01M292  HENRY STREET SCHOOL FOR INTERNATIONAL      2004
2  Total Cohort  01M292  HENRY STREET SCHOOL FOR INTERNATIONAL      2005
3  Total Cohort  01M292  HENRY STREET SCHOOL FOR INTERNATIONAL      2006
4  Total Cohort  01M292  HENRY STREET SCHOOL FOR INTERNATIONAL  2006 Aug

   Total Cohort Total Grads - n Total Grads - % of cohort Total Regents - n  \
0             5               s                         s                 s
1            55              37                     67.3%                17
2            64              43                     67.2%                27
3            78              43                     55.1%                36
4            78              44                     56.4%                37

  Total Regents - % of cohort Total Regents - % of grads  \
0                           s                          s
1                       30.9%                      45.9%
2                       42.2%                      62.8%
3                       46.2%                      83.7%
4                       47.4%                      84.1%

             ...            Regents w/o Advanced - n  \
0            ...                                   s
1            ...                                  17
2            ...                                  27
3            ...                                  36
4            ...                                  37

  Regents w/o Advanced - % of cohort Regents w/o Advanced - % of grads  \
0                                  s                                 s
1                              30.9%                             45.9%
2                              42.2%                             62.8%
3                              46.2%                             83.7%
4                              47.4%                             84.1%

  Local - n Local - % of cohort   Local - % of grads Still Enrolled - n  \
0         s                   s                    s                  s
1        20               36.4%                54.1%                 15
2        16                 25%  37.200000000000003%                  9
3         7                  9%                16.3%                 16
4         7                  9%                15.9%                 15

  Still Enrolled - % of cohort Dropped Out - n Dropped Out - % of cohort
0                            s               s                         s
1                        27.3%               3                      5.5%
2                        14.1%               9                     14.1%
3                        20.5%              11                     14.1%
4                        19.2%              11                     14.1%

[5 rows x 23 columns]

hs_directory

      dbn                                        school_name       boro  \
0  17K548                Brooklyn School for Music & Theatre   Brooklyn
1  09X543                   High School for Violin and Dance      Bronx
2  09X327        Comprehensive Model School Project M.S. 327      Bronx
3  02M280     Manhattan Early College School for Advertising  Manhattan
4  28Q680  Queens Gateway to Health Sciences Secondary Sc...     Queens

  building_code    phone_number    fax_number grade_span_min  grade_span_max  \
0          K440    718-230-6250  718-230-6262              9              12
1          X400    718-842-0687  718-589-9849              9              12
2          X240    718-294-8111  718-294-8109              6              12
3          M520  718-935-3477             NaN              9              10
4          Q695    718-969-3155  718-969-3552              6              12

  expgrade_span_min  expgrade_span_max  \
0               NaN                NaN
1               NaN                NaN
2               NaN                NaN
3                 9               14.0
4               NaN                NaN

                         ...                          \
0                        ...
1                        ...
2                        ...
3                        ...
4                        ...

                                          priority02  \
0                    Then to New York City residents
1  Then to New York City residents who attend an ...
2  Then to Bronx students or residents who attend...
3  Then to New York City residents who attend an ...
4  Then to Districts 28 and 29 students or residents

                                          priority03  \
0                                                NaN
1                Then to Bronx students or residents
2  Then to New York City residents who attend an ...
3          Then to Manhattan students or residents
4               Then to Queens students or residents

                            priority04                       priority05  \
0                                  NaN                              NaN
1      Then to New York City residents                              NaN
2  Then to Bronx students or residents  Then to New York City residents
3      Then to New York City residents                              NaN
4      Then to New York City residents                              NaN

  priority06  priority07 priority08  priority09 priority10  \
0        NaN         NaN        NaN         NaN        NaN
1        NaN         NaN        NaN         NaN        NaN
2        NaN         NaN        NaN         NaN        NaN
3        NaN         NaN        NaN         NaN        NaN
4        NaN         NaN        NaN         NaN        NaN

                                          Location 1
0  883 Classon Avenue\nBrooklyn, NY 11225\n(40.67...
1  1110 Boston Road\nBronx, NY 10456\n(40.8276026...
2  1501 Jerome Avenue\nBronx, NY 10452\n(40.84241...
3  411 Pearl Street\nNew York, NY 10038\n(40.7106...
4  160-20 Goethals Avenue\nJamaica, NY 11432\n(40...

[5 rows x 58 columns]

```

We can start to see some useful patterns in the datasets:

*   Most of the datasets contain a `DBN` column
*   Some fields look interesting for mapping, particularly `Location 1`, which contains coordinates inside a larger string.
*   Some of the datasets appear to contain multiple rows for each school (repeated DBN values), which means we’ll have to do some preprocessing.

### Unifying the data

In order to work with the data more easily, we’ll need to unify all the individual datasets into a single one. This will enable us to quickly compare columns across datasets. In order to do this, we’ll first need to find a common column to unify them on. Looking at the output above, it appears that `DBN` might be that common column, as it appears in multiple datasets.

If we google `DBN New York City Schools`, we end up [here][26], which explains that the `DBN` is a unique code for each school. When exploring datasets, particularly government ones, it’s often necessary to do some detective work to figure out what each column means, or even what each dataset is.

The problem now is that two of the datasets, `class_size`, and `hs_directory`, don’t have a `DBN` field. In the `hs_directory` data, it’s just named `dbn`, so we can just rename the column, or copy it over into a new column called `DBN`. In the `class_size` data, we’ll need to try a different approach.

The `DBN` column looks like this:

In [5]:
```
data["demographics"]["DBN"].head()

```

Out[5]:
```
0    01M015
1    01M015
2    01M015
3    01M015
4    01M015
Name: DBN, dtype: object
```

If we look at the `class_size` data, here’s what we’d see in the first `5` rows:

In [4]:
```
data["class_size"].head()

```

Out[4]:

|      | CSD  | BOROUGH | SCHOOL CODE | SCHOOL NAME               | GRADE | PROGRAM TYPE | CORE SUBJECT (MS CORE and 9-12 ONLY) | CORE COURSE (MS CORE and 9-12 ONLY) | SERVICE CATEGORY(K-9* ONLY) | NUMBER OF STUDENTS / SEATS FILLED | NUMBER OF SECTIONS | AVERAGE CLASS SIZE | SIZE OF SMALLEST CLASS | SIZE OF LARGEST CLASS | DATA SOURCE | SCHOOLWIDE PUPIL-TEACHER RATIO |
| ---- | ---- | ------- | ----------- | ------------------------- | ----- | ------------ | ------------------------------------ | ----------------------------------- | --------------------------- | --------------------------------- | ------------------ | ------------------ | ---------------------- | --------------------- | ----------- | ------------------------------ |
| 0    | 1    | M       | M015        | P.S. 015 Roberto Clemente | 0K    | GEN ED       | -                                    | -                                   | -                           | 19.0                              | 1.0                | 19.0               | 19.0                   | 19.0                  | ATS         | NaN                            |
| 1    | 1    | M       | M015        | P.S. 015 Roberto Clemente | 0K    | CTT          | -                                    | -                                   | -                           | 21.0                              | 1.0                | 21.0               | 21.0                   | 21.0                  | ATS         | NaN                            |
| 2    | 1    | M       | M015        | P.S. 015 Roberto Clemente | 01    | GEN ED       | -                                    | -                                   | -                           | 17.0                              | 1.0                | 17.0               | 17.0                   | 17.0                  | ATS         | NaN                            |
| 3    | 1    | M       | M015        | P.S. 015 Roberto Clemente | 01    | CTT          | -                                    | -                                   | -                           | 17.0                              | 1.0                | 17.0               | 17.0                   | 17.0                  | ATS         | NaN                            |
| 4    | 1    | M       | M015        | P.S. 015 Roberto Clemente | 02    | GEN ED       | -                                    | -                                   | -                           | 15.0                              | 1.0                | 15.0               | 15.0                   | 15.0                  | ATS         | NaN                            |

As you can see above, it looks like the `DBN` is actually a combination of `CSD`, `BOROUGH`, and `SCHOOL CODE`. For those unfamiliar with New York City, it is composed of `5` boroughs. Each borough is an organizational unit, and is about the same size as a fairly large US City.`DBN` stands for `District Borough Number`. It looks like `CSD` is the District, `BOROUGH` is the borough, and when combined with the `SCHOOL CODE`, forms the `DBN`. There’s no systematized way to find insights like this in data, and it requires some exploration and playing around to figure out.

Now that we know how to construct the `DBN`, we can add it into the `class_size` and `hs_directory` datasets:

In [ ]:
```
data["class_size"]["DBN"] = data["class_size"].apply(lambda x: "{0:02d}{1}".format(x["CSD"], x["SCHOOL CODE"]), axis=1)
data["hs_directory"]["DBN"] = data["hs_directory"]["dbn"]

```

### Adding in the surveys

One of the most potentially interesting datasets to look at is the dataset on student, parent, and teacher surveys about the quality of schools. These surveys include information about the perceived safety of each school, academic standards, and more. Before we combine our datasets, let’s add in the survey data. In real-world data science projects, you’ll often come across interesting data when you’re midway through your analysis, and will want to incorporate it. Working with a flexible tool like Jupyter notebook will allow you to quickly add some additional code, and re-run your analysis.

In this case, we’ll add the survey data into our `data` dictionary, and then combine all the datasets afterwards. The survey data consists of `2` files, one for all schools, and one for school district `75`. We’ll need to write some code to combine them. In the below code, we’ll:

*   Read in the surveys for all schools using the `windows-1252` file encoding.
*   Read in the surveys for district 75 schools using the `windows-1252` file encoding.
*   Add a flag that indicates which school district each dataset is for.
*   Combine the datasets into one using the [concat][6] method on DataFrames.

In [66]:
```
survey1 = pandas.read_csv("schools/survey_all.txt", delimiter="\t", encoding='windows-1252')
survey2 = pandas.read_csv("schools/survey_d75.txt", delimiter="\t", encoding='windows-1252')
survey1["d75"] = False
survey2["d75"] = True
survey = pandas.concat([survey1, survey2], axis=0)

```

Once we have the surveys combined, there’s an additional complication. We want to minimize the number of columns in our combined dataset so we can easily compare columns and figure out correlations. Unfortunately, the survey data has many columns that aren’t very useful to us:

In [16]:
```
survey.head()

```
Out[16]:

|      | N_p   | N_s   | N_t  | aca_p_11 | aca_s_11 | aca_t_11 | aca_tot_11 | bn   | com_p_11 | com_s_11 | ...  | t_q8c_1 | t_q8c_2 | t_q8c_3 | t_q8c_4 | t_q9 | t_q9_1 | t_q9_2 | t_q9_3 | t_q9_4 | t_q9_5 |
| ---- | ----- | ----- | ---- | -------- | -------- | -------- | ---------- | ---- | -------- | -------- | ---- | ------- | ------- | ------- | ------- | ---- | ------ | ------ | ------ | ------ | ------ |
| 0    | 90.0  | NaN   | 22.0 | 7.8      | NaN      | 7.9      | 7.9        | M015 | 7.6      | NaN      | ...  | 29.0    | 67.0    | 5.0     | 0.0     | NaN  | 5.0    | 14.0   | 52.0   | 24.0   | 5.0    |
| 1    | 161.0 | NaN   | 34.0 | 7.8      | NaN      | 9.1      | 8.4        | M019 | 7.6      | NaN      | ...  | 74.0    | 21.0    | 6.0     | 0.0     | NaN  | 3.0    | 6.0    | 3.0    | 78.0   | 9.0    |
| 2    | 367.0 | NaN   | 42.0 | 8.6      | NaN      | 7.5      | 8.0        | M020 | 8.3      | NaN      | ...  | 33.0    | 35.0    | 20.0    | 13.0    | NaN  | 3.0    | 5.0    | 16.0   | 70.0   | 5.0    |
| 3    | 151.0 | 145.0 | 29.0 | 8.5      | 7.4      | 7.8      | 7.9        | M034 | 8.2      | 5.9      | ...  | 21.0    | 45.0    | 28.0    | 7.0     | NaN  | 0.0    | 18.0   | 32.0   | 39.0   | 11.0   |
| 4    | 90.0  | NaN   | 23.0 | 7.9      | NaN      | 8.1      | 8.0        | M063 | 7.9      | NaN      | ...  | 59.0    | 36.0    | 5.0     | 0.0     | NaN  | 10.0   | 5.0    | 10.0   | 60.0   | 15.0   |

5 rows × 2773 columns

We can resolve this issue by looking at the data dictionary file that we downloaded along with the survey data. The file tells us the important fields in the data:

![](https://www.dataquest.io/blog/images/misc/xj5ud4r.png)

We can then remove any extraneous columns in `survey`:

In [17]:
```
survey["DBN"] = survey["dbn"]
survey_fields = ["DBN", "rr_s", "rr_t", "rr_p", "N_s", "N_t", "N_p", "saf_p_11", "com_p_11", "eng_p_11", "aca_p_11", "saf_t_11", "com_t_11", "eng_t_10", "aca_t_11", "saf_s_11", "com_s_11", "eng_s_11", "aca_s_11", "saf_tot_11", "com_tot_11", "eng_tot_11", "aca_tot_11",]
survey = survey.loc[:,survey_fields]
data["survey"] = survey
survey.shape

```

Out[17]:
```
(1702, 23)
```

Making sure you understand what each dataset contains, and what the relevant columns are can save you lots of time and effort later on.

### Condensing datasets

If we take a look at some of the datasets, including `class_size`, we’ll immediately see a problem:

In [18]:
```
data["class_size"].head()

```

Out[18]:

|      | CSD  | BOROUGH | SCHOOL CODE | SCHOOL NAME               | GRADE | PROGRAM TYPE | CORE SUBJECT (MS CORE and 9-12 ONLY) | CORE COURSE (MS CORE and 9-12 ONLY) | SERVICE CATEGORY(K-9* ONLY) | NUMBER OF STUDENTS / SEATS FILLED | NUMBER OF SECTIONS | AVERAGE CLASS SIZE | SIZE OF SMALLEST CLASS | SIZE OF LARGEST CLASS | DATA SOURCE | SCHOOLWIDE PUPIL-TEACHER RATIO | DBN    |
| ---- | ---- | ------- | ----------- | ------------------------- | ----- | ------------ | ------------------------------------ | ----------------------------------- | --------------------------- | --------------------------------- | ------------------ | ------------------ | ---------------------- | --------------------- | ----------- | ------------------------------ | ------ |
| 0    | 1    | M       | M015        | P.S. 015 Roberto Clemente | 0K    | GEN ED       | -                                    | -                                   | -                           | 19.0                              | 1.0                | 19.0               | 19.0                   | 19.0                  | ATS         | NaN                            | 01M015 |
| 1    | 1    | M       | M015        | P.S. 015 Roberto Clemente | 0K    | CTT          | -                                    | -                                   | -                           | 21.0                              | 1.0                | 21.0               | 21.0                   | 21.0                  | ATS         | NaN                            | 01M015 |
| 2    | 1    | M       | M015        | P.S. 015 Roberto Clemente | 01    | GEN ED       | -                                    | -                                   | -                           | 17.0                              | 1.0                | 17.0               | 17.0                   | 17.0                  | ATS         | NaN                            | 01M015 |
| 3    | 1    | M       | M015        | P.S. 015 Roberto Clemente | 01    | CTT          | -                                    | -                                   | -                           | 17.0                              | 1.0                | 17.0               | 17.0                   | 17.0                  | ATS         | NaN                            | 01M015 |
| 4    | 1    | M       | M015        | P.S. 015 Roberto Clemente | 02    | GEN ED       | -                                    | -                                   | -                           | 15.0                              | 1.0                | 15.0               | 15.0                   | 15.0                  | ATS         | NaN                            | 01M015 |

There are several rows for each high school (as you can see by the repeated `DBN` and `SCHOOL NAME` fields). However, if we take a look at the `sat_results` dataset, it only has one row per high school:

In [21]:
```
data["sat_results"].head()

```

Out[21]:

|      | DBN    | SCHOOL NAME                              | Num of SAT Test Takers | SAT Critical Reading Avg. Score | SAT Math Avg. Score | SAT Writing Avg. Score |
| ---- | ------ | ---------------------------------------- | ---------------------- | ------------------------------- | ------------------- | ---------------------- |
| 0    | 01M292 | HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES | 29                     | 355                             | 404                 | 363                    |
| 1    | 01M448 | UNIVERSITY NEIGHBORHOOD HIGH SCHOOL      | 91                     | 383                             | 423                 | 366                    |
| 2    | 01M450 | EAST SIDE COMMUNITY SCHOOL               | 70                     | 377                             | 402                 | 370                    |
| 3    | 01M458 | FORSYTH SATELLITE ACADEMY                | 7                      | 414                             | 401                 | 359                    |
| 4    | 01M509 | MARTA VALLE HIGH SCHOOL                  | 44                     | 390                             | 433                 | 384                    |

In order to combine these datasets, we’ll need to find a way to condense datasets like `class_size` to the point where there’s only a single row per high school. If not, there won’t be a way to compare SAT scores to class size. We can accomplish this by first understanding the data better, then by doing some aggregation. With the `class_size`dataset, it looks like `GRADE` and `PROGRAM TYPE` have multiple values for each school. By restricting each field to a single value, we can filter most of the duplicate rows. In the below code, we:

*   Only select values from `class_size` where the `GRADE` field is `09-12`.
*   Only select values from `class_size` where the `PROGRAM TYPE` field is `GEN ED`.
*   Group the `class_size` dataset by `DBN`, and take the average of each column. Essentially, we’ll find the average `class_size` values for each school.
*   Reset the index, so `DBN` is added back in as a column.

In [68]:
```
class_size = data["class_size"]
class_size = class_size[class_size["GRADE "] == "09-12"]
class_size = class_size[class_size["PROGRAM TYPE"] == "GEN ED"]
class_size = class_size.groupby("DBN").agg(np.mean)
class_size.reset_index(inplace=True)
data["class_size"] = class_size

```

### Condensing other datasets

Next, we’ll need to condense the `demographics` dataset. The data was collected for multiple years for the same schools, so there are duplicate rows for each school. We’ll only pick rows where the `schoolyear` field is the most recent available:

In [69]:
```
demographics = data["demographics"]
demographics = demographics[demographics["schoolyear"] == 20112012]
data["demographics"] = demographics

```

We’ll need to condense the `math_test_results` dataset. This dataset is segmented by `Grade`and by `Year`. We can select only a single grade from a single year:

In [70]:
```
data["math_test_results"] = data["math_test_results"][data["math_test_results"]["Year"] == 2011]
data["math_test_results"] = data["math_test_results"][data["math_test_results"]["Grade"] == '8']

```

Finally, `graduation` needs to be condensed:

In [71]:
```
data["graduation"] = data["graduation"][data["graduation"]["Cohort"] == "2006"]
data["graduation"] = data["graduation"][data["graduation"]["Demographic"] == "Total Cohort"]

```

Data cleaning and exploration is critical before working on the meat of the project. Having a good, consistent dataset will help you do your analysis more quickly.

### Computing variables

Computing variables can help speed up our analysis by enabling us to make comparisons more quickly, and enable us to make comparisons that we otherwise wouldn’t be able to do. The first thing we can do is compute a total SAT score from the individual columns `SAT Math Avg. Score`, `SAT Critical Reading Avg. Score`, and `SAT Writing Avg. Score`. In the below code, we:

*   Convert each of the SAT score columns from a string to a number.
*   Add together all of the columns to get the `sat_score` column, which is the total SAT score.

In [72]:
```
cols = ['SAT Math Avg. Score', 'SAT Critical Reading Avg. Score', 'SAT Writing Avg. Score']
for c in cols:
    data["sat_results"][c] = data["sat_results"][c].convert_objects(convert_numeric=True)

data['sat_results']['sat_score'] = data['sat_results'][cols[0]] + data['sat_results'][cols[1]] + data['sat_results'][cols[2]]

```

Next, we’ll need to parse out the coordinate locations of each school, so we can make maps. This will enable us to plot the location of each school. In the below code, we:

*   Parse latitude and longitude columns from the `Location 1` column.
*   Convert `lat` and `lon` to be numeric.

In [73]:
```
data["hs_directory"]['lat'] = data["hs_directory"]['Location 1'].apply(lambda x: x.split("\n")[-1].replace("(", "").replace(")", "").split(", ")[0])
data["hs_directory"]['lon'] = data["hs_directory"]['Location 1'].apply(lambda x: x.split("\n")[-1].replace("(", "").replace(")", "").split(", ")[1])

for c in ['lat', 'lon']:
    data["hs_directory"][c] = data["hs_directory"][c].convert_objects(convert_numeric=True)

```

Now, we can print out each dataset to see what we have:

In [74]:
```
for k,v in data.items():
    print(k)
    print(v.head())

```
```
math_test_results
        DBN Grade  Year      Category  Number Tested Mean Scale Score  \
111  01M034     8  2011  All Students             48              646
280  01M140     8  2011  All Students             61              665
346  01M184     8  2011  All Students             49              727
388  01M188     8  2011  All Students             49              658
411  01M292     8  2011  All Students             49              650

    Level 1 # Level 1 % Level 2 # Level 2 % Level 3 # Level 3 % Level 4 #  \
111        15     31.3%        22     45.8%        11     22.9%         0
280         1      1.6%        43     70.5%        17     27.9%         0
346         0        0%         0        0%         5     10.2%        44
388        10     20.4%        26     53.1%        10     20.4%         3
411        15     30.6%        25       51%         7     14.3%         2

    Level 4 % Level 3+4 # Level 3+4 %
111        0%          11       22.9%
280        0%          17       27.9%
346     89.8%          49        100%
388      6.1%          13       26.5%
411      4.1%           9       18.4%
survey
      DBN  rr_s  rr_t  rr_p    N_s   N_t    N_p  saf_p_11  com_p_11  eng_p_11  \
0  01M015   NaN    88    60    NaN  22.0   90.0       8.5       7.6       7.5
1  01M019   NaN   100    60    NaN  34.0  161.0       8.4       7.6       7.6
2  01M020   NaN    88    73    NaN  42.0  367.0       8.9       8.3       8.3
3  01M034  89.0    73    50  145.0  29.0  151.0       8.8       8.2       8.0
4  01M063   NaN   100    60    NaN  23.0   90.0       8.7       7.9       8.1

      ...      eng_t_10  aca_t_11  saf_s_11  com_s_11  eng_s_11  aca_s_11  \
0     ...           NaN       7.9       NaN       NaN       NaN       NaN
1     ...           NaN       9.1       NaN       NaN       NaN       NaN
2     ...           NaN       7.5       NaN       NaN       NaN       NaN
3     ...           NaN       7.8       6.2       5.9       6.5       7.4
4     ...           NaN       8.1       NaN       NaN       NaN       NaN

   saf_tot_11  com_tot_11  eng_tot_11  aca_tot_11
0         8.0         7.7         7.5         7.9
1         8.5         8.1         8.2         8.4
2         8.2         7.3         7.5         8.0
3         7.3         6.7         7.1         7.9
4         8.5         7.6         7.9         8.0

[5 rows x 23 columns]
ap_2010
      DBN                             SchoolName AP Test Takers   \
0  01M448           UNIVERSITY NEIGHBORHOOD H.S.              39
1  01M450                 EAST SIDE COMMUNITY HS              19
2  01M515                    LOWER EASTSIDE PREP              24
3  01M539         NEW EXPLORATIONS SCI,TECH,MATH             255
4  02M296  High School of Hospitality Management               s

  Total Exams Taken Number of Exams with scores 3 4 or 5
0                49                                   10
1                21                                    s
2                26                                   24
3               377                                  191
4                 s                                    s
sat_results
      DBN                                    SCHOOL NAME  \
0  01M292  HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES
1  01M448            UNIVERSITY NEIGHBORHOOD HIGH SCHOOL
2  01M450                     EAST SIDE COMMUNITY SCHOOL
3  01M458                      FORSYTH SATELLITE ACADEMY
4  01M509                        MARTA VALLE HIGH SCHOOL

  Num of SAT Test Takers  SAT Critical Reading Avg. Score  \
0                     29                            355.0
1                     91                            383.0
2                     70                            377.0
3                      7                            414.0
4                     44                            390.0

   SAT Math Avg. Score  SAT Writing Avg. Score  sat_score
0                404.0                   363.0     1122.0
1                423.0                   366.0     1172.0
2                402.0                   370.0     1149.0
3                401.0                   359.0     1174.0
4                433.0                   384.0     1207.0
class_size
      DBN  CSD  NUMBER OF STUDENTS / SEATS FILLED  NUMBER OF SECTIONS  \
0  01M292    1                            88.0000            4.000000
1  01M332    1                            46.0000            2.000000
2  01M378    1                            33.0000            1.000000
3  01M448    1                           105.6875            4.750000
4  01M450    1                            57.6000            2.733333

   AVERAGE CLASS SIZE  SIZE OF SMALLEST CLASS  SIZE OF LARGEST CLASS  \
0           22.564286                   18.50              26.571429
1           22.000000                   21.00              23.500000
2           33.000000                   33.00              33.000000
3           22.231250                   18.25              27.062500
4           21.200000                   19.40              22.866667

   SCHOOLWIDE PUPIL-TEACHER RATIO
0                             NaN
1                             NaN
2                             NaN
3                             NaN
4                             NaN
demographics
       DBN                                              Name  schoolyear  \
6   01M015  P.S. 015 ROBERTO CLEMENTE                           20112012
13  01M019  P.S. 019 ASHER LEVY                                 20112012
20  01M020  PS 020 ANNA SILVER                                  20112012
27  01M034  PS 034 FRANKLIN D ROOSEVELT                         20112012
35  01M063  PS 063 WILLIAM MCKINLEY                             20112012

   fl_percent  frl_percent  total_enrollment prek    k grade1 grade2  \
6         NaN         89.4               189   13   31     35     28
13        NaN         61.5               328   32   46     52     54
20        NaN         92.5               626   52  102    121     87
27        NaN         99.7               401   14   34     38     36
35        NaN         78.9               176   18   20     30     21

      ...     black_num black_per hispanic_num hispanic_per white_num  \
6     ...            63      33.3          109         57.7         4
13    ...            81      24.7          158         48.2        28
20    ...            55       8.8          357         57.0        16
27    ...            90      22.4          275         68.6         8
35    ...            41      23.3          110         62.5        15

   white_per male_num male_per female_num female_per
6        2.1     97.0     51.3       92.0       48.7
13       8.5    147.0     44.8      181.0       55.2
20       2.6    330.0     52.7      296.0       47.3
27       2.0    204.0     50.9      197.0       49.1
35       8.5     97.0     55.1       79.0       44.9

[5 rows x 38 columns]
graduation
     Demographic     DBN                            School Name Cohort  \
3   Total Cohort  01M292  HENRY STREET SCHOOL FOR INTERNATIONAL   2006
10  Total Cohort  01M448    UNIVERSITY NEIGHBORHOOD HIGH SCHOOL   2006
17  Total Cohort  01M450             EAST SIDE COMMUNITY SCHOOL   2006
24  Total Cohort  01M509                MARTA VALLE HIGH SCHOOL   2006
31  Total Cohort  01M515  LOWER EAST SIDE PREPARATORY HIGH SCHO   2006

    Total Cohort Total Grads - n Total Grads - % of cohort Total Regents - n  \
3             78              43                     55.1%                36
10           124              53                     42.7%                42
17            90              70                     77.8%                67
24            84              47                       56%                40
31           193             105                     54.4%                91

   Total Regents - % of cohort Total Regents - % of grads  \
3                        46.2%                      83.7%
10                       33.9%                      79.2%
17         74.400000000000006%                      95.7%
24                       47.6%                      85.1%
31                       47.2%                      86.7%

              ...            Regents w/o Advanced - n  \
3             ...                                  36
10            ...                                  34
17            ...                                  67
24            ...                                  23
31            ...                                  22

   Regents w/o Advanced - % of cohort Regents w/o Advanced - % of grads  \
3                               46.2%                             83.7%
10                              27.4%                             64.2%
17                74.400000000000006%                             95.7%
24                              27.4%                             48.9%
31                              11.4%                               21%

   Local - n Local - % of cohort Local - % of grads Still Enrolled - n  \
3          7                  9%              16.3%                 16
10        11                8.9%              20.8%                 46
17         3                3.3%               4.3%                 15
24         7  8.300000000000001%              14.9%                 25
31        14                7.3%              13.3%                 53

   Still Enrolled - % of cohort Dropped Out - n Dropped Out - % of cohort
3                         20.5%              11                     14.1%
10                        37.1%              20       16.100000000000001%
17                        16.7%               5                      5.6%
24                        29.8%               5                        6%
31                        27.5%              35       18.100000000000001%

[5 rows x 23 columns]
hs_directory
      dbn                                        school_name       boro  \
0  17K548                Brooklyn School for Music & Theatre   Brooklyn
1  09X543                   High School for Violin and Dance      Bronx
2  09X327        Comprehensive Model School Project M.S. 327      Bronx
3  02M280     Manhattan Early College School for Advertising  Manhattan
4  28Q680  Queens Gateway to Health Sciences Secondary Sc...     Queens

  building_code    phone_number    fax_number grade_span_min  grade_span_max  \
0          K440    718-230-6250  718-230-6262              9              12
1          X400    718-842-0687  718-589-9849              9              12
2          X240    718-294-8111  718-294-8109              6              12
3          M520  718-935-3477             NaN              9              10
4          Q695    718-969-3155  718-969-3552              6              12

  expgrade_span_min  expgrade_span_max    ...      \
0               NaN                NaN    ...
1               NaN                NaN    ...
2               NaN                NaN    ...
3                 9               14.0    ...
4               NaN                NaN    ...

                        priority05 priority06 priority07 priority08  \
0                              NaN        NaN        NaN        NaN
1                              NaN        NaN        NaN        NaN
2  Then to New York City residents        NaN        NaN        NaN
3                              NaN        NaN        NaN        NaN
4                              NaN        NaN        NaN        NaN

  priority09  priority10                                         Location 1  \
0        NaN         NaN  883 Classon Avenue\nBrooklyn, NY 11225\n(40.67...
1        NaN         NaN  1110 Boston Road\nBronx, NY 10456\n(40.8276026...
2        NaN         NaN  1501 Jerome Avenue\nBronx, NY 10452\n(40.84241...
3        NaN         NaN  411 Pearl Street\nNew York, NY 10038\n(40.7106...
4        NaN         NaN  160-20 Goethals Avenue\nJamaica, NY 11432\n(40...

      DBN        lat        lon
0  17K548  40.670299 -73.961648
1  09X543  40.827603 -73.904475
2  09X327  40.842414 -73.916162
3  02M280  40.710679 -74.000807
4  28Q680  40.718810 -73.806500

[5 rows x 61 columns]

```

### Combining the datasets

Now that we’ve done all the preliminaries, we can combine the datasets together using the `DBN` column. At the end, we’ll have a dataset with hundreds of columns, from each of the original datasets. When we join them, it’s important to note that some of the datasets are missing high schools that exist in the `sat_results` dataset. To resolve this, we’ll need to merge the datasets that have missing rows using the `outer` join strategy, so we don’t lose data. In real-world data analysis, it’s common to have data be missing. Being able to demonstrate the ability to reason about and handle missing data is an important part of building a portfolio.

You can read about different types of joins [here][25].

In the below code, we’ll:

*   Loop through each of the items in the `data` dictionary.
*   Print the number of non-unique DBNs in the item.
*   Decide on a join strategy – `inner` or `outer`.
*   Join the item to the DataFrame `full` using the column `DBN`.

In [75]:
```
flat_data_names = [k for k,v in data.items()]
flat_data = [data[k] for k in flat_data_names]
full = flat_data[0]
for i, f in enumerate(flat_data[1:]):
    name = flat_data_names[i+1]
    print(name)
    print(len(f["DBN"]) - len(f["DBN"].unique()))
    join_type = "inner"
    if name in ["sat_results", "ap_2010", "graduation"]:
        join_type = "outer"
    if name not in ["math_test_results"]:
        full = full.merge(f, on="DBN", how=join_type)

full.shape

```
```
survey
0
ap_2010
1
sat_results
0
class_size
0
demographics
0
graduation
0
hs_directory
0

```

Out[75]:
```
(374, 174)
```

### Enjoying this post? Learn data science with Dataquest!

##### 

*   Learn from the comfort of your browser.
*   Work with real-life data sets.
*   Build a portfolio of projects.

[Start for Free][5]

### Adding in values

Now that we have our `full` DataFrame, we have almost all the information we’ll need to do our analysis. There are a few missing pieces, though. We may want to correlate the [Advanced Placement][24] exam results with SAT scores, but we’ll need to first convert those columns to numbers, then fill in any missing values:

In [76]:
```
cols = ['AP Test Takers ', 'Total Exams Taken', 'Number of Exams with scores 3 4 or 5']

for col in cols:
    full[col] = full[col].convert_objects(convert_numeric=True)

full[cols] = full[cols].fillna(value=0)

```

Then, we’ll need to calculate a `school_dist` column that indicates the school district of the school. This will enable us to match up school districts and plot out district-level statistics using the district maps we downloaded earlier:

In [77]:
```
full["school_dist"] = full["DBN"].apply(lambda x: x[:2])

```

Finally, we’ll need to fill in any missing values in `full` with the mean of the column, so we can compute correlations:

In [79]:
```
full = full.fillna(full.mean())

```

### Computing correlations

A good way to explore a dataset and see what columns are related to the one you care about is to compute correlations. This will tell you which columns are closely related to the column you’re interested in. We can do this via the [corr][23] method on Pandas DataFrames. The closer to `0` the correlation, the weaker the connection. The closer to `1`, the stronger the positive correlation, and the closer to `-1`, the stronger the negative correlation`:

In [80]:
```
full.corr()['sat_score']

```

Out[80]:
```
Year                                             NaN
Number Tested                           8.127817e-02
rr_s                                    8.484298e-02
rr_t                                   -6.604290e-02
rr_p                                    3.432778e-02
N_s                                     1.399443e-01
N_t                                     9.654314e-03
N_p                                     1.397405e-01
saf_p_11                                1.050653e-01
com_p_11                                2.107343e-02
eng_p_11                                5.094925e-02
aca_p_11                                5.822715e-02
saf_t_11                                1.206710e-01
com_t_11                                3.875666e-02
eng_t_10                                         NaN
aca_t_11                                5.250357e-02
saf_s_11                                1.054050e-01
com_s_11                                4.576521e-02
eng_s_11                                6.303699e-02
aca_s_11                                8.015700e-02
saf_tot_11                              1.266955e-01
com_tot_11                              4.340710e-02
eng_tot_11                              5.028588e-02
aca_tot_11                              7.229584e-02
AP Test Takers                          5.687940e-01
Total Exams Taken                       5.585421e-01
Number of Exams with scores 3 4 or 5    5.619043e-01
SAT Critical Reading Avg. Score         9.868201e-01
SAT Math Avg. Score                     9.726430e-01
SAT Writing Avg. Score                  9.877708e-01
                                            ...
SIZE OF SMALLEST CLASS                  2.440690e-01
SIZE OF LARGEST CLASS                   3.052551e-01
SCHOOLWIDE PUPIL-TEACHER RATIO                   NaN
schoolyear                                       NaN
frl_percent                            -7.018217e-01
total_enrollment                        3.668201e-01
ell_num                                -1.535745e-01
ell_percent                            -3.981643e-01
sped_num                                3.486852e-02
sped_percent                           -4.413665e-01
asian_num                               4.748801e-01
asian_per                               5.686267e-01
black_num                               2.788331e-02
black_per                              -2.827907e-01
hispanic_num                            2.568811e-02
hispanic_per                           -3.926373e-01
white_num                               4.490835e-01
white_per                               6.100860e-01
male_num                                3.245320e-01
male_per                               -1.101484e-01
female_num                              3.876979e-01
female_per                              1.101928e-01
Total Cohort                            3.244785e-01
grade_span_max                         -2.495359e-17
expgrade_span_max                                NaN
zip                                    -6.312962e-02
total_students                          4.066081e-01
number_programs                         1.166234e-01
lat                                    -1.198662e-01
lon                                    -1.315241e-01
Name: sat_score, dtype: float64
```

This gives us quite a few insights that we’ll need to explore:

*   Total enrollment correlates strongly with `sat_score`, which is surprising, because you’d think smaller schools, which focused more on the student, would have higher scores.
*   The percentage of females at a school (`female_per`) correlates positively with SAT score, whereas the percentage of males (`male_per`) correlates negatively.
*   None of the survey responses correlate highly with SAT scores.
*   There is a significant racial inequality in SAT scores (`white_per`, `asian_per`, `black_per`, `hispanic_per`).
*   `ell_percent` correlates strongly negatively with SAT scores.

Each of these items is a potential angle to explore and tell a story about using the data.

### Setting the context

Before we dive into exploring the data, we’ll want to set the context, both for ourselves, and anyone else that reads our analysis. One good way to do this is with exploratory charts or maps. In this case, we’ll map out the positions of the schools, which will help readers understand the problem we’re exploring.

In the below code, we:

*   Setup a map centered on New York City.
*   Add a marker to the map for each high school in the city.
*   Display the map.

In [82]:
```
import folium
from folium import plugins

schools_map = folium.Map(location=[full['lat'].mean(), full['lon'].mean()], zoom_start=10)
marker_cluster = folium.MarkerCluster().add_to(schools_map)
for name, row in full.iterrows():
    folium.Marker([row["lat"], row["lon"]], popup="{0}: {1}".format(row["DBN"], row["school_name"])).add_to(marker_cluster)
schools_map.create_map('schools.html')
schools_map

```

Out[82]:![](https://www.dataquest.io/blog/images/storytelling/map.png)

This map is helpful, but it’s hard to see where the most schools are in NYC. Instead, we’ll make a heatmap:

In [84]:
```
schools_heatmap = folium.Map(location=[full['lat'].mean(), full['lon'].mean()], zoom_start=10)
schools_heatmap.add_children(plugins.HeatMap([[row["lat"], row["lon"]] for name, row in full.iterrows()]))
schools_heatmap.save("heatmap.html")
schools_heatmap

```

Out[84]:![](https://www.dataquest.io/blog/images/storytelling/heatmap.png)

### District level mapping

Heatmaps are good for mapping out gradients, but we’ll want something with more structure to plot out differences in SAT score across the city. School districts are a good way to visualize this information, as each district has its own administration. New York City has several dozen school districts, and each district is a small geographic area.

We can compute SAT score by school district, then plot this out on a map. In the below code, we’ll:

*   Group `full` by school district.
*   Compute the average of each column for each school district.
*   Convert the `school_dist` field to remove leading `0`s, so we can match our geograpghic district data.

In [ ]:
```
district_data = full.groupby("school_dist").agg(np.mean)
district_data.reset_index(inplace=True)
district_data["school_dist"] = district_data["school_dist"].apply(lambda x: str(int(x)))

```

We’ll now we able to plot the average SAT score in each school district. In order to do this, we’ll read in data in [GeoJSON][22] format to get the shapes of each district, then match each district shape with the SAT score using the `school_dist` column, then finally create the plot:

In [85]:
```
def show_district_map(col):
    geo_path = 'schools/districts.geojson'
    districts = folium.Map(location=[full['lat'].mean(), full['lon'].mean()], zoom_start=10)
    districts.geo_json(
        geo_path=geo_path,
        data=district_data,
        columns=['school_dist', col],
        key_on='feature.properties.school_dist',
        fill_color='YlGn',
        fill_opacity=0.7,
        line_opacity=0.2,
    )
    districts.save("districts.html")
    return districts

show_district_map("sat_score")

```

Out[85]:![](https://www.dataquest.io/blog/images/storytelling/district_sat.png)

### Exploring enrollment and SAT scores

Now that we’ve set the context by plotting out where the schools are, and SAT score by district, people viewing our analysis have a better idea of the context behind the dataset. Now that we’ve set the stage, we can move into exploring the angles we identified earlier, when we were finding correlations. The first angle to explore is the relationship between the number of students enrolled in a school and SAT score.

We can explore this with a scatter plot that compares total enrollment across all schools to SAT scores across all schools.

In [87]:
```
%matplotlib inline

full.plot.scatter(x='total_enrollment', y='sat_score')

```

Out[87]:
```
<matplotlib.axes._subplots.AxesSubplot at 0x10fe79978>
```

![](data:image/png;base64,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)

As you can see, there’s a cluster at the bottom left with low total enrollment and low SAT scores. Other than this cluster, there appears to only be a slight positive correlation between SAT scores and total enrollment. Graphing out correlations can reveal unexpected patterns.

We can explore this further by getting the names of the schools with low enrollment and low SAT scores:

In [88]:
```
full[(full["total_enrollment"] < 1000) & (full["sat_score"] < 1000)]["School Name"]

```

Out[88]:
```
34     INTERNATIONAL SCHOOL FOR LIBERAL ARTS
143                                      NaN
148    KINGSBRIDGE INTERNATIONAL HIGH SCHOOL
203                MULTICULTURAL HIGH SCHOOL
294      INTERNATIONAL COMMUNITY HIGH SCHOOL
304          BRONX INTERNATIONAL HIGH SCHOOL
314                                      NaN
317            HIGH SCHOOL OF WORLD CULTURES
320       BROOKLYN INTERNATIONAL HIGH SCHOOL
329    INTERNATIONAL HIGH SCHOOL AT PROSPECT
331               IT TAKES A VILLAGE ACADEMY
351    PAN AMERICAN INTERNATIONAL HIGH SCHOO
Name: School Name, dtype: object
```

Some searching on Google shows that most of these schools are for students who are learning English, and are low enrollment as a result. This exploration showed us that it’s not total enrollment that’s correlated to SAT score – it’s whether or not students in the school are learning English as a second language or not.

### Exploring English language learners and SAT scores

Now that we know the percentage of English language learners in a school is correlated with lower SAT scores, we can explore the relationship. The `ell_percent` column is the percentage of students in each school who are learning English. We can make a scatterplot of this relationship:

In [89]:
```
full.plot.scatter(x='ell_percent', y='sat_score')

```

Out[89]:
```
<matplotlib.axes._subplots.AxesSubplot at 0x10fe824e0>
```

![](data:image/png;base64,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)

It looks like there are a group of schools with a high `ell_percentage` that also have low average SAT scores. We can investigate this at the district level, by figuring out the percentage of English language learners in each district, and seeing it if matches our map of SAT scores by district:

In [90]:
```
show_district_map("ell_percent")

```
Out[90]:

![](https://www.dataquest.io/blog/images/storytelling/district_ell.png)

As we can see by looking at the two district level maps, districts with a low proportion of ELL learners tend to have high SAT scores, and vice versa.

### Correlating survey scores and SAT scores

It would be fair to assume that the results of student, parent, and teacher surveys would have a large correlation with SAT scores. It makes sense that schools with high academic expectations, for instance, would tend to have higher SAT scores. To test this theory, lets plot out SAT scores and the various survey metrics:

In [91]:
```
full.corr()["sat_score"][["rr_s", "rr_t", "rr_p", "N_s", "N_t", "N_p", "saf_tot_11", "com_tot_11", "aca_tot_11", "eng_tot_11"]].plot.bar()

```

Out[91]:
```
<matplotlib.axes._subplots.AxesSubplot at 0x114652400>
```

![](data:image/png;base64,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)

Surprisingly, the two factors that correlate the most are `N_p` and `N_s`, which are the counts of parents and students who responded to the surveys. Both strongly correlate with total enrollment, so are likely biased by the `ell_learners`. The other metric that correlates most is `saf_t_11`. That is how safe students, parents, and teachers perceived the school to be. It makes sense that the safer the school, the more comfortable students feel learning in the environment. However, none of the other factors, like engagement, communication, and academic expectations, correlated with SAT scores. This may indicate that NYC is asking the wrong questions in surveys, or thinking about the wrong factors (if their goal is to improve SAT scores, it may not be).

### Exploring race and SAT scores

One of the other angles to investigate involves race and SAT scores. There was a large correlation differential, and plotting it out will help us understand what’s happening:

In [92]:
```
full.corr()["sat_score"][["white_per", "asian_per", "black_per", "hispanic_per"]].plot.bar()

```

Out[92]:
```
<matplotlib.axes._subplots.AxesSubplot at 0x108166ba8>
```

![](data:image/png;base64,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)

It looks like the higher percentages of white and asian students correlate with higher SAT scores, but higher percentages of black and hispanic students correlate with lower SAT scores. For hispanic students, this may be due to the fact that there are more recent immigrants who are ELL learners. We can map the hispanic percentage by district to eyeball the correlation:

In [93]:
```
show_district_map("hispanic_per")

```

Out[93]:

![](https://www.dataquest.io/blog/images/storytelling/district_hispanic.png)

It looks like there is some correlation with ELL percentage, but it will be necessary to do some more digging into this and other racial differences in SAT scores.

### Gender differences in SAT scores

The final angle to explore is the relationship between gender and SAT score. We noted that a higher percentage of females in a school tends to correlate with higher SAT scores. We can visualize this with a bar graph:

In [94]:
```
full.corr()["sat_score"][["male_per", "female_per"]].plot.bar()

```

Out[94]:
```
<matplotlib.axes._subplots.AxesSubplot at 0x10774d0f0>
```

![](data:image/png;base64,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)

To dig more into the correlation, we can make a scatterplot of `female_per` and `sat_score`:

In [95]:
```
full.plot.scatter(x='female_per', y='sat_score')

```

Out[95]:
```
<matplotlib.axes._subplots.AxesSubplot at 0x104715160>
```

![](data:image/png;base64,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)

It looks like there’s a cluster of schools with a high percentage of females, and very high SAT scores (in the top right). We can get the names of the schools in this cluster:

In [96]:
```
full[(full["female_per"] > 65) & (full["sat_score"] > 1400)]["School Name"]

```

Out[96]:
```
3             PROFESSIONAL PERFORMING ARTS HIGH SCH
92                    ELEANOR ROOSEVELT HIGH SCHOOL
100                    TALENT UNLIMITED HIGH SCHOOL
111            FIORELLO H. LAGUARDIA HIGH SCHOOL OF
229                     TOWNSEND HARRIS HIGH SCHOOL
250    FRANK SINATRA SCHOOL OF THE ARTS HIGH SCHOOL
265                  BARD HIGH SCHOOL EARLY COLLEGE
Name: School Name, dtype: object
```

Searching Google reveals that these are elite schools that focus on the performing arts. These schools tend to have higher percentages of females, and higher SAT scores. This likely accounts for the correlation between higher female percentages and SAT scores, and the inverse correlation between higher male percentages and lower SAT scores.

### AP scores

So far, we’ve looked at demographic angles. One angle that we have the data to look at is the relationship between more students taking Advanced Placement exams and higher SAT scores. It makes sense that they would be correlated, since students who are high academic achievers tend to do better on the SAT.

In [98]:
```
full["ap_avg"] = full["AP Test Takers "] / full["total_enrollment"]

full.plot.scatter(x='ap_avg', y='sat_score')

```

Out[98]:
```
<matplotlib.axes._subplots.AxesSubplot at 0x11463a908>
```

![](data:image/png;base64,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)

It looks like there is indeed a strong correlation between the two. An interesting cluster of schools is the one at the top right, which has high SAT scores and a high proportion of students that take the AP exams:

In [99]:
```
full[(full["ap_avg"] > .3) & (full["sat_score"] > 1700)]["School Name"]

```

Out[99]:
```
92             ELEANOR ROOSEVELT HIGH SCHOOL
98                    STUYVESANT HIGH SCHOOL
157             BRONX HIGH SCHOOL OF SCIENCE
161    HIGH SCHOOL OF AMERICAN STUDIES AT LE
176           BROOKLYN TECHNICAL HIGH SCHOOL
229              TOWNSEND HARRIS HIGH SCHOOL
243    QUEENS HIGH SCHOOL FOR THE SCIENCES A
260      STATEN ISLAND TECHNICAL HIGH SCHOOL
Name: School Name, dtype: object
```

Some Google searching reveals that these are mostly highly selective schools where you need to take a test to get in. It makes sense that these schools would have high proportions of AP test takers.

### Wrapping up the story

With data science, the story is never truly finished. By releasing analysis to others, you enable them to extend and shape your analysis in whatever direction interests them. For example, in this post, there are quite a few angles that we explored inmcompletely, and could have dived into more.

One of the best ways to get started with telling stories using data is to try to extend or replicate the analysis someone else has done. If you decide to take this route, you’re welcome to extend the analysis in this post and see what you can find. If you do this, make sure to comment below so I can take a look.

### Next steps

If you’ve made it this far, you hopefully have a good understanding of how to tell a story with data, and how to build your first data science portfolio piece. Once you’re done with your data science project, it’s a good idea to post it on [Github][21] so others can collaborate with you on it.

_If you liked this, you might like to read the other posts in our ‘Build a Data Science Portfolio’ series:_

*   _[How to setup up a data science blog][4]._
*   _[Building a machine learning project][3]._
*   _[The key to building a data science portfolio that will get you a job][2]._
*   _[17 places to find datasets for data science projects][1]_


--------------------------------------------------------------------------------

via: https://www.dataquest.io/blog/data-science-portfolio-project/

作者：[Vik Paruchuri ][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://twitter.com/vikparuchuri
[1]:https://www.dataquest.io/blog/free-datasets-for-projects
[2]:https://www.dataquest.io/blog/build-a-data-science-portfolio/
[3]:https://www.dataquest.io/blog/data-science-portfolio-machine-learning/
[4]:https://www.dataquest.io/blog/how-to-setup-a-data-science-blog/
[5]:https://www.dataquest.io/
[6]:http://pandas.pydata.org/pandas-docs/stable/generated/pandas.concat.html
[7]:http://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.html
[8]:https://data.cityofnewyork.us/Education/School-Districts/r8nu-ymqj
[9]:https://data.cityofnewyork.us/Education/NYC-School-Survey-2011/mnz3-dyi8
[10]:https://data.cityofnewyork.us/Education/School-Demographics-and-Accountability-Snapshot-20/ihfw-zy9j
[11]:https://data.cityofnewyork.us/Education/Graduation-Outcomes-Classes-Of-2005-2010-School-Le/vh2h-md7a
[12]:https://data.cityofnewyork.us/Education/AP-College-Board-2010-School-Level-Results/itfs-ms3e
[13]:https://data.cityofnewyork.us/Education/2010-2011-Class-Size-School-level-detail/urz7-pzb3
[14]:https://data.cityofnewyork.us/Education/NYS-Math-Test-Results-By-Grade-2006-2011-School-Le/jufi-gzgp
[15]:https://data.cityofnewyork.us/Education/School-Attendance-and-Enrollment-Statistics-by-Dis/7z8d-msnt
[16]:https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4
[17]:http://rs.io/100-interesting-data-sets-for-statistics/
[18]:https://github.com/caesar0301/awesome-public-datasets
[19]:https://reddit.com/r/datasets
[20]:https://www.data.gov/
[21]:https://github.com/
[22]:http://geojson.org/
[23]:http://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.corr.html
[24]:https://apstudent.collegeboard.org/home
[25]:http://pandas.pydata.org/pandas-docs/stable/merging.html
[26]:https://developer.cityofnewyork.us/api/doe-school-choice
[27]:https://www.dataquest.io/blog/data-science-portfolio-project/
[28]:http://jupyter.org/
[29]:https://data.cityofnewyork.us/Education/DOE-High-School-Directory-2014-2015/n3p6-zve2
[30]:https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4
[31]:https://en.wikipedia.org/wiki/SAT
[32]:https://data.cityofnewyork.us/data?cat=education
[33]:https://www.dataquest.io/blog/python-data-science/
[34]:http://www.jupyter.org/
[35]:https://www.dataquest.io/blog/data-science-portfolio-project/#email-signup
