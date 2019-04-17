[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Inter-process communication in Linux: Shared storage)
[#]: via: (https://opensource.com/article/19/4/interprocess-communication-linux-storage)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)

Inter-process communication in Linux: Shared storage
======
Learn how processes synchronize with each other in Linux.
![Filing papers and documents][1]

This is the first article in a series about [interprocess communication][2] (IPC) in Linux. The series uses code examples in C to clarify the following IPC mechanisms:

  * Shared files
  * Shared memory (with semaphores)
  * Pipes (named and unnamed)
  * Message queues
  * Sockets
  * Signals



This article reviews some core concepts before moving on to the first two of these mechanisms: shared files and shared memory.

### Core concepts

A _process_ is a program in execution, and each process has its own address space, which comprises the memory locations that the process is allowed to access. A process has one or more _threads_ of execution, which are sequences of executable instructions: a _single-threaded_ process has just one thread, whereas a _multi-threaded_ process has more than one thread. Threads within a process share various resources, in particular, address space. Accordingly, threads within a process can communicate straightforwardly through shared memory, although some modern languages (e.g., Go) encourage a more disciplined approach such as the use of thread-safe channels. Of interest here is that different processes, by default, do _not_ share memory.

There are various ways to launch processes that then communicate, and two ways dominate in the examples that follow:

  * A terminal is used to start one process, and perhaps a different terminal is used to start another.
  * The system function **fork** is called within one process (the parent) to spawn another process (the child).



The first examples take the terminal approach. The [code examples][3] are available in a ZIP file on my website.

### Shared files

Programmers are all too familiar with file access, including the many pitfalls (non-existent files, bad file permissions, and so on) that beset the use of files in programs. Nonetheless, shared files may be the most basic IPC mechanism. Consider the relatively simple case in which one process ( _producer_ ) creates and writes to a file, and another process ( _consumer_ ) reads from this same file:


```
writes +-----------+ reads
producer-------->| disk file |<\-------consumer
+-----------+
```

The obvious challenge in using this IPC mechanism is that a _race condition_ might arise: the producer and the consumer might access the file at exactly the same time, thereby making the outcome indeterminate. To avoid a race condition, the file must be locked in a way that prevents a conflict between a _write_ operation and any another operation, whether a _read_ or a _write_. The locking API in the standard system library can be summarized as follows:

  * A producer should gain an exclusive lock on the file before writing to the file. An _exclusive_ lock can be held by one process at most, which rules out a race condition because no other process can access the file until the lock is released.
  * A consumer should gain at least a shared lock on the file before reading from the file. Multiple _readers_ can hold a _shared_ lock at the same time, but no _writer_ can access a file when even a single _reader_ holds a shared lock.



A shared lock promotes efficiency. If one process is just reading a file and not changing its contents, there is no reason to prevent other processes from doing the same. Writing, however, clearly demands exclusive access to a file.

The standard I/O library includes a utility function named **fcntl** that can be used to inspect and manipulate both exclusive and shared locks on a file. The function works through a _file descriptor_ , a non-negative integer value that, within a process, identifies a file. (Different file descriptors in different processes may identify the same physical file.) For file locking, Linux provides the library function **flock** , which is a thin wrapper around **fcntl**. The first example uses the **fcntl** function to expose API details.

#### Example 1. The _producer_ program


```
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>

#define FileName "data.dat"
#define DataString "Now is the winter of our discontent\nMade glorious summer by this sun of York\n"

void report_and_exit(const char* msg) {
[perror][4](msg);
[exit][5](-1); /* EXIT_FAILURE */
}

int main() {
struct flock lock;
lock.l_type = F_WRLCK; /* read/write (exclusive versus shared) lock */
lock.l_whence = SEEK_SET; /* base for seek offsets */
lock.l_start = 0; /* 1st byte in file */
lock.l_len = 0; /* 0 here means 'until EOF' */
lock.l_pid = getpid(); /* process id */

int fd; /* file descriptor to identify a file within a process */
if ((fd = open(FileName, O_RDWR | O_CREAT, 0666)) < 0) /* -1 signals an error */
report_and_exit("open failed...");

if (fcntl(fd, F_SETLK, &lock) < 0) /** F_SETLK doesn't block, F_SETLKW does **/
report_and_exit("fcntl failed to get lock...");
else {
write(fd, DataString, [strlen][6](DataString)); /* populate data file */
[fprintf][7](stderr, "Process %d has written to data file...\n", lock.l_pid);
}

/* Now release the lock explicitly. */
lock.l_type = F_UNLCK;
if (fcntl(fd, F_SETLK, &lock) < 0)
report_and_exit("explicit unlocking failed...");

close(fd); /* close the file: would unlock if needed */
return 0; /* terminating the process would unlock as well */
}
```

The main steps in the _producer_ program above can be summarized as follows:

  * The program declares a variable of type **struct flock** , which represents a lock, and initializes the structure's five fields. The first initialization: [code]`lock.l_type = F_WRLCK; /* exclusive lock */`[/code] makes the lock an exclusive ( _read-write_ ) rather than a shared ( _read-only_ ) lock. If the _producer_ gains the lock, then no other process will be able to write or read the file until the _producer_ releases the lock, either explicitly with the appropriate call to **fcntl** or implicitly by closing the file. (When the process terminates, any opened files would be closed automatically, thereby releasing the lock.)
  * The program then initializes the remaining fields. The chief effect is that the _entire_ file is to be locked. However, the locking API allows only designated bytes to be locked. For example, if the file contains multiple text records, then a single record (or even part of a record) could be locked and the rest left unlocked.
  * The first call to **fcntl** : [code]`if (fcntl(fd, F_SETLK, &lock) < 0)`[/code] tries to lock the file exclusively, checking whether the call succeeded. In general, the **fcntl** function returns **-1** (hence, less than zero) to indicate failure. The second argument **F_SETLK** means that the call to **fcntl** does _not_ block: the function returns immediately, either granting the lock or indicating failure. If the flag **F_SETLKW** (the **W** at the end is for _wait_ ) were used instead, the call to **fcntl** would block until gaining the lock was possible. In the calls to **fcntl** , the first argument **fd** is the file descriptor, the second argument specifies the action to be taken (in this case, **F_SETLK** for setting the lock), and the third argument is the address of the lock structure (in this case, **& lock**).
  * If the _producer_ gains the lock, the program writes two text records to the file.
  * After writing to the file, the _producer_ changes the lock structure's **l_type** field to the _unlock_ value: [code]`lock.l_type = F_UNLCK;`[/code] and calls **fcntl** to perform the unlocking operation. The program finishes up by closing the file and exiting.



#### Example 2. The _consumer_ program


```
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

#define FileName "data.dat"

void report_and_exit(const char* msg) {
[perror][4](msg);
[exit][5](-1); /* EXIT_FAILURE */
}

int main() {
struct flock lock;
lock.l_type = F_WRLCK; /* read/write (exclusive) lock */
lock.l_whence = SEEK_SET; /* base for seek offsets */
lock.l_start = 0; /* 1st byte in file */
lock.l_len = 0; /* 0 here means 'until EOF' */
lock.l_pid = getpid(); /* process id */

int fd; /* file descriptor to identify a file within a process */
if ((fd = open(FileName, O_RDONLY)) < 0) /* -1 signals an error */
report_and_exit("open to read failed...");

/* If the file is write-locked, we can't continue. */
fcntl(fd, F_GETLK, &lock); /* sets lock.l_type to F_UNLCK if no write lock */
if (lock.l_type != F_UNLCK)
report_and_exit("file is still write locked...");

lock.l_type = F_RDLCK; /* prevents any writing during the reading */
if (fcntl(fd, F_SETLK, &lock) < 0)
report_and_exit("can't get a read-only lock...");

/* Read the bytes (they happen to be ASCII codes) one at a time. */
int c; /* buffer for read bytes */
while (read(fd, &c, 1) > 0) /* 0 signals EOF */
write(STDOUT_FILENO, &c, 1); /* write one byte to the standard output */

/* Release the lock explicitly. */
lock.l_type = F_UNLCK;
if (fcntl(fd, F_SETLK, &lock) < 0)
report_and_exit("explicit unlocking failed...");

close(fd);
return 0;
}
```

The _consumer_ program is more complicated than necessary to highlight features of the locking API. In particular, the _consumer_ program first checks whether the file is exclusively locked and only then tries to gain a shared lock. The relevant code is:


```
lock.l_type = F_WRLCK;
...
fcntl(fd, F_GETLK, &lock); /* sets lock.l_type to F_UNLCK if no write lock */
if (lock.l_type != F_UNLCK)
report_and_exit("file is still write locked...");
```

The **F_GETLK** operation specified in the **fcntl** call checks for a lock, in this case, an exclusive lock given as **F_WRLCK** in the first statement above. If the specified lock does not exist, then the **fcntl** call automatically changes the lock type field to **F_UNLCK** to indicate this fact. If the file is exclusively locked, the _consumer_ terminates. (A more robust version of the program might have the _consumer_ **sleep** a bit and try again several times.)

If the file is not currently locked, then the _consumer_ tries to gain a shared ( _read-only_ ) lock ( **F_RDLCK** ). To shorten the program, the **F_GETLK** call to **fcntl** could be dropped because the **F_RDLCK** call would fail if a _read-write_ lock already were held by some other process. Recall that a _read-only_ lock does prevent any other process from writing to the file, but allows other processes to read from the file. In short, a _shared_ lock can be held by multiple processes. After gaining a shared lock, the _consumer_ program reads the bytes one at a time from the file, prints the bytes to the standard output, releases the lock, closes the file, and terminates.

Here is the output from the two programs launched from the same terminal with **%** as the command line prompt:


```
% ./producer
Process 29255 has written to data file...

% ./consumer
Now is the winter of our discontent
Made glorious summer by this sun of York
```

In this first code example, the data shared through IPC is text: two lines from Shakespeare's play _Richard III_. Yet, the shared file's contents could be voluminous, arbitrary bytes (e.g., a digitized movie), which makes file sharing an impressively flexible IPC mechanism. The downside is that file access is relatively slow, whether the access involves reading or writing. As always, programming comes with tradeoffs. The next example has the upside of IPC through shared memory, rather than shared files, with a corresponding boost in performance.

### Shared memory

Linux systems provide two separate APIs for shared memory: the legacy System V API and the more recent POSIX one. These APIs should never be mixed in a single application, however. A downside of the POSIX approach is that features are still in development and dependent upon the installed kernel version, which impacts code portability. For example, the POSIX API, by default, implements shared memory as a _memory-mapped file_ : for a shared memory segment, the system maintains a _backing file_ with corresponding contents. Shared memory under POSIX can be configured without a backing file, but this may impact portability. My example uses the POSIX API with a backing file, which combines the benefits of memory access (speed) and file storage (persistence).

The shared-memory example has two programs, named _memwriter_ and _memreader_ , and uses a _semaphore_ to coordinate their access to the shared memory. Whenever shared memory comes into the picture with a _writer_ , whether in multi-processing or multi-threading, so does the risk of a memory-based race condition; hence, the semaphore is used to coordinate (synchronize) access to the shared memory.

The _memwriter_ program should be started first in its own terminal. The _memreader_ program then can be started (within a dozen seconds) in its own terminal. The output from the _memreader_ is:


```
`This is the way the world ends...`
```

Each source file has documentation at the top explaining the link flags to be included during compilation.

Let's start with a review of how semaphores work as a synchronization mechanism. A general semaphore also is called a _counting semaphore_ , as it has a value (typically initialized to zero) that can be incremented. Consider a shop that rents bicycles, with a hundred of them in stock, with a program that clerks use to do the rentals. Every time a bike is rented, the semaphore is incremented by one; when a bike is returned, the semaphore is decremented by one. Rentals can continue until the value hits 100 but then must halt until at least one bike is returned, thereby decrementing the semaphore to 99.

A _binary semaphore_ is a special case requiring only two values: 0 and 1. In this situation, a semaphore acts as a _mutex_ : a mutual exclusion construct. The shared-memory example uses a semaphore as a mutex. When the semaphore's value is 0, the _memwriter_ alone can access the shared memory. After writing, this process increments the semaphore's value, thereby allowing the _memreader_ to read the shared memory.

#### Example 3. Source code for the _memwriter_ process


```
/** Compilation: gcc -o memwriter memwriter.c -lrt -lpthread **/
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <semaphore.h>
#include <string.h>
#include "shmem.h"

void report_and_exit(const char* msg) {
[perror][4](msg);
[exit][5](-1);
}

int main() {
int fd = shm_open(BackingFile, /* name from smem.h */
O_RDWR | O_CREAT, /* read/write, create if needed */
AccessPerms); /* access permissions (0644) */
if (fd < 0) report_and_exit("Can't open shared mem segment...");

ftruncate(fd, ByteSize); /* get the bytes */

caddr_t memptr = mmap(NULL, /* let system pick where to put segment */
ByteSize, /* how many bytes */
PROT_READ | PROT_WRITE, /* access protections */
MAP_SHARED, /* mapping visible to other processes */
fd, /* file descriptor */
0); /* offset: start at 1st byte */
if ((caddr_t) -1 == memptr) report_and_exit("Can't get segment...");

[fprintf][7](stderr, "shared mem address: %p [0..%d]\n", memptr, ByteSize - 1);
[fprintf][7](stderr, "backing file: /dev/shm%s\n", BackingFile );

/* semaphore code to lock the shared mem */
sem_t* semptr = sem_open(SemaphoreName, /* name */
O_CREAT, /* create the semaphore */
AccessPerms, /* protection perms */
0); /* initial value */
if (semptr == (void*) -1) report_and_exit("sem_open");

[strcpy][8](memptr, MemContents); /* copy some ASCII bytes to the segment */

/* increment the semaphore so that memreader can read */
if (sem_post(semptr) < 0) report_and_exit("sem_post");

sleep(12); /* give reader a chance */

/* clean up */
munmap(memptr, ByteSize); /* unmap the storage */
close(fd);
sem_close(semptr);
shm_unlink(BackingFile); /* unlink from the backing file */
return 0;
}
```

Here's an overview of how the _memwriter_ and _memreader_ programs communicate through shared memory:

  * The _memwriter_ program, shown above, calls the **shm_open** function to get a file descriptor for the backing file that the system coordinates with the shared memory. At this point, no memory has been allocated. The subsequent call to the misleadingly named function **ftruncate** : [code]`ftruncate(fd, ByteSize); /* get the bytes */`[/code] allocates **ByteSize** bytes, in this case, a modest 512 bytes. The _memwriter_ and _memreader_ programs access the shared memory only, not the backing file. The system is responsible for synchronizing the shared memory and the backing file.
  * The _memwriter_ then calls the **mmap** function: [code] caddr_t memptr = mmap(NULL, /* let system pick where to put segment */
ByteSize, /* how many bytes */
PROT_READ | PROT_WRITE, /* access protections */
MAP_SHARED, /* mapping visible to other processes */
fd, /* file descriptor */
0); /* offset: start at 1st byte */ [/code] to get a pointer to the shared memory. (The _memreader_ makes a similar call.) The pointer type **caddr_t** starts with a **c** for **calloc** , a system function that initializes dynamically allocated storage to zeroes. The _memwriter_ uses the **memptr** for the later _write_ operation, using the library **strcpy** (string copy) function.
  * At this point, the _memwriter_ is ready for writing, but it first creates a semaphore to ensure exclusive access to the shared memory. A race condition would occur if the _memwriter_ were writing while the _memreader_ was reading. If the call to **sem_open** succeeds: [code] sem_t* semptr = sem_open(SemaphoreName, /* name */
O_CREAT, /* create the semaphore */
AccessPerms, /* protection perms */
0); /* initial value */ [/code] then the writing can proceed. The **SemaphoreName** (any unique non-empty name will do) identifies the semaphore in both the _memwriter_ and the _memreader_. The initial value of zero gives the semaphore's creator, in this case, the _memwriter_ , the right to proceed, in this case, to the _write_ operation.
  * After writing, the _memwriter_ increments the semaphore value to 1: [code]`if (sem_post(semptr) < 0) ..`[/code] with a call to the **sem_post** function. Incrementing the semaphore releases the mutex lock and enables the _memreader_ to perform its _read_ operation. For good measure, the _memwriter_ also unmaps the shared memory from the _memwriter_ address space: [code]`munmap(memptr, ByteSize); /* unmap the storage *`[/code] This bars the _memwriter_ from further access to the shared memory.



#### Example 4. Source code for the _memreader_ process


```
/** Compilation: gcc -o memreader memreader.c -lrt -lpthread **/
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <semaphore.h>
#include <string.h>
#include "shmem.h"

void report_and_exit(const char* msg) {
[perror][4](msg);
[exit][5](-1);
}

int main() {
int fd = shm_open(BackingFile, O_RDWR, AccessPerms); /* empty to begin */
if (fd < 0) report_and_exit("Can't get file descriptor...");

/* get a pointer to memory */
caddr_t memptr = mmap(NULL, /* let system pick where to put segment */
ByteSize, /* how many bytes */
PROT_READ | PROT_WRITE, /* access protections */
MAP_SHARED, /* mapping visible to other processes */
fd, /* file descriptor */
0); /* offset: start at 1st byte */
if ((caddr_t) -1 == memptr) report_and_exit("Can't access segment...");

/* create a semaphore for mutual exclusion */
sem_t* semptr = sem_open(SemaphoreName, /* name */
O_CREAT, /* create the semaphore */
AccessPerms, /* protection perms */
0); /* initial value */
if (semptr == (void*) -1) report_and_exit("sem_open");

/* use semaphore as a mutex (lock) by waiting for writer to increment it */
if (!sem_wait(semptr)) { /* wait until semaphore != 0 */
int i;
for (i = 0; i < [strlen][6](MemContents); i++)
write(STDOUT_FILENO, memptr + i, 1); /* one byte at a time */
sem_post(semptr);
}

/* cleanup */
munmap(memptr, ByteSize);
close(fd);
sem_close(semptr);
unlink(BackingFile);
return 0;
}
```

In both the _memwriter_ and _memreader_ programs, the shared-memory functions of main interest are **shm_open** and **mmap** : on success, the first call returns a file descriptor for the backing file, which the second call then uses to get a pointer to the shared memory segment. The calls to **shm_open** are similar in the two programs except that the _memwriter_ program creates the shared memory, whereas the _memreader_ only accesses this already created memory:


```
int fd = shm_open(BackingFile, O_RDWR | O_CREAT, AccessPerms); /* memwriter */
int fd = shm_open(BackingFile, O_RDWR, AccessPerms); /* memreader */
```

With a file descriptor in hand, the calls to **mmap** are the same:


```
`caddr_t memptr = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);`
```

