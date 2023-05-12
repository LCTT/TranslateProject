[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to implement business requirements in software development)
[#]: via: (https://opensource.com/article/21/2/exceptional-behavior)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)

How to implement business requirements in software development
======
Increment your e-commerce app to ensure it implements required business
process rules correctly.
![Working on a team, busy worklife][1]

In my previous articles in this series, I explained why tackling coding problems all at once, as if they were hordes of zombies, is a mistake. I'm using a helpful acronym to explain why it's better to approach problems incrementally. **ZOMBIES** stands for:

**Z** – Zero
**O** – One
**M** – Many (or more complex)
**B** – Boundary behaviors
**I** – Interface definition
**E** – Exercise exceptional behavior
**S** – Simple scenarios, simple solutions

In the first three articles in this series, I demonstrated the first five **ZOMBIES** principles. The first article [implemented **Z**ero][2], which provides the simplest possible path through your code. The second article performed [tests with **O**ne and **M**any][3] samples, and the third article looked at [**B**oundaries and **I**nterfaces][4]. In this article, I'll take a look at the penultimate letter in our acronym: **E**, which stands for "exercise exceptional behavior."

### Exceptional behavior in action

When you write an app like the e-commerce tool in this example, you need to contact product owners or business sponsors to learn if there are any specific business policy rules that need to be implemented.

Sure enough, as with any e-commerce operation, you want to put business policy rules in place to entice customers to keep buying. Suppose a business policy rule has been communicated that any order with a grand total greater than $500 gets a percentage discount.

OK, time to roll up your sleeves and craft the executable expectation for this business policy rule:


```
[Fact]
public void Add2ItemsTotal600GrandTotal540() {
        var expectedGrandTotal = 540.00;
        var actualGrandTotal = 0.00;
        Assert.Equal(expectedGrandTotal, actualGrandTotal);
}
```

The confirmation example that encodes the business policy rule states that if the order total is $600.00, the `shoppingAPI` will calculate the grand total to discount it to $540.00. The script above fakes the expectation just to see it fail. Now, make it pass:


```
[Fact]
public void Add2ItemsTotal600GrandTotal540() {
        var expectedGrandTotal = 540.00;
        Hashtable item = [new][5] Hashtable();
        item.Add("00000001", 200.00);
        shoppingAPI.AddItem(item);
        Hashtable item2 = [new][5] Hashtable();
        item2.Add("00000002", 400.00);
        shoppingAPI.AddItem(item2);
        var actualGrandTotal = shoppingAPI.CalculateGrandTotal();
        Assert.Equal(expectedGrandTotal, actualGrandTotal);
}
```

In the confirmation example, you are adding one item priced at $200 and another item priced at $400 for a total of $600 for the order. When you call the `CalculateGrandTotal()` method, you expect to get a total of $540.

Will this microtest pass?


```
[xUnit.net 00:00:00.57] tests.UnitTest1.Add2ItemsTotal600GrandTotal540 [FAIL]
  X tests.UnitTest1.Add2ItemsTotal600GrandTotal540 [2ms]
  Error Message:
   Assert.Equal() Failure
Expected: 540
Actual: 600
[...]
```

Well, it fails miserably. You were expecting $540, but the system calculates $600. Why the error? It's because you haven't taught the system how to calculate the discount on order totals larger than $500 and then subtract that discount from the grand total.

Implement that processing logic. Judging from the confirmation example above, when the order total is $600.00 (which is greater than the business rule threshold of an order totaling $500), the expected grand total is $540. This means the system needs to subtract $60 from the grand total. And $60 is precisely 10% of $600. So the business policy rule that deals with discounts expects a 10% discount on all order totals greater than $500.

Implement this processing logic in the `ShippingAPI` class:


```
private double Calculate10PercentDiscount(double total) {
        double discount = 0.00;
        if(total > 500.00) {
                discount = (total/100) * 10;
        }
        return discount;
}
```

First, check to see if the order total is greater than $500. If it is, then calculate 10% of the order total.

You also need to teach the system how to subtract the calculated 10% from the order grand total. That's a very straightforward change:


```
`return grandTotal - Calculate10PercentDiscount(grandTotal);`
```

Now all tests pass, and you're again enjoying steady success. Your script **Exercises exceptional behavior** to implement the required business policy rules.

### One more to go

I've taken us to **ZOMBIE** now, so there's just **S** remaining. I'll cover that in the exciting series finale.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/exceptional-behavior

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team_dev_email_chat_video_work_wfm_desk_520.png?itok=6YtME4Hj (Working on a team, busy worklife)
[2]: https://opensource.com/article/21/1/zombies-zero
[3]: https://opensource.com/article/21/1/zombies-2-one-many
[4]: https://opensource.com/article/21/1/zombies-3-boundaries-interface
[5]: http://www.google.com/search?q=new+msdn.microsoft.com
