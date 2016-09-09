科学音频处理（一）：怎样使用 Octave 对音频文件进行读写操作
================

Octave 是一个类似于 Linux 上的 Matlab 的软件，它拥有数量众多的函数和命令，支持声音采集、记录、回放以及音频信号的数字化处理，用于娱乐应用、研究、医学以及其它科学领域。在本教程中，我们会在 Ubuntu 上使用 Octave 的 4.0.0 版本读取音频文件，然后通过生成信号并且播放来模仿在各种情况下对音频信号的使用。

本教程中关注的不是安装和学习使用安装好的音频处理软件，而是从设计和音频工程的角度理解它是如何工作的。

### 环境准备

首先是安装 octave，在 Ubuntu 终端运行下面的命令添加 Octave PPA，然后安装 Octave 。

```
sudo apt-add-repository ppa:octave/stable
sudo apt-get update
sudo apt-get install octave
```

### 步骤1：打开 Octave

在这一步中我们单击软件图标打开 Octave，可以通过单击下拉式按钮选择工作路径。

![](https://www.howtoforge.com/images/how-to-read-and-write-audio-files-with-octave-4-in-ubuntu/initial.png)

### 步骤2：音频信息

使用`audioinfo`命令查看要处理的音频文件的相关信息。

```
>> info = audioinfo ('testing.ogg')
```

![](https://www.howtoforge.com/images/how-to-read-and-write-audio-files-with-octave-4-in-ubuntu/audioinfo.png)


### 步骤3：读取音频文件

在本教程中我会使用 ogg 文件来读取这种文件的属性，比如采样、音频类型（stereo 和 mono）、信道数量等。必须声明的一点是教程中使用的所有的命令都是在 Octave 终端窗口中执行的。首先，我们必须要把这个 ogg 文件赋给一个变量。注意：**文件必须在 Octave 的工作路径中。**

```
>> file='yourfile.ogg'
```

```
>> [M, fs] = audioread(file)
```

这里的 M 是一个一列或两列的矩阵，取决于信道的数量，fs 是采样率。

![](https://www.howtoforge.com/images/how-to-read-and-write-audio-files-with-octave-4-in-ubuntu/reading.png)

![](https://www.howtoforge.com/images/how-to-read-and-write-audio-files-with-octave-4-in-ubuntu/matrix.png)

![](https://www.howtoforge.com/images/how-to-read-and-write-audio-files-with-octave-4-in-ubuntu/big/frequency.png)


下面的操作都可以读取音频文件：

```
>> [y, fs] = audioread (filename, samples)

>> [y, fs] = audioread (filename, datatype)

>> [y, fs] = audioread (filename, samples, datatype)
```

samples 指定开始帧和结束帧，datatype 指定返回的数据类型。可以为所有变量设置值：

```
>> samples = [1, fs)

>> [y, fs] = audioread (filename, samples)
```

数据类型：

```
>> [y,Fs] = audioread(filename,'native')
```

如果值是“native”，那么它的数据类型就依数据在音频文件中的存储情况而定。

### 步骤4：音频文件的写操作

新建一个 ogg 文件：

我们会从一个余弦值创建一个 ogg 文件。采样率是每秒 44100 次，这个文件最少进行 10 秒的采样。余弦信号的频率是 440 Hz。

```
>> filename='cosine.ogg';
>> fs=44100;
>> t=0:1/fs:10;
>> w=2*pi*440*t;
>> signal=cos(w);
>> audiowrite(filename, signal, fs);
```

这就在工作路径中创建了一个 'cosine.ogg' 文件，这个文件中包含余弦信号。

![](https://www.howtoforge.com/images/how-to-read-and-write-audio-files-with-octave-4-in-ubuntu/cosinefile.png)

播放这个 'cosine.ogg' 文件就会产生一个 440Hz 的 音调，这个音调正好是乐理中的 'A' 调。如果需要查看保存在文件中的值就必须使用 'audioread' 函数读取文件。在后续的教程中，我们会看到怎样在两个信道中读取一个音频文件。

### 步骤5：播放音频文件

Octave 有一个默认的音频播放器，可以用这个音频播放器进行测试。使用下面的函数：

```
>> [y,fs]=audioread('yourfile.ogg');
>> player=audioplayer(y, fs, 8)

  scalar structure containing the fields:

    BitsPerSample =  8
    CurrentSample = 0
    DeviceID = -1
    NumberOfChannels =  1
    Running = off
    SampleRate =  44100
    TotalSamples =  236473
    Tag =
    Type = audioplayer
    UserData = [](0x0)
>> play(player);
```


在这个教程的续篇，我们会进入音频处理的高级特性部分，可能会接触到一些科学和商业应用中的实例。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-read-and-write-audio-files-with-octave-4-in-ubuntu/

作者：[David Duarte][a]
译者：[vim-kakali](https://github.com/vim-kakali)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twitter.com/intent/follow?original_referer=https%3A%2F%2Fwww.howtoforge.com%2Ftutorial%2Fhow-to-read-and-write-audio-files-with-octave-4-in-ubuntu%2F&ref_src=twsrc%5Etfw&region=follow_link&screen_name=howtoforgecom&tw_p=followbutton


