[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create a machine learning model with Bash)
[#]: via: (https://opensource.com/article/20/11/machine-learning-bash)
[#]: author: (Girish Managoli https://opensource.com/users/gammay)

Create a machine learning model with Bash
======
Bash, Tcsh, or Zsh can help you get ready for machine learning.
![bash logo on green background][1]

[Machine learning][2] is a powerful computing capability for predicting or forecasting things that conventional algorithms find challenging. The machine learning journey begins with collecting and preparing data—a _lot_ of it—then it builds mathematical models based on that data. While multiple tools can be used for these tasks, I like to use the [shell][3].

A shell is an interface for performing operations using a defined language. This language can be invoked interactively or scripted. The concept of the shell was introduced in [Unix][4] operating systems in the 1970s. Some of the most popular shells include [Bash][5], [tcsh][6], and [Zsh][7]. They are available for all operating systems, including Linux, macOS, and Windows, which gives them high portability. For this exercise, I'll use Bash.

This article is an introduction to using a shell for data collection and data preparation. Whether you are a data scientist looking for efficient tools or a shell expert looking at using your skills for machine learning, I hope you will find valuable information here.

The example problem in this article is creating a machine learning model to forecast temperatures for US states. It uses shell commands and scripts to do the following data collection and data preparation steps:

  1. Download data
  2. Extract the necessary fields
  3. Aggregate data
  4. Make time series
  5. Create the train, test, and validate data sets



You may be asking why you should do this with shell, when you can do all of it in a machine learning programming language such as [Python][8]. This is a good question. If data processing is performed with an easy, friendly, rich technology like a shell, a data scientist focuses only on machine learning modeling and not the details of a language.

## Prerequisites

First, you need to have a shell interpreter installed. If you use Linux or macOS, it will already be installed, and you may already be familiar with it. If you use Windows, try [MinGW][9] or [Cygwin][10].

For more information, see:

  * [Bash tutorials][11] here on opensource.com
  * The official [shell scripting tutorial][12] by Steve Parker, the creator of Bourne shell
  * The [Bash Guide for Beginners][13] by the Linux Documentation Project
  * If you need help with a specific command, type `<commandname> --help` in the shell for help; for example: `ls --help`.



## Get started

Now that your shell is set up, you can start preparing data for the machine learning temperature-prediction problem.

### 1\. Download data

The data for this tutorial comes from the US National Oceanic and Atmospheric Administration (NOAA). You will train your model using the last 10 complete years of data. The data source is at <https://www1.ncdc.noaa.gov/pub/data/ghcn/daily/by_year/>, and the data is in .csv format and gzipped.

Download and unzip the data using a [shell script][14]. Use your favorite text editor to create a file named `download.sh` and paste in the code below. The comments in the code explain what the commands do:


```
#!/bin/sh
# This is called hashbang. It identifies the executor used to run this file.
# In this case, the script is executed by shell itself.
# If not specified, a program to execute the script must be specified.
# With hashbang: ./download.sh;  Without hashbang: sh ./download.sh;

FROM_YEAR=2010
TO_YEAR=2019

year=$FROM_YEAR
# For all years one by one starting from FROM_YEAR=2010 upto TO_YEAR=2019
while [ $year -le $TO_YEAR ]
do
    # show the year being downloaded now
    echo $year
    # Download
    wget <https://www1.ncdc.noaa.gov/pub/data/ghcn/daily/by\_year/${year}.csv.gz>
    # Unzip
    gzip -d ${year}.csv.gz
    # Move to next year by incrementing
    year=$(($year+1))
done
```

Notes:

  * If you are behind a proxy server, consult Mark Grennan's [how-to][15], and use: [code] export http_proxy=<http://username:password@proxyhost:port/>
export https_proxy=<https://username:password@proxyhost:port/> 
```
  * Make sure all standard commands are already in your PATH (such as `/bin` or `/usr/bin`). If not, [set your PATH][16].
  * [Wget][17] is a utility for connecting to web servers from the command line. If Wget is not installed on your system, [download it][18].
  * Make sure you have [gzip][19], a utility used for compression and decompression.



Run this script to download, extract, and make 10 years' worth of data available as CSVs:
```


$ ./download.sh
2010
\--2020-10-30 19:10:47--  <https://www1.ncdc.noaa.gov/pub/data/ghcn/daily/by\_year/2010.csv.gz>
Resolving www1.ncdc.noaa.gov (www1.ncdc.noaa.gov)... 205.167.25.171, 205.167.25.172, 205.167.25.178, ...
Connecting to www1.ncdc.noaa.gov (www1.ncdc.noaa.gov)|205.167.25.171|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 170466817 (163M) [application/gzip]
Saving to: '2010.csv.gz'

     0K .......... .......... .......... .......... ..........  0% 69.4K 39m57s
    50K .......... .......... .......... .......... ..........  0%  202K 26m49s
   100K .......... .......... .......... .......... ..........  0% 1.08M 18m42s

...

```
The [ls][20] command lists the contents of a folder. Use `ls 20*.csv` to list all your files with names beginning with 20 and ending with .csv.
```


$ ls 20*.csv
2010.csv  2011.csv  2012.csv  2013.csv  2014.csv  2015.csv  2016.csv  2017.csv  2018.csv  2019.csv

```
### 2\. Extract average temperatures

Extract the TAVG (average temperature) data from the CSVs for US regions:

**extract_tavg_us.sh**
```


#!/bin/sh

# For each file with name that starts with "20" and ens with ".csv"
for csv_file in `ls 20*.csv`
do
    # Message that says file name $csv_file is extracted to file TAVG_US_$csv_file
    # Example: 2010.csv extracted to TAVG_US_2010.csv
    echo "$csv_file -&gt; TAVG_US_$csv_file"
    # grep "TAVG" $csv_file: Extract lines in file with text "TAVG"
    # |: pipe
    # grep "^US": From those extract lines that begin with text "US"
    # &gt; TAVG_US_$csv_file: Save xtracted lines to file TAVG_US_$csv_file
    grep "TAVG" $csv_file | grep "^US" &gt; TAVG_US_$csv_file
done

```
This script:
```


$ ./extract_tavg_us.sh
2010.csv -&gt; TAVG_US_2010.csv
...
2019.csv -&gt; TAVG_US_2019.csv

```
creates these files:
```


$ ls TAVG_US*.csv
TAVG_US_2010.csv  TAVG_US_2011.csv  TAVG_US_2012.csv  TAVG_US_2013.csv
TAVG_US_2014.csv  TAVG_US_2015.csv  TAVG_US_2016.csv  TAVG_US_2017.csv
TAVG_US_2018.csv  TAVG_US_2019.csv

```
Here are the first few lines for `TAVG_US_2010.csv`:
```


$ head TAVG_US_2010.csv
USR0000AALC,20100101,TAVG,-220,,,U,
USR0000AALP,20100101,TAVG,-9,,,U,
USR0000ABAN,20100101,TAVG,12,,,U,
USR0000ABCA,20100101,TAVG,16,,,U,
USR0000ABCK,20100101,TAVG,-309,,,U,
USR0000ABER,20100101,TAVG,-81,,,U,
USR0000ABEV,20100101,TAVG,-360,,,U,
USR0000ABEN,20100101,TAVG,-224,,,U,
USR0000ABNS,20100101,TAVG,89,,,U,
USR0000ABLA,20100101,TAVG,59,,,U,

```
The [head][21] command is a utility for displaying the first several lines (by default, 10 lines) of a file.

The data has more information than you need. Limit the number of columns by eliminating column 3 (since all the data is average temperature) and column 5 onward. In other words, keep columns 1 (climate station), 2 (date), and 4 (temperature recorded).

**key_columns.sh**
```


#!/bin/sh

# For each file with name that starts with "TAVG_US_" and ens with ".csv"
for csv_file in `ls TAVG_US_*.csv`
do
    echo "Exractiing columns $csv_file"
    # cat $csv_file: 'cat' is to con'cat'enate files - here used to show one year csv file
    # |: pipe
    # cut -d',' -f1,2,4: Cut columns 1,2,4 with , delimitor
    # &gt; $csv_file.cut: Save to temporary file
    | &gt; $csv_file.cut:
    cat $csv_file | cut -d',' -f1,2,4 &gt; $csv_file.cut
    # mv $csv_file.cut $csv_file: Rename temporary file to original file
    mv $csv_file.cut $csv_file
    # File is processed and saved back into the same
    # There are other ways to do this
    # Using intermediate file is the most reliable method.
done

```
Run the script:
```


$ ./key_columns.sh
Extracting columns TAVG_US_2010.csv
...
Extracting columns TAVG_US_2019.csv

```
The first few lines of `TAVG_US_2010.csv` with the unneeded data removed are:
```


$ head TAVG_US_2010.csv
USR0000AALC,20100101,-220
USR0000AALP,20100101,-9
USR0000ABAN,20100101,12
USR0000ABCA,20100101,16
USR0000ABCK,20100101,-309
USR0000ABER,20100101,-81
USR0000ABEV,20100101,-360
USR0000ABEN,20100101,-224
USR0000ABNS,20100101,89
USR0000ABLA,20100101,59

```
Dates are in string form (YMD). To train your model correctly, your algorithms need to recognize date fields in the comma-separated Y,M,D form (For example, `20100101` becomes `2010,01,01`). You can convert them with the [sed][22] utility.

**date_format.sh**
```


for csv_file in `ls TAVG_*.csv`
do
    echo Date formatting $csv_file
    # This inserts , after year
    sed -i 's/,..../&amp;,/' $csv_file
    # This inserts , after month
    sed -i 's/,....,../&amp;,/' $csv_file
done

```
Run the script:
```


$ ./date_format.sh
Date formatting TAVG_US_2010.csv
...
Date formatting TAVG_US_2019.csv

```
The first few lines of `TAVG_US_2010.csv` with the comma-separated date format are:
```


$ head TAVG_US_2010.csv
USR0000AALC,2010,01,01,-220
USR0000AALP,2010,01,01,-9
USR0000ABAN,2010,01,01,12
USR0000ABCA,2010,01,01,16
USR0000ABCK,2010,01,01,-309
USR0000ABER,2010,01,01,-81
USR0000ABEV,2010,01,01,-360
USR0000ABEN,2010,01,01,-224
USR0000ABNS,2010,01,01,89
USR0000ABLA,2010,01,01,59

```
### 3\. Aggregate states' average temperature data

The weather data comes from climate stations located in US cities, but you want to forecast whole states' temperatures. To convert the climate-station data to state data, first, map climate stations to their states.

Download the list of climate stations using wget:
```
`$ wget ftp://ftp.ncdc.noaa.gov/pub/data/ghcn/daily/ghcnd-stations.txt`
```
Extract the US stations with the [grep][23] utility to find US listings. The following command searches for lines that begin with the text `"US`." The `>` is a [redirection][24] that writes output to a file—in this case, to a file named `us_stations.txt`:
```
`$ grep "^US" ghcnd-stations.txt > us_stations.txt`
```
This file was created for pretty print, so the column separators are inconsistent:
```


$ head us_stations.txt
US009052008  43.7333  -96.6333  482.0 SD SIOUX FALLS (ENVIRON. CANADA)
US10RMHS145  40.5268 -105.1113 1569.1 CO RMHS 1.6 SSW
US10adam001  40.5680  -98.5069  598.0 NE JUNIATA 1.5 S
...

```
Make them consistent by using [cat][25] to print the file, using [tr][26] to squeeze repeats and output to a temp file, and renaming the temp file back to the original—all in one line:
```
`$ cat us_stations.txt | tr -s ' ' > us_stations.txt.tmp; cp us_stations.txt.tmp us_stations.txt;`
```
The first lines of the command's output:
```


$ head us_stations.txt
US009052008 43.7333 -96.6333 482.0 SD SIOUX FALLS (ENVIRON. CANADA)
US10RMHS145 40.5268 -105.1113 1569.1 CO RMHS 1.6 SSW
US10adam001 40.5680 -98.5069 598.0 NE JUNIATA 1.5 S
...

```
This contains a lot of info—GPS coordinates and such—but you only need the station code and state. Use [cut][27]:
```
`$ cut -d' ' -f1,5 us_stations.txt > us_stations.txt.tmp; mv us_stations.txt.tmp us_stations.txt;`
```
The first lines of the command's output:
```


$ head us_stations.txt
US009052008 SD
US10RMHS145 CO
US10adam001 NE
US10adam002 NE
...

```
Make this a CSV and change the spaces to comma separators using sed:
```
`$ sed -i s/' '/,/g us_stations.txt`
```
The first lines of the command's output:
```


$ head us_stations.txt
US009052008,SD
US10RMHS145,CO
US10adam001,NE
US10adam002,NE
...

```
Although you used several commands for these tasks, it is possible to perform all the steps in one run. Try it yourself.

Now, replace the station codes with their state locations by using [AWK][28], which is functionally high performant for large data processing.

**station_to_state_data.sh**
```


PATTERN_FILE=us_stations.txt

for DATA_FILE in `ls TAVG_US_*.csv`
do
    echo ${DATA_FILE}

    awk -F, \
        'FNR==NR { x[$1]=$2; next; } { $1=x[$1]; print $0 }' \
        OFS=, \
        ${PATTERN_FILE} ${DATA_FILE} &gt; ${DATA_FILE}.tmp

   mv ${DATA_FILE}.tmp ${DATA_FILE}
done

```
Here is what these parameters mean:

`-F,` | Field separator is `,`
---|---
`FNR` | Line number in each file
`NR` | Line number in both files together
`FNR==NR` | Is TRUE only in the first file `${PATTERN_FILE}`
`{ x[$1]=$2; next; }` | If `FNR==NR` is TRUE (for all lines in `$PATTERN_FILE` only)
`- x` | Variable to store `station=state` map
`- x[$1]=$2` | Adds data of `station=state` to map
`- $1` | First column in first file (station codes)
`- $2` | Second column in first file (state codes)
`- x` | Map of all stations e.g., `x[US009052008]=SD`, `x[US10RMHS145]=CO`, ..., `x[USW00096409]=AK`
`- next` | Go to next line matching `FNR==NR` (essentially, this creates a map of all stations-states from the `${PATTERN_FILE}`
`{ $1=x[$1]; print $0 }` | If `FNR==NR` is FALSE (for all lines `in $DATA_FILE` only)
`- $1=x[$1]` | Replace first field with `x[$1]`; essentially, replace station code with state code
`- print $0` | Print all columns (including replaced `$1`)
`OFS=,` | Output fields separator is `,`

The CSV with station codes:
```


$ head TAVG_US_2010.csv
USR0000AALC,2010,01,01,-220
USR0000AALP,2010,01,01,-9
USR0000ABAN,2010,01,01,12
USR0000ABCA,2010,01,01,16
USR0000ABCK,2010,01,01,-309
USR0000ABER,2010,01,01,-81
USR0000ABEV,2010,01,01,-360
USR0000ABEN,2010,01,01,-224
USR0000ABNS,2010,01,01,89
USR0000ABLA,2010,01,01,59

```
Run the command:
```


$ ./station_to_state_data.sh
TAVG_US_2010.csv
...
TAVG_US_2019.csv

```
Stations are now mapped to states:
```


$ head TAVG_US_2010.csv
AK,2010,01,01,-220
AZ,2010,01,01,-9
AL,2010,01,01,12
AK,2010,01,01,16
AK,2010,01,01,-309
AK,2010,01,01,-81
AK,2010,01,01,-360
AK,2010,01,01,-224
AZ,2010,01,01,59
AK,2010,01,01,-68

```
Every state has several temperature readings for each day, so you need to calculate the average of each state's readings for a day. Use AWK for text processing, [sort][29] to ensure the final results are in a logical order, and [rm][30] to delete the temporary file after processing.

**station_to_state_data.sh**
```


PATTERN_FILE=us_stations.txt

for DATA_FILE in `ls TAVG_US_*.csv`
do
    echo ${DATA_FILE}

    awk -F, \
        'FNR==NR { x[$1]=$2; next; } { $1=x[$1]; print $0 }' \
        OFS=, \
        ${PATTERN_FILE} ${DATA_FILE} &gt; ${DATA_FILE}.tmp

   mv ${DATA_FILE}.tmp ${DATA_FILE}
done

```
Here is what the AWK parameters mean:

`FILE=$DATA_FILE` | CSV file processed as `FILE`
---|---
`-F,` | Field separator is `,`
`state_day_sum[$1 "," $2 "," $3 "," $4] = $5 state_day_sum[$1 "," $2 "," $3 "," $4] + $5` | Sum of temperature (`$5`) for the state `($1`) on year (`$2`), month (`$3`), day (`$4`)
`state_day_num[$1 "," $2 "," $3 "," $4] = $5 state_day_num[$1 "," $2 "," $3 "," $4] + 1` | Number of temperature readings for the state (`$1`) on year (`$2`), month (`$3`), day (`$4`)
`END` | In the end, after collecting sum and number of readings for all states, years, months, days, calculate averages
`for (state_day_key in state_day_sum)` | For each state-year-month-day
`print state_day_key "," state_day_sum[state_day_key]/state_day_num[state_day_key]` | Print state,year,month,day,average
`OFS=,` | Output fields separator is `,`
`$DATA_FILE` | Input file (all files with name starting with `TAVG_US_` and ending with `.csv`, one by one)
`> STATE_DAY_${DATA_FILE}.tmp` | Save result to a temporary file

Run the script:
```


$ ./TAVG_avg.sh
TAVG_US_2010.csv
TAVG_US_2011.csv
TAVG_US_2012.csv
TAVG_US_2013.csv
TAVG_US_2014.csv
TAVG_US_2015.csv
TAVG_US_2016.csv
TAVG_US_2017.csv
TAVG_US_2018.csv
TAVG_US_2019.csv

```
These files are created:
```


$ ls STATE_DAY_TAVG_US_20*.csv
STATE_DAY_TAVG_US_2010.csv  STATE_DAY_TAVG_US_2015.csv
STATE_DAY_TAVG_US_2011.csv  STATE_DAY_TAVG_US_2016.csv
STATE_DAY_TAVG_US_2012.csv  STATE_DAY_TAVG_US_2017.csv
STATE_DAY_TAVG_US_2013.csv  STATE_DAY_TAVG_US_2018.csv
STATE_DAY_TAVG_US_2014.csv  STATE_DAY_TAVG_US_2019.csv

```
See one year of data for all states ([less][31] is a utility to see output a page at a time):
```


$ less STATE_DAY_TAVG_US_2010.csv
AK,2010,01,01,-181.934
...
AK,2010,01,31,-101.068
AK,2010,02,01,-107.11
...
AK,2010,02,28,-138.834
...
WY,2010,01,01,-43.5625
...
WY,2010,12,31,-215.583

```
Merge all the data files into one:
```
`$ cat STATE_DAY_TAVG_US_20*.csv > TAVG_US_2010-2019.csv`
```
You now have one file, with all states, for all years:
```


$ cat TAVG_US_2010-2019.csv
AK,2010,01,01,-181.934
...
WY,2018,12,31,-167.421
AK,2019,01,01,-32.3386
...
WY,2019,12,30,-131.028
WY,2019,12,31,-79.8704

```
## 4\. Make time-series data

A problem like this is fittingly addressed with a time-series model such as long short-term memory ([LSTM][32]), which is a recurring neural network ([RNN][33]). This input data is organized into time slices; consider 20 days to be one slice.

This is a one-time slice (as in `STATE_DAY_TAVG_US_2010.csv`):
```


X (input – 20 weeks):
AK,2010,01,01,-181.934
AK,2010,01,02,-199.531
...
AK,2010,01,20,-157.273

y (21st week, prediction for these 20 weeks):
AK,2010,01,21,-165.31

```
This time slice is represented as (temperature values where the first 20 weeks are X, and 21 is y):
```


AK, -181.934,-199.531, ... ,
-157.273,-165.3

```
The slices are time-contiguous. For example, the end of 2010 continues into 2011:
```


AK,2010,12,22,-209.92
...
AK,2010,12,31,-79.8523
AK,2011,01,01,-59.5658
...
AK,2011,01,10,-100.623

```
Which results in the prediction: 
```
`AK,2011,01,11,-106.851`
```
This time slice is taken as:
```
`AK, -209.92, ... ,-79.8523,-59.5658, ... ,-100.623,-106.851`
```
and so on, for all states, years, months, and dates. For more explanation, see this tutorial on [time-series forecasting][34].

Write a script to create time slices:

**timeslices.sh**
```


#!/bin/sh

TIME_SLICE_PERIOD=20

file=TAVG_US_2010-2019.csv

# For each state in file
for state in `cut -d',' -f1 $file | sort | uniq`
do
    # Get all temperature values for the state
    state_tavgs=`grep $state $file | cut -d',' -f5`
    # How many time slices will this result in?
    # mber of temperatures recorded minus size of one timeslice
    num_slices=`echo $state_tavgs | wc -w`
    num_slices=$((${num_slices} - ${TIME_SLICE_PERIOD}))
    # Initialize
    slice_start=1; num_slice=0;
    # For each timeslice
    while [ $num_slice -lt $num_slices ]
    do
        # One timeslice is from slice_start to slice_end
        slice_end=$(($slice_start + $TIME_SLICE_PERIOD - 1))
        # X (1-20)
        sliceX="$slice_start-$slice_end"
        # y (21)
        slicey=$(($slice_end + 1))
        # Print state and timeslice temperature values (column 1-20 and 21)
        echo $state `echo $state_tavgs | cut -d' ' -f$sliceX,$slicey`
        # Increment
        slice_start=$(($slice_start + 1)); num_slice=$(($num_slice + 1));
    done
done

```
Run the script. It uses spaces as column separators; make them commas with sed:
```
`$ ./timeslices.sh > TIMESLICE_TAVG_US_2010-2019.csv; sed -i s/' '/,/g TIME_VARIANT_TAVG_US_2010-2019.csv`
```
Here are the first few lines and the last few lines of the output .csv:
```


$ head -3 TIME_VARIANT_TAVG_US_2009-2019.csv
AK,-271.271,-290.057,-300.324,-277.603,-270.36,-293.152,-292.829,-270.413,-256.674,-241.546,-217.757,-158.379,-102.585,-24.9517,-1.7973,15.9597,-5.78231,-33.932,-44.7655,-92.5694,-123.338
AK,-290.057,-300.324,-277.603,-270.36,-293.152,-292.829,-270.413,-256.674,-241.546,-217.757,-158.379,-102.585,-24.9517,-1.7973,15.9597,-5.78231,-33.932,-44.7655,-92.5694,-123.338,-130.829
AK,-300.324,-277.603,-270.36,-293.152,-292.829,-270.413,-256.674,-241.546,-217.757,-158.379,-102.585,-24.9517,-1.7973,15.9597,-5.78231,-33.932,-44.7655,-92.5694,-123.338,-130.829,-123.979

$ tail -3 TIME_VARIANT_TAVG_US_2009-2019.csv
WY,-76.9167,-66.2315,-45.1944,-27.75,-55.3426,-81.5556,-124.769,-137.556,-90.213,-54.1389,-55.9907,-30.9167,-9.59813,7.86916,-1.09259,-13.9722,-47.5648,-83.5234,-98.2963,-124.694,-142.898
WY,-66.2315,-45.1944,-27.75,-55.3426,-81.5556,-124.769,-137.556,-90.213,-54.1389,-55.9907,-30.91