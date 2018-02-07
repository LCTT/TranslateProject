10 things I love about Vue
============================================================

![](https://cdn-images-1.medium.com/max/1600/1*X4ipeKVYzmY2M3UPYgUYuA.png)

I love Vue. When I first looked at it in 2016, perhaps I was coming from a perspective of JavaScript framework fatigue. I’d already had experience with Backbone, Angular, React, among others and I wasn’t overly enthusiastic to try a new framework. It wasn’t until I read a comment on hacker news describing Vue as the ‘new jquery’ of JavaScript, that my curiosity was piqued. Until that point, I had been relatively content with React — it is a good framework based on solid design principles centred around view templates, virtual DOM and reacting to state, and Vue also provides these great things. In this blog post, I aim to explore why Vue is the framework for me. I choose it above any other that I have tried. Perhaps you will agree with some of my points, but at the very least I hope to give you some insight into what it is like to develop modern JavaScript applications with Vue.

1\. Minimal Template Syntax

The template syntax which you are given by default from Vue is minimal, succinct and extendable. Like many parts of Vue, it’s easy to not use the standard template syntax and instead use something like JSX (there is even an official page of documentation about how to do this), but I don’t know why you would want to do that to be honest. For all that is good about JSX, there are some valid criticisms: by blurring the line between JavaScript and HTML, it makes it a bit too easy to start writing complex code in your template which should instead be separated out and written elsewhere in your JavaScript view code.

Vue instead uses standard HTML to write your templates, with a minimal template syntax for simple things such as iteratively creating elements based on the view data.

```
<template>
  <div id="app">
    <ul>
      <li v-for='number in numbers' :key='number'>{{ number }}</li>
    </ul>
    <form @submit.prevent='addNumber'>
      <input type='text' v-model='newNumber'>
      <button type='submit'>Add another number</button>
    </form>
  </div>
</template>

<script>
export default {
  name: 'app',
  methods: {
    addNumber() {
      const num = +this.newNumber;
      if (typeof num === 'number' && !isNaN(num)) {
        this.numbers.push(num);
      }
    }
  },
  data() {
    return {
      newNumber: null,
      numbers: [1, 23, 52, 46]
    };
  }
}
</script>

<style lang="scss">
ul {
  padding: 0;
  li {
    list-style-type: none;
    color: blue;
  }
}
</style>
```


I also like the short-bindings provided by Vue, ‘:’ for binding data variables into your template and ‘@’ for binding to events. It’s a small thing, but it feels nice to type and keeps your components succinct.

2\. Single File Components

When most people write Vue, they do so using ‘single file components’. Essentially it is a file with the suffix .vue containing up to 3 parts (the css, html and javascript) for each component.

This coupling of technologies feels right. It makes it easy to understand each component in a single place. It also has the nice side effect of encouraging you to keep your code short for each component. If the JavaScript, CSS and HTML for your component is taking up too many lines then it might be time to modularise further.

When it comes to the <style> tag of a Vue component, we can add the ‘scoped’ attribute. This will fully encapsulate the styling to this component. Meaning if we had a .name CSS selector defined in this component, it won’t apply that style in any other component. I much prefer this approach of styling view components to the approaches of writing CSS in JS which seems popular in other leading frameworks.

Another very nice thing about single file components is that they are actually valid HTML5 files. <template>, <script>, <style> are all part of the official w3c specification. This means that many tools you use as part of your development process (such as linters) can work out of the box or with minimal adaptation.

3\. Vue as the new jQuery

Really these two libraries are not similar and are doing different things. Let me provide you with a terrible analogy that I am actually quite fond of to describe the relationship of Vue and jQuery: The Beatles and Led Zeppelin. The Beatles need no introduction, they were the biggest group of the 1960s and were supremely influential. It gets harder to pin the accolade of ‘biggest group of the 1970s’ but sometimes that goes to Led Zeppelin. You could say that the musical relationship between the Beatles and Led Zeppelin is tenuous and their music is distinctively different, but there is some prior art and influence to accept. Maybe 2010s JavaScript world is like the 1970s music world and as Vue gets more radio plays, it will only attract more fans.

Some of the philosophy that made jQuery so great is also present in Vue: a really easy learning curve but with all the power you need to build great web applications based on modern web standards. At its core, Vue is really just a wrapper around JavaScript objects.

4\. Easily extensible

As mentioned, Vue uses standard HTML, JS and CSS to build its components as a default, but it is really easy to plug in other technologies. If we want to use pug instead of HTML or typescript instead of JS or sass instead of CSS, it’s just a matter of installing the relevant node modules and adding an attribute to the relevant section of our single file component. You could even mix and match components within a project — e.g. some components using HTML and others using pug — although I’m not sure doing this is the best practice.

5\. Virtual DOM

The virtual DOM is used in many frameworks these days and it is great. It means the framework can work out what has changed in our state and then efficiently apply DOM updates, minimizing re-rendering and optimising the performance of our application. Everyone and their mother has a Virtual DOM these days, so whilst it’s not something unique, it’s still very cool.

6\. Vuex is great

For most applications, managing state becomes a tricky issue which using a view library alone can not solve. Vue’s solution to this is the vuex library. It’s easy to setup and integrates very well with vue. Those familiar with redux will be at home here, but I find that the integration between vue and vuex is neater and more minimal than that of react and redux. Soon-to-be-standard JavaScript provides the object spread operator which allows us to merge in state or functions to manipulate state from vuex into the components that need it.

7\. Vue CLI

The CLI provided by Vue is really great and makes it easy to get started with a webpack project with Vue. Single file components support, babel, linting, testing and a sensible project structure can all be created with a single command in your terminal.

There is one thing, however I miss from the CLI and that is the ‘vue build’.

```
try this: `echo '<template><h1>Hello World!</h1></template>' > Hello.vue && vue build Hello.vue -o`
```

It looked so simple to build and run components and test them in the browser. Unfortunately this command was later removed from vue, instead the recommendation is to now use poi. Poi is basically a wrapper around webpack, but I don’t think it quite gets to the same point of simplicity as the quoted tweet.

8\. Re-rendering optimizations worked out for you

In Vue, you don’t have to manually state which parts of the DOM should be re-rendered. I never was a fan of the management on react components, such as ‘shouldComponentUpdate’ in order to stop the whole DOM tree re-rendering. Vue is smart about this.

9\. Easy to get help

Vue has reached a critical mass of developers using the framework to build a wide variety of applications. The documentation is very good. Should you need further help, there are multiple channels available with many active users: stackoverflow, discord, twitter etc. — this should give you some more confidence in building an application over some other frameworks with less users.

10\. Not maintained by a single corporation

I think it’s a good thing for an open source library to not have the voting rights of its direction steered too much by a single corporation. Issues such as the react licensing issue (now resolved) are not something Vue has had to deal with.

In summary, I think Vue is an excellent choice for whatever JavaScript project you might be starting next. The available ecosystem is larger than I covered in this blog post. For a more full-stack offering you could look at Nuxt.js. And if you want some re-usable styled components you could look at something like Vuetify. Vue has been one of the fastest growing frameworks of 2017 and I predict the growth is not going to slow down for 2018\. If you have a spare 30 minutes, why not dip your toes in and see what Vue has to offer for yourself?

P.S. — The documentation gives you a great comparison to other frameworks here: [https://vuejs.org/v2/guide/comparison.html][1]

--------------------------------------------------------------------------------

via: https://medium.com/@dalaidunc/10-things-i-love-about-vue-505886ddaff2

作者：[Duncan Grant ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@dalaidunc
[1]:https://vuejs.org/v2/guide/comparison.html