The first argument to **mmap** is **NULL** , which means that the system determines where to allocate the memory in virtual address space. It's possible (but tricky) to specify an address instead. The **MAP_SHARED** flag indicates that the allocated memory is shareable among processes, and the last argument (in this case, zero) means that the offset for the shared memory should be the first byte. The **size** argument specifies the number of bytes to be allocated (in this case, 512), and the protection argument indicates that the shared memory can be written and read.

When the _memwriter_ program executes successfully, the system creates and maintains the backing file; on my system, the file is _/dev/shm/shMemEx_ , with _shMemEx_ as my name (given in the header file _shmem.h_ ) for the shared storage. In the current version of the _memwriter_ and _memreader_ programs, the statement:


```
`shm_unlink(BackingFile); /* removes backing file */`
```

removes the backing file. If the **unlink** statement is omitted, then the backing file persists after the program terminates.

The _memreader_ , like the _memwriter_ , accesses the semaphore through its name in a call to **sem_open**. But the _memreader_ then goes into a wait state until the _memwriter_ increments the semaphore, whose initial value is 0:


```
`if (!sem_wait(semptr)) { /* wait until semaphore != 0 */`
```

Once the wait is over, the _memreader_ reads the ASCII bytes from the shared memory, cleans up, and terminates.

The shared-memory API includes operations explicitly to synchronize the shared memory segment and the backing file. These operations have been omitted from the example to reduce clutter and keep the focus on the memory-sharing and semaphore code.

The _memwriter_ and _memreader_ programs are likely to execute without inducing a race condition even if the semaphore code is removed: the _memwriter_ creates the shared memory segment and writes immediately to it; the _memreader_ cannot even access the shared memory until this has been created. However, best practice requires that shared-memory access is synchronized whenever a _write_ operation is in the mix, and the semaphore API is important enough to be highlighted in a code example.

### Wrapping up

The shared-file and shared-memory examples show how processes can communicate through _shared storage_ , files in one case and memory segments in the other. The APIs for both approaches are relatively straightforward. Do these approaches have a common downside? Modern applications often deal with streaming data, indeed, with massively large streams of data. Neither the shared-file nor the shared-memory approaches are well suited for massive data streams. Channels of one type or another are better suited. Part 2 thus introduces channels and message queues, again with code examples in C.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/interprocess-communication-linux-storage

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/documents_papers_file_storage_work.png?itok=YlXpAqAJ (Filing papers and documents)
[2]: https://en.wikipedia.org/wiki/Inter-process_communication
[3]: http://condor.depaul.edu/mkalin
[4]: http://www.opengroup.org/onlinepubs/009695399/functions/perror.html
[5]: http://www.opengroup.org/onlinepubs/009695399/functions/exit.html
[6]: http://www.opengroup.org/onlinepubs/009695399/functions/strlen.html
[7]: http://www.opengroup.org/onlinepubs/009695399/functions/fprintf.html
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/strcpy.html
