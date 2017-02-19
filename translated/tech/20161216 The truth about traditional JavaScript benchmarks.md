OneNewLife translating

The truth about traditional JavaScript benchmarks
============================================================


It is probably fair to say that [JavaScript][22] is _the most important technology_ these days when it comes to software engineering. To many of us who have been into programming languages, compilers and virtual machines for some time, this still comes a bit as a surprise, as JavaScript is neither very elegant from the language designers point of view, nor very optimizable from the compiler engineers point of view, nor does it have a great standard library. Depending on who you talk to, you can enumerate shortcomings of JavaScript for weeks and still find another odd thing you didn’t know about. Despite what seem to be obvious obstacles, JavaScript is at the core of not only the web today, but it’s also becoming the dominant technology on the server-/cloud-side (via [Node.js][23]), and even finding its way into the IoT space.

That raises the question, why is JavaScript so popular/successful? There is no one great answer to this I’d be aware of. There are many good reasons to use JavaScript today, probably most importantly the great ecosystem that was built around it, and the huge amount of resources available today. But all of this is actually a consequence to some extent. Why did JavaScript became popular in the first place? Well, it was the lingua franca of the web for ages, you might say. But that was the case for a long time, and people hated JavaScript with passion. Looking back in time, it seems the first JavaScript popularity boosts happened in the second half of the last decade. Unsurprisingly this was the time when JavaScript engines accomplished huge speed-ups on various different workloads, which probably changed the way that many people looked at JavaScript.

Back in the days, these speed-ups were measured with what is now called _traditional JavaScript benchmarks_, starting with Apple’s [SunSpider benchmark][24], the mother of all JavaScript micro-benchmarks, followed by Mozilla’s [Kraken benchmark][25] and Google’s V8 benchmark. Later the V8 benchmark was superseded by the[Octane benchmark][26] and Apple released its new [JetStream benchmark][27]. These traditional JavaScript benchmarks drove amazing efforts to bring a level of performance to JavaScript that noone would have expected at the beginning of the century. Speed-ups up to a factor of 1000 were reported, and all of a sudden using `<script>` within a website was no longer a dance with the devil, and doing work client-side was not only possible, but even encouraged.

