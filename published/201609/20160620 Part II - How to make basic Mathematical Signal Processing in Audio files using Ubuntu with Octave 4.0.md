科学音频处理（二）：如何使用 Octave 对音频文件进行基本数学信号处理
=========

在[前一篇的指导教程][1]中，我们看到了读、写以及重放音频文件的简单步骤，我们甚至看到如何从一个周期函数比如余弦函数合成一个音频文件。在这篇指导教程中，我们将会看到如何对信号进行叠加和倍乘（调整），并应用一些基本的数学函数看看它们对原始信号的影响。

### 信号叠加

两个信号 S1（t）和 S2（t）相加形成一个新的信号 R(t)，这个信号在任何瞬间的值等于构成它的两个信号在那个时刻的值之和。就像下面这样：

```
R(t) = S1(t) + S2(t)
```

我们将用 Octave 重新产生两个信号的和并通过图表看达到的效果。首先，我们生成两个不同频率的信号，看一看它们的叠加信号是什么样的。

#### 第一步：产生两个不同频率的信号（oog 文件）

```
>> sig1='cos440.ogg';                  %creating the audio file @440 Hz
>> sig2='cos880.ogg';                  %creating the audio file @880 Hz
>> fs=44100;                           %generating the parameters values (Period, sampling frequency and angular frequency)
>> t=0:1/fs:0.02;
>> w1=2*pi*440*t;
>> w2=2*pi*880*t;
>> audiowrite(sig1,cos(w1),fs);        %writing the function cos(w) on the files created
>> audiowrite(sig2,cos(w2),fs);
```

然后我们绘制出两个信号的图像。

**信号 1 的图像（440 赫兹）**

```
>> [y1, fs] = audioread(sig1);
>> plot(y1)
```

[![信号 1 的图像](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/plotsignal1.png)](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/big/plotsignal1.png)

**信号 2 的图像（880 赫兹）**

```
>> [y2, fs] = audioread(sig2);
>> plot(y2)
```

[![信号 2 的图像](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/plotsignal2.png)](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/big/plotsignal2.png)

#### 第二步：把两个信号叠加

现在我们展示一下前面步骤中产生的两个信号的和。

```
>> sumres=y1+y2;
>> plot(sumres)
```

叠加信号的图像

[![和信号的图像](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/plotsum.png)](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/big/plotsum.png)

**Octaver 中的效果**

在 Octaver 中，这个效果产生的声音是独特的，因为它可以仿真音乐家弹奏的低八度或者高八度音符（取决于内部程序设计），仿真音符和原始音符成对，也就是两个音符发出相同的声音。

#### 第三步：把两个真实的信号相加（比如两首音乐歌曲）

为了实现这个目的，我们使用格列高利圣咏（Gregorian Chants）中的两首歌曲（声音采样）。

**圣母颂曲（Avemaria Track）**

首先，我们看一下圣母颂曲并绘出它的图像：

```
>> [y1,fs]=audioread('avemaria_.ogg');
>> plot(y1)
```

[![圣母歌曲](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/avemaria.png)](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/big/avemaria.png)

**赞美诗曲（Hymnus Track）**

现在我们看一下赞美诗曲并绘出它的图像。

```
>> [y2,fs]=audioread('hymnus.ogg');
>> plot(y2)
```

[![赞美诗曲](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/hymnus.png)](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/big/hymnus.png)

**圣母颂曲 + 赞美诗曲**

```
>> y='avehymnus.ogg';
>> audiowrite(y, y1+y2, fs);
>> [y, fs]=audioread('avehymnus.ogg');
>> plot(y)
```

[![圣母歌曲 + 赞美诗曲](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/avehymnus.png)](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/big/avehymnus.png)

结果，从音频的角度来看，两个声音信号混合在了一起。 

### 两个信号的乘积

对于求两个信号的乘积，我们可以使用类似求和的方法。我们使用之前生成的相同文件。

```
R(t) = S1(t) * S2(t)
```

```
>> sig1='cos440.ogg';                  %creating the audio file @440 Hz
>> sig2='cos880.ogg';                  %creating the audio file @880 Hz
>> product='prod.ogg';                 %creating the audio file for product
>> fs=44100;                           %generating the parameters values (Period, sampling frequency and angular frequency)
>> t=0:1/fs:0.02;
>> w1=2*pi*440*t;
>> w2=2*pi*880*t;
>> audiowrite(sig1, cos(w1), fs);      %writing the function cos(w) on the files created
>> audiowrite(sig2, cos(w2), fs);>> [y1,fs]=audioread(sig1);>> [y2,fs]=audioread(sig2);
>> audiowrite(product, y1.*y2, fs);    %performing the product
>> [yprod,fs]=audioread(product);
>> plot(yprod);                        %plotting the product
```


注意：我们必须使用操作符 ‘.*’，因为在参数文件中，这个乘积是值与值相乘。更多信息，请参考 Octave 矩阵操作产品手册。

#### 乘积生成信号的图像

[![乘积信号的图像](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/plotprod.png)](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/big/plotprod.png)

#### 两个基本频率相差很大的信号相乘后的图表效果（调制原理）

**第一步：**

生成两个频率为 220 赫兹的声音信号。

```
>> fs=44100;
>> t=0:1/fs:0.03;
>> w=2*pi*220*t;
>> y1=cos(w);
>> plot(y1);
```

[![载波](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/carrier.png)](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/big/carrier.png)

**第二步：**

生成一个 22000 赫兹的高频调制信号。

```
>> y2=cos(100*w);
>> plot(y2);
```

[![调制中](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/modulating.png)](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/big/modulating.png)

**第三步：**

把两个信号相乘并绘出图像。

```
>> plot(y1.*y2);
```

[![调制后的信号](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/modulated.png)](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/big/modulated.png)

### 一个信号和一个标量相乘

一个函数和一个标量相乘的效果等于更改它的值域，在某些情况下，更改的是相标志。给定一个标量 K ，一个函数 F(t) 和这个标量相乘定义为：

```
R(t) = K*F(t)
```

```
>> [y,fs]=audioread('cos440.ogg');        %creating the work files
>> res1='coslow.ogg';                
>> res2='coshigh.ogg';>> res3='cosinverted.ogg';
>> K1=0.2;                                %values of the scalars
>> K2=0.5;>> K3=-1;
>> audiowrite(res1, K1*y, fs);            %product function-scalar
>> audiowrite(res2, K2*y, fs);
>> audiowrite(res3, K3*y, fs);
```

**原始信号的图像**

```
>> plot(y)
```

[![](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/originalsignal.png)](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/big/originalsignal.png)

**信号振幅减为原始信号振幅的 0.2 倍后的图像**

```
>> plot(res1)
```

[![低余弦](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/coslow.png)](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/big/coslow.png)

**信号振幅减为原始振幅的 0.5 倍后的图像**

```
>> plot(res2)
```

[![高余弦](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/coshigh.png)](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/big/coshigh.png)

**倒相后的信号图像**

```
>> plot(res3)
```

[![倒相余弦](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/cosinverted.png)](https://www.howtoforge.com/images/octave-audio-signal-processing-ubuntu/big/cosinverted.png)

### 结论

基本数学运算比如代数和、乘，以及函数与常量相乘是更多高级运算比如谱分析、振幅调制，角调制等的支柱和基础。在下一个教程中，我们来看一看如何进行这样的运算以及它们对声音文件产生的效果。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/octave-audio-signal-processing-ubuntu/

作者：[David Duarte][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.howtoforge.com/tutorial/octave-audio-signal-processing-ubuntu/
[1]: https://linux.cn/article-7755-1.html

