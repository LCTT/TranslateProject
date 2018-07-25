Learn how to build your own Twitter bot with Python
======

![](https://fedoramagazine.org/wp-content/uploads/2018/07/twitterbot-816x345.jpg)

Twitter allows one to [share][1] blog posts and articles with the world. Using Python and the tweepy library makes it easy to create a Twitter bot that takes care of all the tweeting for you. This article shows you how to build such a bot. Hopefully you can take the concepts here and apply them to other projects that use online services.

### Getting started

To create a Twitter bot the [tweepy][2] library comes handy. It manages the Twitter API calls and provides a simple interface.

The following commands use Pipenv to install tweepy into a virtual environment. If you don’t have Pipenv installed, check out our previous article, [How to install Pipenv on Fedora][3].
```
$ mkdir twitterbot
$ cd twitterbot
$ pipenv --three
$ pipenv install tweepy
$ pipenv shell

```

### Tweepy – Getting started

To use the Twitter API the bot needs to authenticate against Twitter. For that, tweepy uses the OAuth authentication standard. You can get credentials by creating a new application at <https://apps.twitter.com/>.

#### Create a new Twitter application

After you fill in the following form and click on the Create your Twitter application button, you have access to the application credentials. Tweepy requires the Consumer Key (API Key) and the Consumer Secret (API Secret), both available from the Keys and Access Tokens.

![][4]

After scrolling down the page, generate an Access Token and an Access Token Secret using the Create my access token button.

#### Using Tweepy – print your timeline

Now that you have all the credentials needed, open a new file and write the following Python code.
```
import tweepy

auth = tweepy.OAuthHandler("your_consumer_key", "your_consumer_key_secret")

auth.set_access_token("your_access_token", "your_access_token_secret")

api = tweepy.API(auth)

public_tweets = api.home_timeline()

for tweet in public_tweets:
 print(tweet.text)

```

After making sure that you are using the Pipenv virtual environment, run your program.
```
$ python tweet.py

```

The above program calls the home_timeline API method to retrieve the 20 most recent tweets from your timeline. Now that the bot is able to use tweepy to get data from Twitter, try changing the code to send a tweet.

#### Using Tweepy – send a tweet

To send a tweet, the API method update_status comes in handy. The usage is simple:
```
api.update_status("The awesome text you would like to tweet")

```

The tweepy library has many other methods that can be useful for a Twitter bot. For the full details of the API, check the [documentation][5].

### A magazine bot

Let’s create a bot that searches for Fedora Magazine tweets and automatically retweets them.

To avoid retweeting the same tweet multiple times, the bot stores the tweet ID of the last retweet. Two helper functions, store_last_id and get_last_id, will be used to save and retrieve this ID.

Then the bot uses the tweepy search API to find the Fedora Magazine tweets that are more recent than the stored ID.
```
import tweepy


def store_last_id(tweet_id):
 """ Store a tweet id in a file """
 with open("lastid", "w") as fp:
 fp.write(str(tweet_id))


def get_last_id():
 """ Read the last retweeted id from a file """
 with open("lastid", "r") as fp:
 return fp.read()


if __name__ == '__main__':

 auth = tweepy.OAuthHandler("your_consumer_key", "your_consumer_key_secret")

 auth.set_access_token("your_access_token", "your_access_token_secret") api = tweepy.API(auth)

 try:
 last_id = get_last_id()
 except FileNotFoundError:
 print("No retweet yet")
 last_id = None

 for tweet in tweepy.Cursor(api.search, q="fedoramagazine.org", since_id=last_id).items():
 if tweet.user.name == 'Fedora Project':
 store_last_id(tweet.id)
 tweet.retweet()
 print(f'"{tweet.text}" was retweeted'

```

In order to retweet only tweets from the Fedora Magazine, the bot searches for tweets that contain fedoramagazine.org and are published by the “Fedora Project” Twitter account.

### Conclusion

In this article you saw how to create a Twitter application using the tweepy Python library to automate reading, sending and searching tweets. You can now use your creativity to create a Twitter bot of your own.

The source code of the example in this article is available on [Github][6].


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/learn-build-twitter-bot-python/

作者：[Clément Verna][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://twitter.com
[2]:https://tweepy.readthedocs.io/en/v3.5.0/
[3]:https://fedoramagazine.org/install-pipenv-fedora/
[4]:https://fedoramagazine.org/wp-content/uploads/2018/07/Screenshot-from-2018-07-19-20-17-17.png
[5]:http://docs.tweepy.org/en/v3.5.0/api.html#id1
[6]:https://github.com/cverna/magabot
