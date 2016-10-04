Using webpack with the Amazon Cognito Identity SDK for JavaScript
把具有与亚马逊 Cognito 标志软件开发工具包（SDK）的 webpack 用于 JavaScript
=====

This blog post is aimed at developers of all experience levels who develop and deploy JavaScript based applications (whether server-side with Node.js or client side) that incorporate the AWS SDK, the Amazon Cognito Identity SDK for JavaScript and who also use the popular [webpack][1] module bundler.
这篇文章是针对开发和部署基于 JavaScriot 应用（Node.js 服务器端或者客户端服务器端）的所有经验水平的开发者。通过本文，你将看到如何把 AWS SDK， 亚马逊标志软件开发工具包（SDK）嵌入到 JavaScript 中，以及如何使用流行的【webpack】【1】模块打包机。

In July 2016, Amazon Web Services [launched Amazon Cognito User Pools][2], a feature that makes it easy for developers to add sign-up and sign-in functionality to mobile and web applications. To help developers easily realize the power of user pools within their own applications, we also released the [Amazon Cognito Identity SDK for JavaScript][3].
2016年7月，亚马逊网站服务【推出亚马逊 Cognito 用户库】【2】，这个新特性极大的方便了开发者在移动和 Web 应用程序上添加注册和登录功能。为了帮助开发者更容易在自己的应用程序中实现用户库权利，我们也发布了【针对 JavaScript 的亚马逊 Cognito 特性 SDK】【3】。


Amazon Cognito User Pools allows you to easily add user sign-up and sign-in to your mobile and web applications. The fully managed user pool can scale to hundreds of millions of users and you can have multiple directories per AWS account. Creating a user pool takes just a few minutes and allows you to decide exactly which attributes (including address, email, phone number as well as custom attributes) are mandatory and even optional when a new user signs up for your application or service. Your application can also specify the desired password strength, whether the use of Multi-Factor Authentication (MFA) is required, and verify new users via phone number or email address to further enhance the security of your application.
亚马逊 Cognito 用户库使得你在移动和 Web 应用程序上添加用户注册和登录功能更加容易。全托管用户库可以扩展到数以百万计的用户，你可以在一个 AWS 账户下有多重目录。创建一个用户库只需要几分钟的时间，并且你可以决定当一个新用户在你的应用程序或服务上注册时哪些属性（包括地址，邮箱，电话号码以及自定义属性）是强制的，哪些是可选择的。你的应用程序也可以指定所需的密码强度，指定用户需要进行多因素认证，通过电话号码或者邮件地址来验证新用户，从而进一步加强应用程序的安全性。

If you are new to the Amazon Cognito Identity SDK for JavaScript [this AWS blog post][4] is a great place to start.
如果你是首次接触用于 JavaScript 的亚马逊 Cognito 标志 SDk，那么请先阅读【这篇 AWS 文章】【4】作为开始。

### Why Use Asset & Module Bundling with the Amazon Cognito Identity SDK for JavaScript
### 为什么在 JavaScript 上使用具有资产模块的亚马逊 Cogtito 标志 SDK

Today, modern web applications for both mobile and desktop have to provide the user with a secure, fast, responsive, and native-app-like experience. There is no doubt that modern browsers are extremely powerful and cater to a vast array of possible implementation approaches. Many of the more popular implementations rely heavily on the deployment of a JavaScript application through some form of asset packaging and/or module bundling. This allows a developer to take their JavaScript application and create one or more files that can be loaded by the client browser by using script tags.
今天，针对移动和桌面的现代 Web 应用程序都能为用户提供安全、快捷、灵敏以及类本地应用的体验。毫无疑问，现代的浏览器功能强大，能够满足大量可能的实现方法。许多流行的实现很大程度上依赖于 JavaScript 应用程序通过某种形式的资产包装和/或模块捆绑进行部署。这使得许多开发人员能够很好的维护自己的 JavaScript 应用程序，并且可以通过使用脚本标签创建一个或多个可以加载到客户端浏览器上的文件。  

