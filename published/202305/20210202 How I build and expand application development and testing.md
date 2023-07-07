[#]: collector: (lujun9972)
[#]: translator: (toknow-gh)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-15817-1.html)
[#]: subject: (How I build and expand application development and testing)
[#]: via: (https://opensource.com/article/21/2/build-expand-software)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

ZOMBIES：软件开发和测试中的构建与拓展（二）
======

> 在开发初期只对单个元素进行编码和测试，之后再拓展到多个元素上。

![][0]

在 [上一篇文章][2] 中我已经解释了为什么把所有编程问题当作一群丧尸一次性处理是错误的。我也解释了 ZOMBIES 方法中的第一条：最简场景。本文中我将进一步介绍接下来的两条：单元素场景和多元素场景。

ZOMBIES 表示以下首字母缩写：

- **Z** – 最简场景（Zero）
- **O** – 单元素场景（One）
- **M** – 多元素场景（Many or more complex）
- **B** – 边界行为（Boundary behaviors）
- **I** – 接口定义（Interface definition）
- **E** – 处理特殊行为（Exercise exceptional behavior）
- **S** – 简单场景用简单的解决方案（Simple scenarios, simple solutions）

在上一篇文章中，通过应用了最简场景，你在代码里构建了一条最简可行通路。这个代码里没有任何业务处理逻辑。现在是时候向系统中添加一个元素了。

最简场景表示系统中什么也没有，这是一个空的用例，我们什么也不用关心。单元素场景代表我们有一个元素需要关心考虑。这个单一元素可能是集合中的一个元素、一个访问着或者一个需要处理的事件。

对于多元素场景，我们需要处理更复杂的情况，比如两个或更多的集合元素或事件。

### 单元素场景

在上一篇文章的代码基础上，向虚拟购物筐里添加一些商品。首先，写一个伪测试：

```
[Fact]
public void Add1ItemBasketHas1Item() {
        var expectedNoOfItems = 1;
        var actualNoOfItems = 0;
        Assert.Equal(expectedNoOfItems, actualNoOfItems);
}
```

不出所料，这个测试失败了，因为硬编码了一个错误的值：

```
Starting test execution, please wait...

A total of 1 test files matched the specified pattern.
[xUnit.net 00:00:00.57] tests.UnitTest1.NewlyCreatedBasketHas0Items [FAIL]
  X tests.UnitTest1.NewlyCreatedBasketHas0Items [4ms]
  Error Message:
   Assert.Equal() Failure
Expected: 0
Actual: 1
[...]
```

现在是时候停止伪造了。现在你已经用 `ArrayList` 实现了购物筐。那么应该怎么实现*商品*呢？

简洁性应该一直是你的指导原则。在不了解商品的太多信息的情况下，你可以先用另一个集合来实现它。这个表示商品的集合应该包含些什么呢？由于你多半会关心计算购物筐中的商品总价，所以对商品的表示至少需要包含价格（可以是任意货币，为简单起见，不妨假设是人民币）。

（我们需要）一个简单的集合类型，它包含一个商品 ID（可以在系统中的其它地方使用 ID 来指向该商品）和这个商品的价格。

键值对类型的数据结构可以很容易满足这个需求。在 C# 中最先被想到的数据结构就是 `Hashtable`。

在购物应用的代码中给 `IShoppingAPI` 增加一个新功能：

```
int AddItem(Hashtable item);
```

这个新功能以一个用 `Hashtable` 表示的商品为输入，返回购物筐中的商品数量。

将测试代码中硬编码的值提替换为对接口的调用：

```
[Fact]
public void Add1ItemBasketHas1Item() {            
    var expectedNoOfItems = 1;
    Hashtable item = [new][3] Hashtable();
    var actualNoOfItems = shoppingAPI.AddItem(item);
    Assert.Equal(expectedNoOfItems, actualNoOfItems);
}
```

在上面的代码中实例化了一个 `Hashtable` 并命名为 `item`，然后调用购物接口中的 `AddItem(item)` 方法，该方法会返回购物筐中实际的商品数量。

转到 `ShoppingAPI` 类中，实现这个方法：

```
public int AddItem(Hashtable item) {
    return 0;
}
```

这里再次通过写假代码来检验测试的效果（测试是业务代码的第一个调用者）。如果测试失败，将硬编码值换成实际的代码：

```
public int AddItem(Hashtable item) {
    basket.Add(item);
    return basket.Count;
}
```

在上面的代码中，向购物筐里添加了一件商品，然后返回购物筐中的商品数量：

```
Test Run Successful.
Total tests: 2
     Passed: 2
 Total time: 1.0633 Seconds
```

到目前为止，你通过了两个测试，同时也基本里解了 ZOMBIES 方法中的最简场景和单元素场景两部分。

### 反思总结

回顾前面所做的工作，你会发现通过将注意力集中到处理最简场景和单元素场景上，你在构建接口的同时也定义了一些业务逻辑边界！这不是很棒吗？现在你已经部分地实现了最关键的抽象逻辑，并且能够处理什么也没有和只有一个元素的的情况。因为你正在构建的是一个电子交易 API，所以你不能对顾客的购物行为预设其它限制。总而言之，虚拟购物筐应该是无限大的。

ZOMBIES 提供的逐步优化思路的另一个重要方面（虽然不是很明显）是从大概思路到具体实现的阻力。你也许已经注意到了，要具体实现某个东西总是困难重重。倒不如先用硬编码值来构造一个伪实现。只有看到接口与测试之间以一种合理的方式交互之后，你才会愿意开始完善实现代码。

即便如此，你也应该采用简单直接的代码结构，尽可能避免条件逻辑分支。

### 多元素场景

通过定义顾客向购物筐里添加两件商品时的期望来拓展应用程序。首先构造一个伪测试。它的期望值为 2，但是现在将实际值硬编码为 0，强制让测试失败：

```
[Fact]
public void Add2ItemsBasketHas2Items() {
        var expectedNoOfItems = 2;
        var actualNoOfItems = 0;
        Assert.Equal(expectedNoOfItems, actualNoOfItems);
}
```

执行测试，前两个测试用例通过了（针对最简场景和单元素场景的测试），而硬编码的测试不出所料地失败了：

```
A total of 1 test files matched the specified pattern.
[xUnit.net 00:00:00.57] tests.UnitTest1.Add2ItemsBasketHas2Items [FAIL]
  X tests.UnitTest1.Add2ItemsBasketHas2Items [2ms]
  Error Message:
   Assert.Equal() Failure
Expected: 2
Actual: 0

Test Run Failed.
Tatal tests: 3
     Passed: 2
     Failed: 1
```

将硬编码值替换为实际的代码调用：

```
[Fact]
public void Add2ItemsBasketHas2Items() {
        var expectedNoOfItems = 2;
        Hashtable item = [new][3] Hashtable();
        shoppingAPI.AddItem(item);
        var actualNoOfItems = shoppingAPI.AddItem(item);
        Assert.Equal(expectedNoOfItems, actualNoOfItems);
}
```

在这个测试中，你向购物筐中添加了两件商品（实际上是将同一件商品添加了两次），然后比较期望的商品数量和第二次添加商品后调用 `shoppingAPI` 返回的商品数量是否相等。

现在所有测试都能够通过！

### 敬请期待

现在你已经了解了最简场景、单元素场景和多元素场景。我将下一篇文章中介绍边界行为和接口定义。敬请期待!

（题图：MJ/e4679f1f-311a-4a41-80e8-8d2834b956f2）

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/build-expand-software

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security_password_chaos_engineer_monster.png?itok=J31aRccu (Security monster)
[2]: https://linux.cn/article-15808-1.html
[3]: http://www.google.com/search?q=new+msdn.microsoft.com
[0]: https://img.linux.net.cn/data/attachment/album/202305/16/154949rgu89gbzpzp1p0et.jpg