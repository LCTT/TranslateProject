[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Machine learning made easy with Python)
[#]: via: (https://opensource.com/article/21/1/machine-learning-python)
[#]: author: (Girish Managoli https://opensource.com/users/gammay)

Machine learning made easy with Python
======
Solve real-world machine learning problems with Naïve Bayes classifiers.
![arrows cycle symbol for failing faster][1]

Naïve Bayes is a classification technique that serves as the basis for implementing several classifier modeling algorithms. Naïve Bayes-based classifiers are considered some of the simplest, fastest, and easiest-to-use machine learning techniques, yet are still effective for real-world applications.

Naïve Bayes is based on [Bayes' theorem][2], formulated by 18th-century statistician [Thomas Bayes][3]. This theorem assesses the probability that an event will occur based on conditions related to the event. For example, an individual with [Parkinson's disease][4] typically has voice variations; hence such symptoms are considered related to the prediction of a Parkinson's diagnosis. The original Bayes' theorem provides a method to determine the probability of a target event, and the Naïve variant extends and simplifies this method.

### Solving a real-world problem

This article demonstrates a Naïve Bayes classifier's capabilities to solve a real-world problem (as opposed to a complete business-grade application). I'll assume you have basic familiarity with machine learning (ML), so some of the steps that are not primarily related to ML prediction, such as data shuffling and splitting, are not covered here. If you are an ML beginner or need a refresher, see _[An introduction to machine learning today][5]_ and _[Getting started with open source machine learning][6]_.

The Naïve Bayes classifier is [supervised][7], [generative][8], non-linear, [parametric][9], and [probabilistic][10].

In this article, I'll demonstrate using Naïve Bayes with the example of predicting a Parkinson's diagnosis. The dataset for this example comes from this [UCI Machine Learning Repository][11]. This data includes several speech signal variations to assess the likelihood of the medical condition; this example will use the first eight of them:

  * **MDVP:Fo(Hz):** Average vocal fundamental frequency
  * **MDVP:Fhi(Hz):** Maximum vocal fundamental frequency
  * **MDVP:Flo(Hz):** Minimum vocal fundamental frequency
  * **MDVP:Jitter(%)**, **MDVP:Jitter(Abs)**, **MDVP:RAP**, **MDVP:PPQ**, and **Jitter:DDP:** Five measures of variation in fundamental frequency



The dataset used in this example, shuffled and split for use, is available in my [GitHub repository][12].

### ML with Python

I'll use Python to implement the solution. The software I used for this application is:

  * Python 3.8.2
  * Pandas 1.1.1
  * scikit-learn 0.22.2.post1



There are several open source Naïve Bayes classifier implementations available in Python, including:

  * **NLTK Naïve Bayes:** Based on the standard Naïve Bayes algorithm for text classification
  * **NLTK Positive Naïve Bayes:** A variant of NLTK Naïve Bayes that performs binary classification with partially labeled training sets
  * **Scikit-learn Gaussian Naïve Bayes:** Provides partial fit to support a data stream or very large dataset
  * **Scikit-learn Multinomial Naïve Bayes:** Optimized for discrete data features, example counts, or frequency
  * **Scikit-learn Bernoulli Naïve Bayes:** Designed for binary/Boolean features



I will use [sklearn Gaussian Naive Bayes][13] for this example.

Here is my Python implementation of `naive_bayes_parkinsons.py`:


```
import pandas as pd

# Feature columns we use
x_rows=['MDVP:Fo(Hz)','MDVP:Fhi(Hz)','MDVP:Flo(Hz)',
        'MDVP:Jitter(%)','MDVP:Jitter(Abs)','MDVP:RAP','MDVP:PPQ','Jitter:DDP']
y_rows=['status']

# Train

# Read train data
train_data = pd.read_csv('parkinsons/Data_Parkinsons_TRAIN.csv')
train_x = train_data[x_rows]
train_y = train_data[y_rows]
print("train_x:\n", train_x)
print("train_y:\n", train_y)

# Load sklearn Gaussian Naive Bayes and fit
from sklearn.naive_bayes import GaussianNB

gnb = GaussianNB()
gnb.fit(train_x, train_y)

# Prediction on train data
predict_train = gnb.predict(train_x)
print('Prediction on train data:', predict_train)

# Accuray score on train data
from sklearn.metrics import accuracy_score
accuracy_train = accuracy_score(train_y, predict_train)
print('Accuray score on train data:', accuracy_train)

# Test

# Read test data
test_data = pd.read_csv('parkinsons/Data_Parkinsons_TEST.csv')
test_x = test_data[x_rows]
test_y = test_data[y_rows]

# Prediction on test data
predict_test = gnb.predict(test_x)
print('Prediction on test data:', predict_test)

# Accuracy Score on test data
accuracy_test = accuracy_score(test_y, predict_test)
print('Accuray score on test data:', accuracy_train)
```

Run the Python application:


```
$ python naive_bayes_parkinsons.py

train_x:
      MDVP:Fo(Hz)  MDVP:Fhi(Hz) ...  MDVP:RAP  MDVP:PPQ  Jitter:DDP
0        152.125       161.469  ...   0.00191   0.00226     0.00574
1        120.080       139.710  ...   0.00180   0.00220     0.00540
2        122.400       148.650  ...   0.00465   0.00696     0.01394
3        237.323       243.709  ...   0.00173   0.00159     0.00519
..           ...           ...           ...  ...       ...       ...        
155      138.190       203.522  ...   0.00406   0.00398     0.01218

[156 rows x 8 columns]

train_y:
      status
0         1
1         1
2         1
3         0
..      ...
155       1

[156 rows x 1 columns]

Prediction on train data: [1 1 1 0 ... 1]
Accuracy score on train data: 0.6666666666666666

Prediction on test data: [1 1 1 1 ... 1
 1 1]
Accuracy score on test data: 0.6666666666666666
```

The accuracy scores on the train and test sets are 67% in this example; its performance can be optimized. Do you want to give it a try? If so, share your approach in the comments below.

### Under the hood

The Naïve Bayes classifier is based on Bayes' rule or theorem, which computes conditional probability, or the likelihood for an event to occur when another related event has occurred. Stated in simple terms, it answers the question: _If we know the probability that event x occurred before event y, then what is the probability that y will occur when x occurs again?_ The rule uses a prior-prediction value that is refined gradually to arrive at a final [posterior][14] value. A fundamental assumption of Bayes is that all parameters are of equal importance.

At a high level, the steps involved in Bayes' computation are:

  1. Compute overall posterior probabilities ("Has Parkinson's" and "Doesn't have Parkinson's")
  2. Compute probabilities of posteriors across all values and each possible value of the event
  3. Compute final posterior probability by multiplying the results of #1 and #2 for desired events



Step 2 can be computationally quite arduous. Naïve Bayes simplifies it:

  1. Compute overall posterior probabilities ("Has Parkinson's" and "Doesn't have Parkinson's")
  2. Compute probabilities of posteriors for desired event values
  3. Compute final posterior probability by multiplying the results of #1 and #2 for desired events



This is a very basic explanation, and several other factors must be considered, such as data types, sparse data, missing data, and more.

### Hyperparameters

Naïve Bayes, being a simple and direct algorithm, does not need hyperparameters. However, specific implementations may provide advanced features. For example, [GaussianNB][13] has two:

  * **priors:** Prior probabilities can be specified instead of the algorithm taking the priors from data.
  * **var_smoothing:** This provides the ability to consider data-curve variations, which is helpful when the data does not follow a typical Gaussian distribution.



### Loss functions

Maintaining its philosophy of simplicity, Naïve Bayes uses a [0-1 loss function][15]. If the prediction correctly matches the expected outcome, the loss is 0, and it's 1 otherwise.

### Pros and cons

**Pro:** Naïve Bayes is one of the easiest and fastest algorithms.
**Pro:** Naïve Bayes gives reasonable predictions even with less data.
**Con:** Naïve Bayes predictions are estimates, not precise. It favors speed over accuracy.
**Con:** A fundamental Naïve Bayes assumption is the independence of all features, but this may not always be true.

In essence, Naïve Bayes is an extension of Bayes' theorem. It is one of the simplest and fastest machine learning algorithms, intended for easy and quick training and prediction. Naïve Bayes provides good-enough, reasonably accurate predictions. One of its fundamental assumptions is the independence of prediction features. Several open source implementations are available with traits over and above what are available in the Bayes algorithm.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/machine-learning-python

作者：[Girish Managoli][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gammay
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_progress_cycle_momentum_arrow.png?itok=q-ZFa_Eh (arrows cycle symbol for failing faster)
[2]: https://en.wikipedia.org/wiki/Bayes%27_theorem
[3]: https://en.wikipedia.org/wiki/Thomas_Bayes
[4]: https://en.wikipedia.org/wiki/Parkinson%27s_disease
[5]: https://opensource.com/article/17/9/introduction-machine-learning
[6]: https://opensource.com/business/15/9/getting-started-open-source-machine-learning
[7]: https://en.wikipedia.org/wiki/Supervised_learning
[8]: https://en.wikipedia.org/wiki/Generative_model
[9]: https://en.wikipedia.org/wiki/Parametric_model
[10]: https://en.wikipedia.org/wiki/Probabilistic_classification
[11]: https://archive.ics.uci.edu/ml/datasets/parkinsons
[12]: https://github.com/gammay/Machine-learning-made-easy-Naive-Bayes/tree/main/parkinsons
[13]: https://scikit-learn.org/stable/modules/generated/sklearn.naive_bayes.GaussianNB.html
[14]: https://en.wikipedia.org/wiki/Posterior_probability
[15]: https://en.wikipedia.org/wiki/Loss_function#0-1_loss_function
