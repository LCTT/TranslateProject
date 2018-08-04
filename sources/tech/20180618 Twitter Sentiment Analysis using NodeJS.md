BriFuture is translating

Twitter Sentiment Analysis using NodeJS
============================================================


![](https://i.imgur.com/7hIfpzt.png)

If you want to know how people feel about something, there is no better place than Twitter. It is a continuous stream of opinion, with around 6,000 new tweets being created every second. The internet is quick to react to events and if you want to be updated with the latest and hottest, Twitter is the place to be.

Now, we live in an age where data is king and companies put Twitter's data to good use. From gauging the reception of their new products to trying to predict the next market trend, analysis of Twitter data has many uses. Businesses use it to market their product that to the right customers, to gather feedback on their brand and improve or to assess the reasons for the failure of a product or promotional campaign. Not only businesses, many political and economic decisions are made based on observation of people's opinion. Today, I will try and give you a taste of simple [sentiment analysis][1] of tweets to determine whether a tweet is positive, negative or neutral. It won't be as sophisticated as those used by professionals, but nonetheless, it will give you an idea about opinion mining.

We will be using NodeJs since JavaScript is ubiquitous nowadays and is one of the easiest languages to get started with.

### Prerequisite:

*   NodeJs and NPM installed

*   A little experience with NodeJs and NPM packages

*   some familiarity with the command line.

Alright, that's it. Let's get started.

### Getting Started

Make a new directory for your project and go inside the directory. Open a terminal (or command line). Go inside the newly created directory and run the `npm init -y` command. This will create a `package.json` in your directory. Now we can install the npm packages we need. We just need to create a new file named `index.js` and then we are all set to start coding.

### Getting the tweets

Well, we want to analyze tweets and for that, we need programmatic access to Twitter. For this, we will use the [twit][2] package. So, let's install it with the `npm i twit` command. We also need to register an App through our account to gain access to the Twitter API. Head over to this [link][3], fill in all the details and copy ‘Consumer Key’, ‘Consumer Secret’, ‘Access token’ and ‘Access Token Secret’ from 'Keys and Access Token' tabs in a `.env` file like this:

```
# .env
# replace the stars with values you copied
CONSUMER_KEY=************
CONSUMER_SECRET=************
ACCESS_TOKEN=************
ACCESS_TOKEN_SECRET=************

```

Now, let's begin.

Open `index.js` in your favorite code editor. We need to install the `dotenv`package to read from `.env` file with the command `npm i dotenv`. Alright, let's create an API instance.

```
const Twit = require('twit');
const dotenv = require('dotenv');

dotenv.config();

const { CONSUMER_KEY
      , CONSUMER_SECRET
      , ACCESS_TOKEN
      , ACCESS_TOKEN_SECRET
      } = process.env;

const config_twitter = {
    consumer_key: CONSUMER_KEY,
    consumer_secret: CONSUMER_SECRET,
    access_token: ACCESS_TOKEN,
    access_token_secret: ACCESS_TOKEN_SECRET,
    timeout_ms: 60*1000
};

let api = new Twit(config_twitter);

```

Here we have established a connection to the Twitter with the required configuration. But we are not doing anything with it. Let's define a function to get tweets.

```
async function get_tweets(q, count) {
    let tweets = await api.get('search/tweets', {q, count, tweet_mode: 'extended'});
    return tweets.data.statuses.map(tweet => tweet.full_text);
}

```

This is an async function because of the `api.get` the function returns a promise and instead of chaining `then`s, I wanted an easy way to extract the text of the tweets. It accepts two arguments -q and count, `q` being the query or keyword we want to search for and `count` is the number of tweets we want the `api` to return.

So now we have an easy way to get the full texts from the tweets. But we still have a problem, the text that we will get now may contain some links or may be truncated if it's a retweet. So we will write another function that will extract and return the text of the tweets, even for retweets and remove the links if any.

```
function get_text(tweet) {
    let txt = tweet.retweeted_status ? tweet.retweeted_status.full_text : tweet.full_text;
    return txt.split(/ |\n/).filter(v => !v.startsWith('http')).join(' ');
 }

async function get_tweets(q, count) {
    let tweets = await api.get('search/tweets', {q, count, 'tweet_mode': 'extended'});
    return tweets.data.statuses.map(get_text);
}

```

So, now we have the text of tweets. Our next step is getting the sentiment from the text. For this, we will use another package from `npm` - [`sentiment`][4]package. Let's install it like the other packages and add to our script.

```
const sentiment = require('sentiment')

```

Using `sentiment` is very easy. We will just have to call the `sentiment`function on the text that we want to analyze and it will return us the comparative score of the text. If the score is below 0, it expresses a negative sentiment, a score above 0 is positive and 0, as you may have guessed, is neutral. So based on this, we will print the tweets in different colors - green for positive, red for negative and blue for neutral. For this, we will use the [`colors`][5] package. Let's install it like the other packages and add to our script.

```
const colors = require('colors/safe');

```

Alright, now let us bring it all together in a `main` function.

```
async function main() {
    let keyword = \* define the keyword that you want to search for *\;
    let count = \* define the count of tweets you want *\;
    let tweets = await get_tweets(keyword, count);
    for (tweet of tweets) {
        let score = sentiment(tweet).comparative;
        tweet = `${tweet}\n`;
        if (score > 0) {
            tweet = colors.green(tweet);
        } else if (score < 0) {
            tweet = colors.red(tweet);
        } else {
            tweet = colors.blue(tweet);
        }
        console.log(tweet);
    }
}

```

And finally, execute the `main` function.

```
main();

```

There you have it, a short script of analyzing the basic sentiments of a tweet.

```
\\ full script
const Twit = require('twit');
const dotenv = require('dotenv');
const sentiment = require('sentiment');
const colors = require('colors/safe');

dotenv.config();

const { CONSUMER_KEY
      , CONSUMER_SECRET
      , ACCESS_TOKEN
      , ACCESS_TOKEN_SECRET
      } = process.env;

const config_twitter = {
    consumer_key: CONSUMER_KEY,
    consumer_secret: CONSUMER_SECRET,
    access_token: ACCESS_TOKEN,
    access_token_secret: ACCESS_TOKEN_SECRET,
    timeout_ms: 60*1000
};

let api = new Twit(config_twitter);

function get_text(tweet) {
    let txt = tweet.retweeted_status ? tweet.retweeted_status.full_text : tweet.full_text;
    return txt.split(/ |\n/).filter(v => !v.startsWith('http')).join(' ');
 }

async function get_tweets(q, count) {
    let tweets = await api.get('search/tweets', {q, count, 'tweet_mode': 'extended'});
    return tweets.data.statuses.map(get_text);
}

async function main() {
    let keyword = 'avengers';
    let count = 100;
    let tweets = await get_tweets(keyword, count);
    for (tweet of tweets) {
        let score = sentiment(tweet).comparative;
        tweet = `${tweet}\n`;
        if (score > 0) {
            tweet = colors.green(tweet);
        } else if (score < 0) {
            tweet = colors.red(tweet);
        } else {
            tweet = colors.blue(tweet)
        }
        console.log(tweet)
    }
}

main();
```

--------------------------------------------------------------------------------

via: https://boostlog.io/@anshulc95/twitter-sentiment-analysis-using-nodejs-5ad1331247018500491f3b6a

作者：[Anshul Chauhan][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://boostlog.io/@anshulc95
[1]:https://en.wikipedia.org/wiki/Sentiment_analysis
[2]:https://github.com/ttezel/twit
[3]:https://boostlog.io/@anshulc95/apps.twitter.com
[4]:https://www.npmjs.com/package/sentiment
[5]:https://www.npmjs.com/package/colors
[6]:https://boostlog.io/tags/nodejs
[7]:https://boostlog.io/tags/twitter
[8]:https://boostlog.io/@anshulc95
