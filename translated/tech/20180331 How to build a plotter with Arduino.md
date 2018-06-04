如何使用 Arduino 制作一个绘图仪
======

> 使用开源硬件和软件的 DIY 绘图仪可以自动地绘制、雕刻。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/EDU_Arduino_520x292.png?itok=joCojk4e)

在上学时，科学系的壁橱里藏着一台惠普绘图仪。虽然我在上学的期间可以经常使用它，但我还是想拥有一台属于自己的绘图仪。许多年之后，步进电机已经很容易获得了，我又在从事电子产品和微控制器方面的工作，最近，我看到有人用丙烯酸塑料（acrylic）制作了一个显示器。这件事启发了我，并最终制作了我自己的绘图仪。

![The plotter in action ][2]

*我 DIY 的绘图仪；在这里看它工作的[视频][3]。*

由于我是一个很怀旧的人，我真的很喜欢最初的 [Arduino Uno][4]。下面是我用到的其它东西的一个清单（仅供参考，其中一些我也不是很满意）：

  * [FabScan shield][5]：承载步进电机驱动器。
  * [SilentStepSticks][6]：步进电机驱动器，因为 Arduino 自身不能处理步进电机所需的电压和电流。因此我使用了一个 Trinamic TMC2130 芯片，但它是工作在单独模式。这些替换为 Pololu 4988，但是它们运转更安静。
  * [SilentStepStick 保护装置][7]：一个防止你的电机驱动器转动过快的二极管（相信我，你肯定会需要它的）。
  * 步进电机：我选择的是使用 12 V 电压的 NEMA 17 电机（如，来自 [Watterott][8] 和 [SparkFun][9] 的型号）。
  * [直线导杆][10]
  * 木制的基板
  * 木螺丝
  * GT2 皮带
  * [GT2 同步滑轮][11]

这是我作为个人项目而设计的。如果你想找到一个现成的工具套件，你可以从 German Make 杂志上找到 [MaXYposi][12]。

### 硬件安装

正如你所看到的，我刚开始做的太大了。这个绘图仪并不合适放在我的桌子上。但是，没有关系，我只是为了学习它（并且，我也将一些东西进行重新制作，下次我将使用一个更小的横梁）。

![Plotter base plate with X-axis and Y-axis rails][14]

*带 X 轴和 Y 轴轨道的绘图仪基板*

皮带安装在轨道的侧面，并且用它将一些辅助轮和电机挂在一起：

![The belt routing on the motor][16]

*电机上的皮带路由*

我在 Arduino 上堆叠了几个组件。Arduino 在最下面，它之上是 FabScan shield，接着是一个安装在 1 和 2 号电机槽上的 StepStick 保护装置，SilentStepStick 在最上面。注意，SCK 和 SDI 针脚没有连接。

![Arduino and Shield][18]

*Arduino 堆叠配置（[高清大图][19]）*

注意将电机的连接线接到正确的针脚上。如果有疑问，就去查看它的数据表，或者使用欧姆表去找出哪一对线是正确的。

### 软件配置

#### 基础部分

虽然像 [grbl][20] 这样的软件可以解释诸如像装置移动和其它一些动作的 G-codes，并且，我也可以将它刷进 Arduino 中，但是我很好奇，想更好地理解它是如何工作的。（我的 X-Y 绘图仪软件可以在 [GitHub][21] 上找到，不过我不提供任何保修。）

使用 StepStick（或者其它兼容的）驱动器去驱动步进电机，基本上只需要发送一个高电平信号或者低电平信号到各自的针脚即可。或者使用 Arduino 的术语：

```
digitalWrite(stepPin, HIGH);
delayMicroseconds(30);
digitalWrite(stepPin, LOW);
```

在 `stepPin` 的位置上是步进电机的针脚编号：3 是 1 号电机，而 6 是 2 号电机。

在步进电机能够工作之前，它必须先被启用。

```
digitalWrite(enPin, LOW);
```

实际上，StepStick 能够理解针脚的三个状态：

  * Low：电机已启用
  * High：电机已禁用
  * Pin 未连接：电机已启用，但在一段时间后进入节能模式

电机启用后，它的线圈已经有了力量并用来保持位置。这时候几乎不可能用手来转动它的轴。这样可以保证很好的精度，但是也意味着电机和驱动器芯片都“充满着”力量，并且也因此会发热。

最后，也是很重要的，我们需要一个决定绘图仪方向的方法：

```
digitalWrite(dirPin, direction);
```

下面的表列出了功能和针脚：

| 功能 | 1 号电机 | 2 号电机 |
|---|---|---|
| 启用 | 2 | 5 |
| 方向 | 4 | 7 |
| 步进 | 3 | 6 |

在我们使用这些针脚之前，我们需要在代码的 `setup()` 节中设置它的 `OUTPUT` 模式。

```
pinMode(enPin1, OUTPUT);
pinMode(stepPin1, OUTPUT);
pinMode(dirPin1, OUTPUT);
digitalWrite(enPin1, LOW);
```

了解这些知识后，我们可以很容易地让步进电机四处移动：

