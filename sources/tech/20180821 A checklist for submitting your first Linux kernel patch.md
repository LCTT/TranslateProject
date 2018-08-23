A checklist for submitting your first Linux kernel patch
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22)

One of the biggest—and the fastest moving—open source projects, the Linux kernel, is composed of about 53,600 files and nearly 20-million lines of code. With more than 15,600 programmers contributing to the project worldwide, the Linux kernel follows a maintainer model for collaboration.

![](https://opensource.com/sites/default/files/karnik_figure1.png)

In this article, I'll provide a quick checklist of steps involved with making your first kernel contribution, and look at what you should know before submitting a patch. For a more in-depth look at the submission process for contributing your first patch, read the [KernelNewbies First Kernel Patch tutorial][1].

### Contributing to the kernel

#### Step 1: Prepare your system.

Steps in this article assume you have the following tools on your system:

+ Text editor
+ Email client
+ Version control system (e.g., git)

#### Step 2: Download the Linux kernel code repository`:`
```
git clone -b staging-testing

git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git

```

### Copy your current config: ````
```
cp /boot/config-`uname -r`* .config

```

### Step 3: Build/install your kernel.
```
make -jX

sudo make modules_install install

```

### Step 4: Make a branch and switch to it.
```
git checkout -b first-patch

```

### Step 5: Update your kernel to point to the latest code base.
```
git fetch origin

git rebase origin/staging-testing

```

### Step 6: Make a change to the code base.

Recompile using `make` command to ensure that your change does not produce errors.

### Step 7: Commit your changes and create a patch.
```
git add <file>

git commit -s -v

git format-patch -o /tmp/ HEAD^

```

![](https://opensource.com/sites/default/files/karnik_figure2.png)

The subject consists of the path to the file name separated by colons, followed by what the patch does in the imperative tense. After a blank line comes the description of the patch and the mandatory signed off tag and, lastly, a diff of your patch.

Here is another example of a simple patch:

![](https://opensource.com/sites/default/files/karnik_figure3.png)

Next, send the patch [using email from the command line][2] (in this case, Mutt): ``
```
mutt -H /tmp/0001-<whatever your filename is>

```

To know the list of maintainers to whom to send the patch, use the [get_maintainer.pl script][14].


### What to know before submitting your first patch

  * [Greg Kroah-Hartman][3]'s [staging tree][4] is a good place to submit your [first patch][1] as he accepts easy patches from new contributors. When you get familiar with the patch-sending process, you could send subsystem-specific patches with increased complexity.

  * You also could start with correcting coding style issues in the code. To learn more, read the [Linux kernel coding style documentation][5].

  * The script [checkpatch.pl][6] detects coding style errors for you. For example, run:
    ```
     perl scripts/checkpatch.pl -f drivers/staging/android/* | less

    ```

  * You could complete TODOs left incomplete by developers:
    ```
     find drivers/staging -name TODO
     ```

  * [Coccinelle][7] is a helpful tool for pattern matching.

  * Read the [kernel mailing archives][8].

  * Go through the [linux.git log][9] to see commits by previous authors for inspiration.

  * Note: Do not top-post to communicate with the reviewer of your patch! Here's an example:

**Wrong way:**

Chris,
_Yes let’s schedule the meeting tomorrow, on the second floor._
> On Fri, Apr 26, 2013 at 9:25 AM, Chris wrote:
> Hey John, I had some questions:
> 1\. Do you want to schedule the meeting tomorrow?
> 2\. On which floor in the office?
> 3\. What time is suitable to you?

(Notice that the last question was unintentionally left unanswered in the reply.)

**Correct way:**

Chris,
See my answers below...
> On Fri, Apr 26, 2013 at 9:25 AM, Chris wrote:
> Hey John, I had some questions:
> 1\. Do you want to schedule the meeting tomorrow?
_Yes tomorrow is fine._
> 2\. On which floor in the office?
_Let's keep it on the second floor._
> 3\. What time is suitable to you?
_09:00 am would be alright._

(All questions were answered, and this way saves reading time.)

  * The [Eudyptula challenge][10] is a great way to learn kernel basics.




To know the list of maintainers to whom to send the patch, use the [get_maintainer.pl script][11]

To learn more, read the [KernelNewbies First Kernel Patch tutorial][1]. After that, if you still have any questions, ask on the [kernelnewbies mailing list][12] or in the [#kernelnewbies IRC channel][13].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/first-linux-kernel-patch

作者：[Sayli Karnik][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/sayli
[1]:https://kernelnewbies.org/FirstKernelPatch
[2]:https://opensource.com/life/15/8/top-4-open-source-command-line-email-clients
[3]:https://twitter.com/gregkh
[4]:https://www.kernel.org/doc/html/v4.15/process/2.Process.html
[5]:https://www.kernel.org/doc/html/v4.10/process/coding-style.html
[6]:https://github.com/torvalds/linux/blob/master/scripts/checkpatch.pl
[7]:http://coccinelle.lip6.fr/
[8]:linux-kernel@vger.kernel.org
[9]:https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/
[10]:http://eudyptula-challenge.org/
[11]:https://github.com/torvalds/linux/blob/master/scripts/get_maintainer.pl
[12]:https://kernelnewbies.org/MailingList
[13]:https://kernelnewbies.org/IRC
[14]: https://github.com/torvalds/linux/blob/master/scripts/get_maintainer.pl
