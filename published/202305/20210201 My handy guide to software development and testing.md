[#]: collector: (lujun9972)
[#]: translator: (toknow-gh)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-15808-1.html)
[#]: subject: (My handy guide to software development and testing)
[#]: via: (https://opensource.com/article/21/2/development-guide)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

ZOMBIES：我的软件开发和测试简便指南（一）
======

> 编程过程有时候就像一场与丧尸群之间的战斗。在这个系列文章中，我将带你了解怎样将 ZOMBIES 方法应用到实际工作中。

![][0]

很久以前，在我还是一个萌新程序员的时候，我们曾经被分配一大批工作。我们每个人都被分配了一个编程任务，然后回到自己的小隔间里噼里啪啦地敲键盘。我记得团队里的成员在自己的小隔间里一呆就是几个小时，为打造无缺陷的程序而奋斗。当时流行的思想是：能一次性做得越多，能力越强。

对于我来说，能够长时间编写或者修改代码而不用中途停下来检验这些代码是否有效，就像荣誉勋章一样。那个时候我们都认为停下来检验代码是否工作是能力不足的表现，菜鸟才这么干。一个“真正的开发者”应该能一口气构建起整个程序，中途不用停下来检查任何东西！

然而事与愿违，当我停止在开发过程中测试自己的代码之后，来自现实的检验狠狠地打了我的脸。我的代码要么无法通过编译，要么构建失败，要么无法运行，或者不能按预期处理数据。我不得不在绝望中挣扎着解决这些烦人的问题。

### 避开丧尸群

如果你觉得旧的工作方式听起来很混乱，那是因为它确实是这样的。我们一次性处理所有的任务，在问题堆里左砍右杀，结果只是引出更多的问题。着就像是跟一大群丧尸间的战斗。

如今我们已经学会了避免一次性做太多的事情。在最初听到一些专家推崇避免大批量地开发的好处时，我觉得这很反直觉，但我已经从过去的犯错中吸取了教训。我使用被 [James Grenning][1a] 称为 **ZOMBIES** 的方法来指导我的软件开发工作。

### ZOMBIES 方法来救援!

ZOMBIES 表示以下首字母缩写：

- **Z** – 最简场景（Zero）
- **O** – 单元素场景（One）
- **M** – 多元素场景（Many or more complex）
- **B** – 边界行为（Boundary behaviors）
- **I** – 接口定义（Interface definition）
- **E** – 处理特殊行为（Exercise exceptional behavior）
- **S** – 简单场景用简单的解决方案（Simple scenarios, simple solutions）

我将在本系列文章中对它们进行分析讲解。

### 最简场景

最简场景指可能出现的最简单的情况。

人们倾向于最开始的时候使用硬编码值，因为这是最简单的方式。通过在编码活动中使用硬编码值，可以快速构建出一个能即时反馈的解决方案。不需要几分钟，更不用几个小时，使用硬编码值让你能够马上与正在构建的系统进行交互。如果你喜欢这个交互，就朝这个方向继续做下去。如果你发现不喜欢这种交互，你可以很容易抛弃它，根本没有什么可损失。

本系列文章将以构建一个简易的购物系统的后端 API 为例进行介绍。该服务提供的 API 允许用户创建购物筐、向购物筐添加商品、从购物筐移除商品、计算商品总价。

首先，创建项目的基本结构（将购物程序的代码和测试代码分别放到 `app` 和 `tests` 目录下）。我们的例子中使用开源的 [xUnit][2] 测试框架。

现在撸起你的袖子，在实践中了解最简场景吧！

```
[Fact]
public void NewlyCreatedBasketHas0Items() {    
    var expectedNoOfItems = 0;
    var actualNoOfItems = 1;
    Assert.Equal(expectedNoOfItems, actualNoOfItems);
}
```

这是一个伪测试，它测试的是硬编码值。新创建的购物筐是空的，所以购物筐中预期的商品数是 0。通过比较期望值和实际值是否相等，这个预期被表示成一个测试（或者称为断言）。

运行该测试，输出结果如下：

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

这个测试显然无法通过：期望商品数是 0，但是实际值被硬编码为了 1。

当然，你可以马上把硬编码的值从 1 改成 0，这样测试就能通过了：

```
[Fact]
public void NewlyCreatedBasketHas0Items() {
    var expectedNoOfItems = 0;
    var actualNoOfItems = 0;
    Assert.Equal(expectedNoOfItems, actualNoOfItems);
}
```

与预想的一样，运行测试，测试通过：

```
Starting test execution, please wait...

A total of 1 test files matched the specified pattern.

Test Run Successful.
Total tests: 1
     Passed: 1
 Total time: 1.0950 Seconds
```

你也许会认为执行一个被强迫失败的测试完全没有意义，但是不管一个测试多么简单，确保它的可失败性是绝对有必要的。只有这样才能够保证如果在后续工作中不小心破坏了程序的处理逻辑时该测试能够给你相应的警告。

现在停止伪造数据，将硬编码的值替换成从 API 中获取的值。我们已经构造了一个能够可靠地失败的测试，它期望一个空的购物筐中有 0 个商品，现在是时候编写一些应用程序代码了。

就跟常见的软件建模活动一样，我们先从构造一个简单的接口开始。在 `app` 目录下新建文件 `IShoppingAPI.cs`（习惯上接口名一般以大写 I 开头）。在该接口中声明一个名为 `NoOfItems()` 的方法，它以 `int` 类型返回商品的数量。下面是接口的代码：

```
using System;

namespace app {    
    public interface IShoppingAPI {
        int NoOfItems();
    }
}
```

当然这个接口什么事也做不了，在你需要实现它。在 `app` 目录下创建另一个文件 `ShoppingAPI`。在其中将 `ShoppingAPI` 声明为一个实现了 `IShoppingAPI` 的公有类。在类中定义方法 `NoOfItems` 返回整数 1：

```
using System;

namespace app {
    public class ShoppingAPI : IShoppingAPI {
        public int NoOfItems() {
            return 1;
        }
    }
}
```

从上面代码中你发现自己又在通过返回硬编码值 1 的方式来伪造代码逻辑。现阶段这是一件好事，因为你需要保持一切超级无敌简单。现在还不是仔细构想如何实现购物筐的处理逻辑时候。这些工作后续再做！到目前为止，你只是通过构建最简场景来检验自己是否满意现在的设计。

为了确定这一点，将硬编码值换成这个 API 在运行中收到请求时应该返回的值。你需要通过 `using app;` 声明来告诉测试你使用的购物逻辑代码在哪里。

接下来，你需要 <ruby>实例化<rt>instantiate</rt></ruby> `IShoppingAPI` 接口：

```
IShoppingAPI shoppingAPI = new ShoppingAPI();
```

这个实例用来发送请求并接收返回的值。

现在，代码变成了这样：

```
using System;
using Xunit;
using app;

namespace tests {
    public class ShoppingAPITests {
        IShoppingAPI shoppingAPI = [new][3] ShoppingAPI();
 
        [Fact]        
        public void NewlyCreatedBasketHas0Items() {
            var expectedNoOfItems = 0;
            var actualNoOfItems = shoppingAPI.NoOfItems();
            Assert.Equal(expectedNoOfItems, actualNoOfItems);
        }
    }
}
```

显然执行这个测试的结果是失败，因为你硬编码了一个错误的返回值（期望值是 0，但是返回的是 1）。

同样的，你也可以通过将硬编码的值从 1 改成 0 来让测试通过，但是现在做这个是在浪费时间。现在设计的接口已经跟测试关联上了，你剩下的职责就是编写代码实现预期的行为逻辑。

在编写应用程序代码时，你得决定用来表示购物筐得数据结构。为了保持设计的简单，尽量选择 C# 中表示集合的最简单类型。第一个想到的就是 `ArrayList`。它非常适合目前的使用场景——可以保存不定个数的元素，并且易于遍历访问。

因为 `ArrayList` 是 `System.Collections` 包的一部分，在你的代码中需要声明：

```
using System.Collections;
```

然后 `basket` 的声明就变成这样了：

```
ArrayList basket = new ArrayList();
```

最后将 `NoOfItems()` 中的因编码值换成实际的代码：

```
public int NoOfItems() {
    return basket.Count;
}
```

这次测试能够通过了，因为最初购物筐是空的，`basket.Count` 返回 0。

这也是你的第一个最简场景测试要做的事情。

### 更多案例

目前的课后作业是处理一个丧尸，也就是第 0 个丧尸。在下一篇文章中，我将带你了解单元素场景和多元素场景。不要错过哦！

*（题图：MJ/7917bc47-5325-4c0f-a2dd-4e444f57a46c）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/development-guide

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/chaos_engineer_monster_scary_devops_gear_kubernetes.png?itok=GPYLvfVh (Gears above purple clouds)
[1a]: https://www.agilealliance.org/resources/speakers/james-grenning/
[2]: https://xunit.net/
[3]: http://www.google.com/search?q=new+msdn.microsoft.com
[0]: https://img.linux.net.cn/data/attachment/album/202305/13/135130gn78t5b5kippl5nu.jpg