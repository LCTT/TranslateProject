第3部分 - 如何使用Ubuntu系统上Octave 4.0的先进数学技术处理音频文件
=====

我们的数字音频处理技术第三部分涵盖了信号调制内容，将解释如何进行调幅,颤音效果,和频率变化。
### 调制

#### 调幅

正如它的名字暗示的那样， 影响正弦信号的振幅变化依据传递的信息不断改变。正弦波因为承载者大量的信息被称作载波。这种调制技术被用于许多的商业广播和市民信息传输波段(AM).

#### 为何要使用调幅技术？

**调制发射.**

假设信道是免费资源，我们需要天线发射和接收信号。这要求有效的电磁信号发射天线，它的大小和要被发射的信号的波长应该是同一数量级。很多信号，包括音频成分，通常100赫兹或更少。对于这些信号，如果直接发射，我们就需要建立300公里的天线。如果信号调制用于在100MZ的高频载波中打印信息，那么天线仅仅需要1米（横向长度）。

**集中调制与多通道.**

假设多个信号占用一个通道，可以调制不同的信号到接收特定信号的不同位置。使用集中调制（“复用”）的应用有遥感探测数据，立体声调频收音机和长途电话。

**克服设备限制的调制.**

信号处理设备，比如过滤器，放大器，以及可以被重新创建的设备它们的性能依赖于信号在频域中的境况以及高频率和低频信号的关系。调制可以用于传递信号在频域中的位置，更容易满足设计的要求。调制也可以将“宽带信号“（高频和低频的比例很大的信号）转换成”窄带“信号

**音频特效**

许多音频特效由于引人注目和处理信号的便捷性使用了调幅技术。我们可以说出很多，比如颤音、合唱、镶边等等。这种实用性就是我们关注它的原因。

### 颤音效果

颤音效果是调幅最简单的应用，为实现这样的效果，我们会用周期信号改变（乘）音频信号，使用正弦或其他。

```
>> tremolo='tremolo.ogg';
>> fs=44100;
>> t=0:1/fs:10;
>> wo=2*pi*440*t;
>> wa=2*pi*1.2*t;
>> audiowrite(tremolo, cos(wa).*cos(wo),fs);
```

[![Tremolo](https://www.howtoforge.com/images/ubuntu-octave-audio-processing-part-3/tremolo.png)](https://www.howtoforge.com/images/ubuntu-octave-audio-processing-part-3/big/tremolo.png)

这将创造一个正弦形状的信号，它的效果就像‘颤音’。

[![Tremolo Shape](https://www.howtoforge.com/images/ubuntu-octave-audio-processing-part-3/tremoloshape.png)](https://www.howtoforge.com/images/ubuntu-octave-audio-processing-part-3/big/tremoloshape.png)

### 在真实音频文件中的颤音

现在我们将展示真实世界中的颤音效果。首先，我们使用之前记录过男性发声‘A’的音频文件。这个信号图就像下面这样：

```
>> [y,fs]=audioread('A.ogg');
>> plot(y);
```

[![Vocal](https://www.howtoforge.com/images/ubuntu-octave-audio-processing-part-3/avocalmale.png)](https://www.howtoforge.com/images/ubuntu-octave-audio-processing-part-3/big/avocalmale.png)

现在我们将创建一个完整的正弦信号，使用如下的参数：

```
Amplitude = 1
Frequency= 1.5Hz
Phase = 0
```

```
>> t=0:1/fs:4.99999999;
>> t=t(:);
>> w=2*pi*1.5*t;
>> q=cos(w);
>> plot(q);
```

注意： 当我们创建一组时间值时，默认情况下，它是以列的格式呈现，如, 1x220500的值。为了乘以这样的值，必须将其变成行的形式(220500x1). 这就是t=t(:)命令的作用。

[![Sinusodial](https://www.howtoforge.com/images/ubuntu-octave-audio-processing-part-3/sinusoidal.png)](https://www.howtoforge.com/images/ubuntu-octave-audio-processing-part-3/big/sinusoidal.png)

我们将创建第二份ogg音频格式的文件，它包含了如下的调制信号：

```
>> tremolo='tremolo.ogg';
>> audiowrite(tremolo, q.*y,fs);
```

[![](https://www.howtoforge.com/images/ubuntu-octave-audio-processing-part-3/tremsignal1.png)](https://www.howtoforge.com/images/ubuntu-octave-audio-processing-part-3/big/tremsignal1.png)[![Tremolo Signal](https://www.howtoforge.com/images/ubuntu-octave-audio-processing-part-3/tremolsignal1.png)](https://www.howtoforge.com/images/ubuntu-octave-audio-processing-part-3/big/tremolsignal1.png)

### 频率变化

我们可以改变频率保持一些有趣的音效，比如原音变形，电影音效，多人比赛。

#### 正弦频率调制的影响

这是正弦调制频率变化的演示代码，根据方程：

```
Y=Ac*Cos(wo*Cos(wo/k))
```

Where:

```
Ac = Amplitude

wo = fundamental frequency

k = scalar divisor
```

```
>> fm='fm.ogg';
>> fs=44100;
>> t=0:1/fs:10;
>> w=2*pi*442*t;
>> audiowrite(fm, cos(cos(w/1500).*w), fs);
>> [y,fs]=audioread('fm.ogg');
>> figure (); plot (y);
```

信号图：

[![](https://www.howtoforge.com/images/ubuntu-octave-audio-processing-part-3/fmod.png)](https://www.howtoforge.com/images/ubuntu-octave-audio-processing-part-3/big/fmod.png)

你可以使用几乎任何类型的周期函数频率调制。本例中，我们仅仅用了一个正弦函数。请大胆的改变函数频率，用复合函数，甚至改变函数的类型。

--------------------------------------------------------------------------------

经由: https://www.howtoforge.com/tutorial/ubuntu-octave-audio-processing-part-3/

作者：[David Duarte][a]
译者：[theArcticOcean](https://github.com/theArcticOcean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.howtoforge.com/tutorial/ubuntu-octave-audio-processing-part-3/
