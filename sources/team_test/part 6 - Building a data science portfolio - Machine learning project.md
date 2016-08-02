
### Making predictions

Now that we have the preliminaries out of the way, we’re ready to make predictions. We’ll create a new file called predict.py that will use the train.csv file we created in the last step. The below code will:

- Import needed libraries.
- Create a function called cross_validate that:
    - Creates a logistic regression classifier with the right keyword arguments.
    - Creates a list of columns that we want to use to train the model, removing id and foreclosure_status.
    - Run cross validation across the train DataFrame.
    - Return the predictions.


```
import os
import settings
import pandas as pd
from sklearn import cross_validation
from sklearn.linear_model import LogisticRegression
from sklearn import metrics

def cross_validate(train):
    clf = LogisticRegression(random_state=1, class_weight="balanced")

    predictors = train.columns.tolist()
    predictors = [p for p in predictors if p not in settings.NON_PREDICTORS]

    predictions = cross_validation.cross_val_predict(clf, train[predictors], train[settings.TARGET], cv=settings.CV_FOLDS)
    return predictions
```

### Predicting error

Now, we just need to write a few functions to compute error. The below code will:

- Create a function called compute_error that:
    - Uses scikit-learn to compute a simple accuracy score (the percentage of predictions that matched the actual foreclosure_status values).
- Create a function called compute_false_negatives that:
    - Combines the target and the predictions into a DataFrame for convenience.
    - Finds the false negative rate.
- Create a function called compute_false_positives that:
    - Combines the target and the predictions into a DataFrame for convenience.
    - Finds the false positive rate.
        - Finds the number of loans that weren’t foreclosed on that the model predicted would be foreclosed on.
        - Divide by the total number of loans that weren’t foreclosed on.

```
def compute_error(target, predictions):
    return metrics.accuracy_score(target, predictions)

def compute_false_negatives(target, predictions):
    df = pd.DataFrame({"target": target, "predictions": predictions})
    return df[(df["target"] == 1) & (df["predictions"] == 0)].shape[0] / (df[(df["target"] == 1)].shape[0] + 1)

def compute_false_positives(target, predictions):
    df = pd.DataFrame({"target": target, "predictions": predictions})
    return df[(df["target"] == 0) & (df["predictions"] == 1)].shape[0] / (df[(df["target"] == 0)].shape[0] + 1)
```


### Putting it all together

Now, we just have to put the functions together in predict.py. The below code will:

- Read in the dataset.
- Compute cross validated predictions.
- Compute the 3 error metrics above.
- Print the error metrics.

```
def read():
    train = pd.read_csv(os.path.join(settings.PROCESSED_DIR, "train.csv"))
    return train
    
if __name__ == "__main__":
    train = read()
    predictions = cross_validate(train)
    error = compute_error(train[settings.TARGET], predictions)
    fn = compute_false_negatives(train[settings.TARGET], predictions)
    fp = compute_false_positives(train[settings.TARGET], predictions)
    print("Accuracy Score: {}".format(error))
    print("False Negatives: {}".format(fn))
    print("False Positives: {}".format(fp))
```

Once you’ve added the code, you can run python predict.py to generate predictions. Running everything shows that our false negative rate is .26, which means that of the foreclosed loans, we missed predicting 26% of them. This is a good start, but can use a lot of improvement!

You can find the complete predict.py file [here][41].

Your file tree should now look like this:

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
├── predict.py
├── README.md
├── requirements.txt
├── settings.py
```

### Writing up a README

Now that we’ve finished our end to end project, we just have to write up a README.md file so that other people know what we did, and how to replicate it. A typical README.md for a project should include these sections:

- A high level overview of the project, and what the goals are.
- Where to download any needed data or materials.
- Installation instructions.
    - How to install the requirements.
- Usage instructions.
    - How to run the project.
    - What you should see after each step.
- How to contribute to the project.
    - Good next steps for extending the project.

[Here’s][42] a sample README.md for this project.

### Next steps

Congratulations, you’re done making an end to end machine learning project! You can find a complete example project [here][43]. It’s a good idea to upload your project to [Github][44] once you’ve finished it, so others can see it as part of your portfolio.

There are still quite a few angles left to explore with this data. Broadly, we can split them up into 3 categories – extending this project and making it more accurate, finding other columns to predict, and exploring the data. Here are some ideas:

- Generate more features in annotate.py.
- Switch algorithms in predict.py.
- Try using more data from Fannie Mae than we used in this post.
- Add in a way to make predictions on future data. The code we wrote will still work if we add more data, so we can add more past or future data.
- Try seeing if you can predict if a bank should have issued the loan originally (vs if Fannie Mae should have acquired the loan).
    - Remove any columns from train that the bank wouldn’t have known at the time of issuing the loan.
        - Some columns are known when Fannie Mae bought the loan, but not before.
    - Make predictions.
- Explore seeing if you can predict columns other than foreclosure_status.
    - Can you predict how much the property will be worth at sale time?
- Explore the nuances between performance updates.
    - Can you predict how many times the borrower will be late on payments?
    - Can you map out the typical loan lifecycle?
- Map out data on a state by state or zip code by zip code level.
    - Do you see any interesting patterns?

If you build anything interesting, please let us know in the comments!

If you liked this, you might like to read the other posts in our ‘Build a Data Science Porfolio’ series:

- [Storytelling with data][45].
- [How to setup up a data science blog][46].
