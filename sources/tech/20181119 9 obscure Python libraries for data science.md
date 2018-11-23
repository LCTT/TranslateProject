heguangzhi  Translating 

9 obscure Python libraries for data science
======
Go beyond pandas, scikit-learn, and matplotlib and learn some new tricks for doing data science in Python.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life-python.jpg?itok=F2PYP2wT)
Python is an amazing language. In fact, it's one of the fastest growing programming languages in the world. It has time and again proved its usefulness both in developer job roles and data science positions across industries. The entire ecosystem of Python and its libraries makes it an apt choice for users (beginners and advanced) all over the world. One of the reasons for its success and popularity is its set of robust libraries that make it so dynamic and fast.

In this article, we will look at some of the Python libraries for data science tasks other than the commonly used ones like **pandas, scikit-learn** , and **matplotlib**. Although libraries like **pandas and scikit-learn** are the ones that come to mind for machine learning tasks, it's always good to learn about other Python offerings in this field.

### Wget

Extracting data, especially from the web, is one of a data scientist's vital tasks. [Wget][1] is a free utility for non-interactive downloading files from the web. It supports HTTP, HTTPS, and FTP protocols, as well as retrieval through HTTP proxies. Since it is non-interactive, it can work in the background even if the user isn't logged in. So the next time you want to download a website or all the images from a page, **wget** will be there to assist.

#### Installation

```
$ pip install wget
```

#### Example

```
import wget
url = 'http://www.futurecrew.com/skaven/song_files/mp3/razorback.mp3'

filename = wget.download(url)
100% [................................................] 3841532 / 3841532

filename
'razorback.mp3'
```

### Pendulum

For people who get frustrated when working with date-times in Python, **[Pendulum][2]** is here. It is a Python package to ease **datetime** manipulations. It is a drop-in replacement for Python's native class. Refer to the [documentation][3] for in-depth information.

#### Installation

```
$ pip install pendulum
```

#### Example

```
import pendulum

dt_toronto = pendulum.datetime(2012, 1, 1, tz='America/Toronto')
dt_vancouver = pendulum.datetime(2012, 1, 1, tz='America/Vancouver')

print(dt_vancouver.diff(dt_toronto).in_hours())

3
```

### Imbalanced-learn

Most classification algorithms work best when the number of samples in each class is almost the same (i.e., balanced). But real-life cases are full of imbalanced datasets, which can have a bearing upon the learning phase and the subsequent prediction of machine learning algorithms. Fortunately, the **[imbalanced-learn][4]** library was created to address this issue. It is compatible with [**scikit-learn**][5] and is part of **[scikit-learn-contrib][6]** projects. Try it the next time you encounter imbalanced datasets.

#### Installation

```
pip install -U imbalanced-learn

# or

conda install -c conda-forge imbalanced-learn
```

#### Example

For usage and examples refer to the [documentation][7].

### FlashText

Cleaning text data during natural language processing (NLP) tasks often requires replacing keywords in or extracting keywords from sentences. Usually, such operations can be accomplished with regular expressions, but they can become cumbersome if the number of terms to be searched runs into the thousands.

Python's **[FlashText][8]** module, which is based upon the [FlashText algorithm][9], provides an apt alternative for such situations. The best part of FlashText is the runtime is the same irrespective of the number of search terms. You can read more about it in the [documentation][10].

#### Installation

```
$ pip install flashtext
```

#### Examples

##### **Extract keywords:**

```
from flashtext import KeywordProcessor
keyword_processor = KeywordProcessor()

# keyword_processor.add_keyword(<unclean name>, <standardised name>)

keyword_processor.add_keyword('Big Apple', 'New York')
keyword_processor.add_keyword('Bay Area')
keywords_found = keyword_processor.extract_keywords('I love Big Apple and Bay Area.')

keywords_found
['New York', 'Bay Area']
```

**Replace keywords:**

```
keyword_processor.add_keyword('New Delhi', 'NCR region')

new_sentence = keyword_processor.replace_keywords('I love Big Apple and new delhi.')

new_sentence
'I love New York and NCR region.'
```

For more examples, refer to the [usage][11] section in the documentation.

### FuzzyWuzzy

The name sounds weird, but **[FuzzyWuzzy][12]** is a very helpful library when it comes to string matching. It can easily implement operations like string comparison ratios, token ratios, etc. It is also handy for matching records kept in different databases.

#### Installation

```
$ pip install fuzzywuzzy
```

#### Example

```
from fuzzywuzzy import fuzz
from fuzzywuzzy import process

# Simple Ratio

fuzz.ratio("this is a test", "this is a test!")
97

# Partial Ratio
fuzz.partial_ratio("this is a test", "this is a test!")
 100
```

