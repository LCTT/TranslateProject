翻译完成－－by zky001
### Acquiring the data

Once we have the skeleton of our project, we can get the raw data.

Fannie Mae has some restrictions around acquiring the data, so you’ll need to sign up for an account. You can find the download page [here][26]. After creating an account, you’ll be able to download as few or as many loan data files as you want. The files are in zip format, and are reasonably large after decompression.

For the purposes of this blog post, we’ll download everything from Q1 2012 to Q1 2015, inclusive. We’ll then need to unzip all of the files. After unzipping the files, remove the original .zip files. At the end, the loan-prediction folder should look something like this:

```
loan-prediction
├── data
│   ├── Acquisition_2012Q1.txt
│   ├── Acquisition_2012Q2.txt
│   ├── Performance_2012Q1.txt
│   ├── Performance_2012Q2.txt
│   └── ...
├── processed
├── .gitignore
├── README.md
├── requirements.txt
├── settings.py
```

After downloading the data, you can use the head and tail shell commands to look at the lines in the files. Do you see any columns that aren’t needed? It might be useful to consult the [pdf of column names][27] while doing this.

### Reading in the data

There are two issues that make our data hard to work with right now:

- The acquisition and performance datasets are segmented across multiple files.
- Each file is missing headers.

Before we can get started on working with the data, we’ll need to get to the point where we have one file for the acquisition data, and one file for the performance data. Each of the files will need to contain only the columns we care about, and have the proper headers. One wrinkle here is that the performance data is quite large, so we should try to trim some of the columns if we can.

The first step is to add some variables to settings.py, which will contain the paths to our raw data and our processed data. We’ll also add a few other settings that will be useful later on:

```
DATA_DIR = "data"
PROCESSED_DIR = "processed"
MINIMUM_TRACKING_QUARTERS = 4
TARGET = "foreclosure_status"
NON_PREDICTORS = [TARGET, "id"]
CV_FOLDS = 3
```

Putting the paths in settings.py will put them in a centralized place and make them easy to change down the line. When referring to the same variables in multiple files, it’s easier to put them in a central place than edit them in every file when you want to change them. [Here’s][28] an example settings.py file for this project.

The second step is to create a file called assemble.py that will assemble all the pieces into 2 files. When we run python assemble.py, we’ll get 2 data files in the processed directory.

We’ll then start writing code in assemble.py. We’ll first need to define the headers for each file, so we’ll need to look at [pdf of column names][29] and create lists of the columns in each Acquisition and Performance file:

```
HEADERS = {
    "Acquisition": [
        "id",
        "channel",
        "seller",
        "interest_rate",
        "balance",
        "loan_term",
        "origination_date",
        "first_payment_date",
        "ltv",
        "cltv",
        "borrower_count",
        "dti",
        "borrower_credit_score",
        "first_time_homebuyer",
        "loan_purpose",
        "property_type",
        "unit_count",
        "occupancy_status",
        "property_state",
        "zip",
        "insurance_percentage",
        "product_type",
        "co_borrower_credit_score"
    ],
    "Performance": [
        "id",
        "reporting_period",
        "servicer_name",
        "interest_rate",
        "balance",
        "loan_age",
        "months_to_maturity",
        "maturity_date",
        "msa",
        "delinquency_status",
        "modification_flag",
        "zero_balance_code",
        "zero_balance_date",
        "last_paid_installment_date",
        "foreclosure_date",
        "disposition_date",
        "foreclosure_costs",
        "property_repair_costs",
        "recovery_costs",
        "misc_costs",
        "tax_costs",
        "sale_proceeds",
        "credit_enhancement_proceeds",
        "repurchase_proceeds",
        "other_foreclosure_proceeds",
        "non_interest_bearing_balance",
        "principal_forgiveness_balance"
    ]
}
```

The next step is to define the columns we want to keep. Since all we’re measuring on an ongoing basis about the loan is whether or not it was ever foreclosed on, we can discard many of the columns in the performance data. We’ll need to keep all the columns in the acquisition data, though, because we want to maximize the information we have about when the loan was acquired (after all, we’re predicting if the loan will ever be foreclosed or not at the point it’s acquired). Discarding columns will enable us to save disk space and memory, while also speeding up our code.

```
SELECT = {
    "Acquisition": HEADERS["Acquisition"],
    "Performance": [
        "id",
        "foreclosure_date"
    ]
}
```

Next, we’ll write a function to concatenate the data sets. The below code will:

- Import a few needed libraries, including settings.
- Define a function concatenate, that:
    - Gets the names of all the files in the data directory.
    - Loops through each file.
        - If the file isn’t the right type (doesn’t start with the prefix we want), we ignore it.
        - Reads the file into a [DataFrame][30] with the right settings using the Pandas [read_csv][31] function.
            - Sets the separator to | so the fields are read in correctly.
            - The data has no header row, so sets header to None to indicate this.
            - Sets names to the right value from the HEADERS dictionary – these will be the column names of our DataFrame.
            - Picks only the columns from the DataFrame that we added in SELECT.
- Concatenates all the DataFrames together.
- Writes the concatenated DataFrame back to a file.

```
import os
import settings
import pandas as pd

def concatenate(prefix="Acquisition"):
    files = os.listdir(settings.DATA_DIR)
    full = []
    for f in files:
        if not f.startswith(prefix):
            continue

        data = pd.read_csv(os.path.join(settings.DATA_DIR, f), sep="|", header=None, names=HEADERS[prefix], index_col=False)
        data = data[SELECT[prefix]]
        full.append(data)

    full = pd.concat(full, axis=0)

    full.to_csv(os.path.join(settings.PROCESSED_DIR, "{}.txt".format(prefix)), sep="|", header=SELECT[prefix], index=False)
```

We can call the above function twice with the arguments Acquisition and Performance to concatenate all the acquisition and performance files together. The below code will:

- Only execute if the script is called from the command line with python assemble.py.
- Concatenate all the files, and result in two files:
    - `processed/Acquisition.txt`
    - `processed/Performance.txt`

```
if __name__ == "__main__":
    concatenate("Acquisition")
    concatenate("Performance")
```

We now have a nice, compartmentalized assemble.py that’s easy to execute, and easy to build off of. By decomposing the problem into pieces like this, we make it easy to build our project. Instead of one messy script that does everything, we define the data that will pass between the scripts, and make them completely separate from each other. When you’re working on larger projects, it’s a good idea to do this, because it makes it much easier to change individual pieces without having unexpected consequences on unrelated pieces of the project.

Once we finish the assemble.py script, we can run python assemble.py. You can find the complete assemble.py file [here][32].

This will result in two files in the processed directory:

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
├── .gitignore
├── assemble.py
├── README.md
├── requirements.txt
├── settings.py
```
