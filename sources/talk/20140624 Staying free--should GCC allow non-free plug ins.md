CNprober translating..

Staying free – should GCC allow non-free plug ins?
================================================================================
> Arguments in favour of the use of non-free plug-ins in GCC have again been raised on GCC mailing-lists, but are trumped by the arguments for GCC as a vehicle for free software development

Once again, Gcc and its lack of modularity has been raised as an issue and contrasted with LLVm, the new compiler on the block. GCC is huge and venerable: 5 million lines, 30 years, and growing. LLVM, in contrast, is relatively youthful and modular and allows free and proprietary languages to be added as modules.

The core of LLVM is ‘open source’. GCC is copyleft and unreservedly free software and doesn’t allow plug-ins or other means to add proprietary extensions to the GCC code. The argument, as delivered by Eric Raymond, is that “FSF can no longer prevent proprietary vendors from plugging into a free compiler to improve their tools. That horse has left the barn; the strategic goal of the anti-plug-in policy has been definitively busted.”

LLVM has been sponsored by Apple as a replacement for GCC on OS X and Apple hardware and has grown in popularity, especially among users of the BSDs. Advocates of LLVM see it as a putative replacement for GCC in the wider market for applications developers and mobile devices. The argument against GCC is that its complexity, and the commitment of its developers to copyleft licensing, constrains the possibilities for proprietary developers, who do not want to release their language or architectural specifications under a copyleft licence. Apple, of course, has a long history of antipathy to free software, and doesn’t allow applications licensed under copyleft licences to be distributed through its App Store.

To this extent, the argument between LLVM and GCC is a retread of the historic differences between GNU/Linux and the BSDs, between ‘open source’ and free software. Open source developers allow the code to be reused in any context, free or proprietary. Free software is restrictive in that it insists that the code, and any modifications to the code, must remain free in perpetuity. Advocates of free software would argue that the integrity of copyleft licensing has been instrumental in the spread of GCC, and has taken Linux and free software into places it would not otherwise have reached, and that free software cannot be bought or corrupted by commercial or corporate interests. Open source advocates argue that open source is more free because the user has no restrictions and can do what he or she likes, including developing closed source versions of the code.

Since the beginning, the GNU Compiler Collection (GCC) was vital to the spread of free software. Compilers were a rare and expensive commodity and the compilers of the proprietary software companies were rife with ‘features’ that were non-compliant with ANSI programming standards. Porting software between different machines and operating systems was an unnecessarily complicated task. GCC, the first truly free cross-platform compiler, commoditised this process.

GCC was a breakthrough product for applications developers and mobile device developers – not just those who were committed to the idea of free software. Not only was GCC free and portable, its ubiquity and commonality across different architectures made it easier to port software between machines and to expect robust and consistent results – as the likes of John Gilmore, Michael Tiemann and David Henkel- Wallace were to discover when they made GCC and its development the key selling point of Cygnus Solutions, the first company to make money by selling free software.

The primary technical difference between LLVM and GCC emerges in the separation between the modules that form the ‘front ends’, ‘middle end’ and ‘back ends’ of both GCC and LLVM. ‘Front ends’ are used to interpret the code specific to the translation of a particular language. The ‘middle end’ optimises the translated code. The ‘back ends’ take the optimised code and apply the results to a specific target architecture. LLVM separates these modules into distinct entities, but for semantic and historical reasons, GCC obfuscates the separation between the modules.

Perhaps untypically for a free software project, it is a difficult process to add a new language or architecture to GCC and the adding of proprietary plug-ins is not allowed. There is little clear separation between the modules, and the path of least resistance is to add any feature under a free software licence. The early ports of C++ and Objective C (via Apple) are cited as examples where the original developers might have preferred to keep the code in-house and proprietary, and instead released the code as free software.

In contrast, LLVM has allowed, or perhaps even encouraged, the addition and development of proprietary languages and architectures – one example being Nvidia’s NVCC for GPU computing, based on Clang and LLVM. The source code of NVCC is inaccessible to free software or ‘open source’ developers.

Richard Stallman’s [take on this][1] is characteristically resolute: “In the free software movement, we campaign for the freedom of the users of computing. The values of free software are fundamentally different from the values of open source, which make‘bettercode’theultimategoal. IfGCCwere to change from a free compiler into a platform for non-free compilers, it would no longer serve the goal of freedom very well.

“The Clang and LLVM developers reach different conclusions from ours because they do not share our values and goals. They object to the measures we have taken to defend freedom because they see the inconvenience of them and do not recognise (or don’t care about) the need for them. I would guess they describe their work as ‘open source’ and do not talk about freedom.”

The GCC developers are unlikely to compromise on the licensing terms. While LLVM is fashionable among certain sectors of industry, because it is young and new and has been quicker to jump on developing trands in programming languages, the prevailing wind is towards greater openness, and GCC’s resolve to be incorruptible and free from commercial interests, may be the greater asset in the long term. The Unix companies learnt something from the Unix wars of the Eighties and Nineties. Languages and operating systems are tools, and are better open and shared. GCC is free software and belongs to nobody.

--------------------------------------------------------------------------------

via: http://www.linuxuser.co.uk/features/staying-free-should-gcc-allow-non-free-plug-ins

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://lwn.net/articles/582241