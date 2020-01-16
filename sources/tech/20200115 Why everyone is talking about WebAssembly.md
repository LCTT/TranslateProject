[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why everyone is talking about WebAssembly)
[#]: via: (https://opensource.com/article/20/1/webassembly)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

Why everyone is talking about WebAssembly
======
Learn more about the newest way to run any code in a web browser.
![Digital creative of a browser on the internet][1]

If you haven’t heard of [WebAssembly][2] yet, then you will soon. It’s one of the industry’s best-kept secrets, but it’s everywhere. It’s supported by all the major browsers, and it’s coming to the server-side, too. It’s fast. It’s being used for gaming. It’s an open World Wide Web Consortium (W3C), the main international standards organization for the web, standard. It’s platform-neutral and can run on Linux, Macs, and Windows.

"Wow," you may be saying, "this sounds like something I should learn to code in!" You’d be right, but you’d be wrong too; you don’t code in WebAssembly. Let’s take some time to learn about the technology that’s often fondly abbreviated to "Wasm."

### Where did it come from?

Going back about ten years, there was a growing recognition that the widely-used JavaScript wasn’t fast enough for many purposes. JavaScript was undoubtedly successful and convenient. It ran in any browser and enabled the type of dynamic web pages that we take for granted today. But it was a high-level language and wasn’t designed with compute-intensive workloads in mind.

However, although engineers responsible for the leading web browsers were generally in agreement about the performance problem, they weren’t aligned on what to do about it. Two camps emerged. Google began its Native Client project and, later, its Portable Native Client variation, to focus on allowing games and other software written in C/C++ to run in a secure compartment within Chrome. Mozilla, meanwhile, won the backing of Microsoft for asm.js, an approach that updated the browser so it can run a low-level subset of JavaScript instructions very quickly (another project enabled the conversion of C/C++ code into these instructions).

With neither camp gaining widespread adoption, the various parties agreed to join forces in 2015 around a new standard called WebAssembly that built on the basic approach taken by asm.js. [As CNET’s Stephen Shankland wrote at the time][3], "On today’s Web, the browser’s JavaScript translates those instructions into machine code. But with WebAssembly, the programmer does a lot of the work earlier in the process, producing a program that’s in between the two states. That frees the browser from a lot of the hard work of creating the machine code, but it also fulfills the promise of the Web—that software will run on any device with a browser regardless of the underlying hardware details."

In 2017, Mozilla declared it to be a minimum viable product and brought it out of preview. All the main browsers had adopted it by the end of that year. [In December 2019][4], the WebAssembly Working Group published the three WebAssembly specifications as W3C recommendations.

WebAssembly defines a portable binary code format for executable programs, a corresponding textual assembly language, and interfaces for facilitating interactions between such programs and their host environment. WebAssembly code runs within a low-level virtual machine that mimics the functionality of the many microprocessors upon which it can be run. Either through Just-In-Time (JIT) compilation or interpretation, the WebAssembly engine can perform at nearly the speed of code compiled for a native platform.

### Why the interest now?

Certainly, some of the recent interest in WebAssembly stems from that initial desire to run more compute-intensive code in browsers. Laptop users, in particular, are spending more and more of their time in a browser (or, in the case of Chromebooks, essentially all their time). This trend has created an urgency around removing barriers to running a broad range of applications within a browser. And one of those barriers is often some aspect of performance, which is what WebAssembly and its predecessors were originally conceived to address.

However, WebAssembly isn’t just for browsers. In 2019, [Mozilla announced a project called WASI][5] (WebAssembly System Interface) to standardize how WebAssembly code interacts with operating systems outside of a browser context. With the combination of browser support for WebAssembly and WASI, compiled binaries will be able to run both within and without browsers, across different devices and operating systems, at near-native speeds.

WebAssembly’s low overhead immediately makes it practical for use beyond browsers, but that’s arguably table stakes; there are obviously other ways to run applications that don’t introduce performance bottlenecks. Why use WebAssembly, specifically?

One important reason is its portability. Widely used compiled languages like C++ and Rust are probably the ones most associated with WebAssembly today. However, [a wide range of other languages][6] compile to or have their virtual machines in WebAssembly. Furthermore, while WebAssembly [assumes certain prerequisites][7] for its execution environments, it is designed to execute efficiently on a variety of operating systems and instruction set architectures. WebAssembly code can, therefore, be written using a wide range of languages and run on a wide range of operating systems and processor types.

Another WebAssembly advantage stems from the fact that code runs within a virtual machine. As a result, each WebAssembly module executes within a sandboxed environment, separated from the host runtime using fault isolation techniques. This implies, among other things, that applications execute in isolation from the rest of their host environment and can’t escape the sandbox without going through appropriate APIs.

### WebAssembly in action

What does all this mean in practice?

One example of WebAssembly in action is [Enarx][8].

Enarx is a project that provides hardware independence for securing applications using Trusted Execution Environments (TEE). Enarx lets you securely deliver an application compiled into WebAssembly all the way into a cloud provider and execute it remotely. As Red Hat security engineer [Nathaniel McCallum puts it][9], "The way that we do this is, we take your application as inputs, and we perform an attestation process with the remote hardware. We validate that the remote hardware is, in fact, the hardware that it claims to be, using cryptographic techniques. The end result of that is not only an increased level of trust in the hardware that we’re speaking to; it’s also a session key, which we can then use to deliver encrypted code and data into this environment that we have just asked for cryptographic attestation on."

Another example is OPA, the Open Policy Agent, which [announced][10] in November 2019 that you could [compile][11] their policy definition language, Rego, into WebAssembly. Rego lets you write logic to search and combine JSON/YAML data from different sources to ask questions like, "Is this API allowed?"

OPA has been used to policy-enable software including, but not limited to, Kubernetes. Simplifying policy using tools like OPA [is considered an important step][12] for properly securing Kubernetes deployments across a variety of different environments. WebAssembly’s portability and built-in security features are a good match for these tools.

Our last example is [Unity][13]. Remember, we mentioned at the beginning of the article that WebAssembly is used for gaming? Well, Unity, the cross-platform game engine, was an early adopter of WebAssembly, providing the first demo of Wasm running in browsers, and, since August 2018, [has used WebAssembly][14] as the output target for the Unity WebGL build target.

These are just a few of the ways WebAssembly has already begun to make an impact. Find out more and keep up to date with all things Wasm at <https://webassembly.org/>

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/webassembly

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://opensource.com/article/19/8/webassembly-speed-code-reuse
[3]: https://www.cnet.com/news/the-secret-alliance-that-could-give-the-web-a-massive-speed-boost/
[4]: https://www.w3.org/blog/news/archives/8123
[5]: https://hacks.mozilla.org/2019/03/standardizing-wasi-a-webassembly-system-interface/
[6]: https://github.com/appcypher/awesome-wasm-langs
[7]: https://webassembly.org/docs/portability/
[8]: https://enarx.io
[9]: https://enterprisersproject.com/article/2019/9/application-security-4-facts-confidential-computing-consortium
[10]: https://blog.openpolicyagent.org/tagged/webassembly
[11]: https://github.com/open-policy-agent/opa/tree/master/wasm
[12]: https://enterprisersproject.com/article/2019/11/kubernetes-reality-check-3-takeaways-kubecon
[13]: https://opensource.com/article/20/1/www.unity.com
[14]: https://blogs.unity3d.com/2018/08/15/webassembly-is-here/
