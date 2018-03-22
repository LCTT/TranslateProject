The Command line Personal Assistant For Your Linux System
======

![](https://www.ostechnix.com/wp-content/uploads/2018/03/Yoda-720x340.png)
A while ago, we wrote about a command line virtual assistant named [**“Betty”**][1]. Today, I stumbled upon a similar utility called **“Yoda”**. Yoda is a command line personal assistant who can help you to do some trivial tasks in Linux. It is a free, open source application written in Python. In this guide, we will see how to install and use Yoda in GNU/Linux.

### Installing Yoda, the command line personal assistant

Yoda requires **Python 2** and PIP. If PIP is not installed in your Linux box, refer the following guide to install it. Just make sure you have installed **python2-pip.** Yoda may not support Python 3.

**Note:** I recommend you to try Yoda under a virtual environment. Not just Yoda, always try any Python applications in a virtual environment, so they won’t interfere with globally installed packages. You can setup a virtual environment as described in the above link under the section titled “Creating Virtual Environments”.

Once you have installed pip on your system, git clone Yoda repository.
```
$ git clone https://github.com/yoda-pa/yoda

```

The above command will create a directory named “yoda” in your current working directory and clone all contents in it. Go to the Yoda directory:
```
$ cd yoda/

```

Run the following command to install Yoda application.
```
$ pip install .

```

Please note the dot (.) at the end. Now, all required packages will be downloaded and installed.

### Configure Yoda

First, setup configuration to save your information on your local system.

To do so, run:
```
$ yoda setup new

```

Answer the following questions:
```
Enter your name:
Senthil Kumar
What's your email id?
[email protected]
What's your github username?
sk
Enter your github password:
Password:
Where shall your config be stored? (Default: ~/.yoda/)

A configuration file already exists. Are you sure you want to overwrite it? (y/n)
y

```

Your password is saved in the config file after encrypting, so don’t worry about it.

To check the current configuration, run:
```
$ yoda setup check

```

You will see an output something like below.
```
Name: Senthil Kumar
Email: [email protected]
Github username: sk

```

By default, your information is stored in **~/.yoda** directory.

To delete the existing configuration, do:
```
$ yoda setup delete

```

### Usage

Yoda contains a simple chat bot. You can interact with it using **chat** command like below.
```
$ yoda chat who are you

```

Sample output:
```
Yoda speaks:
I'm a virtual agent

$ yoda chat how are you
Yoda speaks:
I'm doing very well. Thanks!

```

Here is the list of things we can do with Yoda:

**Test Internet speed**

Let us ask Yoda about the Internet speed. To do so, run:
```
$ yoda speedtest
Speed test results:
Ping: 108.45 ms
Download: 0.75 Mb/s
Upload: 1.95 Mb/s

```

**Shorten and expand URLs**

Yoda also helps to shorten any URL.
```
$ yoda url shorten https://www.ostechnix.com/
Here's your shortened URL:
https://goo.gl/hVW6U0

```

To expand the shortened URL:
```
$ yoda url expand https://goo.gl/hVW6U0
Here's your original URL:
https://www.ostechnix.com/

```

**Read Hacker News**

I am regular visitor of Hacker News website. If you’re anything like me, you can read the news from Hacker News website using Yoda like below.
```
$ yoda hackernews
News-- 1/513

Title-- Show HN: a Yelp for iOS developers
Description-- I came up with this idea "a Yelp for developers" when talking with my colleagues. My hypothesis is that, it would be very helpful if we know more about a library before choosing to use it. It's similar to that we want to know more about a restaurant by checki…
url-- https://news.ycombinator.com/item?id=16636071

Continue? [press-"y"]

```

Yoda will display one item at a time. To read the next news, simply type “y” and hit ENTER.

**Manage personal diaries**

We can also maintain a personal diary to note important events.

Create a new diary using command:
```
$ yoda diary nn
Input your entry for note:
Today I learned about Yoda

```

To create a new note, run the above command again.

To view all notes:
```
$ yoda diary notes
Today's notes:
----------------
 Time | Note
--------|-----
16:41:41| Today I learned about Yoda

```

Not just notes, Yoda can also help you to create tasks.

To create a new task, run:
```
$ yoda diary nt
Input your entry for task:
Write an article about Yoda and publish it on OSTechNix

```

To view the list of tasks, run:
```
$ yoda diary tasks
Today's agenda:
----------------
Status | Time | Text
-------|---------|-----
 O | 16:44:03: Write an article about Yoda and publish it on OSTechNix
----------------

Summary:
----------------
Incomplete tasks: 1
Completed tasks: 0

```

As you see above, I have one incomplete task. To mark it as completed, run the following command and type the completed task serial number and hit ENTER:
```
$ yoda diary ct
Today's agenda:
----------------
Number | Time | Task
-------|---------|-----
 1 | 16:44:03: Write an article about Yoda and publish it on OSTechNix
Enter the task number that you would like to set as completed
1

```

You can analyze the current month’s tasks at any time using command:
```
$ yoda diary analyze
Percentage of incomplete task : 0
Percentage of complete task : 100
Frequency of adding task (Task/Day) : 3

```

Sometimes, you may want to maintain a profile about a person you love, admire.

**Take notes about loved ones**

First, you need to setup configuration to store your friend’s details. To do so, run:
```
$ yoda love setup

```

Enter the details of your friend:
```
Enter their name:
Abdul Kalam
Enter sex(M/F):
M
Where do they live?
Rameswaram

```

To view the details of the person, run:
```
$ yoda love status
{'place': 'Rameswaram', 'name': 'Abdul Kalam', 'sex': 'M'}

```

To add the birthday of your love one:
```
$ yoda love addbirth
Enter birthday
15-10-1931

```

To view the birth date:
```
$ yoda love showbirth
Birthday is 15-10-1931

```

You could even add notes about that person:
```
$ yoda love note
Avul Pakir Jainulabdeen Abdul Kalam better known as A. P. J. Abdul Kalam, was the 11th President of India from 2002 to 2007.

```

You can view the notes using command:
```
$ yoda love notes
Notes:
1: Avul Pakir Jainulabdeen Abdul Kalam better known as A. P. J. Abdul Kalam, was the 11th President of India from 2002 to 2007.

```

You can also write the things that person like:
```
$ yoda love like
Add things they like
Physics, Aerospace
Want to add more things they like? [y/n]
n

```

To view the things they like, run:
```
$ yoda love likes
Likes:
1: Physics, Aerospace

```

**Tracking money expenses**

You don’t need a separate tool to maintain your financial expenditure. Yoda got your back.

First, setup configuration for your money expenses using command:
```
$ yoda money setup

```

Enter your currency code and the initial amount:
```
Enter default currency code:
INR
{u'USD': 0.015338, u'IDR': 211.06, u'BGN': 0.024436, u'ISK': 1.5305, u'ILS': 0.053402, u'GBP': 0.010959, u'DKK': 0.093063, u'CAD': 0.020041, u'MXN': 0.28748, u'HUF': 3.8873, u'RON': 0.058302, u'MYR': 0.060086, u'SEK': 0.12564, u'SGD': 0.020208, u'HKD': 0.12031, u'AUD': 0.019908, u'CHF': 0.014644, u'KRW': 16.429, u'CNY': 0.097135, u'TRY': 0.06027, u'HRK': 0.092986, u'NZD': 0.021289, u'THB': 0.47854, u'EUR': 0.012494, u'NOK': 0.11852, u'RUB': 0.88518, u'JPY': 1.6332, u'CZK': 0.31764, u'BRL': 0.050489, u'PLN': 0.052822, u'PHP': 0.79871, u'ZAR': 0.1834}
₹
Indian rupee
Enter initial amount:
10000

```

To view the money configuration, just run:``
```
$ yoda money status
{'initial_money': 10000, 'currency_code': 'INR'}

```

Let us say you bought a book that costs 250 INR. To add this expense, run:
```
$ yoda money exp
Spend 250 INR on books
output:

```

To view the expenses, run:
```
$ yoda money exps
2018-03-21 17:12:31 INR 250 books

```

**Creating Idea lists**

To create a new idea:
```
$ yoda ideas add --task <task_name> --inside <project_name>

```

List the ideas:
```
$ yoda ideas show

```

To remove a idea from the project:
```
$ yoda ideas remove --task <task_name> --inside <project_name>

```

To remove the idea completely, run:
```
$ yoda ideas remove --project <project_name>

```

**Learning English Vocabulary**

Yoda helps you to learn random English words and track your learning progress.

To learn a new word, type:
```
$ yoda vocabulary word

```

It will display a random word. Press ENTER to display the meaning of the word. Again, Yoda asks you if you already know the meaning of the word. If you know it already, type “yes”. If you don’t know, type “no”. This can help you to track your progress. Use the following command to know your progress.
```
$ yoda vocabulary accuracy

```

Also, Yoda can help you to do few other things like finding the definition of a word and creating flashcards to easily learn anything. For more details and list of available options, refer the help section.
```
$ yoda --help

```

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/yoda-the-command-line-personal-assistant-for-your-linux-system/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/betty-siri-like-commandline-virtual-assistant-linux/
