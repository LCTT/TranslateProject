How Graphics Cards Work
======
![AMD-Polaris][1]

Ever since 3dfx debuted the original Voodoo accelerator, no single piece of equipment in a PC has had as much of an impact on whether your machine could game as the humble graphics card. While other components absolutely matter, a top-end PC with 32GB of RAM, a $500 CPU, and PCIe-based storage will choke and die if asked to run modern AAA titles on a ten year-old card at modern resolutions and detail levels. Graphics cards (also commonly referred to as GPUs, or graphics processing units) are critical to game performance and we cover them extensively. But we don’t often dive into what makes a GPU tick and how the cards function.

By necessity, this will be a high-level overview of GPU functionality and cover information common to AMD, Nvidia, and Intel’s integrated GPUs, as well as any discrete cards Intel might build in the future. It should also be common to the mobile GPUs built by Apple, Imagination Technologies, Qualcomm, ARM, and other vendors.

### Why Don’t We Run Rendering With CPUs?

The first point I want to address is why we don’t use CPUs for rendering workloads in gaming in the first place. The honest answer to this question is that you can run rendering workloads directly on a CPU, at least in theory. Early 3D games that predate the widespread availability of graphics cards, like Ultima Underworld, ran entirely on the CPU. UU is a useful reference case for multiple reasons — it had a more advanced rendering engine than games like Doom, with full support for looking up and down, as well as then-advanced features like texture mapping. But this kind of support came at a heavy price — many people lacked a PC that could actually run the game.

