The Cost of Native Mobile App Development is Too Damn High!
============================================================

### A value proposition

_A tipping point has been reached._ With the exception of a few unique use cases, it no longer makes sense to build and maintain your mobile applications using native frameworks and native development teams.

 ![](https://cdn-images-1.medium.com/max/1000/1*4nyeufIIgw9B7nMSr5Sybg.jpeg) 

Average cost of employing iOS, Android, and JavaScript developers in the United States ([http://www.indeed.com/salary][1], [http://www.payscale.com/research/US/Skill=JavaScript/Salary][2])

The cost of native mobile application development has been spiraling out of control for the past few years. It has become increasingly difficult for new startups without substantial funding to create native apps, MVPs and prototypes. Existing companies, who need to hold on to talent in order to iterate on existing applications or build new applications, are [fighting][6] [tooth][7]and [nail][8] [with companies from all around the world][9] and will do whatever it takes to retain the best of the best.

 ![](https://cdn-images-1.medium.com/max/800/1*imThyh2e45RW1np0xXIE4Q.png) 

Cost of developing an MVP early 2015, Native vs Hybrid ([Comomentum.com][3])

### So what does this mean for all of us?

If you are a huge company or you are flush with cash, the old thinking was that as long as you threw enough money at native application development, you did not have anything to worry about. This is no longer the case.

Facebook, the last company in the world who you would think of as behind in the war for talent (because they aren’t), was facing problems with their native app that money could not fix. The application had gotten so large and complex that [they were seeing compilation times of up to 15 minutes for their mobile app][10]. This means that even testing minor user interface changes, like moving something around by a couple of points, could take hours (or even days).

In addition to the long compilation times, any time they needed to test a small change to their mobile, app it needed to be implemented and tested in two completely different environments (iOS and Android) with teams working with different languages and frameworks, muddying the waters even more.

Facebook’s solution to this problem is [React Native][11].

### What about ditching Mobile Apps for Web only?

[Some people think mobile apps are doomed.][12] While I really enjoy and respect [Eric Elliott][13] and his work, let’s take a look at some recent data and discuss some opposing viewpoints:


 ![](https://cdn-images-1.medium.com/max/800/1*s0O7X2PgIqP5_zselxQdqQ.png) 

Time spent in mobile apps (April 2016, [smartinsights.com][4])

> 90% of Time on Mobile is Spent in Apps

There are 2.5 billion people on mobile phones in the world right now. [That number is going to be 5 billion sooner than we think.][14] _It is absolutely insane to think that leaving 4.5 billion people out of your business or application makes sense__ in most scenarios._

The old argument was that native mobile application development was too expensive for most companies. While this was true, the cost of web development is also on the rise, with [the average salary of a JavaScript developer in the US being in the range of $97,000.00][15].

With the increased complexity and skyrocketing demand for high quality web development, the average price for a JavaScript developer is inching towards that of a Native developer. Arguing that web development is cheaper is no longer a valid argument.

### What about Hybrid?

Hybrid apps are HTML5 apps that are wrapped inside of a native container and provide access to native platform features. Cordova and PhoneGap are prime examples.

_If you’re looking to build an MVP, prototype, or are not worried about the user experience mimicking that of a native app, then a hybrid app may work for you, keeping in mind the entire project will need to be rewritten if you do end up wanting to go native._

There are many innovative things going on in this space, my favorite being the [Ionic Framework][16]. Hybrid is getting better and better, but it is still not as fluid or natural feeling as Native.

For many companies, including most serious startups as well as medium and large sized companies, hybrid apps may not deliver the quality that they want and that their customers demand, leaving the feeling unpolished and less professional.

[While I have read and heard that of the top 100 apps on the app store, zero of them are hybrid,][17] I have not been able to back up this claim with evidence, but I would not doubt if the number were between zero and 5, and this is for a reason.

> [Our Biggest Mistake Was Betting Too Much On HTML5 ][18]— Mark Zuckerberg

### The solution

If you’ve been keeping up with the mobile development landscape you have undoubtedly heard of projects such as [NativeScript][19] and [React Native][20].

These projects allow you to build native quality mobile applications with JavaScript and use the same fundamental UI building blocks as regular iOS and Android apps.

With React Native you can have a single engineer or team of engineers specialize in cross platform mobile app development, [native desktop development][21], and even web development [using the existing codebase][22] or [the underlying technology][23], shipping your applications to the App Store, the Play Store, and the Web for a fraction of the traditional cost without losing out on the benefits of native performance and quality.

It is not unheard of for React Native apps to reuse up to 90% of their code across platforms, though the range is usually between 80% and 90%.

If your team is using React Native, it eliminates the divide between teams resulting in more consistency in both the UI and the APIs being built, speeding up the development time.

There is no need for compilation with React Native, as the app updates instantly when saving, also speeding up development time.

React Native also allows you to use tools such as [Code Push][24] and [AppHub][25] to remotely update your JavaScript code. This means that you can push updates, features, and bug fixes instantly to your users, bypassing the labor of bundling, submitting, and having your app accepted to the App and Google play stores, a process that can take between 2 and 7 days (the App Store being the main pain point in this process). This is something that is not possible with native apps, though is possible with hybrid apps.

If innovation in this space continues as it has been since it’s release, in the future you will even be able to build for platforms such as the [Apple Watch ][26], [Apple TV][27], and [Tizen][28] to name a few.

> NativeScript is still fairly new as the framework powering it, Angular 2, [was just released out of beta a few months ago,][29] but it too has a promising future as long as Angular2 holds on to a decent share of the market.

What you may not know is that some of the most innovative and largest technology companies in the world are betting big on these types of technologies, specifically [React Native.][30]

I have also spoken to and am working with multiple enterprise and fortune 500 companies currently making the switch to React Native.

### Notably Using React Native in Production

Along with the below examples, [here is a list of notable apps using React Native.][31]

### Facebook

 ![](https://cdn-images-1.medium.com/max/800/1*36atCP-kVNoYrit2RMR-8g.jpeg) 

React Native Apps by Facebook

Facebook is now using React Native for both [Ads Manager][32] and [Facebook Groups,][33] and [will be implementing the framework to power it’s news feed.][34]

Facebook also spends a lot of money creating and maintaining open source projects such as React Native, and t[hey and their open source developers have done a fantastic job lately by creating a lot of awesome projects ][35]that people like me and businesses all around the world benefit greatly from using on a daily basis.

### Instagram


 ![](https://cdn-images-1.medium.com/max/800/1*MQ0ezjRsUW3A5I0ahryHPg.jpeg) 

Instagram

React Native has been implemented in parts of the Instagram mobile app.

### Airbnb


 ![](https://cdn-images-1.medium.com/max/800/1*JS3R_cfLsDFCmAZJmtVEvg.jpeg) 

Airbnb

Much of Airbnb is being rewritten in React Native (via [Leland Richardson][36])




Over 90% of the Airbnb Trips Platform is written in React Native (via [spikebrehm][37])



### Vogue


 ![](https://cdn-images-1.medium.com/max/800/1*V9JMA2L3lXcO1nczCN3gcA.jpeg) 

Vogue Top 10 apps of 2016

Vogue stands out not only because it was also written in React Native, but [because it was ranked as one of the 10 Best Apps of the Year, according to Apple][38].


 ![](https://cdn-images-1.medium.com/max/800/1*vPDVV-vwvjfL3MsHpOO8rQ.jpeg) 

Microsoft

Microsoft is betting heavily on React Native.

They have already release multiple open source tools, including [Code Push][39], [React Native VS Code,][40] and [React Native Windows][41], in the shift towards helping developers in the React Native space.

Their thoughts behind this are that if people are already building their apps using React Native for iOS and Android, and they can reuse up to 90% of their code, then s_hipping to Windows costs them little extra relative to the cost && time already spent building the app in the first place._

Microsoft has contributed extensively to the React Native ecosystem and have done an excellent job in the Open Source space over the past few years.

### Conclusion

React Native and similar technologies are the next step and a paradigm shift in how we will build mobile UIS and mobile applications.

Companies

If your company is looking to cut costs and speed up development time without compromising on quality or performance, React Native is ready for prime time and will benefit your bottom line.

Developers

If you are a developer and want to enter into an rapidly evolving space with substantial future up side, I would highly recommend looking at adding React Native to your list of things to learn.

If you know JavaScript, you can hit the ground running very quickly, and I would recommend first trying it out using [Exponent][5] and seeing what you think. Exponent allows developers to easily build, test ,and deploy cross platform React Native apps on both Windows and macOS.

If you are already a native Developer, you will benefit especially because you will be able to competently dig into the native side of things when needed, something that is not needed often but when needed is a highly valuable skill to have on a team.

I have spent a lot of my time learning and teaching others about React Native because I am extremely excited about it and it is just plain fun to create apps using the framework.

Thanks for reading.

--------------------------------------------------------------------------------

作者简介：

![](https://cdn-images-1.medium.com/fit/c/60/60/1*uindYEb0zBpZTRV4suSkfg.jpeg)

Software Developer Specializing in Teaching and Building React Native

--------------------------------------------------------------------------------

via: https://hackernoon.com/the-cost-of-native-mobile-app-development-is-too-damn-high-4d258025033a

作者：[Nader Dabit][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://hackernoon.com/@dabit3
[1]:http://www.indeed.com/salary
[2]:http://www.payscale.com/research/US/Skill=JavaScript/Salary
[3]:http://www.comentum.com/mobile-app-development-cost.html
[4]:http://www.smartinsights.com/mobile-marketing/mobile-marketing-analytics/mobile-marketing-statistics/attachment/percent-time-spent-on-mobile-apps-2016/
[5]:https://medium.com/u/df61a4267d7a
[6]:http://www.bizjournals.com/charlotte/how-to/human-resources/2016/12/employers-offer-premium-wages-skilled-workers.html
[7]:https://www.cnet.com/news/silicon-valley-talent-wars-engineers-come-get-your-250k-salary/
[8]:http://www.nytimes.com/2015/08/19/technology/unicorns-hunt-for-talent-among-silicon-valleys-giants.html
[9]:http://blogs.wsj.com/cio/2016/09/30/tech-talent-war-moves-to-africa/
[10]:https://devchat.tv/react-native-radio/08-bridging-react-native-components-with-tadeu-zagallo
[11]:https://facebook.github.io/react-native/
[12]:https://medium.com/javascript-scene/native-apps-are-doomed-ac397148a2c0#.w06yd23ej
[13]:https://medium.com/u/c359511de780
[14]:http://ben-evans.com/benedictevans/2016/12/8/mobile-is-eating-the-world
[15]:http://www.indeed.com/salary?q1=javascript+developer&l1=united+states&tm=1
[16]:https://ionicframework.com/
[17]:https://medium.com/lunabee-studio/why-hybrid-apps-are-crap-6f827a42f549#.lakqptjw6
[18]:https://techcrunch.com/2012/09/11/mark-zuckerberg-our-biggest-mistake-with-mobile-was-betting-too-much-on-html5/
[19]:https://www.nativescript.org/
[20]:https://facebook.github.io/react-native/
[21]:https://github.com/ptmt/react-native-macos
[22]:https://github.com/necolas/react-native-web
[23]:https://facebook.github.io/react/
[24]:http://microsoft.github.io/code-push/
[25]:https://apphub.io/
[26]:https://github.com/elliottsj/apple-watch-uikit
[27]:https://github.com/douglowder/react-native-appletv
[28]:https://www.tizen.org/blogs/srsaul/2016/samsung-committed-bringing-react-native-tizen
[29]:http://angularjs.blogspot.com/2016/09/angular2-final.html
[30]:https://facebook.github.io/react-native/
[31]:https://facebook.github.io/react-native/showcase.html
[32]:https://play.google.com/store/apps/details?id=com.facebook.adsmanager
[33]:https://itunes.apple.com/us/app/facebook-groups/id931735837?mt=8
[34]:https://devchat.tv/react-native-radio/40-navigation-in-react-native-with-eric-vicenti
[35]:https://code.facebook.com/projects/
[36]:https://medium.com/u/41a8b1601c59
[37]:https://medium.com/u/71a78c1b069b
[38]:http://www.highsnobiety.com/2016/12/08/iphone-apps-best-of-the-year-2016/
[39]:http://microsoft.github.io/code-push/
[40]:https://github.com/Microsoft/vscode-react-native
[41]:https://github.com/ReactWindows/react-native-windows
[42]:https://twitter.com/dabit3
[43]:http://reactnative.training/
