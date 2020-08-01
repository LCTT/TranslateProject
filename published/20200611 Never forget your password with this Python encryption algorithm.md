[#]: collector: (lujun9972)
[#]: translator: (silentdawn-zz)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12474-1.html)
[#]: subject: (Never forget your password with this Python encryption algorithm)
[#]: via: (https://opensource.com/article/20/6/python-passwords)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

国王的秘密：如何保护你的主密码
======

> 这种使用 Python 和 Shamir 秘密共享的独特算法可以保护你的主密码，可以有效避免黑客窃取和自己不经意忘记引发的风险和不便。

![](https://img.linux.net.cn/data/attachment/album/202008/01/105831kzxididbld8kdhdb.jpg)

很多人使用密码管理器来保密存储自己在用的各种密码。密码管理器的关键环节之一是主密码，主密码保护着所有其它密码。这种情况下，主密码本身就是风险所在。任何知道你的主密码的人，都可以视你的密码保护若无物，畅行无阻。自然而然，为了保证主密码的安全性，你会选用很难想到的密码，把它牢记在脑子里，并做[所有其他][2]你应该做的事情。

但是万一主密码泄露了或者忘记了，后果是什么？也许你去了个心仪的岛上旅行上个把月，没有现代技术覆盖，在开心戏水之后享用美味菠萝的时刻，突然记不清自己的密码是什么了。是“山巅一寺一壶酒”？还是“一去二三里，烟村四五家”？反正当时选密码的时候感觉浑身都是机灵，现在则后悔当初何必作茧自缚。

![XKCD comic on password strength][3]

*（[XKCD][4], [CC BY-NC 2.5][5]）*

当然，你不会把自己的主密码告诉其它任何人，因为这是密码管理的首要原则。有没有其它变通的办法，免除这种难以承受的密码之重？

试试 <ruby>[Shamir 秘密共享算法][6]<rt>Shamir's Secret Sharing</rt></ruby>，这是一种可以将保密内容进行分块保存，且只能将片段拼合才能恢复保密内容的算法。

先分别通过一个古代的和一个现代的故事，看看 Shamir 秘密共享算法究竟是怎么回事吧。

这些故事的隐含前提是你对密码学有起码的了解，必要的话，你可以先温习一下 [密码学与公钥基础设施引论][7].

### 一个古代关于加解密的故事

古代某国，国王有个大秘密，很大很大的秘密：

```
def int_from_bytes(s):
    acc = 0
    for b in s:
        acc = acc * 256
        acc += b
    return acc

secret = int_from_bytes("terrible secret".encode("utf-8"))
```

大到连他自己的孩子都不能轻易信任。他有五个子女，但他知道前路危机重重。他的孩子需要在他百年之后用这个秘密来保卫国家，而国王又不能忍受自己的孩子在他们还记得自己的时候就知道这些秘密，尤其是这种状态可能要持续几十年。

所以，国王动用大力魔术，将这个秘密分为了五个部分。他知道，可能有一两个孩子不会遵从他的遗嘱，但绝对不会同时有三个或三个以上会这样：

```
from mod import Mod
from os import urandom
```

国王精通 [有限域][8] 和 *随机* 魔法，当然，对他来说，使用巨蟒分割这个秘密也是小菜一碟。

第一步是选择一个大质数——第 13 个 [梅森质数][9]（`2**521 - 1`），他让人把这个数铸造在巨鼎上，摆放在大殿上：

```
P = 2**521 - 1
```

但这不是要保密的秘密：这只是 *公开数据*。

国王知道，如果 `P` 是一个质数，用 `P` 对数字取模，就形成了一个数学 [场][10]：在场中可以自由进行加、减、乘、除运算。当然，做除法运算时，除数不能为 0。

国王日理万机，方便起见，他在做模运算时使用了 PyPI 中的 [mod][11] 模块，这个模块实现了各种模数运算算法。

他确认过，自己的秘密比 `P` 要短：

```
secret < P
```
```
TRUE
```

将秘密转换为 `P` 的模，`mod P`：

```
secret = mod.Mod(secret, P)
```

为了使任意三个孩子掌握的片段就可以重建这个秘密，他还得生成另外两个部分，并混杂到一起：

```
polynomial = [secret]
for i in range(2):
    polynomial.append(Mod(int_from_bytes(urandom(16)), P))
len(polynomial)
```
```
3
```

下一步就是在随机选择的点上计算某 [多项式][12] 的值，即计算 `polynomial[0] + polynomial[1]*x + polynomial[2]*x**2 ...`。

虽然有第三方模块可以计算多项式的值，但那并不是针对有限域内的运算的，所以，国王还得亲自操刀，写出计算多项式的代码：

```
def evaluate(coefficients, x):
    acc = 0
    power = 1
    for c in coefficients:
        acc += c * power
        power *= x
    return acc
```

再下一步，国王选择五个不同的点，计算多项式的值，并分别交给五个孩子，让他们各自保存一份：

```
shards = {}
for i in range(5):
    x = Mod(int_from_bytes(urandom(16)), P)
    y = evaluate(polynomial, x)
    shards[i] = (x, y)
```

正如国王所虑，不是每个孩子都正直守信。其中有两个孩子，在他尸骨未寒的时候，就想从自己掌握的秘密片段中窥出些什么，但穷极所能，终无所获。另外三个孩子听说了这个事，合力将这两人永远驱逐：

```
del shards[2]
del shards[3]
```

二十年弹指一挥间，奉先王遗命，三个孩子将合力恢复出先王的大秘密。他们将各自的秘密片段拼合在一起：

```
retrieved = list(shards.values())
```

然后是 40 天没日没夜的苦干。这是个大工程，他们虽然都懂些 Python，但都不如前国王精通。

最终，揭示秘密的时刻到了。

用于反算秘密的代码基于 [拉格朗日差值][13]，它利用多项式在 `n` 个非 0 位置的值，来计算其在 `0` 处的值。前面的 `n` 指的是多项式的阶数。这个过程的原理是，可以为一个多项式找到一个显示方程，使其满足：其在 `t[0]` 处的值是 `1`，在 `i` 不为 `0` 的时候，其在 `t[i]` 处的值是 `0`。因多项式值的计算属于线性运算，需要计算 *这些* 多项式各自的值，并使用多项式的值进行插值：

```
from functools import reduce
from operator import mul

def retrieve_original(secrets):
    x_s = [s[0] for s in secrets]
    acc = Mod(0, P)
    for i in range(len(secrets)):
        others = list(x_s)
        cur = others.pop(i)
        factor = Mod(1, P)
        for el in others:
            factor *= el * (el - cur).inverse()
        acc += factor * secrets[i][1]
    return acc
```

这代码是在太复杂了，40 天能算出结果已经够快了。雪上加霜的是，他们只能利用五个秘密片段中的三个来完成这个运算，这让他们万分紧张：

```
retrieved_secret = retrieve_original(retrieved)
```

后事如何？

```
retrieved_secret == secret
```
```
TRUE
```

数学这个魔术的优美之处就在于它每一次都是那么靠谱，无一例外。国王的孩子们，曾经的孩童，而今已是壮年，足以理解先王的初衷，并以先王的锦囊妙计保卫了国家，并继之以繁荣昌盛！

### 关于 Shamir 秘密共享算法的现代故事

现代，很多人都对类似的大秘密苦不堪言：密码管理器的主密码！几乎没有谁能有足够信任的人去完全托付自己最深的秘密，好消息是，找到至少有三个不会串通起来搞鬼的五人组不是个太困难的事。

同样是在现代，比较幸运的是，我们不必再像国王那样自己动手分割要守护的秘密。拜现代 *开源* 技术所赐，这都可以使用现成的软件完成。

假设你有五个不敢完全信任，但还可以有点信任的人：张三、李四、王五、赵六和钱大麻子。

安装并运行 `ssss` 分割密钥：

```
$ echo 'long legs travel fast' | ssss-split -t 3 -n 5
Generating shares using a (3,5) scheme with dynamic security level.
Enter the secret, at most 128 ASCII characters: Using a 168 bit security level.
1-797842b76d80771f04972feb31c66f3927e7183609
2-947925f2fbc23dc9bca950ef613da7a4e42dc1c296
3-14647bdfc4e6596e0dbb0aa6ab839b195c9d15906d
4-97c77a805cd3d3a30bff7841f3158ea841cd41a611
5-17da24ad63f7b704baed220839abb215f97d95f4f8
```

这确实是个非常牛的主密码：`long legs travel fast`，绝不能把它完整的托付给任何人！那就把五个片段分别交给还比较可靠的伙伴，张三、李四、王五、赵六和钱大麻子。

  * 把 `1` 给张三。
  * 把 `2` 给李四。
  * 把 `3` 给王五。
  * 把 `4` 给赵六。
  * 把 `5` 给钱大麻子。

然后，你开启你的惬意之旅，整整一个月，流连于海边温暖的沙滩，整整一个月，没碰过任何电子设备。没用多久，把自己的主密码忘到了九霄云外。

李四和王五也在和你一起旅行，你托付给他们保管的密钥片段保存的好好的，在他们各自的密码管理器中，但不幸的是，他们和你一样，也忘了自己的 *主密码*。

没关系。

联系张三，他保管的密钥片段是 `1-797842b76d80771f04972feb31c66f3927e7183609`；赵六，一直替你的班，很高兴你能尽快重返岗位，把自己掌握的片段给了你，`4-97c77a805cd3d3a30bff7841f3158ea841cd41a611`；钱大麻子，收到你给的跑腿费才将自己保管的片段翻出来发给你，`5-17da24ad63f7b704baed220839abb215f97d95f4f8`。

有了这三个密钥片段，运行:

```
$ ssss-combine -t 3
Enter 3 shares separated by newlines:
Share [1/3]: 1-797842b76d80771f04972feb31c66f3927e7183609
Share [2/3]: 4-97c77a805cd3d3a30bff7841f3158ea841cd41a611
Share [3/3]: 5-17da24ad63f7b704baed220839abb215f97d95f4f8
Resulting secret: long legs travel fast
```

就这么简单，有了 *开源* 技术加持，你也可以活的像国王一样滋润！

### 自己的安全不是自己一个人的事

密码管理是当今网络生活必备技能，当然要选择复杂的密码，来保证安全性，但这不是全部。来用 Shamir 秘密共享算法，和他人共同安全的存储你的密码吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/python-passwords

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[silentdawn-zz](https://github.com/silentdawn-zz)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_python_programming.png?itok=ynSL8XRV (Searching for code)
[2]: https://monitor.firefox.com/security-tips
[3]: https://opensource.com/sites/default/files/uploads/password_strength-xkcd.png (XKCD comic on password strength)
[4]: https://imgs.xkcd.com/comics/password_strength.png
[5]: https://creativecommons.org/licenses/by-nc/2.5/
[6]: https://en.wikipedia.org/wiki/Secret_sharing#Shamir's_scheme
[7]: https://opensource.com/article/18/5/cryptography-pki
[8]: https://en.wikipedia.org/wiki/Finite_field
[9]: https://en.wikipedia.org/wiki/Mersenne_prime
[10]: https://en.wikipedia.org/wiki/Field_(mathematics)
[11]: https://pypi.org/project/mod/
[12]: https://en.wikipedia.org/wiki/Polynomial
[13]: https://www.math.usm.edu/lambers/mat772/fall10/lecture5.pdf
