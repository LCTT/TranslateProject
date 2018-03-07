Getting started with Python for data science
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/GOV_open_data_520x292.jpg?itok=R8rBrlk7)

Whether you're a budding data science enthusiast with a math or computer science background or an expert in an unrelated field, the possibilities data science offers are within your reach. And you don't need expensive, highly specialized enterprise software—the open source tools discussed in this article are all you need to get started.

[Python][1], its machine-learning and data science libraries ([pandas][2], [Keras][3], [TensorFlow][4], [scikit-learn][5], [SciPy][6], [NumPy][7], etc.), and its extensive list of visualization libraries ([Matplotlib][8], [pyplot][9], [Plotly][10], etc.) are excellent FOSS tools for beginners and experts alike. Easy to learn, popular enough to offer community support, and armed with the latest emerging techniques and algorithms developed for data science, these comprise one of the best toolsets you can acquire when starting out.

Many of these Python libraries are built on top of each other (known as dependencies), and the basis is the [NumPy][7] library. Designed specifically for data science, NumPy is often used to store relevant portions of datasets in its ndarray datatype, which is a convenient datatype for storing records from relational tables as `cvs` files or in any other format, and vice-versa. It is particularly convenient when scikit functions are applied to multidimensional arrays. SQL is great for querying databases, but to perform complex and resource-intensive data science operations, storing data in ndarray boosts efficiency and speed (but make sure you have ample RAM when dealing with large datasets). When you get to using pandas for knowledge extraction and analysis, the almost seamless conversion between DataFrame datatype in pandas and ndarray in NumPy creates a powerful combination for extraction and compute-intensive operations, respectively.

For a quick demonstration, let’s fire up the Python shell and load an open dataset on crime statistics from the city of Baltimore in a pandas DataFrame variable, and view a portion of the loaded frame:
```
>>>  import   pandas as  pd

>>>  crime_stats   =  pd.read_csv('BPD_Arrests.csv')

>>>  crime_stats.head()

```

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/crime_stats_chart.jpg?itok=_rPXJYHz)

We can now perform most of the queries on this pandas DataFrame that we can with SQL in databases. For instance, to get all the unique values of the "Description" attribute, the SQL query is:
```
$  SELECT  unique(“Description”)   from   crime_stats;

```

This same query written for a pandas DataFrame looks like this:
```
>>>  crime_stats['Description'].unique()

['COMMON   ASSAULT'   'LARCENY'   'ROBBERY   - STREET'   'AGG.   ASSAULT'

'LARCENY   FROM   AUTO'   'HOMICIDE'   'BURGLARY'   'AUTO   THEFT'

'ROBBERY   - RESIDENCE'   'ROBBERY   - COMMERCIAL'   'ROBBERY   - CARJACKING'

'ASSAULT   BY  THREAT'   'SHOOTING'   'RAPE'   'ARSON']

```

which returns a NumPy array (ndarray):
```
>>>  type(crime_stats['Description'].unique())

<class   'numpy.ndarray'>

```

Next let’s feed this data into a neural network to see how accurately it can predict the type of weapon used, given data such as the time the crime was committed, the type of crime, and the neighborhood in which it happened:
```
>>>  from   sklearn.neural_network   import   MLPClassifier

>>>  import   numpy   as np

>>>

>>>  prediction   =  crime_stats[[‘Weapon’]]

>>>  predictors   =  crime_stats['CrimeTime',   ‘CrimeCode’,   ‘Neighborhood’]

>>>

>>>  nn_model   =  MLPClassifier(solver='lbfgs',   alpha=1e-5,   hidden_layer_sizes=(5,

2),   random_state=1)

>>>

>>>predict_weapon   =  nn_model.fit(prediction,   predictors)

```

Now that the learning model is ready, we can perform several tests to determine its quality and reliability. For starters, let’s feed a training set data (the portion of the original dataset used to train the model and not included in creating the model):
```
>>>  predict_weapon.predict(training_set_weapons)

array([4,   4,   4,   ..., 0,   4,   4])

```

As you can see, it returns a list, with each number predicting the weapon for each of the records in the training set. We see numbers rather than weapon names, as most classification algorithms are optimized with numerical data. For categorical data, there are techniques that can reliably convert attributes into numerical representations. In this case, the technique used is Label Encoding, using the LabelEncoder function in the sklearn preprocessing library: `preprocessing.LabelEncoder()`. It has a function to transform and inverse transform data and their numerical representations. In this example, we can use the `inverse_transform` function of LabelEncoder() to see what Weapons 0 and 4 are:
```
>>>  preprocessing.LabelEncoder().inverse_transform(encoded_weapons)

array(['HANDS',   'FIREARM',   'HANDS',   ..., 'FIREARM',   'FIREARM',   'FIREARM']

```

This is fun to see, but to get an idea of how accurate this model is, let's calculate several scores as percentages:
```
>>>  nn_model.score(X,   y)

0.81999999999999995

```

This shows that our neural network model is ~82% accurate. That result seems impressive, but it is important to check its effectiveness when used on a different crime dataset. There are other tests, like correlations, confusion, matrices, etc., to do this. Although our model has high accuracy, it is not very useful for general crime datasets as this particular dataset has a disproportionate number of rows that list ‘FIREARM’ as the weapon used. Unless it is re-trained, our classifier is most likely to predict ‘FIREARM’, even if the input dataset has a different distribution.

It is important to clean the data and remove outliers and aberrations before we classify it. The better the preprocessing, the better the accuracy of our insights. Also, feeding the model/classifier with too much data to get higher accuracy (generally over ~90%) is a bad idea because it looks accurate but is not useful due to [overfitting][11].

[Jupyter notebooks][12] are a great interactive alternative to the command line. While the CLI is fine for most things, Jupyter shines when you want to run snippets on the go to generate visualizations. It also formats data better than the terminal.

[This article][13] has a list of some of the best free resources for machine learning, but plenty of additional guidance and tutorials are available. You will also find many open datasets available to use, based on your interests and inclinations. As a starting point, the datasets maintained by [Kaggle][14], and those available at state government websites are excellent resources.

Payal Singh will be presenting at SCaLE16x this year, March 8-11 in Pasadena, California. To attend and get 50% of your ticket, [register][15] using promo code **OSDC**

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/getting-started-data-science

作者：[Payal Singh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/payalsingh
[1]:https://www.python.org/
[2]:https://pandas.pydata.org/
[3]:https://keras.io/
[4]:https://www.tensorflow.org/
[5]:http://scikit-learn.org/stable/
[6]:https://www.scipy.org/
[7]:http://www.numpy.org/
[8]:https://matplotlib.org/
[9]:https://matplotlib.org/api/pyplot_api.html
[10]:https://plot.ly/
[11]:https://www.kdnuggets.com/2014/06/cardinal-sin-data-mining-data-science.html
[12]:http://jupyter.org/
[13]:https://machinelearningmastery.com/best-machine-learning-resources-for-getting-started/
[14]:https://www.kaggle.com/
[15]:https://register.socallinuxexpo.org/reg6/
