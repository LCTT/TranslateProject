[#]: subject: "Some notes on using esbuild"
[#]: via: "https://jvns.ca/blog/2021/11/15/esbuild-vue/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Some notes on using esbuild
======

Hello!

I’ve been writing more frontend code in the last year or two – I’ve been making a bunch of little Vue projects. (for example [nginx playground][1], [sql playground][2], [this dns lookup tool][3], and a couple of others)

My general approach to frontend development has been pretty “pretend it’s 2005” – I usually have an `index.html` file, a `script.js` file, and then I do a `<script src="script.js">` and that’s it. You can see an [example of that approach here][4].

This has been working mostly ok for me, but sometimes I run into problems. So I wanted to talk about one of those problems, a solution I found ([esbuild][5]!), and what I needed to learn to solve the problem (some very basic facts about how npm builds work).

Some of the facts in this post might be wrong because still I don’t understand Javascript build systems that well.

### problem 1: libraries that tell you to `npm install` them

Sometimes I see Javascript libraries that I’m interested in using, and they have installation instructions like this:

```

    npm install vue-jcrop

```

and code examples to use the library that look like this:

```

    import { Jcrop } from 'vue-jcrop';

```

Until last week, I found this completely mystifying – I had no idea what `import` was doing and I didn’t understand how to use libraries in that way.

I still don’t totally understand but I understand a tiny bit more now and I will try to explain what I’ve learned.

### problem 2: I don’t understand frontend build tools

Of course, the obvious way to solve problem 1 is to use Vue.js the “normal” way where I install it with `npm` and use Vite or `vue-cli-service` or whatever.

I’ve used those tools before once or twice – there’s this project generator called `vue create` which will set up everything for you properly, and it totally works.

But I stopped using those tools and went back to my old `<script src="script.js">` system because I don’t understand what those `vue-cli-service` and `vite` are doing and I didn’t feel confident that I could fix them when they break. So I’d rather stick to a setup that I actually understand.

I think the reason `vue-cli-service` is so confusing to me is that it’s actually doing many different things – I think it:

  * compiles Vue templates
  * runs Babel (??)
  * does type checking for Typescript (if you’re using typescript)
  * does all of the above with webpack which I will not try to explain much because I don’t understand it, I think it’s a system with a million plugins that does a million things
  * probably some other things I’m forgetting or don’t even know about



If I were working on a big frontend project I’d probably use those tools whether or not I understood them because they do useful things. But I haven’t been using them.

### esbuild: a simple way to resolve `import`s

Okay! Let’s get to the point of the post!

Recently I learned about `esbuild` which is a new JS build tool written in Go. I’m excited about it because it lets me use `import`s in my code without using a giant build pipeline that I don’t understand. I’m also used to the style of command-line tools written in Go so it feels more “natural” to me than other tools written in Javascript do.

Basically `esbuild` can resolve all the imports and then bundle everything into 1 big file.

So let’s say I want to use `vue` in my library. I can get it working by doing these 4 steps:

**step 1: install the library I want**

`npm install vue` or whatever.

**step 2: import it in script.js**

```

    import Vue from 'vue';

```

**step 3: run `esbuild` to bundle it**

```

    $ esbuild script.js  --bundle --minify  --outfile=bundle.js

```

**step 4: add a `<script src='bundle.js'>`;**

Then I need to replace all of my script tags with just one script (`<script src="bundle.js">`) in my HTML, and everything should just work, right?

This all seemed very simple and I was super excited about this, but…

### problem 3: it didn’t work

I was really excited about this, but when I tried it (`import Vue from 'vue'`), it didn’t work! I was really baffled by this, but I was eventually able to figure it out with some help from people who understood Javascript. (spoiler: it wasn’t esbuild’s fault!)

To understand why my `import` didn’t work, I needed to learn a little bit more about how frontend packaging works. So let’s talk about that.

First, I was getting this error message in the JS console (which of course I didn’t see until the 20th time I looked at the console)

> [Vue warn]: You are using the runtime-only build of Vue where the template compiler is not available. Either pre-compile the templates into render functions, or use the compiler-included build.

This was bad, because I was compiling my Vue templates at runtime, so I definitely needed the template compiler. So I just needed to convince `esbuild` to give me the version of Vue with the template compiler. But how?

### frontend libraries can have many different build artifacts

Apparently frontend libraries often have many different build artifacts! For example, here are all of the different Vue build artifacts I have on my computer, excluding the minified versions:

```

    $ ls node_modules/vue/dist | grep -v min
    README.md
    vue.common.dev.js
    vue.common.js
    vue.common.prod.js
    vue.esm.browser.js
    vue.esm.js
    vue.js
    vue.runtime.common.dev.js
    vue.runtime.common.js
    vue.runtime.common.prod.js
    vue.runtime.esm.js
    vue.runtime.js

```

I think the different options being expressed here are:

  * dev vs prod (how verbose are the error messages?)
  * runtime vs not-runtime (does it include a template compiler?)
  * whatever the difference between `vue.js` vs `vue.esm.js` vs `vue.common.js` is (something about ES6 modules vs CommonJS???)



### how the build artifact usually gets chosen: webpack or something

I think the way Vue.js usually chooses which Vue version `import` uses is through a config file called `vue.config.ts`

As far as I can tell, this usually gets processed through some code [in this file][6] that looks like this:

```

          webpackConfig.resolve
            .alias
              .set(
                'vue$',
                options.runtimeCompiler
                  ? 'vue/dist/vue.esm.js'
                  : 'vue/dist/vue.runtime.esm.js'
              )

```

Even though I have no idea how Webpack works, this is pretty helpful! It’s saying that if I want the runtime compiler, I need to use `vue.esm.js` intead of `vue.runtime.esm.js`. I can do that!

### what build artifact is esbuild loading?

I also double checked which version of `Vue` esbuild is loading using strace, because I love strace:

I made a file called `blah.js` that looks like this:

```

    import Vue from 'vue';

    const app = new Vue()

```

and saw which files it opened, like this: (you have to scroll right to see the filenames)

```

    $ strace -e openat -f  esbuild blah.js  --bundle --outfile=/dev/null
    openat(AT_FDCWD, "/home/bork/work/mess-with-dns/frontend/package.json", O_RDONLY|O_CLOEXEC) = 3
    openat(AT_FDCWD, "/home/bork/work/mess-with-dns/frontend/blah.js", O_RDONLY|O_CLOEXEC) = 3
    openat(AT_FDCWD, "/home/bork/work/mess-with-dns/frontend/node_modules/vue/package.json", O_RDONLY|O_CLOEXEC) = 3
    openat(AT_FDCWD, "/home/bork/work/mess-with-dns/frontend/node_modules/vue/dist/vue.runtime.esm.js", O_RDONLY|O_CLOEXEC) = 3

```

It looks like it just opens `package.json` and `vue.runtime.esm.js`. `package.json` has this `main` key, which must be what’s directing esbuild to load `vue.runtime.esm.js`. I guess that’s part of the ES6 modules spec or something.

```

      "main": "dist/vue.runtime.common.js",

```

### importing the template compiler version of Vue fixed everything

Importing the version of Vue with the template compiler was very simple in the end, I just needed to do

```

    import Vue from 'vue/dist/vue.esm.js'

```

instead of

```

    import Vue from 'vue'

```

and then `esbuild` worked! Hooray! Now I can just put that `esbuild` incantation in a bash script which is how I run all my builds for tiny projects like this.

### `npm install` gives you all the build artifacts

This is a simple thing but I didn’t really understand it before – it seems like `npm install vue`:

  1. the package maintainer runs `npm run build` at some point and then publishes the package to the NPM registry
  2. `npm install` downloads the Vue source into `node_modules`, as well as the build artifacts



I think that’s right?

`npm run build` can run any arbitrary program, but the convention seems to be for it to create build artifacts that end up in `node_modules/vue/dist`. Maybe the `dist` folder is standardized by npm somehow? I’m not sure.

### not every NPM package has a `dist/` directory

There’s a cool NPM package called [friendly-words][7] from Glitch. If I run `npm install friendly-words`, it doesn’t have a `dist/` directory.

It was explained to me that this is because this a package intended to be run on the _backend_, so it doesn’t package itself into a single Javascript file build artifact in the same way. Instead it just loads files from disk at runtime – this is basically what it does:

```

    $ cat node_modules/friendly-words/index.js
    const data = require('./generated/words.json');

    exports.objects = data.objects;
    exports.predicates = data.predicates;
    exports.teams = data.teams;
    exports.collections = data.collections;

```

### people seem to prefer `import` over `require` for frontend code

Here’s what I’ve understood about `import` vs `require` so far:

  * there are two ways to use `import` / `require`, you can do a build step to collapse all the imports and put everything into one file (which is what I’m doing), or you can do the imports/requires at runtime
  * browsers can’t do `require` at runtime, only `import`. This is because `require` loads the code synchronously
  * there are 2 standards (CommonJS and ES6 modules), and that `require` is CommonJS and `import` is ES6 modules.
  * `import` seems to be a lot more restricted than `require` in general (which is good)



I think this means that I should use `import` and not `require` in my frontend code.

### it’s exciting to be able to do imports

I’m pretty excited to be able to do imports in a way that I actually almost understand for the first time. I don’t think it’s going to make _that_ big of a difference to my projects (they’re still very small!).

I don’t understand everything `esbuild` is doing, but it feels a lot more approachable and transparent than the Webpack-based tools that I’ve used previously.

The other thing I like about `esbuild` is that it’s a static Go binary, so I feel more confident that I’ll be able to get it to work in the future than with tool written in Javascript, just because I understand the Javascript ecosystem so poorly. And it’s super fast, which is great.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/11/15/esbuild-vue/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://nginx-playground.wizardzines.com/
[2]: https://sql-playground.wizardzines.com/
[3]: https://dns-lookup.jvns.ca/
[4]: https://github.com/jvns/dns-lookup/tree/main/site
[5]: https://esbuild.github.io/
[6]: https://github.com/vuejs/vue-cli/blob/e76a7a893c173209be8e800c4de357556d01dc67/packages/%40vue/cli-service/lib/config/base.js#L69-L71
[7]: https://github.com/glitchdotcom/friendly-words
