[#]: collector: (lujun9972)
[#]: translator: (toknow-gh)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Defining boundaries and interfaces in software development)
[#]: via: (https://opensource.com/article/21/2/boundaries-interfaces)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

ZOMBIES：在软件开发中定义边界和接口（三）
======
丧尸是没有边界感的，需要为你的软件设定限制和期望。
![Looking at a map for career journey][1]

丧尸没有边界感。它们踩倒栅栏，推倒围墙，进入不属于它们的地盘。在前面的文章中，我已经解释了为什么把所有编程问题当作一群丧尸一次性处理是错误的。

ZOMBIES 代表首字母缩写：

**Z** – 最简场景（Zero）
**O** – 单个元素场景（One）
**M** – 多个元素场景（Many or more complex）
**B** – 边界行为（Boundary behaviors）
**I** – 接口定义（Interface definition）
**E** – 处理特殊行为（Exercise exceptional behavior）
**S** – 简单场景用简单的解决方案（Simple scenarios, simple solutions）


在本系列的前面两篇文章中，我演示了 ZOMBIES 方法的前三部分：最简场景、单元素场景和多元素场景。第一篇文章 [实现了最简场景][2]，它提供了代码中的最简可行路径。第二篇文章中针对单元素场景和多元素场景 [运行测试][3]。在这篇文章中，我将带你了解边界和接口。

### 回到单元素场景

要想处理边界，你需要绕回来（迭代）。

首先思考下面的问题：电子商务的边界是什么？我需要限制购物框的大小吗？（事实上，我不认为这有任何意义。）

目前唯一合理的边界条件是确保购物框里的商品数量不能为负数。将这个限制表示成可运行的期望：


```
[Fact]
public void Add1ItemRemoveItemRemoveAgainHas0Items() {
        var expectedNoOfItems = 0;
        var actualNoOfItems = -1;
        Assert.Equal(expectedNoOfItems, actualNoOfItems);
}
```

这就是说，如果你向购物框里添加一件商品，然后将这个商品移除两次，`shoppingAPI` 的实例应该告诉你购物框里有零个商品。

当然这个可运行期望（微测试）不出意料地会失败。想要这个微测试能够通过，最小改动是什么呢？


```
[Fact]
public void Add1ItemRemoveItemRemoveAgainHas0Items() {
        var expectedNoOfItems = 0;
        Hashtable item = [new][4] Hashtable();
        shoppingAPI.AddItem(item);
        shoppingAPI.RemoveItem(item);
        var actualNoOfItems = shoppingAPI.RemoveItem(item);
        Assert.Equal(expectedNoOfItems, actualNoOfItems);
}
```
这个期望测试依赖于 `RemoveItem(item)` 功能。目前的 `shippingAPI` 还不具备该功能，你需要增加该功能。


回到 `app` 文件夹，打开 `IShippingAPI.cs` 文件，新增以下声明：


```
`int RemoveItem(Hashtable item);`
```

到 `ShippingAPI.cs` 中实现该功能：


```
public int RemoveItem(Hashtable item) {
        basket.RemoveAt(basket.IndexOf(item));
        return basket.Count;
}
```

运行，然后你会得到如下错误：

![Error][5]

(Alex Bunardzic, [CC BY-SA 4.0][6])

系统在移除一个不在购物框的商品，这导致了系统崩溃。加一点点 <ruby>防御式编程<tr>defensive programming</tr></ruby>：


```
public int RemoveItem(Hashtable item) {
        if(basket.IndexOf(item) >= 0) {
                basket.RemoveAt(basket.IndexOf(item));
        }
        return basket.Count;
}
```

在移除商品之前先检查它是否在购物框中。（你可能试过用捕获异常的方式来处理，但是我认为上面的处理方式更具可读性。）

### 更多具体的期望

在讲更多具体的期望之前，让我们先探讨一下什么是接口。在软件工程中，接口表示一种规范，或者对能力的描述。从某种程度上来说，接口类似于菜谱。它罗列出了制作蛋糕的原材料，但它本身并不能吃。我们只是按照菜谱上的说明来烤蛋糕。

与此类似，我们首先通过说明这个服务能做什么的方式来定义我们的服务。这个描述说明就是所谓的接口。但是接口本身并不能向我们提供任何功能。它只是指导我们实现指定功能的蓝图而已。

到目前为止，我们已经实现了接口（只是某部分实现了，稍后还会增加新功能）和业务处理边界（也就是购物框里的商品不能是负数）。你指导了 `shoppingAPI` 怎么向购物框添加商品，并通过 `Add2ItemsBasketHas2Items` 测试验证了该功能的有效性。

然而仅仅具备向购物框添加商品的功能还不足以使其成为一个网购应用程序。它还需要能够计算购物框里的商品的总价。现在需要增加另一个期望。

按照惯例，从最直接明了的期望开始。当你向购物框里加入一件价值 ￥10 的商品时，你希望这个购物 API 能正确地计算出总价为 ￥10。

第五个测试（伪造版）如下：


```
[Fact]
public void Add1ItemPrice10GrandTotal10() {
        var expectedTotal = 10.00;
        var actualTotal = 0.00;
        Assert.Equal(expectedTotal, actualTotal);
}
```
还是一样的老把戏，通过硬编码一个错误的值让 `Add1ItemPrice10GrandTotal10` 测试失败。当然前三个测试成功通过，但第四个新增的测试失败了：


```
A total of 1 test files matched the specified pattern.
[xUnit.net 00:00:00.57] tests.UnitTest1.Add1ItemPrice10GrandTotal10 [FAIL]
  X tests.UnitTest1.Add1ItemPrice10GrandTotal10 [4ms]
  Error Message:
   Assert.Equal() Failure
Expected: 10
Actual: 0

Test Run Failed.
Total tests: 4
     Passed: 3
         Failed: 1
 Total time: 1.0320 Seconds
```

将硬编码值换成实际的处理代码。首先，检查接口是否具备计算订单总价的功能。根本没有这种东西。目前为止接口中只声明了三个功能：


  1. `int NoOfItems();`
  2. `int AddItem(Hashtable item);`
  3. `int RemoveItem(Hashtable item);`


它们都不具备计算总价的能力。所以需要声明一个新功能：


```
`double CalculateGrandTotal();`
```

这个新功能应该让 `shoppingAPI` 具备计算总价的能力。
这是通过遍历购物框中的商品并把它们的价格累加起来实现的。

修改第五个测试：


```
[Fact]
public void Add1ItemPrice10GrandTotal10() {
        var expectedGrandTotal = 10.00;
        Hashtable item = [new][4] Hashtable();
        item.Add("00000001", 10.00);
        shoppingAPI.AddItem(item);
        var actualGrandTotal = shoppingAPI.CalculateGrandTotal();
        Assert.Equal(expectedGrandTotal, actualGrandTotal);
}
```

这个测试表明了这样的期望：如果向购物框里加入一件价格 ￥10 的商品，然后调用 `CalculateGrandTotal()` 方法，它会返回商品总价 ￥10。这是一个完全合理的期望，它完全符合商品总价计算的逻辑。

那么怎么实现这个功能呢？就像以前一样，先写一个假的实现。回到 `ShippingAPI` 类中，实现在接口中声明的 `CalculateGrandTotal()` 方法：


```
public double CalculateGrandTotal() {
                return 0.00;
}
```

现在先将返回值硬编码为 0.00，只是为了检验这个测试能否正常运行，并确认它是能够失败的。事实上，它能够运行，并且如预期一样失败。接下来的工作就是正确实现计算商品总价的处理逻辑：


```
public double CalculateGrandTotal() {
        double grandTotal = 0.00;
        foreach(var product in basket) {
                Hashtable item = product as Hashtable;
                foreach(var value in item.Values) {
                        grandTotal += Double.Parse(value.ToString());
                }
        }
        return grandTotal;
}
```

运行，五个测试全部通过！

### 从单元素场景到多元素场景

现在是时候进入下一轮迭代了。你已经通过处理最简场景、单元素场景和边界场景迭代地构建了系统，现在需要处理稍复杂的多元素场景了。

快捷提示：由于我们一直在针对单个元素场景、多元素场景和边界行为这三点上对软件进行迭代改进，一些读者可能会认为我们同样应该对接口进行改进。我们稍后就会发现，接口已经完全满足需要了，目前没有新增功能的必要。请记住，应该保持接口的简洁。（盲目地）扩增接口不会带来任何好处，只会引入噪音。我们要遵循 <ruby>奥卡姆剃刀<rt>Occam's Razor</rt></ruby> 原则：如无必要，勿增实体。现在我们已经基本完成了接口功能描述的工作，是时候改进实现了。

通过上一轮的迭代，系统已经能够处理购物框里有超过一件商品的情况了。现在我么来让系统具备购物框里有超过一件商品时计算总价的能力。首先写可执行期望： 


```
[Fact]
public void Add2ItemsGrandTotal30() {
        var expectedGrandTotal = 30.00;
        var actualGrandTotal = 0.00;
        Assert.Equal(expectedGrandTotal, actualGrandTotal);
}
```

硬编码所有值，尽量让期望测试失败。

测试确实失败了，现在得想办法让它通过。向购物框添加两件商品，然后调用 `CalculateGrandTotal()` 方法： 


```
[Fact]
public void Add2ItemsGrandTotal30() {
        var expectedGrandTotal = 30.00;
        Hashtable item = [new][4] Hashtable();
        item.Add("00000001", 10.00);
        shoppingAPI.AddItem(item);
        Hashtable item2 = [new][4] Hashtable();
        item2.Add("00000002", 20.00);
        shoppingAPI.AddItem(item2);
        var actualGrandTotal = shoppingAPI.CalculateGrandTotal();
        Assert.Equal(expectedGrandTotal, actualGrandTotal);
}
```

测试通过。现在共有六个可以通过的微测试，系统回到了稳态。

### 设定期望

作为一个认真负责的工程师，你希望确保当用户向购物框添加一些商品然后又移除一些商品后系统仍然能够计算出正确出总价。下面是这个新的期望：


```
[Fact]
public void Add2ItemsRemoveFirstItemGrandTotal200() {
        var expectedGrandTotal = 200.00;
        var actualGrandTotal = 0.00;
        Assert.Equal(expectedGrandTotal, actualGrandTotal);
}
```

这个期望表示将两件商品加入到购物框，然后移除第一件后期望的总价是 ￥200。硬编码行为失败了。现在设计更具体的正面测试样例，然后运行代码：


```
[Fact]
public void Add2ItemsRemoveFirstItemGrandTotal200() {
        var expectedGrandTotal = 200.00;
        Hashtable item = [new][4] Hashtable();
        item.Add("00000001", 100.00);
        shoppingAPI.AddItem(item);
        Hashtable item2 = [new][4] Hashtable();
        item2.Add("00000002", 200.00);
        shoppingAPI.AddItem(item2);
        shoppingAPI.RemoveItem(item);
        var actualGrandTotal = shoppingAPI.CalculateGrandTotal();
        Assert.Equal(expectedGrandTotal, actualGrandTotal);
}
```

在这个正面测试样例中，先向购物框加入第一件商品（编号为 00000001，价格为 ￥100），再加入第二件商品（编号为 00000002，价格为 ￥200）。然后将第一件商品移除，计算总价，比较计算值与期望值是否相等。

运行期望测试，系统正确地计算出了总价，满足这个期望测试。现在有七个能顺利通过的测试了。系统运行良好，无异常！


```
Test Run Successful.
Total tests: 7
     Passed: 7
 Total time: 0.9544 Seconds
```

### 敬请期待

现在你已经学习了 ZOMBIES 方法中的 ZOMBI 部分，下一篇文章将介绍处理特殊行为。到那个时候，你可以试试自己的测试！


--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/boundaries-interfaces

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/career_journey_road_gps_path_map_520.png?itok=PpL6jJgY (Looking at a map for career journey)
[2]: https://opensource.com/article/21/1/zombies-zero
[3]: https://opensource.com/article/21/1/zombies-2-one-many
[4]: http://www.google.com/search?q=new+msdn.microsoft.com
[5]: https://opensource.com/sites/default/files/uploads/error_0.png (Error)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
