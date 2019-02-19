[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Drinking coffee with AWK)
[#]: via: (https://opensource.com/article/19/2/drinking-coffee-awk)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Drinking coffee with AWK
======
Keep track of what your office mates owe for the coffee they drink with a simple AWK program.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o)

The following is based on a true story, although some names and details have been changed.

> A long time ago, in a place far away, there was an office. The office did not, for various reasons, buy instant coffee. Some workers in that office got together and decided to institute the "Coffee Corner."
>
> A member of the Coffee Corner would buy some instant coffee, and the other members would pay them back. It came to pass that some people drank more coffee than others, so the level of a "half-member" was added: a half-member was allowed a limited number of coffees per week and would pay half of what a member paid.

Managing this was a huge pain. I had just read The Unix Programming Environment and wanted to practice my [AWK][1] programming. So I volunteered to create a system.

Step 1: I kept a database of members and their debt to the Coffee Corner. I did it in an AWK-friendly format, where fields are separated by colons:

```
member:john:1:22
member:jane:0.5:33
member:pratyush:0.5:17
member:jing:1:27
```

The first field above identifies what kind of row this is (member). The second field is the member's name (i.e., their email username without the @). The next field is their membership level (full=1 or half=0.5). The last field is their debt to the Coffee Corner. A positive number means they owe money, a negative number means the Coffee Corner owes them.

Step 2: I kept a log of inputs to and outputs from the Coffee Corner:

```
payment:jane:33
payment:pratyush:17
bought:john:60
payback:john:50
```

Jane paid $33, Pratyush paid $17, John bought $60 worth of coffee, and the Coffee Corner paid John $50.

Step 3: I was ready to write some code. The code would process the members and payments and spit out an updated members file with the new debts.

```
#!/usr/bin/env --split-string=awk -F: -f
```

**#!** ) line required some work! I used the **env** command to allow passing multiple arguments from the shebang: specifically, the **-F** command-line argument to AWK tells it what the field separator is.

The shebang () line required some work! I used thecommand to allow passing multiple arguments from the shebang: specifically, thecommand-line argument to AWK tells it what the field separator is.

An AWK program is a sequence of rules. (It can also contain function definitions, but I don't need any for the Coffee Corner.)

The first rule reads the members file. When I run the command, I always give it the members file first, and the payments file second. It uses AWK associative arrays to record membership levels in the **members** array and current debt in the **debt** array.

```
$1 == "member" {
   members[$2]=$3
   debt[$2]=$4
   total_members += $3
}
```

The second rule reduces the debt when a **payment** is recorded.

```
$1 == "payment" {
   debt[$2] -= $3
}
```

**Payback** is the opposite: it increases the debt. This elegantly supports the case of accidentally giving someone too much money.

```
$1 == "payback" {
   debt[$2] += $3
}
```

The most complicated part happens when someone buys ( **"bought"** ) instant coffee for the Coffee Club's use. It is treated as a payment and the person's debt is reduced by the appropriate amount. Next, it calculates the per-member fee. It iterates over all members and increases their debt, according to their level of membership.

```
$1 == "bought" {
   debt[$2] -= $3
   per_member = $3/total_members
   for (x in members) {
       debt[x] += per_member * members[x]
   }
}
```

The **END** pattern is special: it happens exactly once, when AWK has no more lines to process. At this point, it spits out the new members file with updated debt levels.

```
END {

   for (x in members) {

       printf "%s:%s:%s\n", x, members[x], debt[x]

   }

}
```

Along with a script that iterates over the members and sends a reminder email to people to pay their dues (for positive debts), this system managed the Coffee Corner for quite a while.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/drinking-coffee-awk

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/AWK
