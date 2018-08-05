学习如何使用 Python 构建你自己的 Twitter 机器人
======

![](https://fedoramagazine.org/wp-content/uploads/2018/07/twitterbot-816x345.jpg)

Twitter 允许用户将博客帖子和文章[分享][1]给全世界。使用 Python 和 Tweepy 库使得创建一个 Twitter 机器人来接管你的所有的推特变得非常简单。这篇文章告诉你如何去构建这样一个机器人。希望你能将这些概念也同样应用到其他的在线服务的项目中去。

### 开始

[tweepy][2] 库可以让创建一个 Twitter 机器人的过程更加容易上手。它包含了 Twitter 的 API 调用和一个很简单的接口。

下面这些命令使用 `pipenv` 在一个虚拟环境中安装 tweepy。如果你没有安装 `pipenv`，可以看一看我们之前的文章[如何在 Fedora 上安装 Pipenv][3]。

```
$ mkdir twitterbot
$ cd twitterbot
$ pipenv --three
$ pipenv install tweepy
$ pipenv shell
```

### Tweepy —— 开始

要使用 Twitter API ，机器人需要通过 Twitter 的授权。为了解决这个问题， tweepy 使用了 OAuth 授权标准。你可以通过在 <https://apps.twitter.com/> 创建一个新的应用来获取到凭证。


#### 创建一个新的 Twitter 应用

当你填完了表格并点击了“<ruby>创建你自己的 Twitter 应用<rt>Create your Twitter application</rt></ruby>”的按钮后，你可以获取到该应用的凭证。 Tweepy 需要<ruby>用户密钥<rt>API Key</rt></ruby>和<ruby>用户密码<rt>API Secret</rt></ruby>，这些都可以在  “<ruby>密钥和访问令牌<rt>Keys and Access Tokens</rt></ruby>” 中找到。

![][4]

向下滚动页面，使用“<ruby>创建我的访问令牌<rt>Create my access token</rt></ruby>”按钮生成一个“<ruby>访问令牌<rt>Access Token</rt></ruby>” 和一个“<ruby>访问令牌密钥<rt>Access Token Secret</rt></ruby>”。

#### 使用 Tweppy —— 输出你的时间线

现在你已经有了所需的凭证了，打开一个文件，并写下如下的 Python 代码。

```
import tweepy
auth = tweepy.OAuthHandler("your_consumer_key", "your_consumer_key_secret")
auth.set_access_token("your_access_token", "your_access_token_secret")
api = tweepy.API(auth)
public_tweets = api.home_timeline()
for tweet in public_tweets:
    print(tweet.text)
```

在确保你正在使用你的 Pipenv 虚拟环境后，执行你的程序。

```
$ python tweet.py
```

上述程序调用了 `home_timeline` 方法来获取到你时间线中的 20 条最近的推特。现在这个机器人能够使用 tweepy 来获取到 Twitter 的数据，接下来尝试修改代码来发送 tweet。

#### 使用 Tweepy —— 发送一条推特 

要发送一条推特 ，有一个容易上手的 API 方法 `update_status` 。它的用法很简单：

```
api.update_status("The awesome text you would like to tweet")
```

Tweepy 拓展为制作 Twitter 机器人准备了非常多不同有用的方法。要获取 API 的详细信息，请查看[文档][5]。


### 一个杂志机器人

接下来我们来创建一个搜索 Fedora Magazine 的推特并转推这些的机器人。

为了避免多次转推相同的内容，这个机器人存放了最近一条转推的推特的 ID 。 两个助手函数 `store_last_id` 和 `get_last_id` 将会帮助存储和保存这个 ID。

然后，机器人使用 tweepy 搜索 API 来查找 Fedora Magazine 的最近的推特并存储这个 ID。

```
import tweepy

def store_last_id(tweet_id):
    """ Stores a tweet id in text file """
    with open('lastid', 'w') as fp:
        fp.write(str(tweet_id))


def get_last_id():
    """ Retrieve the list of tweets that were
    already retweeted """

    with open('lastid') as fp:
        return fp.read()

if __name__ == '__main__':

    auth = tweepy.OAuthHandler("your_consumer_key", "your_consumer_key_secret")
    auth.set_access_token("your_access_token", "your_access_token_secret")

    api = tweepy.API(auth)

    try:
        last_id = get_last_id()
    except FileNotFoundError:
        print("No retweet yet")
        last_id = None

    for tweet in tweepy.Cursor(api.search, q="fedoramagazine.org", since_id=last_id).items():
        if tweet.user.name  == 'Fedora Project':
            store_last_id(tweet.id)
            #tweet.retweet()
            print(f'"{tweet.text}" was retweeted')
```

为了只转推 Fedora Magazine 的推特 ，机器人搜索内容包含 fedoramagazine.org 和由 「Fedora Project」 Twitter 账户发布的推特。

### 结论

在这篇文章中你看到了如何使用 tweepy 的 Python 库来创建一个自动阅读、发送和搜索推特的 Twitter 应用。现在，你能使用你自己的创造力来创造一个你自己的 Twitter 机器人。

这篇文章的演示源码可以在 [Github][6] 找到。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/learn-build-twitter-bot-python/

作者：[Clément Verna][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[Bestony](https://github.com/bestony)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://twitter.com
[2]:https://tweepy.readthedocs.io/en/v3.5.0/
[3]:https://linux.cn/article-9827-1.html
[4]:https://fedoramagazine.org/wp-content/uploads/2018/07/Screenshot-from-2018-07-19-20-17-17.png
[5]:http://docs.tweepy.org/en/v3.5.0/api.html#id1
[6]:https://github.com/cverna/magabot
