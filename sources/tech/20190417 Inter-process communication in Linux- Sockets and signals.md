[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Inter-process communication in Linux: Sockets and signals)
[#]: via: (https://opensource.com/article/19/4/interprocess-communication-linux-networking)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)

Inter-process communication in Linux: Sockets and signals
======
Learn how processes synchronize with each other in Linux.
![Mesh networking connected dots][1]

This is the third and final article in a series about [interprocess communication][2] (IPC) in Linux. The [first article][3] focused on IPC through shared storage (files and memory segments), and the [second article][4] does the same for basic channels: pipes (named and unnamed) and message queues. This article moves from IPC at the high end (sockets) to IPC at the low end (signals). Code examples flesh out the details.

## Sockets

Just as pipes come in two flavors (named and unnamed), so do sockets. IPC sockets (aka Unix domain sockets) enable channel-based communication for processes on the same physical device ( _host_ ), whereas network sockets enable this kind of IPC for processes that can run on different hosts, thereby bringing networking into play. Network sockets need support from an underlying protocol such as TCP (Transmission Control Protocol) or the lower-level UDP (User Datagram Protocol).

By contrast, IPC sockets rely upon the local system kernel to support communication; in particular, IPC sockets communicate using a local file as a socket address. Despite these implementation differences, the IPC socket and network socket APIs are the same in the essentials. The forthcoming example covers network sockets, but the sample server and client programs can run on the same machine because the server uses network address _localhost_ (127.0.0.1), the address for the local machine on the local machine.

Sockets configured as streams (discussed below) are bidirectional, and control follows a client/server pattern: the client initiates the conversation by trying to connect to a server, which tries to accept the connection. If everything works, requests from the client and responses from the server then can flow through the channel until this is closed on either end, thereby breaking the connection.

An _iterative_ server, which is suited for development only, handles connected clients one at a time to completion: the first client is handled from start to finish, then the second, and so on. The downside is that the handling of a particular client may hang, which then starves all the clients waiting behind. A production-grade server would be _concurrent_ , typically using some mix of multi-processing and multi-threading. For example, the Nginx web server on my desktop machine has a pool of four worker processes that can handle client requests concurrently. The following code example keeps the clutter to a minimum by using an iterative server; the focus thus remains on the basic API, not on concurrency.

Finally, the socket API has evolved significantly over time as various POSIX refinements have emerged. The current sample code for server and client is deliberately simple but underscores the bidirectional aspect of a stream-based socket connection. Here's a summary of the flow of control, with the server started in a terminal then the client started in a separate terminal:

  * The server awaits client connections and, given a successful connection, reads the bytes from the client.
  * To underscore the two-way conversation, the server echoes back to the client the bytes received from the client. These bytes are ASCII character codes, which make up book titles.
  * The client writes book titles to the server process and then reads the same titles echoed from the server. Both the server and the client print the titles to the screen. Here is the server's output, essentially the same as the client's: [code] Listening on port 9876 for clients...
War and Peace
Pride and Prejudice
The Sound and the Fury 
```
### Example 1. The socket server
```


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/tcp.h>
#include <arpa/inet.h>
#include "sock.h"

void report(const char* msg, int terminate) {
[perror][5](msg);
if (terminate) [exit][6](-1); /* failure */
}

int main() {
int fd = socket(AF_INET, /* network versus AF_LOCAL */
SOCK_STREAM, /* reliable, bidirectional, arbitrary payload size */
0); /* system picks underlying protocol (TCP) */
if (fd < 0) report("socket", 1); /* terminate */

/* bind the server's local address in memory */
struct sockaddr_in saddr;
[memset][7](&saddr, 0, sizeof(saddr)); /* clear the bytes */
saddr.sin_family = AF_INET; /* versus AF_LOCAL */
saddr.sin_addr.s_addr = htonl(INADDR_ANY); /* host-to-network endian */
saddr.sin_port = htons(PortNumber); /* for listening */

if (bind(fd, (struct sockaddr *) &saddr, sizeof(saddr)) < 0)
report("bind", 1); /* terminate */

/* listen to the socket */
if (listen(fd, MaxConnects) < 0) /* listen for clients, up to MaxConnects */
report("listen", 1); /* terminate */

[fprintf][8](stderr, "Listening on port %i for clients...\n", PortNumber);
/* a server traditionally listens indefinitely */
while (1) {
struct sockaddr_in caddr; /* client address */
int len = sizeof(caddr); /* address length could change */

int client_fd = accept(fd, (struct sockaddr*) &caddr, &len); /* accept blocks */
if (client_fd < 0) {
report("accept", 0); /* don't terminate, though there's a problem */
continue;
}

/* read from client */
int i;
for (i = 0; i < ConversationLen; i++) {
char buffer[BuffSize + 1];
[memset][7](buffer, '\0', sizeof(buffer));
int count = read(client_fd, buffer, sizeof(buffer));
if (count > 0) {
[puts][9](buffer);
write(client_fd, buffer, sizeof(buffer)); /* echo as confirmation */
}
}
close(client_fd); /* break connection */
} /* while(1) */
return 0;
}

```
The server program above performs the classic four-step to ready itself for client requests and then to accept individual requests. Each step is named after a system function that the server calls:

  1. **socket(…)** : get a file descriptor for the socket connection
  2. **bind(…)** : bind the socket to an address on the server's host
  3. **listen(…)** : listen for client requests
  4. **accept(…)** : accept a particular client request



The **socket** call in full is:
```


int sockfd = socket(AF_INET, /* versus AF_LOCAL */
SOCK_STREAM, /* reliable, bidirectional */
0); /* system picks protocol (TCP) */

```
The first argument specifies a network socket as opposed to an IPC socket. There are several options for the second argument, but **SOCK_STREAM** and **SOCK_DGRAM** (datagram) are likely the most used. A _stream-based_ socket supports a reliable channel in which lost or altered messages are reported; the channel is bidirectional, and the payloads from one side to the other can be arbitrary in size. By contrast, a datagram-based socket is unreliable ( _best try_ ), unidirectional, and requires fixed-sized payloads. The third argument to **socket** specifies the protocol. For the stream-based socket in play here, there is a single choice, which the zero represents: TCP. Because a successful call to **socket** returns the familiar file descriptor, a socket is written and read with the same syntax as, for example, a local file.

The **bind** call is the most complicated, as it reflects various refinements in the socket API. The point of interest is that this call binds the socket to a memory address on the server machine. However, the **listen** call is straightforward:
```
`if (listen(fd, MaxConnects) < 0)`
```
The first argument is the socket's file descriptor and the second specifies how many client connections can be accommodated before the server issues a _connection refused_ error on an attempted connection. ( **MaxConnects** is set to 8 in the header file _sock.h_.)

The **accept** call defaults to a _blocking wait_ : the server does nothing until a client attempts to connect and then proceeds. The **accept** function returns **-1** to indicate an error. If the call succeeds, it returns another file descriptor—for a _read/write_ socket in contrast to the _accepting_ socket referenced by the first argument in the **accept** call. The server uses the read/write socket to read requests from the client and to write responses back. The accepting socket is used only to accept client connections.

By design, a server runs indefinitely. Accordingly, the server can be terminated with a **Ctrl+C** from the command line.

### Example 2. The socket client
```


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <netdb.h>
#include "sock.h"

const char* books[] = {"War and Peace",
"Pride and Prejudice",
"The Sound and the Fury"};

void report(const char* msg, int terminate) {
[perror][5](msg);
if (terminate) [exit][6](-1); /* failure */
}

int main() {
/* fd for the socket */
int sockfd = socket(AF_INET, /* versus AF_LOCAL */
SOCK_STREAM, /* reliable, bidirectional */
0); /* system picks protocol (TCP) */
if (sockfd < 0) report("socket", 1); /* terminate */

/* get the address of the host */
struct hostent* hptr = gethostbyname(Host); /* localhost: 127.0.0.1 */
if (!hptr) report("gethostbyname", 1); /* is hptr NULL? */
if (hptr->h_addrtype != AF_INET) /* versus AF_LOCAL */
report("bad address family", 1);

/* connect to the server: configure server's address 1st */
struct sockaddr_in saddr;
[memset][7](&saddr, 0, sizeof(saddr));
saddr.sin_family = AF_INET;
saddr.sin_addr.s_addr =
((struct in_addr*) hptr->h_addr_list[0])->s_addr;
saddr.sin_port = htons(PortNumber); /* port number in big-endian */

if (connect(sockfd, (struct sockaddr*) &saddr, sizeof(saddr)) < 0)
report("connect", 1);

/* Write some stuff and read the echoes. */
[puts][9]("Connect to server, about to write some stuff...");
int i;
for (i = 0; i < ConversationLen; i++) {
if (write(sockfd, books[i], [strlen][10](books[i])) > 0) {
/* get confirmation echoed from server and print */
char buffer[BuffSize + 1];
[memset][7](buffer, '\0', sizeof(buffer));
if (read(sockfd, buffer, sizeof(buffer)) > 0)
[puts][9](buffer);
}
}
[puts][9]("Client done, about to exit...");
close(sockfd); /* close the connection */
return 0;
}

```
The client program's setup code is similar to the server's. The principal difference between the two is that the client neither listens nor accepts, but instead connects:
```
`if (connect(sockfd, (struct sockaddr*) &saddr, sizeof(saddr)) < 0)`
```
The **connect** call might fail for several reasons; for example, the client has the wrong server address or too many clients are already connected to the server. If the **connect** operation succeeds, the client writes requests and then reads the echoed responses in a **for** loop. After the conversation, both the server and the client **close** the read/write socket, although a close operation on either side is sufficient to close the connection. The client exits thereafter but, as noted earlier, the server remains open for business.

The socket example, with request messages echoed back to the client, hints at the possibilities of arbitrarily rich conversations between the server and the client. Perhaps this is the chief appeal of sockets. It is common on modern systems for client applications (e.g., a database client) to communicate with a server through a socket. As noted earlier, local IPC sockets and network sockets differ only in a few implementation details; in general, IPC sockets have lower overhead and better performance. The communication API is essentially the same for both.

## Signals

A _signal_ interrupts an executing program and, in this sense, communicates with it. Most signals can be either ignored (blocked) or handled (through designated code), with **SIGSTOP** (pause) and **SIGKILL** (terminate immediately) as the two notable exceptions. Symbolic constants such as **SIGKILL** have integer values, in this case, 9.

Signals can arise in user interaction. For example, a user hits **Ctrl+C** from the command line to terminate a program started from the command-line; **Ctrl+C** generates a **SIGTERM** signal. **SIGTERM** for _terminate_ , unlike **SIGKILL** , can be either blocked or handled. One process also can signal another, thereby making signals an IPC mechanism.

Consider how a multi-processing application such as the Nginx web server might be shut down gracefully from another process. The **kill** function:
``