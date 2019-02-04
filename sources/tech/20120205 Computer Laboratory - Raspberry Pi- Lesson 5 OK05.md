[#]: collector: (lujun9972)
[#]: translator: (oska874)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Computer Laboratory – Raspberry Pi: Lesson 5 OK05)
[#]: via: (https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/ok05.html)
[#]: author: (Robert Mullins http://www.cl.cam.ac.uk/~rdm34)

translating by ezio

树莓派计算机实验室 课程 5 OK05
======

The OK05 lesson builds on OK04 using it to flash the SOS Morse Code pattern (...---...). It is assumed you have the code for the [Lesson 4: OK04][1] operating system as a basis.

OK05 课程构建于课程 OK04 的基础，使用更多代码方式烧写 SOS(...---...)。这假设你已经有了 [课程 4: OK04][1] 操作系统的代码基础。

### 1 数据

So far, all we've had to do with our operating system is provide instructions to be followed. Sometimes however, instructions are only half the story. Our operating systems may need data.
到目前为止，我们与操作系统有关的所有内容都提供了遵循的说明。然而有时候，说明只是一半。我们的操作系统可能需要数据

> Some early Operating Systems did only allow certain types of data in certain files, but this was generally found to be too restrictive. The modern way does make programs a lot more complicated however.
> 一些早期的操作系统确实只允许特定文件中的特定类型的数据，但是这通常被认为太严格了。现代方法确实使程序变得复杂的多。


In general data is just values that are important. You are probably trained to think of data as being of a specific type, e.g. a text file contains text, an image file contains an image, etc. This is, in truth, just an idea. All data on a computer is just binary numbers, how we choose to interpret them is what counts. In this example we're going to store a light flashing sequence as data.

At the end of 'main.s' copy the following code:

通常，只是数据的值很重要。你可能经过训练，认为数据是指定类型，比如，一个文本文件包含文章，一个图像文件包含一幅图片，等等。说实话，这只是一个理想罢了。计算机上的全部数据都是二进制数字，重要的是我们选择用什么来解释这些数据。在这个例子中，我们会将一个闪灯序列（译注：跑马灯程序？）作为数据保存下来。

在 `main.s` 结束处复制下面的代码：

```
.section .data
.align 2
pattern:
.int 0b11111111101010100010001000101010
```


>`.align num` 保证下一行代码的地址是 `2^num` 的整数倍。

>`.int val` 输出数值 `val`。

To differentiate between data and code, we put all the data in the .data. I've included this on the operating system memory layout diagram here. I've just chosen to put the data after the end of the code. The reason for keeping our data and instructions separate is so that if we eventually implement some security on our operating system, we need to know what parts of the code can be executed, and what parts can't.
要区分数据和代码，我们将数据都放在 `.data` 区域。我已经将该区域包含在操作系统的内存布局图。我已经选择将数据放到代码后面。将我们的指令和数据分开保存的原因是，如果最后我们在自己的操作系统上实现一些安全措施，我们就需要知道代码的那些部分是可以执行的，而那些部分是不行的。

I've used two new commands here. .align and .int. .align ensures alignment of the following data to a specified power of 2. In this case I've used .align 2 which means that this data will definitely be placed at an address which is a multiple of 22 = 4. It is really important to do this, because the ldr instruction we used to read memory only works at addresses that are multiples of 4.

我在这里使用了两个新命令 `.align` 和 `.int`。`.align` 保证下来的数据是按照 2 的乘方对齐的。在这个里，我使用 `.align 2` ，意味着数据最终存放的地址是 `2^2=4` 的整数倍。这个操作是很重要的，因为我们用来读取内寸的指令 `ldr` 要求内存地址是 4 的倍数。

The .int command copies the constant after it into the output directly. That means that 111111111010101000100010001010102 will be placed into the output, and so the label pattern actually labels this piece of data as pattern.

命令 `.int` 直接复制它后面的常量到输出。这意味着 `11111111101010100010001000101010`(二进制数) 将会被存放到输出，所以标签模式实际将标记这段数据作为模式。

> One challenge with data is finding an efficient and useful representation. This method of storing the sequence as on and off units of time is easy to run, but would be difficult to edit, as the concept of a Morse - or . is lost.
> 对数据的一个挑战是寻找一个高效和有用的展示形式。保存序列？？？？？

As I mentioned, data can mean whatever you want. In this case I've encoded the Morse Code SOS sequence, which is ...---... for those unfamiliar. I've used a 0 to represent a unit of time with the LED off, and a 1 to represent a unit of time with the LED on. That way, we can write some code which just displays a sequence in data like this one, and then all we have to do to make it display a different sequence is change the data. This is a very simple example of what operating systems must do all the time; interpret and display data.

Copy the following lines before the loop$ label in 'main.s'.

如我提到的，数据可以意味这你想要的所有东西。在这里我编码了摩尔斯代码 SOS 序列，对于不熟悉的人，就是 `...---...`。我使用 0 表示一个时间单元的 LED 灭灯，而 1 表示一个时间单元的 LED 亮。

```
ptrn .req r4
ldr ptrn,=pattern
ldr ptrn,[ptrn]
seq .req r5
mov seq,#0
```

This code loads the pattern into r4, and loads 0 into r5. r5 will be our sequence position, so we can keep track of how much of the pattern we have displayed.

The following code puts a non-zero into r1 if and only if there is a 1 in the current part of the pattern.

```
mov r1,#1
lsl r1,seq
and r1,ptrn
```

This code is useful for your calls to SetGpio, which must have a non-zero value to turn the LED off, and a value of zero to turn the LED on.

Now modify all of your code in 'main.s' so that each loop the code sets the LED based on the current sequence number, waits for 250000 micro seconds (or any other appropriate delay), and then increments the sequence number. When the sequence number reaches 32, it needs to go back to 0. See if you can implement this, and for an extra challenge, try to do it using only 1 instruction (solution in the download).

### 2 Time Flies When You're Having Fun...

You're now ready to test this on the Raspberry Pi. It should flash out a sequence of 3 short pulses, 3 long pulses and then 3 more short pulses. After a delay, the pattern should repeat. If it doesn't work please see our troubleshooting page.

Once it works, congratulations you have reached the end of the OK series of tutorials.

In this series we've learnt about assembly code, the GPIO controller and the System Timer. We've learnt about functions and the ABI, as well as several basic Operating System concepts, and also about data.

You're now ready to move onto one of the more advanced series.

  * The [Screen][2] series is next and teaches you how to use the screen with assembly code.
  * The [Input][3] series teaches you how to use the keyboard and mouse.



By now you already have enough information to make Operating Systems that interact with the GPIO in other ways. If you have any robot kits, you may want to try writing a robot operating system controlled with the GPIO pins!

--------------------------------------------------------------------------------

via: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/ok05.html

作者：[Robert Mullins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.cl.cam.ac.uk/~rdm34
[b]: https://github.com/lujun9972
[1]: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/ok04.html
[2]: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/screen01.html
[3]: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/input01.html
