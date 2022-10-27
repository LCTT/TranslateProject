[#]: subject: "A Drupal developer's guide to Progressive Web Apps"
[#]: via: "https://opensource.com/article/22/6/drupal-pwa"
[#]: author: "Alex Borsody https://opensource.com/users/alexborsody"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A Drupal developer's guide to Progressive Web Apps
======
Here is an outlined approach to PWA implementation for a Drupal site, but other options are certainly available with similar designs.

![Digital creative of a browser on the internet][1]

The following article is a companion to my presentation at Drupalcon and Drupalcamp covering Progressive Web Apps implementations.

Progressive Web Apps (PWA) have support from some of the top tech companies, including Google and Microsoft, with the common goal being "[Web apps should be able to do anything iOS, Android, or desktop apps can.][2]" PWAs can add value to businesses at a variety of different stages. All projects have limitations, whether they be development resources, timeline, budget, or technical debt. Even with "unlimited resources," developing an app from a single codebase, using commonly known web technologies, allows for a more frictionless, sane release cycle.

Disclaimers:

* PWA is a collection of different techniques combined in a web browser to create an "app-like" experience.
* This information is from an architect's perspective for choosing and implementing various technologies that come together to build a product.
* Below is a high-level end-to-end outline of a path to launch a Drupal website on the app stores. Each section could be its own in-depth blog post.
* The techniques are written with Drupal in mind, but you can apply many of them to all web apps.

### What is a PWA?

![What is PWA][3]

Benefits of a PWA implementation:

* Increased Lighthouse score and SEO.
* Single codebase.
* Frictionless testing.
* Instant feedback loop for development cycles.
* Use of existing PaaS deployment workflows, including Acquia, Pantheon, Platform.sh etc.
* Use of web technologies that are a familiar skillset for a wide array of developers.
* Provides the only cross-platform development solution that delivers a full-fledged desktop experience.
* Offers unlimited options to customize a design without relying on a cross-platform framework's limited UI components.

This article covers some basic points for PWA deployment. There are many details to consider both at the architect and developer levels. The following topics are discussed:

* PWA minimum requirements and Drupal PWA module as a starting point.
* Publishing on app stores.
* Everything you need to know about making your PWA feel [app-like][4].

### PWA module on Drupal.org

The [Drupal PWA module][5] is a solution that generates a service worker for caching strategies and offline capabilities. Its secondary functionality also generates a `manifest.json`, so once installed, it will fulfill the [basic requirements of a PWA][6] out-of-the-box.

There is functionality in the module's service worker that provides unique solutions to Drupal-specific behavior, although you can also apply these solutions to apps outside of Drupal.

![Drupal PWA module][7]

#### Offline caching

Offline caching with a service worker is one of the functionalities that defines a PWA.

The following images summarize how a service worker acts as a proxy (sitting between the client and the internet/webserver) to intercept HTTP requests from the browser.

During the first request to the `/about` page, the browser reaches the network, and upon returning a 200 response from the server, the Javascript service worker calls **cache.put()** to store the HTML and all assets in the [Cache API][8].

![Offline caching example in service worker][9]

On the second trip, the service worker bypasses the network completely and serves the page from the Cache API store in the user's browser, loading the page instantly. It can also load the page offline.

![Second visit to site][10]

The browser can precache pages to make them load instantly before the user visits them or even load offline before a visit. However, because in Drupal, the CSS/JS filenames change after compression, the solution must address the problem of identifying these assets before it can precache them via a service worker. It does this by internally requesting the URLs set in the admin panel and extracting assets from the DOM. This allows the service worker [install event][11] to fetch all CSS/JS and images from these documents to store in Cache API. The complete pages will then be viewable offline and load instantly, even if the user never visits them first.

![Service worker][12]

![Offline caching demo][13]

Below, I fetch all the assets from the URLs set in the admin panel to inject later into the service worker precache assets array. In D8, I changed the request to use **Drupal::httpClient()**, which is the updated version of **drupal_http_request()** in D7 and is a wrapper for the PHP Guzzle library.

```
foreach ($pages as $page) {
try {
  // URL is validated as internal in ConfigurationForm.php.
  $url = Url::fromUserInput($page, ['absolute' => TRUE])->toString(TRUE);
  $url_string = $url->getGeneratedUrl();
  $response = \Drupal::httpClient()->get($url_string, array('headers' => array('Accept' => 'text/plain')));
```

This code matches all assets needed:

```
// Get all DOM data.
$dom = new \DOMDocument();
@$dom->loadHTML($data);

$xpath = new \DOMXPath($dom);

foreach ($xpath->query('//script[@src]') as $script) {
  $resources[] = $script->getAttribute('src');
}

foreach ($xpath->query('//link[@rel="stylesheet"][@href]') as $stylesheet) {
  $resources[] = $stylesheet->getAttribute('href');
}

foreach ($xpath->query('//style[@media="all" or @media="screen"]') as $stylesheets) {
  preg_match_all(
    "#(/(\S*?\.\S*?))(\s|\;|\)|\]|\[|\{|\}|,|\"|'|:|\<|$|\.\s)#ie",
    ' ' . $stylesheets->textContent,
    $matches
  );
  $resources = array_merge($resources, $matches[0]);
}

foreach ($xpath->query('//img[@src]') as $image) {
  $resources[] = $image->getAttribute('src');
}
```

Below, you can see the final result in the processed `serviceworker.js` file that is output in the browser. The variables in the service worker are replaced with the path to the assets to cache.

![Final test of offline caching][14]

#### Phone home uninstall

The module provides another clever piece of functionality—responsible cleanup when uninstalled. The module sends a request back to a URL created by the module. If the URL does not exist, it means the module has been uninstalled. The service worker then unregisters itself and deletes all related caches left on the user's browser.

```
// Fetch phone-home URL and process response.
let phoneHomeUrl = fetch(PWA_PHONE_HOME_URL)
  .then(function (response) {
    // if no network, don't try to phone-home.
    if (!navigator.onLine) {
      console.debug('PWA: Phone-home - Network not detected.');
    }

    // if network + 200, do nothing
    if (response.status === 200) {
      console.debug('PWA: Phone-home - Network detected, module detected.');
    }

    // if network + 404, uninstall
    if (response.status === 404) {
      console.debug('PWA: Phone-home - Network detected, module NOT detected. UNINSTALLING.');
      // Let SW attempt to unregister itself.
      Promise.resolve(pwaUninstallServiceWorker());
    }

    return Promise.resolve();
  })
  .catch(function(error) {
    console.error('PWA: Phone-home - ', error);
  });
};
```

### Testing notes

Disable the module on dev as it provides an extra caching layer. Any changes pushed to production for CSS or other assets with cache first strategies should be followed by incrementing the service worker version to bust the cache.

You can find additional debugging steps for a service worker on this PWA module [documentation page][15].

Using the Chrome console to [remote debug][16] on a mobile device is possible on Android and can be helpful.

### 2.x version

The 2.x and 7.2x versions port the service worker to [Workbox][17], where you can set caching strategies. Here, setting caching strategies for different asset types and routes is simplified from about 30 lines of code using just the javascript Fetch API to about five lines. Some people may be resistant to libraries, but this is the direction Google is taking with PWAs.

Workbox [caching strategies][18] are similar to those in other caching layers such as Varnish. For example, by default, image assets and fonts are set to "cache first," so they are always served instantly. HTML would best be implemented as [stale-while-revalidate][19].

![Workbox and PWA module][20]

There is also functionality in Workbox, such as [background sync][21], where a failed post request will retry upon coming back online.

![Offline cache][22]

For more information on what a service worker can do and all the use cases where it may be helpful, check the [W3 Service Workers Demo repo][23] on GitHub.

### Get your web app in the app stores

PWA builder is a web application powered by Microsoft where you input your URL and it generates everything you need to submit to the app stores.

For Android, it uses TWA, and for iOS, it wraps your web app in native SWIFT code using [WebKit's][24] WKWebView. These are techniques I have been using since 2013, way back when Drupal was a buzzy technology and being used by startups. Businesses that had mobile-optimized Drupal websites wanted them on the app stores. Before Android TWA, developers used Webview, and before WKWebView, there was UIWebView.

Recently PWA builder added a [solution for iOS][25] using WKWebView, which confirms my belief that this is the best option to get your PWA into the App Store. Maximilian Firtman also reveals this as the solution in his course "Creating Progressive Web Apps with Vue," which I purchased to see his answer to the problem.

The PWA module provides everything you need to run through PWA Builder:

* For Android, it creates a lightweight .apk/.aap using TWA to submit to the Play Store 800kb.
* For iOS, it wraps your website in WKWebView to submit to the App Store.

A live demo I put together of PWA builder is here. **[[EDITORS - MISSING LINK]]**

### Android and TWA

The Google and Chromium teams are currently the strongest driving forces behind PWAs. Therefore, TWA is designed specifically to get your PWA into the Play Store. On the contrary, WKWebView is essentially a workaround not explicitly supported by Apple. However, WKWebView is extremely powerful, even though Apple doesn't advertise this or have much documentation on its capabilities.

Trusted Web Activity is essentially a Chrome process running in full screen with a status bar and loading screen. The thread is running in the same process as the Chrome app on your phone. For example, if you are logged in on your Chrome browser, you will be logged in on your TWA app. To clear up any possible confusion resulting from this, the TWA team has added a "toast," meaning the first time the user opens the app, a notification shows "Running in Chrome." This only happens the first time the app is installed. This annoyance is enough for some teams to ditch TWA and use the WebView class instead; however, Google [discouraged this][26] as you lose out on everything baked into the Chrome web browser.

The [main points][27] Google makes about using TWA are:

* Chrome is feature complete.
* Faster than Webview.
* Evergreen (always the up-to-date version of Chrome).

Additional useful functionality.

* Chrome handles frictionless OAuth requests.
* Share cookies, local storage, and saved settings with the preferred browser.

Below is a comparison chart of everything you get when using TWA instead of a Webview wrapper.

![Google TWA][28]

### Webkit: WKWebView

There are several considerations for publishing on the App Store. WKWebView is essentially a workaround and not a method implicitly endorsed by Apple to launch a native app. Some caveats come with this. The most important is to be mindful of Apple's [minimal functionality guidelines][29].

From my experience, you will be approved if you do everything you can to make your web app "app-like" with useful functionality. Using the Webkit API to enhance your web app is another way to provide additional functionality outside of your website.

One technique is to set a cookie depending on the **start_url**. For example, add a parameter like **myapp.com?ios_app** and set a cookie to determine a separate stylesheet or customize logic.

Consider the following sample implementation.

**Note**: This technique should not be confused with Apple's limited [add to homescreen][30] support, which you usually hear about with Apple + PWAs. I won't cover this as it's not the experience a user would expect.

PWA builder provides the minimum functionality required to wrap a website in WKWebView for App Store submission. For features such as biometric or push notifications, you need a custom implementation of WKWebView.

In the graphic below, you can see the source files provided. You can then easily compile your app in XCode and submit it to the app store.

![Source code][31]

[PWA Builder provides][32]:

* No Bounce when scrolling out of view with wKWebView.scrollView.bounces = false
* Service worker support
* Shortcuts URL capture
* Permitted navigation scopes
* Status bar customization
* Splash screen from manifest props
* iOS app awareness from JS code
* Mac Store support

A custom implementation of WKWebView can provide:

* Push notifications: Push notifications are possible by posting the device ID matched to the Drupal UID, which can be extracted from the URL /user/{uid}/edit, for example.
* [Biometric][33]: Biometric is implemented on all pages except for user/login and user/register, and the cookie max expiration is extended. Biometric is shown every time the app is closed and reopened.
* [WKUIDelegate][34]: Present native UI elements, such as alerts, inputs, or contextual menus.
* [evaluateJavaScript()][35]: Execute any Javascript. The possibilities here are endless.
* Password management using [associated domains][36]: Placing a public keypair in your `/.well-known` directory will allow your native app to trust your website and autofill passwords.

View the [README.md][37] of WKWebView+, a project I am working on that makes it easy to integrate this enhanced functionality into any iOS PWA.

#### Cons of WKWebView

Give the following considerations attention before implementing WKWebView:

* There is a paradigm shift in thinking required for frontend developers to debug a PWA correctly. Though it relies on web technologies, there is a learning curve.
* Without a native iOS developer, certain features are not possible to implement. However, [WKWebView+][38] was designed to solve this.
* Though the outlook for Apple and PWAs [looks positive][39], as usual, you are at the mercy of the next Safari release.

### Moving forward

Many of the features available with TWA are only available on Chromium-based browsers. Webkit mobile/WKWebView lags. This lag includes push notifications, "add to home screen," and overall web browser standards. Maximilian Firtman's blog is currently one of the best resources for a summary of the updates in the latest Safari, even if they [were not announced in the release notes][40].

The optimistic outlook is that WKWebView is based on the open-source project Webkit, and there is a collaboration among the developers that work on both Chromium and WebKit. Anyone can create an issue and pull request. Often, features already [implemented in Chrome][41] have patches submitted to Webkit that do the same.

#### Make it app-like

Websites that took all the right vitaminsA PWA is essentially a collection of web technologies that combine to make your web experience app-like, as if the website "took all the right vitamins." Below I have identified points that make up a good PWA:

* UX/UI: Visual problem solving is at the core of making your website feel like an app. A great CSS developer with an eye for design and detail, such as animations, input/font sizes, and scrolling issues, is essential.
* Stay current with app-like enhancements: Keeping frontend code updated and compatible across WebKit/Chrome requires research and periodic updates, particularly when a new version of the iPhone is released.
* Implement expanded web capabilities: The Chromium team constantly improves the browser experience. This can be tracked in [Project Fugu][42], the overarching web capabilities project. The closest thing there is to comprehensive documentation on PWAs is on [webdev][43].
* Page speed: I covered caching with a service worker, but there are countless other technologies and techniques.

Some examples of app-like enhancements include using HTML/CSS/JS technologies commonly available to web developers, and then making them frictionless to implement, test, and deploy. You can find a good example of a web application using many of these suggestions [here][44].

Suggestions include:

* [Javascript touch events][45]: Disable pinch zoom and add swipe/multitouch gestures.
* CSS:
  + Minify/optimize CSS and apply [Lighthouse][46] suggestions.
  + "App-like" input/font sizes and make sure everything fits in the viewport; make it visually look like an app.
  + Tactful use of preloaders.
* Utilize cookies: Set cookie based on app start URL.
* HTML attributes:
  + autocomplete="username"
  + [autocomplete="current-password"][48]
  + [autocomplete="one-time-code"][49] - WebOTP API
  + input type="tel"
* Ajax API (Drupal specific), Websockets, or SPA framework.
* iPhone specific suggestions:
  + [Status bar on iPhone X][52] and Viewport meta tag.
  + Apple-specific [meta tags][53].

![iPhone X status bar][61]

### Wrap up

PWA brings together different techniques to create an app-like experience in a web browser. I outlined an approach to PWA implementation for a Drupal site, but other options are certainly available with similar designs. What implementations of PWA might help your organization's user experience?

View the [README.md][62] of WKWebView+, a project I am working on that makes it easy to integrate this enhanced functionality into any iOS PWA.

Ionic the spiritual successor to Cordova is a popular framework that also utilizes [WKWebView][63] to build native iOS.

Image by: (Alex Borsody, CC BY-SA 4.0)

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/drupal-pwa

作者：[Alex Borsody][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alexborsody
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/browser_web_internet_website.png
[2]: https://developer.chrome.com/blog/fugu-status/
[3]: https://opensource.com/sites/default/files/2022-06/what-is-pwa.jpeg
[4]: https://web.dev/app-like-pwas/
[5]: https://www.drupal.org/project/pwa
[6]: https://web.dev/lighthouse-pwa/
[7]: https://opensource.com/sites/default/files/2022-05/2DrupalModule.jpg
[8]: https://developer.mozilla.org/en-US/docs/Web/API/CacheStorage
[9]: https://opensource.com/sites/default/files/2022-05/3OfflineCache.png
[10]: https://opensource.com/sites/default/files/2022-05/4SecondVisit.jpg
[11]: https://developer.mozilla.org/en-US/docs/Web/API/InstallEvent
[12]: https://opensource.com/sites/default/files/2022-05/5SvcWorker.jpg
[13]: https://opensource.com/sites/default/files/2022-05/6Test.jpg
[14]: https://opensource.com/sites/default/files/2022-05/7Test-code.jpg
[15]: https://www.drupal.org/docs/7/modules/progressive-web-app-pwa/troubleshooting
[16]: https://developer.chrome.com/docs/devtools/remote-debugging/
[17]: https://developers.google.com/web/tools/workbox
[18]: https://developers.google.com/web/ilt/pwa/caching-files-with-service-worker
[19]: https://developer.chrome.com/docs/workbox/modules/workbox-strategies/
[20]: https://opensource.com/sites/default/files/2022-05/8Workbox.jpg
[21]: https://developer.chrome.com/docs/workbox/modules/workbox-background-sync/
[22]: https://opensource.com/sites/default/files/2022-05/9OfflineCache.jpg
[23]: https://github.com/w3c-webmob/ServiceWorkersDemos
[24]: https://developer.apple.com/documentation/webkit
[25]: https://blog.pwabuilder.com/docs/ios-platform/
[26]: https://twitter.com/andreban/status/1232204535835303936
[27]: https://youtu.be/6lHBw3F4cWs?t=179
[28]: https://opensource.com/sites/default/files/2022-05/10GoogleTWA.png
[29]: https://developer.apple.com/app-store/review/guidelines/#minimum-functionality
[30]: https://support.apple.com/guide/shortcuts/add-a-shortcut-to-the-home-screen-apd735880972/ios
[31]: https://opensource.com/sites/default/files/2022-05/11sourcefiles.jpg
[32]: https://blog.pwabuilder.com/docs/ios-platform/
[33]: https://github.com/AlexBorsody/drupalcon2022/blob/main/README.md#biometrics
[34]: https://developer.apple.com/documentation/webkit/wkuidelegate
[35]: https://developer.apple.com/documentation/webkit/wkwebview/1415017-evaluatejavascript
[36]: https://developer.apple.com/documentation/xcode/supporting-associated-domains
[37]: https://github.com/AlexBorsody/drupalcon2022/blob/main/README.md
[38]: https://github.com/AlexBorsody/drupalcon2022/blob/main/README.md
[39]: https://firt.dev/pwa-2021/#tim-cook-promoting-pwas
[40]: https://www.macworld.com/article/610673/ios-15-4-safari-push-notifications.html
[41]: https://www.google.com/search?q=site:https://webkit.org/+chromium&source=lnt&tbs=qdr:y&sa=X&ved=2ahUKEwjGwrDj2Nj2AhXHrHIEHfBQD5wQpwV6BAgBEBk&biw=1638&bih=897&dpr=2
[42]: https://www.chromium.org/teams/web-capabilities-fugu/
[43]: https://web.dev/progressive-web-apps/
[44]: https://carbonpay.io/
[45]: https://developer.mozilla.org/en-US/docs/Web/API/Touch_events/Multi-touch_interaction
[46]: https://developers.google.com/web/tools/lighthouse
[47]: https://developers.google.com/web/tools/lighthouse
[48]: https://developer.apple.com/documentation/security/password_autofill/enabling_password_autofill_on_an_html_input_element
[49]: https://web.dev/web-otp/
[50]: https://developer.apple.com/documentation/security/password_autofill/enabling_password_autofill_on_an_html_input_element
[51]: https://web.dev/web-otp/
[52]: https://webkit.org/blog/7929/designing-websites-for-iphone-x/
[53]: https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariHTMLRef/Articles/MetaTags.html
[54]: https://webkit.org/blog/7929/designing-websites-for-iphone-x/
[55]: https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariHTMLRef/Articles/MetaTags.html
[56]: https://developers.google.com/web/tools/lighthouse
[57]: https://developer.apple.com/documentation/security/password_autofill/enabling_password_autofill_on_an_html_input_element
[58]: https://web.dev/web-otp/
[59]: https://webkit.org/blog/7929/designing-websites-for-iphone-x/
[60]: https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariHTMLRef/Articles/MetaTags.html
[61]: https://opensource.com/sites/default/files/2022-05/12iPhoneStatusBar.png
[62]: https://github.com/AlexBorsody/drupalcon2022/blob/main/README.md
[63]: https://ionicframework.com/docs/v3/wkwebview/