[
 ![Measuring performance, A simplified history of benchmarking JS](http://benediktmeurer.de/images/2016/sethcds-20161216.png)
][28]


Now in 2016, all (relevant) JavaScript engines reached a level of performance that is incredible and web apps are as snappy as native apps (or can be as snappy as native apps). The engines ship with sophisticated optimizing compilers, that generate short sequences of highly optimized machine code by speculating on the type/shape that hit certain operations (i.e. property access, binary operations, comparisons, calls, etc.) based on feedback collected about types/shapes seen in the past. Most of these optimizations were driven by micro-benchmarks like SunSpider or Kraken, and static test suites like Octane and JetStream. Thanks to JavaScript-based technologies like [asm.js][29] and [Emscripten][30] it is even possible to compile large C++ applications to JavaScript and run them in your web browser, without having to download or install anything, for example you can play [AngryBots][31] on the web out-of-the-box, whereas in the past gaming on the web required special plugins like Adobe Flash or Chrome’s PNaCl.

The vast majority of these accomplishments were due to the presence of these micro-benchmarks and static performance test suites, and the vital competition that resulted from having these traditional JavaScript benchmarks. You can say what you want about SunSpider, but it’s clear that without SunSpider, JavaScript performance would likely not be where it is today. Okay, so much for the praise… now on to the flip side of the coin: Any kind of static performance test - be it a micro-benchmark or a large application macro-benchmark - is doomed to become irrelevant over time! Why? Because the benchmark can only teach you so much before you start gaming it. Once you get above (or below) a certain threshold, the general applicability of optimizations that benefit a particular benchmark will decrease exponentially. For example we built Octane as a proxy for performance of real world web applications, and it probably did a fairly good job at that for quite some time, but nowadays the distribution of time in Octane vs. real world is quite different, so optimizing for Octane beyond where it is currently, is likely not going to yield any significant improvements in the real world (neither general web nor Node.js workloads).

[
 ![Distribution of time in benchmarks vs. real world](http://benediktmeurer.de/images/2016/verwaestblinkon-20161216.png)
][32]


Since it became more and more obvious that all the traditional benchmarks for measuring JavaScript performance, including the most recent versions of JetStream and Octane, might have outlived their usefulness, we started investigating new ways to measure real-world performance beginning of the year, and added a lot of new profiling and tracing hooks to V8 and Chrome. We especially added mechanisms to see where exactly we spend time when browsing the web, i.e. whether it’s script execution, garbage collection, compilation, etc., and the results of these investigations were highly interesting and surprising. As you can see from the slide above, running Octane spends more than 70% of the time executing JavaScript and collecting garbage, while browsing the web you always spend less than 30% of the time actually executing JavaScript, and never more than 5% collecting garbage. Instead a significant amount of time goes to parsing and compiling, which is not reflected in Octane. So spending a lot of time to optimize JavaScript execution will boost your score on Octane, but won’t have any positive impact on loading [youtube.com][33]. In fact, spending more time on optimizing JavaScript execution might even hurt your real-world performance since the compiler takes more time, or you need to track additional feedback, thus eventually adding more time to the Compile, IC and Runtime buckets.

[
 ![Speedometer](http://benediktmeurer.de/images/2016/speedometer-20161216.png)
][34]

There’s another set of benchmarks, which try to measure overall browser performance, including JavaScript **and** DOM performance, with the most recent addition being the [Speedometer benchmark][35]. The benchmark tries to capture real world performance more realistically by running a simple [TodoMVC][36] application implemented with different popular web frameworks (it’s a bit outdated now, but a new version is in the makings). The various tests are included in the slide above next to octane (angular, ember, react, vanilla, flight and backbone), and as you can see these seem to be a better proxy for real world performance at this point in time. Note however that this data is already six months old at the time of this writing and things might have changed as we optimized more real world patterns (for example we are refactoring the IC system to reduce overhead significantly, and the [parser is being redesigned][37]). Also note that while this looks like it’s only relevant in the browser space, we have very strong evidence that traditional peak performance benchmarks are also not a good proxy for real world Node.js application performance.

[
 ![Speedometer vs. Octane](http://benediktmeurer.de/images/2016/verwaestblinkon2-20161216.png)
][38]


All of this is probably already known to a wider audience, so I’ll use the rest of this post to highlight a few concrete examples, why I think it’s not only useful, but crucial for the health of the JavaScript community to stop paying attention to static peak performance benchmarks above a certain threshold. So let me run you through a couple of example how JavaScript engines can and do game benchmarks.

### The notorious SunSpider examples

A blog post on traditional JavaScript benchmarks wouldn’t be complete without pointing out the obvious SunSpider problems. So let’s start with the prime example of performance test that has limited applicability in real world: The [`bitops-bitwise-and.js`][39] performance test.

[
 ![bitops-bitwise-and.js](http://benediktmeurer.de/images/2016/bitops-bitwise-and-20161216.png)
][40]

There are a couple of algorithms that need fast bitwise and, especially in the area of code transpiled from C/C++ to JavaScript, so it does indeed make some sense to be able to perform this operation quickly. However real world web pages will probably not care whether an engine can execute bitwise and in a loop 2x faster than another engine. But staring at this code for another couple of seconds, you’ll probably notice that `bitwiseAndValue` will be `0` after the first loop iteration and will remain `0` for the next 599999 iterations. So once you get this to good performance, i.e. anything below 5ms on decent hardware, you can start gaming this benchmark by trying to recognize that only the first iteration of the loop is necessary, while the remaining iterations are a waste of time (i.e. dead code after [loop peeling][41]). This needs some machinery in JavaScript to perform this transformation, i.e. you need to check that `bitwiseAndValue` is either a regular property of the global object or not present before you execute the script, there must be no interceptor on the global object or it’s prototypes, etc., but if you really want to win this benchmark, and you are willing to go all in, then you can execute this test in less than 1ms. However this optimization would be limited to this special case, and slight modifications of the test would probably no longer trigger it.

Ok, so that [`bitops-bitwise-and.js`][42] test was definitely the worst example of a micro-benchmark. Let’s move on to something more real worldish in SunSpider, the [`string-tagcloud.js`][43] test, which essentially runs a very early version of the `json.js` polyfill. The test arguably looks a lot more reasonable that the bitwise and test, but looking at the profile of the benchmark for some time immediately reveals that a lot of time is spent on a single `eval` expression (up to 20% of the overall execution time for parsing and compiling plus up to 10% for actually executing the compiled code):

[
 ![string-tagcloud.js](http://benediktmeurer.de/images/2016/string-tagcloud-20161216.png)
][44]

Looking closer reveals that this `eval` is executed exactly once, and is passed a JSONish string, that contains an array of 2501 objects with `tag` and `popularity` fields:

```
([
  {
    "tag": "titillation",
    "popularity": 4294967296
  },
  {
    "tag": "foamless",
    "popularity": 1257718401
  },
  {
    "tag": "snarler",
    "popularity": 613166183
  },
  {
    "tag": "multangularness",
    "popularity": 368304452
  },
  {
    "tag": "Fesapo unventurous",
    "popularity": 248026512
  },
  {
    "tag": "esthesioblast",
    "popularity": 179556755
  },
  {
    "tag": "echeneidoid",
    "popularity": 136641578
  },
  {
    "tag": "embryoctony",
    "popularity": 107852576
  },
  ...
])
```

Obviously parsing these object literals, generating native code for it and then executing that code, comes at a high cost. It would be a lot cheaper to just parse the input string as JSON and generate an appropriate object graph. So one trick to speed up this benchmark is to mock with `eval` and try to always interpret the data as JSON first and only fallback to real parse, compile, execute if the attempt to read JSON failed (some additional magic is required to skip the parenthesis, though). Back in 2007, this wouldn’t even be a bad hack, since there was no [`JSON.parse`][45], but in 2017 this is just technical debt in the JavaScript engine and potentially slows down legit uses of `eval`. In fact updating the benchmark to modern JavaScript

```
--- string-tagcloud.js.ORIG     2016-12-14 09:00:52.869887104 +0100
+++ string-tagcloud.js  2016-12-14 09:01:01.033944051 +0100
@@ -198,7 +198,7 @@
                     replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(:?[eE][+\-]?\d+)?/g, ']').
                     replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {

-                j = eval('(' + this + ')');
+                j = JSON.parse(this);

                 return typeof filter === 'function' ? walk('', j) : j;
             }
```

yields an immediate performance boost, dropping runtime from 36ms to 26ms for V8 LKGR as of today, a 30% improvement!

```
$ node string-tagcloud.js.ORIG
Time (string-tagcloud): 36 ms.
$ node string-tagcloud.js
Time (string-tagcloud): 26 ms.
$ node -v
v8.0.0-pre
$
```

This is a common problem with static benchmarks and performance test suites. Today noone would seriously use `eval` to parse JSON data (also for obvious security reaons, not only for the performance issues), but rather stick to [`JSON.parse`][46] for all code written in the last five years. In fact using `eval` to parse JSON would probably be considered a bug in production code today! So the engine writers effort of focusing on performance of newly written code is not reflected in this ancient benchmark, instead it would be beneficial to make `eval`unnecessarily ~~smart~~complex to win on `string-tagcloud.js`.

Ok, so let’s look at yet another example: the [`3d-cube.js`][47]. This benchmark does a lot of matrix operations, where even the smartest compiler can’t do a lot about it, but just has to execute it. Essentially the benchmark spends a lot of time executing the `Loop` function and functions called by it.

[
 ![3d-cube.js](http://benediktmeurer.de/images/2016/3d-cube-loop-20161216.png)
][48]

One interesting observation here is that the `RotateX`, `RotateY` and `RotateZ` functions are always called with the same constant parameter `Phi`.

[
 ![3d-cube.js](http://benediktmeurer.de/images/2016/3d-cube-rotate-20161216.png)
][49]

This means that we basically always compute the same values for [`Math.sin`][50] and [`Math.cos`][51], 204 times each. There are only three different inputs,

*   0.017453292519943295,
*   0.05235987755982989, and
*   0.08726646259971647

obviously. So, one thing you could do here to avoid recomputing the same sine and cosine values all the time is to cache the previously computed values, and in fact, that’s what V8 used to do in the past, and other engines like SpiderMonkey still do. We removed the so-called _transcendental cache_ from V8 because the overhead of the cache was noticable in actual workloads where you don’t always compute the same values in a row, which is unsurprisingly very common in the wild. We took serious hits on the SunSpider benchmark when we removed this benchmark specific optimizations back in 2013 and 2014, but we totally believe that it doesn’t make sense to optimize for a benchmark while at the same time penalizing the real world use case in such a way.

[
 ![3d-cube benchmark](http://benediktmeurer.de/images/2016/3d-cube-awfy-20161216.png)
][52]


Obviously a better way to deal with the constant sine/cosine inputs is a sane inlining heuristic that tries to balance inlining and take into account different factors like prefer inlining at call sites where constant folding can be beneficial, like in case of the `RotateX`, `RotateY`, and `RotateZ` call sites. But this was not really possible with the Crankshaft compiler for various reasons. With Ignition and TurboFan, this becomes a sensible option, and we are already working on better [inlining heuristics][53].

### Garbage collection considered harmful

Besides these very test specific issues, there’s another fundamental problem with the SunSpider benchmark: The overall execution time. V8 on decent Intel hardware runs the whole benchmark in roughly 200ms currently (with the default configuration). A minor GC can take anything between 1ms and 25ms currently (depending on live objects in new space and old space fragmentation), while a major GC pause can easily take 30ms (not even taking into account the overhead from incremental marking), that’s more than 10% of the overall execution time of the whole SunSpider suite! So any engine that doesn’t want to risk a 10-20% slowdown due to a GC cycle has to somehow ensure it doesn’t trigger GC while running SunSpider.

[
 ![driver-TEMPLATE.html](http://benediktmeurer.de/images/2016/sunspider-driver-20161216.png)
][54]

There are different tricks to accomplish this, none of which has any positive impact in real world as far as I can tell. V8 uses a rather simple trick: Since every SunSpider test is run in a new `<iframe>`, which corresponds to a new _native context_ in V8 speak, we just detect rapid `<iframe>` creation and disposal (all SunSpider tests take less than 50ms each), and in that case perform a garbage collection between the disposal and creation, to ensure that we never trigger a GC while actually running a test. This trick works pretty well, and in 99.9% of the cases doesn’t clash with real uses; except every now and then, it can hit you hard if for whatever reason you do something that makes you look like you are the SunSpider test driver to V8, then you can get hit hard by forced GCs, and that can have a negative effect on your application. So rule of thumb: **Don’t let your application look like SunSpider!**

I could go on with more SunSpider examples here, but I don’t think that’d be very useful. By now it should be clear that optimizing further for SunSpider above the threshold of good performance will not reflect any benefits in real world. In fact the world would probably benefit a lot from not having SunSpider any more, as engines could drop weird hacks that are only useful for SunSpider and can even hurt real world use cases. Unfortunately SunSpider is still being used heavily by the (tech) press to compare what they think is browser performance, or even worse compare phones! So there’s a certain natural interest from phone makers and also from Android in general to have Chrome look somewhat decent on SunSpider (and other nowadays meaningless benchmarks FWIW). The phone makers generate money by selling phones, so getting good reviews is crucial for the success of the phone division or even the whole company, and some of them even went as far as shipping old versions of V8 in their phones that had a higher score on SunSpider, exposing their users to all kinds of unpatched security holes that had long been fixed, and shielding their users from any real world performance benefits that come with more recent V8 versions!

[
 ![Galaxy S7 and S7 Edge review: Samsung's finest get more polished](http://benediktmeurer.de/images/2016/engadget-20161216.png)
][55]


If we as the JavaScript community really want to be serious about real world performance in JavaScript land, we need to make the tech press stop using traditional JavaScript benchmarks to compare browsers or phones. I see that there’s a benefit in being able to just run a benchmark in each browser and compare the number that comes out of it, but then please, please use a benchmark that has something in common with what is relevant today, i.e. real world web pages; if you feel the need to compare two phones via a browser benchmark, please at least consider using [Speedometer][56].

### Cuteness break!


 ![](http://images-cdn.9gag.com/photo/avZd9NX_700b.jpg)


I always loved this in [Myles Borins][57]’ talks, so I had to shamelessly steal his idea. So now that we recovered from the SunSpider rant, let’s go on to check the other classic benchmarks…

### The not so obvious Kraken case

The Kraken benchmark was [released by Mozilla in September 2010][58], and it was said to contain snippets/kernels of real world applications, and be less of a micro-benchmark compared to SunSpider. I don’t want to spend too much time on Kraken, because I think it wasn’t as influential on JavaScript performance as SunSpider and Octane, so I’ll highlight one particular example from the [`audio-oscillator.js`][59] test.

[
 ![audio-oscillator.js](http://benediktmeurer.de/images/2016/audio-oscillator-20161216.png)
][60]

So the test invokes the `calcOsc` function 500 times. `calcOsc` first calls `generate` on the global `sine``Oscillator`, then creates a new `Oscillator`, calls `generate` on that and adds it to the global `sine` oscillator. Without going into detail why the test is doing this, let’s have a look at the `generate` method on the `Oscillator` prototype.

[
 ![audio-oscillator-data.js](http://benediktmeurer.de/images/2016/audio-oscillator-generate-20161216.png)
][61]

Looking at the code, you’d expect this to be dominated by the array accesses or the multiplications or the[`Math.round`][62] calls in the loop, but surprisingly what’s completely dominating the runtime of `Oscillator.prototype.generate` is the `offset % this.waveTableLength` expression. Running this benchmark in a profiler on any Intel machine reveals that more than 20% of the ticks are attributed to the `idiv`instruction that we generate for the modulus. One interesting observation however is that the `waveTableLength` field of the `Oscillator` instances always contains the same value 2048, as it’s only assigned once in the `Oscillator` constructor.

[
 ![audio-oscillator-data.js](http://benediktmeurer.de/images/2016/audio-oscillator-constructor-20161216.png)
][63]

If we know that the right hand side of an integer modulus operation is a power of two, we can generate [way better code][64] obviously and completely avoid the `idiv` instruction on Intel. So what we needed was a way to get the information that `this.waveTableLength` is always 2048 from the `Oscillator` constructor to the modulus operation in `Oscillator.prototype.generate`. One obvious way would be to try to rely on inlining of everything into the `calcOsc` function and let load/store elimination do the constant propagation for us, but this would not work for the `sine` oscillator, which is allocated outside the `calcOsc` function.

So what we did instead is add support for tracking certain constant values as right-hand side feedback for the modulus operator. This does make some sense in V8, since we track type feedback for binary operations like `+`, `*` and `%` on uses, which means the operator tracks the types of inputs it has seen and the types of outputs that were produced (see the slides from the round table talk on [Fast arithmetic for dynamic languages][65]recently for some details). Hooking this up with fullcodegen and Crankshaft was even fairly easy back then, the `BinaryOpIC` for `MOD` can also track known power of two right hand sides. In fact running the default configuration of V8 (with Crankshaft and fullcodegen)

```
$ ~/Projects/v8/out/Release/d8 --trace-ic audio-oscillator.js
[...SNIP...]
[BinaryOpIC(MOD:None*None->None) => (MOD:Smi*2048->Smi) @ ~Oscillator.generate+598 at audio-oscillator.js:697]
[...SNIP...]
$
```

shows that the `BinaryOpIC` is picking up the proper constant feedback for the right hand side of the modulus, and properly tracks that the left hand side was always a small integer (a `Smi` in V8 speak), and we also always produced a small integer result. Looking at the generated code using `--print-opt-code --code-comments` quickly reveals that Crankshaft utilizes the feedback to generate an efficient code sequence for the integer modulus in `Oscillator.prototype.generate`:

```
[...SNIP...]
                  ;;; <@80,#84> load-named-field
0x133a0bdacc4a   330  8b4343         movl rax,[rbx+0x43]
                  ;;; <@83,#86> compare-numeric-and-branch
0x133a0bdacc4d   333  3d00080000     cmp rax,0x800
0x133a0bdacc52   338  0f85ff000000   jnz 599  (0x133a0bdacd57)
[...SNIP...]
                  ;;; <@90,#94> mod-by-power-of-2-i
0x133a0bdacc5b   347  4585db         testl r11,r11
0x133a0bdacc5e   350  790f           jns 367  (0x133a0bdacc6f)
0x133a0bdacc60   352  41f7db         negl r11
0x133a0bdacc63   355  4181e3ff070000 andl r11,0x7ff
0x133a0bdacc6a   362  41f7db         negl r11
0x133a0bdacc6d   365  eb07           jmp 374  (0x133a0bdacc76)
0x133a0bdacc6f   367  4181e3ff070000 andl r11,0x7ff
[...SNIP...]
                  ;;; <@127,#88> deoptimize
0x133a0bdacd57   599  e81273cdff     call 0x133a0ba8406e
[...SNIP...]
```

So you see we load the value of `this.waveTableLength` (`rbx` holds the `this` reference), check that it’s still 2048 (hexadecimal 0x800), and if so just perform a bitwise and with the proper bitmask 0x7ff (`r11` contains the value of the loop induction variable `i`) instead of using the `idiv` instruction (paying proper attention to preserve the sign of the left hand side).

### The over-specialization issue

So this trick is pretty damn cool, but as with many benchmark focused tricks, it has one major drawback: It’s over-specialized! As soon as the right hand side ever changes, all optimized code will have to be deoptimized (as the assumption that the right hand is always a certain power of two no longer holds) and any further optimization attempts will have to use `idiv` again, as the `BinaryOpIC` will most likely report feedback in the form `Smi*Smi->Smi` then. For example, let’s assume we instantiate another `Oscillator`, set a different`waveTableLength` on it, and call `generate` for the oscillator, then we’d lose 20% performance even though the actually interesting `Oscillator`s are not affected (i.e. the engine does non-local penalization here).

```
--- audio-oscillator.js.ORIG    2016-12-15 22:01:43.897033156 +0100
+++ audio-oscillator.js 2016-12-15 22:02:26.397326067 +0100
@@ -1931,6 +1931,10 @@
 var frequency = 344.53;
 var sine = new Oscillator(Oscillator.Sine, frequency, 1, bufferSize, sampleRate);

+var unused = new Oscillator(Oscillator.Sine, frequency, 1, bufferSize, sampleRate);
+unused.waveTableLength = 1024;
+unused.generate();
+
 var calcOsc = function() {
   sine.generate();
```

Comparing the execution times of the original `audio-oscillator.js` and the version that contains an additional unused `Oscillator` instance with a modified `waveTableLength` shows the expected results:

```
$ ~/Projects/v8/out/Release/d8 audio-oscillator.js.ORIG
Time (audio-oscillator-once): 64 ms.
$ ~/Projects/v8/out/Release/d8 audio-oscillator.js
Time (audio-oscillator-once): 81 ms.
$
```

This is an example for a pretty terrible performance cliff: Let’s say a developer writes code for a library and does careful tweaking and optimizations using certain sample input values, and the performance is decent. Now a user starts using that library reading through the performance notes, but somehow falls off the performance cliff, because she/he is using the library in a slightly different way, i.e. somehow polluting type feedback for a certain `BinaryOpIC`, and is hit by a 20% slowdown (compared to the measurements of the library author) that neither the library author nor the user can explain, and that seems rather arbitrary.

Now this is not uncommon in JavaScript land, and unfortunately quite a couple of these cliffs are just unavoidable, because they are due to the fact that JavaScript performance is based on optimistic assumptions and speculation. We have been spending **a lot** of time and energy trying to come up with ways to avoid these performance cliffs, and still provide (nearly) the same performance. As it turns out it makes a lot of sense to avoid `idiv` whenever possible, even if you don’t necessarily know that the right hand side is always a power of two (via dynamic feedback), so what TurboFan does is different from Crankshaft, in that it always checks at runtime whether the input is a power of two, so general case for signed integer modulus, with optimization for (unknown) power of two right hand side looks like this (in pseudo code):

```
if 0 < rhs then
  msk = rhs - 1
  if rhs & msk != 0 then
    lhs % rhs
  else
    if lhs < 0 then
      -(-lhs & msk)
    else
      lhs & msk
else
  if rhs < -1 then
    lhs % rhs
  else
    zero
```

And that leads to a lot more consistent and predictable performance (with TurboFan):

```
$ ~/Projects/v8/out/Release/d8 --turbo audio-oscillator.js.ORIG
Time (audio-oscillator-once): 69 ms.
$ ~/Projects/v8/out/Release/d8 --turbo audio-oscillator.js
Time (audio-oscillator-once): 69 ms.
$
```

The problem with benchmarks and over-specialization is that the benchmark can give you hints where to look and what to do, but it doesn’t tell you how far you have to go and doesn’t protect the optimization properly. For example, all JavaScript engines use benchmarks as a way to guard against performance regressions, but running Kraken for example wouldn’t protect the general approach that we have in TurboFan, i.e. we could _degrade_ the modulus optimization in TurboFan to the over-specialized version of Crankshaft and the benchmark wouldn’t tell us that we regressed, because from the point of view of the benchmark it’s fine! Now you could extend the benchmark, maybe in the same way that I did above, and try to cover everything with benchmarks, which is what engine implementors do to a certain extent, but that approach doesn’t scale arbitrarily. Even though benchmarks are convenient and easy to use for communication and competition, you’ll also need to leave space for common sense, otherwise over-specialization will dominate everything and you’ll have a really, really fine line of acceptable performance and big performance cliffs.

There are various other issues with the Kraken tests, but let’s move on the probably most influential JavaScript benchmark of the last five years… the Octane benchmark.

### A closer look at Octane

The [Octane benchmark][66] is the successor of the V8 benchmark and was initially [announced by Google in mid 2012][67] and the current version Octane 2.0 was [announced in late 2013][68]. This version contains 15 individual tests, where for two of them - Splay and Mandreel - we measure both the throughput and the latency. These tests range from [Microsofts TypeScript compiler][69] compiling itself, to raw [asm.js][70] performance being measured by the zlib test, to a performance test for the RegExp engine, to a ray tracer, to a full 2D physics engine, etc. See the [description][71] for a detailed overview of the individual benchmark line items. All these line items were carefully chosen to reflect a certain aspect of JavaScript performance that we considered important in 2012 or expected to become important in the near future.

To a large extent Octane was super successful in achieving its goals of taking JavaScript performance to the next level, it resulted in a healthy competition in 2012 and 2013 where great performance achievements were driven by Octane. But it’s almost 2017 now, and the world looks fairly different than in 2012, really, really different actually. Besides the usual and often cited criticism that most items in Octane are essentially outdated (i.e. ancient versions of TypeScript, zlib being compiled via an ancient version of [Emscripten][72], Mandreel not even being available anymore, etc.), something way more important affects Octanes usefulness:

We saw big web frameworks winning the race on the web, especially heavy frameworks like [Ember][73] and [AngularJS][74], that use patterns of JavaScript execution, which are not reflected at all by Octane and are often hurt by (our) Octane specific optimizations. We also saw JavaScript winning on the server and tooling front, which means there are large scale JavaScript applications that now often run for weeks if not years, which also not captured by Octane. As stated in the beginning we have hard data that suggests that the execution and memory profile of Octane is completely different than what we see on the web daily.

So, let’s look into some concrete examples of benchmark gaming that is happening today with Octane, where optimizations are no longer reflected in real world. Note that even though this might sound a bit negative in retrospect, it’s definitely not meant that way! As I said a couple of times already, Octane is an important chapter in the JavaScript performance story, and it played a very important role. All the optimizations that went into JavaScript engines driven by Octane in the past were added on good faith that Octane is a good proxy for real world performance! _Every age has its benchmark, and for every benchmark there comes a time when you have to let go!_

That being said, let’s get this show on the road and start by looking at the Box2D test, which is based on[Box2DWeb][75], a popular 2D physics engine originally written by Erin Catto, ported to JavaScript. Overall does a lot of floating point math and drove a lot of good optimizations in JavaScript engines, however as it turns out it contains a bug that can be exploited to game the benchmark a bit (blame it on me, I spotted the bug and added the exploit in this case). There’s a function `D.prototype.UpdatePairs` in the benchmark that looks like this (deminified):

```
D.prototype.UpdatePairs = function(b) {
    var e = this;
    var f = e.m_pairCount = 0,
        m;
    for (f = 0; f < e.m_moveBuffer.length; ++f) {
        m = e.m_moveBuffer[f];
        var r = e.m_tree.GetFatAABB(m);
        e.m_tree.Query(function(t) {
                if (t == m) return true;
                if (e.m_pairCount == e.m_pairBuffer.length) e.m_pairBuffer[e.m_pairCount] = new O;
                var x = e.m_pairBuffer[e.m_pairCount];
                x.proxyA = t < m ? t : m;
                x.proxyB = t >= m ? t : m;
                ++e.m_pairCount;
                return true
            },
            r)
    }
    for (f = e.m_moveBuffer.length = 0; f < e.m_pairCount;) {
        r = e.m_pairBuffer[f];
        var s = e.m_tree.GetUserData(r.proxyA),
            v = e.m_tree.GetUserData(r.proxyB);
        b(s, v);
        for (++f; f < e.m_pairCount;) {
            s = e.m_pairBuffer[f];
            if (s.proxyA != r.proxyA || s.proxyB != r.proxyB) break;
            ++f
        }
    }
};
```

Some profiling shows that a lot of time is spent in the innocent looking inner function passed to `e.m_tree.Query` in the first loop:

```
function(t) {
    if (t == m) return true;
    if (e.m_pairCount == e.m_pairBuffer.length) e.m_pairBuffer[e.m_pairCount] = new O;
    var x = e.m_pairBuffer[e.m_pairCount];
    x.proxyA = t < m ? t : m;
    x.proxyB = t >= m ? t : m;
    ++e.m_pairCount;
    return true
}
```

More precisely the time is not spent in this function itself, but rather operations and builtin library functions triggered by this. As it turned out we spent 4-7% of the overall execution time of the benchmark calling into the [`Compare` runtime function][76], which implements the general case for the [abstract relational comparison][77].


 ![Box2D compare profile](http://benediktmeurer.de/images/2016/box2d-compare-20161216.png)


Almost all the calls to the runtime function came from the [`CompareICStub`][78], which is used for the two relational comparisons in the inner function:

```
x.proxyA = t < m ? t : m;
x.proxyB = t >= m ? t : m;
```

So these two innocent looking lines of code are responsible for 99% of the time spent in this function! How come? Well, as with so many things in JavaScript, the [abstract relational comparison][79] is not necessarily intuitive to use properly. In this function both `t` and `m` are always instances of `L`, which is a central class in this application, but doesn’t override either any of `Symbol.toPrimitive`, `"toString"`, `"valueOf"` or `Symbol.toStringTag` properties, that are relevant for the abstract relation comparison. So what happens if you write `t < m` is this:

1.  Calls [ToPrimitive][12](`t`, `hint Number`).
2.  Runs [OrdinaryToPrimitive][13](`t`, `"number"`) since there’s no `Symbol.toPrimitive`.
3.  Executes `t.valueOf()`, which yields `t` itself since it calls the default [`Object.prototype.valueOf`][14].
4.  Continues with `t.toString()`, which yields `"[object Object]"`, since the default[`Object.prototype.toString`][15] is being used and no [`Symbol.toStringTag`][16] was found for `L`.
5.  Calls [ToPrimitive][17](`m`, `hint Number`).
6.  Runs [OrdinaryToPrimitive][18](`m`, `"number"`) since there’s no `Symbol.toPrimitive`.
7.  Executes `m.valueOf()`, which yields `m` itself since it calls the default [`Object.prototype.valueOf`][19].
8.  Continues with `m.toString()`, which yields `"[object Object]"`, since the default[`Object.prototype.toString`][20] is being used and no [`Symbol.toStringTag`][21] was found for `L`.
9.  Does the comparison `"[object Object]" < "[object Object]"` which yields `false`.

Same for `t >= m`, which always produces `true` then. So the bug here is that using abstract relational comparison this way just doesn’t make sense. And the way to exploit it is to have the compiler constant-fold it, i.e. similar to applying this patch to the benchmark:

```
--- octane-box2d.js.ORIG        2016-12-16 07:28:58.442977631 +0100
+++ octane-box2d.js     2016-12-16 07:29:05.615028272 +0100
@@ -2021,8 +2021,8 @@
                     if (t == m) return true;
                     if (e.m_pairCount == e.m_pairBuffer.length) e.m_pairBuffer[e.m_pairCount] = new O;
                     var x = e.m_pairBuffer[e.m_pairCount];
-                    x.proxyA = t < m ? t : m;
-                    x.proxyB = t >= m ? t : m;
+                    x.proxyA = m;
+                    x.proxyB = t;
                     ++e.m_pairCount;
                     return true
                 },
```

Because doing so results in a serious speed-up of 13% by not having to do the comparison, and all the propery lookups and builtin function calls triggered by it.

```
$ ~/Projects/v8/out/Release/d8 octane-box2d.js.ORIG
Score (Box2D): 48063
$ ~/Projects/v8/out/Release/d8 octane-box2d.js
Score (Box2D): 55359
$
```

So how did we do that? As it turned out we already had a mechanism for tracking the shape of objects that are being compared in the `CompareIC`, the so-called _known receiver_ map tracking (where _map_ is V8 speak for object shape+prototype), but that was limited to abstract and strict equality comparisons. But I could easily extend the tracking to also collect the feedback for abstract relational comparison:

```
$ ~/Projects/v8/out/Release/d8 --trace-ic octane-box2d.js
[...SNIP...]
[CompareIC in ~+557 at octane-box2d.js:2024 ((UNINITIALIZED+UNINITIALIZED=UNINITIALIZED)->(RECEIVER+RECEIVER=KNOWN_RECEIVER))#LT @ 0x1d5a860493a1]
[CompareIC in ~+649 at octane-box2d.js:2025 ((UNINITIALIZED+UNINITIALIZED=UNINITIALIZED)->(RECEIVER+RECEIVER=KNOWN_RECEIVER))#GTE @ 0x1d5a860496e1]
[...SNIP...]
$
```

Here the `CompareIC` used in the baseline code tells us that for the LT (less than) and the GTE (greather than or equal) comparisons in the function we’re looking at, it had only seen `RECEIVER`s so far (which is V8 speak for JavaScript objects), and all these receivers had the same map `0x1d5a860493a1`, which corresponds to the map of `L` instances. So in optimized code, we can constant-fold these operations to `false` and `true`respectively as long as we know that both sides of the comparison are instances with the map `0x1d5a860493a1` and noone messed with `L`s prototype chain, i.e. the `Symbol.toPrimitive`, `"valueOf"` and `"toString"` methods are the default ones, and noone installed a `Symbol.toStringTag` accessor property. The rest of the story is _black voodoo magic_ in Crankshaft, with a lot of cursing and initially forgetting to check `Symbol.toStringTag` properly:

[
 ![Hydrogen voodoo magic](http://benediktmeurer.de/images/2016/hydrogen-compare-20161216.png)
][80]

And in the end there was a rather huge performance boost on this particular benchmark:

 ![Box2D boost](http://benediktmeurer.de/images/2016/awfy-box2d-20161216.png)


To my defense, back then I was not convinced that this particular behavior would always point to a bug in the original code, so I was even expecting that code in the wild might hit this case fairly often, also because I was assuming that JavaScript developers wouldn’t always care about these kinds of potential bugs. However, I was so wrong, and here I stand corrected! I have to admit that this particular optimization is purely a benchmark thing, and will not help any real code (unless the code is written to benefit from this optimization, but then you could as well write `true` or `false` directly in your code instead of using an always-constant relational comparison). You might wonder why we slightly regressed soon after my patch. That was the period where we threw the whole team at implementing ES2015, which was really a dance with the devil to get all the new stuff in (ES2015 is a monster!) without seriously regressing the traditional benchmarks.

Enough said about Box2D, let’s have a look at the Mandreel benchmark. Mandreel was a compiler for compiling C/C++ code to JavaScript, it didn’t use the [asm.js][81] subset of JavaScript that is being used by the more recent [Emscripten][82] compiler, and has been deprecated (and more or less disappeared from the internet) since roughly three years now. Nevertheless, Octane still has a version of the [Bullet physics engine][83] compiled via [Mandreel][84]. An interesting test here is the MandreelLatency test, which instruments the Mandreel benchmark with frequent time measurement checkpoints. The idea here was that since Mandreel stresses the VM’s compiler, this test provides an indication of the latency introduced by the compiler, and long pauses between measurement checkpoints lower the final score. In theory that sounds very reasonable, and it does indeed make some sense. However as usual vendors figured out ways to cheat on this benchmark.

[
 ![Mozilla bug 1162272](http://benediktmeurer.de/images/2016/bugzilla-mandreel-20161216.png)
][85]

Mandreel contains a huge initialization function `global_init` that takes an incredible amount of time just parsing this function, and generating baseline code for it. Since engines usually parse various functions in scripts multiple times, one so-called pre-parse step to discover functions inside the script, and then as the function is invoked for the first time a full parse step to actually generate baseline code (or bytecode) for the function. This is called [_lazy parsing_][86] in V8 speak. V8 has some heuristics in place to detect functions that are invoked immediately where pre-parsing is actually a waste of time, but that’s not clear for the `global_init`function in the Mandreel benchmark, thus we’d would have an incredible long pause for pre-parsing + parsing + compiling the big function. So we [added an additional heuristic][87] that would also avoids the pre-parsing for this `global_init` function.

[
 ![MandreelLatency benchmark](http://benediktmeurer.de/images/2016/awfy-mandreel-20161216.png)
][88]

So we saw an almost 200% improvement just by detecting `global_init` and avoiding the expensive pre-parse step. We are somewhat certain that this should not negatively impact real world use cases, but there’s no guarantee that this won’t bite you on large functions where pre-parsing would be beneficial (because they aren’t immediately executed).

So let’s look into another slightly less controversial benchmark: the [`splay.js`][89] test, which is meant to be a data manipulation benchmark that deals with splay trees and exercises the automatic memory management subsystem (aka the garbage collector). It comes bundled with a latency test that instruments the Splay code with frequent measurement checkpoints, where a long pause between checkpoints is an indication of high latency in the garbage collector. This test measures the frequency of latency pauses, classifies them into buckets and penalizes frequent long pauses with a low score. Sounds great! No GC pauses, no jank. So much for the theory. Let’s have a look at the benchmark, here’s what’s at the core of the whole splay tree business:

[
 ![splay.js](http://benediktmeurer.de/images/2016/splay-insertnode-20161216.png)
][90]

This is the core of the splay tree construction, and despite what you might think looking at the full benchmark, this is more or less all that matters for the SplayLatency score. How come? Actually what the benchmark does is to construct huge splay trees, so that the majority of nodes survive, thus making it to old space. With a generational garbage collector like the one in V8 this is super expensive if a program violates the [generational hypothesis][91] leading to extreme pause times for essentially evacuating everything from new space to old space. Running V8 in the old configuration clearly shows this problem:

```
$ out/Release/d8 --trace-gc --noallocation_site_pretenuring octane-splay.js
[20872:0x7f26f24c70d0]       10 ms: Scavenge 2.7 (6.0) -> 2.7 (7.0) MB, 1.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       12 ms: Scavenge 2.7 (7.0) -> 2.7 (8.0) MB, 1.7 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       14 ms: Scavenge 3.7 (8.0) -> 3.6 (10.0) MB, 0.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       18 ms: Scavenge 4.8 (10.5) -> 4.7 (11.0) MB, 2.5 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       22 ms: Scavenge 5.7 (11.0) -> 5.6 (16.0) MB, 2.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       28 ms: Scavenge 8.7 (16.0) -> 8.6 (17.0) MB, 4.3 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       35 ms: Scavenge 9.6 (17.0) -> 9.6 (28.0) MB, 6.9 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       49 ms: Scavenge 16.6 (28.5) -> 16.4 (29.0) MB, 8.2 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       65 ms: Scavenge 17.5 (29.0) -> 17.5 (52.0) MB, 15.3 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]       93 ms: Scavenge 32.3 (52.5) -> 32.0 (53.5) MB, 17.6 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      126 ms: Scavenge 33.4 (53.5) -> 33.3 (68.0) MB, 31.5 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      151 ms: Scavenge 47.9 (68.0) -> 47.6 (69.5) MB, 15.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      183 ms: Scavenge 49.2 (69.5) -> 49.2 (84.0) MB, 30.9 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      210 ms: Scavenge 63.5 (84.0) -> 62.4 (85.0) MB, 14.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      241 ms: Scavenge 64.7 (85.0) -> 64.6 (99.0) MB, 28.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      268 ms: Scavenge 78.2 (99.0) -> 77.6 (101.0) MB, 16.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      298 ms: Scavenge 80.4 (101.0) -> 80.3 (114.5) MB, 28.2 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      324 ms: Scavenge 93.5 (114.5) -> 92.9 (117.0) MB, 16.4 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      354 ms: Scavenge 96.2 (117.0) -> 96.0 (130.0) MB, 27.6 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      383 ms: Scavenge 108.8 (130.0) -> 108.2 (133.0) MB, 16.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      413 ms: Scavenge 111.9 (133.0) -> 111.7 (145.5) MB, 27.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      440 ms: Scavenge 124.1 (145.5) -> 123.5 (149.0) MB, 17.4 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      473 ms: Scavenge 127.6 (149.0) -> 127.4 (161.0) MB, 29.5 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      502 ms: Scavenge 139.4 (161.0) -> 138.8 (165.0) MB, 18.7 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      534 ms: Scavenge 143.3 (165.0) -> 143.1 (176.5) MB, 28.5 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      561 ms: Scavenge 154.7 (176.5) -> 154.2 (181.0) MB, 19.0 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      594 ms: Scavenge 158.9 (181.0) -> 158.7 (192.0) MB, 29.2 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      622 ms: Scavenge 170.0 (192.5) -> 169.5 (197.0) MB, 19.5 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      655 ms: Scavenge 174.6 (197.0) -> 174.3 (208.0) MB, 28.7 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      683 ms: Scavenge 185.4 (208.0) -> 184.9 (212.5) MB, 19.4 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      715 ms: Scavenge 190.2 (213.0) -> 190.0 (223.5) MB, 27.7 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      743 ms: Scavenge 200.7 (223.5) -> 200.3 (228.5) MB, 19.7 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      774 ms: Scavenge 205.8 (228.5) -> 205.6 (239.0) MB, 27.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      802 ms: Scavenge 216.1 (239.0) -> 215.7 (244.5) MB, 19.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      833 ms: Scavenge 221.4 (244.5) -> 221.2 (254.5) MB, 26.2 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      861 ms: Scavenge 231.5 (255.0) -> 231.1 (260.5) MB, 19.9 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      892 ms: Scavenge 237.0 (260.5) -> 236.7 (270.5) MB, 26.3 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      920 ms: Scavenge 246.9 (270.5) -> 246.5 (276.0) MB, 20.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      951 ms: Scavenge 252.6 (276.0) -> 252.3 (286.0) MB, 25.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]      979 ms: Scavenge 262.3 (286.0) -> 261.9 (292.0) MB, 20.3 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1014 ms: Scavenge 268.2 (292.0) -> 267.9 (301.5) MB, 29.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1046 ms: Scavenge 277.7 (302.0) -> 277.3 (308.0) MB, 22.4 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1077 ms: Scavenge 283.8 (308.0) -> 283.5 (317.5) MB, 25.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1105 ms: Scavenge 293.1 (317.5) -> 292.7 (323.5) MB, 20.7 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1135 ms: Scavenge 299.3 (323.5) -> 299.0 (333.0) MB, 24.9 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1164 ms: Scavenge 308.6 (333.0) -> 308.1 (339.5) MB, 20.9 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1194 ms: Scavenge 314.9 (339.5) -> 314.6 (349.0) MB, 25.0 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1222 ms: Scavenge 324.0 (349.0) -> 323.6 (355.5) MB, 21.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1253 ms: Scavenge 330.4 (355.5) -> 330.1 (364.5) MB, 25.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1282 ms: Scavenge 339.4 (364.5) -> 339.0 (371.0) MB, 22.2 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1315 ms: Scavenge 346.0 (371.0) -> 345.6 (380.0) MB, 25.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1413 ms: Mark-sweep 349.9 (380.0) -> 54.2 (305.0) MB, 5.8 / 0.0 ms  (+ 87.5 ms in 73 steps since start of marking, biggest step 8.2 ms, walltime since start of marking 131 ms) finalize incremental marking via stack guard GC in old space requested
[20872:0x7f26f24c70d0]     1457 ms: Scavenge 65.8 (305.0) -> 65.1 (305.0) MB, 31.0 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1489 ms: Scavenge 69.9 (305.0) -> 69.7 (305.0) MB, 27.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1523 ms: Scavenge 80.9 (305.0) -> 80.4 (305.0) MB, 22.9 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1553 ms: Scavenge 85.5 (305.0) -> 85.3 (305.0) MB, 24.2 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1581 ms: Scavenge 96.3 (305.0) -> 95.7 (305.0) MB, 18.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1616 ms: Scavenge 101.1 (305.0) -> 100.9 (305.0) MB, 29.2 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1648 ms: Scavenge 111.6 (305.0) -> 111.1 (305.0) MB, 22.5 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1678 ms: Scavenge 116.7 (305.0) -> 116.5 (305.0) MB, 25.0 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1709 ms: Scavenge 127.0 (305.0) -> 126.5 (305.0) MB, 20.7 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1738 ms: Scavenge 132.3 (305.0) -> 132.1 (305.0) MB, 23.9 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1767 ms: Scavenge 142.4 (305.0) -> 141.9 (305.0) MB, 19.6 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1796 ms: Scavenge 147.9 (305.0) -> 147.7 (305.0) MB, 23.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1825 ms: Scavenge 157.8 (305.0) -> 157.3 (305.0) MB, 19.9 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1853 ms: Scavenge 163.5 (305.0) -> 163.2 (305.0) MB, 22.2 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1881 ms: Scavenge 173.2 (305.0) -> 172.7 (305.0) MB, 19.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1910 ms: Scavenge 179.1 (305.0) -> 178.8 (305.0) MB, 23.0 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1944 ms: Scavenge 188.6 (305.0) -> 188.1 (305.0) MB, 25.1 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     1979 ms: Scavenge 194.7 (305.0) -> 194.4 (305.0) MB, 28.4 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     2011 ms: Scavenge 204.0 (305.0) -> 203.6 (305.0) MB, 23.4 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     2041 ms: Scavenge 210.2 (305.0) -> 209.9 (305.0) MB, 23.8 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     2074 ms: Scavenge 219.4 (305.0) -> 219.0 (305.0) MB, 24.5 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     2105 ms: Scavenge 225.8 (305.0) -> 225.4 (305.0) MB, 24.7 / 0.0 ms  allocation failure
[20872:0x7f26f24c70d0]     2138 ms: Scavenge 234.8 (305.0) -> 234.4 (305.0) MB, 23.1 / 0.0 ms  allocation failure
[...SNIP...]
$
```

So the key observation here is that allocating the splay tree nodes in old space directly would avoid essentially all the overhead of copying objects around and reduce the number of minor GC cycles to the bare minimum (thereby reducing the pauses caused by the GC). So we came up with a mechanism called [_Allocation Site Pretenuring_][92] that would try to dynamically gather feedback at allocation sites when run in baseline code to decide whether a certain percent of the objects allocated here survives, and if so instrument the optimized code to allocate objects in old space directly - i.e. _pretenure the objects_.

```
$ out/Release/d8 --trace-gc octane-splay.js
[20885:0x7ff4d7c220a0]        8 ms: Scavenge 2.7 (6.0) -> 2.6 (7.0) MB, 1.2 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       10 ms: Scavenge 2.7 (7.0) -> 2.7 (8.0) MB, 1.6 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       11 ms: Scavenge 3.6 (8.0) -> 3.6 (10.0) MB, 0.9 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       17 ms: Scavenge 4.8 (10.5) -> 4.7 (11.0) MB, 2.9 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       20 ms: Scavenge 5.6 (11.0) -> 5.6 (16.0) MB, 2.8 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       26 ms: Scavenge 8.7 (16.0) -> 8.6 (17.0) MB, 4.5 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       34 ms: Scavenge 9.6 (17.0) -> 9.5 (28.0) MB, 6.8 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       48 ms: Scavenge 16.6 (28.5) -> 16.4 (29.0) MB, 8.6 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       64 ms: Scavenge 17.5 (29.0) -> 17.5 (52.0) MB, 15.2 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]       96 ms: Scavenge 32.3 (52.5) -> 32.0 (53.5) MB, 19.6 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]      153 ms: Scavenge 61.3 (81.5) -> 57.4 (93.5) MB, 27.9 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]      432 ms: Scavenge 339.3 (364.5) -> 326.6 (364.5) MB, 12.7 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]      666 ms: Scavenge 563.7 (592.5) -> 553.3 (595.5) MB, 20.5 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]      825 ms: Mark-sweep 603.9 (644.0) -> 96.0 (528.0) MB, 4.0 / 0.0 ms  (+ 92.5 ms in 51 steps since start of marking, biggest step 4.6 ms, walltime since start of marking 160 ms) finalize incremental marking via stack guard GC in old space requested
[20885:0x7ff4d7c220a0]     1068 ms: Scavenge 374.8 (528.0) -> 362.6 (528.0) MB, 19.1 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]     1304 ms: Mark-sweep 460.1 (528.0) -> 102.5 (444.5) MB, 10.3 / 0.0 ms  (+ 117.1 ms in 59 steps since start of marking, biggest step 7.3 ms, walltime since start of marking 200 ms) finalize incremental marking via stack guard GC in old space requested
[20885:0x7ff4d7c220a0]     1587 ms: Scavenge 374.2 (444.5) -> 361.6 (444.5) MB, 13.6 / 0.0 ms  allocation failure
[20885:0x7ff4d7c220a0]     1828 ms: Mark-sweep 485.2 (520.0) -> 101.5 (519.5) MB, 3.4 / 0.0 ms  (+ 102.8 ms in 58 steps since start of marking, biggest step 4.5 ms, walltime since start of marking 183 ms) finalize incremental marking via stack guard GC in old space requested
[20885:0x7ff4d7c220a0]     2028 ms: Scavenge 371.4 (519.5) -> 358.5 (519.5) MB, 12.1 / 0.0 ms  allocation failure
[...SNIP...]
$
```

And indeed that essentially fixed the problem for the SplayLatency benchmark completely and boosted our score by over 250%!

[
 ![SplayLatency benchmark](http://benediktmeurer.de/images/2016/awfy-splay-20161216.png)
][93]

As mentioned in the [SIGPLAN paper][94] we had good reasons to believe that allocation site pretenuring might be a win for real world applications, and were really looking forward to seeing improvements and extending the mechanism to cover more than just object and array literals. But it didn’t take [long][95] [to][96] [realize][97] that allocation site pretenuring can have a pretty serious negative impact on real world application performance. We actually got a lot of negative press, including a shit storm from Ember.js developers and users, not only because of allocation site pretenuring, but that was big part of the story.

The fundamental problem with allocation site pretenuring as we learned are factories, which are very common in applications today (mostly because of frameworks, but also for other reasons), and assuming that your object factory is initially used to create the long living objects that form your object model and the views, which transitions the allocation site in your factory method(s) to _tenured_ state, and everything allocated from the factory immediately goes to old space. Now after the initial setup is done, your application starts doing stuff, and as part of that, allocates temporary objects from the factory, that now start polluting old space, eventually leading to expensive major garbage collection cycles, and other negative side effects like triggering incremental marking way too early.

So we started to reconsider the benchmark driven effort and started looking for real world driven solutions instead, which resulted in an effort called [Orinoco][98] with the goal to incrementally improve the garbage collector; part of that effort is a project called _unified heap_, which will try to avoid copying objects if almost everything in a page survives. I.e. on a high level: If new space is full of live objects, just mark all new space pages as belonging to old space now, and create a fresh new space from empty pages. This might not yield the same score on the SplayLatency benchmark, but it’s a lot better for real world use cases and it automatically adapts to the concrete use case. We are also considering _concurrent marking_ to offload the marking work to a separate thread and thus further reducing the negative impact of incremental marking on both latency and throughput.

### Cuteness break!

 ![](https://pbs.twimg.com/profile_images/491838225300717568/sy5AWvt1.jpeg)

Breathe.

Ok, I think that should be sufficient to underline the point. I could go on pointing to even more examples where Octane driven improvements turned out to be a bad idea later, and maybe I’ll do that another day. But let’s stop right here for today…

### Conclusion

I hope it should be clear by now why benchmarks are generally a good idea, but are only useful to a certain level, and once you cross the line of _useful competition_, you’ll start wasting the time of your engineers or even start hurting your real world performance! If we are serious about performance for the web, we need to start judging browser by real world performance and not their ability to game four year old benchmarks. We need to start educating the (tech) press, or failing that, at least ignore them.

[
 ![Browser benchmark battle October 2016: Chrome vs. Firefox vs. Edge](http://benediktmeurer.de/images/2016/venturebeat-20161216.png)
][99]

Noone is afraid of competition, but gaming potentially broken benchmarks is not really useful investment of engineering time. We can do a lot more, and take JavaScript to the next level. Let’s work on meaningful performance tests that can drive competition on areas of interest for the end user and the developer. Additionally let’s also drive meaningful improvements for server and tooling side code running in Node.js (either on V8 or ChakraCore)!


 ![](http://benediktmeurer.de/images/2016/measure-20161216.jpg)


One closing comment: Don’t use traditional JavaScript benchmarks to compare phones. It’s really the most useless thing you can do, as the JavaScript performance often depends a lot on the software and not necessarily on the hardware, and Chrome ships a new version every six weeks, so whatever you measure in March maybe irrelevant already in April. And if there’s no way to avoid running something in a browser that assigns a number to a phone, then at least use a recent full browser benchmark that has at least something to do with what people will do with their browsers, i.e. consider [Speedometer benchmark][100].

Thank you!


--------------------------------------------------------------------------------

作者简介：

![](http://benediktmeurer.de/images/me.jpg)

I am Benedikt Meurer, a software engineer living in Ottobrunn, a municipality southeast of Munich, Bavaria, Germany. I received my diploma in applied computer science with electrical engineering from the Universität Siegen in 2007, and since then I have been working as a research associate at the Lehrstuhl für Compilerbau und Softwareanalyse (and the Lehrstuhl für Mikrosystementwurf in 2007/2008) for five years. In 2013 I joined Google to work on the V8 JavaScript Engine in the Munich office, where I am currently working as tech lead for the JavaScript execution optimization team.

--------------------------------------------------------------------------------

via: http://benediktmeurer.de/2016/12/16/the-truth-about-traditional-javascript-benchmarks

作者：[Benedikt Meurer][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://benediktmeurer.de/
[1]:https://www.youtube.com/watch?v=PvZdTZ1Nl5o
[2]:https://twitter.com/s3ththompson
[3]:https://youtu.be/xCx4uC7mn6Y
[4]:https://twitter.com/tverwaes
[5]:https://youtu.be/xCx4uC7mn6Y
[6]:https://twitter.com/tverwaes
[7]:https://arewefastyet.com/#machine=12&view=single&suite=ss&subtest=cube&start=1343350217&end=1415382608
[8]:https://www.engadget.com/2016/03/08/galaxy-s7-and-s7-edge-review/
[9]:https://arewefastyet.com/#machine=29&view=single&suite=octane&subtest=MandreelLatency&start=1415924086&end=1446461709
[10]:https://arewefastyet.com/#machine=12&view=single&suite=octane&subtest=SplayLatency&start=1384889558&end=1415405874
[11]:http://venturebeat.com/2016/10/25/browser-benchmark-battle-october-2016-chrome-vs-firefox-vs-edge/3
[12]:https://tc39.github.io/ecma262/#sec-toprimitive
[13]:https://tc39.github.io/ecma262/#sec-ordinarytoprimitive
[14]:https://tc39.github.io/ecma262/#sec-object.prototype.valueof
[15]:https://tc39.github.io/ecma262/#sec-object.prototype.toString
[16]:https://tc39.github.io/ecma262/#sec-symbol.tostringtag
[17]:https://tc39.github.io/ecma262/#sec-toprimitive
[18]:https://tc39.github.io/ecma262/#sec-ordinarytoprimitive
[19]:https://tc39.github.io/ecma262/#sec-object.prototype.valueof
[20]:https://tc39.github.io/ecma262/#sec-object.prototype.toString
[21]:https://tc39.github.io/ecma262/#sec-symbol.tostringtag
[22]:https://en.wikipedia.org/wiki/JavaScript
[23]:https://nodejs.org/
[24]:https://webkit.org/perf/sunspider/sunspider.html
[25]:http://krakenbenchmark.mozilla.org/
[26]:https://developers.google.com/octane
[27]:http://browserbench.org/JetStream
[28]:https://www.youtube.com/watch?v=PvZdTZ1Nl5o
[29]:http://asmjs.org/
[30]:https://github.com/kripken/emscripten
[31]:http://beta.unity3d.com/jonas/AngryBots
[32]:https://youtu.be/xCx4uC7mn6Y
[33]:http://youtube.com/
[34]:http://browserbench.org/Speedometer
[35]:http://browserbench.org/Speedometer
[36]:http://todomvc.com/
[37]:https://twitter.com/bmeurer/status/806927160300556288
[38]:https://youtu.be/xCx4uC7mn6Y
[39]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/tests/sunspider-1.0.2/bitops-bitwise-and.js
[40]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/tests/sunspider-1.0.2/bitops-bitwise-and.js
[41]:https://en.wikipedia.org/wiki/Loop_splitting
[42]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/tests/sunspider-1.0.2/bitops-bitwise-and.js
[43]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/tests/sunspider-1.0.2/string-tagcloud.js
[44]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/tests/sunspider-1.0.2/string-tagcloud.js#L199
[45]:https://tc39.github.io/ecma262/#sec-json.parse
[46]:https://tc39.github.io/ecma262/#sec-json.parse
[47]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/tests/sunspider-1.0.2/3d-cube.js
[48]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/tests/sunspider-1.0.2/3d-cube.js#L239
[49]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/tests/sunspider-1.0.2/3d-cube.js#L151
[50]:https://tc39.github.io/ecma262/#sec-math.sin
[51]:https://tc39.github.io/ecma262/#sec-math.cos
[52]:https://arewefastyet.com/#machine=12&view=single&suite=ss&subtest=cube&start=1343350217&end=1415382608
[53]:https://docs.google.com/document/d/1VoYBhpDhJC4VlqMXCKvae-8IGuheBGxy32EOgC2LnT8
[54]:https://github.com/WebKit/webkit/blob/master/PerformanceTests/SunSpider/resources/driver-TEMPLATE.html#L70
[55]:https://www.engadget.com/2016/03/08/galaxy-s7-and-s7-edge-review/
[56]:http://browserbench.org/Speedometer
[57]:https://twitter.com/thealphanerd
[58]:https://blog.mozilla.org/blog/2010/09/14/release-the-kraken-2
[59]:https://github.com/h4writer/arewefastyet/blob/master/benchmarks/kraken/tests/kraken-1.1/audio-oscillator.js
[60]:https://github.com/h4writer/arewefastyet/blob/master/benchmarks/kraken/tests/kraken-1.1/audio-oscillator.js
[61]:https://github.com/h4writer/arewefastyet/blob/master/benchmarks/kraken/tests/kraken-1.1/audio-oscillator-data.js#L687
[62]:https://tc39.github.io/ecma262/#sec-math.round
[63]:https://github.com/h4writer/arewefastyet/blob/master/benchmarks/kraken/tests/kraken-1.1/audio-oscillator-data.js#L566
[64]:https://graphics.stanford.edu/~seander/bithacks.html#ModulusDivisionEasy
[65]:https://docs.google.com/presentation/d/1wZVIqJMODGFYggueQySdiA3tUYuHNMcyp_PndgXsO1Y
[66]:https://developers.google.com/octane
[67]:https://blog.chromium.org/2012/08/octane-javascript-benchmark-suite-for.html
[68]:https://blog.chromium.org/2013/11/announcing-octane-20.html
[69]:http://www.typescriptlang.org/
[70]:http://asmjs.org/
[71]:https://developers.google.com/octane/benchmark
[72]:https://github.com/kripken/emscripten
[73]:http://emberjs.com/
[74]:https://angularjs.org/
[75]:https://github.com/hecht-software/box2dweb
[76]:https://github.com/v8/v8/blob/5124589642ba12228dcd66a8cb8c84c986a13f35/src/runtime/runtime-object.cc#L884
[77]:https://tc39.github.io/ecma262/#sec-abstract-relational-comparison
[78]:https://github.com/v8/v8/blob/5124589642ba12228dcd66a8cb8c84c986a13f35/src/x64/code-stubs-x64.cc#L2495
[79]:https://tc39.github.io/ecma262/#sec-abstract-relational-comparison
[80]:https://codereview.chromium.org/1355113002
[81]:http://asmjs.org/
[82]:https://github.com/kripken/emscripten
[83]:http://bulletphysics.org/wordpress/
[84]:http://www.mandreel.com/
[85]:https://bugzilla.mozilla.org/show_bug.cgi?id=1162272
[86]:https://docs.google.com/presentation/d/1214p4CFjsF-NY4z9in0GEcJtjbyVQgU0A-UqEvovzCs
[87]:https://codereview.chromium.org/1102523003
[88]:https://arewefastyet.com/#machine=29&view=single&suite=octane&subtest=MandreelLatency&start=1415924086&end=1446461709
[89]:https://github.com/chromium/octane/blob/master/splay.js
[90]:https://github.com/chromium/octane/blob/master/splay.js#L85
[91]:http://www.memorymanagement.org/glossary/g.html
[92]:https://research.google.com/pubs/pub43823.html
[93]:https://arewefastyet.com/#machine=12&view=single&suite=octane&subtest=SplayLatency&start=1384889558&end=1415405874
[94]:https://research.google.com/pubs/pub43823.html
[95]:https://bugs.chromium.org/p/v8/issues/detail?id=2935
[96]:https://bugs.chromium.org/p/chromium/issues/detail?id=367694
[97]:https://bugs.chromium.org/p/v8/issues/detail?id=3665
[98]:http://v8project.blogspot.de/2016/04/jank-busters-part-two-orinoco.html
[99]:http://venturebeat.com/2016/10/25/browser-benchmark-battle-october-2016-chrome-vs-firefox-vs-edge/3/
[100]:http://browserbench.org/Speedometer
