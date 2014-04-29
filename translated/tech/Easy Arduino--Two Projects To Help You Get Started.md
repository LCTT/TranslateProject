+ translated ---------------------by tenght
+ 

Easy Arduino: 两个项目来帮助你开始
================================================================================
> 许多Arduino的项目是基于两个简单的程序。

能所你的电脑所不能的单片机，那就是Arduino。

我们每天使用的计算机是强大的，但他们根本不了解身边发生了什么事。比如说你的笔记本电脑也不能感到光或水。另外，Arduino对外专门设计成键控的。它有一个用于简化传感器通信的输入、输出板子。

Arduino是由Massimo Banzi和他的意大利搭档Ivrea开发的，并由Ivrea，[他最喜欢的酒吧][1]命名。Banzi希望他的设计学生们有一个原型硬件的廉价，容易的解决方案。自2005年Arduino的发布，它已经从一个教学工具发展成为世界各地制造商的DIY项目。现在有了[多模型][2]——更先进的Arduino Due，大马力，微纳米。

无论你购买哪个Arduino模型，当你用它来做“[互联网][3]”项目时，单片机的实用性便体现出来了——Arduino可以很容易让你连接到真实世界，云端，或两者。本书中，我们将突出显示两个超基项目以便展示Arduino可以多简单。

### 开始使用Arduino ###

在我们能够完全理解Arduino是什么之前，知道它不是什么是很重要的。Arduino不是电脑（跟卡片电脑[Raspberry Pi][4]不一样）。它不能被独立编程，需要被插入到计算机中去。它不是特别强大或Arduino Uno有[32 KB的内存][5] ，而苹果笔记本平均有8G。

所以为了使用Arduino，你不能只买单片机。以下的项目，你需要的是：

### 硬件 ###

- Arduino Uno. “Uno”在意大利语中是一的意思，但这并不是有史以来第一个Arduino，只是最基本的Arduino单片机的最新迭代。这些项目可以工作在任何一个模型上，但这是我用这一个。
- B型USB线。我已经很多年没见过这些旧式的USB端口了，但你可能会通过旧的电子设备记住他们。[他们的成本约5-10美元][6]。
- LED灯。可以直接粘在Arduino上的一个微小、发光的引脚；[这些也往往是相当便宜的][7]。

### 软件 ###

- [Arduino IDE][8]，意思是“集成开发环境，”是一个免费开源软件，用于“素描，”也就是Arduino用户所说的程序。
  
当你第一次打开Arduino IDE，你需要建立软件所使用的端口，点击“工具”——>“串口”。

- 在[OS X][9]上，对于Uno串口就像“/dev/tty.usbmodem”，但其他类型的Arduino板可能不同。我的是“/dev/tty.usbmodem1421”。
- 在[Windows][10]，串口是COM3或更高，因为COM1和COM2通常保留给其他硬件。为确定端口号，你可以拔掉Arduino并重新打开IDE菜单。哪个口子不再出现哪个就是你的Arduino。
一般来说，你不用担心拔出你的Arduino电路板。我们知道功能齐全的电脑不会这样做，包括Raspberry Pi，因为他们可以在后台运行一个重要的操作系统任务。但是Arduino就是一个单片机，除非你主动让它写内存，否则它肯定是不会的。

### Arduino 硬件初步: 闪烁一个LED  ###

在这第一个项目中，我们将概述Arduino产生物理输出的最基本方式，在这个实例中，闪烁一个LED灯。
 
我们要去写一个非常简单的程序使得LED频闪——或者是当我自豪地向他展现了[我的迭代][11]时，我的朋友巧妙的跟我讲的，“一个非常小的狂欢”。本程序是基于开源项目[Blink sketch][12]，它可以在Arduino的官网找到。

首先，设置硬件，将LED的两个叉分别粘到Arduino的GND和引脚13上。

