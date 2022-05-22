[#]: subject: "5 benefits of switching from Google Analytics to Plausible"
[#]: via: "https://opensource.com/article/22/5/plausible-analytics"
[#]: author: "Tom Greenwood https://opensource.com/users/tpgreenwood"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 benefits of switching from Google Analytics to Plausible
======
Plausible is an open source alternative to Google Analytics.

![The legacy of open source and the tide of progress][1]
Image by: Opensource.com

Google Analytics (GA) has been the industry standard web analytics tool for about as long as there have been analytics tools. Nearly every brief that my WordPress agency receives specifies that GA must be installed. And there is rarely any debate around whether it's the best tool for the job.

My team at Wholegrain Digital has had concerns about GA in terms of privacy, General Data Protection Regulation (GDPR) compliance, performance, user experience, not to mention Google as a global advertising, and search monopoly. However, we continued using GA for 99% of our projects because we didn't feel that there was a strong enough alternative.

Well, that has changed. We've made a decision that GA will no longer be our default analytics tool. Instead, our default analytics tool will be [Plausible][2].

In this article, I'll outline why we consider Plausible a better choice as a default analytics solution, the compromises to be aware of, and how it will impact our clients.

### Why use Plausible instead of Google Analytics

We believe that using Plausible over GA is not a purely ideological choice. There are in fact a number of tangible benefits that make it an objectively better product in many cases. Let's take a look at some of these benefits.

#### Privacy

One of Plausible's headline benefits is that it has been designed as a privacy-first analytics tool. This might sound like an ideological factor, but it has real practical implications too.

Plausible only collects anonymous user data, and does not use cookies. This means that unlike most analytics solutions, it complies with both the GDPR and the European Cookie Law, so it's a tick in the box for legal compliance. It's also hosted in the EU and the data is owned by you so it doesn't get shared with any other organizations, which is another tick.

This has a positive knock-on effect for user experience, because without privacy-invading cookies, you don't need to implement a cookie banner on the website (unless you use cookies for other things). Considering that the first few seconds of a website visit are the most critical to brand experience and conversion rates, cookie banners are arguably the single most damaging thing to the success of any online service. Avoiding these banners puts your brand and message first, helps you make a good first impression, and increases conversion rates.

#### Simpler user interface

The GA dashboard was never a great case study in intuitive design, but as the functionality of GA has expanded, so too has the complexity of the interface. I'm increasingly hearing frustrations from even experienced web marketers that they sometimes struggle to find basic data inside GA.

Plausible has taken the opposite approach and focused on ease of use over quantity of features. The dashboard is beautifully designed to showcase the data you want in a way that is easy to find and understand. It's what most people wish GA to be and it's a breath of fresh air.

![Image of Plausible with a dark theme][3]
Image by: (Tom Greenwood, CC BY-SA 4.0)

This is not just a pleasantry. The reality is that if a tool is easy to use then you will use it, and if it is hard to use then you won't. The simplicity of the Plausible interface means that even though it has less features, many users are likely to get a lot more insights and value from their analytics.

#### Better web performance

The Plausible tracking script is the smallest we are aware of for any analytics service, coming in at less than 1kb compared to 17kb for GA and even more if you're using Google Tag Manager.

Better web performance improves user experience, helps your website to rank better in search engines and improves conversion rates. Web performance matters, and when it comes to web performance, every kilobyte matters.

#### Reduced environmental impact

Plausible's tiny tracking script isn't just good for web performance, it's also good for the environment. At Wholegrain we are world leaders in sustainable web design and understand that every bit of wasted data is also wasted energy and carbon emissions.

This adds up. As a minimum, switching to Plausible would save 16kb per visitor, so for a website with a modest 10K visitors per month this would be 160MB of data per month, or 2GB per year. A back of an envelope calculation using the latest methodology that we have developed for website carbon calculations put this at about the equivalent of 800 grams of CO2. Now multiply that up by the millions of websites running worldwide and you are talking about significant amounts of wasted energy and unnecessary carbon emissions.

But it doesn't stop there. Analytics tools consume energy on the end user's device as they harvest data, in the transmission networks as they send that data back to the data center, and in the data center to store it all for eternity. By tracking less, Plausible is using less energy in its operation than bloated analytics tools such as GA that are tracking many more metrics that most people don't need.

Plausible also hosts the data in data centers with a commitment to using renewable sources of electricity, which is great (though to be fair Google also does that), and they donate 5% of their revenue to good causes, so the money you are paying is also helping support environmental and social projects.

#### More accurate data

Finally, Plausible breaks one of the greatest myths about GA, which is that it is accurate. Plausible's own research and our own experiences with client websites show that GA can significantly under report data, sometimes by as much as 50-60%.

When you look at GA and you think you are looking at all of your website data, you are most likely only looking at a portion of it. This is because GA is more likely to be blocked by ad blockers and privacy friendly web browsers, but perhaps more significantly because GA should not be tracking your visitors unless they have accepted cookies, which many visitors do not.

Plausible therefore offers us a simple way to get a more complete and accurate view of website visitors. Needless to say, if you are a digital marketing manager and you want to make yourself look good, you want to use the analytics service that reports all of your visitors and not just some of them.

### Are there any downsides?

There are very few downsides to using Plausible. If you are a GA power user and genuinely need a lot of its more advanced functionality then Plausible is not going to meet all of your needs. Plausible can track events, conversions, and campaigns but if you need more than that then you'll need another tool.

The only other notable downside to Plausible is that it is not free. There is a monthly fee but it is very reasonable, starting at $6 per month. It's a small price to pay for such a good tool, to protect the privacy of your website visitors and to maintain ownership of your data.

### What are the impacts?

Here at Wholegrain Digital we are implementing Plausible in a way that we hope will offer many of our clients the benefits listed above without the downsides. Nobody will be forced to stop using GA, but we will be talking about the benefits of Plausible proactively with our clients and including it in our proposals as the default option.

In many cases, Plausible is not just capable of meeting a project's requirements, but is objectively a better solution than GA, so we'll be trying to help our clients to reap the benefits of this.

In cases where advanced GA features are required, we will of course stick with GA for now. And in some cases, we may run GA and Plausible in parallel. This has a small overhead in terms of carbon footprint and performance, so it isn't our first choice. However, in some cases it may provide a necessary bridge to help our clients gain confidence in Plausible before making the leap, or help them gain a complete data set while ensuring compliance with privacy laws.

As for the costs, Plausible is a very good value for what it offers, but we will be offering it free of charge to our clients for any websites cared for on our WordPress maintenance service. We hope that this will help lower the barrier to entry and help more of our clients and their website visitors gain the benefits of Plausible.

### It is Plausible!

I hope I've convinced you that Plausible is not just a viable but a really great alternative to GA. If you need any advice on how to figure out the best analytics solution for your website or how to ensure that you are GDPR compliant without compromising user experience, get in touch with me.

*This article originally appeared on the Wholegrain Digital blog and has been republished with permission.*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/plausible-analytics

作者：[Tom Greenwood][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tpgreenwood
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/LIFE_wavegraph.png
[2]: https://plausible.io
[3]: https://opensource.com/sites/default/files/2022-05/Plausible-%C2%B7-websitecarbon-com.jpg
