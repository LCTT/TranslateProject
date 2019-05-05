用 NodeJS 进行 Twitter 情感分析
============================================================


![](https://i.imgur.com/7hIfpzt.png)

如果你想知道大家对某件事情的看法，Twitter 是最好的地方了。Twitter 是观点持续不断的涌现出来的地方，每秒钟大概有 6000 条新 Twitter 发送出来。因特网上的发展很快，如果你想与时俱进或者跟上潮流，Twitter 就是你要去的地方。

现在，我们生活在一个数据为王的时代，很多公司都善于运用 Twitter 上的数据。根据测量到的他们新产品的人气，尝试预测之后的市场趋势，分析 Twitter 上的数据有很多用处。通过数据，商人把产品卖给合适的用户，收集关于他们品牌和改进的反馈，或者获取他们产品或促销活动失败的原因。不仅仅是商人，很多政治和经济上的决定是在观察人们意见的基础上所作的。今天，我会试着让你感受下关于 Twitter 的简单 [情感分析][1]，判断这个 Twitter 是正能量、负能量还是中性的。这不会像专业人士所用的那么复杂，但至少，它会让你知道挖掘观念的想法。

我们将使用 NodeJs，因为 JavaScript 太常用了，而且它还是最容易入门的语言。

### 前置条件:

*   安装了 NodeJs 和 NPM 
*   有 NodeJs 和 NPM 包的经验
*   熟悉命令行。

好了，就是这样。开始吧。

### 开始

为了你的项目新建一个目录，进入这个目录下面。打开终端（或是命令行）。进入刚创建的目录下面，运行命令 `npm init -y`。这会在这个目录下创建一个 `package.json` 文件。现在我们可以安装需要的 npm 包了。只需要创建一个新文件，命名为 `index.js` 然后我们就完成了初始的编码。

### 获取推文

好了，我们想要分析 Twitter ，为了实现这个目的，我们需要以编程的方式访问 Twitter。为此，我们要用到 [twit][2] 包。因此，先用 `npm i wit` 命令安装它。我们还需要注册一个 App，以通过我们的账户来访问 Twitter 的 API。点击这个 [链接][3]，填写所有项目，从 “Keys and Access Token” 标签页中复制 “Consumer Key”、“Consumer Secret”、“Access token” 和 “Access Token Secret” 这几项到一个 `.env` 文件中，就像这样：

```
# .env
# replace the stars with values you copied
CONSUMER_KEY=************
CONSUMER_SECRET=************
ACCESS_TOKEN=************
ACCESS_TOKEN_SECRET=************
```

现在开始。

用你最喜欢的代码编辑器打开 `index.js`。我们需要用 `npm i dotenv` 命令安装 `dotenv` 包来读取 `.env` 文件。好了，创建一个 API 实例。

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

这里已经用所需的配置文件建立了到 Twitter 上的连接。但我们什么事情都没做。先定义个获取推文的函数：

```
async function get_tweets(q, count) {
    let tweets = await api.get('search/tweets', {q, count, tweet_mode: 'extended'});
    return tweets.data.statuses.map(tweet => tweet.full_text);
}
```

这是个 async 函数，因为 `api.get` 函数返回一个 promise 对象，而不是 `then` 链，我想通过这种简单的方式获取推文。它接收两个参数 `q` 和 `count`，`q` 是查询或者我们想要搜索的关键字，`count` 是让这个 `api` 返回的推文数量。

目前为止我们拥有了一个从 Twitter 上获取完整文本的简单方法。不过这里有个问题，现在我们要获取的文本中可能包含某些连接或者由于转推而被截断了。所以我们会编写另一个函数，拆解并返回推文的文本，即便是转发的推文，并且其中有链接的话就删除。

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

现在我们拿到了文本。下一步是从文本中获取情感。为此我们会使用 `npm` 中的另一个包 —— [`sentiment`][4]。让我们像安装其他包那样安装 `sentiment`，添加到脚本中。

```
const sentiment = require('sentiment')
```

`sentiment` 用起来很简单。我们只用把 `sentiment` 函数用在我们想要分析的文本上，它就能返回文本的相对分数。如果分数小于 0，它表达的就是消极情感，大于 0 的分数是积极情感，而 0，如你所料，表示中性的情感。基于此，我们将会把推文打印成不同的颜色 —— 绿色表示积极，红色表示消极，蓝色表示中性。为此，我们会用到 [`colors`][5] 包。先安装这个包，然后添加到脚本中。

```
const colors = require('colors/safe');
```

好了，现在把所有东西都整合到 `main` 函数中。

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

最后，执行 `main` 函数。

```
main();
```

就是这样，一个简单的分析推文中的基本情感的脚本。

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
译者：[BriFuture](https://github.com/BriFuture)
校对：[wxy](https://github.com/wxy)

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
