KayGuoWhu translating
If a 32-bit integer overflows, can we use a 40-bit structure instead of a 64-bit long one?
---------

#Q:

If, say, a 32-bit integer is overflowing, instead of upgrading int to long, can we make use of some 40-bit type if we need a range only within 240, so that we save 24 (64-40) bits for every integer?

If so, how?

I have to deal with billions and space is a bigger constraint.

#A:

##Yes, but...

It is certainly possible, but it is usually nonsensical (for any program that doesn't use billions of these numbers):

```C
#include <stdint.h> // don't want to rely on something like long long
struct bad_idea
{
    uint64_t var : 40;
};
```

Here, var will indeed have a width of 40 bits at the expense of much less efficient code generated (it turns out that "much" is very much wrong -- the measured overhead is a mere 1-2%, see timings below), and usually to no avail. Unless you have need for another 24-bit value (or an 8 and 16 bit value) which you wish to pack into the same structure, alignment will forfeit anything that you may gain.

In any case, unless you have billions of these, the effective difference in memory consumption will not be noticeable (but the extra code needed to manage the bit field will be noticeable!).

###Note:

The question has in the mean time been updated to reflect that indeed billions of numbers are needed, so this may be a viable thing to do, presumed that you take measures not to lose the gains due to structure alignment and padding, i.e. either by storing something else in the remaining 24 bits or by storing your 40-bit values in structures of 8 each or multiples thereof).
Saving three bytes a billion times is worthwhile as it will require noticeably fewer memory pages and thus cause fewer cache and TLB misses, and above all page faults (a single page fault weighting tens of millions instructions).

While the above snippet does not make use of the remaining 24 bits (it merely demonstrates the "use 40 bits" part), something akin to the following will be necessary to really make the approach useful in a sense of preserving memory -- presumed that you indeed have other "useful" data to put in the holes:

```C
struct using_gaps
{
    uint64_t var           : 40;
    uint64_t useful_uint16 : 16;
    uint64_t char_or_bool  : 8;  
};
```

Structure size and alignment will be equal to a 64 bit integer, so nothing is wasted if you make e.g. an array of a billion such structures (even without using compiler-specific extensions). If you don't have use for an 8-bit value, you could also use an 48-bit and a 16-bit value (giving a bigger overflow margin).
Alternatively you could, at the expense of usability, put 8 40-bit values into a structure (least common multiple of 40 and 64 being 320 = 8*40). Of course then your code which accesses elements in the array of structures will become much more complicated (though one could probably implement an operator[] that restores the linear array functionality and hides the structure complexity).

Update:
Wrote a quick test suite, just to see what overhead the bitfields (and operator overloading with bitfield refs) would have. Posted code (due to length) at gcc.godbolt.org, test output from my Win7-64 machine is:

```TXT
Running test for array size = 1048576
what       alloc   seq(w)  seq(r)  rand(w)  rand(r)  free
-----------------------------------------------------------
uint32_t    0      2       1       35       35       1
uint64_t    0      3       3       35       35       1
bad40_t     0      5       3       35       35       1
packed40_t  0      7       4       48       49       1


Running test for array size = 16777216
what        alloc  seq(w)  seq(r)  rand(w)  rand(r)  free
-----------------------------------------------------------
uint32_t    0      38      14      560      555      8
uint64_t    0      81      22      565      554      17
bad40_t     0      85      25      565      561      16
packed40_t  0      151     75      765      774      16


Running test for array size = 134217728
what        alloc  seq(w)  seq(r)  rand(w)  rand(r)  free
-----------------------------------------------------------
uint32_t    0      312     100     4480     4441     65
uint64_t    0      648     172     4482     4490     130
bad40_t     0      682     193     4573     4492     130
packed40_t  0      1164    552     6181     6176     130
```

What one can see is that the extra overhead of bitfields is neglegible, but the operator overloading with bitfield reference as a convenience thing is rather drastic (about 3x increase) when accessing data linearly in a cache-friendly manner. On the other hand, on random access it barely even matters.

These timings suggest that simply using 64-bit integers would be better since they are still faster overall than bitfields (despite touching more memory), but of course they do not take into account the cost of page faults with much bigger datasets. It might look very different once you run out of physical RAM (I didn't test that).

------

via:[stackoverflow](http://stackoverflow.com/questions/27705409/if-a-32-bit-integer-overflows-can-we-use-a-40-bit-structure-instead-of-a-64-bit/27705562#27705562)

作者：[Damon][a][Michael Kohne][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://stackoverflow.com/users/572743/damon
[b]:http://stackoverflow.com/users/5801/michael-kohne