用带有 Amazon Cognito Identity SDK 的 webpack 打包 JavaScript
=====

这篇文章针对开发和部署基于 JavaScript 的应用（服务器端的 Node.js 或者客户端）的各种经验水平的开发者，通过本文，你将看到如何把 AWS SDK， Amazon Cognito Identity SDK 嵌入到 JavaScript 中，以及如何使用流行的 [webpack][1] 模块打包器。

2016 年 7 月， AWS [推出了 Amazon Cognito 用户库（user pool）][2]，这个新特性极大的方便了开发者在移动和 Web 应用程序上添加注册和登录功能。为了让开发者更容易在自己的应用程序中实现用户库功能，我们也发布了[用于 JavaScript 的 Amazon Cognito Identity SDK][3]。

Amazon Cognito 用户库可以让你在移动和 Web 应用程序上添加用户注册和登录功能更加容易。全托管用户库可以扩展到数以百万计的用户，你可以在每个 AWS 账户下有多重目录。创建一个用户库只需要几分钟的时间，并且你可以决定当一个新用户在你的应用程序或服务上注册时哪些属性（包括地址、邮箱、电话号码以及自定义属性）是强制的，哪些是可选择的。你的应用程序也可以指定所需的密码强度，指定用户需要进行多因素认证（MFA），以及通过电话号码或者邮件地址来验证新用户，从而进一步加强应用程序的安全性。

如果你是首次接触用于 JavaScript 的 Amazon Cognito Identity SDK，那么请先阅读[这篇 AWS 文章][4]作为开始。

### 为什么在 JavaScript 上使用 Asset 及模块捆绑的 Amazon Cogtito Identity SDK

今天，针对移动和桌面的现代 Web 应用程序都能为用户提供安全、快捷、灵敏以及类本地应用的体验。毫无疑问，现代的浏览器功能足够强大，能够肩负起大量可能的功能实现。许多流行的实现很大程度上依赖于 JavaScript 应用程序通过某种形式的 asset 封装和/或模块捆绑进行部署。这使得许多开发人员能够很好的维护自己的 JavaScript 应用程序，并且可以通过使用 script 标签创建一个或多个可以加载到客户端浏览器上的文件。  

关于如何实现打包有许多争鸣，包括 [Grunt][5] 和 [Gulp][6] 这样的 task runner，以及 [Browserity][7] 这样的打包器。然而，一个普遍的共识是， asset 打包不仅可以改善加载时间 - 它可以在确保可测试性和健壮性的前提下使你的应用程序模块化。

### 使用带有 Amazon Cognito Identity SDK 的 webpack 打包 JavaScript

我们接到了许多请求，要求我们提供如何在 webpack 环境下整合用于 JavaScript 的 Amazon Cognito Identity SDK 的更多细节。我们特地要求确保 webpack 正确管理一下第三方的依赖包：

- [用于 BigInteger 计算的 JavaScript BN 库][8]（jsbn）
- [jsbn 扩展][9]及包含大多数公共 BigInteger 方法的其它 jsbn 方法（jsbn2）
- [Stanford JavaScript Crypto 库][10]（jscl）

通过这些例子，可以看到，下面这些 bower 库都被 bower.json 使用

```
"aws-cognito-sdk": "https://raw.githubusercontent.com/aws/amazon-cognito-identity-js/master/dist/aws-cognito-sdk.js",
"amazon-cognito-identity": "https://raw.githubusercontent.com/aws/amazon-cognito-identity-js/master/dist/amazon-cognito-identity.min.js",
"sjcl": "https://raw.githubusercontent.com/bitwiseshiftleft/sjcl/master/sjcl.js",
"jsbn": "https://raw.githubusercontent.com/andyperlitch/jsbn/master/index.js",
```

出于我们前面给出的关于 asset 打包对于开发过程的重要性的原因，除非你的应用程序非常小，否则使用像 webpack 这样的 asset 打包工具几乎总是必须的。当然，还有一个方法是可以通过使用标签简单的处理所有依赖关系。然而，这会污染全局命名空间，而且不能够提供最优的资源管理和加载方式。许多开发者首次使用的是具有标准 babel 加载器的标准 webpack.config.js 文件，像下面展示的这样。

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

需要重点记住的是，这个配置没有考虑一些第三方依赖关系，这些被用于 JavaScript 的 Amazon Cognito Identity SDK 所使用的第三方依赖目前没有使用 [JavaScript 通用模块定义(UMD)][11]。

UMD 模式试图提供与 [RequireJS][12] 和 [CommonJS][13]  这些当前最流行的脚本加载器的异步模块定义 [AMD] 的基本兼容。

