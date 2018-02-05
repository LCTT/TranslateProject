Python中最快解压zip文件的方法
======
假设(现在的)上下文(context，计算机术语，此处意为业务情景)是这样的：一个zip文件被上传到一个[web服务][1]中，然后Python需要解压这个zip文件然后分析和处理其中的每个文件。这个特殊的应用查看每个文件各自的名称和大小 ，并和已经上传到AWS S3上的文件进行比较，如果文件(和AWS S3上的相比)有所不同或者文件本身更新，那么就将它上传到AWS S3。

[![Uploads today][2]][3]

挑战在于这些zip文件太大了。他们的平均大小是560MB但是其中一些大于1GB。这些文件中大多数是文本文件，但是其中同样也有一些巨大的二进制文件。不同寻常的是，每个zip文件包含100个文件但是其中1-3个文件却占据了多达95%的zip文件大小。

最开始我尝试在内存中解压文件，并且每次只处理一个文件。在各种内存爆炸和EC2耗尽内存的情况下，这个方法壮烈失败了。我觉得这个方法应该有用。最开始你有1GB文件在RAM中，然后你现在解压每个文件并有了大约2-3GB放在了内存中。所以，在很多次测试之后，解决方案是将这些zip文件提取(dump)到磁盘上(在临时目录`/tmp`中)然后遍历这些文件。这次情况好多了但是我仍然注意到了整个解压过程花费了巨量的时间。**是否可能有方法优化呢？**

### 原始函数(baseline function)

首先是下面这些模拟对zip文件中文件实际操作的普通函数：
```
def _count_file(fn):
 with open(fn, 'rb') as f:
   return _count_file_object(f)

def _count_file_object(f):
 # Note that this iterates on 'f'.
 # You *could* do 'return len(f.read())'
 # which would be faster but potentially memory
 # inefficient and unrealistic in terms of this
 # benchmark experiment.
 total = 0
 for line in f:
   total += len(line)
 return total

```
这里是可能最简单的另一个(函数)：
```
def f1(fn, dest):
 with open(fn, 'rb') as f:
   zf = zipfile.ZipFile(f)
   zf.extractall(dest)

 total = 0
 for root, dirs, files in os.walk(dest):
   for file_ in files:
     fn = os.path.join(root, file_)
     total += _count_file(fn)
 return total

```

如果我更仔细地分析一下，我(将会)发现这个函数花费时间40%运行`extractall`，60%的时间在执行读取文件长度的循环。

### 第一步尝试

我的第一步尝试是使用线程。先创建一个`zipfile.ZipFile`的实例，展开每个文件名到其中然后为每一个名称开始一个线程。每个线程都给它一个函数来做"实质工作"(在这个基础测试(benchmark)中，就是遍历每个文件然后获取它的名称)。实际(业务中)的函数进行的工作是复杂的S3，Redis和PostgreSQL操作，但是在我的基准测试中我只需要制作一个可以找出文件长度的函数就好了。线程池函数：
```
def f2(fn, dest):

    def unzip_member(zf, member, dest):
        zf.extract(member, dest)
        fn = os.path.join(dest, member.filename)
        return _count_file(fn)

    with open(fn, 'rb') as f:
        zf = zipfile.ZipFile(f)
        futures = []
        with concurrent.futures.ThreadPoolExecutor() as executor:
            for member in zf.infolist():
                futures.append(
                    executor.submit(
                        unzip_member,
                        zf,
                        member,
                        dest,
                    )
                )
            total = 0
            for future in concurrent.futures.as_completed(futures):
                total += future.result()
    return total
```

**结果：加速~10%**

### 第二步尝试

所以可能是GIL(译者注：Global Interpreter Lock，一种全局锁，CPython中的一个概念)阻碍了我。最自然的想法是尝试使用multiprocessing在多个CPU上分配工作。但是这样做有缺点，那就是你不能传递一个非可pickle序列化的对象(译注：意为只有可pickle序列化的对象可以被传递)，所以你只能发送文件名到之后的函数中:
```
def unzip_member_f3(zip_filepath, filename, dest):
    with open(zip_filepath, 'rb') as f:
        zf = zipfile.ZipFile(f)
        zf.extract(filename, dest)
    fn = os.path.join(dest, filename)
    return _count_file(fn)



def f3(fn, dest):
    with open(fn, 'rb') as f:
        zf = zipfile.ZipFile(f)
        futures = []
        with concurrent.futures.ProcessPoolExecutor() as executor:
            for member in zf.infolist():
                futures.append(
                    executor.submit(
                        unzip_member_f3,
                        fn,
                        member.filename,
                        dest,
                    )
                )
            total = 0
            for future in concurrent.futures.as_completed(futures):
                total += future.result()
    return total
```

**结果: 加速~300%**

### 这是作弊

使用处理器池的问题是这样需要存储在磁盘上的原始`.zip`文件。所以为了在我的web服务器上使用这个解决方案，我首先得要将内存中的ZIP文件保存到磁盘，然后调用这个函数。这样做的代价我不是很清楚但是应该不低。

好吧，再翻翻(poke around)看又没有损失(Well, it doesn't hurt to poke around)。可能，解压过程加速到足以弥补这样做的损失了吧。

但是一定记住！这个优化取决于使用所有可用的CPU。如果一些其他的CPU需要执行在`gunicorn`中的其它事务呢？这时，这些其他进程必须等待，直到有CPU可用。由于在这个服务器上有其他的事务正在进行，我不是很确定我想要在进程中接管所有其他CPU。

### 结论

一步一步地做(这个任务)这个过程感觉挺好的。你被限制在一个CPU上但是表现仍然特别好。同样地，一定要看看在`f1`和`f2`两段代码之间的不同之处！利用`concurrent.futures`池类你可以获取可以使用的CPU的个数，但是这样做同样给人感觉不是很好。如果你在虚拟环境中获取的个数是错的呢？或者可用的个数太低以致无法从负载分配获取好处并且现在你仅仅是为了移动负载而支付营运开支呢？

我将会继续使用`zipfile.ZipFile(file_buffer).extractall(temp_dir)`。这个工作这样做已经足够好了。

### 想试试手吗？

我使用一个`c5.4xlarge` EC2服务器来进行我的基准测试。文件可以从此处下载:
```
wget https://www.peterbe.com/unzip-in-parallel/hack.unzip-in-parallel.py
wget https://www.peterbe.com/unzip-in-parallel/symbols-2017-11-27T14_15_30.zip

```

这里的`.zip`文件有34MB。和在服务器上发生的已经小了很多。

`hack.unzip-in-parallel.py`文件里是一团糟。它包含了大量可怕的入侵和丑恶的事情，但是万幸这只是一个开始(译注：大概入侵没有完成)。



--------------------------------------------------------------------------------

via: https://www.peterbe.com/plog/fastest-way-to-unzip-a-zip-file-in-python

作者：[Peterbe][a]
译者：[Leemeans](https://github.com/leemeans)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.peterbe.com/
[1]:https://symbols.mozilla.org
[2]:https://cdn-2916.kxcdn.com/cache/b7/bb/b7bbcf60347a5fa91420f71bbeed6d37.png
[3]:https://cdn-2916.kxcdn.com/cache/e6/dc/e6dc20acd37d94239edbbc0727721e4a.png