```
    totalRounds = ...
    for (int rounds =0 ; rounds < 2*totalRounds; rounds++) {
       if (dir==0){ // set direction
         digitalWrite(dirPin2, LOW);
       } else {
         digitalWrite(dirPin2, HIGH);
       }
       delay(1); // give motors some breathing time
       dir = 1-dir; // reverse direction
       for (int i=0; i < 6400; i++) {
         int t = abs(3200-i) / 200;
         digitalWrite(stepPin2, HIGH);
         delayMicroseconds(70 + t);
         digitalWrite(stepPin2, LOW);
         delayMicroseconds(70 + t);
       }
    }
```

这将使滑块向左和向右移动。这些代码只操纵一个步进电机，但是，对于一个 X-Y 绘图仪，我们要考虑两个轴。

#### 命令解释器

我开始做一个简单的命令解释器去使用规范的路径，比如：

```
"X30|Y30|X-30 Y-30|X-20|Y-20|X20|Y20|X-40|Y-25|X40 Y25
```

用毫米来描述相对移动（1 毫米等于 80 步）。

绘图仪软件实现了一个 _持续模式_ ，这可以允许一台 PC 给它提供一个很大的路径（很多的路径）去绘制。（在这个[视频][22]中展示了如何绘制 Hilbert 曲线）

### 设计一个好用的握笔器

在上面的第一张图中，绘图笔是细绳子绑到 Y 轴上的。这样绘图也不精确，并且也无法在软件中实现提笔和下笔（如示例中的大黑点）。

因此，我设计了一个更好用的、更精确的握笔器，它使用一个伺服器去提笔和下笔。可以在下面的这张图中看到这个新的、改进后的握笔器，上面视频链接中的 Hilbert 曲线就是使用它绘制的。

![Servo to raise/lower the pen ][24]

*图中的特写镜头就是伺服器臂提起笔的图像*

笔是用一个小夹具固定住的（图上展示的是一个大小为 8 的夹具，它一般用于将线缆固定在墙上）。伺服器臂能够提起笔；当伺服器臂放下来的时候，笔就会被放下来。

#### 驱动伺服器

驱动伺服器是非常简单的：只需要提供位置，伺服器就可以完成所有的工作。

```
#include <Servo.h>

// Servo pin
#define servoData PIN_A1

// Positions
#define PEN_UP 10
#define PEN_DOWN 50

Servo penServo;

void setup() {
  // Attach to servo and raise pen
  penServo.attach(servoData);
  penServo.write(PEN_UP);
}
```

我把伺服器接头连接在 FabScan shield 的 4 号电机上，因此，我将用 1 号模拟针脚。

放下笔也很容易：

```
  penServo.write(PEN_DOWN);
```

### 进一步扩展

我的进一步扩展的其中一项就是添加一些终止检测器，但是，我也可以不用它们，进而使用 TMC2130 的 StallGuard 模式来代替。这些检测器也可以用于去实现一个 `home` 命令。

以后，我或许还将添加一个真实的 Z 轴，这样它就可以对一个木头进行铣削雕刻，或者钻一个 PCB 板，或者雕刻一块丙烯酸塑料，或者 … （我还想到了用激光）。

这篇文章最初发布在 [Some Things to Remember][25] 博客中并授权重分发。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/diy-plotter-arduino

作者：[Heiko W.Rupp][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/pilhuhn
[1]:https://opensource.com/file/384786
[2]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/plotter-in-action.png?itok=q9oHrJGr "The plotter in action "
[3]:https://twitter.com/pilhuhn/status/948205323726344193
[4]:https://en.wikipedia.org/wiki/Arduino#Official_boards
[5]:http://www.watterott.com/de/Arduino-FabScan-Shield
[6]:http://www.watterott.com/de/SilentStepStick-TMC2130
[7]:http://www.watterott.com/de/SilentStepStick-Protector
[8]:http://www.watterott.com/de/Schrittmotor-incl-Anschlusskabel
[9]:https://www.sparkfun.com/products/9238
[10]:https://www.ebay.de/itm/CNC-Set-12x-600mm-Linearfuhrung-Linear-Guide-Rail-Stage-3D-/322917927292?hash=item4b2f68897c
[11]:http://www.watterott.com/de/OpenBuilds-GT2-2mm-Aluminium-Timing-Pulley
[12]:https://www.heise.de/make/artikel/MaXYposi-Projektseite-zum-universellen-XY-Portalroboter-von-Make-3676050.html
[13]:https://opensource.com/file/384776
[14]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/entire_plotter.jpg?itok=40iSEs5K "Plotter base plate with X-axis and Y-axis rails"
[15]:https://opensource.com/file/384791
[16]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/y_motor_detail.jpg?itok=SICJBdRv "The belt routing on the motor"
[17]:https://opensource.com/file/384771
[18]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/arduino_and_shield.jpg?itok=OFumhpJm
[19]:https://www.dropbox.com/s/7bp3bo5g2ujser8/IMG_20180103_110111.jpg?dl=0
[20]:https://github.com/gnea/grbl
[21]:https://github.com/pilhuhn/xy-plotter
[22]:https://twitter.com/pilhuhn/status/949737734654124032
[23]:/https://opensource.comfile/384781
[24]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pen_servo.jpg?itok=b2cnwB3P "Servo to raise/lower the pen "
[25]:http://pilhuhn.blogspot.com/2018/01/homegrown-xy-plotter-with-arduino.html
