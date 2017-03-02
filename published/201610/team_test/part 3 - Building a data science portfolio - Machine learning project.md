### 获取数据

一旦我们拥有项目的基本架构，我们就可以去获得原始数据

Fannie Mae 对获取数据有一些限制，所有你需要去注册一个账户。在创建完账户之后，你可以找到下载页面[在这里][26]，你可以按照你所需要的下载非常少量或者很多的借款数据文件。文件格式是zip，在解压后当然是非常大的。

为了达到我们这个博客文章的目的，我们将要下载从2012年1季度到2015
年1季度的所有数据。接着我们需要解压所有的文件。解压过后，删掉原来的.zip格式的文件。最后，借款预测文件夹看起来应该像下面的一样：
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

在下载完数据后，你可以在shell命令行中使用head和tail命令去查看文件中的行数据，你看到任何的不需要的列数据了吗？在做这件事的同时查阅[列名称的pdf文件][27]可能是有用的事情。
### 读入数据

有两个问题让我们的数据难以现在就使用：
- 收购数据和业绩数据被分割在多个文件中
- 每个文件都缺少标题

在我们开始使用数据之前，我们需要首先明白我们要在哪里去存一个收购数据的文件，同时到哪里去存储一个业绩数据的文件。每个文件仅仅需要包括我们关注的那些数据列，同时拥有正确的标题。这里有一个小问题是业绩数据非常大，因此我们需要尝试去修剪一些数据列。

第一步是向settings.py文件中增加一些变量，这个文件中同时也包括了我们原始数据的存放路径和处理出的数据存放路径。我们同时也将添加其他一些可能在接下来会用到的设置数据：
```
DATA_DIR = "data"
PROCESSED_DIR = "processed"
MINIMUM_TRACKING_QUARTERS = 4
TARGET = "foreclosure_status"
NON_PREDICTORS = [TARGET, "id"]
CV_FOLDS = 3
```

把路径设置在settings.py中将使它们放在一个集中的地方，同时使其修改更加的容易。当提到在多个文件中的相同的变量时，你想改变它的话，把他们放在一个地方比分散放在每一个文件时更加容易。[这里的][28]是一个这个工程的示例settings.py文件

第二步是创建一个文件名为assemble.py，它将所有的数据分为2个文件。当我们运行Python assemble.py，我们在处理数据文件的目录会获得2个数据文件。

接下来我们开始写assemble.py文件中的代码。首先我们需要为每个文件定义相应的标题，因此我们需要查看[列名称的pdf文件][29]同时创建在每一个收购数据和业绩数据的文件的列数据的列表：
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


接下来一步是定义我们想要保持的数据列。我们将需要保留收购数据中的所有列数据，丢弃列数据将会使我们节省下内存和硬盘空间，同时也会加速我们的代码。
```
SELECT = {
    "Acquisition": HEADERS["Acquisition"],
    "Performance": [
        "id",
        "foreclosure_date"
    ]
}
```

下一步，我们将编写一个函数来连接数据集。下面的代码将：
- 引用一些需要的库，包括设置。
- 定义一个函数concatenate, 目的是:
    - 获取到所有数据目录中的文件名.
    - 在每个文件中循环.
        - 如果文件不是正确的格式 (不是以我们需要的格式作为开头), 我们将忽略它.
        - 把文件读入一个[数据帧][30] 伴随着正确的设置通过使用Pandas [读取csv][31]函数.
            - 在｜处设置分隔符以便所有的字段能被正确读出.
            - 数据没有标题行，因此设置标题为None来进行标示.
            - 从HEADERS字典中设置正确的标题名称 – 这将会是我们数据帧中的数据列名称.
            - 通过SELECT来选择我们加入数据的数据帧中的列.
- 把所有的数据帧共同连接在一起.
- 把已经连接好的数据帧写回一个文件.

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

我们可以通过调用上面的函数，通过传递的参数收购和业绩两次以将所有收购和业绩文件连接在一起。下面的代码将：
- 仅仅在脚本被在命令行中通过python assemble.py被唤起而执行.
- 将所有的数据连接在一起，并且产生2个文件:
    - `processed/Acquisition.txt`
    - `processed/Performance.txt`

```
if __name__ == "__main__":
    concatenate("Acquisition")
    concatenate("Performance")
```

我们现在拥有了一个漂亮的，划分过的assemble.py文件，它很容易执行，也容易被建立。通过像这样把问题分解为一块一块的，我们构建工程就会变的容易许多。不用一个可以做所有的凌乱的脚本，我们定义的数据将会在多个脚本间传递，同时使脚本间完全的0耦合。当你正在一个大的项目中工作，这样做是一个好的想法，因为这样可以更佳容易的修改其中的某一部分而不会引起其他项目中不关联部分产生超出预期的结果。

一旦我们完成assemble.py脚本文件, 我们可以运行python assemble.py命令. 你可以查看完整的assemble.py文件[在这里][32].

这将会在处理结果目录下产生2个文件:

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

