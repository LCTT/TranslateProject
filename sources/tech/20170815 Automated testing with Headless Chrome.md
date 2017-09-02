Automated testing with Headless Chrome
============================================================


If you want to run automated tests using Headless Chrome, look no further! This article will get you all set up using Karma as a runner and Mocha+Chai for authoring tests.

**What are these things?**

Karma, Mocha, Chai, Headless Chrome, oh my!

[Karma][2] is a testing harness that works with any of the the most popular testing frameworks ([Jasmine][3], [Mocha][4], [QUnit][5]).

[Chai][6] is an assertion library that works with Node and in the browser. We need the latter.

[Headless Chrome][7] is a way to run the Chrome browser in a headless environment without the full browser UI. One of the benefits of using Headless Chrome (as opposed to testing directly in Node) is that your JavaScript tests will be executed in the same environment as users of your site. Headless Chrome gives you a real browser context without the memory overhead of running a full version of Chrome.

### Setup

### Installation

Install Karma, the relevant, plugins, and the test runners using `yarn`:

```
yarn add --dev karma karma-chrome-launcher karma-mocha karma-chai
yarn add --dev mocha chai
```

or use `npm`:

```
npm i --save-dev karma karma-chrome-launcher karma-mocha karma-chai
npm i --save-dev mocha chai
```

I'm using [Mocha][8] and [Chai][9] in this post, but if you're not a fan, choose your favorite assertion library that works in the browser.

### Configure Karma

Create a `karma.config.js` file that uses the `ChromeHeadless` launcher.

**karma.conf.js**

```
module.exports = function(config) {
  config.set({
    frameworks: ['mocha', 'chai'],
    files: ['test/**/*.js'],
    reporters: ['progress'],
    port: 9876,  // karma web server port
    colors: true,
    logLevel: config.LOG_INFO,
    browsers: ['ChromeHeadless'],
    autoWatch: false,
    // singleRun: false, // Karma captures browsers, runs the tests and exits
    concurrency: Infinity
  })
}
```

<aside class="note" style="box-sizing: inherit; font-size: 14px; margin-top: 16px; margin-bottom: 16px; padding: 12px 24px 12px 60px; background: rgb(225, 245, 254); color: rgb(2, 136, 209);">**Note:** Run `./node_modules/karma/bin/ init karma.conf.js` to generate the Karma configuration file.</aside>

### Write a test

Create a test in `/test/test.js`.

**/test/test.js**

```
describe('Array', () => {
  describe('#indexOf()', () => {
    it('should return -1 when the value is not present', () => {
      assert.equal(-1, [1,2,3].indexOf(4));
    });
  });
});
```

### Run your tests

Add a `test` script in `package.json` that runs Karma with our settings.

**package.json**

```
"scripts": {
  "test": "karma start --single-run --browsers ChromeHeadless karma.conf.js"
}
```

When you run your tests (`yarn test`), Headless Chrome should fire up and output the results to the terminal:

![Output from Karma](https://developers.google.com/web/updates/images/2017/06/headless-karma.png)

### Creating your own Headless Chrome launcher

The `ChromeHeadless` launcher is great because it works out of the box for testing on Headless Chrome. It includes the appropriate Chrome flags for you and launches a remote debugging version of Chrome on port `9222`.

However, sometimes you may want to pass custom flags to Chrome or change the remote debugging port the launcher uses. To do that, create a `customLaunchers` field that extends the base `ChromeHeadless` launcher:

**karma.conf.js**

```
module.exports = function(config) {
  ...

  config.set({
    browsers: ['Chrome', 'ChromeHeadless', 'MyHeadlessChrome'],

    customLaunchers: {
      MyHeadlessChrome: {
        base: 'ChromeHeadless',
        flags: ['--disable-translate', '--disable-extensions', '--remote-debugging-port=9223']
      }
    },
  }
};
```

### Running it all on Travis CI

Configuring Karma to run your tests in Headless Chrome is the hard part. Continuous integration in Travis is just a few lines away!

To run your tests in Travis, use `dist: trusty` and install the Chrome stable addon:

**.travis.yml**

```
language: node_js
node_js:
  - "7"
dist: trusty # needs Ubuntu Trusty
sudo: false  # no need for virtualization.
addons:
  chrome: stable # have Travis install chrome stable.
cache:
  yarn: true
  directories:
    - node_modules
install:
  - yarn
script:
  - yarn test
```

--------------------------------------------------------------------------------

作者简介

[Eric Bidelman][1]Engineer @ Google working on Lighthouse, Web Components, Chrome, and the web

----------------

via: https://developers.google.com/web/updates/2017/06/headless-karma-mocha-chai

作者：[ Eric Bidelman][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://developers.google.com/web/resources/contributors#ericbidelman
[1]:https://developers.google.com/web/resources/contributors#ericbidelman
[2]:https://karma-runner.github.io/
[3]:https://jasmine.github.io/
[4]:https://mochajs.org/
[5]:https://qunitjs.com/
[6]:http://chaijs.com/
[7]:https://developers.google.com/web/updates/2017/04/headless-chrome
[8]:https://mochajs.org/
[9]:http://chaijs.com/
