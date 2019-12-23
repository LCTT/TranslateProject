[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Formatting NFL data for doing data science with Python)
[#]: via: (https://opensource.com/article/19/10/formatting-nfl-data-python)
[#]: author: (Christa Hayes https://opensource.com/users/cdhayes2)

Formatting NFL data for doing data science with Python
======
In part 1 of this series on machine learning with Python, learn how to
prepare a National Football League dataset for training.
![A football field.][1]

No matter what medium of content you consume these days (podcasts, articles, tweets, etc.), you'll probably come across some reference to data. Whether it's to back up a talking point or put a meta-view on how data is everywhere, data and its analysis are in high demand.

As a programmer, I've found data science to be more comparable to wizardry than an exact science. I've coveted the ability to get ahold of raw data and glean something useful and concrete from it. What a useful talent!

This got me thinking about the difference between data scientists and programmers. Aren't data scientists just statisticians who can code? Look around and you'll see any number of tools aimed at helping developers become data scientists. AWS has a full-on [machine learning course][2] geared specifically towards turning developers into experts. [Visual Studio][3] has built-in Python projects that—with the click of a button—will create an entire template for classification problems. And scores of programmers are writing tools designed to make data science easier for anyone to pick up.

I thought I'd lean into the clear message of recruiting programmers to the data (or dark) side and give it a shot with a fun project: training a machine learning model to predict plays using a National Football League (NFL) dataset.

### Set up the environment

Before I can dig into the data, I need to set up my [virtual environment][4]. This is important because, without an environment, I'll have nowhere to work. Fortunately, Opensource.com has [some great resources][5] for installing and configuring the setup.

Any of the code you see here, I was able to look up through existing documentation. If there is one thing programmers are familiar with, it's navigating foreign (and sometimes very sparse) documentation.

### Get the data

As with any modern problem, the first step is to make sure you have quality data. Luckily, I came across a set of [NFL tracking data][6] from 2017 that was used for the NFL Big Data Bowl. Even the NFL is trying its best to attract the brightest stars in the data realm.

Everything I need to know about the schema is in the README. This exercise will train a machine learning model to predict run (in which the ball carrier keeps the football and runs downfield) and pass (in which the ball is passed to a receiving player) plays using the plays.csv [data file][7]. I won't use player tracking data in this exercise, but it could be fun to explore later.

First things first, I need to get access to my data by importing it into a dataframe. The [Pandas][8] library is an open source Python library that provides algorithms for easy analysis of data structures. The structure in the sample NFL data happens to be a two-dimensional array (or in simpler terms, a table), which data scientists often refer to as a dataframe. The Pandas function dealing with dataframes is [pandas.DataFrame][9]. I'll also import several other libraries that I will use later.


```
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import xgboost as xgb

from sklearn import metrics

df = pd.read_csv('data/plays.csv')

print(len(df))
print(df.head())
```

### Format the data

The NFL data dump does not explicitly indicate which plays are runs (also called rushes) and which are passes. Therefore, I have to classify the offensive play types through some football savvy and reasoning.

Right away, I can get rid of special teams plays in the **isSTPLAY** column. Special teams are neither offense nor defense, so they are irrelevant to my objective.


```
#drop st plays
df = df[~df['isSTPlay']]
print(len(df))
```

Skimming the **playDescription** column, I see some plays where the quarterback kneels, which effectively ends a play. This is usually called a "victory formation" because the intent is to run out the clock. These are significantly different than normal running plays, so I can drop them as well.


```
#drop kneels
df = df[~df['playDescription'].str.contains("kneels")]
print (len(df))
```

The data reports time in terms of the quarters in which a game is normally played (as well as the time on the game clock in each quarter). Is this the most intuitive in terms of trying to predict a sequence? One way to answer this is to consider how gameplay differs between time splits.

When a team has the ball with a minute left in the first quarter, will it act the same as if it has the ball with a minute left in the second quarter? Probably not. Will it act the same with a minute to go at the end of both halves? All else remaining equal, the answer is likely yes in most scenarios.

I'll convert the **quarter** and **GameClock** columns from quarters to halves, denoted in seconds rather than minutes. I'll also create a **half** column from the **quarter** values. There are some fifth quarter values, which I take to be overtime. Since overtime rules are different than normal gameplay, I can drop them.


```
#drop overtime
df = df[~(df['quarter'] == 5)]
print(len(df))

#convert time/quarters
def translate_game_clock(row):
    raw_game_clock = row['GameClock']
    quarter = row['quarter']
    minutes, seconds_raw = raw_game_clock.partition(':')[::2]

    seconds = seconds_raw.partition(':')[0]

    total_seconds_left_in_quarter = int(seconds) + (int(minutes) * 60)

    if quarter == 3 or quarter == 1:
        return total_seconds_left_in_quarter + 900
    elif quarter == 4 or quarter == 2:
        return total_seconds_left_in_quarter

if 'GameClock' in list (df.columns):
    df['secondsLeftInHalf'] = df.apply(translate_game_clock, axis=1)

if 'quarter' in list(df.columns):
    df['half'] = df['quarter'].map(lambda q: 2 if q &gt; 2 else 1)
```

The **yardlineNumber** column also needs to be transformed. The data currently lists the yard line as a value from one to 50. Again, this is unhelpful because a team would not act the same on its own 20-yard line vs. its opponent's 20-yard line. I will convert it to represent a value from one to 99, where the one-yard line is nearest the possession team's endzone, and the 99-yard line is nearest the opponent's end zone.


```
def yards_to_endzone(row):
    if row['possessionTeam'] == row['yardlineSide']:
        return 100 - row['yardlineNumber']
    else :
        return row['yardlineNumber']

df['yardsToEndzone'] = df.apply(yards_to_endzone, axis = 1)
```

The personnel data would be extremely useful if I could get it into a format for the machine learning algorithm to take in. Personnel identifies the different types of skill positions on the field at a given time. The string value currently shown in **personnel.offense** is not conducive to input, so I'll convert each personnel position to its own column to indicate the number present on the field during the play. Defense personnel might be interesting to include later to see if it has any outcome on prediction. For now, I'll just stick with offense.


```
def transform_off_personnel(row):

   rb_count = 0
   te_count = 0
   wr_count = 0
   ol_count = 0
   dl_count = 0
   db_count = 0

   if not pd.isna(row['personnel.offense']):
       personnel = row['personnel.offense'].split(', ')
       for p in personnel:
           if p[2:4] == 'RB':
               rb_count = int(p[0])
           elif p[2:4] == 'TE':
                te_count = int(p[0])
           elif p[2:4] == 'WR':
                wr_count = int(p[0])
           elif p[2:4] == 'OL':
                ol_count = int(p[0])
           elif p[2:4] == 'DL':
                dl_count = int(p[0])
           elif p[2:4] == 'DB':
               db_count = int(p[0])

   return pd.Series([rb_count,te_count,wr_count,ol_count,dl_count, db_count])

df[['rb_count','te_count','wr_count','ol_count','dl_count', 'db_count']] = df.apply(transform_off_personnel, axis=1)
```

Now the offense personnel values are represented by individual columns.

![Result of reformatting offense personnel][10]

Formations describe how players are positioned on the field, and this is also something that would seemingly have value in predicting play outcomes. Once again, I'll convert the string values into integers.


```
df['offenseFormation'] = df['offenseFormation'].map(lambda f : 'EMPTY' if pd.isna(f) else f)

def formation(row):
    form = row['offenseFormation'].strip()
    if form == 'SHOTGUN':
        return 0
    elif form == 'SINGLEBACK':
        return 1
    elif form == 'EMPTY':
        return 2
    elif form == 'I_FORM':
        return 3
    elif form == 'PISTOL':
        return 4
    elif form == 'JUMBO':
        return 5
    elif form == 'WILDCAT':
        return 6
    elif form=='ACE':
        return 7
    else:
        return -1

df['numericFormation'] = df.apply(formation, axis=1)

print(df.yardlineNumber.unique())
```

Finally, it's time to classify the play types. The **PassResult** column has four distinct values: I, C, S, and null, which represent Incomplete passing plays, Complete passing plays, Sacks (classified as passing plays), and a null value. Since I've already eliminated all special teams plays, I can assume the null values are running plays. So I'll convert the play outcome into a single column called **play_type** represented by either a 0 for running or a 1 for passing. This will be the column (or _label_, as the data scientists say) I want my algorithm to predict.


```
def play_type(row):
    if row['PassResult'] == 'I' or row['PassResult'] == 'C' or row['PassResult'] == 'S':
        return 'Passing'
    else:
        return 'Rushing'

df['play_type'] = df.apply(play_type, axis = 1)
df['numericPlayType'] = df['play_type'].map(lambda p: 1 if p == 'Passing' else 0)
```

### Take a break

Is it time to start predicting things yet? Most of my work so far has been trying to understand the data and what format it needs to be in—before I even get started on predicting anything. Anyone else need a minute?

In part two, I'll do some analysis and visualization of the data before feeding it into a machine learning algorithm, and then I'll score the model's results to see how accurate they are. Stay tuned!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/formatting-nfl-data-python

作者：[Christa Hayes][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cdhayes2
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_LIFE_football__520x292.png?itok=5hPbxQF8 (A football field.)
[2]: https://aws.amazon.com/training/learning-paths/machine-learning/developer/
[3]: https://docs.microsoft.com/en-us/visualstudio/python/overview-of-python-tools-for-visual-studio?view=vs-2019
[4]: https://opensource.com/article/19/9/get-started-data-science-python
[5]: https://opensource.com/article/17/10/python-101
[6]: https://github.com/nfl-football-ops/Big-Data-Bowl
[7]: https://github.com/nfl-football-ops/Big-Data-Bowl/tree/master/Data
[8]: https://pandas.pydata.org/
[9]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.html
[10]: https://opensource.com/sites/default/files/uploads/nfl-python-7_personneloffense.png (Result of reformatting offense personnel)