There are many schools of thought on how you can achieve this packaging , including task runners such as [Grunt][5] and [Gulp][6], and bundlers such as [Browserify][7]. However, there is a general consensus that asset packaging is not only about improving load times—it enables the modularization of your application while ensuring testability and robustness.
关于如何实现打包有许多学校的思想，包括任务运行者比如【Grunt】【5】和【Gulp】，还有打包机比如【Browserity】【7】.然而，一个普遍的共识是，资产打包不仅仅是关于缩短加载时间 - 它可以在确保可测试性和稳定性的前提下使你的应用程序模块化。

### Using webpack with the Amazon Cognito Identity SDK for JavaScript
### 把具有亚麻逊 Cognito 标志 SDK 的 webpack 用于 JavaScript

In the many requests we get to provide more detail on how to integrate the Amazon Cognito Identity SDK for JavaScript within a webpack environment, we’re specifically asked how to ensure that webpack correctly manages the following third-party dependencies:
有许多请求需要我们提供如何在 webpack 环境中整合用于 JavaScript 的亚马逊 Cognito 标志 SDK 的更多细节。我们特地询问了如何确保 webpack 正确管理下面三方的关系：

- [JavaScript BN library for BigInteger computation][8] (jsbn)
- [an extension to jsbn][9] the with the rest of the jsbn methods including most public BigInteger methods (jsbn2)
- the [Stanford JavaScript Crypto Library][10] (sjcl)

Throughout these examples, the following bower libraries are used by bower.json

```
"aws-cognito-sdk": "https://raw.githubusercontent.com/aws/amazon-cognito-identity-js/master/dist/aws-cognito-sdk.js",
"amazon-cognito-identity": "https://raw.githubusercontent.com/aws/amazon-cognito-identity-js/master/dist/amazon-cognito-identity.min.js",
"sjcl": "https://raw.githubusercontent.com/bitwiseshiftleft/sjcl/master/sjcl.js",
"jsbn": "https://raw.githubusercontent.com/andyperlitch/jsbn/master/index.js",
```

For all the reasons we gave earlier for the importance of asset packaging to development processes, and unless your application is extremely small, the use of an asset packaging tool such as webpack is almost always recommended. Of course, one could simply pull in all of these dependencies using tags. However, this would pollute global namespace, and not provide the most optimal resource management and loading approach. Many developers start with a standard webpack.config.js file that has a standard babel loader, as shown here.

```
{
  /** test for file ending in js or jsx 
   * exclude node_module and bower_components - we dont want to babel these 
   * use the babel loader 
   * apply the react and es2015 (es6) transformations **/

  test: /\.jsx?$/,
  exclude: /(node_modules|bower_components)/,
  loader: 'babel',
  query: {
    presets: ['react', 'es2015']
  }
}
```

It’s important to remember that this configuration doesn’t take into account that some of third-party dependencies used by the Amazon Cognito Identity SDK for JavaScript currently do not use the [Universal Module Definition (UMD) pattern for JavaScript][11].

The UMD pattern attempts to offer Asynchronous Module Definition (AMD) based compatibility with the most popular script loaders of the day such as [RequireJS][12] and [CommonJS][13].

This is a pattern that webpack relies on, and so we must make some changes to how webpack loads these modules. Without these changes, you may encounter errors such as the following.

```
amazon-cognito-identity.min.js:19 Uncaught ReferenceError: BigInteger is not defined
```

Such an error may be encountered when making a call to AWSCognito.CognitoIdentityServiceProvider.CognitoUser property authenticateUser This is an example of where we can make use of the webpack imports and exports loader capability to overcome this error.

### Using webpack Loaders

According to the [webpack documentation][14] "loaders allow you to preprocess files as you require() or “load” them. Loaders are kind of like “tasks” are in other build tools, and provide a powerful way to handle front-end build steps. Loaders can transform files from a different language like, CoffeeScript to JavaScript, or inline images as data URLs"

In order to resolve the lack of UMD compatibility, you will rely to two specific loaders, import and export.

#### Using the Export Loader

In the case of the Amazon Cognito Identity SDK for JavaScript, we need to ensure we export theAWSCognito variables into the scope of the module that requires/imports (for ES6) them.

```
{
  test: /aws-cognito-sdk\/index\.js/,
  loader: 'exports?AWSCognito'
}
```

