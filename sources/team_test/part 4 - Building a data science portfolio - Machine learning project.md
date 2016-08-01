### Computing values from the performance data

The next step we’ll take is to calculate some values from processed/Performance.txt. All we want to do is to predict whether or not a property is foreclosed on. To figure this out, we just need to check if the performance data associated with a loan ever has a foreclosure_date. If foreclosure_date is None, then the property was never foreclosed on. In order to avoid including loans with little performance history in our sample, we’ll also want to count up how many rows exist in the performance file for each loan. This will let us filter loans without much performance history from our training data.

One way to think of the loan data and the performance data is like this:

![](https://github.com/LCTT/wiki-images/blob/master/TranslateProject/ref_img/001.png)

As you can see above, each row in the Acquisition data can be related to multiple rows in the Performance data. In the Performance data, foreclosure_date will appear in the quarter when the foreclosure happened, so it should be blank prior to that. Some loans are never foreclosed on, so all the rows related to them in the Performance data have foreclosure_date blank.

We need to compute foreclosure_status, which is a Boolean that indicates whether a particular loan id was ever foreclosed on, and performance_count, which is the number of rows in the performance data for each loan id.

There are a few different ways to compute the counts we want:

- We could read in all the performance data, then use the Pandas groupby method on the DataFrame to figure out the number of rows associated with each loan id, and also if the foreclosure_date is ever not None for the id.
    - The upside of this method is that it’s easy to implement from a syntax perspective.
    - The downside is that reading in all 129236094 lines in the data will take a lot of memory, and be extremely slow.
- We could read in all the performance data, then use apply on the acquisition DataFrame to find the counts for each id.
    - The upside is that it’s easy to conceptualize.
    - The downside is that reading in all 129236094 lines in the data will take a lot of memory, and be extremely slow.
- We could iterate over each row in the performance dataset, and keep a separate dictionary of counts.
    - The upside is that the dataset doesn’t need to be loaded into memory, so it’s extremely fast and memory-efficient.
    - The downside is that it will take slightly longer to conceptualize and implement, and we need to parse the rows manually.

Loading in all the data will take quite a bit of memory, so let’s go with the third option above. All we need to do is to iterate through all the rows in the Performance data, while keeping a dictionary of counts per loan id. In the dictionary, we’ll keep track of how many times the id appears in the performance data, as well as if foreclosure_date is ever not None. This will give us foreclosure_status and performance_count.

We’ll create a new file called annotate.py, and add in code that will enable us to compute these values. In the below code, we’ll:

- Import needed libraries.
- Define a function called count_performance_rows.
    - Open processed/Performance.txt. This doesn’t read the file into memory, but instead opens a file handler that can be used to read in the file line by line.
    - Loop through each line in the file.
    - Split the line on the delimiter (|)
    - Check if the loan_id is not in the counts dictionary.
        - If not, add it to counts.
    - Increment performance_count for the given loan_id because we’re on a row that contains it.
    - If date is not None, then we know that the loan was foreclosed on, so set foreclosure_status appropriately.

```
import os
import settings
import pandas as pd

def count_performance_rows():
    counts = {}
    with open(os.path.join(settings.PROCESSED_DIR, "Performance.txt"), 'r') as f:
        for i, line in enumerate(f):
            if i == 0:
                # Skip header row
                continue
            loan_id, date = line.split("|")
            loan_id = int(loan_id)
            if loan_id not in counts:
                counts[loan_id] = {
                    "foreclosure_status": False,
                    "performance_count": 0
                }
            counts[loan_id]["performance_count"] += 1
            if len(date.strip()) > 0:
                counts[loan_id]["foreclosure_status"] = True
    return counts
```

### Getting the values

Once we create our counts dictionary, we can make a function that will extract values from the dictionary if a loan_id and a key are passed in:

```
def get_performance_summary_value(loan_id, key, counts):
    value = counts.get(loan_id, {
        "foreclosure_status": False,
        "performance_count": 0
    })
    return value[key]
```

The above function will return the appropriate value from the counts dictionary, and will enable us to assign a foreclosure_status value and a performance_count value to each row in the Acquisition data. The [get][33] method on dictionaries returns a default value if a key isn’t found, so this enables us to return sensible default values if a key isn’t found in the counts dictionary.



