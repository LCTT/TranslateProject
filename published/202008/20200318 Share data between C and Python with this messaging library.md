[#]: collector: (lujun9972)
[#]: translator: (silentdawn-zz)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12499-1.html)
[#]: subject: (Share data between C and Python with this messaging library)
[#]: via: (https://opensource.com/article/20/3/zeromq-c-python)
[#]: author: (Cristiano L. Fontana https://opensource.com/users/cristianofontana)

使用 ZeroMQ 消息库在 C 和 Python 间共享数据
======

> ZeroMQ 是一个快速灵活的消息库，用于数据收集和不同编程语言间的数据共享。

![](https://img.linux.net.cn/data/attachment/album/202008/08/202106uale11l1qf11slzw.jpg)

作为软件工程师，我有多次在要求完成指定任务时感到浑身一冷的经历。其中有一次，我必须在一些新的硬件基础设施和云基础设施之间写一个接口，这些硬件需要 C 语言，而云基础设施主要是用 Python。

实现的方式之一是 [用 C 写扩展模块][2]，Python 支持 C 扩展的调用。快速浏览文档后发现，这需要编写大量的 C 代码。这样做的话，在有些情况下效果还不错，但不是我喜欢的方式。另一种方式就是将两个任务放在不同的进程中，并使用 [ZeroMQ 消息库][3] 在两者之间交换消息。

在发现 ZeroMQ 之前，遇到这种类型的情况时，我选择了编写扩展的方式。这种方式不算太差，但非常费时费力。如今，为了避免那些问题，我将一个系统细分为独立的进程，通过 [通信套接字][4] 发送消息来交换信息。这样，不同的编程语言可以共存，每个进程也变简单了，同时也容易调试。

ZeroMQ 提供了一个更简单的过程：

1. 编写一小段 C 代码，从硬件读取数据，然后把发现的东西作为消息发送出去。
2. 使用 Python 编写接口，实现新旧基础设施之间的对接。

[Pieter Hintjens][5] 是 ZeroMQ 项目发起者之一，他是个拥有 [有趣视角和作品][6] 的非凡人物。

### 准备

本教程中，需要：

* 一个 C 编译器（例如 [GCC][7] 或 [Clang][8]）
* [libzmq 库][9]
* [Python 3][10]
* [ZeroMQ 的 Python 封装][11]

Fedora 系统上的安装方法：

```
$ dnf install clang zeromq zeromq-devel python3 python3-zmq
```

Debian 和 Ubuntu 系统上的安装方法：

```
$ apt-get install clang libzmq5 libzmq3-dev python3 python3-zmq
```

如果有问题，参考对应项目的安装指南（上面附有链接）。

### 编写硬件接口库

因为这里针对的是个设想的场景，本教程虚构了包含两个函数的操作库：

* `fancyhw_init()` 用来初始化（设想的）硬件
* `fancyhw_read_val()` 用于返回从硬件读取的数据

将库的完整代码保存到文件 `libfancyhw.h` 中:

```
#ifndef LIBFANCYHW_H
#define LIBFANCYHW_H

#include <stdlib.h>
#include <stdint.h>

// This is the fictitious hardware interfacing library

void fancyhw_init(unsigned int init_param)
{
    srand(init_param);
}

int16_t fancyhw_read_val(void)
{
    return (int16_t)rand();
}

#endif
```

这个库可以模拟你要在不同语言实现的组件间交换的数据，中间有个随机数发生器。

### 设计 C 接口

下面从包含管理数据传输的库开始，逐步实现 C 接口。

#### 需要的库

开始先加载必要的库（每个库的作用见代码注释）：

```
// For printf()
#include <stdio.h>
// For EXIT_*
#include <stdlib.h>
// For memcpy()
#include <string.h>
// For sleep()
#include <unistd.h>

#include <zmq.h>

#include "libfancyhw.h"
```

#### 必要的参数

定义 `main` 函数和后续过程中必要的参数：

```
int main(void)
{
    const unsigned int INIT_PARAM = 12345;
    const unsigned int REPETITIONS = 10;
    const unsigned int PACKET_SIZE = 16;
    const char *TOPIC = "fancyhw_data";

    ...
```

#### 初始化

所有的库都需要初始化。虚构的那个只需要一个参数：

```
fancyhw_init(INIT_PARAM);
```

ZeroMQ 库需要实打实的初始化。首先，定义对象 `context`，它是用来管理全部的套接字的：

```
void *context = zmq_ctx_new();

if (!context)
{
    printf("ERROR: ZeroMQ error occurred during zmq_ctx_new(): %s\n", zmq_strerror(errno));

    return EXIT_FAILURE;
}
```

之后定义用来发送数据的套接字。ZeroMQ 支持若干种套接字，各有其用。使用 `publish` 套接字（也叫 `PUB` 套接字），可以复制消息并分发到多个接收端。这使得你可以让多个接收端接收同一个消息。没有接收者的消息将被丢弃（即不会入消息队列）。用法如下：

```
void *data_socket = zmq_socket(context, ZMQ_PUB);
```

套接字需要绑定到一个具体的地址，这样客户端就知道要连接哪里了。本例中，使用了 [TCP 传输层][15]（当然也有 [其它选项][16]，但 TCP 是不错的默认选择）：

```
const int rb = zmq_bind(data_socket, "tcp://*:5555");

if (rb != 0)
{
    printf("ERROR: ZeroMQ error occurred during zmq_ctx_new(): %s\n", zmq_strerror(errno));

    return EXIT_FAILURE;
}
```

下一步, 计算一些后续要用到的值。 注意下面代码中的 `TOPIC`，因为 `PUB` 套接字发送的消息需要绑定一个主题。主题用于供接收者过滤消息：

```
const size_t topic_size = strlen(TOPIC);
const size_t envelope_size = topic_size + 1 + PACKET_SIZE * sizeof(int16_t);

printf("Topic: %s; topic size: %zu; Envelope size: %zu\n", TOPIC, topic_size, envelope_size);
```

#### 发送消息

启动一个发送消息的循环，循环 `REPETITIONS` 次：

```
for (unsigned int i = 0; i < REPETITIONS; i++)
{
    ...
```

发送消息前，先填充一个长度为 `PACKET_SIZE` 的缓冲区。本库提供的是 16 个位的有符号整数。因为 C 语言中 `int` 类型占用空间大小与平台相关，不是确定的值，所以要使用指定宽度的 `int` 变量：

```
int16_t buffer[PACKET_SIZE];

for (unsigned int j = 0; j < PACKET_SIZE; j++)
{
    buffer[j] = fancyhw_read_val();
}

printf("Read %u data values\n", PACKET_SIZE);
```

消息的准备和发送的第一步是创建 ZeroMQ 消息，为消息分配必要的内存空间。空白的消息是用于封装要发送的数据的：

```
zmq_msg_t envelope;

const int rmi = zmq_msg_init_size(&envelope, envelope_size);
if (rmi != 0)
{
    printf("ERROR: ZeroMQ error occurred during zmq_msg_init_size(): %s\n", zmq_strerror(errno));

    zmq_msg_close(&envelope);

    break;
}
```

现在内存空间已分配，数据保存在 ZeroMQ 消息 “信封”中。函数 `zmq_msg_data()` 返回一个指向封装数据缓存区顶端的指针。第一部分是主题，之后是一个空格，最后是二进制数。主题和二进制数据之间的分隔符采用空格字符。需要遍历缓存区的话，使用类型转换和 [指针算法][18]。（感谢 C 语言，让事情变得直截了当。）做法如下：

```
memcpy(zmq_msg_data(&envelope), TOPIC, topic_size);
memcpy((void*)((char*)zmq_msg_data(&envelope) + topic_size), " ", 1);
memcpy((void*)((char*)zmq_msg_data(&envelope) + 1 + topic_size), buffer, PACKET_SIZE * sizeof(int16_t))
```

通过 `data_socket` 发送消息：

```
const size_t rs = zmq_msg_send(&envelope, data_socket, 0);
if (rs != envelope_size)
{
    printf("ERROR: ZeroMQ error occurred during zmq_msg_send(): %s\n", zmq_strerror(errno));

    zmq_msg_close(&envelope);

    break;
}
```

使用数据之前要先解除封装：

```
zmq_msg_close(&envelope);

printf("Message sent; i: %u, topic: %s\n", i, TOPIC);
```

#### 清理

C 语言不提供 [垃圾收集][20] 功能，用完之后记得要自己扫尾。发送消息之后结束程序之前，需要运行扫尾代码，释放分配的内存:

```
const int rc = zmq_close(data_socket);

if (rc != 0)
{
    printf("ERROR: ZeroMQ error occurred during zmq_close(): %s\n", zmq_strerror(errno));

    return EXIT_FAILURE;
}

const int rd = zmq_ctx_destroy(context);

if (rd != 0)
{
    printf("Error occurred during zmq_ctx_destroy(): %s\n", zmq_strerror(errno));

    return EXIT_FAILURE;
}

return EXIT_SUCCESS;
```

#### 完整 C 代码

保存下面完整的接口代码到本地名为 `hw_interface.c` 的文件：

```
// For printf()
#include <stdio.h>
// For EXIT_*
#include <stdlib.h>
// For memcpy()
#include <string.h>
// For sleep()
#include <unistd.h>

#include <zmq.h>

#include "libfancyhw.h"

int main(void)
{
    const unsigned int INIT_PARAM = 12345;
    const unsigned int REPETITIONS = 10;
    const unsigned int PACKET_SIZE = 16;
    const char *TOPIC = "fancyhw_data";

    fancyhw_init(INIT_PARAM);

    void *context = zmq_ctx_new();

    if (!context)
    {
        printf("ERROR: ZeroMQ error occurred during zmq_ctx_new(): %s\n", zmq_strerror(errno));

        return EXIT_FAILURE;
    }

    void *data_socket = zmq_socket(context, ZMQ_PUB);

    const int rb = zmq_bind(data_socket, "tcp://*:5555");

    if (rb != 0)
    {
        printf("ERROR: ZeroMQ error occurred during zmq_ctx_new(): %s\n", zmq_strerror(errno));

        return EXIT_FAILURE;
    }

    const size_t topic_size = strlen(TOPIC);
    const size_t envelope_size = topic_size + 1 + PACKET_SIZE * sizeof(int16_t);

    printf("Topic: %s; topic size: %zu; Envelope size: %zu\n", TOPIC, topic_size, envelope_size);

    for (unsigned int i = 0; i < REPETITIONS; i++)
    {
        int16_t buffer[PACKET_SIZE];

        for (unsigned int j = 0; j < PACKET_SIZE; j++)
        {
            buffer[j] = fancyhw_read_val();
        }

        printf("Read %u data values\n", PACKET_SIZE);

        zmq_msg_t envelope;
   
        const int rmi = zmq_msg_init_size(&envelope, envelope_size);
        if (rmi != 0)
        {
            printf("ERROR: ZeroMQ error occurred during zmq_msg_init_size(): %s\n", zmq_strerror(errno));
   
            zmq_msg_close(&envelope);
   
            break;
        }
       
        memcpy(zmq_msg_data(&envelope), TOPIC, topic_size);

        memcpy((void*)((char*)zmq_msg_data(&envelope) + topic_size), " ", 1);

        memcpy((void*)((char*)zmq_msg_data(&envelope) + 1 + topic_size), buffer, PACKET_SIZE * sizeof(int16_t));
   
        const size_t rs = zmq_msg_send(&envelope, data_socket, 0);
        if (rs != envelope_size)
        {
            printf("ERROR: ZeroMQ error occurred during zmq_msg_send(): %s\n", zmq_strerror(errno));
   
            zmq_msg_close(&envelope);
   
            break;
        }
   
        zmq_msg_close(&envelope);

        printf("Message sent; i: %u, topic: %s\n", i, TOPIC);

        sleep(1);
    }

    const int rc = zmq_close(data_socket);

    if (rc != 0)
    {
        printf("ERROR: ZeroMQ error occurred during zmq_close(): %s\n", zmq_strerror(errno));

        return EXIT_FAILURE;
    }

    const int rd = zmq_ctx_destroy(context);

    if (rd != 0)
    {
        printf("Error occurred during zmq_ctx_destroy(): %s\n", zmq_strerror(errno));

        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}
```

用如下命令编译：

```
$ clang -std=c99 -I. hw_interface.c -lzmq -o hw_interface
```

如果没有编译错误，你就可以运行这个接口了。贴心的是，ZeroMQ `PUB` 套接字可以在没有任何应用发送或接受数据的状态下运行，这简化了使用复杂度，因为这样不限制进程启动的次序。

运行该接口：

```
$ ./hw_interface
Topic: fancyhw_data; topic size: 12; Envelope size: 45
Read 16 data values
Message sent; i: 0, topic: fancyhw_data
Read 16 data values
Message sent; i: 1, topic: fancyhw_data
Read 16 data values
...
...
```

输出显示数据已经通过 ZeroMQ 完成发送，现在要做的是让一个程序去读数据。

### 编写 Python 数据处理器

现在已经准备好从 C 程序向 Python 应用传送数据了。

#### 库

需要两个库帮助实现数据传输。首先是 ZeroMQ 的 Python 封装：

```
$ python3 -m pip install zmq
```

另一个就是 [struct 库][21]，用于解码二进制数据。这个库是 Python 标准库的一部分，所以不需要使用 `pip` 命令安装。

Python 程序的第一部分是导入这些库：

```
import zmq
import struct
```

#### 重要参数

使用 ZeroMQ 时，只能向常量 `TOPIC` 定义相同的接收端发送消息：

```
topic = "fancyhw_data".encode('ascii')

print("Reading messages with topic: {}".format(topic))
```

#### 初始化

下一步，初始化上下文和套接字。使用 `subscribe` 套接字（也称为 `SUB` 套接字），它是 `PUB` 套接字的天生伴侣。这个套接字发送时也需要匹配主题。

```
with zmq.Context() as context:
    socket = context.socket(zmq.SUB)

    socket.connect("tcp://127.0.0.1:5555")
    socket.setsockopt(zmq.SUBSCRIBE, topic)

    i = 0

    ...
```

#### 接收消息

启动一个无限循环，等待接收发送到 `SUB` 套接字的新消息。这个循环会在你按下 `Ctrl+C` 组合键或者内部发生错误时终止：

```
    try:
        while True:

            ... # we will fill this in next

    except KeyboardInterrupt:
        socket.close()
    except Exception as error:
        print("ERROR: {}".format(error))
        socket.close()
```

这个循环等待 `recv()` 方法获取的新消息，然后将接收到的内容从第一个空格字符处分割开，从而得到主题：


```
binary_topic, data_buffer = socket.recv().split(b' ', 1)
```

#### 解码消息

Python 此时尚不知道主题是个字符串，使用标准 ASCII 编解码器进行解码：

```
topic = binary_topic.decode(encoding = 'ascii')

print("Message {:d}:".format(i))
print("\ttopic: '{}'".format(topic))
```

下一步就是使用 `struct` 库读取二进制数据，它可以将二进制数据段转换为明确的数值。首先，计算数据包中数值的组数。本例中使用的 16 个位的有符号整数对应的是 `struct` [格式字符][22] 中的 `h`：

```
packet_size = len(data_buffer) // struct.calcsize("h")

print("\tpacket size: {:d}".format(packet_size))
```

知道数据包中有多少组数据后，就可以通过构建一个包含数据组数和数据类型的字符串，来定义格式了（比如“`16h`”）：

```
struct_format = "{:d}h".format(packet_size)
```

将二进制数据串转换为可直接打印的一系列数字：

```
data = struct.unpack(struct_format, data_buffer)

print("\tdata: {}".format(data))
```

#### 完整 Python 代码

下面是 Python 实现的完整的接收端：

```
#! /usr/bin/env python3

import zmq
import struct

topic = "fancyhw_data".encode('ascii')

print("Reading messages with topic: {}".format(topic))

with zmq.Context() as context:
    socket = context.socket(zmq.SUB)

    socket.connect("tcp://127.0.0.1:5555")
    socket.setsockopt(zmq.SUBSCRIBE, topic)

    i = 0

    try:
        while True:
            binary_topic, data_buffer = socket.recv().split(b' ', 1)

            topic = binary_topic.decode(encoding = 'ascii')

            print("Message {:d}:".format(i))
            print("\ttopic: '{}'".format(topic))

            packet_size = len(data_buffer) // struct.calcsize("h")

            print("\tpacket size: {:d}".format(packet_size))

            struct_format = "{:d}h".format(packet_size)

            data = struct.unpack(struct_format, data_buffer)

            print("\tdata: {}".format(data))

            i += 1

    except KeyboardInterrupt:
        socket.close()
    except Exception as error:
        print("ERROR: {}".format(error))
        socket.close()
```

将上面的内容保存到名为 `online_analysis.py` 的文件。Python 代码不需要编译，你可以直接运行它。

运行输出如下：

```
$ ./online_analysis.py
Reading messages with topic: b'fancyhw_data'
Message 0:
        topic: 'fancyhw_data'
        packet size: 16
        data: (20946, -23616, 9865, 31416, -15911, -10845, -5332, 25662, 10955, -32501, -18717, -24490, -16511, -28861, 24205, 26568)
Message 1:
        topic: 'fancyhw_data'
        packet size: 16
        data: (12505, 31355, 14083, -19654, -9141, 14532, -25591, 31203, 10428, -25564, -732, -7979, 9529, -27982, 29610, 30475)
...
...
```

### 小结

本教程介绍了一种新方式，实现从基于 C 的硬件接口收集数据，并分发到基于 Python 的基础设施的功能。借此可以获取数据供后续分析，或者转送到任意数量的接收端去。它采用了一个消息库实现数据在发送者和处理者之间的传送，来取代同样功能规模庞大的软件。

本教程还引出了我称之为“软件粒度”的概念，换言之，就是将软件细分为更小的部分。这种做法的优点之一就是，使得同时采用不同的编程语言实现最简接口作为不同部分之间沟通的组件成为可能。

实践中，这种设计使得软件工程师能以更独立、合作更高效的方式做事。不同的团队可以专注于数据分析的不同方面，可以选择自己中意的实现工具。这种做法的另一个优点是实现了零代价的并行，因为所有的进程都可以并行运行。[ZeroMQ 消息库][3] 是个令人赞叹的软件，使用它可以让工作大大简化。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/zeromq-c-python

作者：[Cristiano L. Fontana][a]
选题：[lujun9972][b]
译者：[silentdawn-zz](https://github.com/译者ID)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cristianofontana
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_chat_communication_message.png?itok=LKjiLnQu (Chat via email)
[2]: https://docs.python.org/3/extending/extending.html
[3]: https://zeromq.org/
[4]: https://en.wikipedia.org/wiki/Network_socket
[5]: https://en.wikipedia.org/wiki/Pieter_Hintjens
[6]: http://hintjens.com/
[7]: https://gcc.gnu.org/
[8]: https://clang.llvm.org/
[9]: https://github.com/zeromq/libzmq#installation-of-binary-packages-
[10]: https://www.python.org/downloads/
[11]: https://zeromq.org/languages/python/
[12]: http://www.opengroup.org/onlinepubs/009695399/functions/srand.html
[13]: http://www.opengroup.org/onlinepubs/009695399/functions/rand.html
[14]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[15]: https://en.wikipedia.org/wiki/Transmission_Control_Protocol
[16]: http://zguide.zeromq.org/page:all#Plugging-Sockets-into-the-Topology
[17]: http://www.opengroup.org/onlinepubs/009695399/functions/strlen.html
[18]: https://en.wikipedia.org/wiki/Pointer_%28computer_programming%29%23C_and_C++
[19]: http://www.opengroup.org/onlinepubs/009695399/functions/memcpy.html
[20]: https://en.wikipedia.org/wiki/Garbage_collection_(computer_science)
[21]: https://docs.python.org/3/library/struct.html
[22]: https://docs.python.org/3/library/struct.html#format-characters
