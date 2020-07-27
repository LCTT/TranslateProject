[#]: collector: (lujun9972)
[#]: translator: (silentdawn-zz)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Share data between C and Python with this messaging library)
[#]: via: (https://opensource.com/article/20/3/zeromq-c-python)
[#]: author: (Cristiano L. Fontana https://opensource.com/users/cristianofontana)

Share data between C and Python with this messaging library
======
ZeroMQ makes for a fast and resilient messaging library to gather data
and share between multiple languages.
![Chat via email][1]

I've had moments as a software engineer when I'm asked to do a task that sends shivers down my spine. One such moment was when I had to write an interface between some new hardware infrastructure that requires C and a cloud infrastructure, which is primarily Python.

One strategy could be to [write an extension in C][2], which Python supports by design. A quick glance at the documentation shows this would mean writing a good amount of C. That can be good in some cases, but it's not what I prefer to do. Another strategy is to put the two tasks in separate processes and exchange messages between the two with the [ZeroMQ messaging library][3].

When I experienced this type of scenario before discovering ZeroMQ, I went through the extension-writing path. It was not that bad, but it is very time-consuming and convoluted. Nowadays, to avoid that, I subdivide a system into independent processes that exchange information through messages sent over [communication sockets][4]. With this approach, several programming languages can coexist, and each process is simpler and thus easier to debug.

ZeroMQ provides an even easier process:

  1. Write a small shim in C that reads data from the hardware and sends whatever it finds as a message.
  2. Write a Python interface between the new and existing infrastructure.



One of ZeroMQ's project's founders is [Pieter Hintjens][5], a remarkable person with [interesting views and writings][6].

### Prerequisites

For this tutorial, you will need:

  * A C compiler (e.g., [GCC][7] or [Clang][8])
  * The [**libzmq** library][9]
  * [Python 3][10]
  * [ZeroMQ bindings][11] for python



Install them on Fedora with:


```
`$ dnf install clang zeromq zeromq-devel python3 python3-zmq`
```

For Debian or Ubuntu:


```
`$ apt-get install clang libzmq5 libzmq3-dev python3 python3-zmq`
```

If you run into any issues, refer to each project's installation instructions (which are linked above).

### Writing the hardware-interfacing library

Since this is a hypothetical scenario, this tutorial will write a fictitious library with two functions:

  * **fancyhw_init()** to initiate the (hypothetical) hardware
  * **fancyhw_read_val()** to return a value read from the hardware



Save the library's full source code to a file named **libfancyhw.h**:


```
#ifndef LIBFANCYHW_H
#define LIBFANCYHW_H

#include &lt;stdlib.h&gt;
#include &lt;stdint.h&gt;

// This is the fictitious hardware interfacing library

void fancyhw_init(unsigned int init_param)
{
    [srand][12](init_param);
}

int16_t fancyhw_read_val(void)
{
    return (int16_t)[rand][13]();
}

#endif
```

This library can simulate the data you want to pass between languages, thanks to the random number generator.

### Designing a C interface

The following will go step-by-step through writing the C interface—from including the libraries to managing the data transfer.

#### Libraries

Begin by loading the necessary libraries (the purpose of each library is in a comment in the code):


```
// For printf()
#include &lt;stdio.h&gt;
// For EXIT_*
#include &lt;stdlib.h&gt;
// For memcpy()
#include &lt;string.h&gt;
// For sleep()
#include &lt;unistd.h&gt;

#include &lt;zmq.h&gt;

#include "libfancyhw.h"
```

#### Significant parameters

Define the **main** function and the significant parameters needed for the rest of the program:


```
int main(void)
{
    const unsigned int INIT_PARAM = 12345;
    const unsigned int REPETITIONS = 10;
    const unsigned int PACKET_SIZE = 16;
    const char *TOPIC = "fancyhw_data";

    ...
```

#### Initialization

Both libraries need some initialization. The fictitious one needs just one parameter:


```
`fancyhw_init(INIT_PARAM);`
```

The ZeroMQ library needs some real initialization. First, define a **context**—an object that manages all the sockets:


```
void *context = zmq_ctx_new();

if (!context)
{
    [printf][14]("ERROR: ZeroMQ error occurred during zmq_ctx_new(): %s\n", zmq_strerror(errno));

    return EXIT_FAILURE;
}
```

Then define the socket used to deliver data. ZeroMQ supports several types of sockets, each with its application. Use a **publish** socket (also known as **PUB** socket), which can deliver copies of a message to multiple receivers. This approach enables you to attach several receivers that will all get the same messages. If there are no receivers, the messages will be discarded (i.e., they will not be queued). Do this with:


```
`void *data_socket = zmq_socket(context, ZMQ_PUB);`
```

The socket must be bound to an address so that the clients know where to connect. In this case, use the [TCP transport layer][15] (there are [other options][16], but TCP is a good default choice):


```
const int rb = zmq_bind(data_socket, "tcp://*:5555");

if (rb != 0)
{
    [printf][14]("ERROR: ZeroMQ error occurred during zmq_ctx_new(): %s\n", zmq_strerror(errno));

    return EXIT_FAILURE;
}
```

Next, calculate some useful values that you will need later. Note **TOPIC** in the code below; **PUB** sockets need a topic to be associated with the messages they send. Topics can be used by the receivers to filter messages:


```
const size_t topic_size = [strlen][17](TOPIC);
const size_t envelope_size = topic_size + 1 + PACKET_SIZE * sizeof(int16_t);

[printf][14]("Topic: %s; topic size: %zu; Envelope size: %zu\n", TOPIC, topic_size, envelope_size);
```

#### Sending messages

Start a loop that sends **REPETITIONS** messages:


```
for (unsigned int i = 0; i &lt; REPETITIONS; i++)
{
    ...
```

Before sending a message, fill a buffer of **PACKET_SIZE** values. The library provides signed integers of 16 bits. Since the dimension of an **int** in C is not defined, use an **int** with a specific width:


```
int16_t buffer[PACKET_SIZE];

for (unsigned int j = 0; j &lt; PACKET_SIZE; j++)
{
    buffer[j] = fancyhw_read_val();
}

[printf][14]("Read %u data values\n", PACKET_SIZE);
```

The first step in message preparation and delivery is creating a ZeroMQ message and allocating the memory necessary for your message. This empty message is an envelope to store the data you will ship:


```
zmq_msg_t envelope;

const int rmi = zmq_msg_init_size(&amp;envelope, envelope_size);
if (rmi != 0)
{
    [printf][14]("ERROR: ZeroMQ error occurred during zmq_msg_init_size(): %s\n", zmq_strerror(errno));

    zmq_msg_close(&amp;envelope);

    break;
}
```

Now that the memory is allocated, store the data in the ZeroMQ message "envelope." The **zmq_msg_data()** function returns a pointer to the beginning of the buffer in the envelope. The first part is the topic, followed by a space, then the binary data. Add whitespace as a separator between the topic and the data. To move along the buffer, you have to play with casts and [pointer arithmetic][18]. (Thank you, C, for making things straightforward.) Do this with:


```
[memcpy][19](zmq_msg_data(&amp;envelope), TOPIC, topic_size);
[memcpy][19]((void*)((char*)zmq_msg_data(&amp;envelope) + topic_size), " ", 1);
[memcpy][19]((void*)((char*)zmq_msg_data(&amp;envelope) + 1 + topic_size), buffer, PACKET_SIZE * sizeof(int16_t));
```

Send the message through the **data_socket**:


```
const size_t rs = zmq_msg_send(&amp;envelope, data_socket, 0);
if (rs != envelope_size)
{
    [printf][14]("ERROR: ZeroMQ error occurred during zmq_msg_send(): %s\n", zmq_strerror(errno));

    zmq_msg_close(&amp;envelope);

    break;
}
```

Make sure to dispose of the envelope after you use it:


```
zmq_msg_close(&amp;envelope);

[printf][14]("Message sent; i: %u, topic: %s\n", i, TOPIC);
```

#### Clean it up

Because C does not provide [garbage collection][20], you have to tidy up. After you are done sending your messages, close the program with the clean-up needed to release the used memory:


```
const int rc = zmq_close(data_socket);

if (rc != 0)
{
    [printf][14]("ERROR: ZeroMQ error occurred during zmq_close(): %s\n", zmq_strerror(errno));

    return EXIT_FAILURE;
}

const int rd = zmq_ctx_destroy(context);

if (rd != 0)
{
    [printf][14]("Error occurred during zmq_ctx_destroy(): %s\n", zmq_strerror(errno));

    return EXIT_FAILURE;
}

return EXIT_SUCCESS;
```

#### The entire C program

Save the full interface library below to a local file called **hw_interface.c**:


```
// For printf()
#include &lt;stdio.h&gt;
// For EXIT_*
#include &lt;stdlib.h&gt;
// For memcpy()
#include &lt;string.h&gt;
// For sleep()
#include &lt;unistd.h&gt;

#include &lt;zmq.h&gt;

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
        [printf][14]("ERROR: ZeroMQ error occurred during zmq_ctx_new(): %s\n", zmq_strerror(errno));

        return EXIT_FAILURE;
    }

    void *data_socket = zmq_socket(context, ZMQ_PUB);

    const int rb = zmq_bind(data_socket, "tcp://*:5555");

    if (rb != 0)
    {
        [printf][14]("ERROR: ZeroMQ error occurred during zmq_ctx_new(): %s\n", zmq_strerror(errno));

        return EXIT_FAILURE;
    }

    const size_t topic_size = [strlen][17](TOPIC);
    const size_t envelope_size = topic_size + 1 + PACKET_SIZE * sizeof(int16_t);

    [printf][14]("Topic: %s; topic size: %zu; Envelope size: %zu\n", TOPIC, topic_size, envelope_size);

    for (unsigned int i = 0; i &lt; REPETITIONS; i++)
    {
        int16_t buffer[PACKET_SIZE];

        for (unsigned int j = 0; j &lt; PACKET_SIZE; j++)
        {
            buffer[j] = fancyhw_read_val();
        }

        [printf][14]("Read %u data values\n", PACKET_SIZE);

        zmq_msg_t envelope;
   
        const int rmi = zmq_msg_init_size(&amp;envelope, envelope_size);
        if (rmi != 0)
        {
            [printf][14]("ERROR: ZeroMQ error occurred during zmq_msg_init_size(): %s\n", zmq_strerror(errno));
   
            zmq_msg_close(&amp;envelope);
   
            break;
        }
       
        [memcpy][19](zmq_msg_data(&amp;envelope), TOPIC, topic_size);

        [memcpy][19]((void*)((char*)zmq_msg_data(&amp;envelope) + topic_size), " ", 1);

        [memcpy][19]((void*)((char*)zmq_msg_data(&amp;envelope) + 1 + topic_size), buffer, PACKET_SIZE * sizeof(int16_t));
   
        const size_t rs = zmq_msg_send(&amp;envelope, data_socket, 0);
        if (rs != envelope_size)
        {
            [printf][14]("ERROR: ZeroMQ error occurred during zmq_msg_send(): %s\n", zmq_strerror(errno));
   
            zmq_msg_close(&amp;envelope);
   
            break;
        }
   
        zmq_msg_close(&amp;envelope);

        [printf][14]("Message sent; i: %u, topic: %s\n", i, TOPIC);

        sleep(1);
    }

    const int rc = zmq_close(data_socket);

    if (rc != 0)
    {
        [printf][14]("ERROR: ZeroMQ error occurred during zmq_close(): %s\n", zmq_strerror(errno));

        return EXIT_FAILURE;
    }

    const int rd = zmq_ctx_destroy(context);

    if (rd != 0)
    {
        [printf][14]("Error occurred during zmq_ctx_destroy(): %s\n", zmq_strerror(errno));

        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}
```

Compile using the command:


```
`$ clang -std=c99 -I. hw_interface.c -lzmq -o hw_interface`
```

If there are no compilation errors, you can run the interface. What's great is that ZeroMQ **PUB** sockets can run without any applications sending or retrieving data. That reduces complexity because there is no obligation in terms of which process needs to start first.

Run the interface:


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

The output shows the data being sent through ZeroMQ. Now you need an application to read the data.

### Write a Python data processor

You are now ready to pass the data from C to a Python application.

#### Libraries

You need two libraries to help transfer data. First, you need ZeroMQ bindings in Python:


```
`$ python3 -m pip install zmq`
```

The other is the [**struct** library][21], which decodes binary data. It's commonly available with the Python standard library, so there's no need to **pip install** it.

The first part of the Python program imports both of these libraries:


```
import zmq
import struct
```

#### Significant parameters

To use ZeroMQ, you must subscribe to the same topic used in the constant **TOPIC** above:


```
topic = "fancyhw_data".encode('ascii')

print("Reading messages with topic: {}".format(topic))
```

#### Initialization

Next, initialize the context and the socket. Use a **subscribe** socket (also known as a **SUB** socket), which is the natural partner of the **PUB** socket. The socket also needs to subscribe to the right topic:


```
with zmq.Context() as context:
    socket = context.socket(zmq.SUB)

    socket.connect("tcp://127.0.0.1:5555")
    socket.setsockopt(zmq.SUBSCRIBE, topic)

    i = 0

    ...
```

#### Receiving messages

Start an infinite loop that waits for new messages to be delivered to the SUB socket. The loop will be closed if you press **Ctrl+C** or if an error occurs:


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

The loop waits for new messages to arrive with the **recv()** method. Then it splits whatever is received at the first space to separate the topic from the content:


```
`binary_topic, data_buffer = socket.recv().split(b' ', 1)`
```

#### Decoding messages

Python does yet not know that the topic is a string, so decode it using the standard ASCII encoding:


```
topic = binary_topic.decode(encoding = 'ascii')

print("Message {:d}:".format(i))
print("\ttopic: '{}'".format(topic))
```

The next step is to read the binary data using the **struct** library, which can convert shapeless binary blobs to significant values. First, calculate the number of values stored in the packet. This example uses 16-bit signed integers that correspond to an "h" in the **struct** [format][22]:


```
packet_size = len(data_buffer) // struct.calcsize("h")

print("\tpacket size: {:d}".format(packet_size))
```

By knowing how many values are in the packet, you can define the format by preparing a string with the number of values and their types (e.g., "**16h**"):


```
`struct_format = "{:d}h".format(packet_size)`
```

Convert that binary blob to a series of numbers that you can immediately print:


```
data = struct.unpack(struct_format, data_buffer)

print("\tdata: {}".format(data))
```

#### The full Python program

Here is the complete data receiver in Python:


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

Save it to a file called **online_analysis.py**. Python does not need to be compiled, so you can run the program immediately.

Here is the output:


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

### Conclusion

This tutorial describes an alternative way of gathering data from C-based hardware interfaces and providing it to Python-based infrastructures. You can take this data and analyze it or pass it off in any number of directions. It employs a messaging library to deliver data between a "gatherer" and an "analyzer" instead of having a monolithic piece of software that does everything.

This tutorial also increases what I call "software granularity." In other words, it subdivides the software into smaller units. One of the benefits of this strategy is the possibility of using different programming languages at the same time with minimal interfaces acting as shims between them.

In practice, this design allows software engineers to work both more collaboratively and independently. Different teams may work on different steps of the analysis, choosing the tool they prefer. Another benefit is the parallelism that comes for free since all the processes can run in parallel. The [ZeroMQ messaging library][3] is a remarkable piece of software that makes all of this much easier.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/zeromq-c-python

作者：[Cristiano L. Fontana][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
