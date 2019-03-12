[#]: collector: (lujun9972)
[#]: translator: (qhwdw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10551-1.html)
[#]: subject: (Computer Laboratory – Raspberry Pi: Lesson 7 Screen02)
[#]: via: (https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/screen02.html)
[#]: author: (Alex Chadwick https://www.cl.cam.ac.uk)

计算机实验室之树莓派：课程 7 屏幕02
======

屏幕02 课程在屏幕01 的基础上构建，它教你如何绘制线和一个生成伪随机数的小特性。假设你已经有了 [课程 6：屏幕01][1] 的操作系统代码，我们将以它为基础来构建。

### 1、点

现在，我们的屏幕已经正常工作了，现在开始去创建一个更实用的图像，是水到渠成的事。如果我们能够绘制出更实用的图形那就更好了。如果我们能够在屏幕上的两点之间绘制一条线，那我们就能够组合这些线绘制出更复杂的图形了。

我们将尝试用汇编代码去实现它，但在开始时，我们确实需要使用一些其它的函数去辅助。我们需要一个这样的函数，我将调用 `SetPixel` 去修改指定像素的颜色，而在寄存器 `r0` 和 `r1` 中提供输入。如果我们写出的代码可以在任意内存中而不仅仅是屏幕上绘制图形，这将在以后非常有用，因此，我们首先需要一些控制真实绘制位置的方法。我认为实现上述目标的最好方法是，能够有一个内存片段用于保存将要绘制的图形。我应该最终得到的是一个存储地址，它通常指向到自上次的帧缓存结构上。我们将一直在我们的代码中使用这个绘制方法。这样，如果我们想在我们的操作系统的另一部分绘制一个不同的图像，我们就可以生成一个不同结构的地址值，而使用的是完全相同的代码。为简单起见，我们将使用另一个数据片段去控制我们绘制的颜色。

> 为了绘制出更复杂的图形，一些方法使用一个着色函数而不是一个颜色去绘制。每个点都能够调用着色函数来确定在那里用什么颜色去绘制。

复制下列代码到一个名为 `drawing.s` 的新文件中。

```assembly
.section .data
.align 1
foreColour:
.hword 0xFFFF

.align 2
graphicsAddress:
.int 0

.section .text
.globl SetForeColour
SetForeColour:
cmp r0,#0x10000
movhs pc,lr
ldr r1,=foreColour
strh r0,[r1]
mov pc,lr

.globl SetGraphicsAddress
SetGraphicsAddress:
ldr r1,=graphicsAddress
str r0,[r1]
mov pc,lr
```

这段代码就是我上面所说的一对函数以及它们的数据。我们将在 `main.s` 中使用它们，在绘制图像之前去控制在何处绘制什么内容。

我们的下一个任务是去实现一个 `SetPixel` 方法。它需要带两个参数，像素的 x 和 y 轴，并且它应该要使用 `graphicsAddress` 和 `foreColour`，我们只定义精确控制在哪里绘制什么图像即可。如果你认为你能立即实现这些，那么去动手实现吧，如果不能，按照我们提供的步骤，按示例去实现它。

> 构建一个通用方法，比如 `SetPixel`，我们将在它之上构建另一个方法是一个很好的想法。但我们必须要确保这个方法很快，因为我们要经常使用它。

  1. 加载 `graphicsAddress`。
  2. 检查像素的 x 和 y 轴是否小于宽度和高度。
  3. 计算要写入的像素地址（提示：`frameBufferAddress +（x + y * 宽度）* 像素大小`）
  4. 加载 `foreColour`。
  5. 保存到地址。

上述步骤实现如下：

1、加载 `graphicsAddress`。

```assembly
.globl DrawPixel
DrawPixel:
px .req r0
py .req r1
addr .req r2
ldr addr,=graphicsAddress
ldr addr,[addr]
```

2、记住，宽度和高度被各自保存在帧缓冲偏移量的 0 和 4 处。如有必要可以参考 `frameBuffer.s`。

```assembly
height .req r3
ldr height,[addr,#4]
sub height,#1
cmp py,height
movhi pc,lr
.unreq height

width .req r3
ldr width,[addr,#0]
sub width,#1
cmp px,width
movhi pc,lr
```

3、确实，这段代码是专用于高色值帧缓存的，因为我使用一个逻辑左移操作去计算地址。你可能希望去编写一个不需要专用的高色值帧缓冲的函数版本，记得去更新 `SetForeColour` 的代码。它实现起来可能更复杂一些。

```assembly
ldr addr,[addr,#32]
add width,#1
mla px,py,width,px
.unreq width
.unreq py
add addr, px,lsl #1
.unreq px
```

> `mla dst,reg1,reg2,reg3` 将寄存器 `reg1` 和 `reg2` 中的值相乘，然后将结果与寄存器 `reg3` 中的值相加，并将结果的低 32 位保存到 `dst` 中。

4、这是专用于高色值的。
 
```assembly
fore .req r3
ldr fore,=foreColour
ldrh fore,[fore]
```

5、这是专用于高色值的。

```assembly
strh fore,[addr]
.unreq fore
.unreq addr
mov pc,lr
```

### 2、线

问题是，线的绘制并不是你所想像的那么简单。到目前为止，你必须认识到，编写一个操作系统时，几乎所有的事情都必须我们自己去做，绘制线条也不例外。我建议你们花点时间想想如何在任意两点之间绘制一条线。

我估计大多数的策略可能是去计算线的梯度，并沿着它来绘制。这看上去似乎很完美，但它事实上是个很糟糕的主意。主要问题是它涉及到除法，我们知道在汇编中，做除法很不容易，并且还要始终记录小数，这也很困难。事实上，在这里，有一个叫布鲁塞姆的算法，它非常适合汇编代码，因为它只使用加法、减法和位移运算。

> 在我们日常编程中，我们对像除法这样的运算通常懒得去优化。但是操作系统不同，它必须高效，因此我们要始终专注于如何让事情做的尽可能更好。

.

> 我们从定义一个简单的直线绘制算法开始，代码如下：
>
> ```matlab
> /* 我们希望从 (x0,y0) 到 (x1,y1) 去绘制一条线，只使用一个函数 setPixel(x,y)，它的功能是在给定的 (x,y) 上绘制一个点。 */
> 
> if x1 > x0 then
> 
> set deltax to x1 - x0
> set stepx to +1
> 
> otherwise
> 
> set deltax to x0 - x1
> set stepx to -1
> 
> end if
> 
> if y1 > y0 then
> 
> set deltay to y1 - y0
> set stepy to +1
> 
> otherwise
> 
> set deltay to y0 - y1
> set stepy to -1
> 
> end if
> 
> if deltax > deltay then
> 
> set error to 0
> until x0 = x1 + stepx
> 
> setPixel(x0, y0)
> set error to error + deltax ÷ deltay
> if error ≥ 0.5 then
> 
> set y0 to y0 + stepy
> set error to error - 1
> 
> end if
> set x0 to x0 + stepx
> 
> repeat
> 
> otherwise
> 
> end if
> ```
>
> 这个算法用来表示你可能想像到的那些东西。变量 `error` 用来记录你离实线的距离。沿着 x 轴每走一步，这个 `error` 的值都会增加，而沿着 y 轴每走一步，这个 `error` 值就会减  1 个单位。`error` 是用于测量距离 y 轴的距离。
>
> 虽然这个算法是有效的，但它存在一个重要的问题，很明显，我们使用了小数去保存 `error`，并且也使用了除法。所以，一个立即要做的优化将是去改变 `error` 的单位。这里并不需要用特定的单位去保存它，只要我们每次使用它时都按相同数量去伸缩即可。所以，我们可以重写这个算法，通过在所有涉及 `error` 的等式上都简单地乘以 `deltay`，从面让它简化。下面只展示主要的循环：
>
> ```matlab
> set error to 0 × deltay
> until x0 = x1 + stepx
> 
> setPixel(x0, y0)
> set error to error + deltax ÷ deltay × deltay
> if error ≥ 0.5 × deltay then
> 
> set y0 to y0 + stepy
> set error to error - 1 × deltay
> 
> end if
> set x0 to x0 + stepx
> 
> repeat
> ```
>
> 它将简化为：
>
> ```matlab
> cset error to 0
> until x0 = x1 + stepx
> 
> setPixel(x0, y0)
> set error to error + deltax
> if error × 2 ≥ deltay then
> 
> set y0 to y0 + stepy
> set error to error - deltay
> 
> end if
> set x0 to x0 + stepx
> 
> repeat
> ```
>
> 突然，我们有了一个更好的算法。现在，我们看一下如何完全去除所需要的除法运算。最好保留唯一的被 2 相乘的乘法运算，我们知道它可以通过左移 1 位来实现！现在，这是非常接近布鲁塞姆算法的，但还可以进一步优化它。现在，我们有一个 `if` 语句，它将导致产生两个代码块，其中一个用于 x 差异较大的线，另一个用于 y 差异较大的线。对于这两种类型的线，如果审查代码能够将它们转换成一个单语句，还是很值得去做的。
>
> 困难之处在于，在第一种情况下，`error` 是与 y 一起变化，而第二种情况下 `error` 是与 x 一起变化。解决方案是在一个变量中同时记录它们，使用负的 `error` 去表示 x 中的一个 `error`，而用正的 `error` 表示它是 y 中的。
>
> ```matlab
> set error to deltax - deltay
> until x0 = x1 + stepx or y0 = y1 + stepy
> 
> setPixel(x0, y0)
> if error × 2 > -deltay then
> 
> set x0 to x0 + stepx
> set error to error - deltay
> 
> end if
> if error × 2 < deltax then
> 
> set y0 to y0 + stepy
> set error to error + deltax
> 
> end if
> 
> repeat
> ```
>
> 你可能需要一些时间来搞明白它。在每一步中，我们都认为它正确地在 x 和 y 中移动。我们通过检查来做到这一点，如果我们在 x 或 y 轴上移动，`error` 的数量会变低，那么我们就继续这样移动。
>

.

> 布鲁塞姆算法是在 1962 年由 Jack Elton Bresenham 开发，当时他 24 岁，正在攻读博士学位。

用于画线的布鲁塞姆算法可以通过以下的伪代码来描述。以下伪代码是文本，它只是看起来有点像是计算机指令而已，但它却能让程序员实实在在地理解算法，而不是为机器可读。

```matlab
/* 我们希望从 (x0,y0) 到 (x1,y1) 去绘制一条线，只使用一个函数 setPixel(x,y)，它的功能是在给定的 (x,y) 上绘制一个点。 */

if x1 > x0 then
    set deltax to x1 - x0
    set stepx to +1
otherwise
    set deltax to x0 - x1
    set stepx to -1
end if

set error to deltax - deltay
until x0 = x1 + stepx or y0 = y1 + stepy
    setPixel(x0, y0)
    if error × 2 ≥ -deltay then
        set x0 to x0 + stepx
        set error to error - deltay
    end if
    if error × 2 ≤ deltax then
        set y0 to y0 + stepy
        set error to error + deltax
    end if
repeat
```

与我们目前所使用的编号列表不同，这个算法的表示方式更常用。看看你能否自己实现它。我在下面提供了我的实现作为参考。

```assembly
.globl DrawLine
DrawLine:
push {r4,r5,r6,r7,r8,r9,r10,r11,r12,lr}
x0 .req r9
x1 .req r10
y0 .req r11
y1 .req r12

mov x0,r0
mov x1,r2
mov y0,r1
mov y1,r3

dx .req r4
dyn .req r5  /* 注意，我们只使用 -deltay，因此为了速度，我保存它的负值。（因此命名为 dyn）*/
sx .req r6
sy .req r7
err .req r8

cmp x0,x1
subgt dx,x0,x1
movgt sx,#-1
suble dx,x1,x0
movle sx,#1

cmp y0,y1
subgt dyn,y1,y0
movgt sy,#-1
suble dyn,y0,y1
movle sy,#1

add err,dx,dyn
add x1,sx
add y1,sy

pixelLoop$:

    teq x0,x1
    teqne y0,y1
    popeq {r4,r5,r6,r7,r8,r9,r10,r11,r12,pc}
    
    mov r0,x0
    mov r1,y0
    bl DrawPixel
    
    cmp dyn, err,lsl #1
    addle err,dyn
    addle x0,sx
    
    cmp dx, err,lsl #1
    addge err,dx
    addge y0,sy
    
    b pixelLoop$

.unreq x0
.unreq x1
.unreq y0
.unreq y1
.unreq dx
.unreq dyn
.unreq sx
.unreq sy
.unreq err
```

### 3、随机性

到目前，我们可以绘制线条了。虽然我们可以使用它来绘制图片及诸如此类的东西（你可以随意去做！），我想应该借此机会引入计算机中随机性的概念。我将这样去做，选择一对随机的坐标，然后从上一对坐标用渐变色绘制一条线到那个点。我这样做纯粹是认为它看起来很漂亮。

那么，总结一下，我们如何才能产生随机数呢？不幸的是，我们并没有产生随机数的一些设备（这种设备很罕见）。因此只能利用我们目前所学过的操作，需要我们以某种方式来发明“随机数”。你很快就会意识到这是不可能的。各种操作总是给出定义好的结果，用相同的寄存器运行相同的指令序列总是给出相同的答案。而我们要做的是推导出一个伪随机序列。这意味着数字在外人看来是随机的，但实际上它是完全确定的。因此，我们需要一个生成随机数的公式。其中有人可能会想到很垃圾的数学运算，比如：4x<sup>2</sup>! / 64，而事实上它产生的是一个低质量的随机数。在这个示例中，如果 x 是 0，那么答案将是 0。看起来很愚蠢，我们需要非常谨慎地选择一个能够产生高质量随机数的方程式。

> 硬件随机数生成器很少用在安全中，因为可预测的随机数序列可能影响某些加密的安全。

我将要教给你的方法叫“二次同余发生器”。这是一个非常好的选择，因为它能够在 5 个指令中实现，并且能够产生一个从 0 到 232-1 之间的看似很随机的数字序列。

不幸的是，对为什么使用如此少的指令能够产生如此长的序列的原因的研究，已经远超出了本课程的教学范围。但我还是鼓励有兴趣的人去研究它。它的全部核心所在就是下面的二次方程，其中 `xn` 是产生的第 `n` 个随机数。

> 这类讨论经常寻求一个问题，那就是我们所谓的随机数到底是什么？通常从统计学的角度来说的随机性是：一组没有明显模式或属性能够概括它的数的序列。

```
x_(n+1) = ax_(n)^2 + bx_(n) + c mod 2^32
```

这个方程受到以下的限制：

  1. a 是偶数
  2. b = a + 1 mod 4
  3. c 是奇数

如果你之前没有见到过 `mod` 运算，我来解释一下，它的意思是被它后面的数相除之后的余数。比如 `b = a + 1 mod 4` 的意思是 `b` 是 `a + 1` 除以 `4` 的余数，因此，如果 `a` 是 12，那么 `b` 将是 `1`，因为 `a + 1` 是 13，而 `13` 除以 4 的结果是 3 余 1。

复制下列代码到名为 `random.s` 的文件中。

```assembly
.globl Random
Random:
xnm .req r0
a .req r1

mov a,#0xef00
mul a,xnm
mul a,xnm
add a,xnm
.unreq xnm
add r0,a,#73

.unreq a
mov pc,lr
```

这是随机函数的一个实现，使用一个在寄存器 `r0` 中最后生成的值作为输入，而接下来的数字则是输出。在我的案例中，我使用 a = EF00<sub>16</sub>，b = 1, c = 73。这个选择是随意的，但是需要满足上述的限制。你可以使用任何数字代替它们，只要符合上述的规则就行。

### 4、Pi-casso

OK，现在我们有了所有我们需要的函数，我们来试用一下它们。获取帧缓冲信息的地址之后，按如下的要求修改 `main`：

  1. 使用包含了帧缓冲信息地址的寄存器 `r0` 调用 `SetGraphicsAddress`。
  2. 设置四个寄存器为 0。一个将是最后的随机数，一个将是颜色，一个将是最后的 x 坐标，而最后一个将是最后的 y 坐标。
  3. 调用 `random` 去产生下一个 x 坐标，使用最后一个随机数作为输入。
  4. 调用 `random` 再次去生成下一个 y 坐标，使用你生成的 x 坐标作为输入。
  5. 更新最后的随机数为 y 坐标。
  6. 使用 `colour` 值调用 `SetForeColour`，接着增加 `colour` 值。如果它大于 FFFF~16~，确保它返回为 0。
  7. 我们生成的 x 和 y 坐标将介于 0 到 FFFFFFFF<sub>16</sub>。通过将它们逻辑右移 22 位，将它们转换为介于 0 到 1023<sub>10</sub> 之间的数。
  8. 检查 y 坐标是否在屏幕上。验证 y 坐标是否介于 0 到 767<sub>10</sub> 之间。如果不在这个区间，返回到第 3 步。
  9. 从最后的 x 坐标和 y 坐标到当前的 x 坐标和 y 坐标之间绘制一条线。
  10. 更新最后的 x 和 y 坐标去为当前的坐标。
  11. 返回到第 3 步。

一如既往，你可以在下载页面上找到这个解决方案。

在你完成之后，在树莓派上做测试。你应该会看到一系列颜色递增的随机线条以非常快的速度出现在屏幕上。它一直持续下去。如果你的代码不能正常工作，请查看我们的排错页面。

如果一切顺利，恭喜你！我们现在已经学习了有意义的图形和随机数。我鼓励你去使用它绘制线条，因为它能够用于渲染你想要的任何东西，你可以去探索更复杂的图案了。它们中的大多数都可以由线条生成，但这需要更好的策略？如果你愿意写一个画线程序，尝试使用 `SetPixel` 函数。如果不是去设置像素值而是一点点地增加它，会发生什么情况？你可以用它产生什么样的图案？在下一节课 [课程 8：屏幕 03][2] 中，我们将学习绘制文本的宝贵技能。

--------------------------------------------------------------------------------

via: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/screen02.html

作者：[Alex Chadwick][a]
选题：[lujun9972][b]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.cl.cam.ac.uk
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10540-1.html
[2]: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/screen03.html
