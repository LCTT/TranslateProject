在 React 条件渲染中使用三元表达式和 “&&” 
=======

![](https://cdn-images-1.medium.com/max/2000/1*eASRJrCIVgsy5VbNMAzD9w.jpeg)

React 组件可以通过多种方式决定渲染内容。你可以使用传统的 `if` 语句或 `switch` 语句。在本文中，我们将探讨一些替代方案。但要注意，如果你不小心，有些方案会带来自己的陷阱。

### 三元表达式 vs if/else

假设我们有一个组件被传进来一个 `name` 属性。 如果这个字符串非空，我们会显示一个问候语。否则，我们会告诉用户他们需要登录。 

这是一个只实现了如上功能的无状态函数式组件（SFC）。

```
const MyComponent = ({ name }) => {
  if (name) {
    return (
      <div className="hello">
        Hello {name}
      </div>
    );
  }
  return (
    <div className="hello">
      Please sign in
    </div>
  );
};
```

这个很简单但是我们可以做得更好。这是使用<ruby>三元运算符<rt>conditional ternary operator</rt></ruby>编写的相同组件。

```
const MyComponent = ({ name }) => (
  <div className="hello">
    {name ? `Hello ${name}` : 'Please sign in'}
  </div>
);
```

请注意这段代码与上面的例子相比是多么简洁。

有几点需要注意。因为我们使用了箭头函数的单语句形式，所以隐含了`return` 语句。另外，使用三元运算符允许我们省略掉重复的 `<div className="hello">` 标记。

### 三元表达式 vs &&

正如您所看到的，三元表达式用于表达 `if`/`else` 条件式非常好。但是对于简单的 `if` 条件式怎么样呢？

让我们看另一个例子。如果 `isPro`（一个布尔值）为真，我们将显示一个奖杯表情符号。我们也要渲染星星的数量（如果不是 0）。我们可以这样写。

```
const MyComponent = ({ name, isPro, stars}) => (
  <div className="hello">
    <div>
      Hello {name}
      {isPro ? '♨' : null}
    </div>
    {stars ? (
      <div>
        Stars:{'☆'.repeat(stars)}
      </div>
    ) : null}
  </div>
);
```

请注意 `else` 条件返回 `null` 。 这是因为三元表达式要有“否则”条件。

对于简单的 `if` 条件式，我们可以使用更合适的东西：`&&` 运算符。这是使用 `&&` 编写的相同代码。

```
const MyComponent = ({ name, isPro, stars}) => (
  <div className="hello">
    <div>
      Hello {name}
      {isPro && '♨'}
    </div>
    {stars && (
      <div>
        Stars:{'☆'.repeat(stars)}
      </div>
    )}
  </div>
);
```

没有太多区别，但是注意我们消除了每个三元表达式最后面的 `: null` （`else` 条件式）。一切都应该像以前一样渲染。

嘿！约翰得到了什么？当什么都不应该渲染时，只有一个 `0`。这就是我上面提到的陷阱。这里有解释为什么：

[根据 MDN][3]，一个逻辑运算符“和”（也就是 `&&`）：

> `expr1 && expr2`

> 如果 `expr1` 可以被转换成 `false` ，返回 `expr1`；否则返回 `expr2`。 如此，当与布尔值一起使用时，如果两个操作数都是 `true`，`&&` 返回 `true` ；否则，返回 `false`。

好的，在你开始拔头发之前，让我为你解释它。

在我们这个例子里， `expr1` 是变量 `stars`，它的值是 `0`，因为 0 是假值，`0` 会被返回和渲染。看，这还不算太坏。

我会简单地这么写。

> 如果 `expr1` 是假值，返回 `expr1` ，否则返回 `expr2`。

所以，当对非布尔值使用 `&&` 时，我们必须让这个假值返回 React 无法渲染的东西，比如说，`false` 这个值。

我们可以通过几种方式实现这一目标。让我们试试吧。

```
{!!stars && (
  <div>
    {'☆'.repeat(stars)}
  </div>
)}
```

注意 `stars` 前的双感叹操作符（`!!`）（呃，其实没有双感叹操作符。我们只是用了感叹操作符两次）。

第一个感叹操作符会强迫 `stars` 的值变成布尔值并且进行一次“非”操作。如果 `stars` 是 `0` ，那么 `!stars` 会是 `true`。

然后我们执行第二个`非`操作，所以如果 `stars` 是 `0`，`!!stars` 会是 `false`。正好是我们想要的。

如果你不喜欢 `!!`，那么你也可以强制转换出一个布尔数比如这样（这种方式我觉得有点冗长）。

```
{Boolean(stars) && (
```

或者只是用比较符产生一个布尔值（有些人会说这样甚至更加语义化）。

```
{stars > 0 && (
```

#### 关于字符串

空字符串与数字有一样的毛病。但是因为渲染后的空字符串是不可见的，所以这不是那种你很可能会去处理的难题，甚至可能不会注意到它。然而，如果你是完美主义者并且不希望 DOM 上有空字符串，你应采取我们上面对数字采取的预防措施。

### 其它解决方案

一种可能的将来可扩展到其他变量的解决方案，是创建一个单独的 `shouldRenderStars` 变量。然后你用 `&&` 处理布尔值。

```
const shouldRenderStars = stars > 0;
```

```
return (
  <div>
    {shouldRenderStars && (
      <div>
        {'☆'.repeat(stars)}
      </div>
    )}
  </div>
);
```

之后，在将来，如果业务规则要求你还需要已登录，拥有一条狗以及喝淡啤酒，你可以改变 `shouldRenderStars` 的得出方式，而返回的内容保持不变。你还可以把这个逻辑放在其它可测试的地方，并且保持渲染明晰。

```
const shouldRenderStars = 
  stars > 0 && loggedIn && pet === 'dog' && beerPref === 'light`;
```

```
return (
  <div>
    {shouldRenderStars && (
      <div>
        {'☆'.repeat(stars)}
      </div>
    )}
  </div>
);
```

### 结论

我认为你应该充分利用这种语言。对于 JavaScript，这意味着为 `if/else` 条件式使用三元表达式，以及为 `if` 条件式使用 `&&` 操作符。

我们可以回到每处都使用三元运算符的舒适区，但你现在消化了这些知识和力量，可以继续前进 `&&` 取得成功了。

--------------------------------------------------------------------------------

作者简介：

美国运通工程博客的执行编辑 http://aexp.io 以及 @AmericanExpress 的工程总监。MyViews !== ThoseOfMyEmployer.

----------------

via: https://medium.freecodecamp.org/conditional-rendering-in-react-using-ternaries-and-logical-and-7807f53b6935

作者：[Donavon West][a]
译者：[GraveAccent](https://github.com/GraveAccent)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.freecodecamp.org/@donavon
[1]:https://unsplash.com/photos/pKeF6Tt3c08?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[2]:https://unsplash.com/search/photos/road-sign?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Logical_Operators
