[#]: collector: (lujun9972)
[#]: translator: (Morisun029)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11468-1.html)
[#]: subject: (Mutation testing is the evolution of TDD)
[#]: via: (https://opensource.com/article/19/8/mutation-testing-evolution-tdd)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

变异测试是测试驱动开发（TDD）的演变
======

> 测试驱动开发技术是根据大自然的运作规律创建的，变异测试自然成为 DevOps 演变的下一步。

![Ants and a leaf making the word "open"][1]

在 “[故障是无懈可击的开发运维中的一个特点][2]”，我讨论了故障在通过征求反馈来交付优质产品的过程中所起到的重要作用。敏捷 DevOps 团队就是用故障来指导他们并推动开发进程的。<ruby>[测试驱动开发][3]<rt>Test-driven development</rt></ruby>（TDD）是任何敏捷 DevOps 团队评估产品交付的[必要条件][4]。以故障为中心的 TDD 方法仅在与可量化的测试配合使用时才有效。

TDD 方法仿照大自然是如何运作的以及自然界在进化博弈中是如何产生赢家和输家为模型而建立的。

### 自然选择

![查尔斯·达尔文][5]

1859 年，<ruby>[查尔斯·达尔文][6]<rt>Charles Darwin</rt></ruby>在他的《<ruby>[物种起源][7]<rt>On the Origin of Species</rt></ruby>》一书中提出了进化论学说。达尔文的论点是，自然变异是由生物个体的自发突变和环境压力共同造成的。环境压力淘汰了适应性较差的生物体，而有利于其他适应性强的生物的发展。每个生物体的染色体都会发生变异，而这些自发的变异会携带给下一代（后代）。然后在自然选择下测试新出现的变异性 —— 当下存在的环境压力是由变异性的环境条件所导致的。 

这张简图说明了调整适应环境条件的过程。

![环境压力对鱼类的影响][8]

*图1. 不同的环境压力导致自然选择下的不同结果。图片截图来源于[理查德·道金斯的一个视频][9]。*

该图显示了一群生活在自己栖息地的鱼。栖息地各不相同（海底或河床底部的砾石颜色有深有浅），每条鱼长的也各不相同（鱼身图案和颜色也有深有浅）。

这张图还显示了两种情况（即环境压力的两种变化）：

  1. 捕食者在场
  2. 捕食者不在场

在第一种情况下，在砾石颜色衬托下容易凸显出来的鱼被捕食者捕获的风险更高。当砾石颜色较深时，浅色鱼的数量会更少一些。反之亦然，当砾石颜色较浅时，深色鱼的数量会更少。

在第二种情况下，鱼完全放松下来进行交配。在没有捕食者和没有交配仪式的情况下，可以预料到相反的结果：在砾石背景下显眼的鱼会有更大的机会被选来交配并将其特性传递给后代。

### 选择标准

变异性在进行选择时，绝不是任意的、反复无常的、异想天开的或随机的。选择过程中的决定性因素通常是可以度量的。该决定性因素通常称为测试或目标。

一个简单的数学例子可以说明这一决策过程。（在该示例中，这种选择不是由自然选择决定的，而是由人为选择决定。）假设有人要求你构建一个小函数，该函数将接受一个正数，然后计算该数的平方根。你将怎么做？

敏捷 DevOps 团队的方法是快速验证失败。谦虚一点，先承认自己并不真的知道如何开发该函数。这时，你所知道的就是如何描述你想做的事情。从技术上讲，你已准备好进行单元测试。

“<ruby>单元测试<rt>unit test</rt></ruby>”描述了你的具体期望结果是什么。它可以简单地表述为“给定数字 16，我希望平方根函数返回数字 4”。你可能知道 16 的平方根是 4。但是，你不知道一些较大数字（例如 533）的平方根。

但至少，你已经制定了选择标准，即你的测试或你的期望值。

### 进行故障测试

[.NET Core][10] 平台可以演示该测试。.NET 通常使用 xUnit.net 作为单元测试框架。（要跟随进行这个代码示例，请安装 .NET Core 和 xUnit.net。）

打开命令行并创建一个文件夹，在该文件夹实现平方根解决方案。例如，输入：

```
mkdir square_root
```

再输入：

```
cd square_root
```

为单元测试创建一个单独的文件夹：

```
mkdir unit_tests
```

进入 `unit_tests` 文件夹下（`cd unit_tests`），初始化 xUnit 框架：

```
dotnet new xunit
```

现在，转到 `square_root` 下, 创建 `app` 文件夹:

```
mkdir app
cd app
```

如果有必要的话，为你的代码创建一个脚手架：

```
dotnet new classlib
```

现在打开你最喜欢的编辑器开始编码！

在你的代码编辑器中，导航到 `unit_tests` 文件夹，打开 `UnitTest1.cs`。

将 `UnitTest1.cs` 中自动生成的代码替换为：

```
using System;
using Xunit;
using app;

namespace unit_tests{

   public class UnitTest1{
       Calculator calculator = new Calculator();

       [Fact]
       public void GivenPositiveNumberCalculateSquareRoot(){
           var expected = 4;
           var actual = calculator.CalculateSquareRoot(16);
           Assert.Equal(expected, actual);
       }
   }
}
```

该单元测试描述了变量的**期望值**应该为 4。下一行描述了**实际值**。建议通过将输入值发送到称为`calculator` 的组件来计算**实际值**。对该组件的描述是通过接收数值来处理`CalculateSquareRoot` 信息。该组件尚未开发。但这并不重要，我们在此只是描述期望值。

最后，描述了触发消息发送时发生的情况。此时，判断**期望值**是否等于**实际值**。如果是，则测试通过，目标达成。如果**期望值**不等于**实际值**，则测试失败。

接下来，要实现称为 `calculator` 的组件，在 `app` 文件夹中创建一个新文件，并将其命名为`Calculator.cs`。要实现计算平方根的函数，请在此新文件中添加以下代码：

```
namespace app {
   public class Calculator {
       public double CalculateSquareRoot(double number) {
           double bestGuess = number;
           return bestGuess;
       }
   }
}
```

在测试之前，你需要通知单元测试如何找到该新组件（`Calculator`）。导航至 `unit_tests` 文件夹，打开 `unit_tests.csproj` 文件。在 `<ItemGroup>` 代码块中添加以下代码：

```
<ProjectReference Include="../app/app.csproj" />
```

保存 `unit_test.csproj` 文件。现在，你可以运行第一个测试了。

切换到命令行，进入 `unit_tests` 文件夹。运行以下命令：

```
dotnet test
```

运行单元测试，会输出以下内容：

![单元测试失败后xUnit的输出结果][12]

*图2. 单元测试失败后 xUnit 的输出结果*

正如你所看到的，单元测试失败了。期望将数字 16 发送到 `calculator` 组件后会输出数字 4，但是输出（`Actual`）的是 16。

恭喜你！创建了第一个故障。单元测试为你提供了强有力的反馈机制，敦促你修复故障。

### 修复故障

要修复故障，你必须要改进 `bestGuess`。当下，`bestGuess` 仅获取函数接收的数字并返回。这不够好。

但是，如何找到一种计算平方根值的方法呢？ 我有一个主意 —— 看一下大自然母亲是如何解决问题的。

### 效仿大自然的迭代

在第一次（也是唯一的）尝试中要得出正确值是非常难的（几乎不可能）。你必须允许自己进行多次尝试猜测，以增加解决问题的机会。允许多次尝试的一种方法是进行迭代。

要迭代，就要将 `bestGuess` 值存储在 `previousGuess` 变量中，转换 `bestGuess` 的值，然后比较两个值之间的差。如果差为 0，则说明问题已解决。否则，继续迭代。

这是生成任何正数的平方根的函数体：

```
double bestGuess = number;
double previousGuess;

do {
   previousGuess = bestGuess;
   bestGuess = (previousGuess + (number/previousGuess))/2;
} while((bestGuess - previousGuess) != 0);

return bestGuess;
```

该循环（迭代）将 `bestGuess` 值集中到设想的解决方案。现在，你精心设计的单元测试通过了！

![单元测试通过了][13]

*图 3. 单元测试通过了。*

### 迭代解决了问题

正如大自然母亲解决问题的方法，在本练习中，迭代解决了问题。增量方法与逐步改进相结合是获得满意解决方案的有效方法。该示例中的决定性因素是具有可衡量的目标和测试。一旦有了这些，就可以继续迭代直到达到目标。

### 关键点!

好的，这是一个有趣的试验，但是更有趣的发现来自于使用这种新创建的解决方案。到目前为止，`bestGuess` 从开始一直把函数接收到的数字作为输入参数。如果更改 `bestGuess` 的初始值会怎样？

为了测试这一点，你可以测试几种情况。 首先，在迭代多次尝试计算 25 的平方根时，要逐步细化观察结果：

![25 平方根的迭代编码][14]

*图 4. 通过迭代来计算 25 的平方根。*

以 25 作为 `bestGuess` 的初始值，该函数需要八次迭代才能计算出 25 的平方根。但是，如果在设计 `bestGuess` 初始值上犯下荒谬的错误，那将怎么办？ 尝试第二次，那 100 万可能是 25 的平方根吗？ 在这种明显错误的情况下会发生什么？你写的函数是否能够处理这种低级错误。

直接来吧。回到测试中来，这次以一百万开始：

![逐步求精法][15]

*图 5. 在计算 25 的平方根时，运用逐步求精法，以 100 万作为 bestGuess 的初始值。*

哇！ 以一个荒谬的数字开始，迭代次数仅增加了两倍（从八次迭代到 23 次）。增长幅度没有你直觉中预期的那么大。

### 故事的寓意

啊哈！ 当你意识到，迭代不仅能够保证解决问题，而且与你的解决方案的初始猜测值是好是坏也没有关系。 不论你最初理解得多么不正确，迭代过程以及可衡量的测试/目标，都可以使你走上正确的道路并得到解决方案。

图 4 和 5 显示了陡峭而戏剧性的燃尽图。一个非常错误的开始，迭代很快就产生了一个绝对正确的解决方案。

简而言之，这种神奇的方法就是敏捷 DevOps 的本质。

### 回到一些更深层次的观察

敏捷 DevOps 的实践源于人们对所生活的世界的认知。我们生活的世界存在不确定性、不完整性以及充满太多的困惑。从科学/哲学的角度来看，这些特征得到了<ruby>[海森堡的不确定性原理][16]<rt>Heisenberg's Uncertainty Principle</rt></ruby>（涵盖不确定性部分），<ruby>[维特根斯坦的逻辑论哲学][17]<rt>Wittgenstein's Tractatus Logico-Philosophicus</rt></ruby>（歧义性部分），<ruby>[哥德尔的不完全性定理][18]<rt>Gödel's incompleteness theorems</rt></ruby>（不完全性方面）以及<ruby>[热力学第二定律][19]<rt>Second Law of Thermodynamics</rt></ruby>（无情的熵引起的混乱）的充分证明和支持。

简而言之，无论你多么努力，在尝试解决任何问题时都无法获得完整的信息。因此，放下傲慢的姿态，采取更为谦虚的方法来解决问题对我们会更有帮助。谦卑会给为你带来巨大的回报，这个回报不仅是你期望的一个解决方案，还会有它的副产品。

### 总结

大自然在不停地运作，这是一个持续不断的过程。大自然没有总体规划。一切都是对先前发生的事情的回应。 反馈循环是非常紧密的，明显的进步/倒退都是逐步实现的。大自然中随处可见，任何事物的都在以一种或多种形式逐步完善。

敏捷 DevOps 是工程模型逐渐成熟的一个非常有趣的结果。DevOps 基于这样的认识，即你所拥有的信息总是不完整的，因此你最好谨慎进行。获得可衡量的测试（例如，假设、可测量的期望结果），进行简单的尝试，大多数情况下可能失败，然后收集反馈，修复故障并继续测试。除了同意每个步骤都必须要有可衡量的假设/测试之外，没有其他方法。

在本系列的下一篇文章中，我将仔细研究变异测试是如何提供及时反馈来推动实现结果的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/mutation-testing-evolution-tdd

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[Morisun029](https://github.com/Morisun029)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_520X292_openanttrail-2.png?itok=xhD3WmUd (Ants and a leaf making the word "open")
[2]: https://opensource.com/article/19/7/failure-feature-blameless-devops
[3]: https://en.wikipedia.org/wiki/Test-driven_development
[4]: https://www.merriam-webster.com/dictionary/conditio%20sine%20qua%20non
[5]: https://opensource.com/sites/default/files/uploads/darwin.png (Charles Darwin)
[6]: https://en.wikipedia.org/wiki/Charles_Darwin
[7]: https://en.wikipedia.org/wiki/On_the_Origin_of_Species
[8]: https://opensource.com/sites/default/files/uploads/environmentalconditions2.png (Environmental pressures on fish)
[9]: https://www.youtube.com/watch?v=MgK5Rf7qFaU
[10]: https://dotnet.microsoft.com/
[11]: https://xunit.net/
[12]: https://opensource.com/sites/default/files/uploads/xunit-output.png (xUnit output after the unit test run fails)
[13]: https://opensource.com/sites/default/files/uploads/unit-test-success.png (Unit test successful)
[14]: https://opensource.com/sites/default/files/uploads/iterating-square-root.png (Code iterating for the square root of 25)
[15]: https://opensource.com/sites/default/files/uploads/bestguess.png (Stepwise refinement)
[16]: https://en.wikipedia.org/wiki/Uncertainty_principle
[17]: https://en.wikipedia.org/wiki/Tractatus_Logico-Philosophicus
[18]: https://en.wikipedia.org/wiki/G%C3%B6del%27s_incompleteness_theorems
[19]: https://en.wikipedia.org/wiki/Second_law_of_thermodynamics
