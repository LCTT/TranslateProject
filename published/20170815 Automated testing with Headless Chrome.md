使用 Headless Chrome 进行自动化测试
============================================================

如果你想使用 Headless Chrome 进行自动化测试，那么就往下！这篇文章将让你完全使用 Karma 作为<ruby>运行器<rt>runner</rt></ruby>，并且使用 Mocha+Chai 来编撰测试。

**这些东西是什么？**

Karma、Mocha、Chai、Headless Chrome，哦，我的天哪！

[Karma][2] 是一个测试工具，可以和所有最流行的测试框架（[Jasmine][3]、[Mocha][4]、 [QUnit][5]）配合使用。

[Chai][6] 是一个断言库，可以与 Node 和浏览器一起使用。这里我们需要后者。

[Headless Chrome][7] 是一种在没有浏览器用户界面的无需显示环境中运行 Chrome 浏览器的方法。使用 Headless Chrome（而不是直接在 Node 中测试） 的一个好处是 JavaScript 测试将在与你的网站用户相同的环境中执行。Headless Chrome 为你提供了真正的浏览器环境，却没有运行完整版本的 Chrome 一样的内存开销。

### 设置

#### 安装

使用 `yarn` 安装 Karma、相关插件和测试用例：

```
yarn add --dev karma karma-chrome-launcher karma-mocha karma-chai
yarn add --dev mocha chai
```

或者使用 `npm`：

```
npm i --save-dev karma karma-chrome-launcher karma-mocha karma-chai
npm i --save-dev mocha chai
```

在这篇文章中我使用 [Mocha][8] 和 [Chai][9]，但是你也可以选择自己最喜欢的在浏览器中工作的断言库。

#### 配置 Karma

创建一个使用 `ChromeHeadless` 启动器的 `karma.config.js` 文件。

**karma.conf.js**：

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

> **注意：** 运行 `./node_modules/karma/bin/karma init karma.conf.js` 生成 Karma 的配置文件。

### 写一个测试

在 `/test/test.js` 中写一个测试：

**/test/test.js**：

```
describe('Array', () => {
  describe('#indexOf()', () => {
    it('should return -1 when the value is not present', () => {
      assert.equal(-1, [1,2,3].indexOf(4));
    });
  });
});
```

### 运行你的测试

在我们设置好用于运行 Karma 的 `package.json` 中添加一个测试脚本。

**package.json**：

```
"scripts": {
  "test": "karma start --single-run --browsers ChromeHeadless karma.conf.js"
}
```

当你运行你的测试（`yarn test`）时，Headless Chrome 会启动并将运行结果输出到终端：

![Output from Karma](https://developers.google.com/web/updates/images/2017/06/headless-karma.png)

### 创建你自己的 Headless Chrome 启动器

`ChromeHeadless` 启动器非常棒，因为它可以在 Headless Chrome 上进行测试。它包含了适合你的 Chrome 标志，并在端口 `9222` 上启动 Chrome 的远程调试版本。

但是，有时你可能希望将自定义的标志传递给 Chrome 或更改启动器使用的远程调试端口。要做到这一点，可以通过创建一个 `customLaunchers` 字段来扩展基础的 `ChromeHeadless` 启动器：

**karma.conf.js**：

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

### 完全在 Travis CI 上运行它

在 Headless Chrome 中配置 Karma 运行测试是很困难的。而在 Travis 中持续集成就只有几种！

要在 Travis 中运行测试，请使用 `dist: trusty` 并安装稳定版 Chrome 插件：

**.travis.yml**：

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

[Eric Bidelman][1] 谷歌工程师，Lighthouse 开发，Web 和 Web 组件开发，Chrome 开发

----------------

via: https://developers.google.com/web/updates/2017/06/headless-karma-mocha-chai

作者：[Eric Bidelman][a]
译者：[firmianay](https://github.com/firmianay)
校对：[wxy](https://github.com/wxy)

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