More examples can be found in FuzzyWuzzy's [GitHub repo.][12]

### PyFlux

Time-series analysis is one of the most frequently encountered problems in machine learning. **[PyFlux][13]** is an open source library in Python that was explicitly built for working with time-series problems. The library has an excellent array of modern time-series models, including but not limited to **ARIMA** , **GARCH** , and **VAR** models. In short, PyFlux offers a probabilistic approach to time-series modeling. It's worth trying out.

#### Installation

```
pip install pyflux
```

#### Example

Please refer to the [documentation][14] for usage and examples.

### IPyvolume

Communicating results is an essential aspect of data science, and visualizing results offers a significant advantage. **[**IPyvolume**][15]** is a Python library to visualize 3D volumes and glyphs (e.g., 3D scatter plots) in the Jupyter notebook with minimal configuration and effort. However, it is currently in the pre-1.0 stage. A good analogy would be something like this: IPyvolume's **volshow** is to 3D arrays what matplotlib's **imshow** is to 2D arrays. You can read more about it in the [documentation][16].

#### Installation

```
Using pip
$ pip install ipyvolume

Conda/Anaconda
$ conda install -c conda-forge ipyvolume
```

#### Examples

**Animation:**
![](https://opensource.com/sites/default/files/uploads/ipyvolume_animation.gif)

**Volume rendering:**
![](https://opensource.com/sites/default/files/uploads/ipyvolume_volume-rendering.gif)

### Dash

**[Dash][17]** is a productive Python framework for building web applications. It is written on top of Flask, Plotly.js, and React.js and ties modern UI elements like drop-downs, sliders, and graphs to your analytical Python code without the need for JavaScript. Dash is highly suitable for building data visualization apps that can be rendered in the web browser. Consult the [user guide][18] for more details.

#### Installation

```
pip install dash==0.29.0  # The core dash backend
pip install dash-html-components==0.13.2  # HTML components
pip install dash-core-components==0.36.0  # Supercharged components
pip install dash-table==3.1.3  # Interactive DataTable component (new!)
```

#### Example

The following example shows a highly interactive graph with drop-down capabilities. As the user selects a value in the drop-down, the application code dynamically exports data from Google Finance into a Pandas DataFrame.
![](https://opensource.com/sites/default/files/uploads/dash_animation.gif)

### Gym

**[Gym][19]** from [OpenAI][20] is a toolkit for developing and comparing reinforcement learning algorithms. It is compatible with any numerical computation library, such as TensorFlow or Theano. The Gym library is a collection of test problems, also called environments, that you can use to work out your reinforcement-learning algorithms. These environments have a shared interface, which allows you to write general algorithms.

#### Installation

```
pip install gym
```

#### Example

The following example will run an instance of the environment **[CartPole-v0][21]** for 1,000 timesteps, rendering the environment at each step.
![](https://opensource.com/sites/default/files/uploads/gym_animation.gif)

You can read about [other environments][22] on the Gym website.

### Conclusion

These are my picks for useful, but little-known Python libraries for data science. If you know another one to add to this list, please mention it in the comments below.

This was originally published on the [Analytics Vidhya][23] Medium channel and is reprinted with permission.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/python-libraries-data-science

作者：[Parul Pandey][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/parul-pandey
[b]: https://github.com/lujun9972
[1]: https://pypi.org/project/wget/
[2]: https://github.com/sdispater/pendulum
[3]: https://pendulum.eustace.io/docs/#installation
[4]: https://github.com/scikit-learn-contrib/imbalanced-learn
[5]: http://scikit-learn.org/stable/
[6]: https://github.com/scikit-learn-contrib
[7]: http://imbalanced-learn.org/en/stable/api.html
[8]: https://github.com/vi3k6i5/flashtext
[9]: https://arxiv.org/abs/1711.00046
[10]: https://flashtext.readthedocs.io/en/latest/
[11]: https://flashtext.readthedocs.io/en/latest/#usage
[12]: https://github.com/seatgeek/fuzzywuzzy
[13]: https://github.com/RJT1990/pyflux
[14]: https://pyflux.readthedocs.io/en/latest/index.html
[15]: https://github.com/maartenbreddels/ipyvolume
[16]: https://ipyvolume.readthedocs.io/en/latest/?badge=latest
[17]: https://github.com/plotly/dash
[18]: https://dash.plot.ly/
[19]: https://github.com/openai/gym
[20]: https://openai.com/
[21]: https://gym.openai.com/envs/CartPole-v0
[22]: https://gym.openai.com/
[23]: https://medium.com/analytics-vidhya/python-libraries-for-data-science-other-than-pandas-and-numpy-95da30568fad
