[#]: collector: "lujun9972"
[#]: translator: "amwps290"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13087-1.html"
[#]: subject: "Learn JavaScript by writing a guessing game"
[#]: via: "https://opensource.com/article/21/1/learn-javascript"
[#]: author: "Mandy Kendall https://opensource.com/users/mkendall"

通过编写一个简单的游戏学习 JavaScript
======

> 通过使用一个简单的游戏来练习一些基本的 JavaScript 概念，迈出创建交互性动态 Web 内容的第一步。

![](https://img.linux.net.cn/data/attachment/album/202102/05/151531z6fzqx8vk8tdan81.jpg)

可以肯定地说，没有 [JavaScript][2]，大多数现代 Web 都将不存在。它是三种标准 Web 技术（以及 HTML 和 CSS ）之一，它使任何人都可以创建我们在万维网体验中所期待的交互式、动态内容。从 [React][3] 这样的框架到 [D3][4] 这样的数据可视化库，很难想象没有它的 Web。

现在有很多东西要学习，开始学习这种流行语言的好方法是编写一个简单的应用程序以熟悉某些概念。 最近，一些人写了关于如何通过编写简单的猜谜游戏来学习自己喜欢的语言的文章，因此这是一个很好的起点！

### 现在开始吧

JavaScript 有许多种风格，但我将从最基本的开始，通常称为 “普通 JavaScript”。 JavaScript 主要是一种客户端脚本语言，因此它可以在任何标准浏览器中运行，而无需安装任何程序。你只需要一个代码编辑器（[Brackets][5] 就是一个不错的选择）和一个 Web 浏览器。

### HTML 用户界面

JavaScript 在 Web 浏览器中运行，并与其他标准 Web 技术 HTML 和 CSS 交互。要创建此游戏，你首先需要使用 HTML（超文本标记语言）来创建供玩家使用的简单界面。如果你不清楚，HTML 是一种标记语言，用于为 Web 内容提供结构。

首先，先创建一个 HTML 文件。该文件应具有 `.html` 扩展名，以使浏览器知道它是 HTML 文档。你可以将文件命名为 `guessingGame.html`。

在此文件中使用一些基本的 HTML 标签来显示游戏的标题、玩法说明，供玩家用来输入和提交其猜测的交互式元素以及用于向玩家提供反馈的占位符：

```
<!DOCTYPE>
  <html>
    <head>
      <meta charset="UTF-8" />
      <title> JavaScript Guessing Game </title>
    </head>
    <body>
      <h1>Guess the Number!</h1>
      <p>I am thinking of a number between 1 and 100. Can you guess what it is?</p>
   
      <label for="guess">My Guess</label>
      <input type="number" id="guess">
      <input type="submit" id="submitGuess" value="Check My Guess">
   
      <p id="feedback"></p>
    </body>
  </html>
```

`<h1>` 和 `<p>` 元素使浏览器知道在页面上显示什么类型的文本。标签对 `<h1></h1>` 表示标签之间的文本（`Guess the Number!`）是标题。后面的一组 `<p>` 标签表示带有说明的短文本是一个段落。此代码块末尾的空 `<p>` 标签用作占位符，用于根据用户的输入提供一些反馈。

### `<script>` 标签

在网页中包含 JavaScript 的方法有很多种，但是对于像这样的简短脚本，可以使用一组 `<script>` 标签并将 JavaScript 直接写在 HTML 文件中。 这些 `<script>` 标签应位于 HTML 文件末尾附近的 `</body>` 标签之前。

现在，你可以开始在这两个脚本标签之间编写 JavaScript。 最终文件如下所示：

```
<!DOCTYPE>
<html>

<head>
  <meta charset="UTF-8" />
  <title> JavaScript Guessing Game </title>
</head>

<body>
  <h1>Guess the Number!</h1>
  <p>I am thinking of a number between 1 and 100. Can you guess what it is?</p>

  <form>
    <label for="guess">My Guess</label>
    <input type="number" id="guess">
    <input type="submit" id="submitGuess" value="Check My Guess">
  </form>

  <p id="feedback"></p>

  <script>
    const randomNumber = Math.floor(Math.random() * 100) + 1
    console.log('Random Number', randomNumber)

    function checkGuess() {
      let myGuess = guess.value
      if (myGuess === randomNumber) {
        feedback.textContent = "You got it right!"
      } else if (myGuess > randomNumber) {
        feedback.textContent = "Your guess was " + myGuess + ". That's too high. Try Again!"
      } else if (myGuess < randomNumber) {
       feedback.textContent = "Your guess was " + myGuess + ". That's too low. Try Again!"
     }
   }
   submitGuess.addEventListener('click', checkGuess)
 </script>

</body>

</html>
```

要在浏览器中运行此文件，请双击文件或打开你喜欢的浏览器,点击菜单，然后选择**文件->打开文件**。（如果使用 Brackets 软件，也可以使用角落处的闪电图标在浏览器中打开文件）。

### 生成伪随机数

猜谜游戏的第一步是为玩家生成一个数字供玩家猜测。JavaScript 包含几个内置的全局对象，可帮助你编写代码。要生成随机数，请使用 `Math` 对象。

JavaScript中的 [Math][17] 具有处理和数学相关的属性和功能。你将使用两个数学函数来生成随机数，供你的玩家猜测。

[Math.random()][18]，会将生成一个介于 0 和 1 之间的伪随机数。（`Math.random` 包含 0 但不包含 1。这意味着该函数可以生成 0 ，永远不会产生 1）

对于此游戏，请将随机数设置在 1 到 100 之间以缩小玩家的选择范围。取刚刚生成的小数，然后乘以 100，以产生一个介于 0 到……甚至不是 100 之间的小数。至此，你将需要其他步骤来解决这个问题。

现在，你的数字仍然是小数，但你希望它是一个整数。为此，你可以使用属于 `Math` 对象的另一个函数 [Math.floor()][19]。`Math.floor()` 的目的是返回小于或等于你作为参数指定的数字的最大整数，这意味着它会四舍五入为最接近的整数：

```
Math.floor(Math.random() * 100)
```

这样你将得到 0 到 99 之间的整数，这不是你想要的范围。你可以在最后一步修复该问题，即在结果中加 1。瞧！现在，你有一个（有点）随机生成的数字，介于 1 到 100 之间：

```
Math.floor(Math.random() * 100) + 1
```

### 变量

现在，你需要存储随机生成的数字，以便可以将其与玩家的猜测进行比较。为此，你可以将其存储到一个 **变量**。

JavaScript 具有不同类型的变量，你可以选择这些类型，具体取决于你要如何使用该变量。对于此游戏，请使用 `const` 和 `let`。

  * `let` 用于指示变量在整个程序中可以改变。
  * `const` 用于指示变量不应该被修改。

`const` 和 `let` 还有很多要说的，但现在知道这些就足够了。

随机数在游戏中仅生成一次，因此你将使用 `const` 变量来保存该值。你想给变量起一个清楚地表明要存储什么值的名称，因此将其命名为 `randomNumber`：

```
const randomNumber
```

有关命名的注意事项：JavaScript 中的变量和函数名称以驼峰形式编写。如果只有一个单词，则全部以小写形式书写。如果有多个单词，则第一个单词均为小写，其他任何单词均以大写字母开头，且单词之间没有空格。

### 打印到控制台

通常，你不想向任何人显示随机数，但是开发人员可能想知道生成的数字以使用它来帮助调试代码。 使用 JavaScript，你可以使用另一个内置函数 [console.log()][20] 将数字输出到浏览器的控制台。

大多数浏览器都包含开发人员工具，你可以通过按键盘上的 `F12` 键来打开它们。从那里，你应该看到一个 **控制台** 标签。打印到控制台的所有信息都将显示在此处。由于到目前为止编写的代码将在浏览器加载后立即运行，因此，如果你查看控制台，你应该会看到刚刚生成的随机数！

![Javascript game with console][21]

### 函数

接下来，你需要一种方法来从数字输入字段中获得玩家的猜测，将其与你刚刚生成的随机数进行比较，并向玩家提供反馈，让他们知道他们是否正确猜到了。为此，编写一个函数。 **函数** 是执行一定任务的代码块。函数是可以重用的，这意味着如果你需要多次运行相同的代码，则可以调用函数，而不必重写执行任务所需的所有步骤。

根据你使用的 JavaScript 版本，有许多不同的方法来编写或声明函数。由于这是该语言的基础入门，因此请使用基本函数语法声明函数。

以关键字 `function` 开头，然后起一个函数名。好的做法是使用一个描述该函数的功能的名称。在这个例子中，你正在检查玩家的猜测的数，因此此函数的名字可以是 `checkGuess`。在函数名称之后，写上一组小括号，然后写上一组花括号。 你将在以下花括号之间编写函数的主体：

```
function checkGuess() {}
```

### 使用 DOM

JavaScript 的目的之一是与网页上的 HTML 交互。它通过文档对象模型（DOM）进行此操作，DOM 是 JavaScript 用于访问和更改网页信息的对象。现在，你需要从 HTML 中获取数字输入字段中玩家的猜测。你可以使用分配给 HTML 元素的 `id` 属性（在这种情况下为 `guess`）来做到这一点：

```
<input type="number" id="guess">
```

JavaScript 可以通过访问玩家输入到数字输入字段中的数来获取其值。你可以通过引用元素的 ID 并在末尾添加 `.value` 来实现。这次，使用 `let` 定义的变量来保存用户的猜测值：

```
let myGuess = guess.value
```

玩家在数字输入字段中输入的任何数字都将被分配给 `checkGuess` 函数中的 `myGuess` 变量。

### 条件语句

下一步是将玩家的猜测与游戏产生的随机数进行比较。你还想给玩家反馈，让他们知道他们的猜测是太高，太低还是正确。

你可以使用一系列条件语句来决定玩家将收到的反馈。**条件语句** 在运行代码块之前检查是否满足条件。如果不满足条件，则代码停止，继续检查下一个条件，或者继续执行其余代码，而无需执行条件块中的代码：

```
if (myGuess === randomNumber){
  feedback.textContent = "You got it right!"
}
else if(myGuess > randomNumber) {
  feedback.textContent = "Your guess was " + myGuess + ". That's too high. Try Again!"
}
else if(myGuess < randomNumber) {
  feedback.textContent = "Your guess was " + myGuess + ". That's too low. Try Again!"
}
```

第一个条件块使用比较运算符 `===` 将玩家的猜测与游戏生成的随机数进行比较。比较运算符检查右侧的值，将其与左侧的值进行比较，如果匹配则返回布尔值 `true`，否则返回布尔值 `false`。

如果数字匹配（猜对了！），为了让玩家知道。通过将文本添加到具有 `id` 属性 `feedback` 的 `<p>` 标记中来操作 DOM。就像上面的 `guess.value` 一样，除了不是从 DOM 获取信息，而是更改其中的信息。`<p>` 元素没有像 `<input>` 元素那样的值，而是具有文本，因此请使用 `.textContent` 访问元素并设置要显示的文本：

```
feedback.textContent = "You got it right!"
```

当然，玩家很有可能在第一次尝试时就猜错了，因此，如果 `myGuess` 和 `randomNumber` 不匹配，请给玩家一个线索，以帮助他们缩小猜测范围。如果第一个条件失败，则代码将跳过该 `if` 语句中的代码块，并检查下一个条件是否为 `true`。 这使你进入 `else if` 块：

```
else if(myGuess > randomNumber) {
  feedback.textContent = "Your guess was " + myGuess + ". That's too high. Try Again!"
}
```

如果你将其作为句子阅读，则可能是这样的：“如果玩家的猜测等于随机数，请让他们知道他们猜对了。否则，请检查玩家的猜测是否大于 `randomNumber`，如果是，则显示玩家的猜测并告诉他们太高了。”

最后一种可能性是玩家的猜测低于随机数。 要检查这一点，再添加一个 `else if` 块：

```
else if(myGuess < randomNumber) {
  feedback.textContent = "Your guess was " + myGuess + ". That's too low. Try Again!"
}
```

### 用户事件和事件监听器

如果你看上面的代码，则会看到某些代码在页面加载时自动运行，但有些则不会。你想在玩游戏之前生成随机数，但是你不想在玩家将数字输入到数字输入字段并准备检查它之前检查其猜测。

生成随机数并将其打印到控制台的代码不在函数的范围内，因此它将在浏览器加载脚本时自动运行。 但是，要使函数内部的代码运行，你必须对其进行调用。

调用函数有几种方法。在此，你希望该函数在用户单击 “Check My Guess” 按钮时运行。单击按钮将创建一个用户事件，然后 JavaScript 可以 “监听” 这个事件，以便知道何时需要运行函数。

代码的最后一行将事件侦听器添加到按钮上，以在单击按钮时调用函数。当它“听到”该事件时，它将运行分配给事件侦听器的函数：

```
submitGuess.addEventListener('click', checkGuess)
```

就像访问 DOM 元素的其他实例一样，你可以使用按钮的 ID 告诉 JavaScript 与哪个元素进行交互。 然后，你可以使用内置的 `addEventListener` 函数来告诉 JavaScript 要监听的事件。

你已经看到了带有参数的函数，但花点时间看一下它是如何工作的。参数是函数执行其任务所需的信息。并非所有函数都需要参数，但是 `addEventListener` 函数需要两个参数。它采用的第一个参数是将为其监听的用户事件的名称。用户可以通过多种方式与 DOM 交互，例如键入、移动鼠标，键盘上的 `TAB` 键和粘贴文本。在这种情况下，你正在监听的用户事件是单击按钮，因此第一个参数将是 `click`。

`addEventListener`的第二个所需的信息是用户单击按钮时要运行的函数的名称。 这里我们需要 `checkGuess` 函数。

现在，当玩家按下 “Check My Guess” 按钮时，`checkGuess` 函数将获得他们在数字输入字段中输入的值，将其与随机数进行比较，并在浏览器中显示反馈，以使玩家知道他们猜的怎么样。 太棒了！你的游戏已准备就绪。

### 学习 JavaScript 以获取乐趣和收益

这一点点的平凡无奇的 JavaScript 只是这个庞大的生态系统所提供功能的一小部分。这是一种值得花时间投入学习的语言，我鼓励你继续挖掘并学习更多。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/learn-javascript

作者：[Mandy Kendall][a]
选题：[lujun9972][b]
译者：[amwps290](https://github.com/amwps290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkendall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_javascript.jpg?itok=60evKmGl "Javascript code close-up with neon graphic overlay"
[2]: https://opensource.com/tags/javascript
[3]: https://opensource.com/article/20/11/reactjs-tutorial
[4]: https://opensource.com/article/18/9/open-source-javascript-chart-libraries
[5]: https://opensource.com/article/20/12/brackets
[6]: http://december.com/html/4/element/html.html
[7]: http://december.com/html/4/element/head.html
[8]: http://december.com/html/4/element/meta.html
[9]: http://december.com/html/4/element/title.html
[10]: http://december.com/html/4/element/body.html
[11]: http://december.com/html/4/element/h1.html
[12]: http://december.com/html/4/element/p.html
[13]: http://december.com/html/4/element/label.html
[14]: http://december.com/html/4/element/input.html
[15]: http://december.com/html/4/element/form.html
[16]: http://december.com/html/4/element/script.html
[17]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math
[18]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random
[19]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor
[20]: https://developer.mozilla.org/en-US/docs/Web/API/Console/log
[21]: https://opensource.com/sites/default/files/javascript-game-with-console.png "Javascript game with console"
