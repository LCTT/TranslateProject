[#]: collector: (lujun9972)
[#]: translator: (silentdawn-zz)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why Sorting is O(N log N))
[#]: via: (https://theartofmachinery.com/2019/01/05/sorting_is_nlogn.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

为什么排序的复杂度为 O(N log N)
======

基本上所有正而八经的算法教材都会解释什么是快速排序算法，比如 quicksort 和堆排序，但又都基本上不会动用复杂的数学来证明这些算法只能趋近你所能达到的速度。

### 关于标记的说明

大多数计算机专业的科学家使用大写字母 O 标记来指代“趋近与乘以一个常数比例因子”，这与数学专业所指代的意义是有所区别的。这里我使用的大 O 标记的含义与计算机教材所指相同，且不会混杂使用数学专业所指含义。

## 基于比较的排序

先来看个特例，即每次比较两个值大小的算法（quicksort、堆排序及其它通用排序算法基本上都是这样的）。这种思想后续可以扩展至所有排序算法。

### A simple counting argument for the worst case

假设有 4 个互不相等的数，且顺序随机，那么，可以通过比较一对数字完成排序吗？显然不能，证明如下：根据定义，对该数组排序，需要按照某种顺序重新排列数字。那么究竟有多少种可能的排列呢？第一个数字可以放在四个位置中的任意一个，第二个数字可以放在剩下三个位置中的任意一个，第三个数字可以放在剩下两个位置中的任意一个，最后一个数字只有剩下的一个位置可选。这样，共有 4×3×2×1 = 4! = 24 种排列可供选择。通过一次比较大小，只能产生两种可能的结果。如果列出所有的排列，那么“从小到大”排序对应的可能是第 8 种排列，按“从大到小”排序对应的可能是第 22 种排列，但无法知道什么时候需要的是其它 22 种排列。

通过 2 次比较，可以得到 2×2=4 种可能的结果，这仍然不够。只要比较的次数少于 5（对应 (2^{5} = 32) 种输出），就无法完成 4 个随机次序的数字的排序。如果 (W(N)) 是最差情况下对 (N) 个不同元素进行排序所需要的比较次数，那么

[2^{W(N)} \geq N!]

两边取以 2 为底的对数，得

[W(N) \geq \log_{2}{N!}]

(N!) 的增长近似于 (N^{N}) （参阅 [Stirling 公式][1]），那么

[W(N) \succeq \log N^{N} = N\log N]

这就是最差情况下从输出计数的角度得出的 (O(N\log N)) 上限。

### 信息论角度平均状态的例子

使用一些信息论知识，就可以从上面的讨论中得到一个更有力的结论。下面，使用排序算法作为信息传输的编码器：

  1. 任取一个数，比如 15
  2. 从 4 个数字的排列列表中查找第 15 种排列
  3. 对这种排列运行排序算法，记录所有的“大”、“小”比较结果
  4. 用二进制编码发送比较结果
  5. 接收端重新逐步执行发送端的排序算法，需要的话可以引用发送端的比较结果
  6. 现在接收端就可以知道发送端如何重新排列数字以按照需要排序，接收端可以对排列进行逆算，得到 4 个数字的初始顺序
  7. 接收端在排列表中检索发送端的原始排列，指出发送端发送的是 15



确实，这有点奇怪，但确实可以。这意味着排序算法遵循着与编码方案相同的定律，包括理论所证明的通用数据压缩算法的不存在。算法中每次比较发送 1 bit 的比较结果编码数据，根据信息论，比较的次数至少是能表示所有数据的二进制位数。更技术语言点，[平均所需的最小比较次数是输入数据的香农熵以二进制的位数][2]。熵是信息等不可预测量的数学度量。

包含 (N) 个元素的数组，元素次序随机且无偏时的熵最大，其值为 (\log_{2}{N!}) 二进制位。这证明 (O(N\log N)) 是基于比较的排序对任意输入所需的比较次数。

以上都是理论说法，那么实际的排序算法如何做比较的哪？ Below is a plot of the average number of comparisons needed to sort an array. I’ve compared the theoretical optimum against naïve quicksort and the [Ford-Johnson merge-insertion sort][3], which was designed to minimise comparisons (though it’s rarely faster than quicksort overall because there’s more to life than minimising comparisons). Since it was developed in 1959, merge-insertion sort has been tweaked to squeeze a few more comparisons out, but the plot shows it’s already almost optimal.

![Plot of average number of comparisons needed to sort randomly shuffled arrays of length up to 100. Bottom line is theoretical optimum. Within about 1% is merge-insertion sort. Naïve quicksort is within about 25% of optimum.][4]

It’s nice when a little theory gives such a tight practical result.

### Summary so far

Here’s what’s been proven so far:

  1. If the array could start in any order, at least (O(N\log N)) comparisons are needed in the worst case
  2. The average number of comparisons must be at least the entropy of the array, which is (O(N\log N)) for random input



Note that #2 allows comparison-based sorting algorithms to be faster than (O(N\log N)) if the input is low entropy (in other words, more predictable). Merge sort is close to (O(N)) if the input contains many sorted subarrays. Insertion sort is close to (O(N)) if the input is an array that was sorted before being perturbed a bit. None of them beat (O(N\log N)) in the worst case unless some array orderings are impossible as inputs.

## General sorting algorithms

Comparison-based sorts are an interesting special case in practice, but there’s nothing theoretically special about [`CMP`][5] as opposed to any other instruction on a computer. Both arguments above can be generalised to any sorting algorithm if you note a couple of things:

  1. Most computer instructions have more than two possible outputs, but still have a limited number
  2. The limited number of outputs means that one instruction can only process a limited amount of entropy



That gives us the same (O(N\log N)) lower bound on the number of instructions. Any physically realisable computer can only process a limited number of instructions at a time, so that’s an (O(N\log N)) lower bound on the time required, as well.

### But what about “faster” algorithms?

The most useful practical implication of the general (O(N\log N)) bound is that if you hear about any asymptotically faster algorithm, you know it must be “cheating” somehow. There must be some catch that means it isn’t a general purpose sorting algorithm that scales to arbitrarily large arrays. It might still be a useful algorithm, but it’s a good idea to read the fine print closely.

A well-known example is radix sort. It’s often called an (O(N)) sorting algorithm, but the catch is that it only works if all the numbers fit into (k) bits, and it’s really (O({kN})).

What does that mean in practice? Suppose you have an 8-bit machine. You can represent (2^{8} = 256) different numbers in 8 bits, so if you have an array of thousands of numbers, you’re going to have duplicates. That might be okay for some applications, but for others you need to upgrade to at least 16 bits, which can represent (2^{16} = 65,536) numbers distinctly. 32 bits will support (2^{32} = 4,294,967,296) different numbers. As the size of the array goes up, the number of bits needed will tend to go up, too. To represent (N) different numbers distinctly, you’ll need (k \geq \log_{2}N). So, unless you’re okay with lots of duplicates in your array, (O({kN})) is effectively (O(N\log N)).

The need for (O(N\log N)) of input data in the general case actually proves the overall result by itself. That argument isn’t so interesting in practice because we rarely need to sort billions of integers on a 32-bit machine, and [if anyone’s hit the limits of a 64-bit machine, they haven’t told the rest of us][6].

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2019/01/05/sorting_is_nlogn.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: http://hyperphysics.phy-astr.gsu.edu/hbase/Math/stirling.html
[2]: https://en.wikipedia.org/wiki/Shannon%27s_source_coding_theorem
[3]: https://en.wikipedia.org/wiki/Merge-insertion_sort
[4]: /images/sorting_is_nlogn/sorting_algorithms_num_comparisons.svg
[5]: https://c9x.me/x86/html/file_module_x86_id_35.html
[6]: https://sortbenchmark.org/
