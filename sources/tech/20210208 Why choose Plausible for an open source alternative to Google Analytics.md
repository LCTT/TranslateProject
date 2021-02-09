[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why choose Plausible for an open source alternative to Google Analytics)
[#]: via: (https://opensource.com/article/21/2/plausible)
[#]: author: (Ben Rometsch https://opensource.com/users/flagsmith)

Why choose Plausible for an open source alternative to Google Analytics
======
Plausible is gaining attention and users as a viable, effective
alternative to Google Analytics.
![Analytics: Charts and Graphs][1]

Taking on the might of Google Analytics may seem like a big challenge. In fact, you could say it doesn't sound plausible… But that's exactly what [Plausible.io][2] has done with great success, signing up thousands of new users since 2018.

Plausible's co-founders Uku Taht and Marko Saric recently appeared on [The Craft of Open Source][3] podcast to talk about the project and how they:

  * Created a viable alternative to Google Analytics
  * Gained so much momentum in less than two years
  * Achieved their goals by open sourcing the project



Read on for a summary of their conversation with podcast host and Flagsmith founder Ben Rometsch.

### How Plausible got started

In winter 2018, Uku started coding a project that he thought was desperately needed—a viable, effective alternative to Google Analytics—after becoming disillusioned with the direction Google products were heading and the fact that all other data solutions seemed to use Google as a "data-handling middleman."

Uku's first instinct was to focus on the analytics side of things using existing database solutions. Right away, he faced some challenges. The first attempt, using PostgreSQL, was technically naïve, as it became overwhelmed and inefficient pretty quickly. Therefore, his goal morphed into making an analytics product that can handle large quantities of data points with no discernable decline in performance. To cut a long story short, Uku succeeded, and Plausible can now ingest more than 80 million records per month.

The first version of Plausible was released in summer 2019. In March 2020, Marko came on board to head up the project's communications and marketing side. Since then, its popularity has grown with considerable momentum.

### Why open source?

Uku was keen to follow the "indie hacker" route of software development: create a product, put it out there, and see how it grows. Open source makes sense in this respect because you can quickly grow a community and gain popularity.

But Plausible didn't start out as open source. Uku was initially concerned about the software's sensitive code, such as billing codes, but he soon released that this was of no use to people without the API token.

Now, Plausible is fully open source under [AGPL][4], which they chose instead of the MIT License. Uku explains that under an MIT License, anyone can do anything to the code without restriction. Under AGPL, if someone changes the code, they must open source their changes and contribute the code back to the community. This means that large corporations cannot take the original code, build from it, then reap all the rewards. They must share it, making for a more level playing field. For instance, if a company wanted to plug in their billing or login system, they would be legally obliged to publish the code.

During the podcast, Uku asked me about Flagsmith's license which is currently under a BSD 3-Clause license, which is highly permissive, but I am about to move some features behind a more restrictive license. So far, the Flagsmith community has been understanding of the change as they realize this will lead to more and better features.

### Plausible vs. Google Analytics

Uku says, in his opinion, the spirit of open source is that the code should be open for commercial use by anyone and shared with the community, but you can keep back a closed-source API module as a proprietary add-on. In this way, Plausible and other companies can cater to different use-cases by creating and selling bespoke API add-on licenses.

Marko is a developer by trade, but from the marketing side of things, he worked to get the project covered on sites such as Hacker News and Lobster and build a Twitter presence to help generate momentum. The buzz created by this publicity also meant that the project took off on GitHub, going from 500 to 4,300 stars. As traffic grew, Plausible appeared on GitHub's trending list, which helped its popularity snowball.

Marko also focused heavily on publishing and promoting blog posts. This strategy paid off, as four or five posts went viral within the first six months, and he used those spikes to amplify the marketing message and accelerate growth.

The biggest challenge in Plausible's growth was getting people to switch from Google Analytics. The project's main goal was to create a web analytics product that is useful, efficient, and accurate. It also needed to be compliant with regulations and offer a high degree of privacy for both the business and website visitors.

Plausible is now running on more than 8,000 websites. From talking to customers, Uku estimates that around 90% of them would have run Google Analytics.

Plausible runs on a standard software-as-a-service (SaaS) subscription model. To make things fairer, it charges per page view on a monthly basis, rather than charging per website. This can prove tricky with seasonal websites, say e-commerce sites that spike at the holidays or US election sites that spike once every four years. These can cause pricing problems under the monthly subscription model, but it generally works well for most sites.

### Check out the podcast

To discover more about how Uku and Marko grew the open source Plausible project at a phenomenal rate and made it into a commercial success, [listen to the podcast][3] and check out [other episodes][5] to learn more about "the ins-and-outs of the open source software community."

Sandstorm's Jade Wang shares some of her favorite open source web apps that are self-hosted...

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/plausible

作者：[Ben Rometsch][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/flagsmith
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/analytics-graphs-charts.png?itok=sersoqbV (Analytics: Charts and Graphs)
[2]: https://plausible.io/
[3]: https://www.flagsmith.com/podcast/02-plausible
[4]: https://www.gnu.org/licenses/agpl-3.0.en.html
[5]: https://www.flagsmith.com/podcast
