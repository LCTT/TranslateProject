#Translating by qhwdw [Tail Calls, Optimization, and ES6][1]


In this penultimate post about the stack, we take a quick look at tail calls, compiler optimizations, and the proper tail calls landing in the newest version of JavaScript.

A tail call happens when a function F makes a function call as its final action. At that point F will do absolutely no more work: it passes the ball to whatever function is being called and vanishes from the game. This is notable because it opens up the possibility of tail call optimization: instead of [creating a new stack frame][6] for the function call, we can simply reuse F's stack frame, thereby saving stack space and avoiding the work involved in setting up a new frame. Here are some examples in C and their results compiled with [mild optimization][7]:

Simple Tail Calls[download][2]

```
int add5(int a)
{
	return a + 5;
}

int add10(int a)
{
	int b = add5(a); // not tail
	return add5(b); // tail
}

int add5AndTriple(int a){
	int b = add5(a); // not tail
	return 3 * add5(a); // not tail, doing work after the call
}

int finicky(int a){
	if (a > 10){
		return add5AndTriple(a); // tail
	}

	if (a > 5){
		int b = add5(a); // not tail
		return finicky(b); // tail
	}

	return add10(a); // tail
}
```

You can normally spot tail call optimization (hereafter, TCO) in compiler output by seeing a [jump][8] instruction where a [call][9] would have been expected. At runtime TCO leads to a reduced call stack.

A common misconception is that tail calls are necessarily [recursive][10]. That's not the case: a tail call may be recursive, such as in finicky() above, but it need not be. As long as caller F is completely done at the call site, we've got ourselves a tail call. Whether it can be optimized is a different question whose answer depends on your programming environment.

