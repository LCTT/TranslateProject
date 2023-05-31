[#]: collector: (lujun9972)
[#]: translator: (toknow-gh)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-15860-1.html)
[#]: subject: (How to implement business requirements in software development)
[#]: via: (https://opensource.com/article/21/2/exceptional-behavior)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

ZOMBIES：如何在软件开发中实现业务需求（四）
======

> 完善你的电商应用，使它能够正确处理业务规则。

![][0]

在前面的文章中，我已经解释了为什么将编程问题看作一整群丧尸来处理是错误的。我用 ZOMBIES 方法来解释为什么循序渐进地处理问题更好。

ZOMBIES 表示以下首字母缩写：

- **Z** – 最简场景（Zero）
- **O** – 单元素场景（One）
- **M** – 多元素场景（Many or more complex）
- **B** – 边界行为（Boundary behaviors）
- **I** – 接口定义（Interface definition）
- **E** – 处理特殊行为（Exercise exceptional behavior）
- **S** – 简单场景用简单的解决方案（Simple scenarios, simple solutions）

在系列的前三篇文章中，我展示了 ZOMBIES 方法的前五项。第一篇中 [实现了最简场景][2]，它为代码提供了最简可行路径。第二篇文章中执行了 [单元素场景和多元素场景上的测试][3]。第三篇中介绍了 [边界和接口][4]。在本文中，我将带你了解倒数第二个方法：处理特殊行为。

### 处理特殊行为

在开发一个电子购物应用时，你需要从产品负责人或赞助商那里了解需要采用什么销售策略。

毫无疑问，与任何电子商业活动一样，你需要通过制定销售策略来诱导顾客进行消费。假设有如下的销售策略：订单金额超过 ￥500 时可以享受一定的折扣优惠。

现在将这个销售策略转换为可运行期望：

```
[Fact]
public void Add2ItemsTotal600GrandTotal540() {
        var expectedGrandTotal = 540.00;
        var actualGrandTotal = 0.00;
        Assert.Equal(expectedGrandTotal, actualGrandTotal);
}
```

这个正面样例表示的销售策略是，如果订单总额为 ￥600.00，那么 `shoppingAPI` 会将其减价为 ￥540.00。上面的代码伪造了一个失败验证用例。现在修改它，让它能够通过测试：

```
[Fact]
public void Add2ItemsTotal600GrandTotal540() {
        var expectedGrandTotal = 540.00;
        Hashtable item = new Hashtable();
        item.Add("00000001", 200.00);
        shoppingAPI.AddItem(item);
        Hashtable item2 = new Hashtable();
        item2.Add("00000002", 400.00);
        shoppingAPI.AddItem(item2);
        var actualGrandTotal = shoppingAPI.CalculateGrandTotal();
        Assert.Equal(expectedGrandTotal, actualGrandTotal);
}
```

在这个正样例中，你向购物框加入一件价值 ￥200 的商品和一件价值 ￥400 的商品，使总价达到 ￥600 。当调用 `CalculateGrandTotal()` 方法时，你期望总价是 ￥540。

这个微测试能够通过吗？

```
[xUnit.net 00:00:00.57] tests.UnitTest1.Add2ItemsTotal600GrandTotal540 [FAIL]
  X tests.UnitTest1.Add2ItemsTotal600GrandTotal540 [2ms]
  Error Message:
   Assert.Equal() Failure
Expected: 540
Actual: 600
[...]
```

很可惜，它失败了。你期望的结果是 ￥540，但计算结果为 ￥600。为什么会这样呢？那是因为你还没有告诉系统在订单总价大于 ￥500 时怎么进行折扣计算。

现在来实现折扣计算逻辑。根据上面的正样例可知，当订单总价为 ￥600（超过了营销策略的阈值 ￥500）时，期望的最终总价为 ￥540。也就是说系统需要从订单总额中减去 ￥60。刚好是是原订单总价的 10%。因此该销售规则就是当订单总额超过 ￥500 时享受九折优惠。

在 `ShippingAPI` 类中实现该处理逻辑：

```
private double Calculate10PercentDiscount(double total) {
        double discount = 0.00;
        if(total > 500.00) {
                discount = (total/100) * 10;
        }
        return discount;
}
```

首先，检查订单总额是否大于 ￥500 。如果是，则计算出总额的 10%。

你还需要告诉系统怎么从订单总额中减去 10%。改动非常直接：

```
return grandTotal - Calculate10PercentDiscount(grandTotal);
```

到此，所有测试都能够通过。你又一次享受到系统处于稳态的欢愉。你的代码通过处理特殊行为实现了需要的销售策略。

### 最后一步

现在我已经介绍完 ZOMBIE 了，只剩下 S 了。我将会在最后一篇中介绍它。

*（题图：MJ/7f8bf5d2-54ce-4d6e-9dbf-13abf6df966a）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/exceptional-behavior

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team_dev_email_chat_video_work_wfm_desk_520.png?itok=6YtME4Hj (Working on a team, busy worklife)
[2]: https://linux.cn/article-15808-1.html
[3]: https://linux.cn/article-15817-1.html
[4]: https://linux.cn/article-15859-1.html
[5]: http://www.google.com/search?q=new+msdn.microsoft.com
[0]: https://img.linux.net.cn/data/attachment/album/202305/30/094226xz66t662t42auuht.jpg