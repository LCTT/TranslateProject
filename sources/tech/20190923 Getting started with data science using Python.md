[#]: collector: (lujun9972)
[#]: translator: (GraveAccent)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with data science using Python)
[#]: via: (https://opensource.com/article/19/9/get-started-data-science-python)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/jroakeshttps://opensource.com/users/tiwarinitish86)

Getting started with data science using Python
======
Doing data science with Python offers limitless potential for you to
parse, interpret, and structure data in meaningful and enlightening
ways.
![Metrics and a graph illustration][1]

Data science is an exciting new field in computing that's built around analyzing, visualizing, correlating, and interpreting the boundless amounts of information our computers are collecting about the world. Of course, calling it a "new" field is a little disingenuous because the discipline is a derivative of statistics, data analysis, and plain old obsessive scientific observation.

But data science is a formalized branch of these disciplines, with processes and tools all its own, and it can be broadly applied across disciplines (such as visual effects) that had never produced big dumps of unmanageable data before. Data science is a new opportunity to take a fresh look at data from oceanography, meteorology, geography, cartography, biology, medicine and health, and entertainment industries and gain a better understanding of patterns, influences, and causality.

Like other big and seemingly all-inclusive fields, it can be intimidating to know where to start exploring data science. There are a lot of resources out there to help data scientists use their favorite programming languages to accomplish their goals, and that includes one of the most popular programming languages out there: Python. Using the [Pandas][2], [Matplotlib][3], and [Seaborn][4] libraries, you can learn the basic toolset of data science.

If you're not familiar with the basics of Python yet, read my [introduction to Python][5] before continuing.

### Creating a Python virtual environment

Programmers sometimes forget which libraries they have installed on their development machine, and this can lead them to ship code that worked on their computer but fails on all others for lack of a library. Python has a system designed to avoid this manner of unpleasant surprise: the virtual environment. A virtual environment intentionally ignores all the Python libraries you have installed, effectively forcing you to begin development with nothing more than stock Python.

To activate a virtual environment with **venv**, invent a name for your environment (I'll use **example**) and create it with:


```
`$ python3 -m venv example`
```

Source the **activate** file in the environment's **bin** directory to activate it:


```
$ source ./example/bin/activate
(example) $
```

You are now "in" your virtual environment, a clean slate where you can build custom solutions to problems—with the added burden of consciously needing to install required libraries.

### Installing Pandas and NumPy

The first libraries you must install in your new environment are Pandas and NumPy. These libraries are common in data science, so this won't be the last time you'll install them. They're also not the only libraries you'll ever need in data science, but they're a good start.

Pandas is an open source, BSD-licensed library that makes it easy to process data structures for analysis. It depends on NumPy, a scientific library that provides multi-dimensional arrays, linear algebra, Fourier transforms, and much more. Install both using **pip3**:


```
`(example) $ pip3 install pandas`
```

Installing Pandas also installs NumPy, so you don't need to specify both. Once you have installed them to your virtual environment once, the installation packages are cached so that when you install them again, you don't have to download them from the internet.

Those are the only libraries you need for now. Next, you need some sample data.

### Generating a sample dataset

Data science is all about data, and luckily there are lots of free and open datasets available from scientific, computing, and government organizations. While these datasets are a great resource for education, they have a lot more data than necessary for this simple example. You can create a sample and manageable dataset quickly with Python:


```
#!/usr/bin/env python3

import random

def rgb():
    NUMBER=random.randint(0,255)/255
    return NUMBER

FILE = open('sample.csv','w')
FILE.write('"red","green","blue"')
for COUNT in range(10):
    FILE.write('\n{:0.2f},{:0.2f},{:0.2f}'.format(rgb(),rgb(),rgb()))
```

This produces a file called **sample.csv**, consisting of randomly generated floats representing, in this example, RGB values (a commonly tracked value, among hundreds, in visual effects). You can use a CSV file as a data source for Pandas.

### Ingesting data with Pandas

One of Pandas' basic features is its ability to ingest data and process it without the programmer writing new functions just to parse input. If you're used to applications that do that automatically, this might not seem like it's very special—but imagine opening a CSV in [LibreOffice][6] and having to write formulas to split the values at each comma. Pandas shields you from low-level operations like that. Here's some simple code to ingest and print out a file of comma-separated values:


```
#!/usr/bin/env python3

from pandas import read_csv, DataFrame
import pandas as pd

FILE = open('sample.csv','r')
DATAFRAME = pd.read_csv(FILE)
print(DATAFRAME)
```

The first few lines import components of the Pandas library. The Pandas library is extensive, so you'll refer to its documentation frequently when looking for functions beyond the basic ones in this article.

Next, a variable **f** is created by opening the **sample.csv** file you created. That variable is used by the Pandas module **read_csv** (imported in the second line) to create a _dataframe_. In Pandas, a dataframe is a two-dimensional array, commonly thought of as a table. Once your data is in a dataframe, you can manipulate it by column and row, query it for ranges, and do a lot more. The sample code, for now, just prints the dataframe to the terminal.

Run the code. Your output will differ slightly from this sample output because the numbers are randomly generated, but the format is the same:


```
(example) $ python3 ./parse.py
    red  green  blue
0  0.31   0.96  0.47
1  0.95   0.17  0.64
2  0.00   0.23  0.59
3  0.22   0.16  0.42
4  0.53   0.52  0.18
5  0.76   0.80  0.28
6  0.68   0.69  0.46
7  0.75   0.52  0.27
8  0.53   0.76  0.96
9  0.01   0.81  0.79
```

Assume you need only the red values from your dataset. You can do this by declaring your dataframe's column names and selectively printing only the column you're interested in:


```
from pandas import read_csv, DataFrame
import pandas as pd

FILE = open('sample.csv','r')
DATAFRAME = pd.read_csv(FILE)

# define columns
DATAFRAME.columns = [ 'red','green','blue' ]

print(DATAFRAME['red'])
```

Run the code now, and you get just the red column:


```
(example) $ python3 ./parse.py
0    0.31
1    0.95
2    0.00
3    0.22
4    0.53
5    0.76
6    0.68
7    0.75
8    0.53
9    0.01
Name: red, dtype: float64
```

Manipulating tables of data is a great way to get used to how data can be parsed with Pandas. There are many more ways to select data from a dataframe, and the more you experiment, the more natural it becomes.

### Visualizing your data

It's no secret that many humans prefer to visualize information. It's the reason charts and graphs are staples of meetings with upper management and why "infographics" are popular in the news business. Part of a data scientist's job is to help others understand large samples of data, and there are libraries to help with this task. Combining Pandas with a visualization library can produce visual interpretations of your data. One popular open source library for visualization is [Seaborn][7], which is based on the open source [Matplotlib][3].

#### Installing Seaborn and Matplotlib

Your Python virtual environment doesn't yet have Seaborn and Matplotlib, so install them with pip3. Seaborn also installs Matplotlib along with many other libraries:


```
`(example) $ pip3 install seaborn`
```

For Matplotlib to display graphics, you must also install [PyGObject][8] and [Pycairo][9]. This involves compiling code, which pip3 can do for you as long as you have the necessary header files and libraries installed. Your Python virtual environment has no awareness of these support libraries, so you can execute the installation command inside or outside the environment.

On Fedora and CentOS:


```
(example) $ sudo dnf install -y gcc zlib-devel bzip2 bzip2-devel readline-devel \
sqlite sqlite-devel openssl-devel tk-devel git python3-cairo-devel \
cairo-gobject-devel gobject-introspection-devel
```

On Ubuntu and Debian:


```
(example) $ sudo apt install -y libgirepository1.0-dev build-essential \
libbz2-dev libreadline-dev libssl-dev zlib1g-dev libsqlite3-dev wget \
curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libcairo2-dev
```

Once they are installed, you can install the GUI components needed by Matplotlib:


```
`(example) $ pip3 install PyGObject pycairo`
```

### Displaying a graph with Seaborn and Matplotlib

Open a file called **vizualize.py** in your favorite text editor. To create a line graph visualization of your data, first, you must import the necessary Python modules: the Pandas modules you used in the previous code examples:


```
#!/usr/bin/env python3

from pandas import read_csv, DataFrame
import pandas as pd
```

Next, import Seaborn, Matplotlib, and several components of Matplotlib so you can configure the graphics you produce:


```
import seaborn as sns
import matplotlib
import matplotlib.pyplot as plt
from matplotlib import rcParams
```

Matplotlib can export its output to many formats, including PDF, SVG, or just a GUI window on your desktop. For this example, it makes sense to send your output to the desktop, so you must set the Matplotlib backend to GTK3Agg. If you're not using Linux, you may need to use the TkAgg backend instead.

After setting the backend for the GUI window, set the size of the window and the Seaborn preset style:


```
matplotlib.use('GTK3Agg')
rcParams['figure.figsize'] = 11,8
sns.set_style('darkgrid')
```

Now that your display is configured, the code is familiar. Ingest your **sample.csv** file with Pandas, and define the columns of your dataframe:


```
FILE = open('sample.csv','r')
DATAFRAME = pd.read_csv(FILE)
DATAFRAME.columns = [ 'red','green','blue' ]
```

With the data in a useful format, you can plot it out in a graph. Use each column as input for a plot, then use **plt.show()** to draw the graph in a GUI window. The **plt.legend()** parameter associates the column header with each line on your graph (the **loc** parameter places the legend outside the chart rather than over it):


```
for i in DATAFRAME.columns:
    DATAFRAME[i].plot()

plt.legend(bbox_to_anchor=(1, 1), loc=2, borderaxespad=1)
plt.show()
```

Run the code to display the results.

![First data visualization][10]

Your graph accurately displays all the information contained in your CSV file: values are on the Y-axis, index numbers are on the X-axis, and the lines of the graph are identified so that you know what they represent. However, since this code is tracking color values (at least, it's pretending to), the colors of the lines are not just non-intuitive, but counterintuitive. If you never need to analyze color data, you may never run into this problem, but you're sure to run into something analogous. When visualizing data, you must consider the best way to present it to prevent the viewer from extrapolating false information from what you're presenting.

To fix this problem (and show off some of the customization available), the following code assigns each plotted line a specific color:


```
import matplotlib
from pandas import read_csv, DataFrame
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from matplotlib import rcParams

matplotlib.use('GTK3Agg')
rcParams['figure.figsize'] = 11,8
sns.set_style('whitegrid')

FILE = open('sample.csv','r')
DATAFRAME = pd.read_csv(FILE)
DATAFRAME.columns = [ 'red','green','blue' ]

plt.plot(DATAFRAME['red'],'r-')
plt.plot(DATAFRAME['green'],'g-')
plt.plot(DATAFRAME['blue'],'b-')
plt.plot(DATAFRAME['red'],'ro')
plt.plot(DATAFRAME['green'],'go')
plt.plot(DATAFRAME['blue'],'bo')

plt.show()
```

This uses special Matplotlib notation to create two plots per column. The initial plot of each column is assigned a color (**r** for red, **g** for green, and **b** for blue). These are built-in Matplotlib settings. The **-** notation indicates a solid line (a double dash, such as **r--**, creates a dashed line). A second plot is created for each column with the same colors but using **o** to denote dots or nodes. To demonstrate built-in Seaborn themes, change the value of **sns.set_style** to **whitegrid**.

![Improved data visualization][11]

### Deactivating your virtual environment

When you're finished exploring Pandas and plotting, you can deactivate your Python virtual environment with the **deactivate** command:


```
(example) $ deactivate
$
```

When you want to get back to it, just reactivate it as you did at the start of this article. You'll have to reinstall your modules when you reactivate your virtual environment, but they'll be installed from cache rather than downloaded from the internet, so you don't have to be online.

### Endless possibilities

The true power of Pandas, Matplotlib, Seaborn, and data science is the endless potential for you to parse, interpret, and structure data in a meaningful and enlightening way. Your next step is to explore simple datasets with the new tools you've learned in this article. There's a lot more to Matplotlib and Seaborn than just line graphs, so try creating a bar graph or a pie chart or something else entirely.

The possibilities are limitless once you understand your toolset and have some idea of how to correlate your data. Data science is a new way to find stories hidden within data; let open source be your medium.

Data visualization is the mechanism of taking tabular or spatial data and conveying it in a human-...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/get-started-data-science-python

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/jroakeshttps://opensource.com/users/tiwarinitish86
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_graph_stats_blue.png?itok=OKCc_60D (Metrics and a graph illustration)
[2]: https://pandas.pydata.org/
[3]: https://matplotlib.org/
[4]: https://seaborn.pydata.org/index.html
[5]: https://opensource.com/article/17/10/python-101
[6]: http://libreoffice.org
[7]: https://seaborn.pydata.org/
[8]: https://pygobject.readthedocs.io/en/latest/getting_started.html
[9]: https://pycairo.readthedocs.io/en/latest/
[10]: https://opensource.com/sites/default/files/uploads/seaborn-matplotlib-graph_0.png (First data visualization)
[11]: https://opensource.com/sites/default/files/uploads/seaborn-matplotlib-graph_1.png (Improved data visualization)
