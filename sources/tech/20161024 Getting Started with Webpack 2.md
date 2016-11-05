# Getting Started with Webpack 2

 ![](https://cdn-images-1.medium.com/max/2000/1*yI44h8Df-l-2LUqvXIi8JQ.png) 

Webpack 2 will be out of beta [once the documentation has been finished][26]. But that doesn’t mean you can’t start using version 2 now if you know how to configure it.

### What is Webpack?

At its simplest, Webpack is a module bundler for your JavaScript. However, since its release it’s evolved into a manager of all your front-end code (either intentionally or by the community’s will).

 ![](https://cdn-images-1.medium.com/max/800/1*yBt2rFj2DbckFliGE0LEyg.png) 


A task runner such as _Gulp _can handle many different preprocessers and transpilers, but in all cases, it will take a source _input_ and crunch it into a compiled _output. _However, it does this on a case-by-case basis with no concern for the system at large. That is the burden of the developer: to pick up where the task runner left off and find the proper way for all these moving parts to mesh together in production.

Webpack attempts to lighten the developer load a bit by asking a bold question: _what if there were a part of the development process that handled dependencies on its own? What if we could simply write code in such a way that the build process managed itself, based on only what was necessary in the end?_

 ![](https://cdn-images-1.medium.com/max/800/1*TOFfoH0cXTc8G3Y_F6j3Jg.png) 

If you’ve been a part of the web community for the past few years, you already know the preferred method of solving a problem: _build this with JavaScript._And so Webpack attempts to make the build process easier by passing dependencies through JavaScript. But the true power of its design isn’t simply the code _management_ part; it’s that this management layer is 100% valid JavaScript (with Node features). Webpack gives you the ability to write valid JavaScript that has a better sense of the system at large.

In other words: _you don’t write code for Webpack. You write code for your projec_t. And Webpack keeps up (with some config, of course).

In a nutshell, if you’ve ever struggled with any of the following:

*   Accidentally including stylesheets and JS libraries you don’t need into production, bloating the size
*   Encountering scoping issues—both from CSS and JavaScript
*   Finding a good system for using Node/Bower modules in your JavaScript, or relying on a crazy backend configuration to properly utilize those modules
*   Needing to optimize asset delivery better but fearing you’ll break something

…then you could benefit from Webpack. It handles all the above effortlessly by letting JavaScript worry about your dependencies and load order instead of your developer brain. The best part? Webpack can even run purely on the server side, meaning you can still build [progressively-enhanced][25] websites using Webpack.

### First Steps

We’ll use [Yarn][24] (`brew install yarn`) in this tutorial instead of `npm`, but it’s totally up to you; they do the same thing. From our project folder, we’ll run the following in a terminal window to add Webpack 2 to both our global packages and our local project:

```
yarn global add webpack@2.1.0-beta.25 webpack-dev-server@2.1.0-beta.9
yarn add --dev webpack@2.1.0-beta.25 webpack-dev-server@2.1.0-beta.9
```

We’ll then declare a webpack configuration with a `webpack.config.js` file in the root of our project directory:

```
`'use strict';

const webpack = require("webpack");

module.exports = {
  context: __dirname + "/src",
  entry: {
    app: "./app.js",
  },
  output: {
    path: __dirname + "/dist",
    filename: "[name].bundle.js",
  },
};`
```

_Note: _`___dirname_`_ refers to the root of your project._

Remember that Webpack “knows” what’s going in your project? It _knows_ by reading your code (don’t worry; it signed an NDA). Webpack basically does the following:

1.  Starting from the `context` folder, …
2.  … it looks for `entry` filenames …
3.  … and reads the content. Every `import` ([ES6][7]) or `require()` (Node) dependency it finds as it parses the code, it bundles for the final build. It then searches _those_ dependencies, and those dependencies’ dependencies, until it reaches the very end of the “tree”—only bundling what it needed to, and nothing else.
4.  From there, Webpack bundles everything to the `output.path` folder, naming it using the `output.filename` naming template (`[name]` gets replaced with the object key from `entry`)

So if our `src/app.js` file looked something like this (assuming we ran `yarn add --dev moment` beforehand):

```
'use strict';
```

```
import moment from 'moment';
var rightNow = moment().format('MMMM Do YYYY, h:mm:ss a');
console.log( rightNow );
```

```
// "October 23rd 2016, 9:30:24 pm"
```

We’d run

```
webpack -p
```

_Note: The _`_p_`_ flag is “production” mode and uglifies/minifies output._

And it would output a `dist/app.bundle.js` that logged the current date & time to the console. Note that Webpack automatically knew what `'moment'`referred to (although if you had a `moment.js` file in your directory, by default Webpack would have prioritized this over your `moment` Node module).

### Working with Multiple Files

You can specify any number of entry/output points you wish by modifying only the `entry` object.

#### Multiple files, bundled together

```
`'use strict';

const webpack = require("webpack");

module.exports = {
  context: __dirname + "/src",
  entry: {
    app: ["./home.js", "./events.js", "./vendor.js"],
  },
  output: {
    path: __dirname + "/dist",
    filename: "[name].bundle.js",
  },
};`
```

Will all be bundled together as one `dist/app.bundle.js` file, in array order.

#### Multiple files, multiple outputs

```
`const webpack = require("webpack");

module.exports = {
  context: __dirname + "/src",
  entry: {
    home: "./home.js",
    events: "./events.js",
    contact: "./contact.js",
  },
  output: {
    path: __dirname + "/dist",
    filename: "[name].bundle.js",
  },
};`
```

Alternately, you may choose to bundle multiple JS files to break up parts of your app. This will be bundled as 3 files: `dist/home.bundle.js`, `dist/events.bundle.js`, and `dist/contact.bundle.js`.

#### Advanced auto-bundling

If you’re breaking up your application into multiple `output` bundles (useful if one part of your app has a ton of JS you don’t need to load up front), there’s a likelihood you may be duplicating code across those files, because it will resolve each dependency separately from one another. Fortunately, Webpack has a built-in _CommonsChunk_ plugin to handle this:

```
module.exports = {
  // …
```

```
  plugins: [
    new webpack.optimize.CommonsChunkPlugin({
      name: "commons",
      filename: "commons.js",
      minChunks: 2,
    }),
  ],
```

```
// …
};
```

Now, across your `output` files, if you have any modules that get loaded `2` or more times (set by `minChunks`), it will bundle that into a `commons.js` file which you can then cache on the client side. This will result in an additional header request, sure, but you prevent the client from downloading the same libraries more than once. So there are many scenarios where this is a net gain for speed.

### Developing

Webpack actually has its own development server, so whether you’re developing a static site or are just prototyping your front-end, it’s perfect for either. To get that running, just add a `devServer` object to `webpack.config.js`:

```
module.exports = {
  context: __dirname + "/src",
  entry: {
    app: "./app.js",
  },
  output: {
    filename: "[name].bundle.js",
    path: __dirname + "/dist/assets",
    publicPath: "/assets",            // New
  },
  devServer: {
    contentBase: __dirname + "/src",  // New
  },
};
```

Now make a `src/index.html` file that has:

```
<script src="/assets/app.bundle.js"></script>
```

… and from your terminal, run:

```
webpack-dev-server
```

Your server is now running at `localhost:8080`. _Note how _`_/assets_`_ in the script tag matches _`_output.publicPath_`_—you can name this whatever you want (useful if you need a CDN)._

Webpack will hotload any JavaScript changes as you make them without the need to refresh your browser. However, any changes to the`webpack.config.js` file will require a server restart to take effect.

### Globally-accessible methods

Need to use some of your functions from a global namespace? Simply set `output.library` within `webpack.config.js`:

```
module.exports = {
  output: {
    library: 'myClassName',
  }
};
```

… and it will attach your bundle to a `window.myClassName` instance. So using that name scope, you could call methods available to that entry point (you can read more about this setting [on the documentation][23]).

### Loaders

Up until now, we’ve only covered working with JavaScript. It’s important to start with JavaScript because _that’s the only language Webpack speaks_. We can work with virtually any file type, as long as we pass it into JavaScript. We do that with _Loaders_.

A loader can refer to a preprocessor such as Sass, or a transpiler such as Babel. On NPM, they’re usually named `*-loader` such as `sass-loader` or `babel-loader`.

#### Babel + ES6

If we wanted to use ES6 via [Babel][22] in our project, we’d first install the appropriate loaders locally:

```
yarn add --dev babel-loader babel-core babel-preset-es2015
```

… and then add it to `webpack.config.js` so Webpack knows where to use it.

```
module.exports = {
  // …
```

```
  module: {
    rules: [
      {
        test: /\.js$/,
        use: [{
          loader: "babel-loader",
          options: { presets: ["es2015"] }
        }],
      },

      // Loaders for other file types can go here
```

```
    ],
  },
```

```
  // …
};
```

_A note for Webpack 1 users: the core concept for Loaders remains the same, but the syntax has improved. Until they finish the docs this may/may not be the exact preferred syntax._

This looks for the `/\.js$/` RegEx search for any files that end in `.js` to be loaded via Babel. Webpack relies on RegEx tests to give you complete control—it doesn’t limit you to file extensions or assume your code must be organized in a certain way. For example: maybe your `/my_legacy_code/` folder isn’t written in ES6\. So you could modify the `test` above to be `/^((?!my_legacy_folder).)*\.js$/` which would exclude that specific folder, but process the rest with Babel.

#### CSS + Style Loader

If we wanted to only load CSS as our application needed, we could do that as well. Let’s say we have an `index.js` file. We’ll import it from there:

```
import styles from './assets/stylesheets/application.css';
```

We’ll get the following error: `You may need an appropriate loader to handle this file type`. Remember that Webpack can only understand JavaScript, so we’ll have to install the appropriate loader:

```
yarn add --dev css-loader style-loader
```

… and then add a rule to `webpack.config.js`:

```
module.exports = {
  // …
```

```
  module: {
    rules: [
      {
        test: /\.css$/,
        use: ["style-loader", "css-loader"],
      },
```

```
      // …
    ],
  },
};
```

_Loaders are processed in __reverse array order__. That means _`_css-loader_`_ will run before _`_style-loader_`_._

You may notice that even in production builds, this actually bundles your CSS in with your bundled JavaScript, and `style-loader` manually writes your styles to the `<head>`. At first glance it may seem a little kooky, but slowly starts to make more sense the more you think about it. You’ve saved a header request—saving valuable time on some connections—and if you’re loading your DOM with JavaScript anyway, this essentially eliminates [FOUC][21] on its own.

You’ll also notice that—out of the box—Webpack has automatically resolved all of your `@import` queries by packaging those files together as one (rather than relying on CSS’s default import which can result in gratuitious header requests and slow-loading assets).

Loading CSS from your JS is pretty amazing, because you now can modularize your CSS in powerful new ways. Say you loaded `button.css`only through `button.js`. This would mean if `button.js` is never actually used_, _its CSS wouldn’t bloat out our production build. If you adhere to component-oriented CSS practices such as SMACSS or BEM, you see the value in pairing your CSS more closely with your markup + JavaScript.

#### CSS + Node modules

We can use Webpack to take advantage of importing Node modules using Node’s `~` prefix. If we ran `yarn add normalize.css`, we could use:

```
@import "~normalize.css";
```

… and take full advantage of NPM managing our third party styles for us—versioning and all—without any copy + pasting on our part. Further, getting Webpack to bundle CSS for us has obvious advantages over using CSS’s default import, saving the client from gratuitous header requests and slow load times.

_Update: this and the following section have been updated for accuracy, no longer confusing using CSS Modules to simply import Node modules. Thanks to _[_Albert Fernández_][20]_ for the help!_

#### CSS Modules

You may have heard of [CSS Modules][19], which takes the _C_ out of _CSS_. It typically works best only if you’re building the DOM with JavaScript, but in essence, it magically scopes your CSS classes to the JavaScript file that loaded it ([learn more about it here][18]). If you plan on using it, CSS Modules comes packaged with `css-loader` (`yarn add --dev css-loader`):

```
module.exports = {
  // …
```

```
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [
          "style-loader",
          { loader: "css-loader", options: { modules: true } }
        ],
      },
```

```
      // …
    ],
  },
};
```

_Note: for _`_css-loader_`_ we’re now using the __expanded object syntax__ to pass an option to it. You can use a string instead as shorthand to use the default options, as we’re still doing with _`_style-loader_`_._

* * *

It’s worth noting that you can actually drop the `~` when importing Node Modules with CSS Modules enabled (e.g.: `@import "normalize.css";`). However, you may encounter build errors now when you `@import` your own CSS. If you’re getting “can’t find ___” errors, try adding a `resolve` object to `webpack.config.js` to give Webpack a better understanding of your intended module order.

```
const path = require("path");
```

```
module.exports = {
  //…
```

```
  resolve: {
    modules: [path.resolve(__dirname, "src"), "node_modules"]
  },
};
```

We specified our source directory first, and then `node_modules`. So Webpack will handle resolution a little better, first looking through our source directory and then the installed Node modules, in that order (replace `"src"` and `"node_modules"` with your source and Node module directories, respectively).

#### Sass

Need to use Sass? No problem. Install:

```
yarn add --dev sass-loader node-sass
```

And add another rule:

```
module.exports = {
  // …
```

```
  module: {
    rules: [
      {
        test: /\.(sass|scss)$/,
        use: [
          "style-loader",
          "css-loader",
          "sass-loader",
        ]
      } 
```

```
      // …
    ],
  },
};
```

Then when your Javascript calls for an `import` on a `.scss` or `.sass` file, Webpack will do its thing.

#### CSS bundled separately

Maybe you’re dealing with progressive enhancement; maybe you need a separate CSS file for some other reason. We can do that easily by swapping out `style-loader` with `extract-text-webpack-plugin` in our config without having to change any code. Take our example `app.js` file:

```
import styles from './assets/stylesheets/application.css';
```

Let’s install the plugin locally (we need the beta version for this as of Oct 2016)…

```
yarn add --dev extract-text-webpack-plugin@2.0.0-beta.4
```

… and add to `webpack.config.js`:

```
const ExtractTextPlugin = require("extract-text-webpack-plugin");
```

```
module.exports = {
  // …
```

```
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [
          ExtractTextPlugin.extract("css"),
          { loader: "css-loader", options: { modules: true } },
        ],
      },

      // …
    ]
  },
  plugins: [
    new ExtractTextPlugin({
      filename: "[name].bundle.css",
      allChunks: true,
    }),
  ],
};
```

Now when running `webpack -p` you’ll also notice an `app.bundle.css` file in your `output` directory. Simply add a `<link>` tag to that file in your HTML as you would normally.

#### HTML

As you might have guessed, there’s also an `[html-loader][6]`[ plugin][17] for Webpack. However, when we get to loading HTML with JavaScript, this is about the point where we branch off into a myriad of differing approaches, and I can’t think of one single example that would set you up for whatever you’re planning on doing next. Typically, you’d load HTML for the purpose of using JavaScript-flavored markup such as [JSX][16] or [Mustache][15] or [Handlebars][14] to be used within a larger system such as [React][13], [Angular][12], [Vue][11], or [Ember][10].

So I’ll end the tutorial here: you _can_ load markup with Webpack, but by this point you’ll be making your own decisions about your architecture that neither I nor Webpack can make for you. But using the above examples for reference and searching for the right loaders on NPM should be enough to get you going.

### Thinking in Modules

In order to get the most out of Webpack, you’ll have to think in modules—small, reusable, self-contained processes that do one thing and one thing well. That means taking something like this:

```
└── js/
    └── application.js   // 300KB of spaghetti code
```

… and turning it into this:

```
└── js/
    ├── components/
    │   ├── button.js
    │   ├── calendar.js
    │   ├── comment.js
    │   ├── modal.js
    │   ├── tab.js
    │   ├── timer.js
    │   ├── video.js
    │   └── wysiwyg.js
    │
    └── application.js  // ~ 1KB of code; imports from ./components/
```

The result is clean, reusable code. Each individual component depends on `import`-ing its own dependencies, and `export`-ing what it wants to make public to other modules. Pair this with Babel + ES6, and you can utilize [JavaScript Classes][9] for great modularity, and _don’t-think-about-it _scoping that just works.

For more on modules, see [this excellent article by Preethi Kasreddy][8].

* * *

### Further Reading

*   [What’s New in Webpack 2][5]
*   [Webpack Config docs][4]
*   [Webpack Examples][3]
*   [React + Webpack Starter Kit][2]
*   [Webpack How-to][1]

</section>

--------------------------------------------------------------------------------

via: https://blog.madewithenvy.com/getting-started-with-webpack-2-ed2b86c68783#.oozfpppao

作者：[Drew Powers][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.madewithenvy.com/@an_ennui
[1]:https://github.com/petehunt/webpack-howto
[2]:https://github.com/kriasoft/react-starter-kit
[3]:https://github.com/webpack/webpack/tree/master/examples
[4]:https://webpack.js.org/configuration/
[5]:https://gist.github.com/sokra/27b24881210b56bbaff7
[6]:https://github.com/webpack/html-loader
[7]:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import
[8]:https://medium.freecodecamp.com/javascript-modules-a-beginner-s-guide-783f7d7a5fcc
[9]:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes
[10]:http://emberjs.com/
[11]:http://vuejs.org/
[12]:https://angularjs.org/
[13]:https://facebook.github.io/react/
[14]:http://handlebarsjs.com/
[15]:https://github.com/janl/mustache.js/
[16]:https://jsx.github.io/
[17]:https://github.com/webpack/html-loader
[18]:https://github.com/css-modules/css-modules
[19]:https://github.com/css-modules/css-modules
[20]:https://medium.com/u/901a038e32e5
[21]:https://en.wikipedia.org/wiki/Flash_of_unstyled_content
[22]:https://babeljs.io/
[23]:https://webpack.js.org/concepts/output/#output-library
[24]:https://yarnpkg.com/
[25]:https://www.smashingmagazine.com/2009/04/progressive-enhancement-what-it-is-and-how-to-use-it/
[26]:https://github.com/webpack/webpack/issues/1545#issuecomment-255446425
