Getting Started with HTTP/2: Part 2
============================================================
 ![](https://static.viget.com/_284x284_crop_center-center/ben-t-http-blog-thumb-01_360.png?mtime=20160928234634) 

Firmly planting a flag in the sand for HTTP/2 best practices for front end development.


If you have been keeping up with the talk of HTTP/2, you have probably attempted it or at least thought of how incorporate it into your projects. While there are a lot of hypotheses on how to its features can change your workflow and improve speed and efficiency on the web, best practices still haven't quite been pinned down yet. What I want to cover in this post are some HTTP/2 best practices I have discovered on a recent project.

If you aren't quite sure what HTTP/2 is or why it offers to improve your work, [check out my first post for a bit of background][4]. 

One note though: before we can get going, I need to mention that while your browser probably supports HTTP/2, your server probably doesn't. Check in with your hosting service to see if they offer HTTP/2 compatibility. Otherwise, you may be able to spin up your own server. This post does not cover how to do that unfortunately, but you can always check out the [http2 github][5] for some tools to get going in that direction.

### 🙏 [Rubs Hands Together]

A good way to start is to first organize your files. Take a look at the file tree below for a starting point to organize your stylesheets:

```
`/styles
|── /setup
|     /* variables, mixins and functions */
|── /global
|     /* reusable components that could be within any component or section */
|── /components
|     /* specific components and sections */
|── setup.scss // index for setup styles
|── global.scss // index for global styles`
```

This breaks out your styles into three main categories: Setup, Global and Components. I will get into what each of these directories offer to your project next.

### Setting Up

The Setup level directory will hold all of your variables, functions, mixins and any other definition that another file will need to compile properly. To make this directory fully reusable, it's a good idea to import the contents of this directory into `setup.scss` so that it looks something like this:

```
`/* setup.scss */

/* variables */
@import "setup/variables/colors";

/* mixins */
@import "setup/mixins/color";

/* functions */
@import "setup/functions/color";

... etc`
```

Now that we have a quick reference to any definition on the site, we should be sure to include it at the top of any style file we create from here on out.

### Going Global

Your next directory, Global, should contain components that can be reused across the site within multiple sections, or on every single page. Things like buttons, text and heading styles as well as your browser resets should go here. I do not recommend putting your header or footer styles in here because on some projects, the header is absent or different on certain pages. Furthermore, the footer is always the last element on the page, so it should not be a huge priority to load the styles for it before the user has loaded anything else on the site.

Keeping in mind that your Global styles probably won't work without the things we defined in the Setup directory, your Global file should look something like this:

```
`/* global.scss */

/* application definitions */
@import "setup";

/* global styles */
@import "global/reset";
@import "global/buttons";
@import "global/typography";
@import "global/grid";

... etc`
```

Note that the first thing to import is the Setup styles. This way, any following file that uses something defined in that will have a reference to pull from.

Since the Global styles will be needed on every page of the site, we can load them in the typical way, using a `<link>` in the `<head>`. What you will have will be a very light CSS file, or theoretically light, depending on how much global style you need.

### Finally, Your Components

Notice that I did not include an index file for the Components directory in the file tree above. This is really where HTTP/2 comes into play. Up until now, we have been following standard practices for typical site build out, maintaining a fairly lean infrastructure and opting to globalize only the most necessary styles. Components act as their own index files.

Most developers have their own way of organizing their components, so I am not going to bother going into strategies here. However, all of your components should look something like this:

```
`/* header.scss */

/* application definitions */
@import "../setup";

header {
  // styles
}

... etc`
```

This way, again, you have those Setup styles there to make sure that everything is defined during compilation. You don't have to concatenate, minify or really do anything to these files other than compile them, and probably place them in an /assets directory, easy to find for your templates.

Now that our stylesheets are ready to go, building out the site should be simple.

### Building Out the Components

You probably have your own templating language of choice depending on the projects you are on, be it Twig, Rails, Jade or Handlebars. I think the best way to think about your components is that if it has its own template file, it should have a corresponding style with the same name. This way your project has a nice 1:1 ratio across your templates and styles and you know where which file everything is in because they are named accordingly.

Now that that is out of the way, taking advantage of HTTP/2's multiplexing is really simple, so let's build a template:

```
`{# header.html #}

{# compiled header styles #}
<link href="assets/components/header.css" rel="stylesheet" media="all">

<header>
  <h1>This Awesome HTTP/2 Site</h1>
  ... etc`
```

And that is pretty much it! You probably have a less heavy-handed way of linking to assets within your templates, but this shows you that all you need to do is link to that one small header style in the template file before you start your markup. This allows your site to only load the specific assets to the components on any given page, and furthermore, prioritizing the components from the top of your page to the bottom.

### Mixing It All Together

Now that all the components have a structure, the browser will render them something like this:

```
`<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" media="all" href="/assets/global.css">
  </head>
  <body>

    <link rel="stylesheet" media="all" href="/assets/components/header.css">
    <header>
      ... etc
    </header>

    <link rel="stylesheet" media="all" href="/assets/components/title.css">
    <section class="title">
      ... etc
    </section>

    <link rel="stylesheet" media="all" href="/assets/components/image-component.css">
    <section class="image-component">
      ... etc
    </section>

    <link rel="stylesheet" media="all" href="/assets/components/text-component.css">
    <section class="text-component">
      ... etc
    </section>

    <link rel="stylesheet" media="all" href="/assets/components/footer.css">
    <footer>
      ... etc
    </footer>

  </body>
</html>`
```

This is an upper level approach, but you will probably have finer-tuned components on your project. For example, you may have a `<nav>` component within the header that has its own stylesheet to load. Feel free to go as deep as you want with your components in a way that makes sense - HTTP/2 will not penalize you with those extra requests!

### Conclusion

This is just a basic look at how to build a project with HTTP/2 in mind on the front end, but this only scratches the surface. Perhaps you noticed a method I used that can be improved upon. Please bring it up in the comments! As stated in my first post, HTTP/2 is probably going to undo some of the standards we have held since HTTP/1, so it will take some serious thinking and experimenting to move into a fully efficient world of HTTP/2 development.

--------------------------------------------------------------------------------

via: https://www.viget.com/articles/getting-started-with-http-2-part-2

作者：[Ben][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.viget.com/about/team/btinsley
[1]:https://twitter.com/home?status=Firmly%20planting%20a%20flag%20in%20the%20sand%20for%20HTTP%2F2%20best%20practices%20for%20front%20end%20development.%20https%3A%2F%2Fwww.viget.com%2Farticles%2Fgetting-started-with-http-2-part-2
[2]:https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.viget.com%2Farticles%2Fgetting-started-with-http-2-part-2
[3]:http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.viget.com%2Farticles%2Fgetting-started-with-http-2-part-2
[4]:https://www.viget.com/articles/getting-started-with-http-2-part-1
[5]:https://github.com/http2/http2-spec/wiki/Tools