![](https://www.extremetech.com/wp-content/uploads/2018/05/UU.jpg)

In the early days of 3D gaming, many titles like Half Life and Quake II featured a software renderer to allow players without 3D accelerators to play the title. But the reason we dropped this option from modern titles is simple: CPUs are designed to be general-purpose microprocessors, which is another way of saying they lack the specialized hardware and capabilities that GPUs offer. A modern CPU could easily handle titles that tended to stutter when run in software 18 years ago, but no CPU on Earth could easily handle a modern AAA game from today if run in that mode. Not, at least, without some drastic changes to the scene, resolution, and various visual effects.

### What’s a GPU?

A GPU is a device with a set of specific hardware capabilities that are intended to map well to the way that various 3D engines execute their code, including geometry setup and execution, texture mapping, memory access, and shaders. There’s a relationship between the way 3D engines function and the way GPU designers build hardware. Some of you may remember that AMD’s HD 5000 family used a VLIW5 architecture, while certain high-end GPUs in the HD 6000 family used a VLIW4 architecture. With GCN, AMD changed its approach to parallelism, in the name of extracting more useful performance per clock cycle.

![](https://www.extremetech.com/wp-content/uploads/2018/05/GPU-Evolution.jpg)

Nvidia first coined the term “GPU” with the launch of the original GeForce 256 and its support for performing hardware transform and lighting calculations on the GPU (this corresponded, roughly to the launch of Microsoft’s DirectX 7). Integrating specialized capabilities directly into hardware was a hallmark of early GPU technology. Many of those specialized technologies are still employed (in very different forms), because it’s more power efficient and faster to have dedicated resources on-chip for handling specific types of workloads than it is to attempt to handle all of the work in a single array of programmable cores.

There are a number of differences between GPU and CPU cores, but at a high level, you can think about them like this. CPUs are typically designed to execute single-threaded code as quickly and efficiently as possible. Features like SMT / Hyper-Threading improve on this, but we scale multi-threaded performance by stacking more high-efficiency single-threaded cores side-by-side. AMD’s 32-core / 64-thread Epyc CPUs are the largest you can buy today. To put that in perspective, the lowest-end Pascal GPU from Nvidia has 384 cores. A “core” in GPU parlance refers to a much smaller unit of processing capability than in a typical CPU.

**Note:** You cannot compare or estimate relative gaming performance between AMD and Nvidia simply by comparing the number of GPU cores. Within the same GPU family (for example, Nvidia’s GeForce GTX 10 series, or AMD’s RX 4xx or 5xx family), a higher GPU core count means that GPU is more powerful than a lower-end card.

The reason you can’t draw immediate conclusions on GPU performance between manufacturers or core families based solely on core counts is because different architectures are more and less efficient. Unlike CPUs, GPUs are designed to work in parallel. Both AMD and Nvidia structure their cards into blocks of computing resources. Nvidia calls these blocks an SM (Streaming Multiprocessor), while AMD refers to them as a Compute Unit.

![](https://www.extremetech.com/wp-content/uploads/2018/05/PascalSM.png)

Each block contains a group of cores, a scheduler, a register file, instruction cache, texture and L1 cache, and texture mapping units. The SM / CU can be thought of as the smallest functional block of the GPU. It doesn’t contain literally everything — video decode engines, render outputs required for actually drawing an image on-screen, and the memory interfaces used to communicate with onboard VRAM are all outside its purview — but when AMD refers to an APU as having 8 or 11 Vega Compute Units, this is the (equivalent) block of silicon they’re talking about. And if you look at a block diagram of a GPU, any GPU, you’ll notice that it’s the SM/CU that’s duplicated a dozen or more times in the image.

![](https://www.extremetech.com/wp-content/uploads/2016/11/Pascal-Diagram.jpg)

The higher the number of SM/CU units in a GPU, the more work it can perform in parallel per clock cycle. Rendering is a type of problem that’s sometimes referred to as “embarrassingly parallel,” meaning it has the potential to scale upwards extremely well as core counts increase.

When we discuss GPU designs, we often use a format that looks something like this: 4096:160:64. The GPU core count is the first number. The larger it is, the faster the GPU, provided we’re comparing within the same family (GTX 970 versus GTX 980 versus GTX 980 Ti, RX 560 versus RX 580, and so on).

### Texture Mapping and Render Outputs

There are two other major components of a GPU: texture mapping units and render outputs. The number of texture mapping units in a design dictates its maximum texel output and how quickly it can address and map textures on to objects. Early 3D games used very little texturing, because the job of drawing 3D polygonal shapes was difficult enough. Textures aren’t actually required for 3D gaming, though the list of games that don’t use them in the modern age is extremely small.

The number of texture mapping units in a GPU is signified by the second figure in the 4096:160:64 metric. AMD, Nvidia, and Intel typically shift these numbers equivalently as they scale a GPU family up and down. In other words, you won’t really find a scenario where one GPU has a 4096:160:64 configuration while a GPU above or below it in the stack is a 4096:320:64 configuration. Texture mapping can absolutely be a bottleneck in games, but the next-highest GPU in the product stack will typically offer at least more GPU cores and texture mapping units (whether higher-end cards have more ROPs depends on the GPU family and the card configuration).

Render outputs (also sometimes called raster operations pipelines) are where the GPU’s output is assembled into an image for display on a monitor or television. The number of render outputs multiplied by the clock speed of the GPU controls the pixel fill rate. A higher number of ROPs means that more pixels can be output simultaneously. ROPs also handle antialiasing, and enabling AA — especially supersampled AA — can result in a game that’s fill-rate limited.

### Memory Bandwidth, Memory Capacity

The last components we’ll discuss are memory bandwidth and memory capacity. Memory bandwidth refers to how much data can be copied to and from the GPU’s dedicated VRAM buffer per second. Many advanced visual effects (and higher resolutions more generally) require more memory bandwidth to run at reasonable frame rates because they increase the total amount of data being copied into and out of the GPU core.

In some cases, a lack of memory bandwidth can be a substantial bottleneck for a GPU. AMD’s APUs like the Ryzen 5 2400G are heavily bandwidth-limited, which means increasing your DDR4 clock rate can have a substantial impact on overall performance. The choice of game engine can also have a substantial impact on how much memory bandwidth a GPU needs to avoid this problem, as can a game’s target resolution.

The total amount of on-board memory is another critical factor in GPUs. If the amount of VRAM needed to run at a given detail level or resolution exceeds available resources, the game will often still run, but it’ll have to use the CPU’s main memory for storing additional texture data — and it takes the GPU vastly longer to pull data out of DRAM as opposed to its onboard pool of dedicated VRAM. This leads to massive stuttering as the game staggers between pulling data from a quick pool of local memory and general system RAM.

One thing to be aware of is that GPU manufacturers will sometimes equip a low-end or midrange card with more VRAM than is otherwise standard as a way to charge a bit more for the product. We can’t make an absolute prediction as to whether this makes the GPU more attractive because honestly, the results vary depending on the GPU in question. What we can tell you is that in many cases, it isn’t worth paying more for a card if the only difference is a larger RAM buffer. As a rule of thumb, lower-end GPUs tend to run into other bottlenecks before they’re choked by limited available memory. When in doubt, check reviews of the card and look for comparisons of whether a 2GB version is outperformed by the 4GB flavor or whatever the relevant amount of RAM would be. More often than not, assuming all else is equal between the two solutions, you’ll find the higher RAM loadout not worth paying for.

Check out our [ExtremeTech Explains][2] series for more in-depth coverage of today’s hottest tech topics.

--------------------------------------------------------------------------------

via: https://www.extremetech.com/gaming/269335-how-graphics-cards-work

作者：[Joel Hruska][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.extremetech.com/author/jhruska
[1]:https://www.extremetech.com/wp-content/uploads/2016/07/AMD-Polaris-640x353.jpg
[2]:http://www.extremetech.com/tag/extremetech-explains
