[#]: subject: "Learn the OSI model in 5 minutes"
[#]: via: "https://opensource.com/article/22/10/osi-model-network-communications"
[#]: author: "Anamika https://opensource.com/users/anamika"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Learn the OSI model in 5 minutes
======
Get the basics of the Open Systems Interconnection (OSI) framework for conceptualizing communication within a computer system.

The Open Systems Interconnection (OSI) model is a standard for how computers, servers, and people communicate within a system. It was the first standard model for network communications and was adopted in the early 1980s by all major computer and telecommunications companies.

The OSI model provides a universal language for describing networks and thinking about them in discrete chunks, or layers.

### Layers of the OSI model

The model describes the seven layers through which computer systems communicate over a network.

1. [Application layer][2]
2. [Presentation layer][3]
3. [Session layer][4]
4. [Transport layer][5]
5. [Network layer][6]
6. [Data link layer][7]
7. [Physical layer][8]

Each of these layers has its own way of working, with its own set of protocols that distinguish it from the others. This article provides a breakdown of the layers one by one.

### Application layer

The application layer is implemented in software. It is the layer used to interact with applications.

Consider the example of sending a message. The sender will interact with the application layer and send the message. The application layer sends the message to the next layer in the OSI Model, the presentation layer.

### Presentation layer

The data from the application layer is forwarded to the presentation layer. The presentation layer receives the data in the form of words, characters, letters, numbers, and so on, and converts them into machine representable binary format. This process is known as translation.

At this stage, ASCII characters (American Standard Code for Information Interchange) are converted into Extended Binary Coded Decimal Interchange Code (EBCDIC). Before the converted data goes further, it also undergoes encoding and encryption processes, using the SSL protocol for encryption and decryption.

The presentation layer provides abstraction and assumes that the layers following it will take care of the data forwarded to them from this layer. It also plays a role in compression of the data. The compression can be lossy or lossless, depending on various factors beyond this article's scope.

### Session layer

The session layer helps in setting up and managing connections. The main work of this layer is to establish a session. For example, on an online shopping site, a session is created between your computer and the site's server.

The session layer enables the sending and receiving of data, followed by the termination of connected sessions. Authentication is done before a session is established, followed by authorization. Like the previous layers, the session layer also assumes that, after its work is done, the data will be correctly handled by the subsequent layers.

### Transport layer

The transport layer manages data transportation and its own set of protocols for how data will be transferred. The data received here from the session layer is divided into smaller data units called segments. This process is known as segmentation. Every segment contains the source's and destination's port numbers and a sequence number. Port numbers identify the application on which the data needs to be sent. Note that the data is transferred in chunks. The sequence numbers are used to reassemble the segments in the correct order.

The transport layer takes care of the flow control, or the amount of data transferred at a given time. It also accounts for error control, such as data loss, data corruption, and so on. It makes use of an error-detecting value known as a checksum. The transport layer adds a checksum to every data segment to check whether the sent data is received correctly. Data is then transferred to the network layer.

### Network layer

The network layer helps communicate with other networks. It works to transmit received data segments from one computer to another located in a different network. The router lives in the network layer.

The function of the network layer is logical addressing (IP Addressing). It assigns the sender's and receiver's IP addresses to each data packet to ensure it is received at the correct destination. The network layer then routes the data packets. Load balancing also happens in the network layer to make sure that no overloading takes place. Next, the data is transported to the data link layer.

### Data link layer

The data link layer allows direct communication with other devices, such as computers and hosts.

It receives data packets containing the IP addresses of the sender and receiver from the network layer and does the physical addressing, assigning the media access control (MAC) addresses of the sender and receiver to a data packet to form a frame.

### Physical layer

This layer consists of all the hardware and mechanical elements of a system, including the configuration of wires, pins, adapters, and so forth. The data received here by the preceding layers is in the form of 0s and 1s. The physical layer converts this data and transports it to local media via various means, including wires, electrical signals, light signals (as in optical fiber cables), and radio signals (as in WiFi).

Note that the physical layer works at the receiver's end and transports the received signal to the data link as a frame (by converting it back to bits). The frame is moved to the higher layers, and ultimately the required data is received at the application layer, which is the software.

### Conclusion

The OSI model is helpful when you need to describe network architecture or troubleshoot network problems. I hope this article gave you a clearer understanding of the elements this model.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/10/osi-model-network-communications

作者：[Anamika][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/anamika
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/code_computer_development_programming.png
[2]: https://opensource.com/article/22/10/osi-model-network-communications#application-layer
[3]: https://opensource.com/article/22/10/osi-model-network-communications#presentation-layer
[4]: https://opensource.com/article/22/10/osi-model-network-communications#session-layer
[5]: https://opensource.com/article/22/10/osi-model-network-communications#transport-layer
[6]: https://opensource.com/article/22/10/osi-model-network-communications#network-layer
[7]: https://opensource.com/article/22/10/osi-model-network-communications#data-link-layer
[8]: https://opensource.com/article/22/10/osi-model-network-communications#physical-layer
