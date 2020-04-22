[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using Python to visualize COVID-19 projections)
[#]: via: (https://opensource.com/article/20/4/python-data-covid-19)
[#]: author: (AnuragGupta https://opensource.com/users/999anuraggupta)

Using Python to visualize COVID-19 projections
======
I'll demonstrate how to create two visualizations of the spread of a
virus across the globe, provided open data and using open source
libraries.
![Colorful sound wave graph][1]

Using [Python][2] and some graphing libraries, you can project the total number of confirmed cases of COVID-19, and also display the total number of deaths for a country (this article uses India as an example) on a given date. Humans sometimes need help interpreting and processing the meaning of data, so this article also demonstrates how to create an animated horizontal bar graph for five countries, showing the variation of cases by date.

### Projecting confirmed cases and deaths for India

This is done in three steps.

#### 1\. Download data

Scientific data isn't always open, but fortunately, many modern science and healthcare organizations are eager to share information with each other and the public. Data about COVID-19 cases is available online, and it's updated frequently.

To parse the data, you first must download it: <https://raw.githubusercontent.com/datasets/covid-19/master/data/countries-aggregated.csv>

Load the data directly into a Pandas DataFrame. Pandas provides a function, **read_csv()**, which can take a URL and give back a DataFrame object, as shown below:


```
import pycountry
import plotly.express as px
import pandas as pd
URL_DATASET = r'<https://raw.githubusercontent.com/datasets/covid-19/master/data/countries-aggregated.csv>'
df1 = pd.read_csv(URL_DATASET)
print(df1.head(3))  # Get first 3 entries in the dataframe
print(df1.tail(3))  # Get last 3 entries in the dataframe
```

The top row of the data set contains column names:

  1. Date
  2. Country
  3. Confirmed
  4. Recovered
  5. Deaths



The output of the **head** query includes a unique identifier (not listed as a column) plus an entry for each column:


```
0 2020-01-22 Afghanistan 0 0 0
1 2020-01-22 Albania 0 0 0
1 2020-01-22 Algeria 0 0 0
```

The output of the **tail** query is similar but contains the tail end of the data set:


```
12597 2020-03-31 West Bank and Gaza 119 18 1
12598 2020-03-31 Zambia 35 0 0
12599 2020-03-31 Zimbabwe 8 0 1
```

From the output, you can see that the DataFrame (**df1**) has the following columns:

  1. Date
  2. Country
  3. Confirmed
  4. Recovered
  5. Dead



Further, you can see that the **Date** column has entries starting from January 22 to March 31. This database is updated daily, so you will have current values.

#### 2\. Select data for India

In this step, we will select only those rows in the DataFrame that include India. This is shown in the script below:


```
#### ----- Step 2 (Select data for India)----
df_india = df1[df1['Country'] == 'India']
print(df_india.head(3))
```

#### 3\. Plot data

Here we create a bar chart. We will put the dates on the X-axis and the number of confirmed cases and the number of deaths on the Y-axis. There are a few noteworthy things about this part of the script which are as follows:

  * The line of code: **plt.rcParams["_figure.figsize"_]=20,20** is meant only for Jupyter. So remove it if you are using some other IDE.

  * Notice the line of code: **ax1 = plt.gca()**. To ensure that both the plots i.e. for confirmed cases as well as for deaths are plotted on the same graph, we need to give to the second graph the **ax** object of the plot. So we use **gca()** to do this. (By the way, 'gca' stands for 'get current axis').




The complete script is given below:


```
#  Author:- Anurag Gupta # email:- [999.anuraggupta@gmail.com][3]
%matplotlib inline
import matplotlib.pyplot as plt
import pandas as pd

#### ----- Step 1 (Download data)----
URL_DATASET = r'<https://raw.githubusercontent.com/datasets/covid-19/master/data/countries-aggregated.csv>'
df1 = pd.read_csv(URL_DATASET)
# print(df1.head(3))  # Uncomment to see the dataframe

#### ----- Step 2 (Select data for India)----
df_india = df1[df1['Country'] == 'India']
print(df_india.head(3))

#### ----- Step 3 (Plot data)----
# Increase size of plot
plt.rcParams["figure.figsize"]=20,20  # Remove if not on Jupyter
# Plot column 'Confirmed'
df_india.plot(kind = 'bar', x = 'Date', y = 'Confirmed', color = 'blue')

ax1 = plt.gca()
df_india.plot(kind = 'bar', x = 'Date', y = 'Deaths', color = 'red', ax = ax1)
plt.show()
```

The entire script is [available on GitHub][4].

### Creating an animated horizontal bar graph for five countries

Note for Jupyter: To run this in Jupyter as a dynamic animation rather than as a static png, you need to add a magic command at the beginning of your cell, namely: **%matplotlib notebook**. This will keep the figure alive instead of displaying a static png file and can hence also show animations. If you are on another IDE, remove this line.

#### 1\. Download the data

This step is exactly the same as in the previous script, and therefore, it need not be repeated.

#### 2\. Create a list of all dates

If you examine the data you downloaded, you notice that it has a column **Date**. Now, this column has a date value for each country. So the same date is occurring a number of times. We need to create a list of dates with only unique values. This will be used on the X-axis of our bar charts. We have a line of code like: **list_dates = df[_‘Date’_].unique()**. The **unique()** method will pick up only the unique values for each date.

#### 3\. Pick five countries and create an **ax** object

Take a list of five countries. (You can choose whatever countries you prefer, or even increase or decrease the number of countries). I have also taken a list of five colors for the bars of each country. (You can change this too if you like). One important line of code here is: **fig, ax = plt.subplots(figsize=(15, 8))**. This is needed to create an **ax** object.

#### 4\. Write the call back function

If you want to do animation in Matplotlib, you need to create an object of a class called **matplotlib.animation.FuncAnimation**. The signature of this class is available online. The constructor of this class, apart from other parameters, also takes a parameter called **func**, and you have to give this parameter a callback function. So in this step, we will write the callback function, which is repeatedly called in order to render the animation.

#### 5\. Create **FuncAnimation** object

This step has partly been explained in the previous step.

Our code to create an object of this class is:


```
my_anim = animation.FuncAnimation(fig = fig, func = plot_bar,
                    frames= list_dates, blit=True,
                    interval=20)
```

The three important parameters to be given are:

  * **fig**, which must be given a fig object, which we created earlier.
  * **func**, which must be the call back function.
  * **frames**, which must contain the variable on which the animation is to be done. Here in our case, it will be the list of dates we created earlier.



#### 6\. Save the animation to an mp4 file

You can save the animation created into an mp4 file. But for this you need **ffmpeg**. You can download this using pip by **pip install ffmpeg-python**, or using conda (on Jupyter) **install -c conda-forge ffmpeg**.

And finally, you can run the animation using **plt.show()**. Please note that on many platforms, the **ffmpeg** may not work properly and may require further "tweaking."


```
%matplotlib notebook
#  Author:- Anurag Gupta # email:- [999.anuraggupta@gmail.com][3]
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from time import sleep

#### ---- Step 1:- Download data
URL_DATASET = r'<https://raw.githubusercontent.com/datasets/covid-19/master/data/countries-aggregated.csv>'
df = pd.read_csv(URL_DATASET, usecols = ['Date', 'Country', 'Confirmed'])
# print(df.head(3)) # uncomment this to see output

#### ---- Step 2:- Create list of all dates
list_dates = df['Date'].unique()
# print(list_dates) # Uncomment to see the dates

#### --- Step 3:- Pick 5 countries. Also create ax object
fig, ax = plt.subplots(figsize=(15, 8))
# We will animate for these 5 countries only
list_countries = ['India', 'China', 'US', 'Italy', 'Spain']
# colors for the 5 horizontal bars
list_colors = ['black', 'red', 'green', 'blue', 'yellow']

### --- Step 4:- Write the call back function
# plot_bar() is the call back function used in FuncAnimation class object
def plot_bar(some_date):
    df2 = df[df['Date'].eq(some_date)]
    ax.clear()
    # Only take Confirmed column in descending order
    df3 = df2.sort_values(by = 'Confirmed', ascending = False)
    # Select the top 5 Confirmed countries
    df4 = df3[df3['Country'].isin(list_countries)]
    # print(df4)  # Uncomment to see that dat is only for 5 countries
    sleep(0.2)  # To slow down the animation
    # ax.barh() makes a horizontal bar plot.
    return ax.barh(df4['Country'], df4['Confirmed'], color= list_colors)

###----Step 5:- Create FuncAnimation object---------
my_anim = animation.FuncAnimation(fig = fig, func = plot_bar,
                    frames= list_dates, blit=True,
                    interval=20)

### --- Step 6:- Save the animation to an mp4
# Place where to save the mp4. Give your file path instead
path_mp4 = r'C:\Python-articles\population_covid2.mp4'  
# my_anim.save(path_mp4, fps=30, extra_args=['-vcodec', 'libx264'])
my_anim.save(filename = path_mp4, writer = 'ffmpeg',
             fps=30,
             extra_args= ['-vcodec', 'libx264', '-pix_fmt', 'yuv420p'])
plt.show()
```

The complete script is [available on GitHub][5].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/python-data-covid-19

作者：[AnuragGupta][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/999anuraggupta
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/colorful_sound_wave.png?itok=jlUJG0bM (Colorful sound wave graph)
[2]: https://opensource.com/resources/python
[3]: mailto:999.anuraggupta@gmail.com
[4]: https://raw.githubusercontent.com/ag999git/jupyter_notebooks/master/corona_bar_india
[5]: https://raw.githubusercontent.com/ag999git/jupyter_notebooks/master/corona_bar_animated
