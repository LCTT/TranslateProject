[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11460-1.html)
[#]: subject: (All That You Can Do with Google Analytics, and More)
[#]: via: (https://opensourceforu.com/2019/10/all-that-you-can-do-with-google-analytics-and-more/)
[#]: author: (Ashwin Sathian https://opensourceforu.com/author/ashwin-sathian/)

Google Analytics 的一些用法介绍
======

![][1]

Google Analytics （GA）这个最流行的用户活动追踪工具我们或多或少都听说过甚至使用过，但它的用途并不仅仅限于对页面访问的追踪。作为一个既实用又流行的工具，它已经受到了广泛的欢迎，因此我们将要在下文中介绍如何在各种 Angular 和 React 单页应用中使用 Google Analytics。

这篇文章源自这样一个问题：如何对单页应用中的页面访问进行跟踪？

通常来说，有很多的方法可以解决这个问题，在这里我们只讨论其中的一种方法。下面我会使用 Angular 来写出对应的实现，如果你使用的是 React，相关的用法和概念也不会有太大的差别。接下来就开始吧。

### 准备好应用程序

首先需要有一个<ruby>追踪 ID<rt>tracking ID</rt></ruby>。在开始编写业务代码之前，要先准备好一个追踪 ID，通过这个唯一的标识，Google Analytics 才能识别出某个点击或者某个页面访问是来自于哪一个应用。

按照以下的步骤：

  1. 访问 <https://analytics.google.com>；
  2. 提交指定信息以完成注册，并确保可用于 Web 应用，因为我们要开发的正是一个 Web 应用；
  3. 同意相关的条款，生成一个追踪 ID；
  4. 保存好追踪 ID。

追踪 ID 拿到了，就可以开始编写业务代码了。

### 添加 analytics.js 脚本

Google 已经帮我们做好了接入之前需要做的所有事情，接下来就是我们的工作了。不过我们要做的也很简单，只需要把下面这段脚本添加到应用的 `index.html` 里，就可以了：

```
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
</script>
```

现在我们来看一下 Google Analytics 是如何在应用程序中初始化的。

### 创建追踪器

首先创建一个应用程序的追踪器。在 `app.component.ts` 中执行以下两个步骤：

  1. 声明一个名为 `ga`，类型为 `any` 的全局变量（在 Typescript 中需要制定变量类型）；
  2. 将下面一行代码加入到 `ngInInit()` 中。

```
ga('create', <你的追踪 ID>, 'auto');
```

这样就已经成功地在应用程序中初始化了一个 Google Analytics 的追踪器了。由于追踪器的初始化是在 `OnInit()` 函数中执行的，因此每当应用程序启动，追踪器就会启动。

### 在单页应用中记录页面访问情况

我们需要实现的是记录<ruby>访问路由<rt>route-visits</rt></ruby>。

如何记录用户在一个应用中不同部分的访问，这是一个难点。从功能上来看，单页应用中的路由对应了传统多页面应用中各个页面之间的跳转，因此我们需要记录访问路由。要做到这一点尽管不算简单，但仍然是可以实现的。在 `app.component.ts` 的 `ngOnInit()` 函数中添加以下的代码片段：

```
import { Router, NavigationEnd } from '@angular/router';
...
constructor(public router: Router) {}
...
this.router.events.subscribe(
    event => {
        if (event instanceof NavigationEnd) {
            ga('set', 'page', event.urlAfterRedirects);
            ga('send', { hitType: 'pageview', hitCallback: () => { this.pageViewSent = true; }});
        }
    } 
);
```

神奇的是，只需要这么几行代码，就实现了 Angular 应用中记录页面访问情况的功能。

这段代码实际上做了以下几件事情：

  1. 从 Angular Router 中导入了 `Router`、`NavigationEnd`；
  2. 通过构造函数中将 `Router` 添加到组件中；
  3. 然后订阅 `router` 事件，也就是由 Angular Router 发出的所有事件；
  4. 只要产生了一个 `NavigationEnd` 事件实例，就将路由和目标作为一个页面访问进行记录。

这样，只要使用到了页面路由，就会向 Google Analytics 发送一条页面访问记录，在 Google Analytics 的在线控制台中可以看到这些记录。

类似地，我们可以用相同的方式来记录除了页面访问之外的活动，例如某个界面的查看次数或者时长等等。只要像上面的代码那样使用 `hitCallBack()` 就可以在有需要收集的数据的时候让应用程序作出反应，这里我们做的事情仅仅是把一个变量的值设为 `true`，但实际上 `hitCallBack()` 中可以执行任何代码。

### 追踪用户交互活动

除了页面访问记录之外，Google Analytics 还经常被用于追踪用户的交互活动，例如某个按钮的点击情况。“提交按钮被用户点击了多少次？”，“产品手册会被经常查阅吗？”这些都是 Web 应用程序的产品评审会议上的常见问题。这一节我们将会介绍如何实现这些数据的统计。

#### 按钮点击

设想这样一种场景，需要统计到应用程序中某个按钮或链接被点击的次数，这是一个和注册之类的关键动作关系最密切的数据指标。下面我们来举一个例子：

假设应用程序中有一个“感兴趣”按钮，用于显示即将推出的活动，你希望通过统计这个按钮被点击的次数来推测有多少用户对此感兴趣。那么我们可以使用以下的代码来实现这个功能：

```
...
params = {
    eventCategory:
    'Button'
    ,
    eventAction:
    'Click'
    ,
    eventLabel:
    'Show interest'
    ,
    eventValue:
    1
};

showInterest() {
    ga('send', 'event', this.params);
}
...
```

现在看下这段代码实际上做了什么。正如前面说到，当我们向 Google Analytics 发送数据的时候，Google Analytics 就会记录下来。因此我们可以向 `send()` 方法传递不同的参数，以区分不同的事件，例如两个不同按钮的点击记录。

1、首先我们定义了一个 `params` 对象，这个对象包含了以下几个字段：

  1. `eventCategory` – 交互发生的对象，这里对应的是按钮（button）
  2. `eventAction` – 发生的交互的类型，这里对应的是点击（click）
  3. `eventLabel` – 交互动作的标识，这里对应的是这个按钮的内容，也就是“感兴趣”
  4. `eventValue` – 与每个发生的事件实例相关联的值

由于这个例子中是要统计点击了“感兴趣”按钮的用户数，因此我们把 `eventValue` 的值定为 1。

2、对象构造完成之后，下一步就是将 `params` 对象作为请求负载发送到 Google Analytics，而这一步是通过事件绑定将 `showInterest()` 绑定在按钮上实现的。这也是使用 Google Analytics 追踪中最常用的发送事件方法。

至此，Google Analytics 就可以通过记录按钮的点击次数来统计感兴趣的用户数了。

#### 追踪社交活动

Google Analytics 还可以通过应用程序追踪用户在社交媒体上的互动。其中一种场景就是在应用中放置类似 Facebook 的点赞按钮，下面我们来看看如何使用 Google Analytics 来追踪这一行为。

```
...
fbLikeParams = {
    socialNetwork:
        'Facebook',
    socialAction:
        'Like',
    socialTarget:
        'https://facebook.com/mypage'
};
...
fbLike() {
    ga('send', 'social', this.fbLikeParams);
}
```

如果你觉得这段代码似曾相识，那是因为它确实跟上面统计“感兴趣”按钮点击次数的代码非常相似。下面我们继续看其中每一步的内容：

1、构造发送的数据负载，其中包括以下字段：

  1. `socialNetwork` – 交互发生的社交媒体，例如 Facebook、Twitter 等等
  2. `socialAction` – 发生的交互类型，例如点赞、发表推文、分享等等
  3. `socialTarget` – 交互的目标 URL，一般是社交媒体账号的主页

2、下一步是增加一个函数来发送整个交互记录。和统计按钮点击数量时相比，这里使用 `send()` 的方式有所不同。另外，我们还需要把这个函数绑定到已有的点赞按钮上。

在追踪用户交互方面，Google Analytics 还可以做更多的事情，其中最重要的一种是针对异常的追踪，这让我们可以通过 Google Analytics 来追踪应用程序中出现的错误和异常。在本文中我们就不赘述这一点了，但我们鼓励读者自行探索。

### 用户识别

#### 隐私是一项权利，而不是奢侈品

Google Analytics 除了可以记录很多用户的操作和交互活动之外，这一节还将介绍一个不太常见的功能，就是可以控制是否对用户的身份进行追踪。

#### Cookies

Google Analytics 追踪用户活动的方式是基于 Cookies 的，因此我们可以自定义 Cookies 的名称以及一些其它的内容，请看下面这段代码：

```
trackingID =
    'UA-139883813-1'
;
cookieParams = {
    cookieName: 'myGACookie',
    cookieDomain: window.location.hostname,
    cookieExpires: 604800
};
...
ngOnInit() {
    ga('create', this.trackingID, this.cookieParams);
...
}
```

在上面这段代码中，我们设置了 Google Analytics Cookies 的名称、域以及过期时间，这就让我们能够将不同网站或 Web 应用的 Cookies 区分开来。因此我们需要为我们自己的应用程序的 Google Analytics 追踪器的 Cookies 设置一个自定义的标识1，而不是一个自动生成的随机标识。

#### IP 匿名

在某些场景下，我们可能不需要知道应用程序的流量来自哪里。例如对于一个按钮点击的追踪器，我们只需要关心按钮的点击量，而不需要关心点击者的地理位置。在这种场景下，Google Analytics 允许我们只追踪用户的操作行为，而不获取到用户的 IP 地址。

```
ipParams = {
    anonymizeIp: true
};
...
ngOnInit() {
    ...
    ga('set', this.ipParams);
    ...
}
```

在上面这段代码中，我们将 Google Analytics 追踪器的 `abibymizeIp` 参数设置为 `true`。这样用户的 IP 地址就不会被 Google Analytics 所追踪，这可以让用户知道自己的隐私正在被保护。

#### 不被跟踪

还有些时候用户可能不希望自己的行为受到追踪，而 Google Analytics 也允许这样的需求。因此也存在让用户不被追踪的选项。 

```
...
optOut() {
    window['ga-disable-UA-139883813-1'] = true;
}
...
```

`optOut()` 是一个自定义函数，它可以禁用页面中的 Google Analytics 追踪，我们可以使用按钮或复选框上得事件绑定来使用这一个功能，这样用户就可以选择是否会被 Google Analytics 追踪。

在本文中，我们讨论了 Google Analytics 集成到单页应用时的难点，并探索出了一种相关的解决方法。我们还了解到了如何在单页应用中追踪页面访问和用户交互，例如按钮点击、社交媒体活动等。

最后，我们还了解到 Google Analytics 为用户提供了保护隐私的功能，尤其是用户的一些隐私数据并不需要参与到统计当中的时候。而用户也可以选择完全不受到 Google Analytics 的追踪。除此以外，Google Analytics 还可以做到很多其它的事情，这就需要我们继续不断探索了。

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/10/all-that-you-can-do-with-google-analytics-and-more/

作者：[Ashwin Sathian][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/ashwin-sathian/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Analytics-illustration.jpg?resize=696%2C396&ssl=1 (Analytics illustration)
[2]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Analytics-illustration.jpg?fit=900%2C512&ssl=1
