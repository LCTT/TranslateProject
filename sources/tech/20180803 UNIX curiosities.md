UNIX curiosities
======
Recently I've been doing more UNIXy things in various tools I'm writing, and I hit two interesting issues. Neither of these are "bugs", but behaviors that I wasn't expecting. 

### Thread-safe printf

I have a C application that reads some images from disk, does some processing, and writes output about these images to STDOUT. Pseudocode:
```
for(imagefilename in images)
{
 results = process(imagefilename);
 printf(results);
}

```

The processing is independent for each image, so naturally I want to distribute this processing between various CPUs to speed things up. I usually use `fork()`, so I wrote this:
```
for(child in children)
{
 pipe = create_pipe();
 worker(pipe);
}

// main parent process
for(imagefilename in images)
{
 write(pipe[i_image % N_children], imagefilename)
}

worker()
{
 while(1)
 {
 imagefilename = read(pipe);
 results = process(imagefilename);
 printf(results);
 }
}

```

This is the normal thing: I make pipes for IPC, and send the child workers image filenames through these pipes. Each worker _could_ write its results back to the main process via another set of pipes, but that's a pain, so here each worker writes to the shared STDOUT directly. This works OK, but as one would expect, the writes to STDOUT clash, so the results for the various images end up interspersed. That's bad. I didn't feel like setting up my own locks, but fortunately GNU libc provides facilities for that: [`flockfile()`][1]. I put those in, and … it didn't work! Why? Because whatever `flockfile()` does internally ends up restricted to a single subprocess because of `fork()`'s copy-on-write behavior. I.e. the extra safety provided by `fork()` (compared to threads) actually ends up breaking the locks.

I haven't tried using other locking mechanisms (like pthread mutexes for instance), but I can imagine they'll have similar problems. And I want to keep things simple, so sending the output back to the parent for output is out of the question: this creates more work for both me the programmer, and for the computer running the program.

The solution: use threads instead of forks. This has a nice side effect of making the pipes redundant. Final pseudocode:
```
for(children)
{
 pthread_create(worker, child_index);
}
for(children)
{
 pthread_join(child);
}

worker(child_index)
{
 for(i_image = child_index; i_image < N_images; i_image += N_children)
 {
 results = process(images[i_image]);
 flockfile(stdout);
 printf(results);
 funlockfile(stdout);
 }
}

```

Much simpler, and actually works as desired. I guess sometimes threads are better.

### Passing a partly-read file to a child process

For various [vnlog][2] tools I needed to implement this sequence:

1. process opens a file with O_CLOEXEC turned off
2. process reads a part of this file (up-to the end of the legend in the case of vnlog)
3. process calls exec to invoke another program to process the rest of the already-opened file

The second program may require a file name on the commandline instead of an already-opened file descriptor because this second program may be calling open() by itself. If I pass it the filename, this new program will re-open the file, and then start reading the file from the beginning, not from the location where the original program left off. It is important for my application that this does not happen, so passing the filename to the second program does not work.

So I really need to pass the already-open file descriptor somehow. I'm using Linux (other OSs maybe behave differently here), so I can in theory do this by passing /dev/fd/N instead of the filename. But it turns out this does not work either. On Linux (again, maybe this is Linux-specific somehow) for normal files /dev/fd/N is a symlink to the original file. So this ends up doing exactly the same thing that passing the filename does.

But there's a workaround! If we're reading a pipe instead of a file, then there's nothing to symlink to, and /dev/fd/N ends up passing the original pipe down to the second process, and things then work correctly. And I can fake this by changing the open("filename") above to something like popen("cat filename"). Yuck! Is this really the best we can do? What does this look like on one of the BSDs, say?


--------------------------------------------------------------------------------

via: http://notes.secretsauce.net/notes/2018/08/03_unix-curiosities.html

作者：[Dima Kogan][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://notes.secretsauce.net/
[1]:https://www.gnu.org/software/libc/manual/html_node/Streams-and-Threads.html
[2]:http://www.github.com/dkogan/vnlog
