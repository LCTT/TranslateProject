[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 predictions for JavaScript build tools)
[#]: via: (https://opensource.com/article/20/11/javascript-build-tools)
[#]: author: (Shedrack Akintayo https://opensource.com/users/shedrack-akintayo)

6 predictions for JavaScript build tools
======
The JavaScript frontend tooling ecosystem is dynamic and competitive,
and only the best survive.
![Magnifying glass on code][1]

Code used in production is different from development code. In production, you need to build packages that run fast, manage dependencies, automate tasks, load external modules, and more. [JavaScript][2] tools that make it possible to turn development code into production code are called _build tools._

The reason frontend code is "built" can be explained by looking into the various build steps and their importance.

### Steps in building frontend code

There are four steps involved in building frontend code:

#### 1\. Transpiling

Transpiling lets developers take advantage of the newest, hottest updates to languages and extensions and maintain browser compatibility. Here is an example using [Babel][3]:


```
// arrow function syntax in array map
const double = [1, 2, 3].map((num) =&gt; num * 2);
// after being transpiled
const double = [1, 2, 3].map(function(num) {
  return num * 2;
});
```

#### 2\. Bundling

Bundling is the process of taking all the "import" or "require" statements; finding the matching JavaScript snippets, packages, and libraries; adding them to the appropriate scope; and packaging it all into one big JavaScript file. Commonly used bundlers include Browserify, Webpack, and Parcel.

#### 3\. Minifing

Minifying reduces the final file size by removing white space and code comments. You can take this a step further by adding an obfuscate step, which changes variable names and method names, obscuring the code, so it is less human-readable once it's delivered to the client. Here is an example using Grunt:


```
// before minifying
const double = [1, 2, 3].map(function(num) {
  return num * 2;
});
// after minifying
const double = [1, 2, 3].map(function(num) {
  return num * 2;
});
```

#### 4\. Packaging

After all the steps above are finished, the compatible, bundled, minified/obfuscated file must be put somewhere. Packaging is the process of putting the results of the above steps somewhere specified by the developer. This is usually done by the bundler.

### Frontend build tools

Frontend tooling and build tools can be split into the following categories:

  * Package managers: NPM, Yarn
  * Transpilers: Babel, etc.
  * Bundlers: Webpack, Parcel, Browserify
  * Minifiers: UglifyJS, Packer, Minify, etc.



There are a variety of build tools you can use in the JavaScript ecosystem, including the following.

#### Grunt and Bower

[Grunt][4] was introduced as a command-line tool that provided just one script to specify and configure tasks. [Bower][5] followed shortly after as a way to manage client-side packages. The two, along with NPM, seemed to fulfill the majority of automation needs and were used regularly together. The problem with Grunt was that it didn't provide developers the freedom to configure more complex task chains, while Bower made developers manage twice as many packages as usual because it separates frontend and backend packages (i.e., Bower components vs. Node modules).

**The future of Grunt and Bower:** Grunt and Bower are on their way out of the JavaScript tooling ecosystem, but there are several replacements.

#### Gulp and Browserify

[Gulp][6] was released a year and a half after Grunt. It felt natural. Writing a build script in JavaScript compared to JSON gave freedom. You could write functions, create variables on the fly, use conditionals anywhere—not that this would make for a particularly good-looking build script, but it was possible. [Browserify][7] and Gulp can be used in tandem. Browserify allows NPM packages (which are for backend Node servers) to be brought into the frontend, making Bower obsolete. It also looks and feels better, with one package manager for the frontend and backend.

**The future of Gulp:** Gulp can be improved to match the current popular build tools, but this is entirely up to the creators. It is still in use but not as popular as it was before.

#### Webpack and NPM/Yarn scripts

[Webpack][8] is the hottest kid on the block in modern frontend development tooling. Webpack is an open-source JavaScript module bundler. It is made primarily for JavaScript, but it can transform frontend assets like HTML, CSS, and images if the corresponding loaders are included. With Webpack, you can also write scripts like Gulp and execute them with [NPM/Yarn][9].

**The future of Webpack:** Webpack is currently the hottest thing in the JavaScript tooling ecosystem, and all the JS cool kids are using React and Webpack these days. It is currently in version 4 and not going anywhere anytime soon.

#### Parcel

[Parcel][10] is a web application bundler that launched in 2018 and is differentiated by its developer experience. It offers blazing-fast performance utilizing multicore processing and requires zero configuration. Parcel is also a new kid on the block, but adoption hasn't been fast, especially for large applications. Developers prefer to use Webpack over Parcel because of the former's extensive support and customizability.

**The future of Parcel:** Parcel is very easy to use, it is faster than Webpack if you measure bundle and build time, and it also offers a better developer experience. The reason Parcel hasn't been adopted much might be because it's still relatively new. Parcel has a very bright future in the frontend build tools ecosystem, and it will be around for a while.

#### Rollup

[Rollup][11] is a module bundler for JavaScript that compiles small pieces of code into something larger and more complex, such as a library or an application. It is advisable to use Rollup when building a library with minimal third-party imports.

**The future of Rollup:** Rollup is super-cool and is being adopted rapidly. It has great features and will be part of the frontend tooling ecosystem for a long time.

### Learn more

The JavaScript tooling ecosystem is dynamic and competitive, and only the best tools survive. In the future, we will see tools that require less (or no) configuration, better customizability, more extensibility, and higher speed.

The tools you use for an application's frontend are a personal call that you need to make based on your project's requirements. Choose what works best for you, and most of the time, there are tradeoffs.

For more information, see:

  * [JavaScript tooling: The evolution and future of JS/frontend build tools][12]
  * [Tools and modern workflow for frontend developers][13]
  * [Modern frontend: The tools and build process explained][14]
  * [Best build tools in frontend development][15]



* * *

_This article originally appeared on [Shedrack Akintayo's blog][16] and is republished with his permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/javascript-build-tools

作者：[Shedrack Akintayo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/shedrack-akintayo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0 (Magnifying glass on code)
[2]: https://www.javascript.com/
[3]: https://babeljs.io/
[4]: https://gruntjs.com/
[5]: https://bower.io/
[6]: https://gulpjs.com/
[7]: http://browserify.org/
[8]: https://webpack.js.org/
[9]: https://github.com/yarnpkg/yarn
[10]: https://parceljs.org/
[11]: https://rollupjs.org/guide/en/
[12]: https://qmo.io/blog/javascript-tooling-the-evolution-and-future-of-js-front-end-build-tools/
[13]: https://blog.logrocket.com/tools-and-modern-workflow-for-front-end-developers-505c7227e917/
[14]: https://medium.com/@trevorpoppen/modern-front-end-the-tools-and-build-process-explained-36641b5c1a53
[15]: https://www.developerdrive.com/best-build-tools-frontend-development/
[16]: https://www.sheddy.xyz/posts/javascript-build-tools-past-and-beyond