"Yes, it can, always!" is the best answer we can hope for, which is famously the case for Scheme, as discussed in [SICP][11] (by the way, if when you program you don't feel like "a Sorcerer conjuring the spirits of the computer with your spells," I urge you to read that book). It's also the case for [Lua][12]. And most importantly, it is the case for the next version of JavaScript, ES6, whose spec does a good job defining [tail position][13] and clarifying the few conditions required for optimization, such as [strict mode][14]. When a language guarantees TCO, it supports proper tail calls.

Now some of us can't kick that C habit, heart bleed and all, and the answer there is a more complicated "sometimes" that takes us into compiler optimization territory. We've seen the [simple examples][15] above; now let's resurrect our factorial from [last post][16]:

Recursive Factorial[download][3]

```
#include  <stdio.h>

int factorial(int n)
{
	int previous = 0xdeadbeef;

	if (n == 0 || n == 1) {
    	return 1;
    }

	previous = factorial(n-1);
    return n * previous;
}

int main(int argc)
{
	int answer = factorial(5);
    printf("%d\n", answer);
}
```

So, is line 11 a tail call? It's not, because of the multiplication by n afterwards. But if you're not used to optimizations, gcc's [result][17] with [O2 optimization][18] might shock you: not only it transforms factorial into a [recursion-free loop][19], but the factorial(5) call is eliminated entirely and replaced by a [compile-time constant][20] of 120 (5! == 120). This is why debugging optimized code can be hard sometimes. On the plus side, if you call this function it will use a single stack frame regardless of n's initial value. Compiler algorithms are pretty fun, and if you're interested I suggest you check out [Building an Optimizing Compiler][21] and [ACDI][22].

However, what happened here was not tail call optimization, since there was no tail call to begin with. gcc outsmarted us by analyzing what the function does and optimizing away the needless recursion. The task was made easier by the simple, deterministic nature of the operations being done. By adding a dash of chaos (e.g., getpid()) we can throw gcc off:

Recursive PID Factorial[download][4]

```
#include <stdio.h> 
#include <sys/types.h>
#include <unistd.h>

int pidFactorial(int n)
{
	if (1 == n) {
		return getpid(); // tail
	}

	return n * pidFactorial(n-1) * getpid(); // not tail
}

int main(int argc)
{
	int answer = pidFactorial(5);
	printf("%d\n", answer);
}
```

Optimize that, unix fairies! So now we have a regular [recursive call][23] and this function allocates O(n) stack frames to do its work. Heroically, gcc still does [TCO for getpid][24] in the recursion base case. If we now wished to make this function tail recursive, we'd need a slight change:

tailPidFactorial.c[download][5]

```
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int tailPidFactorial(int n, int acc)
{
	if (1 == n) {
		return acc * getpid(); // not tail
	}
	
	acc = (acc * getpid() * n);
	return tailPidFactorial(n-1, acc); // tail
}

int main(int argc)
{
	int answer = tailPidFactorial(5, 1);
	printf("%d\n", answer);
}
```

The accumulation of the result is now [a loop][25] and we've achieved true TCO. But before you go out partying, what can we say about the general case in C? Sadly, while good C compilers do TCO in a number of cases, there are many situations where they cannot do it. For example, as we saw in our [function epilogues][26], the caller is responsible for cleaning up the stack after a function call using the standard C calling convention. So if function F takes two arguments, it can only make TCO calls to functions taking two or fewer arguments. This is one among many restrictions. Mark Probst wrote an excellent thesis discussing [Proper Tail Recursion in C][27] where he discusses these issues along with C stack behavior. He also does [insanely cool juggling][28].

"Sometimes" is a rocky foundation for any relationship, so you can't rely on TCO in C. It's a discrete optimization that may or may not take place, rather than a language feature like proper tail calls, though in practice the compiler will optimize the vast majority of cases. But if you must have it, say for transpiling Scheme into C, you will [suffer][29].

Since JavaScript is now the most popular transpilation target, proper tail calls become even more important there. So kudos to ES6 for delivering it along with many other significant improvements. It's like Christmas for JS programmers.

This concludes our brief tour of tail calls and compiler optimization. Thanks for reading and see you next time.

--------------------------------------------------------------------------------

via:https://manybutfinite.com/post/tail-calls-optimization-es6/

作者：[Gustavo Duarte][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://duartes.org/gustavo/blog/about/
[1]:https://manybutfinite.com/post/tail-calls-optimization-es6/
[2]:https://manybutfinite.com/code/x86-stack/tail.c
[3]:https://manybutfinite.com/code/x86-stack/factorial.c
[4]:https://manybutfinite.com/code/x86-stack/pidFactorial.c
[5]:https://manybutfinite.com/code/x86-stack/tailPidFactorial.c
[6]:https://manybutfinite.com/post/journey-to-the-stack
[7]:https://github.com/gduarte/blog/blob/master/code/x86-stack/asm-tco.sh
[8]:https://github.com/gduarte/blog/blob/master/code/x86-stack/tail-tco.s#L27
[9]:https://github.com/gduarte/blog/blob/master/code/x86-stack/tail.s#L37-L39
[10]:https://manybutfinite.com/post/recursion/
[11]:http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-11.html
[12]:http://www.lua.org/pil/6.3.html
[13]:https://people.mozilla.org/~jorendorff/es6-draft.html#sec-tail-position-calls
[14]:https://people.mozilla.org/~jorendorff/es6-draft.html#sec-strict-mode-code
[15]:https://github.com/gduarte/blog/blob/master/code/x86-stack/tail.c
[16]:https://manybutfinite.com/post/recursion/
[17]:https://github.com/gduarte/blog/blob/master/code/x86-stack/factorial-o2.s
[18]:https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html
[19]:https://github.com/gduarte/blog/blob/master/code/x86-stack/factorial-o2.s#L16-L19
[20]:https://github.com/gduarte/blog/blob/master/code/x86-stack/factorial-o2.s#L38
[21]:http://www.amazon.com/Building-Optimizing-Compiler-Bob-Morgan-ebook/dp/B008COCE9G/
[22]:http://www.amazon.com/Advanced-Compiler-Design-Implementation-Muchnick-ebook/dp/B003VM7GGK/
[23]:https://github.com/gduarte/blog/blob/master/code/x86-stack/pidFactorial-o2.s#L20
[24]:https://github.com/gduarte/blog/blob/master/code/x86-stack/pidFactorial-o2.s#L43
[25]:https://github.com/gduarte/blog/blob/master/code/x86-stack/tailPidFactorial-o2.s#L22-L27
[26]:https://manybutfinite.com/post/epilogues-canaries-buffer-overflows/
[27]:http://www.complang.tuwien.ac.at/schani/diplarb.ps
[28]:http://www.complang.tuwien.ac.at/schani/jugglevids/index.html
[29]:http://en.wikipedia.org/wiki/Tail_call#Through_trampolining