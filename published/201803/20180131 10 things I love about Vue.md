我喜欢 Vue 的 10 个方面
============================================================

![](https://cdn-images-1.medium.com/max/1600/1*X4ipeKVYzmY2M3UPYgUYuA.png)

我喜欢 Vue。当我在 2016 年第一次接触它时，也许那时我已经对 JavaScript 框架感到疲劳了，因为我已经具有Backbone、Angular、React 等框架的经验，没有太多的热情去尝试一个新的框架。直到我在 Hacker News 上读到一份评论，其描述 Vue 是类似于“新 jQuery” 的 JavaScript 框架，从而激发了我的好奇心。在那之前，我已经相当满意 React 这个框架，它是一个很好的框架，建立于可靠的设计原则之上，围绕着视图模板、虚拟 DOM 和状态响应等技术。而 Vue 也提供了这些重要的内容。

在这篇文章中，我旨在解释为什么 Vue 适合我，为什么在上文中那些我尝试过的框架中选择它。也许你将同意我的一些观点，但至少我希望能够给大家使用 Vue 开发现代 JavaScript 应用一些灵感。

### 1、 极少的模板语法

Vue 默认提供的视图模板语法是极小的、简洁的和可扩展的。像其他 Vue 部分一样，可以很简单的使用类似 JSX 一样语法，而不使用标准的模板语法（甚至有官方文档说明了如何做），但是我觉得没必要这么做。JSX 有好的方面，也有一些有依据的批评，如混淆了 JavaScript 和 HTML，使得很容易导致在模板中出现复杂的代码，而本来应该分开写在不同的地方的。

Vue 没有使用标准的 HTML 来编写视图模板，而是使用极少的模板语法来处理简单的事情，如基于视图数据迭代创建元素。

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


我也喜欢 Vue 提供的简短绑定语法，`:` 用于在模板中绑定数据变量，`@` 用于绑定事件。这是一个细节，但写起来很爽而且能够让你的组件代码简洁。

### 2、 单文件组件

大多数人使用 Vue，都使用“单文件组件”。本质上就是一个 .vue 文件对应一个组件，其中包含三部分（CSS、HTML和JavaScript）。

这种技术结合是对的。它让人很容易在一个单独的地方了解每个组件，同时也非常好的鼓励了大家保持每个组件代码的简短。如果你的组件中 JavaScript、CSS 和 HTML 代码占了很多行，那么就到了进一步模块化的时刻了。

在使用 Vue 组件中的 `<style>` 标签时，我们可以添加 `scoped` 属性。这会让整个样式完全的封装到当前组件，意思是在组件中如果我们写了 `.name` 的 css 选择器，它不会把样式应用到其他组件中。我非常喜欢这种方式来应用样式而不是像其他主要框架流行在 JS 中编写 CSS 的方式。

关于单文件组件另一个好处是 .vue 文件实际上是一个有效的 HTML 5 文件。`<template>`、 `<script>`、 `<style>` 都是 w3c 官方规范的标签。这就表示很多如 linters （LCTT 译注：一种代码检查工具插件）这样我们用于开发过程中的工具能够开箱即用或者添加一些适配后使用。

### 3、 Vue “新的 jQuery”

事实上，这两个库不相似而且用于做不同的事。让我提供给你一个很精辟的类比（我实际上非常喜欢描述 Vue 和 jQuery 之间的关系）：披头士乐队和齐柏林飞船乐队（LCTT 译注：两个都是英国著名的乐队）。披头士乐队不需要介绍，他们是 20 世纪 60 年代最大的和最有影响力的乐队。但很难说披头士乐队是 20 世纪 70 年代最大的乐队，因为有时这个荣耀属于是齐柏林飞船乐队。你可以说两个乐队之间有着微妙的音乐联系或者说他们的音乐是明显不同的，但两者一些先前的艺术和影响力是不可否认的。也许 21 世纪初 JavaScript 的世界就像 20 世纪 70 年代的音乐世界一样，随着 Vue 获得更多关注使用，只会吸引更多粉丝。

一些使 jQuery 牛逼的哲学理念在 Vue 中也有呈现：非常容易的学习曲线但却具有基于现代 web 标准构建牛逼 web 应用所有你需要的功能。Vue 的核心本质上就是在 JavaScript 对象上包装了一层。

### 4、 极易扩展

正如前述，Vue 默认使用标准的 HTML、JS 和 CSS 构建组件，但可以很容易插入其他技术。如果我们想使用pug（LCTT译注：一款功能丰富的模板引擎，专门为 Node.js 平台开发）替换 HTML 或者使用 Typescript（LCTT译注：一种由微软开发的编程语言，是 JavaScript 的一个超集）替换 js 或者 Sass （LCTT 译注：一种 CSS 扩展语言）替换 CSS，只需要安装相关的 node 模块和在我们的单文件组件中添加一个属性到相关的标签即可。你甚至可以在一个项目中混合搭配使用 —— 如一些组件使用 HTML 其他使用 pug ——然而我不太确定这么做是最好的做法。

### 5、 虚拟 DOM

虚拟 DOM 是很好的技术，被用于现如今很多框架。其意味着这些框架能够做到根据我们状态的改变来高效的完成 DOM 更新，减少重新渲染，从而优化我们应用的性能。现如今每个框架都有虚拟 DOM 技术，所以虽然它不是什么独特的东西，但它仍然很出色。

### 6、 Vuex 很棒

对于大多数应用，管理状态成为一个棘手的问题，单独使用一个视图库不能解决这个问题。Vue 使用 Vuex 库来解决这个问题。Vuex 很容易构建而且和 Vue 集成的很好。熟悉 redux（另一个管理状态的库）的人学习 Vuex 会觉得轻车熟路，但是我发现 Vue 和 Vuex 集成起来更加简洁。最新 JavaScript 草案中（LCTT 译注：应该是指 ES7）提供了对象展开运算符（LCTT 译注：符号为 `...`），允许我们在状态或函数中进行合并，以操纵从 Vuex 到需要它的 Vue 组件中的状态。

### 7、 Vue 的命令行界面（CLI）

Vue 提供的命令行界面非常不错，很容易用 Vue 搭建一个基于 Webpack（LCTT 译注：一个前端资源加载/打包工具）的项目。单文件组件支持、babel（LCTT 译注：js 语法转换器）、linting（LCTT译注：代码检查工具）、测试工具支持，以及合理的项目结构，都可以在终端中一行命令创建。

然而有一个命令，我在 CLI 中没有找到，那就是 `vue build`。

> 如： 
> ```
echo '<template><h1>Hello World!</h1></template>' > Hello.vue && vue build Hello.vue -o
```

`vue build` 命令构建和运行组件并在浏览器中测试看起来非常简单。很不幸这个命令后来在 Vue 中删除了，现在推荐使用 Poi。Poi 本质上是在 Webpack 工具上封装了一层，但我不认我它像推特上说的那样简单。

### 8、 重新渲染优化

使用 Vue，你不必手动声明 DOM 的哪部分应该被重新渲染。我从来都不喜欢操纵 React 组件的渲染，像在`shouldComponentUpdate` 方法中停止整个 DOM 树重新渲染这种。Vue 在这方面非常巧妙。

### 9、 容易获得帮助

Vue 已经达到了使用这个框架来构建各种各样的应用的一种群聚效应。开发文档非常完善。如果你需要进一步的帮助，有多种渠道可用，每个渠道都有很多活跃开发者：stackoverflow、discord、twitter 等。相对于其他用户量少的框架，这就应该给你更多的信心来使用Vue构建应用。

### 10、 多机构维护

我认为，一个开源库，在发展方向方面的投票权利没有被单一机构操纵过多，是一个好事。就如同 React 的许可证问题（现已解决），Vue 就不可能涉及到。

总之，作为你接下来要开发的任何 JavaScript 项目，我认为 Vue 都是一个极好的选择。Vue 可用的生态圈比我博客中涉及到的其他库都要大。如果想要更全面的产品，你可以关注 Nuxt.js。如果你需要一些可重复使用的样式组件你可以关注类似 Vuetify 的库。

Vue 是 2017 年增长最快的库之一，我预测在 2018 年增长速度不会放缓。

如果你有空闲的 30 分钟，为什么不尝试下 Vue，看它可以给你提供什么呢？

P.S. — 这篇文档很好的展示了 Vue 和其他框架的比较：[https://vuejs.org/v2/guide/comparison.html][1]


--------------------------------------------------------------------------------

via: https://medium.com/@dalaidunc/10-things-i-love-about-vue-505886ddaff2

作者：[Duncan Grant][a]
译者：[yizhuoyan](https://github.com/yizhuoyan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@dalaidunc
[1]:https://vuejs.org/v2/guide/comparison.html
