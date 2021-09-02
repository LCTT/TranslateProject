[#]: subject: "Code memory safety and efficiency by example"
[#]: via: "https://opensource.com/article/21/8/memory-programming-c"
[#]: author: "Marty Kalin https://opensource.com/users/mkalindepauledu"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Code memory safety and efficiency by example
======
Learn more about memory safety and efficiency
![Code going into a computer.][1]

C is a high-level language with close-to-the-metal features that make it seem, at times, more like a portable assembly language than a sibling of Java or Python. Among these features is memory management, which covers an executing program's safe and efficient use of memory. This article goes into the details of memory safety and efficiency through code examples in C and a code segment from the assembly language that a modern C compiler generates.

Although the code examples are in C, the guidelines for safe and efficient memory management are the same for C++. The two languages differ in various details (e.g., C++ has object-oriented features and generics that C lacks), but these languages share the very same challenges with respect to memory management.

### Overview of memory for an executing program

For an executing program (aka _process_), memory is partitioned into three areas: The **stack**, the **heap**, and the **static area**. Here's an overview of each, with full code examples to follow.

As a backup for general-purpose CPU registers, the _stack_ provides scratchpad storage for the local variables within a code block, such as a function or a loop body. Arguments passed to a function count as local variables in this context. Consider a short example:


```
void some_func(int a, int b) {
   int n;
   ...
}
```

Storage for the arguments passed in parameters **a** and **b** and the local variable **n** would come from the stack unless the compiler could find general-purpose registers instead. The compiler favors such registers for scratchpad because CPU access to these registers is fast (one clock tick). However, these registers are few (roughly sixteen) on the standard architectures for desktop, laptop, and handheld machines.

At the implementation level, which only an assembly-language programmer would see, the stack is organized as a LIFO (Last In, First Out) list with **push** (insert) and **pop** (remove) operations. The **top** pointer can act as a base address for offsets; in this way, stack locations other than **top** become accessible. For example, the expression **top+16** points to a location sixteen bytes above the stack's **top**, and the expression **top-16** points to sixteen bytes below the **top**. Accordingly, stack locations that implement scratchpad storage are accessible through the **top** pointer. On a standard ARM or Intel architecture, the stack grows from high to low memory addresses; hence, to decrement **top** is to grow the stack for a process.

To use the stack is to use memory effortlessly and efficiently. The compiler, rather than the programmer, writes the code that manages the stack by allocating and deallocating the required scratchpad storage; the programmer declares function arguments and local variables, leaving the implementation to the compiler. Moreover, the very same stack storage can be reused across consecutive function calls and code blocks such as loops. Well-designed modular code makes stack storage the first memory option for scratchpad, with an optimizing compiler using, whenever possible, general-purpose registers instead of the stack.

The **heap** provides storage allocated explicitly through programmer code, although the syntax for heap allocation differs across languages. In C, a successful call to the library function **malloc** (or variants such as **calloc**) allocates a specified number of bytes. (In languages such as C++ and Java, the **new** operator serves the same purpose.) Programming languages differ dramatically on how heap-allocated storage is deallocated:

  * In languages such as Java, Go, Lisp, and Python, the programmer does not explicitly deallocate dynamically allocated heap storage.



For example, this Java statement allocates heap storage for a string and stores the address of this heap storage in the variable **greeting**:


```
`String greeting = new String("Hello, world!");`
```

Java has a garbage collector, a runtime utility that automatically deallocates heap storage that is no longer accessible to the process that allocated the storage. Java heap deallocation is thus automatic through a garbage collector. In the example above, the garbage collector would deallocate the heap storage for the string after the variable **greeting** went out of scope.

  * The Rust compiler writes the heap-deallocation code. This is Rust's pioneering effort to automate heap-deallocation without relying on a garbage collector, which entails runtime complexity and overhead. Hats off to the Rust effort!
  * In C (and C++), heap deallocation is a programmer task. The programmer who allocates heap storage through a call to **malloc** is then responsible for deallocating this same storage with a matching call to the library function **free**. (In C++, the **new** operator allocates heap storage, whereas the **delete** and **delete[]** operators free such storage.) Here's a C example:




```
char* greeting = malloc(14);       /* 14 heap bytes */
strcpy(greeting, "Hello, world!"); /* copy greeting into bytes */
puts(greeting);                    /* print greeting */
free(greeting);                    /* free malloced bytes */
```

C avoids the cost and complexity of a garbage collector, but only by burdening the programmer with the task of heap deallocation.

The **static area** of memory provides storage for executable code such as C functions, string literals such as "Hello, world!", and global variables:


```
int n;                       /* global variable */
int main() {                 /* function */
   char* msg = "No comment"; /* string literal */
   ...
}
```

This area is static in that its size remains fixed from the start until the end of process execution. Because the static area amounts to a fixed-sized memory footprint for a process, the rule of thumb is to keep this area as small as possible by avoiding, for example, global arrays.

Code examples in the following sections flesh out this overview.

### Stack storage

Imagine a program that has various tasks to perform consecutively, including processing numeric data downloaded every few minutes over a network and stored in a local file. The **stack** program below simplifies the processing (odd integer values are made even) to keep the focus on the benefits of stack storage.


```
#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;

#define Infile   "incoming.dat"
#define Outfile  "outgoing.dat"
#define IntCount 128000  /* 128,000 */

void other_task1() { /*...*/ }
void other_task2() { /*...*/ }

void process_data(const char* infile,
          const char* outfile,
          const unsigned n) {
  int nums[n];
  FILE* input = [fopen][2](infile, "r");
  if (NULL == infile) return;
  FILE* output = [fopen][2](outfile, "w");
  if (NULL == output) {
    [fclose][3](input);
    return;
  }

  [fread][4](nums, n, sizeof(int), input); /* read input data */
  unsigned i;
  for (i = 0; i &lt; n; i++) {
    if (1 == (nums[i] &amp; 0x1))  /* odd parity? */
      nums[i]--;               /* make even */
  }
  [fclose][3](input);               /* close input file */

  [fwrite][5](nums, n, sizeof(int), output);
  [fclose][3](output);
}

int main() {
  process_data(Infile, Outfile, IntCount);
  
  /** now perform other tasks **/
  other_task1(); /* automatically released stack storage available */
  other_task2(); /* ditto */
  
  return 0;
}
```

The **main** function at the bottom first calls the **process_data** function, which creates a stack-based array of a size given by argument **n** (128,000 in the current example). Accordingly, the array holds 128,000 x **sizeof(int)** bytes, which comes to 512,000 bytes on standard devices because an **int** is four bytes on these devices. Data then are read into the array (using library function **fread**), processed in a loop, and saved to the local file **outgoing.dat** (using library function **fwrite**).

When the **process_data** function returns to its caller **main**, the roughly 500MB of stack scratchpad for the **process_data** function become available for other functions in the **stack** program to use as scratchpad. In this example, **main** next calls the stub functions **other_task1** and **other_task2**. The three functions are called consecutively from **main**, which means that all three can use the same stack storage for scratchpad. Because the compiler rather than the programmer writes the stack-management code, this approach is both efficient and easy on the programmer.

In C, any variable defined inside a block (e.g., a function's or a loop's body) has an **auto** storage class by default, which means that the variable is stack-based. The storage class **register** is now outdated because C compilers are aggressive, on their own, in trying to use CPU registers whenever possible. Only a variable defined inside a block may be **register**, which the compiler changes to **auto** if no CPU register is available.Stack-based programming may be the preferred way to go, but this style does have its challenges. The **badStack** program below illustrates.


```
#include &lt;stdio.h&gt;

const int* get_array(const unsigned n) {
  int arr[n]; /* stack-based array */
  unsigned i;
  for (i = 0; i &lt; n; i++) arr[i] = 1 + 1;

  return arr;  /** ERROR **/
}

int main() {
  const unsigned n = 16;
  const int* ptr = get_array(n);
  
  unsigned i;
  for (i = 0; i &lt; n; i++) [printf][6]("%i ", ptr[i]);
  [puts][7]("\n");

  return 0;
}
```

The flow of control in the **badStack** program is straightforward. Function **main** calls function **get_array** with an argument of 128, which the called function then uses to create a local array of this size. The **get_array** function initializes the array and returns to **main** the array's identifier **arr**, which is a pointer constant that holds the address of the array's first **int** element.

The local array **arr** is accessible within the **get_array** function, of course, but this array cannot be legitimately accessed once **get_array** returns. Nonetheless, function **main** tries to print the stack-based array by using the stack address **arr**, which function **get_array** returns. Modern compilers warn about the mistake. For example, here's the warning from the GNU compiler:


```
badStack.c: In function 'get_array':
badStack.c:9:10: warning: function returns address of local variable [-Wreturn-local-addr]
8 |   return arr;  /** ERROR **/
```

The general rule is that stack-based storage should be accessed only within the code block that contains the local variables implemented with stack storage (in this case, the array pointer **arr** and the loop counter **i**). Accordingly, a function should never return a pointer to stack-based storage.

### Heap storage

Several code examples highlight the fine points of using heap storage in C. In the first example, heap storage is allocated, used, and then freed in line with best practice. The second example nests heap storage inside other heap storage, which complicates the deallocation operation.


```
#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;

int* get_heap_array(unsigned n) {
  int* heap_nums = [malloc][8](sizeof(int) * n); 
  
  unsigned i;
  for (i = 0; i &lt; n; i++)
    heap_nums[i] = i + 1;  /* initialize the array */
  
  /* stack storage for variables heap_nums and i released
     automatically when get_num_array returns */
  return heap_nums; /* return (copy of) the pointer */
}

int main() {
  unsigned n = 100, i;
  int* heap_nums = get_heap_array(n); /* save returned address */
  
  if (NULL == heap_nums) /* malloc failed */
    [fprintf][9](stderr, "%s\n", "malloc(...) failed...");
  else {
    for (i = 0; i &lt; n; i++) [printf][6]("%i\n", heap_nums[i]);
    [free][10](heap_nums); /* free the heap storage */
  }
  return 0; 
}
```

The **heap** program above has two functions: **main** calls **get_heap_array** with an argument (currently 100) that specifies how many **int** elements the array should have. Because the heap allocation could fail, **main** checks whether **get_heap_array** has returned **NULL**, which signals failure. If the allocation succeeds, **main** prints the **int** values in the array—and immediately thereafter deallocates, with a call to library function **free**, the heap-allocated storage. This is best practice.

The **get_heap_array** function opens with this statement, which merits a closer look:


```
`int* heap_nums = malloc(sizeof(int) * n); /* heap allocation */`
```

The **malloc** library function and its variants deal with bytes; hence, the argument to **malloc** is the number of bytes required for **n** elements of type **int**. (The **sizeof(int)** is four bytes on a standard modern device.) The **malloc** function returns either the address of the first among the allocated bytes or, in case of failure, **NULL**.

In a successful call to **malloc**, the returned address is 64-bits in size on a modern desktop machine. On handhelds and earlier desktop machines, the address might be 32-bits in size or, depending on age, even smaller. The elements in the heap-allocated array are of type **int**, a four-byte signed integer. The address of these heap-allocated **int**s is stored in the local variable **heap_nums**, which is stack-based. Here's a depiction:


```
                 heap-based
 stack-based        /
     \        +----+----+   +----+
 heap-nums---&gt;|int1|int2|...|intN|
              +----+----+   +----+
```

Once the **get_heap_array** function returns, stack storage for pointer variable **heap_nums** is reclaimed automatically—but the heap storage for the dynamic **int** array persists, which is why the **get_heap_array** function returns (a copy of) this address to **main**, which now is responsible, after printing the array's integers, for explicitly deallocating the heap storage with a call to the library function **free**:


```
`free(heap_nums); /* free the heap storage */`
```

The **malloc** function does not initialize heap-allocated storage, which therefore contains random values. By contrast, the **calloc **variant initializes the allocated storage to zeros. Both functions return **NULL** to signal failure.

In the **heap** example, **main** returns immediately after calling **free**, and the executing program terminates, which allows the system to reclaim any allocated heap storage. Nonetheless, the programmer should develop the habit of explicitly freeing heap storage as soon as it is no longer needed.

### Nested heap allocation

The next code example is trickier. C has various library functions that return a pointer to heap storage. Here's a familiar scenario:

1\. The C program invokes a library function that returns a pointer to heap-based storage, typically an aggregate such as an array or a structure:


```
`SomeStructure* ptr = lib_function(); /* returns pointer to heap storage */`
```

2\. The program then uses the allocated storage.

3\. For cleanup, the issue is whether a simple call to **free** will clean up all of the heap-allocated storage that the library function allocates. For example, the **SomeStructure** instance may have fields that, in turn, point to heap-allocated storage. A particularly troublesome case would be a dynamically allocated array of structures, each of which has a field pointing to more dynamically allocated storage.The following code example illustrates the problem and focuses on designing a library that safely provides heap-allocated storage to clients.


```
#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;

typedef struct {
  unsigned id;
  unsigned len;
  float*   heap_nums;
} HeapStruct;
unsigned structId = 1;

HeapStruct* get_heap_struct(unsigned n) {
  /* Try to allocate a HeapStruct. */
  HeapStruct* heap_struct = [malloc][8](sizeof(HeapStruct));
  if (NULL == heap_struct) /* failure? */
    return NULL;           /* if so, return NULL */

  /* Try to allocate floating-point aggregate within HeapStruct. */
  heap_struct-&gt;heap_nums = [malloc][8](sizeof(float) * n);
  if (NULL == heap_struct-&gt;heap_nums) {  /* failure? */
    [free][10](heap_struct);                   /* if so, first free the HeapStruct */
    return NULL;                         /* then return NULL */
  }

  /* Success: set fields */
  heap_struct-&gt;id = structId++;
  heap_struct-&gt;len = n;

  return heap_struct; /* return pointer to allocated HeapStruct */
}

void free_all(HeapStruct* heap_struct) {
  if (NULL == heap_struct) /* NULL pointer? */
    return;                /* if so, do nothing */
  
  [free][10](heap_struct-&gt;heap_nums); /* first free encapsulated aggregate */
  [free][10](heap_struct);            /* then free containing structure */  
}

int main() {
  const unsigned n = 100;
  HeapStruct* hs = get_heap_struct(n); /* get structure with N floats */

  /* Do some (meaningless) work for demo. */
  unsigned i;
  for (i = 0; i &lt; n; i++) hs-&gt;heap_nums[i] = 3.14 + (float) i;
  for (i = 0; i &lt; n; i += 10) [printf][6]("%12f\n", hs-&gt;heap_nums[i]);

  free_all(hs); /* free dynamically allocated storage */
  
  return 0;
}
```

The **nestedHeap** example above centers on a structure **HeapStruct** with a pointer field named **heap_nums**:


```
typedef struct {
  unsigned id;
  unsigned len;
  float*   heap_nums; /** pointer **/
} HeapStruct;
```

The function **get_heap_struct** tries to allocate heap storage for a **HeapStruct** instance, which entails allocating heap storage for a specified number of **float** variables to which the field **heap_nums** points. The result of a successful call to **get_heap_struct** can be depicted as follows, with **hs** as the pointer to the heap-allocated structure:


```
hs--&gt;HeapStruct instance
        id
        len
        heap_nums--&gt;N contiguous float elements
```

In the **get_heap_struct** function, the first heap allocation is straightforward:


```
HeapStruct* heap_struct = [malloc][8](sizeof(HeapStruct));
if (NULL == heap_struct) /* failure? */
  return NULL;           /* if so, return NULL */
```

The **sizeof(HeapStruct)** includes the bytes (four on a 32-bit machine, eight on a 64-bit machine) for the **heap_nums** field, which is a pointer to the **float** elements in a dynamically allocated array. At issue, then, is whether the **malloc** delivers the bytes for this structure or **NULL** to signal failure; if **NULL**, the **get_heap_struct** function returns **NULL** to notify the caller that the heap allocation failed.

The second attempted heap allocation is more complicated because, at this step, heap storage for the **HeapStruct** has been allocated:


```
heap_struct-&gt;heap_nums = [malloc][8](sizeof(float) * n);
if (NULL == heap_struct-&gt;heap_nums) {  /* failure? */
  [free][10](heap_struct);                   /* if so, first free the HeapStruct */
  return NULL;                         /* and then return NULL */
}
```

The argument **n** sent to the **get_heap_struct** function indicates how many **float** elements should be in the dynamically allocated **heap_nums** array. If the required **float** elements can be allocated, then the function sets the structure's **id** and **len** fields before returning the heap address of the **HeapStruct**. If the attempted allocation fails, however, two steps are necessary to meet best practice:

1\. The storage for the **HeapStruct** must be freed to avoid memory leakage. Without the dynamic **heap_nums** array, the **HeapStruct** is presumably of no use to the client function that calls **get_heap_struct**; hence, the bytes for the **HeapStruct** instance should be explicitly deallocated so that the system can reclaim these bytes for future heap allocations.

2\. **NULL** is returned to signal failure.

If the call to the **get_heap_struct** function succeeds, then freeing the heap storage is also tricky because it involves two **free** operations in the proper order. Accordingly, the program includes a **free_all** function instead of requiring the programmer to figure out the appropriate two-step deallocation. For review, here's the **free_all** function:


```
void free_all(HeapStruct* heap_struct) {
  if (NULL == heap_struct) /* NULL pointer? */
    return;                /* if so, do nothing */
  
  [free][10](heap_struct-&gt;heap_nums); /* first free encapsulated aggregate */
  [free][10](heap_struct);            /* then free containing structure */  
}
```

After checking that the argument **heap_struct** is not **NULL**, the function first frees the **heap_nums** array, which requires that the **heap_struct** pointer is still valid. It would be an error to release the **heap_struct** first. Once the **heap_nums** have been deallocated, the **heap_struct** can be freed as well. If **heap_struct** were freed, but **heap_nums** were not, then the **float** elements in the array would be leakage: still allocated bytes but with no possibility of access—hence, of deallocation. The leakage would persist until the **nestedHeap** program exited and the system reclaimed the leaked bytes.

A few cautionary notes on the **free** library function are in order. Recall the sample calls above:


```
[free][10](heap_struct-&gt;heap_nums); /* first free encapsulated aggregate */
[free][10](heap_struct);            /* then free containing structure */
```

These calls free the allocated storage—but they do _not_ set their arguments to **NULL**. (The **free** function gets a copy of an address as an argument; hence, changing the copy to **NULL** would leave the original unchanged.) For example, after a successful call to **free**, the pointer **heap_struct** still holds a heap address of some heap-allocated bytes, but using this address now would be an error because the call to **free** gives the system the right to reclaim and then reuse the allocated bytes.

Calling **free** with a **NULL** argument is pointless but harmless. Calling **free** repeatedly on a non-**NULL** address is an error with indeterminate results:


```
[free][10](heap_struct);  /* 1st call: ok */
[free][10](heap_struct);  /* 2nd call: ERROR */
```

### Memory leakage and heap fragmentation

The phrase "memory leakage" refers to dynamically allocated heap storage that is no longer accessible. Here's a code segment for review:


```
float* nums = [malloc][8](sizeof(float) * 10); /* 10 floats */
nums[0] = 3.14f;                          /* and so on */
nums = [malloc][8](sizeof(float) * 25);        /* 25 new floats */
```

Assume that the first **malloc** succeeds. The second **malloc** resets the **nums** pointer, either to **NULL** (allocation failure) or to the address of the first **float** among newly allocated twenty-five. Heap storage for the initial ten **float** elements remains allocated but is now inaccessible because the **nums** pointer either points elsewhere or is **NULL**. The result is forty bytes (**sizeof(float) * 10**) of leakage.

Before the second call to **malloc**, the initially allocated storage should be freed:


```
float* nums = [malloc][8](sizeof(float) * 10); /* 10 floats */
nums[0] = 3.14f;                          /* and so on */
[free][10](nums);                               /** good **/
nums = [malloc][8](sizeof(float) * 25);        /* no leakage */
```

Even without leakage, the heap can fragment over time, which then requires system defragmentation. For example, suppose that the two biggest heap chunks are currently of sizes 200MB and 100MB. However, the two chunks are not contiguous, and process **P** needs to allocate 250MB of contiguous heap storage. Before the allocation can be made, the system must _defragment_ the heap to provide 250MB contiguous bytes for **P**. Defragmentation is complicated and, therefore, time-consuming.

Memory leakage promotes fragmentation by creating allocated but inaccessible heap chunks. Freeing no-longer-needed heap storage is, therefore, one way that a programmer can help to reduce the need for defragmentation.

### Tools to diagnose memory leakage

Various tools are available for profiling memory efficiency and safety. My favorite is [valgrind][11]. To illustrate how the tool works for memory leaks, here's the **leaky** program:


```
#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;

int* get_ints(unsigned n) {
  int* ptr = [malloc][8](n * sizeof(int));
  if (ptr != NULL) {
    unsigned i;
    for (i = 0; i &lt; n; i++) ptr[i] = i + 1;
  }
  return ptr;
}

void print_ints(int* ptr, unsigned n) {
  unsigned i;
  for (i = 0; i &lt; n; i++) [printf][6]("%3i\n", ptr[i]);
}

int main() {
  const unsigned n = 32;
  int* arr = get_ints(n);
  if (arr != NULL) print_ints(arr, n);

  /** heap storage not yet freed... **/
  return 0;
}
```

The function **main** calls **get_ints**, which tries to **malloc** thirty-two 4-byte **int**s from the heap and then initializes the dynamic array if the **malloc** succeeds. On success, the **main** function then calls **print_ints**. There is no call to **free** to match the call to **malloc**; hence, memory leaks.

With the **valgrind** toolbox installed, the command below checks the **leaky** program for memory leaks (**%** is the command-line prompt):


```
`% valgrind --leak-check=full ./leaky`
```

Below is most of the output. The number on the left, 207683, is the process identifier of the executing **leaky** program. The report provides details of where the leak occurs, in this case, from the call to **malloc** within the **get_ints** function that **main** calls.


```
==207683== HEAP SUMMARY:
==207683==   in use at exit: 128 bytes in 1 blocks
==207683==   total heap usage: 2 allocs, 1 frees, 1,152 bytes allocated
==207683== 
==207683== 128 bytes in 1 blocks are definitely lost in loss record 1 of 1
==207683==   at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==207683==   by 0x109186: get_ints (in /home/marty/gc/leaky)
==207683==   by 0x109236: main (in /home/marty/gc/leaky)
==207683== 
==207683== LEAK SUMMARY:
==207683==   definitely lost: 128 bytes in 1 blocks
==207683==   indirectly lost: 0 bytes in 0 blocks
==207683==   possibly lost: 0 bytes in 0 blocks
==207683==   still reachable: 0 bytes in 0 blocks
==207683==   suppressed: 0 bytes in 0 blocks
```

If function **main** is revised to include a call to **free** right after the one to **print_ints**, then **valgrind** gives the **leaky** program a clean bill of health:


```
`==218462== All heap blocks were freed -- no leaks are possible`
```

### Static area storage

In orthodox C, a function must be defined outside all blocks. This rules out having one function defined inside the body of another, a feature that some C compilers support. My examples stick with functions defined outside all blocks. Such a function is either **static** or **extern**, with **extern** as the default.

C functions and variables with either **static** or **extern** as their storage class reside in what I've been calling the **static area** of memory because this area has a fixed size during program execution. The syntax for these two storage classes is complicated enough to merit a review. After the review, a full code example brings the syntactic details back to life. Functions or variables defined outside all blocks default to **extern**; hence, the storage class **static** must be explicit for both functions and variables:


```
/** file1.c: outside all blocks, five definitions  **/
int foo(int n) { return n * 2; }     /* extern by default */
static int bar(int n) { return n; }  /* static */
extern int baz(int n) { return -n; } /* explicitly extern */

int num1;        /* extern */
static int num2; /* static */
```

The difference between **extern** and **static** comes down to scope: an **extern** function or variable may be visible across files. By contrast, a **static** function is visible only in the file that contains the function's _definition_, and a **static** variable is visible only in the file (or a block therein) that has the variable's _definition_:


```
static int n1;    /* scope is the file */
void func() {
   static int n2; /* scope is func's body */
   ...
}
```

If a **static** variable such as **n1** above is defined outside all blocks, the variable's scope is the file in which the variable is defined. Wherever a **static** variable may be defined, storage for the variable is in the static area of memory.

An **extern** function or variable is defined outside all blocks in a given file, but the function or variable so defined then may be declared in some other file. The typical practice is to _declare_ such a function or variable in a header file, which is included wherever needed. Some short examples clarify these tricky points.

Suppose that the **extern** function **foo** is _defined_ in **file1.c**, with or without the keyword **extern**:


```
/** file1.c **/
int foo(int n) { return n * 2; } /* definition has a body {...} */
```

This function must be _declared_ with an explicit **extern** in any other file (or block therein) for the function to be visible. Here's the declaration that makes the **extern** function **foo** visible in file **file2.c**:


```
/** file2.c: make function foo visible here **/
extern int foo(int); /* declaration (no body) */
```

Recall that a function declaration does not have a body enclosed in curly braces, whereas a function definition does have such a body.

For review, header files typically contain function and variable declarations. Source-code files that require the declarations then **#include** the relevant header file(s). The **staticProg** program in the next section illustrates this approach.

The rules get trickier (sorry!) with **extern** variables. Any **extern** object—function or variable—must be _defined_ outside all blocks. Also, a variable defined outside all blocks defaults to **extern**:


```
/** outside all blocks **/
int n; /* defaults to extern */
```

However, the **extern** can be explicit in the variable's _definition_ only if the variable is initialized explicitly there:


```
/** file1.c: outside all blocks **/
int n1;             /* defaults to extern, initialized by compiler to zero */
extern int n2 = -1; /* ok, initialized explicitly */
int n3 = 9876;      /* ok, extern by default and initialized explicitly */
```

For a variable defined as **extern** in **file1.c** to be visible in another file such as **file2.c**, the variable must be _declared_ as explicitly **extern** in **file2.c** and not initialized, which would turn the declaration into a definition:


```
/** file2.c **/
extern int n1; /* declaration of n1 defined in file1.c */
```

To avoid confusion with **extern** variables, the rule of thumb is to use **extern** explicitly in a _declaration_ (required) but not in a _definition_ (optional and tricky). For functions, the **extern** is optional in a definition but needed for a declaration. The **staticProg** example in the next section brings these points together in a full program.

### The staticProg example

The **staticProg** program consists of three files: two C source files (**static1.c** and **static2.c**) together with a header file (**static.h**) that contains two declarations:


```
/** header file static.h **/
#define NumCount 100               /* macro */
extern int global_nums[NumCount];  /* array declaration */
extern void fill_array();          /* function declaration */
```

The **extern** in the two declarations, one for an array and the other for a function, underscores that the objects are _defined_ elsewhere ("externally"): the array **global_nums** is defined in file **static1.c** (without an explicit **extern**) and the function **fill_array** is defined in file **static2.c** (also without an explicit **extern**). Each source file includes the header file **static.h**.The **static1.c** file defines the two arrays that reside in the static area of memory, **global_nums** and **more_nums**. The second array has a **static** storage class, which restricts its scope to the file (**static1.c**) in which the array is defined. As noted, **global_nums** as **extern** can be made visible in multiple files.


```
/** static1.c **/
#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;

#include "static.h"             /* declarations */

int global_nums[NumCount];      /* definition: extern (global) aggregate */
static int more_nums[NumCount]; /* definition: scope limited to this file */

int main() {
  fill_array(); /** defined in file static2.c **/

  unsigned i;
  for (i = 0; i &lt; NumCount; i++)
    more_nums[i] = i * -1;

  /* confirm initialization worked */
  for (i = 0; i &lt; NumCount; i += 10) 
    [printf][6]("%4i\t%4i\n", global_nums[i], more_nums[i]);
    
  return 0;  
}
```

The **static2.c** file below defines the **fill_array** function, which **main** (in the **static1.c** file) invokes; the **fill_array** function populates the **extern** array named **global_nums**, which is defined in file **static1.c**. The sole point of having two files is to underscore that an **extern** variable or function can be visible across files.


```
/** static2.c **/
#include "static.h" /** declarations **/

void fill_array() { /** definition **/
  unsigned i;
  for (i = 0; i &lt; NumCount; i++) global_nums[i] = i + 2;
}
```

The **staticProg** program can be compiled as follows:


```
`% gcc -o staticProg static1.c static2.c`
```

### More details from assembly language

A modern C compiler can handle any mix of C and assembly language. When compiling a C source file, the compiler first translates the C code into assembly language. Here's the command to save the assembly language generated from the **static1.c** file above:


```
`% gcc -S static1.c`
```

The resulting file is **static1.s**. Here's a segment from the top, with added line numbers for readability:


```
    .file    "static1.c"          ## line  1
    .text                         ## line  2
    .comm    global_nums,400,32   ## line  3
    .local    more_nums           ## line  4
    .comm    more_nums,400,32     ## line  5
    .section    .rodata           ## line  6
.LC0:                             ## line  7
    .string    "%4i\t%4i\n"       ## line  8
    .text                         ## line  9
    .globl    main                ## line 10
    .type    main, @function      ## line 11
main:                             ## line 12
...
```

The assembly-language directives such as **.file** (line 1) begin with a period. As the name suggests, a directive guides the assembler as it translates assembly language into machine code. The **.rodata** directive (line 6) indicates that read-only objects follow, including the string constant **"%4i\t%4i\n"** (line 8), which function **main** (line 12) uses to format output. The function **main** (line 12), introduced as a label (the colon at the end makes it so), is likewise read-only.

In assembly language, labels are addresses. The label **main:** (line 12) marks the address at which the code for the **main** function begins, and the label **.LC0**: (line 7) marks the address at which the format string begins.

The definitions of the **global_nums** (line 3) and **more_nums** (line 4) arrays include two numbers: 400 is the total number of bytes in each array, and 32 is the number of bits in each of the 100 **int** elements per array. (The **.comm** directive in line 5 stands for **common name**, which can be ignored.)

The array definitions differ in that **more_nums** is marked as **.local** (line 4), which means that its scope is restricted to the containing file **static1.s**. By contrast, the **global_nums** array can be made visible across multiple files, including the translations of the **static1.c** and **static2.c** files.

Finally, the **.text** directive occurs twice (lines 2 and 9) in the assembly code segment. The term "text" suggests "read-only" but also covers read/write variables such as the elements in the two arrays. Although the assembly language shown is for an Intel architecture, Arm6 assembly would be quite similar. For both architectures, variables in the **.text** area (in this case, elements in the two arrays) are initialized automatically to zeros.

### Wrapping up

For memory-efficient and memory-safe programming in C, the guidelines are easy to state but may be hard to follow, especially when calls to poorly designed libraries are in play. The guidelines are:

  * Use stack storage whenever possible, thereby encouraging the compiler to optimize with general-purpose registers for scratchpad. Stack storage represents efficient memory use and promotes clean, modular code. Never return a pointer to stack-based storage.
  * Use heap storage carefully. The challenge in C (and C++) is to ensure that dynamically allocated storage is deallocated ASAP. Good programming habits and tools (such as **valgrind**) help to meet the challenge. Favor libraries that provide their own deallocation function(s), such as the **free_all** function in the **nestedHeap** code example.
  * Use static storage judiciously, as this storage impacts the memory footprint of a process from start to finish. In particular, try to avoid **extern** and **static** arrays.



The C code examples are available at my website (<https://condor.depaul.edu/mkalin>).

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/memory-programming-c

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82 (Code going into a computer.)
[2]: http://www.opengroup.org/onlinepubs/009695399/functions/fopen.html
[3]: http://www.opengroup.org/onlinepubs/009695399/functions/fclose.html
[4]: http://www.opengroup.org/onlinepubs/009695399/functions/fread.html
[5]: http://www.opengroup.org/onlinepubs/009695399/functions/fwrite.html
[6]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[7]: http://www.opengroup.org/onlinepubs/009695399/functions/puts.html
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/malloc.html
[9]: http://www.opengroup.org/onlinepubs/009695399/functions/fprintf.html
[10]: http://www.opengroup.org/onlinepubs/009695399/functions/free.html
[11]: https://www.valgrind.org/