![](http://readwrite.com/files/pin13andground.jpg)

 一个叉略短于另外一个叉——短的这个时负极头，因此，这个接“地，”或是GND输入/输出。

![](http://readwrite.com/files/led_leads.jpg)

*注意短的接GND.*

现在让我们开始写程序。首先，让我们给它命名。Arduino将忽略行内双斜杠后边的内容，所以这是为自己写注释的好方法：

    // Program 1: Making an LED blink on and off

当包含硬件时，我们需要告诉Arduino在它的14跟不同的输入/输出引脚中哪儿会有信号。在这种情况下，我们固定13引脚的LED。这是我们的如何命名固定在引脚13的LED，其中“LED”只是我给的变量名：

    int LED = 13;

每一个Arduino程序由两部分组成：void setup() 和 void loop()。这是能够运行的[最小的][13]Arduino程序。

在 **void setup()**中, 我们告诉Arduino初始化引脚为输出: 

    void setup() { 
    pinMode(LED, OUTPUT);
    } 

在**void loop()**中，我们告诉Arduino“写”一个值到引脚13中。因为我想让它闪烁，在每排中我们要使它写四个不同命令的一个序列。你能猜出的词“loop，直到把Arduino关掉前，我们希望它继续。

在下面的代码中，LED代表我们分配了同一个变量。”HIGH”告诉Arduino给LED提供五伏的电源，而“LOW”提供零伏。在闪烁时，使得它延迟“1000”毫秒每一整秒：

    void loop() {
      digitalWrite(LED, HIGH);  
      delay(1000);              
      digitalWrite(LED, LOW);    
      delay(1000);  
    } 

当把它们放在一起时，整个程序如下（再次声明，Arduino忽略行内双斜杠后边的内容，所以那只是你自己的注释）：

    // 程序 1: 使一个LED闪烁开和关
    int led = 13; // name the LED in pin 13
    void setup() {
    pinMode(LED, OUTPUT); // tell Arduino the pin in question is an output
    }
    void loop() {
      digitalWrite(LED, HIGH);     // deliver 5V to LED
      delay(1000);                     // wait a second
      digitalWrite(LED, LOW);      // deliver 0V to LED 
      delay(1000);                     // wait a second
    }

点击checkmark来验证你的代码是没有错误的，然后按play键。如果你的Arduino已经插入，它应该开始运行你的闪烁程序了。

### Arduino 软件程序: 打印到电脑上 ###

现在让我们来控制开关并尝试演示Arduino是如何产生数字输出的最基本工程。

我们将要设置Arduino “打印”，或是在您的计算机屏幕上显示信息。这个程序基于Paul Bianchi的[Arduino printing tutorial][14]。

在这个实例中没有硬件，这样我们就可以直接跳到程序。再次，这将发生在两个部分： **void setup()** 和 **void loop()**。

在**void setup()**中，我们要打开一个Arduino和计算机之间通信的线程，特别是在9600 b/s。如果你使用另一个号码，你可能会在计算机上打印出乱码而不是文字。

    void setup() { 
    Serial.begin(9600); 
    }

在**void loop()** 中，这部分很像我们的一个LED程序。我们要给它两条独立的指令，告诉它在他们之间每一整秒中断。[Println][15]是Arduino输出到你的电脑显示的命令。**注意"Println"使用的是小写的"L,"而不是大写的"i"!**

    void loop() { 
    Serial.println(“hello”);
    delay(1000);
    Serial.println(“world.”);
    delay(1000);
    }

将标题和注释等放到一起，如下：

    // 程序 2: 使Arduino打印 “Hello World”到电脑上
    void setup() {
    Serial.begin(9600); // open a 9600 baud communication line to computer
    }
    void loop() {
    Serial.println(“Hello”);        // write the word “Hello”
    delay(1000);                    // wait a second
    Serial.println(“World”);      // write the word “World”
    delay(1000);                   // wait a second
    }

验证你的代码并运行。什么都不会显示，直到你点击Arduino IDE窗口右上角的“Serial Monitor”。你应该看到一个不停输出的“Hello World，”一遍又一遍，直到你拔掉Arduino。你会看到它的不完美：我总是有点乱码，但很快它自己就好了。

![](http://readwrite.com/files/Screen%20Shot%202014-04-21%20at%209.28.18%20AM.png)

这两个Arduino项目都非常基本，但是通过执行他们你已经开始看到，可以与传感器通信和写结果到您的计算机的Arduino的潜力。如果你把这两个项目整合——例如，你可以连接一个温度计到你的Arduino，并告诉它将温度写到你的笔记本电脑，你会很快实现Arduino的可能性几乎是无止境的。

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/04/21/easy-arduino-projects-basics-tutorials-diy-hardware#feed=/hack

译者：[tenght](https://github.com/tenght) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://spectrum.ieee.org/geek-life/hands-on/the-making-of-arduino/0
[2]:http://arduino.cc/en/main/boards
[3]:http://en.wikipedia.org/wiki/Internet_of_Things
[4]:http://readwrite.com/2014/01/20/raspberry-pi-everything-you-need-to-know
[5]:http://arduino.cc/en/Main/arduinoBoardUno
[6]:https://www.google.com/search?q=type+b+usb&espvd=210&es_sm=91&source=univ&tbm=shop&tbo=u&sa=X&ei=2iVVU9DKDIbLsATni4LwDg&ved=0CCgQsxg&biw=1436&bih=658
[7]:https://www.google.com/search?es_sm=91&biw=1436&bih=658&tbm=shop&q=LED+light&oq=LED+light&gs_l=serp.3..0l10.65005.66134.0.66303.9.9.0.0.0.0.141.697.5j3.8.0.ehm_loc%2Chmss2%3Dfalse%2Chmnts%3D50000...0...1.1.41.serp..4.5.359.V7CTGdfZBFU
[8]:http://arduino.cc/en/main/software#toc1
[9]:http://arduino.cc/en/guide/macOSX#toc8
[10]:http://arduino.cc/en/guide/windows#toc8
[11]:http://instagram.com/p/mp6Gl7q3lU/
[12]:http://arduino.cc/en/Tutorial/Blink
[13]:http://arduino.cc/en/Tutorial/BareMinimum
[14]:http://quarkstream.wordpress.com/2009/12/09/arduino-1-writing-and-uploading-sketches/
[15]:http://arduino.cc/en/Serial/Println