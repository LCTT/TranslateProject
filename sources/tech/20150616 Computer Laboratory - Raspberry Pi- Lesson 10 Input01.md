[#]: collector: (lujun9972)
[#]: translator: (ezio )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Computer Laboratory – Raspberry Pi: Lesson 10 Input01)
[#]: via: (https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/input01.html)
[#]: author: (Alex Chadwick https://www.cl.cam.ac.uk)

ezio is translating

计算机实验课 – 树莓派: 课程 10 输入01
======

欢迎进入输入课程系列。在本系列，你将会学会如何使用键盘接收输入给树莓派。我们将会从揭示输入开始本课，然后开始传统的文本命令。

这是第一堂输入课，会教授一些关于驱动和链接的理论，同样也包含键盘的知识，最后以在屏幕上显示文本结束。

### 1 开始

希望你已经完成了 OK 系列课程， 这会对你完成屏幕系列课程很有帮助。很多 OK 课程上的文件会被使用而不会做解释。如果你没有这些文件，或者希望使用一个正确的实现， 可以从该堂课的[下载页][1]下载模板。如果你使用你自己的实现，请删除调用了 `SetGraphicsAddress` 之后全部的代码。

### 2 USB

```
USB 标准的设计目的是通过复杂的硬件来简化硬件。
```

如你所知，树莓派 B 型有两个 USB 接口，通常用来连接一个鼠标和一个键盘。这是一个非常好的设计决策，USB 是一个非常通用的接口， 很多种设备都可以使用它。这就很容易为它设计新外设，很容易为它编写设备驱动， 而且通过 USB 集线器可以非常容易扩展。还能更好吗？当然是不能，实际上对一个操作系统开发者来说，这就是我们的噩梦。USB 标准太大了。 我是真的，在你思考如何连接设备之前，它的文档将近 700 页。

我和很多爱好操作系统的开发者谈过这些，而他们全部都说几句话：不要抱怨。“实现这个需要花费很久时间”，“你不可能写出关于 USB 的教程”，“收益太小了”。在很多方面，他们是对的，我不可能写出一个关于 USB 标准的教程， 那得花费几周时间。我同样不能教授如何为全部所有的设备编写外设驱动，所以使用自己写的驱动是没什么用的。然而，我可以做仅次于最好的事情是获取一个正常工作的 USB 驱动，拿一个键盘驱动，然后教授如何在操作系统中使用它们。我开始寻找可以运行在一个甚至不知道文件是什么的操作系统的自由驱动，但是我一个都找不到。他们都太高层了。所以我尝试写一个。每个人都是对的，这耗费了我几周时间。然而我高兴的说我我做这些工作没有获取操作系统以外的帮助，并且可以和鼠标和键盘通信。这句不是完整的，高效的，或者正确的，但是它能工作。驱动是以 C 编写的，而且有兴趣的可以在下载页找到全部源代码。

所以，这一个教程不会是 USB 标准的课程（一点也没有）。实际上我们将会看到如何使用其他人的代码。

### 3 链接

```
链接允许我们制作可重用的代码库，所有人都可以在他们的程序中使用。
```

既然我们要引进外部代码到操作系统，我们就需要谈一谈链接。链接是一种过程，可以在程序或者操作系统中链接函数。这意味着当一个程序生成之后，我们不必要编写每一个函数（几乎可以肯定，实际上并非如此）。链接就是我们做的用来把我们程序和别人代码中的函数连结在一起。这个实际上已经在我们的操作系统进行了，因为链接器吧所有不同的文件链接在一起，每个都是分开编译的。


```
程序经常知识调用库，这些库会调用其它的库，知道最终调用了我们写的操作系统。
```

有两种链接：静态和动态。静态链接就像我们在制作自己的操作系统时进行的。链接器找到全部函数的地址，然后在链接结束前，将这些地址都写入代码中。动态链接是在程序“完成”之后。当程序加载后，动态链接器检查程序，然后在操作系统的库找到所有不在程序里的函数。这就是我们的操作系统最终应该能够完成的一项工作，但是现在所有东西都将是静态链接的。

我编写的 USB 驱动程序适合静态编译。这意味着我给你我的每个文件的编译后的代码，然后链接器找到你的代码中的那些没有实现的函数，就将这些函数链接到我的代码。在本课的 [下载页][1] 是一个 makefile 和我的 USB 驱动，这是接下来需要的。下载并使用这 makefile 替换你的代码中的 makefile， 同事将驱动放在和这个 makefile 相同的文件夹。

### 4 键盘

为了将输入传给我们的操作系统，我们需要在某种程度上理解键盘是如何实际工作的。键盘有两种按键：普通键和修饰键。普通按键是字母、数字、功能键，等等。他们构成了键盘上几乎每一个按键。修饰键是最多 8 个特殊键。他们是左 shift ， 右 shift， 左 ctrl，右 ctrl，左 alt， 右 alt，左 GUI 和右 GUI。键盘可以检测出所有的组合中那个修饰键被按下了，以及最多 6 个普通键。每次一个按钮变化了（i.e. 是按下了还是释放了），键盘就会报告给电脑。通常，键盘也会有 3 个 LED 灯，分别指示 Caps 锁定，Num 锁定，和 Scroll 锁定，这些都是由电脑控制的，而不是键盘自己。键盘也可能由更多的灯，比如电源、静音，等等。

为了帮助标准 USB 键盘，产生了一个按键值的表，每个键盘按键都一个唯一的数字，每个可能的 LED 也类似。下面的表格列出了前 126 个值。

Table 4.1 USB 键盘值

| 序号 | 描述             | 序号 | 描述          | 序号      | 描述              | 序号  | 描述            |          |
| ------ | ---------------- | ------- | ---------------------- | -------- | -------------- | --------------- | -------------------- |          |
| 4      | a and A                 | 5      | b and B              | 6           | c and C                  | 7       | d and D                |          |
| 8      | e and E                 | 9      | f and F              | 10          | g and G                  | 11      | h and H                |          |
| 12     | i and I                 | 13     | j and J              | 14          | k and K                  | 15      | l and L                |          |
| 16     | m and M                 | 17     | n and N              | 18          | o and O                  | 19      | p and P                |          |
| 20     | q and Q                 | 21     | r and R              | 22          | s and S                  | 23      | t and T                |          |
| 24     | u and U                 | 25     | v and V              | 26          | w and W                  | 27      | x and X                |          |
| 28     | y and Y                 | 29     | z and Z              | 30          | 1 and !                  | 31      | 2 and @                |          |
| 32     | 3 and #                 | 33     | 4 and $              | 34          | 5 and %                  | 35      | 6 and ^                |          |
| 36     | 7 and &                 | 37     | 8 and *              | 38          | 9 and (                  | 39      | 0 and )                |          |
| 40     | Return (Enter)          | 41     | Escape               | 42          | Delete (Backspace)       | 43      | Tab                    |          |
| 44     | Spacebar                | 45     | - and _              | 46          | = and +                  | 47      | [ and {                |          |
| 48     | ] and }                 | 49     | \ and                |             | 50                       | # and ~ | 51                     | ; and :  |
| 52     | ' and "                 | 53     | ` and ~              | 54          | , and <                  | 55      | . and >                |          |
| 56     | / and ?                 | 57     | Caps Lock            | 58          | F1                       | 59      | F2                     |          |
| 60     | F3                      | 61     | F4                   | 62          | F5                       | 63      | F6                     |          |
| 64     | F7                      | 65     | F8                   | 66          | F9                       | 67      | F10                    |          |
| 68     | F11                     | 69     | F12                  | 70          | Print Screen             | 71      | Scroll Lock            |          |
| 72     | Pause                   | 73     | Insert               | 74          | Home                     | 75      | Page Up                |          |
| 76     | Delete forward          | 77     | End                  | 78          | Page Down                | 79      | Right Arrow            |          |
| 80     | Left Arrow              | 81     | Down Arrow           | 82          | Up Arrow                 | 83      | Num Lock               |          |
| 84     | Keypad /                | 85     | Keypad *             | 86          | Keypad -                 | 87      | Keypad +               |          |
| 88     | Keypad Enter            | 89     | Keypad 1 and End     | 90          | Keypad 2 and Down Arrow  | 91      | Keypad 3 and Page Down |          |
| 92     | Keypad 4 and Left Arrow | 93     | Keypad 5             | 94          | Keypad 6 and Right Arrow | 95      | Keypad 7 and Home      |          |
| 96     | Keypad 8 and Up Arrow   | 97     | Keypad 9 and Page Up | 98          | Keypad 0 and Insert      | 99      | Keypad . and Delete    |          |
| 100    | \ and                   |        | 101                  | Application | 102                      | Power   | 103                    | Keypad = |
| 104    | F13                     | 105    | F14                  | 106         | F15                      | 107     | F16                    |          |
| 108    | F17                     | 109    | F18                  | 110         | F19                      | 111     | F20                    |          |
| 112    | F21                     | 113    | F22                  | 114         | F23                      | 115     | F24                    |          |
| 116    | Execute                 | 117    | Help                 | 118         | Menu                     | 119     | Select                 |          |
| 120    | Stop                    | 121    | Again                | 122         | Undo                     | 123     | Cut                    |          |
| 124    | Copy                    | 125    | Paste                | 126         | Find                     | 127     | Mute                   |          |
| 128    | Volume Up               | 129    | Volume Down          |             |                          |         |                        |          |

The full list can be found in section 10, page 53 of [HID Usage Tables 1.12][2].
完全列表可以在[HID 页表 1.12][2]的 53 页，第 10 节找到

### 5 车轮后的螺母

```
这些总结和代码的描述组成了一个 API - 应用程序产品接口。

```

通常，当你使用其他人的代码，他们会提供一份自己代码的总结，描述代码都做了什么，粗略介绍了是如何工作的，以及什么情况下会出错。下面是一个使用我的 USB 驱动的相关步骤要求。

Table 5.1 Keyboard related functions in CSUD 
| Function                | Arguments                       | Returns              | Description   |
| ----------------------- | ----------------------- | ----------------------- | -----------------------|
| UsbInitialise           | None                            | r0 is result code    | This method is the all-in-one method that loads the USB driver, enumerates all devices and attempts to communicate with them. This method generally takes about a second to execute, though with a few USB hubs plugged in this can be significantly longer. After this method is completed methods in the keyboard driver become available, regardless of whether or not a keyboard is indeed inserted. Result code explained below. |
| UsbCheckForChange       | None                            | None                 | Essentially provides the same effect as UsbInitialise, but does not provide the same one time initialisation. This method checks every port on every connected hub recursively, and adds new devices if they have been added. This should be very quick if there are no changes, but can take up to a few seconds if a hub with many devices is attached.|
| KeyboardCount           | None                            | r0 is count          | Returns the number of keyboards currently connected and detected. UsbCheckForChange may update this. Up to 4 keyboards are supported by default. Up to this many keyboards may be accessed through this driver.|
| KeyboardGetAddress      | r0 is index                     | r0 is address        | Retrieves the address of a given keyboard. All other functions take a keyboard address in order to know which keyboard to access. Thus, to communicate with a keyboard, first check the count, then retrieve the address, then use other methods. Note, the order of keyboards that this method returns may change after calls to UsbCheckForChange.|
| KeyboardPoll            | r0 is address                   | r0 is result code    | Reads in the current key state from the keyboard. This operates via polling the device directly, contrary to the best practice. This means that if this method is not called frequently enough, a key press could be missed. All reading methods simply return the value as of the last poll.|
| KeyboardGetModifiers    | r0 is address                   | r0 is modifier state | Retrieves the status of the modifier keys as of the last poll. These are the shift, alt control and GUI keys on both sides. This is returned as a bit field, such that a 1 in the bit 0 means left control is held, bit 1 means left shift, bit 2 means left alt, bit 3 means left GUI and bits 4 to 7 mean the right versions of those previous. If there is a problem r0 contains 0.|
| KeyboardGetKeyDownCount | r0 is address                   | r0 is count          | Retrieves the number of keys currently held down on the keyboard. This excludes modifier keys. Normally, this cannot go above 6. If there is an error this method returns 0.|
| KeyboardGetKeyDown      | r0 is address, r1 is key number | r0 is scan code      | Retrieves the scan code (see Table 4.1) of a particular held down key. Normally, to work out which keys are down, call KeyboardGetKeyDownCount and then call KeyboardGetKeyDown up to that many times with increasing values of r1 to determine which keys are down. Returns 0 if there is a problem. It is safe (but not recommended) to call this method without calling KeyboardGetKeyDownCount and interpret 0s as keys not held. Note, the order or scan codes can change randomly (some keyboards sort numerically, some sort temporally, no guarantees are made). |
| KeyboardGetKeyIsDown    | r0 is address, r1 is scan code  | r0 is status         | Alternative to KeyboardGetKeyDown, checks if a particular scan code is among the held down keys. Returns 0 if not, or a non-zero value if so. Faster when detecting particular scan codes (e.g. looking for ctrl+c). On error, returns 0.|
| KeyboardGetLedSupport   | r0 is address                   | r0 is LEDs           | Checks which LEDs a particular keyboard supports. Bit 0 being 1 represents Number Lock, bit 1 represents Caps Lock, bit 2 represents Scroll Lock, bit 3 represents Compose, bit 4 represents Kana, bit 5 represents Power, bit 6 represents Mute and bit 7 represents Compose. As per the USB standard, none of these LEDs update automatically (e.g. Caps Lock must be set manually when the Caps Lock scan code is detected).|
| KeyboardSetLeds         | r0 is address, r1 is LEDs       | r0 is result code    | Attempts to turn on/off the specified LEDs on the keyboard. See below for result code values. See KeyboardGetLedSupport for LEDs' values.|

```
Result codes are an easy way to handle errors, but often more elegant solutions exist in higher level code.
```

Several methods return 'result codes'. These are commonplace in C code, and are just numbers which represent what happened in a method call. By convention, 0 always indicates success. The following result codes are used by this driver.

Table 5.2 - CSUD Result Codes 
| Code | Description                                                             |
| ---- | ----------------------------------------------------------------------- |
| 0    | Method completed successfully.                                          |
| -2   | Argument: A method was called with an invalid argument.                 |
| -4   | Device: The device did not respond correctly to the request.            |
| -5   | Incompatible: The driver is not compatible with this request or device. |
| -6   | Compiler: The driver was compiled incorrectly, and is broken.           |
| -7   | Memory: The driver ran out of memory.                                   |
| -8   | Timeout: The device did not respond in the expected time.               |
| -9   | Disconnect: The device requested has disconnected, and cannot be used.  |

The general usage of the driver is as follows:

  1. Call UsbInitialise
  2. Call UsbCheckForChange
  3. Call KeyboardCount
  4. If this is 0, go to 2.
  5. For each keyboard you support:
    1. Call KeyboardGetAddress
    2. Call KeybordGetKeyDownCount
    3. For each key down:
      1. Check whether or not it has just been pushed
      2. Store that the key is down
    4. For each key stored:
      3. Check whether or not key is released
      4. Remove key if released
  6. Perform actions based on keys pushed/released
  7. Go to 2.



Ultimately, you may do whatever you wish to with the keyboard, and these methods should allow you to access all of its functionality. Over the next 2 lessons, we shall look at completing the input side of a text terminal, similarly to most command line computers, and interpreting the commands. In order to do this, we're going to need to have keyboard inputs in a more useful form. You may notice that my driver is (deliberately) unhelpful, because it doesn't have methods to deduce whether or not a key has just been pushed down or released, it only has methods about what is currently held down. This means we'll need to write such methods ourselves.

### 6 Updates Available

Repeatedly checking for updates is called 'polling'. This is in contrast to interrupt driven IO, where the device sends a signal when data is ready.

First of all, let's implement a method KeyboardUpdate which detects the first keyboard and uses its poll method to get the current input, as well as saving the last inputs for comparison. We can then use this data with other methods to translate scan codes to keys. The method should do precisely the following:

  1. Retrieve a stored keyboard address (initially 0).
  2. If this is not 0, go to 9.
  3. Call UsbCheckForChange to detect new keyboards.
  4. Call KeyboardCount to detect how many keyboards are present.
  5. If this is 0 store the address as 0 and return; we can't do anything with no keyboard.
  6. Call KeyboardGetAddress with parameter 0 to get the first keyboard's address.
  7. Store this address.
  8. If this is 0, return; there is some problem.
  9. Call KeyboardGetKeyDown 6 times to get each key currently down and store them
  10. Call KeyboardPoll
  11. If the result is non-zero go to 3. There is some problem (such as disconnected keyboard).



To store the values mentioned above, we will need the following values in the .data section.

```
.section .data
.align 2
KeyboardAddress:
.int 0
KeyboardOldDown:
.rept 6
.hword 0
.endr
```

```
.hword num inserts the half word constant num into the file directly.
```

```
.rept num [commands] .endr copies the commands commands to the output num times.
```

Try to implement the method yourself. My implementation for this is as follows:

1. 
```
.section .text
.globl KeyboardUpdate
KeyboardUpdate:
push {r4,r5,lr}

kbd .req r4
ldr r0,=KeyboardAddress
ldr kbd,[r0]
```
We load in the keyboard address.
2. 
```
teq kbd,#0
bne haveKeyboard$
```
If the address is non-zero, we have a keyboard. Calling UsbCheckForChanges is slow, and so if everything works we avoid it. 
3. 
```
getKeyboard$:
bl UsbCheckForChange
```
If we don't have a keyboard, we have to check for new devices. 
4. 
```
bl KeyboardCount
```
Now we see if a new keyboard has been added. 
5. 
```
teq r0,#0
ldreq r1,=KeyboardAddress
streq r0,[r1]
beq return$
```
There are no keyboards, so we have no keyboard address. 
6. 
```
mov r0,#0
bl KeyboardGetAddress
```
Let's just get the address of the first keyboard. You may want to allow more. 
7. 
```
ldr r1,=KeyboardAddress
str r0,[r1]
```
Store the keyboard's address. 
8. 
```
teq r0,#0
beq return$
mov kbd,r0
```
If we have no address, there is nothing more to do. 
9. 
```
saveKeys$:
  mov r0,kbd
  mov r1,r5
  bl KeyboardGetKeyDown
  
  ldr r1,=KeyboardOldDown
  add r1,r5,lsl #1
  strh r0,[r1]
  add r5,#1
  cmp r5,#6
  blt saveKeys$
```
Loop through all the keys, storing them in KeyboardOldDown. If we ask for too many, this returns 0 which is fine.

10. 
```
mov r0,kbd
bl KeyboardPoll
```
Now we get the new keys. 

11. 
```
teq r0,#0
bne getKeyboard$

return$:
pop {r4,r5,pc}
.unreq kbd
```
Finally we check if KeyboardPoll worked. If not, we probably disconnected. 


With our new KeyboardUpdate method, checking for inputs becomes as simple as calling this method at regular intervals, and it will even check for disconnections etc. This is a useful method to have, as our actual key processing may differ based on the situation, and so being able to get the current input in its raw form with one method call is generally applicable. The next method we ideally want is KeyboardGetChar, a method that simply returns the next key pressed as an ASCII character, or returns 0 if no key has just been pressed. This could be extended to support typing a key multiple times if it is held for a certain duration, and to support the 'lock' keys as well as modifiers.

To make this method it is useful if we have a method KeyWasDown, which simply returns 0 if a given scan code is not in the KeyboardOldDown values, and returns a non-zero value otherwise. Have a go at implementing this yourself. As always, a solution can be found on the downloads page.

### 7 Look Up Tables

```
In many areas of programming, the larger the program, the faster it is. Look up tables are large, but are very fast. Some problems can be solved by a mixture of look up tables and normal functions.
```

The KeyboardGetChar method could be quite complex if we write it poorly. There are 100s of scan codes, each with different effects depending on the presence or absence of the shift key or other modifiers. Not all of the keys can be translated to a character. For some characters, multiple keys can produce the same character. A useful trick in situations with such vast arrays of possibilities is look up tables. A look up table, much like in the physical sense, is a table of values and their results. For some limited functions, the simplest way to deduce the answer is just to precompute every answer, and just return the correct one by retrieving it. In this case, we could build up a sequence of values in memory such that the nth value into the sequence is the ASCII character code for the scan code n. This means our method would simply have to detect if a key was pressed, and then retrieve its value from the table. Further, we could have a separate table for the values when shift is held, so that the shift key simply changes which table we're working with.

After the .section .data command, copy the following tables:

```
.align 3
KeysNormal:
    .byte 0x0, 0x0, 0x0, 0x0, 'a', 'b', 'c', 'd'
    .byte 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l'
    .byte 'm', 'n', 'o', 'p', 'q', 'r', 's', 't'
    .byte 'u', 'v', 'w', 'x', 'y', 'z', '1', '2'
    .byte '3', '4', '5', '6', '7', '8', '9', '0'
    .byte '\n', 0x0, '\b', '\t', ' ', '-', '=', '['
    .byte ']', '\\\', '#', ';', '\'', '`', ',', '.'
    .byte '/', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .byte 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .byte 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .byte 0x0, 0x0, 0x0, 0x0, '/', '*', '-', '+'
    .byte '\n', '1', '2', '3', '4', '5', '6', '7'
    .byte '8', '9', '0', '.', '\\\', 0x0, 0x0, '='

.align 3
KeysShift:
    .byte 0x0, 0x0, 0x0, 0x0, 'A', 'B', 'C', 'D'
    .byte 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L'
    .byte 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T'
    .byte 'U', 'V', 'W', 'X', 'Y', 'Z', '!', '"'
    .byte '£', '$', '%', '^', '&', '*', '(', ')'
    .byte '\n', 0x0, '\b', '\t', ' ', '_', '+', '{'
    .byte '}', '|', '~', ':', '@', '¬', '<', '>'
    .byte '?', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .byte 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .byte 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    .byte 0x0, 0x0, 0x0, 0x0, '/', '*', '-', '+'
    .byte '\n', '1', '2', '3', '4', '5', '6', '7'
    .byte '8', '9', '0', '.', '|', 0x0, 0x0, '='
```

```
.byte num inserts the byte constant num into the file directly.
```

```
Most assemblers and compilers recognise escape sequences; character sequences such as \t which insert special characters instead.
```

These tables map directly the first 104 scan codes onto the ASCII characters as a table of bytes. We also have a separate table describing the effects of the shift key on those scan codes. I've used the ASCII null character (0) for all keys without direct mappings in ASCII (such as the function keys). Backspace is mapped to the ASCII backspace character (8 denoted \b), enter is mapped to the ASCII new line character (10 denoted \n) and tab is mapped to the ASCII horizontal tab character (9 denoted \t).

The KeyboardGetChar method will need to do the following:

  1. Check if KeyboardAddress is 0. If so, return 0.
  2. Call KeyboardGetKeyDown up to 6 times. Each time:
    1. If key is 0, exit loop.
    2. Call KeyWasDown. If it was, go to the next key.
    3. If the scan code is more than 103, go to the next key.
    4. Call KeyboardGetModifiers
    5. If shift is held, load the address of KeysShift. Otherwise load KeysNormal.
    6. Read the ASCII value from the table.
    7. If it is 0, go to the next key otherwise return this ASCII code and exit.
  3. Return 0.



Try to implement this yourself. My implementation is presented below:

1. 
```
.globl KeyboardGetChar
KeyboardGetChar:
ldr r0,=KeyboardAddress
ldr r1,[r0]
teq r1,#0
moveq r0,#0
moveq pc,lr
```
Simple check to see if we have a keyboard.

2. 
```
push {r4,r5,r6,lr}
kbd .req r4
key .req r6
mov r4,r1
mov r5,#0
keyLoop$:
  mov r0,kbd
  mov r1,r5
  bl KeyboardGetKeyDown
```
r5 will hold the index of the key, r4 holds the keyboard address.

    1. 
    ```
    teq r0,#0
    beq keyLoopBreak$
    ```
    If a scan code is 0, it either means there is an error, or there are no more keys.

    2. 
    ```
    mov key,r0
    bl KeyWasDown
    teq r0,#0
    bne keyLoopContinue$
    ```
    If a key was already down it is uninteresting, we only want ot know about key presses.

    3. 
    ```
    cmp key,#104
    bge keyLoopContinue$
    ```
    If a key has a scan code higher than 104, it will be outside our table, and so is not relevant.

    4. 
    ```
    mov r0,kbd
    bl KeyboardGetModifiers
    ```
    We need to know about the modifier keys in order to deduce the character.

    5. 
    ```
    tst r0,#0b00100010
    ldreq r0,=KeysNormal
    ldrne r0,=KeysShift
    ```
    We detect both a left and right shift key as changing the characters to their shift variants. Remember, a tst instruction computes the logical AND and then compares it to zero, so it will be equal to 0 if and only if both of the shift bits are zero.

    6. 
    ```
    ldrb r0,[r0,key]
    ```
    Now we can load in the key from the look up table.

    7. 
    ```
    teq r0,#0
    bne keyboardGetCharReturn$
    keyLoopContinue$:
    add r5,#1
    cmp r5,#6
    blt keyLoop$
    ```
    If the look up code contains a zero, we must continue. To continue, we increment the index, and check if we've reached 6.

3. 
```
keyLoopBreak$:
mov r0,#0
keyboardGetCharReturn$:
pop {r4,r5,r6,pc}
.unreq kbd
.unreq key
```
We return our key here, if we reach keyLoopBreak$, then we know there is no key held, so return 0.




### 8 Notepad OS

Now we have our KeyboardGetChar method, we can make an operating system that just types what the user writes to the screen. For simplicity we'll ignore all the unusual keys. In 'main.s' delete all code after bl SetGraphicsAddress. Call UsbInitialise, set r4 and r5 to 0, then loop forever over the following commands:

  1. Call KeyboardUpdate
  2. Call KeyboardGetChar
  3. If it is 0, got to 1
  4. Copy r4 and r5 to r1 and r2 then call DrawCharacter
  5. Add r0 to r4
  6. If r4 is 1024, add r1 to r5 and set r4 to 0
  7. If r5 is 768 set r5 to 0
  8. Go to 1



Now compile this and test it on the Pi. You should almost immediately be able to start typing text to the screen when the Pi starts. If not, please see our troubleshooting page.

When it works, congratulations, you've achieved an interface with the computer. You should now begin to realise that you've almost got a primitive operating system together. You can now interface with the computer, issuing it commands, and receive feedback on screen. In the next tutorial, [Input02][3] we will look at producing a full text terminal, in which the user types commands, and the computer executes them.

--------------------------------------------------------------------------------

via: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/input01.html

作者：[Alex Chadwick][a]
选题：[lujun9972][b]
译者：[ezio](https://github.com/oska874)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.cl.cam.ac.uk
[b]: https://github.com/lujun9972
[1]: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/downloads.html
[2]: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/downloads/hut1_12v2.pdf
[3]: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/input02.html
