[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (All That You Can Do with Google Analytics, and More)
[#]: via: (https://opensourceforu.com/2019/10/all-that-you-can-do-with-google-analytics-and-more/)
[#]: author: (Ashwin Sathian https://opensourceforu.com/author/ashwin-sathian/)

All That You Can Do with Google Analytics, and More
======

[![][1]][2]

*We have all heard about or used Google Analytics (GA) – the most popular tool to track user activity such as, but not limited to, page visits. Its utility and popularity means that everybody wishes to use it. This article focuses on how to use it correctly in a world where single page Angular and React applications are becoming more popular by the day. *

A pertinent question is how does one track page visits in applications that have just one page?
As always, there are ways around this and we will look at one such option in this article. While we will do the implementation in an Angular application, the usage and concepts aren’t very different if the app is in React. So, let’s get started!

**Getting the application ready**
Getting a tracking ID: Before we write actual code, we need to get a tracking ID, the unique identifier that tells Google Analytics that data like a click or a page view is coming from a particular application.

To get this, we do the following:

  1. Go to _<https://analytics.google.com>_.
  2. Sign up by entering the required details. Make sure the registration is for the Web – ours is a Web application, after all.
  3. Agree to the _Terms and Conditions_, and generate your tracking ID.
  4. Copy the ID, which will perhaps look something like ‘UA-ID-Y’.



Now that the ID is ready, let’s write some code.

**Adding _analytics.js_ script**
While the team at Google has done all the hard work to get the Google Analytics tools ready for us to use, this is where we do our part – make it available to the application. This is simple – all that’s to be done is to add the following script to your application’s _index.html_:

```
<script>
(function(i,s,o,g,r,a,m){i[‘GoogleAnalyticsObject’]=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,’script’,’https://www.google-analytics.com/analytics.js’,’ga’);
</script>
```

With that out of the way, let’s see how we can initialise Google Analytics in the application.

**Creating the tracker**
Let’s now set up the tracker for the application. For this, _open app.component.ts_ and perform the following steps:

  1. Declare a global variable named ga, of type _any_ (remember, this is Typescript and you need to mention types).
  2. Insert the following line of code into _ngOnInit()_ of your component.



```
ga(‘create’, YOUR_TRACKING_ID, ‘auto’);
```

Congratulations! You have now successfully initiated a Google Analytics tracker in your application. Since the tracker initiation is made inside the _OnInit_ function, the tracker will get activated every time the application starts up.

**Recording page visits in the single page application**
What we need to do is record route-visits.

Now comes the tricky bit – tracking the parts of your application visited by users. From a functional aspect, we know that routes are stand-ins for traditional pages in modern single page Web applications. It means we need to record route-visits. This is not easy, but we can still achieve this.
In the _ngOnInit()_ function inside _app.component.ts_, add the following code snippet:

```
import { Router, NavigationEnd } from ‘@angular/router’;
…
constructor(public router: Router) {}
...
this.router.events.subscribe(
event => {
if (event instanceof NavigationEnd) {
ga(‘set’, ‘page’, event.urlAfterRedirects);
ga(‘send’, { hitType: ‘pageview’, hitCallback: () => { this.pageViewSent = true; }
});
}
} );
```

Believe it or not, those few lines of code have taken care of the ‘pageview’ recording issue in the Angular application.

Despite only a few lines of code, a fair bit is happening here:

  1. Import Router and NavigationEnd from Angular Router.
  2. Add Router to the component through its constructor.
  3. Next, subscribe to router events; i.e., all events emitted by the Angular Router.
  4. Whenever there is an instance of a NavigationEnd event (emitted whenever the application navigates to a route), we set that destination/ route as a page and this sends a pageview.



Now, every time a routing occurs, a pageview is sent to Google Analytics. You can view this in the online Google Analytics dashboard.

Like pageviews, we can record a lot of other activities like screenview, timing, etc, using the same syntax. We can set the program to react in any way we want to for all such send activities, through the _hitCallback()_, as shown in the code snippet. Here we are setting a variable value to true, but any piece of code can be executed in _hitCallback_.

**Tracking user interactions**
After pageviews, the most commonly tracked activities on Google Analytics are user interactions such as, but not limited to, button clicks. ‘How many times was the _Submit_ button clicked?’, ‘How often is the product brochure viewed?’ These are questions that are often asked in product review meetings for Web applications. In this section, we’ll look at this implementation using Google Analytics in the application.

**Button clicks:** Consider a case for which you wish to track the number of times a certain button/link in the application is clicked – a metric that is most associated with sign-ups, call-to-action buttons, etc. We’ll look at an example for this.

For this purpose, assume that you have a ‘Show Interest’ button in your application for an upcoming event. The organisers wish to keep track of how many people are interested in the event by tracking those clicking the button. The following code snippet facilitates this:

```
…
params = {
eventCategory:
‘Button’
,
eventAction:
‘Click’
,
eventLabel:
‘Show interest’
,
eventValue:
1
};

showInterest() {
ga(‘send’, ‘event’, this.params);
}
…
```

Let’s look at what is being done here. Google Analytics, as already discussed, records activities when we send the data to it. It is the parameters that we pass to this ‘send’ method that distinguish between various events like tracking clicks on two separate buttons.
1\. First, we define a ‘params’ object that should have the following fields:

  1. _eventCategory_ – An object with which interaction happens; in this case, a button.
  2. _eventAction_ – The type of interaction; in our case, a click.
  3. _eventLabel_ – An identifier for the interaction. In this case, we could call it Show Interest.
  4. _eventValue_ – Basically, the value you wish to associate with each instance of this event.



Since this example is measuring the number of people showing interest, we can set this value to 1.

2\. After constructing this object, the next part is pretty simple and one of the most commonly used methods as far as Google Analytics tracking goes – sending the event, with the ‘params’ object as a payload. We do this by using event binding on the button and attaching the _showInterest()_ button to it.

That’s it! Google Analytics (GA) will now track data of people expressing interest by clicking the button.

**Tracking social engagements:** Google Analytics also lets you track people’s interactions on social media through the application. One such case would be a Facebook-type ‘Like’ button for our brand’s page that we place in the application. Let’s look at how we can do this tracking using GA.

```
…
fbLikeParams = {
socialNetwork:
'Facebook',
socialAction:
'Like',
socialTarget:
'https://facebook.com/mypage'
};
…
fbLike() {
ga('send', 'social', this.fbLikeParams);
}
```

If that code looks familiar, it’s because it is very similar to the method by which we track button clicks. Let’s look at the steps:

1\. Construct the payload for sending data. This payload should have the following fields:

  1. _socialNetwork_ – The network the interaction is happening with, e.g., Facebook, Twitter, etc.
  2. _socialAction_ – What sort of interaction is happening, e.g., Like, Tweet, Share, etc.
  3. _socialTarget_ – What URL is being targeted by using the interaction. This could be the URL of the social media profile/page.



2\. The next method is, of course, to add a function to report this activity. Unlike a button click, we don’t use the _send_ method here, but the social method. Also, after this function is written, we bind it to the Like button we have in place.

There’s more that can be done with GA as far as tracking user interactions go, one of the top items being exception tracking. This allows us to track errors and exceptions occurring in the application using GA. We won’t delve deeper into it in this article; however, the reader is encouraged to explore this.

**User identity**
**Privacy is a right, not a luxury:** While Google Analytics can record a lot of activities as well as user interactions, there is one comparatively less known aspect, which we will look at in this section. There’s a lot of control we can place over tracking (and not tracking) user identity.
**Cookies:** GA uses cookies as a means to track a user’s activity. But we can define what these cookies are named and a couple of other aspects about them, as shown in the code snippet below:

```
trackingID =
‘UA-139883813-1’
;
cookieParams = {
cookieName: ‘myGACookie’,
cookieDomain: window.location.hostname,
cookieExpires: 604800
};
…
ngOnInit() {
ga(‘create’, this.trackingID, this.cookieParams);
...
}
```

Here, we are setting the GA cookie’s name, domain and cookie expiration date, which allows us to distinguish cookies set by our GA tracker from those set by GA trackers from other websites/Web applications. Rather than a cryptic auto-generated identity, we’ll be able to set custom identities for our application’s GA tracker cookies.

**IP anonymisation:** There may be cases when we do not want to know where the traffic to our application is coming from. For instance, consider a button click activity tracker – we do not necessarily need to know the geographical source of that interaction, so long as the number of hits is tracked. In such situations, GA allows us to track users’ activity without them having to reveal their IP address.

```
ipParams = {
anonymizeIp: true
};
…
ngOnInit() {
…
ga('set', this.ipParams);
...
}
```

Here, we are setting the parameters of the GA tracker so that IP anonymisation is set to _true_. Thus, our user’s IP address will not be tracked by Google Analytics, which will give users a sense of privacy.

**Opt-out:** At times, users may not want their browsing data to be tracked. GA allows for this too, and hence has the option to enable users to completely opt out of GA tracking.

```
...
optOut() {
window[‘ga-disable-UA-139883813-1’] = true;
}
...
```

_optOut()_ is a custom function which disables GA tracking from the window. We can employ this function using event binding on a button/check box, which allows users to opt out of GA tracking.
We have looked at what makes integrating Google Analytics into single page applications tricky and explored a way to work around this. We also saw how we can track ‘page’ views in single page applications as well as touched upon tracking users’ interactions with the application, such as button clicks, social media engagements, etc.

Finally, we examined opportunities offered by GA to ensure user privacy, especially when their identity isn’t critical to our application’s analytics, to the extent of allowing users to entirely opt out of Google Analytics tracking. Since there is much more that can be done, you’re encouraged to keep exploring and keep playing around with the methods offered by GA.

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/10/all-that-you-can-do-with-google-analytics-and-more/

作者：[Ashwin Sathian][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/ashwin-sathian/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Analytics-illustration.jpg?resize=696%2C396&ssl=1 (Analytics illustration)
[2]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Analytics-illustration.jpg?fit=900%2C512&ssl=1
