[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why Sorting is O(N log N))
[#]: via: (https://theartofmachinery.com/2019/01/05/sorting_is_nlogn.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

Why Sorting is O(N log N)
======

Any decent algorithms textbook will explain how fast sorting algorithms like quicksort and heapsort are, but it doesn’t take crazy maths to prove that they’re as asymptotically fast as you can possibly get.

### A pedantic note about notation

Most computer scientists use big-O notation to mean “asymptotically equal, up to a constant scaling factor”, which isn’t quite what it means to other mathematicians. Sorry, I’ll use big-O like in CS textbooks, but at least I won’t mix it with other mathematical notation.

## Comparison-based sorting

Let’s look at the special case of algorithms that compare values two at a time (like quicksort and heapsort, and most other popular algorithms). The ideas can be extended to all sorting algorithms later.

### A simple counting argument for the worst case

Suppose you have an array of four elements, all different, in random order. Can you sort it by comparing just one pair of elements? Obviously not, but here’s one good reason that proves you can’t: By definition, to sort the array, you need to how to rearrange the elements to put them in order. In other words, you need to know which permutation is needed. How many possible permutations are there? The first element could be moved to one of four places, the second one could go to one of the remaining three, the third element has two options, and the last element has to take the one remaining place. So there are (4 \times 3 \times 2 \times 1 = 4! = 24) possible permutations to choose from, but there are only two possible results from comparing two different things: “BIGGER” and “SMALLER”. If you made a list of all the possible permutations, you might decide that “BIGGER” means you need permutation #8 and “SMALLER” means you need permutation #24, but there’s no way you could know when you need the other 22 permutations.

With two comparisons, you have (2 \times 2 = 4) possible outputs, which still isn’t enough. You can’t sort every possible shuffled array unless you do at least five comparisons ((2^{5} = 32)). If (W(N)) is the worst-case number of comparisons needed to sort (N) different elements using some algorithm, we can say

[2^{W(N)} \geq N!]

Taking a logarithm base 2,

[W(N) \geq \log_{2}{N!}]

Asymptotically, (N!) grows like (N^{N}) (see also [Stirling’s formula][1]), so

[W(N) \succeq \log N^{N} = N\log N]

And that’s an (O(N\log N)) limit on the worst case just from counting outputs.

### Average case from information theory

We can get a stronger result if we extend that counting argument with a little information theory. Here’s how we could use a sorting algorithm as a code for transmitting information:

  1. I think of a number — say, 15
  2. I look up permutation #15 from the list of permutations of four elements
  3. I run the sorting algorithm on this permutation and record all the “BIGGER” and “SMALLER” comparison results
  4. I transmit the comparison results to you in binary code
  5. You re-enact my sorting algorithm run, step by step, referring to my list of comparison results as needed
  6. Now that you know how I rearranged my array to make it sorted, you can reverse the permutation to figure out my original array
  7. You look up my original array in the permutation list to figure out I transmitted the number 15



Okay, it’s a bit strange, but it could be done. That means that sorting algorithms are bound by the same laws as normal encoding schemes, including the theorem proving there’s no universal data compressor. I transmitted one bit per comparison the algorithm does, so, on average, the number of comparisons must be at least the number of bits needed to represent my data, according to information theory. More technically, [the average number of comparisons must be at least the Shannon entropy of my input data, measured in bits][2]. Entropy is a mathematical measure of the information content, or unpredictability, of something.

If I have an array of (N) elements that could be in any possible order without bias, then entropy is maximised and is (\log_{2}{N!}) bits. That proves that (O(N\log N)) is an optimal average for a comparison-based sort with arbitrary input.

That’s the theory, but how do real sorting algorithms compare? Below is a plot of the average number of comparisons needed to sort an array. I’ve compared the theoretical optimum against naïve quicksort and the [Ford-Johnson merge-insertion sort][3], which was designed to minimise comparisons (though it’s rarely faster than quicksort overall because there’s more to life than minimising comparisons). Since it was developed in 1959, merge-insertion sort has been tweaked to squeeze a few more comparisons out, but the plot shows it’s already almost optimal.

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
