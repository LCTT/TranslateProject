### Annotating the data

We’ve already added a few functions to annotate.py, but now we can get into the meat of the file. We’ll need to convert the acquisition data into a training dataset that can be used in a machine learning algorithm. This involves a few things:

- Converting all columns to numeric.
- Filling in any missing values.
- Assigning a performance_count and a foreclosure_status to each row.
- Removing any rows that don’t have a lot of performance history (where performance_count is low).

Several of our columns are strings, which aren’t useful to a machine learning algorithm. However, they are actually categorical variables, where there are a few different category codes, like R, S, and so on. We can convert these columns to numeric by assigning a number to each category label:

![](https://github.com/LCTT/wiki-images/blob/master/TranslateProject/ref_img/002.png)

Converting the columns this way will allow us to use them in our machine learning algorithm.

Some of the columns also contain dates (first_payment_date and origination_date). We can split these dates into 2 columns each:

![](https://github.com/LCTT/wiki-images/blob/master/TranslateProject/ref_img/003.png)
In the below code, we’ll transform the Acquisition data. We’ll define a function that:

- Creates a foreclosure_status column in acquisition by getting the values from the counts dictionary.
- Creates a performance_count column in acquisition by getting the values from the counts dictionary.
- Converts each of the following columns from a string column to an integer column:
    - channel
    - seller
    - first_time_homebuyer
    - loan_purpose
    - property_type
    - occupancy_status
    - property_state
    - product_type
- Converts first_payment_date and origination_date to 2 columns each:
    - Splits the column on the forward slash.
    - Assigns the first part of the split list to a month column.
    - Assigns the second part of the split list to a year column.
    - Deletes the column.
    - At the end, we’ll have first_payment_month, first_payment_year, origination_month, and origination_year.
- Fills any missing values in acquisition with -1.

```
def annotate(acquisition, counts):
    acquisition["foreclosure_status"] = acquisition["id"].apply(lambda x: get_performance_summary_value(x, "foreclosure_status", counts))
    acquisition["performance_count"] = acquisition["id"].apply(lambda x: get_performance_summary_value(x, "performance_count", counts))
    for column in [
        "channel",
        "seller",
        "first_time_homebuyer",
        "loan_purpose",
        "property_type",
        "occupancy_status",
        "property_state",
        "product_type"
    ]:
        acquisition[column] = acquisition[column].astype('category').cat.codes

    for start in ["first_payment", "origination"]:
        column = "{}_date".format(start)
        acquisition["{}_year".format(start)] = pd.to_numeric(acquisition[column].str.split('/').str.get(1))
        acquisition["{}_month".format(start)] = pd.to_numeric(acquisition[column].str.split('/').str.get(0))
        del acquisition[column]

    acquisition = acquisition.fillna(-1)
    acquisition = acquisition[acquisition["performance_count"] > settings.MINIMUM_TRACKING_QUARTERS]
    return acquisition
```

### Pulling everything together

We’re almost ready to pull everything together, we just need to add a bit more code to annotate.py. In the below code, we:

- Define a function to read in the acquisition data.
- Define a function to write the processed data to processed/train.csv
- If this file is called from the command line, like python annotate.py:
    - Read in the acquisition data.
    - Compute the counts for the performance data, and assign them to counts.
    - Annotate the acquisition DataFrame.
    - Write the acquisition DataFrame to train.csv.

```
def read():
    acquisition = pd.read_csv(os.path.join(settings.PROCESSED_DIR, "Acquisition.txt"), sep="|")
    return acquisition
    
def write(acquisition):
    acquisition.to_csv(os.path.join(settings.PROCESSED_DIR, "train.csv"), index=False)

if __name__ == "__main__":
    acquisition = read()
    counts = count_performance_rows()
    acquisition = annotate(acquisition, counts)
    write(acquisition)
```

Once you’re done updating the file, make sure to run it with python annotate.py, to generate the train.csv file. You can find the complete annotate.py file [here][34].

The folder should now look like this:

```
loan-prediction
├── data
│   ├── Acquisition_2012Q1.txt
│   ├── Acquisition_2012Q2.txt
│   ├── Performance_2012Q1.txt
│   ├── Performance_2012Q2.txt
│   └── ...
├── processed
│   ├── Acquisition.txt
│   ├── Performance.txt
│   ├── train.csv
├── .gitignore
├── annotate.py
├── assemble.py
├── README.md
├── requirements.txt
├── settings.py
```

### Finding an error metric

We’re done with generating our training dataset, and now we’ll just need to do the final step, generating predictions. We’ll need to figure out an error metric, as well as how we want to evaluate our data. In this case, there are many more loans that aren’t foreclosed on than are, so typical accuracy measures don’t make much sense.

If we read in the training data, and check the counts in the foreclosure_status column, here’s what we get:

```
import pandas as pd
import settings

train = pd.read_csv(os.path.join(settings.PROCESSED_DIR, "train.csv"))
train["foreclosure_status"].value_counts()
```

```
False    4635982
True        1585
Name: foreclosure_status, dtype: int64
```

Since so few of the loans were foreclosed on, just checking the percentage of labels that were correctly predicted will mean that we can make a machine learning model that predicts False for every row, and still gets a very high accuracy. Instead, we’ll want to use a metric that takes the class imbalance into account, and ensures that we predict foreclosures accurately. We don’t want too many false positives, where we make predict that a loan will be foreclosed on even though it won’t, or too many false negatives, where we predict that a loan won’t be foreclosed on, but it is. Of these two, false negatives are more costly for Fannie Mae, because they’re buying loans where they may not be able to recoup their investment.

We’ll define false negative rate as the number of loans where the model predicts no foreclosure but the the loan was actually foreclosed on, divided by the number of total loans that were actually foreclosed on. This is the percentage of actual foreclosures that the model “Missed”. Here’s a diagram:

![](https://github.com/LCTT/wiki-images/blob/master/TranslateProject/ref_img/004.png)

In the diagram above, 1 loan was predicted as not being foreclosed on, but it actually was. If we divide this by the number of loans that were actually foreclosed on, 2, we get the false negative rate, 50%. We’ll use this as our error metric, so we can evaluate our model’s performance.

### Setting up the classifier for machine learning

We’ll use cross validation to make predictions. With cross validation, we’ll divide our data into 3 groups. Then we’ll do the following:

- Train a model on groups 1 and 2, and use the model to make predictions for group 3.
- Train a model on groups 1 and 3, and use the model to make predictions for group 2.
- Train a model on groups 2 and 3, and use the model to make predictions for group 1.

Splitting it up into groups this way means that we never train a model using the same data we’re making predictions for. This avoids overfitting. If we overfit, we’ll get a falsely low false negative rate, which makes it hard to improve our algorithm or use it in the real world.

[Scikit-learn][35] has a function called [cross_val_predict][36] which will make it easy to perform cross validation.

We’ll also need to pick an algorithm to use to make predictions. We need a classifier that can do [binary classification][37]. The target variable, foreclosure_status only has two values, True and False.

We’ll use [logistic regression][38], because it works well for binary classification, runs extremely quickly, and uses little memory. This is due to how the algorithm works – instead of constructing dozens of trees, like a random forest, or doing expensive transformations, like a support vector machine, logistic regression has far fewer steps involving fewer matrix operations.

We can use the [logistic regression classifier][39] algorithm that’s implemented in scikit-learn. The only thing we need to pay attention to is the weights of each class. If we weight the classes equally, the algorithm will predict False for every row, because it is trying to minimize errors. However, we care much more about foreclosures than we do about loans that aren’t foreclosed on. Thus, we’ll pass balanced to the class_weight keyword argument of the [LogisticRegression][40] class, to get the algorithm to weight the foreclosures more to account for the difference in the counts of each class. This will ensure that the algorithm doesn’t predict False for every row, and instead is penalized equally for making errors in predicting either class.