Using the exports loader has the effect of exporting a module method within bundle created by webpack. As a result, both AWSCognito and AWS are now accessible when required or import(ed) (for ES6).

```
var AWSCognito = require('aws-cognito-sdk')

/*** EXPORTS from export-loader ***/ 
module.exports = AWSCongito
```

More information about the exports loader can be found here

#### Using the Import Loader

The import loader is mostly used to inject (import) variables into the scope of another module. This is especially useful if third-party modules are relying on global variables like BitInteger or sjcl as is the case with Amazon Cognito Identity SDK for JavaScript.

If you don’t use the webpack loader, the following is generated within the bundle.

```
__webpack_require__(431);       // refers to jsbin
__webpack_require__(432);       // refers to sjcl
```

Beacuse neither jsbin or sjcl export anything, any calls that rely on these modules will result in an error.

To resolve this, we can use the following webpack loader configuration:

```
{
  test: /amazon-cognito-identity\/index\.js/,
  loader: 'imports?jsbn,BigInteger=>jsbn.BigInteger,sjcl'
},
{
  test: /sjcl\/index\.js/,
  loader: 'imports?sjcl'
}
```

This injects the following into the bundle (in this case bundle.js) created by webpack.

````
/*** IMPORTS FROM imports-loader ***/
var jsbn = __webpack_require__(431);
var BigInteger = jsbn.BigInteger;
var sjcl = __webpack_require__(432);
```

As a result, jsbn, BigInteger and sjcl are all imported from their respective modules into Amazon Cognito Identity SDK for JavaScript.

More information about the import loader can be found [here][15]

### Next Steps

We encourage you to download the [Amazon Cognito Identity SDK for JavaScript][16] and start building your application. Coupled with webpack, and by following the guidance in this blog, you we hope you have a smooth development experience.

If you have any comments or questions, please free to comment below, reach out via email (teichtah@amazon.com) or raise an issue [here][17].

### References

This blog post makes reference to the following third party resources

- webpack - https://webpack.github.io/
- webpack documentation - http://webpack.github.io/docs/what-is-webpack.html
- webpack exports loader - https://github.com/webpack/exports-loader
- webpack imports loader - https://github.com/webpack/imports-loader
- JavaScript BN library for BigInteger computation - http://www-cs-students.stanford.edu/~tjw/jsbn/jsbn.js
- jsbns - http://www-cs-students.stanford.edu/~tjw/jsbn/jsbn2.js
- Stanford JavaScript Crypto Library - https://github.com/bitwiseshiftleft/sjcl
- RequireJS - http://requirejs.org/
- CommonJS - http://www.commonjs.org/

--------------------------------------------------------------------------------

via: https://mobile.awsblog.com/post/Tx1A84CLMDJ744T/Using-webpack-with-the-Amazon-Cognito-Identity-SDK-for-JavaScript?utm_source=webopsweekly&utm_medium=email

作者：[Marc Teichtahl ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://mobile.awsblog.com/blog/author/Marc+Teichtahl
[1]: https://webpack.github.io/
[2]: https://blogs.aws.amazon.com/security/post/Tx13NVD4AWG9QK9/Amazon-Cognito-Your-User-Pools-is-Now-Generally-Available
[3]: https://github.com/aws/amazon-cognito-identity-js
[4]: http://mobile.awsblog.com/post/Tx2O14ZY8A5LFHT/Accessing-Your-User-Pools-using-the-Amazon-Cognito-Identity-SDK-for-JavaScript
[5]: http://gruntjs.com/
[6]: http://gulpjs.com/
[7]: http://browserify.org/
[8]: http://www-cs-students.stanford.edu/~tjw/jsbn/jsbn.js
[9]: http://www-cs-students.stanford.edu/~tjw/jsbn/jsbn2.js
[10]: https://github.com/bitwiseshiftleft/sjcl
[11]: https://github.com/umdjs/umd
[12]: http://requirejs.org/
[13]: http://www.commonjs.org/
[14]: http://webpack.github.io/docs/what-is-webpack.html
[15]: https://github.com/webpack/imports-loader
[16]: https://github.com/aws/amazon-cognito-identity-js
[17]: https://github.com/aws/amazon-cognito-identity-js/issues