这是 webpack 所依赖的模式，为了让 webpack 能够工作，我们必须进行一些改变。不做这些改变，你可能会遇到下面这些错误。

```
amazon-cognito-identity.min.js:19 Uncaught ReferenceError: BigInteger is not defined
```
这样一个错误可能会在调用 AWSCognito.CognitoIdentityServiceProvider.CognitoUser property authenticateUser 的时候出现。在这个错误例子中，我们可以利用 webpack 的 import 和 export 加载器的能力来解决这个错误。

### 使用 webpack 加载器

根据 [webpack 文档]，“加载器允许你通过 require() 或 load 来预处理文件。加载器是一种类似其它构建工具中 “tasks” 的工具，它可以提供一个处理前端构建步骤的强大方法。加载器可以把一个文件从一种语言转化成另一种语言，比如把 CoffeeScript 转化成 JavaScript ，或者把图像转换为 data URL。“

为了解决 UMD 的兼容性缺乏的问题，你必须依赖两个具体的加载器， import 和 export 加载器。

#### 使用 export 加载器

在使用用于 JavaScript 的 Amazon Cognito Identity SDK 的情况下，我们需要确保把 theAWSCognito 变量导出到 require /import 它们的模块的变量范围内（针对 ES6）。

```
{
  test: /aws-cognito-sdk\/index\.js/,
  loader: 'exports?AWSCognito'
}
```

在由 webpack 创建的捆绑中，使用 export 加载器会有导出模块方法的效果。因此， 在 require 和 import 后，AWSCognito 和 AWS 是可访问的（针对 ES6）。

```
var AWSCognito = require('aws-cognito-sdk')

/*** EXPORTS from export-loader ***/ 
module.exports = AWSCongito
```

[这儿][18]可以找到更多关于 export 加载器的信息。

#### 使用 import 加载器

import 加载器主要用于把变量注入（import）到另一个模块的变量范围内。当第三方模块需要依赖全局变量的时候， import 加载器非常有用，比如针对 JavaScript 的 Amazon Cognito Identity SDK 需要依赖 BigInteger 或者 sjcl 的时候。

如果你不使用 webpack 加载器，下面这些内容会在一个捆绑中生成。

```
__webpack_require__(431);       // refers to jsbin
__webpack_require__(432);       // refers to sjcl
```

因为 jsbin 和 sjcl 都不能 export 任何东西，因此任何依赖于这些模块的调用都会导致一个错误。

为了解决这个问题，我们需要使用下面的 webpack 加载器配置：

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

这个配置把下面的这些内容嵌入到了由 webpack 创建的捆绑中（此时是 bundle.js）。

````
/*** IMPORTS FROM imports-loader ***/
var jsbn = __webpack_require__(431);
var BigInteger = jsbn.BigInteger;
var sjcl = __webpack_require__(432);
```

结果，jsbn、BigInteger 和 sjcl 都被从它们各自的模块中导入到了用于 JavaScript 的 Amazon Cognito Identity SDK 中。

有关 import 加载器的更多信息可以在[这儿][15]找到。

### 下一步

我们鼓励你下载[用于 JavaScript 的 Amazon Cognito Identity SDK][16] 并开始构建你的应用，并在这篇文章的指导下通过 webpack 能够迅速掌握。

如果你有任何意见或问题，请在下面自由评论，也可以发邮件到 teichtah@amazon.com 或者在[这儿][17]提出问题。

### 引用

这篇文章引用了下面这些第三方资源：

- webpack - https://webpack.github.io/
- webpack 文件 - http://webpack.github.io/docs/what-is-webpack.html
- webpack export 加载器 - https://github.com/webpack/exports-loader
- webpack import 加载器 - https://github.com/webpack/imports-loader
- 用于 BigInteger 计算的 JavaScript BN 库- http://www-cs-students.stanford.edu/~tjw/jsbn/jsbn.js
- jsbns - http://www-cs-students.stanford.edu/~tjw/jsbn/jsbn2.js
- Stanford JavaScript Crypto 库 - https://github.com/bitwiseshiftleft/sjcl
- RequireJS - http://requirejs.org/
- CommonJS - http://www.commonjs.org/

--------------------------------------------------------------------------------

via: https://mobile.awsblog.com/post/Tx1A84CLMDJ744T/Using-webpack-with-the-Amazon-Cognito-Identity-SDK-for-JavaScript

作者：[Marc Teichtahl][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

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
[18]: https://github.com/webpack/exports-loader
