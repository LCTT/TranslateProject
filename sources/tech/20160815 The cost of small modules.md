Translating by Yinr

The cost of small modules
====

About a year ago I was refactoring a large JavaScript codebase into smaller modules, when I discovered a depressing fact about Browserify and Webpack:

> “The more I modularize my code, the bigger it gets. ”– Nolan Lawson

Later on, Sam Saccone published some excellent research on [Tumblr](https://docs.google.com/document/d/1E2w0UQ4RhId5cMYsDcdcNwsgL0gP_S6SDv27yi1mCEY/edit) and [Imgur](https://github.com/perfs/audits/issues/1)‘s page load performance, in which he noted:

> “Over 400ms is being spent simply walking the Browserify tree.”– Sam Saccone

In this post, I’d like to demonstrate that small modules can have a surprisingly high performance cost depending on your choice of bundler and module system. Furthermore, I’ll explain why this applies not only to the modules in your own codebase, but also to the modules within dependencies, which is a rarely-discussed aspect of the cost of third-party code.

### Web perf 101

The more JavaScript included on a page, the slower that page tends to be. Large JavaScript bundles cause the browser to spend more time downloading, parsing, and executing the script, all of which lead to slower load times.

Even when breaking up the code into multiple bundles – Webpack [code splitting](https://webpack.github.io/docs/code-splitting.html), Browserify[factor bundles](https://github.com/substack/factor-bundle), etc. – the cost is merely delayed until later in the page lifecycle. Sooner or later, the JavaScript piper must be paid.

Furthermore, because JavaScript is a dynamic language, and because the prevailing[CommonJS](http://www.commonjs.org/) module system is also dynamic, it’s fiendishly difficult to extract unused code from the final payload that gets shipped to users. You might only need jQuery’s $.ajax, but by including jQuery, you pay the cost of the entire library.

The JavaScript community has responded to this problem by advocating the use of [small modules](http://substack.net/how_I_write_modules). Small modules have a lot of [aesthetic and practical benefits](http://dailyjs.com/2015/07/02/small-modules-complexity-over-size/) – easier to maintain, easier to comprehend, easier to plug together – but they also solve the jQuery problem by promoting the inclusion of small bits of functionality rather than big “kitchen sink” libraries.

So in the “small modules” world, instead of doing:

```
var _ = require('lodash')
_.uniq([1,2,2,3])
```

You might do:

```
var uniq = require('lodash.uniq')
uniq([1,2,2,3])
```

### Packages vs modules

It’s important to note that, when I say “modules,” I’m not talking about “packages” in the npm sense. When you install a package from npm, it might only expose a single module in its public API, but under the hood it could actually be a conglomeration of many modules.

For instance, consider a package like [is-array](https://www.npmjs.com/package/is-array). It has no dependencies and only contains[one JavaScript file](https://github.com/retrofox/is-array/blob/d79f1c90c824416b60517c04f0568b5cd3f8271d/index.js#L6-L33), so it has one module. Simple enough.

Now consider a slightly more complex package like [once](https://www.npmjs.com/package/once), which has exactly one dependency:[wrappy](https://www.npmjs.com/package/wrappy). [Both](https://github.com/isaacs/once/blob/2ad558657e17fafd24803217ba854762842e4178/once.js#L1-L21) [packages](https://github.com/npm/wrappy/blob/71d91b6dc5bdeac37e218c2cf03f9ab55b60d214/wrappy.js#L6-L33) contain one module, so the total module count is 2\. So far, so good.

Now let’s consider a more deceptive example: [qs](https://www.npmjs.com/package/qs). Since it has zero dependencies, you might assume it only has one module. But in fact, it has four!

You can confirm this by using a tool I wrote called [browserify-count-modules](https://www.npmjs.com/package/browserify-count-modules), which simply counts the total number of modules in a Browserify bundle:

```
$ npm install qs
$ browserify node_modules/qs | browserify-count-modules
4
```

This means that a given package can actually contain one or more modules. These modules can also depend on other packages, which might bring in their own packages and modules. The only thing you can be sure of is that each package contains at least one module.

### Module bloat

How many modules are in a typical web application? Well, I ran browserify-count-moduleson a few popular Browserify-using sites, and came up with these numbers:

*   [requirebin.com](http://requirebin.com/): 91 modules
*   [keybase.io](https://keybase.io/): 365 modules
*   [m.reddit.com](http://m.reddit.com/): 1050 modules
*   [Apple.com](http://images.apple.com/ipad-air-2/): 1060 modules (Added. [Thanks, Max!](https://twitter.com/denormalize/status/765300194078437376))

For the record, my own [Pokedex.org](https://pokedex.org/) (the largest open-source site I’ve built) contains 311 modules across four bundle files.

Ignoring for a moment the raw size of those JavaScript bundles, I think it’s interesting to explore the cost of the number of modules themselves. Sam Saccone has already blown this story wide open in [“The cost of transpiling es2015 in 2016”](https://github.com/samccone/The-cost-of-transpiling-es2015-in-2016#the-cost-of-transpiling-es2015-in-2016), but I don’t think his findings have gotten nearly enough press, so let’s dig a little deeper.

### Benchmark time!

I put together [a small benchmark](https://github.com/nolanlawson/cost-of-small-modules) that constructs a JavaScript module importing 100, 1000, and 5000 other modules, each of which merely exports a number. The parent module just sums the numbers together and logs the result:

```
// index.js
var total = 0
total += require('./module_0')
total += require('./module_1')
total += require('./module_2')
// etc.
console.log(total)


// module_1.js
module.exports = 1
```

I tested five bundling methods: Browserify, Browserify with the [bundle-collapser](https://www.npmjs.com/package/bundle-collapser) plugin, Webpack, Rollup, and Closure Compiler. For Rollup and Closure Compiler I used ES6 modules, whereas for Browserify and Webpack I used CommonJS, so as not to unfairly disadvantage them (since they would need a transpiler like Babel, which adds its own overhead).

In order to best simulate a production environment, I used Uglify with the --mangle and--compress settings for all bundles, and served them gzipped over HTTPS using GitHub Pages. For each bundle, I downloaded and executed it 15 times and took the median, noting the (uncached) load time and execution time using performance.now().

### Bundle sizes

Before we get into the benchmark results, it’s worth taking a look at the bundle files themselves. Here are the byte sizes (minified but ungzipped) for each bundle ([chart view](https://nolanwlawson.files.wordpress.com/2016/08/min.png)):

|  | 100 modules | 1000 modules | 5000 modules |
| --- | --- | --- | --- |
| browserify | 7982 | 79987 | 419985 |
| browserify-collapsed | 5786 | 57991 | 309982 |
| webpack | 3954 | 39055 | 203052 |
| rollup | 671 | 6971 | 38968 |
| closure | 758 | 7958 | 43955 |

|  | 100 modules | 1000 modules | 5000 modules |
| --- | --- | --- | --- |
| browserify | 1649 | 13800 | 64513 |
| browserify-collapsed | 1464 | 11903 | 56335 |
| webpack | 693 | 5027 | 26363 |
| rollup | 300 | 2145 | 11510 |
| closure | 302 | 2140 | 11789 |

The way Browserify and Webpack work is by isolating each module into its own function scope, and then declaring a top-level runtime loader that locates the proper module whenever require() is called. Here’s what our Browserify bundle looks like:

```
(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o
```

Whereas the Rollup and Closure bundles look more like what you might hand-author if you were just writing one big module. Here’s Rollup:

```
(function () {
        'use strict';
        var total = 0
        total += 0
        total += 1
        total += 2
// etc.
```

If you understand the inherent cost of functions-within-functions in JavaScript, and of looking up a value in an associative array, then you’ll be in a good position to understand the following benchmark results.

### Results

I ran this benchmark on a Nexus 5 with Android 5.1.1 and Chrome 52 (to represent a low- to mid-range device) as well as an iPod Touch 6th generation running iOS 9 (to represent a high-end device).

Here are the results for the Nexus 5 ([tabular results](https://gist.github.com/nolanlawson/e84ad060a20f0cb7a7c32308b6b46abe)):

[![Nexus 5 results](https://nolanwlawson.files.wordpress.com/2016/08/modules_nexus_5.png?w=570&h=834)](https://nolanwlawson.files.wordpress.com/2016/08/modules_nexus_5.png)

And here are the results for the iPod Touch ([tabular results](https://gist.github.com/nolanlawson/45ed2c7fa53da035dfc1e153763b9f93)):

[![iPod Touch results](https://nolanwlawson.files.wordpress.com/2016/08/modules_ipod.png?w=570&h=827)](https://nolanwlawson.files.wordpress.com/2016/08/modules_ipod.png)

At 100 modules, the variance between all the bundlers is pretty negligible, but once we get up to 1000 or 5000 modules, the difference becomes severe. The iPod Touch is hurt the least by the choice of bundler, but the Nexus 5, being an aging Android phone, suffers a lot under Browserify and Webpack.

I also find it interesting that both Rollup and Closure’s execution cost is essentially free for the iPod, regardless of the number of modules. And in the case of the Nexus 5, the runtime costs aren’t free, but they’re still much cheaper for Rollup/Closure than for Browserify/Webpack, the latter of which chew up the main thread for several frames if not hundreds of milliseconds, meaning that the UI is frozen just waiting for the module loader to finish running.

Note that both of these tests were run on a fast Gigabit connection, so in terms of network costs, it’s really a best-case scenario. Using the Chrome Dev Tools, we can manually throttle that Nexus 5 down to 3G and see the impact ([tabular results](https://gist.github.com/nolanlawson/6269d304c970174c21164288808392ea)):

[![Nexus 5 3G results](https://nolanwlawson.files.wordpress.com/2016/08/modules_nexus_53g.png?w=570&h=834)](https://nolanwlawson.files.wordpress.com/2016/08/modules_nexus_53g.png)

Once we take slow networks into account, the difference between Browserify/Webpack and Rollup/Closure is even more stark. In the case of 1000 modules (which is close to Reddit’s count of 1050), Browserify takes about 400 milliseconds longer than Rollup. And that 400ms is no small potatoes, since Google and Bing have both noted that sub-second delays have an[appreciable impact on user engagement](http://radar.oreilly.com/2009/06/bing-and-google-agree-slow-pag.html).

One thing to note is that this benchmark doesn’t measure the precise execution cost of 100, 1000, or 5000 modules per se, since that will depend on your usage of require(). Inside of these bundles, I’m calling require() once per module, but if you are calling require()multiple times per module (which is the norm in most codebases) or if you are callingrequire() multiple times on-the-fly (i.e. require() within a sub-function), then you could see severe performance degradations.

Reddit’s mobile site is a good example of this. Even though they have 1050 modules, I clocked their real-world Browserify execution time as much worse than the “1000 modules” benchmark. When profiling on that same Nexus 5 running Chrome, I measured 2.14 seconds for Reddit’s Browserify require() function, and 197 milliseconds for the equivalent function in the “1000 modules” script. (In desktop Chrome on an i7 Surface Book, I also measured it at 559ms vs 37ms, which is pretty astonishing given we’re talking desktop.)

This suggests that it may be worthwhile to run the benchmark again with multiplerequire()s per module, although in my opinion it wouldn’t be a fair fight for Browserify/Webpack, since Rollup/Closure both resolve duplicate ES6 imports into a single hoisted variable declaration, and it’s also impossible to import from anywhere but the top-level scope. So in essence, the cost of a single import for Rollup/Closure is the same as the cost of n imports, whereas for Browserify/Webpack, the execution cost will increase linearly with n require()s.

For the purposes of this analysis, though, I think it’s best to just assume that the number of modules is only a lower bound for the performance hit you might feel. In reality, the “5000 modules” benchmark may be a better yardstick for “5000 require() calls.”

### Conclusions

First off, the bundle-collapser plugin seems to be a valuable addition to Browserify. If you’re not using it in production, then your bundle will be a bit larger and slower than it would be otherwise (although I must admit the difference is slight). Alternatively, you could switch to Webpack and get an even faster bundle without any extra configuration. (Note that it pains me to say this, since I’m a diehard Browserify fanboy.)

However, these results clearly show that Webpack and Browserify both underperform compared to Rollup and Closure Compiler, and that the gap widens the more modules you add. Unfortunately I’m not sure [Webpack 2](https://gist.github.com/sokra/27b24881210b56bbaff7) will solve any of these problems, because although they’ll be [borrowing some ideas from Rollup](http://www.2ality.com/2015/12/webpack-tree-shaking.html), they seem to be more focused on the[tree-shaking aspects](http://www.2ality.com/2015/12/bundling-modules-future.html) and not the scope-hoisting aspects. (Update: a better name is “inlining,” and the Webpack team is [working on it](https://github.com/webpack/webpack/issues/2873#issuecomment-240067865).)

Given these results, I’m surprised Closure Compiler and Rollup aren’t getting much traction in the JavaScript community. I’m guessing it’s due to the fact that (in the case of the former) it has a Java dependency, and (in the case of the latter) it’s still fairly immature and doesn’t quite work out-of-the-box yet (see [Calvin’s Metcalf’s comments](https://github.com/rollup/rollup/issues/552) for a good summary).

Even without the average JavaScript developer jumping on the Rollup/Closure bandwagon, though, I think npm package authors are already in a good position to help solve this problem. If you npm install lodash, you’ll notice that the main export is one giant JavaScript module, rather than what you might expect given Lodash’s hyper-modular nature (require('lodash/uniq'), require('lodash.uniq'), etc.). For PouchDB, we made a similar decision to [use Rollup as a prepublish step](http://pouchdb.com/2016/01/13/pouchdb-5.2.0-a-better-build-system-with-rollup.html), which produces the smallest possible bundle in a way that’s invisible to users.

I also created [rollupify](https://github.com/nolanlawson/rollupify) to try to make this pattern a bit easier to just drop-in to existing Browserify projects. The basic idea is to use imports and exports within your own project ([cjs-to-es6](https://github.com/nolanlawson/cjs-to-es6) can help migrate), and then use require() for third-party packages. That way, you still have all the benefits of modularity within your own codebase, while exposing more-or-less one big module to your users. Unfortunately, you still pay the costs for third-party modules, but I’ve found that this is a good compromise given the current state of the npm ecosystem.

So there you have it: one horse-sized JavaScript duck is faster than a hundred duck-sized JavaScript horses. Despite this fact, though, I hope that our community will eventually realize the pickle we’re in – advocating for a “small modules” philosophy that’s good for developers but bad for users – and improve our tools, so that we can have the best of both worlds.

### Bonus round! Three desktop browsers

Normally I like to run performance tests on mobile devices, since that’s where you see the clearest differences. But out of curiosity, I also ran this benchmark on Chrome 52, Edge 14, and Firefox 48 on an i7 Surface Book using Windows 10 RS1\. Here are the results:

Chrome 52 ([tabular results](https://gist.github.com/nolanlawson/4f79258dc05bbd2c14b85cf2196c6ef0))

[![Chrome results](https://nolanwlawson.files.wordpress.com/2016/08/modules_chrome.png?w=570&h=831)](https://nolanwlawson.files.wordpress.com/2016/08/modules_chrome.png)

Edge 14 ([tabular results](https://gist.github.com/nolanlawson/726fa47e0723b45e4ee9ecf0cf2fcddb))

[![Edge results](https://nolanwlawson.files.wordpress.com/2016/08/modules_edge.png?w=570&h=827)](https://nolanwlawson.files.wordpress.com/2016/08/modules_edge.png)

Firefox 48 ([tabular results](https://gist.github.com/nolanlawson/7eed17e6ffa18752bf99a9d4bff2941f))

[![Firefox results](https://nolanwlawson.files.wordpress.com/2016/08/modules_firefox.png?w=570&h=830)](https://nolanwlawson.files.wordpress.com/2016/08/modules_firefox.png)

The only interesting tidbits I’ll call out in these results are:

1.  bundle-collapser is definitely not a slam-dunk in all cases.
2.  The ratio of network-to-execution time is always extremely high for Rollup and Closure; their runtime costs are basically zilch. ChakraCore and SpiderMonkey eat them up for breakfast, and V8 is not far behind.

This latter point could be extremely important if your JavaScript is largely lazy-loaded, because if you can afford to wait on the network, then using Rollup and Closure will have the additional benefit of not clogging up the UI thread, i.e. they’ll introduce less jank than Browserify or Webpack.

Update: in response to this post, JDD has [opened an issue on Webpack](https://github.com/webpack/webpack/issues/2873). There’s also [one on Browserify](https://github.com/substack/node-browserify/issues/1379).

Update 2: [Ryan Fitzer](https://github.com/nolanlawson/cost-of-small-modules/pull/5) has generously added RequireJS and RequireJS with [Almond](https://github.com/requirejs/almond) to the benchmark, both of which use AMD instead of CommonJS or ES6.

Testing shows that RequireJS has [the largest bundle sizes](https://gist.github.com/nolanlawson/511e0ce09fed29fed040bb8673777ec5) but surprisingly its runtime costs are [very close to Rollup and Closure](https://gist.github.com/nolanlawson/4e725df00cd1bc9673b25ef72b831c8b). Here are the results for a Nexus 5 running Chrome 52 throttled to 3G:

[![Nexus 5 (3G) results with RequireJS](https://nolanwlawson.files.wordpress.com/2016/08/2016-08-20-14_45_29-small_modules3-xlsx-excel.png?w=570&h=829)](https://nolanwlawson.files.wordpress.com/2016/08/2016-08-20-14_45_29-small_modules3-xlsx-excel.png)



--------------------------------------------------------------------------------

via: https://nolanlawson.com/2016/08/15/the-cost-of-small-modules/?utm_source=javascriptweekly&utm_medium=email

作者：[Nolan][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://nolanlawson.com/
