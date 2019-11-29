[#]: collector: (lujun9972)
[#]: translator: (Morisun029)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11494-1.html)
[#]: subject: (Mutation testing by example: Failure as experimentation)
[#]: via: (https://opensource.com/article/19/9/mutation-testing-example-failure-experimentation)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzichttps://opensource.com/users/jocunddew)

变异测试：基于故障的试验
======

> 基于 .NET 的 xUnit.net 测试框架，开发一款自动猫门的逻辑，让门在白天开放，夜间锁定。

![Digital hand surrounding by objects, bike, light bulb, graphs][1]

在本系列的[第一篇文章][2]中，我演示了如何使用设计的故障来确保代码中的预期结果。在第二篇文章中，我将继续开发示例项目：一款自动猫门，该门在白天开放，夜间锁定。

在此提醒一下，你可以按照[此处的说明][3]使用 .NET 的 xUnit.net 测试框架。

### 关于白天时间

回想一下，测试驱动开发（TDD）围绕着大量的单元测试。

第一篇文章中实现了满足 `Given7pmReturnNighttime` 单元测试期望的逻辑。但还没有完，现在，你需要描述当前时间大于 7 点时期望发生的结果。这是新的单元测试，称为 `Given7amReturnDaylight`：

```
       [Fact]
       public void Given7amReturnDaylight()
       {
           var expected = "Daylight";
           var actual = dayOrNightUtility.GetDayOrNight();
           Assert.Equal(expected, actual);
       }
```

现在，新的单元测试失败了（越早失败越好！）：

```
Starting test execution, please wait...
[Xunit.net 00:00:01.23] unittest.UnitTest1.Given7amReturnDaylight [FAIL]
Failed unittest.UnitTest1.Given7amReturnDaylight
[...]
```

期望接收到字符串值是 `Daylight`，但实际接收到的值是 `Nighttime`。

### 分析失败的测试用例

经过仔细检查，代码本身似乎已经出现问题。 事实证明，`GetDayOrNight` 方法的实现是不可测试的！

看看我们面临的核心挑战：

1. `GetDayOrNight` 依赖隐藏输入。
    
    `dayOrNight` 的值取决于隐藏输入（它从内置系统时钟中获取一天的时间值）。
2. `GetDayOrNight` 包含非确定性行为。 

    从系统时钟中获取到的时间值是不确定的。（因为）该时间取决于你运行代码的时间点，而这一点我们认为这是不可预测的。
3. `GetDayOrNight` API 的质量差。

    该 API 与具体的数据源（系统 `DateTime`）紧密耦合。
4. `GetDayOrNight` 违反了单一责任原则。
    
    该方法实现同时使用和处理信息。优良作法是一种方法应负责执行一项职责。
5. `GetDayOrNight` 有多个更改原因。

    可以想象内部时间源可能会更改的情况。同样，很容易想象处理逻辑也将改变。这些变化的不同原因必须相互隔离。
6. 当（我们）尝试了解 `GetDayOrNight` 行为时，会发现它的 API 签名不足。
    
    最理想的做法就是通过简单的查看 API 的签名，就能了解 API 预期的行为类型。
7. `GetDayOrNight` 取决于全局共享可变状态。

    要不惜一切代价避免共享的可变状态！
8. 即使在阅读源代码之后，也无法预测 `GetDayOrNight` 方法的行为。

    这是一个严重的问题。通过阅读源代码，应该始终非常清晰，系统一旦开始运行，便可以预测出其行为。

### 失败背后的原则

每当你遇到工程问题时，建议使用久经考验的<ruby>分而治之<rt>divide and conquer</rt></ruby>策略。在这种情况下，遵循<ruby>关注点分离<rt>separation of concerns</rt></ruby>的原则是一种可行的方法。

> 关注点分离（SoC）是一种用于将计算机程序分为不同模块的设计原理，以便每个模块都可以解决一个关注点。关注点是影响计算机程序代码的一组信息。关注点可以和要优化代码的硬件的细节一样概括，也可以和要实例化的类的名称一样具体。完美体现 SoC 的程序称为模块化程序。
>
> （[出处][4]）

`GetDayOrNight` 方法应仅与确定日期和时间值表示白天还是夜晚有关。它不应该与寻找该值的来源有关。该问题应留给调用客户端。

必须将这个问题留给调用客户端，以获取当前时间。这种方法符合另一个有价值的工程原理——<ruby>控制反转<rt>inversion of control</rt></ruby>。Martin Fowler [在这里][5]详细探讨了这一概念。

> 框架的一个重要特征是用户定义的用于定制框架的方法通常来自于框架本身，而不是从用户的应用程序代码调用来的。该框架通常在协调和排序应用程序活动中扮演主程序的角色。控制权的这种反转使框架有能力充当可扩展的框架。用户提供的方法为框架中的特定应用程序量身制定泛化算法。
>
> -- [Ralph Johnson and Brian Foote][6]

### 重构测试用例

因此，代码需要重构。摆脱对内部时钟的依赖（`DateTime` 系统实用程序）：

```
 DateTime time = new DateTime();
```

删除上述代码（在你的文件中应该是第 7 行）。通过将输入参数 `DateTime` 时间添加到 `GetDayOrNight` 方法，进一步重构代码。

这是重构的类 `DayOrNightUtility.cs`：

```
using System;

namespace app {
   public class DayOrNightUtility {
       public string GetDayOrNight(DateTime time) {
           string dayOrNight = "Nighttime";
           if(time.Hour >= 7 && time.Hour < 19) {
               dayOrNight = "Daylight";
           }
           return dayOrNight;
       }
   }
}
```

重构代码需要更改单元测试。 需要准备 `nightHour` 和 `dayHour` 的测试数据，并将这些值传到`GetDayOrNight` 方法中。 以下是重构的单元测试：

```
using System;
using Xunit;
using app;

namespace unittest
{
   public class UnitTest1
   {
       DayOrNightUtility dayOrNightUtility = new DayOrNightUtility();
       DateTime nightHour = new DateTime(2019, 08, 03, 19, 00, 00);
       DateTime dayHour = new DateTime(2019, 08, 03, 07, 00, 00);

       [Fact]
       public void Given7pmReturnNighttime()
       {
           var expected = "Nighttime";
           var actual = dayOrNightUtility.GetDayOrNight(nightHour);
           Assert.Equal(expected, actual);
       }

       [Fact]
       public void Given7amReturnDaylight()
       {
           var expected = "Daylight";
           var actual = dayOrNightUtility.GetDayOrNight(dayHour);
           Assert.Equal(expected, actual);
       }

   }
}
```

### 经验教训

在继续开发这种简单的场景之前，请先回顾复习一下本次练习中所学到的东西。

运行无法测试的代码，很容易在不经意间制造陷阱。从表面上看，这样的代码似乎可以正常工作。但是，遵循测试驱动开发（TDD）的实践（首先描述期望结果，然后才描述实现），暴露了代码中的严重问题。

这表明 TDD 是确保代码不会太凌乱的理想方法。TDD 指出了一些问题区域，例如缺乏单一责任和存在隐藏输入。此外，TDD 有助于删除不确定性代码，并用行为明确的完全可测试代码替换它。

最后，TDD 帮助交付易于阅读、逻辑易于遵循的代码。

在本系列的下一篇文章中，我将演示如何使用在本练习中创建的逻辑来实现功能代码，以及如何进行进一步的测试使其变得更好。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/mutation-testing-example-failure-experimentation

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[Morisun029](https://github.com/Morisun029)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003588_01_rd3os.combacktoschoolseriesk12_rh_021x_0.png?itok=fvorN0e- (Digital hand surrounding by objects, bike, light bulb, graphs)
[2]: https://linux.cn/article-11483-1.html
[3]: https://linux.cn/article-11468-1.html
[4]: https://en.wikipedia.org/wiki/Separation_of_concerns
[5]: https://martinfowler.com/bliki/InversionOfControl.html
[6]: http://www.laputan.org/drc/drc.html
[7]: http://www.google.com/search?q=new+msdn.microsoft.com
