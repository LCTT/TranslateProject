[#]: collector: (lujun9972)
[#]: translator: (Morisun029)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11483-1.html)
[#]: subject: (Mutation testing by example: How to leverage failure)
[#]: via: (https://opensource.com/article/19/9/mutation-testing-example-tdd)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

变异测试：如何利用故障？
======

> 使用事先设计好的故障以确保你的代码达到预期的结果，并遵循 .NET xUnit.net 测试框架来进行测试。

![](https://img.linux.net.cn/data/attachment/album/201910/20/200030ipm13zmi08mv8z34.jpg)

[在变异测试是 TDD 的演变][2] 一文中，我谈到了迭代的力量。在可度量的测试中，迭代能够保证找到问题的解决方案。在那篇文章中，我们讨论了迭代法帮助确定实现计算给定数字平方根的代码。

我还演示了最有效的方法是找到可衡量的目标或测试，然后以最佳猜测值开始迭代。正如所预期的，第一次测试通常会失败。因此，必须根据可衡量的目标或测试对失败的代码进行完善。根据运行结果，对测试值进行验证或进一步加以完善。

在此模型中，学习获得解决方案的唯一方法是反复失败。这听起来有悖常理，但它确实有效。

按照这种分析，本文探讨了在构建包含某些依赖项的解决方案时使用 DevOps 的最佳方法。第一步是编写一个预期结果失败的用例。

### 依赖性问题是你不能依赖它们

正如<ruby>迈克尔·尼加德<rt>Michael Nygard</rt></ruby>在《[没有终结状态的架构][3]》中机智的表示的那样，依赖问题是一个很大的话题，最好留到另一篇文章中讨论。在这里，你将会看到依赖项给项目带来的一些潜在问题，以及如何利用测试驱动开发（TDD）来避免这些陷阱。

首先，找到现实生活中的一个挑战，然后看看如何使用 TDD 解决它。

### 谁把猫放出来？

![一只猫站在屋顶][4]

在敏捷开发环境中，通过定义期望结果开始构建解决方案会很有帮助。通常，在 <ruby>[用户故事][5]<rt>user story</rt></ruby> 中描述期望结果：

> 我想使用我的家庭自动化系统（HAS）来控制猫何时可以出门，因为我想保证它在夜间的安全。

现在你已经有了一个用户故事，你需要通过提供一些功能要求（即指定验收标准）来对其进行详细说明。 从伪代码中描述的最简单的场景开始：

> 场景 1：在夜间关闭猫门
>
>   * 用时钟监测到了晚上的时间
>   * 时钟通知 HAS 系统
>   * HAS 关闭支持物联网（IoT）的猫门

### 分解系统

开始构建之前，你需要将正在构建的系统（HAS）进行分解（分解为依赖项）。你必须要做的第一件事是识别任何依赖项（如果幸运的话，你的系统没有依赖项，这将会更容易，但是，这样的系统可以说不是非常有用）。

从上面的简单场景中，你可以看到所需的业务成果（自动控制猫门）取决于对夜间情况监测。这种依赖性取决于时钟。但是时钟是无法区分白天和夜晚的。需要你来提供这种逻辑。

正在构建的系统中的另一个依赖项是能够自动访问猫门并启用或关闭它。该依赖项很可能取决于具有 IoT 功能的猫门提供的 API。

### 依赖管理面临快速失败

为了满足依赖项，我们将构建确定当前时间是白天还是晚上的逻辑。本着 TDD 的精神，我们将从一个小小的失败开始。

有关如何设置此练习所需的开发环境和脚手架的详细说明，请参阅我的[上一篇文章][2]。我们将重用相同的 NET 环境和 [xUnit.net][6] 框架。

接下来，创建一个名为 HAS（“家庭自动化系统”）的新项目，创建一个名为 `UnitTest1.cs` 的文件。在该文件中，编写第一个失败的单元测试。在此单元测试中，描述你的期望结果。例如，当系统运行时，如果时间是晚上 7 点，负责确定是白天还是夜晚的组件将返回值 `Nighttime`。

这是描述期望值的单元测试：

```
using System;
using Xunit;

namespace unittest
{
   public class UnitTest1
   {
       DayOrNightUtility dayOrNightUtility = new DayOrNightUtility();

       [Fact]
       public void Given7pmReturnNighttime()
       {
           var expected = "Nighttime";
           var actual = dayOrNightUtility.GetDayOrNight();
           Assert.Equal(expected, actual);
       }
   }
}
```

至此，你可能已经熟悉了单元测试的结构。快速复习一下：在此示例中，通过给单元测试一个描述性名称`Given7pmReturnNighttime` 来描述期望结果。然后，在单元测试的主体中，创建一个名为 `expected` 的变量，并为该变量指定期望值（在该示例中，值为 `Nighttime`）。然后，为实际值指定一个 `actual`（在组件或服务处理一天中的时间之后可用）。

最后，通过断言期望值和实际值是否相等来检查是否满足期望结果：`Assert.Equal(expected, actual)`。

你还可以在上面的列表中看到名为 `dayOrNightUtility` 的组件或服务。该模块能够接收消息`GetDayOrNight`，并且返回 `string` 类型的值。

同样，本着 TDD 的精神，描述的组件或服务还尚未构建（仅为了后面说明在此进行描述）。构建这些是由所描述的期望结果来驱动的。

在 `app` 文件夹中创建一个新文件，并将其命名为 `DayOrNightUtility.cs`。将以下 C＃ 代码添加到该文件中并保存：

```
using System;

namespace app {
   public class DayOrNightUtility {
       public string GetDayOrNight() {
           string dayOrNight = "Undetermined";
           return dayOrNight;
       }
   }
}
```

现在转到命令行，将目录更改为 `unittests` 文件夹，然后运行：

```
[Xunit.net 00:00:02.33] unittest.UnitTest1.Given7pmReturnNighttime [FAIL]
Failed unittest.UnitTest1.Given7pmReturnNighttime
[...]
```

恭喜，你已经完成了第一个失败的单元测试。单元测试的期望结果是 `DayOrNightUtility` 方法返回字符串 `Nighttime`，但相反，它返回是 `Undetermined`。

### 修复失败的单元测试

修复失败的测试的一种快速而粗略的方法是将值 `Undetermined` 替换为值 `Nighttime` 并保存更改：

```
using System;

namespace app {
   public class DayOrNightUtility {
       public string GetDayOrNight() {
           string dayOrNight = "Nighttime";
           return dayOrNight;
       }
   }
}
```

现在运行，成功了。

```
Starting test execution, please wait...

Total tests: 1. Passed: 1. Failed: 0. Skipped: 0.
Test Run Successful.
Test execution time: 2.6470 Seconds
```

但是，对值进行硬编码基本上是在作弊，最好为 `DayOrNightUtility` 方法赋予一些智能。修改 `GetDayOrNight` 方法以包括一些时间计算逻辑：

```
public string GetDayOrNight() {
    string dayOrNight = "Daylight";
    DateTime time = new DateTime();
    if(time.Hour < 7) {
        dayOrNight = "Nighttime";
    }
    return dayOrNight;
}
```

该方法现在从系统获取当前时间，并与 `Hour` 比较，查看其是否小于上午 7 点。如果小于，则处理逻辑将 `dayOrNight` 字符串值从 `Daylight` 转换为 `Nighttime`。现在，单元测试通过。

### 测试驱动解决方案的开始

现在，我们已经开始了基本的单元测试，并为我们的时间依赖项提供了可行的解决方案。后面还有更多的测试案例需要执行。

在下一篇文章中，我将演示如何对白天时间进行测试以及如何在整个过程中利用故障。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/mutation-testing-example-tdd

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[Morisun029](https://github.com/Morisun029)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_failure_celebrate.png?itok=LbvDAEZF (failure sign at a party, celebrating failure)
[2]: https://linux.cn/article-11468-1.html
[3]: https://www.infoq.com/presentations/Architecture-Without-an-End-State/
[4]: https://opensource.com/sites/default/files/uploads/cat.png (Cat standing on a roof)
[5]: https://www.agilealliance.org/glossary/user-stories
[6]: https://xunit.net/
[7]: http://www.google.com/search?q=new+msdn.microsoft.com
