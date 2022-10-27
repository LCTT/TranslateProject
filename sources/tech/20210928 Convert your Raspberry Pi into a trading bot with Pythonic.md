[#]: subject: "Convert your Raspberry Pi into a trading bot with Pythonic"
[#]: via: "https://opensource.com/article/21/9/raspberry-pi-trading-bot"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Convert your Raspberry Pi into a trading bot with Pythonic
======
Reduce your power consumption by setting up your cryptocurrency trading
bot on a Raspberry Pi.
![A dollar sign in a network][1]

The current popularity of cryptocurrencies also includes trading in them. Last year, I wrote an article *[How to automate your cryptocurrency trades with Python][2] *which covered the setup of a trading bot based on the graphical programming framework [Pythonic][3], which I developed in my leisure. At that time, you still needed a desktop system based on x86 to run Pythonic. In the meantime, I have reconsidered the concept (web-based GUI). Today, it is possible to run Pythonic on a Raspberry Pi, which mainly benefits the power consumption because such a trading bot has to be constantly switched on.

That previous article is still valid. If you want to create a trading bot based on the old version of Pythonic (0._x_), you can install it with `pip3 install Pythonic==0.19`.

This article covers the setup of a trading bot running on a Raspberry Pi and executing a trading algorithm based on the [EMA crossover strategy][4].

### Install Pythonic on your Raspberry Pi

Here, I only briefly touch on the subject of installation because you can find detailed installation instructions for Pythonic in my last article [_Control your Raspberry Pi remotely with your smartphone_][5]. In a nutshell: Download the Raspberry Pi image from [sourceforge.net][6] and flash it on the SD card.

The PythonicRPI image has no preinstalled graphical desktop, so to proceed, you should be able to access the programming web GUI (http : //PythonicRPI:7000/):

![Pythonic GUI overview][7]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

#### Example code

Download the example code for the trading bot from [GitHub][9] (direct download link) and unzip the archive. The archive contains three different file types:

  * `\*.py-files`: Contains the actual implementation of certain functionality
  * `current_config.json`: This file describes the configured elements, the links between the elements, and the variable configuration of elements
  * `jupyter/backtest.ipynb`: A [Jupyter][10] notebook for backtesting
  * `jupyter/ADAUSD_5m.df`: A minimal OHLCV dataset which I use in this example



With the green outlined button, upload the `current_config.json` to the Raspberry Pi. You can upload only valid configuration files. With the yellow outlined button, upload all the `\*.py `files. 

![Upload toolbar buttons][11]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

The `\*.py `files are uploaded to `/home/pythonic/Pythonic/executables` whereas the `current_config.json` is uploaded to `/home/pythonic/Pythonic/current_config.json`. After uploading the `current_config.json`, you should see a screen like this:

![Pythonic screen after upload of config.json][12]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

Now I'll go step-by-step through each part of the trading bot.

### Data acquisition

Like in the last article, I begin with the data acquisition:

![Pythonic area 2 data acquisition ][13]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

The data acquisition can be found on the **Area 2** tab and runs independently from the rest of the bot. It implements the following functionality:

  * **AcqusitionScheduler**: Trigger subsequent elements every five minutes
  * **OHLCV_Query**: Prepares the OHLCV query method
  * **KrakenConnector**: Establishes a connection with the Kraken cryptocurrency exchange
  * **DataCollector**: Collect and process the new OHLCV data



The _DataCollector_ gets a Python list of OHLCV data with a prefixed timestamp and converts it into a [Pandas DataFrame][14]. Pandas is a popular library for data analysis and manipulation. A _DataFrame_ is the base type for data of any kind to which arithmetic operation can be applied.

The task of the DataCollector (`generic_pipe_3e059017.py`) is to load an existing DataFrame from file, append the latest OHLCV data, and save it back to file. 


```
import time, queue
import pandas as pd
from pathlib import Path

try:
    from element_types import Record, Function, ProcCMD, GuiCMD
except ImportError:
    from Pythonic.element_types import Record, Function, ProcCMD, GuiCMD

class Element(Function):

    def __init__(self, id, config, inputData, return_queue, cmd_queue):
        super().__init__(id, config, inputData, return_queue, cmd_queue)
        
    def execute(self):
        df_in = pd.DataFrame(self.inputData, columns=['close_time', 'open', 'high', 'low', 'close', 'volume'])
        df_in['close_time'] = df_in['close_time'].floordiv(1000) # remove milliseconds from timestamp

        file_path = Path.home() / 'Pythonic' / 'executables' / 'ADAUSD_5m.df'

        try:
            # load existing dataframe
            df = pd.read_pickle(file_path)
            # count existing rows
            n_row_cnt = df.shape[0]
            # concat latest OHLCV data
            df = pd.concat([df,df_in], ignore_index=True).drop_duplicates(['close_time'])
            # reset the index
            df.reset_index(drop=True, inplace=True)
            # calculate number of new rows
            n_new_rows = df.shape[0] - n_row_cnt
            log_txt = '{}: {} new rows written'.format(file_path, n_new_rows)

        except Exception as e:
            log_txt = 'File error - writing new one'
            df = df_in 
            
        # save dataframe to file
        df.to_pickle(file_path)

        logInfo = Record(None, log_txt)
        self.return_queue.put(logInfo)
```

This code is executed every full five minutes as the OHLCV data is also in 5-minute intervals.

By default, the _OHLCV_Query_ element only downloads the dataset for the latest period. To have some data for developing the trading algorithm, right-click the **OHLCV_Query** element to open the configuration, set the _Limit_ to 500, and trigger the **AcquisitionScheduler**. This causes the download of 500 OHLCV values:

![OHLCV_Query configuration][15]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

### Trading strategy

Our trading strategy will be the popular [EMA crossover strategy][4]. The EMA indicator is a weighted moving average over the last _n_ close prices that gives more weight to recent price data. You calculate two EMA series, one for a longer period (for example, _n_ = 21, blue line) and one for a shorter period (for example, _n_ = 10, yellow line). 

![Pythonic trading data graph][16]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

The bot should place a buy order (green circle) when the shorter-term EMA crosses above the longer-term EMA. The bot should place a sell order when the shorter-term EMA crosses below the longer-term EMA (orange circle).

### Backtesting with Jupyter

The example code on [GitHub][9] (direct download link) also contains a [Jupyter Notebook][10] file (`backtesting.ipynb`)  which you use to test and develop the trading algorithm.

**Note:** Jupyter is not preinstalled on the Pythonic Raspberry Pi image. You can either install it also on the Raspberry Pi or install it on your regular PC. I  recommend the latter, as you will do some number crunching that is much faster on an ordinary x86 CPU.

Start Jupyter and open the notebook. Make sure to have a DataFrame, downloaded by the _DataCollector_, available. With **Shift**+**Enter**, you can execute each cell individually. After executing the first three cells, you should get an output like this:

![Output after executing the first three cells][17]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

Now calculate the EMA-10 and EMA-21 values. Luckily, pandas offers you the `ewm` function, which does exactly what is needed. The EMA values are added as separate columns to the DataFrame:

![EMA values added as separate columns to dataframe][18]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

To determine if a buy or sell condition is met, you have to consider these four variables:

  * **emaLong0**: Current long-term (_ema-21_) EMA value
  * **emaLong1**: Last long-term (_ema-21_) EMA value (the value before emaLong0)
  * **emaShort0**: Current short-term (_ema-10_) EMA value
  * **emaShort1**: Last short-term (_ema-10_) EMA value (the value before emaShort0)



When the following situation comes into effect, a buy condition is met:

![Buy condition met][19]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

In Python code:


```
`emaLong1 > emaShort1 and emaShort0 > emaLong0`
```

A sell condition is met in the following situation:

![Sell condition met][20]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

In Python code:


```
`emaShort1 > emaLong1 and emaLong0 > emaShort0`
```

To test the DataFrame and evaluate the possible profit you could make, you could either iterate over each row and test for these conditions or, with a smarter approach, filter the dataset to only the relevant rows with built-in methods from Pandas.

Under the hood, Pandas uses [NumPy][21], which is the method of choice for fast and efficient data operation on arrays. This is, of course, convenient because the later use is to take place on a Raspberry Pi with an ARM CPU.

For the sake of clarity, the DataFrame from the example (`ADAUSD_5m.df`) with only 20 entries is used in the following examples. The following code appends a column of boolean values dependent on the condition `emaShort0 > emaLong0`:

![Dataframe with 20 entries][22]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

The place of interest is when a _False_ switches to _True_ (buy) or when _True_ switches to _False_. To filter them apply a `diff` operation to the _condition_ column. The `diff `operation calculates the difference between the current and the previous line. In terms of boolean values, it results in:

  * _False_ `diff` _False_ = _False_
  * _False_ `diff` _True_ = _True_
  * _True_ `diff` _True_ = _False_
  * _True_ `diff` _False_ = _True_



With the following code, you apply the `diff` operation as a filter to the *condition *column without modifying it:

![Applying the diff operation][23]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

As a result, you get the desired data: The first row (index 2) signalizes a buy condition and the second row (index 8) signalizes a sell condition. As you now have an efficient way of extracting relevant data, you can calculate possible profit.

To do so, you have to iterate through the rows and calculate the possible profit based on simulated trades. The variable `bBought` saves the state if you already bought, and `buyPrice` stores the price you bought between the iterations. You also skip the first sell indicator as it doesn't make sense to sell before you've even bought.


```
profit   = 0.0
buyPrice = 0.0
bBought  = False

for index, row, in trades.iterrows():
    
    # skip first sell-indicator
    if not row['condition'] and not bBought:
        continue
    
    # buy-indication
    if row['condition'] and not bBought:
        bBought = True
        buyPrice = row['close']
        
        
    # sell-indication
    if not row['condition'] and bBought:
        bBought = False
        sellPrice = row['close']

        orderProfit = (sellPrice * 100) / buyPrice - 100
        
        profit += orderProfit
```

Your one-trade mini dataset would provide you the following profit:

![One-trade mini dataset profit][24]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

**Note:** As you can see, the strategy would have given a terrible result as you would have bought at $2.5204 and sold at  $2.5065, causing a loss of 0.55% (order fees not included). However, this is a real-world scenario: One strategy does not work for each scenario. It is on you to find the most promising parameters (for example, using OHLCV on an hourly basis would make more sense in general).

### Implementation

You can find the implementation of the decision on the **Area 1** tab. 

![Decision-making implementation on area 1][25]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

It implements the following functionality:

  * **BotScheduler**: Same as the AcqusitionScheduler: Trigger subsequent elements every five minutes
  * **Delay**: Delay the execution for 30 seconds to make sure that the latest OHLCV data was written to file
  * **Evaluation**: Make the trading decision based on the EMA crossover strategy



You now know how the decision makings work, so you can take a look at the actual implementation. Open the file `generic_pipe_29dfc189.py`. It corresponds to the **Evaluation** element on the screen:


```
@dataclass
class OrderRecord:
    orderType:          bool  # True = Buy, False = Sell
    price:              float # close price
    profit:             float # profit in percent
    profitCumulative:   float # cumulative profit in percent

class OrderType(Enum): 
    Buy  = True
    Sell = False

class Element(Function):

    def __init__(self, id, config, inputData, return_queue, cmd_queue):
        super().__init__(id, config, inputData, return_queue, cmd_queue)

    def execute(self):

        ### Load data ###

        file_path = Path.home() / 'Pythonic' / 'executables' / 'ADAUSD_5m.df'

        # only the last 21 columsn are considered
        self.ohlcv = pd.read_pickle(file_path)[-21:]

        self.bBought             = False
        self.lastPrice           = 0.0
        self.profit              = 0.0
        self.profitCumulative    = 0.0   
        self.price               = self.ohlcv['close'].iloc[-1]
        
        # switches for simulation

        self.bForceBuy  = False
        self.bForceSell = False

        # load trade history from file
        self.trackRecord = ListPersist('track_record')

        try:
            lastOrder = self.trackRecord[-1]

            self.bBought          = lastOrder.orderType
            self.lastPrice        = lastOrder.price
            self.profitCumulative = lastOrder.profitCumulative

        except IndexError:
            pass
        
        ### Calculate indicators ###

        self.ohlcv['ema-10'] = self.ohlcv['close'].ewm(span = 10, adjust=False).mean()
        self.ohlcv['ema-21'] = self.ohlcv['close'].ewm(span = 21, adjust=False).mean()
        self.ohlcv['condition'] = self.ohlcv['ema-10'] &gt; self.ohlcv['ema-21']
        
        ### Check for Buy- / Sell-condition ###
        tradeCondition = self.ohlcv['condition'].iloc[-1] != self.ohlcv['condition'].iloc[-2]

        if tradeCondition or self.bForceBuy or self.bForceSell:

            orderType = self.ohlcv['condition'].iloc[-1] # True = BUY, False = SELL

            if orderType and not self.bBought or self.bForceBuy: # place a buy order
                
                msg         = 'Placing a  Buy-order'
                newOrder    = self.createOrder(True)

            elif not orderType and self.bBought or self.bForceSell: # place a sell order

                msg = 'Placing a  Sell-order'

                sellPrice   = self.price
                buyPrice    = self.lastPrice

                self.profit = (sellPrice * 100) / buyPrice - 100
                self.profitCumulative += self.profit

                newOrder = self.createOrder(False)

            else: # Something went wrong
                msg = 'Warning: Condition for {}-order met but bBought is {}'.format(OrderType(orderType).name, self.bBought)
                newOrder = None
            

            recordDone = Record(newOrder, msg)     
            self.return_queue.put(recordDone)

    def createOrder(self, orderType: bool) -&gt; OrderRecord:
        
        newOrder = OrderRecord(
                orderType=orderType,
                price=self.price,
                profit=self.profit,
                profitCumulative=self.profitCumulative
            )
        
        self.trackRecord.append(newOrder)

        return newOrder
```

As the general process is not that complicated, I want to highlight some of the peculiarities:

##### Input data

The trading bot only processes the last 21 elements as this is the range you consider when calculating the exponential moving average:


```
`   self.ohlcv = pd.read_pickle(file_path)[-21:]`
```

##### Track record

The type _ListPersist_ is an extended Python list object that writes itself to the file system when modified (when elements get added or removed). It creates the file `track_record.obj` under `~/Pythonic/executables/` once you run it the first time.


```
`  self.trackRecord = ListPersist('track_record')`
```

Maintaining a track record helps to keep the state of recent bot activity.

##### Plausibility

The algorithm outputs an object of the type _OrderRecord_ in case conditions for a trade are met. It also keeps track of the overall situation: For example, if a buy signal was received, but `bBought` indicates that you already bought before, something must've gone wrong:


```
else: # Something went wrong
    msg = 'Warning: Condition for {}-order met but bBought is {}'.format(OrderType(orderType).name, self.bBought)
    newOrder = None
```

In this scenario, _None_ is returned with a corresponding log message.

### Simulation

The Evaluation element (`generic_pipe_29dfc189.py`) contains these switches which enable you to force the execution of a buy or sell order:


```
self.bForceBuy  = False
self.bForceSell = False
```

Open the code server IDE (http : //PythonicRPI:8000/), load `generic_pipe_29dfc189.py `and set one of the switches to _True_. Attach with the debugger and add a breakpoint where the execution path enters the _inner if_ conditions.

![Add breakpoint for inner if conditions][26]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

Now open the programming GUI, add a **ManualScheduler **element (configured to _single fire_) and connect it directly to the **Evaluation** element to trigger it manually:

![Add manual scheduler element][27]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

Click the play button. The **Evaluation **element is triggered directly, and the debugger stops at the previously set breakpoint. You are now able to add, remove, or modify orders from the track record manually to simulate certain scenarios:

![Manually simulate scenarios ][28]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

Open the log message window (green outlined button) and the output data window (orange outlined button):

![Pythonic trading output buttons][29]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

You will see the log messages and output of the **Evaluation** element and thus the behavior of the decision-making algorithm based on your input:

###

[19_pythonic_trading_simulate_orders_2.png][30]

![Log messages and output of evaluation element][31]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

Summary

The example stops here. The final implementation could notify the user about a trade indication, place an order on an exchange, or query the account balance in advance. At this point, you should feel that everything connects and be able to proceed on your own. 

Using Pythonic as a base for your trading bot is a good choice because it runs on a Raspberry Pi, is entirely accessible by a web browser, and already has logging features. It is even possible to stop on a breakpoint without disturbing the execution of other tasks using Pythonic's multiprocessing capabilities.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/raspberry-pi-trading-bot

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_whitehurst_money.png?itok=ls-SOzM0 (A dollar sign in a network)
[2]: https://opensource.com/article/20/4/python-crypto-trading-bot
[3]: https://github.com/hANSIc99/Pythonic
[4]: https://www.investopedia.com/articles/active-trading/052014/how-use-moving-average-buy-stocks.asp
[5]: https://opensource.com/article/21/9/raspberry-pi-remote-control
[6]: https://sourceforge.net/projects/pythonicrpi/
[7]: https://opensource.com/sites/default/files/uploads/1_pythonic_trading_clear_2.png (Pythonic GUI overview)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://github.com/hANSIc99/Pythonic/raw/master/examples/trading_bot_crossing_ema/trading_bot_crossing_ema.zip
[10]: https://jupyter.org/
[11]: https://opensource.com/sites/default/files/uploads/2_pythonic_trading_upload_buttons.png (Upload toolbar buttons)
[12]: https://opensource.com/sites/default/files/uploads/3_pythonic_trading_sample_loaded_2.png (Pythonic screen after upload of config.json)
[13]: https://opensource.com/sites/default/files/uploads/4_pythonic_trading_data_acquisition.png (Pythonic area 2 data acquisition)
[14]: https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.html
[15]: https://opensource.com/sites/default/files/uploads/5_pythonic_trading_ohlcv_limit.png (OHLCV_Query configuration)
[16]: https://opensource.com/sites/default/files/uploads/6_pythonic_trading_ohlcv_data.png (Pythonic trading data graph)
[17]: https://opensource.com/sites/default/files/uploads/7_pythonic_trading_jupyter_a.png (Output after executing the first three cells)
[18]: https://opensource.com/sites/default/files/uploads/8_pythonic_trading_jupyter_calc_ema.png (EMA values added as separate columns to dataframe)
[19]: https://opensource.com/sites/default/files/uploads/9_pythonic_trading_buy_condition.png (Buy condition met)
[20]: https://opensource.com/sites/default/files/uploads/10_pythonic_trading_sell_condition.png (Sell condition met)
[21]: https://numpy.org/
[22]: https://opensource.com/sites/default/files/uploads/11_pythonic_trading_jupyter_condition.png (Dataframe with 20 entries)
[23]: https://opensource.com/sites/default/files/uploads/12_pythonic_trading_jupyter_filter.png (Applying the diff operation)
[24]: https://opensource.com/sites/default/files/uploads/13_pythonic_trading_backtest_trades.png (One-trade mini dataset profit)
[25]: https://opensource.com/sites/default/files/uploads/14_pythonic_trading_implementation.png (Decision-making implementation on area 1)
[26]: https://opensource.com/sites/default/files/uploads/15_pythonic_trading_breakpoint_2.png (Add breakpoint for inner if conditions)
[27]: https://opensource.com/sites/default/files/uploads/16_pythonic_trading_manual_trigger.png (Add manual scheduler element)
[28]: https://opensource.com/sites/default/files/uploads/17_pythonic_trading_debugger_stop.png (Manually simulate scenarios)
[29]: https://opensource.com/sites/default/files/uploads/18_pythonic_trading_output_buttons.png (Pythonic trading output buttons)
[30]: https://opensource.com/file/512111
[31]: https://opensource.com/sites/default/files/uploads/19_pythonic_trading_simulate_orders_2.png (Log messages and output of evaluation element)
