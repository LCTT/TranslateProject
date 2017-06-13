通过 SYCL 在 GPU 上加速 C++
============================================================

在机器学习、计算机视觉以及高性能计算领域，充分利用显卡计算应用程序的能力已成为当前的热门。类似 OpenCL 的技术通过硬件无关的编程模型展现了这种能力，使得你可以编写抽象于不同体系架构的代码。它的目标是“一次编写，到处运行”，不管它是 Intel CPU、AMD 独立显卡还是 DSP 等等。不幸的是，对于日常程序员，OpenCL 的学习曲线陡峭；一个简单的 Hello World 程序可能就需要上百行晦涩难懂的代码。因此，为了减轻这种痛苦，Khronos 组织已经开发了一个称为 [SYCL][4] 的新标准，这是一个在 OpenCL 之上的 C++ 抽象层。通过 SYCL，你可以使用干净、现代的 C++ 开发出这些通用 GPU（GPGPU）应用程序，而无需拘泥于 OpenCL。下面是一个使用 SYCL 开发，通过并行 STL 实现的向量乘法事例：

```
#include <vector>
#include <iostream>

#include <sycl/execution_policy>
#include <experimental/algorithm>
#include <sycl/helpers/sycl_buffers.hpp>

using namespace std::experimental::parallel;
using namespace sycl::helpers;

int main() {
  constexpr size_t array_size = 1024*512;
  std::array<cl::sycl::cl_int, array_size> a;
  std::iota(begin(a),end(a),0);

  {
    cl::sycl::buffer<int> b(a.data(), cl::sycl::range<1>(a.size()));
    cl::sycl::queue q;
    sycl::sycl_execution_policy<class Mul> sycl_policy(q);
    transform(sycl_policy, begin(b), end(b), begin(b),
              [](int x) { return x*2; });
  }
}
```

为了作为对比，下面是一个通过 C++ API 使用 OpenCL 编写的大概对应版本（无需花过多时间阅读，只需注意到它看起来难看而且冗长）。

```
#include <iostream>
#include <array>
#include <numeric>
#include <CL/cl.hpp>

int main(){
    std::vector<cl::Platform> all_platforms;
    cl::Platform::get(&all_platforms);
    if(all_platforms.size()==0){
        std::cout<<" No platforms found. Check OpenCL installation!\n";
        exit(1);
    }
    cl::Platform default_platform=all_platforms[0];

    std::vector<cl::Device> all_devices;
    default_platform.getDevices(CL_DEVICE_TYPE_ALL, &all_devices);
    if(all_devices.size()==0){
        std::cout<<" No devices found. Check OpenCL installation!\n";
        exit(1);
    }

    cl::Device default_device=all_devices[0];
    cl::Context context({default_device});

    cl::Program::Sources sources;
    std::string kernel_code=
        "   void kernel mul2(global int* A){"
        "       A[get_global_id(0)]=A[get_global_id(0)]*2;"
        "   }";
    sources.push_back({kernel_code.c_str(),kernel_code.length()});

    cl::Program program(context,sources);
    if(program.build({default_device})!=CL_SUCCESS){
        std::cout<<" Error building: "<<program.getBuildInfo<CL_PROGRAM_BUILD_LOG>(default_device)<<"\n";
        exit(1);
    }

    constexpr size_t array_size = 1024*512;
    std::array<cl_int, array_size> a;
    std::iota(begin(a),end(a),0);

    cl::Buffer buffer_A(context,CL_MEM_READ_WRITE,sizeof(int)*a.size());
    cl::CommandQueue queue(context,default_device);

    if (queue.enqueueWriteBuffer(buffer_A,CL_TRUE,0,sizeof(int)*a.size(),a.data()) != CL_SUCCESS) {
        std::cout << "Failed to write memory;n";
        exit(1);
    }

    cl::Kernel kernel_add = cl::Kernel(program,"mul2");
    kernel_add.setArg(0,buffer_A);

    if (queue.enqueueNDRangeKernel(kernel_add,cl::NullRange,cl::NDRange(a.size()),cl::NullRange) != CL_SUCCESS) {
        std::cout << "Failed to enqueue kernel\n";
        exit(1);
    }

    if (queue.finish() != CL_SUCCESS) {
        std::cout << "Failed to finish kernel\n";
        exit(1);
    }

    if (queue.enqueueReadBuffer(buffer_A,CL_TRUE,0,sizeof(int)*a.size(),a.data()) != CL_SUCCESS) {
        std::cout << "Failed to read result\n";
        exit(1);
    }
}
```

在这篇博文中我会介绍使用 SYCL 加速你 GPU 上的 C++ 代码。

### GPGPU 简介

在我开始介绍如何使用 SYCL 之前，我首先给那些不熟悉这方面的人简要介绍一下为什么你可能想要在 GPU 上运行计算任务。如果已经使用过 OpenCL、CUDA 或类似的库，可以跳过这一节。 

GPU 和 CPU 的一个关键不同就是 GPU 有大量小的、简单的处理单元，而不是少量（对于普通消费者桌面硬件通常是 1-8 个）复杂而强大的核。

![CPU 架构](https://blog.tartanllama.xyz/assets/cpu.png)

上面是一个 4 核 CPU 的简单漫画示意图。每个核都有一组寄存器以及不同等级的缓存（有些是共享缓存、有些不是），然后是主内存。

![GPU 架构](https://blog.tartanllama.xyz/assets/gpu.png)

在 GPU 上，多个小处理单元被组成一个执行单元。每个小处理单元都附有少量内存，每个执行单元都有一些共享内存用于它的处理单元。除此之外，还有一些 GPU 范围的内存，然后是 CPU 使用的主内存。执行单元内部的单元是 _lockstep_ ，每个单元都在不同的数据片上执行相同的指令。

这可以使 GPU 同时处理大量的数据。如果是在 CPU 上，也许你可以使用多线程和向量指令在给定时间内完成大量的工作，但是 GPU 所能处理的远多于此。在 GPU 上一次性能够处理的数据规模使得它非常适合于类似图形（duh）、数学处理、神经网络等等。

GPGPU 编程的很多方面使得它和日常的 CPU 编程完全不同。例如，从主内存传输数据到 GPU 是_很慢的_。_真的_很慢。会完全干掉你的性能使你慢下来。因此，GPU 编程的权衡是尽可能多地利用加速器的高吞吐量来掩盖数据来往的延迟。

这里还有一些不那么明显的问题，例如分支的开销。由于执行单元内的处理单元按照 lockstep 工作，使它们执行不同路径（不同的控制流）的嵌套分支就是个真正的问题。这通常通过在所有单元上执行所有分支并标记出无用结果来解决。这是一个基于嵌套级别的指数级的复杂度，这当然是坏事情。当然，有一些优化方法可以拯救该问题，但需要注意：你从 CPU 领域带来的简单假设和知识在 GPU 领域可能导致大问题。

在我们回到 SYCL 之前，需要介绍一些术语。主机（host）是主 CPU 运行的机器，设备（device）是会运行你 OpenCL 代码的地方。设备可能就是主机，但也可能是你机器上的一些加速器、模拟器等。内核（kernel）是一个特殊函数，它是在你设备上运行代码的入口点。通常还会提供一些主机设置好的缓存给它用于输入和输出数据。

### 回到 SYCL

这里有两个可用的 SYCL 实现：[triSYCL](https://github.com/Xilinx/triSYCL)，由 Xilinx 开发的实验性开源版本（通常作为标准的试验台使用），以及 [ComputeCpp](https://www.codeplay.com/products/computesuite/computecpp)，由 Codeplay（我在 Codeplay 工作，但这篇文章是在没有我雇主建议的情况下使用我自己时间编写的） 开发的工业级实现（当前处于开发测试版）。只有 ComputeCpp 支持在 GPU 上执行内核，因此在这篇文章中我们会使用它。

第一步是在你的机器上配置以及运行 ComputeCpp。主要组件是一个实现了 SYCL API 的运行时库，以及一个基于 Clang 的编译器，它负责编译你的主机代码和设备代码。在本文写作时，已经在 Ubuntu 和 CentOS 上官方支持 Intel CPU 以及某些 AMD GPU。在其它 Linux 发行版上让它工作也非常简单（例如，我让它在我的 Arch 系统上运行）。对更多的硬件和操作系统的支持正在进行中，查看[支持平台文档][5]获取最新列表。[这里][6]列出了依赖和组件。你也可能想要下载 [SDK][7]，其中包括了示例、文档、构建系统集成文件，以及其它。在这篇文章中我会使用 [SYCL 并行 STL][8]，如果你想要自己在家学习的话也要下载它。

一旦你设置好了一切，我们就可以开始通用 GPU 编程了！正如简介中提到的，我的第一个示例使用 SYCL 并行 STL 实现。我们现在来看看如何使用纯 SYCL 编写代码。

```
#include <CL/sycl.hpp>

#include <array>
#include <numeric>
#include <iostream>

int main() {
      const size_t array_size = 1024*512;
      std::array<cl::sycl::cl_int, array_size> in,out;
      std::iota(begin(in),end(in),0);

      {
          cl::sycl::queue device_queue;
          cl::sycl::range<1> n_items{array_size};
          cl::sycl::buffer<cl::sycl::cl_int, 1> in_buffer(in.data(), n_items);
          cl::sycl::buffer<cl::sycl::cl_int, 1> out_buffer(out.data(), n_items);

          device_queue.submit([&](cl::sycl::handler &cgh) {
              constexpr auto sycl_read = cl::sycl::access::mode::read;
              constexpr auto sycl_write = cl::sycl::access::mode::write;

              auto in_accessor = in_buffer.get_access<sycl_read>(cgh);
              auto out_accessor = out_buffer.get_access<sycl_write>(cgh);

              cgh.parallel_for<class VecScalMul>(n_items,
                  [=](cl::sycl::id<1> wiID) {
                      out_accessor[wiID] = in_accessor[wiID]*2;
                  });
         });
     }
}
```

我会把它划分为一个个片段。

```
#include <CL/sycl.hpp>
```

我们做的第一件事就是包含 SYCL 头文件，它会在我们的命令中添加 SYCL 运行时库。

```
const size_t array_size = 1024*512;
std::array<cl::sycl::cl_int, array_size> in,out;
std::iota(begin(in),end(in),0);
```

这里我们构造了一个很大的整型数组并用数字 `0` 到 `array_size-1` 初始化（这就是 `std::iota` 所做的）。注意我们使用 `cl::sycl::cl_int` 确保兼容性。

```
{
    //...
}
```

接着我们打开一个新的作用域，其目的为二：

1. `device_queue` 将在该作用域结束时解构，它将阻塞，直到内核完成。
2. `in_buffer` 和 `out_buffer` 也将解构，这将强制数据传输回主机并允许我们从 `in` 和 `out` 中访问数据。
```
cl::sycl::queue device_queue;
```

现在我们创建我们的命令队列。命令队列是所有工作（内核）在分发到设备之前需要入队的地方。有很多方法可以定制队列，例如说提供设备用于入队或者设置异步错误处理器，但对于这个例子默认构造器就可以了；它会查找兼容的 GPU，如果失败的话会回退到主机 CPU。

```
cl::sycl::range<1> n_items{array_size};
```

接下来我们创建一个范围，它描述了内核在上面执行的数据的形状。在我们简单的例子中，它是一个一维数组，因此我们使用 `cl::sycl::range<1>`。如果数据是二维的，我们就会使用 `cl::sycl::range<2>`，以此类推。除了 `cl::sycl::range`，还有 `cl::sycl::ndrange`，它允许你指定工作组大小以及越界范围，但在我们的例子中我们不需要使用它。

```
cl::sycl::buffer<cl::sycl::cl_int, 1> in_buffer(in.data(), n_items);
cl::sycl::buffer<cl::sycl::cl_int, 1> out_buffer(out.data(), n_items);
```

为了控制主机和设备之间的数据共享和传输，SYCL 提供了一个 `buffer` 类。我们创建了两个 SYCL 缓存用于管理我们的输入和输出数组。

```
      device_queue.submit([&](cl::sycl::handler &cgh) {/*...*/});
```

设置好了我们所有数据之后，我们就可以入队真正的工作。有多种方法可以做到，但设置并行执行的一个简单方法是在我们的队列中调用 `.submit` 函数。对于这个函数我们传递了一个运行时调度该任务时会被执行的“命令组伪函数”（伪函数是规范，不是我创造的）。命令组处理器设置任何内核需要的余下资源并分发它。

```
constexpr auto sycl_read = cl::sycl::access::mode::read_write;
constexpr auto sycl_write = cl::sycl::access::mode::write;

auto in_accessor = in_buffer.get_access<sycl_read>(cgh);
auto out_accessor = out_buffer.get_access<sycl_write>(cgh);
```

为了控制到我们缓存的访问并告诉该运行时环境我们会如何使用数据，我们需要创建访问器。很显然，我们创建了一个访问器用于从 `in_buffer` 读入，一个访问器用于写到 `out_buffer`。

```
cgh.parallel_for<class VecScalMul>(n_items,
    [=](cl::sycl::id<1> wiID) {
         out_accessor[wiID] = in_accessor[wiID]*2;
    });
```

现在我们已经完成了所有设置，我们可以真正的在我们的设备上做一些计算了。这里我们根据范围 `n_items` 在命令组处理器 `cgh` 之上分发一个内核。实际内核自身是一个使用 work-item 标识符作为输入、输出我们计算结果的 lamda 表达式。在这种情况下，我们从 `in_accessor` 使用 work-item 标识符作为索引读入，将其乘以 `2`，然后将结果保存到 `out_accessor` 相应的位置。`<class VecScalMul>` 是一个为了在标准 C++ 范围内工作的不幸的副产品，因此我们需要给内核一个唯一的类名以便编译器能完成它的工作。

```
}
```

在此之后，我们现在可以访问 `out` 并期望看到正确的结果。

这里有相当多的新概念在起作用，但使用这些技术你可以看到这些能力和所展现出来的东西。当然，如果你只是想在你的 GPU 上执行一些代码而不关心定制化，那么你就可以使用 SYCL 并行 STL 实现。

### SYCL 并行 STL

SYCL 并行 STL 是一个 TS 的并行化实现，它分发你的算法函数对象作为 SYCL 内核。在这个页面前面我们已经看过这样的例子，让我们来快速过一遍。

```
#include <vector>
#include <iostream>

#include <sycl/execution_policy>
#include <experimental/algorithm>
#include <sycl/helpers/sycl_buffers.hpp>

using namespace std::experimental::parallel;
using namespace sycl::helpers;

int main() {
  constexpr size_t array_size = 1024*512;
  std::array<cl::sycl::cl_int, array_size> in,out;
  std::iota(begin(in),end(in),0);

  {
    cl::sycl::buffer<int> in_buffer(in.data(), cl::sycl::range<1>(in.size()));
    cl::sycl::buffer<int> out_buffer(out.data(), cl::sycl::range<1>(out.size()));
    cl::sycl::queue q;
    sycl::sycl_execution_policy<class Mul> sycl_policy(q);
    transform(sycl_policy, begin(in_buffer), end(in_buffer), begin(out_buffer),
              [](int x) { return x*2; });
  }
}
```

```
  constexpr size_t array_size = 1024*512;
  std::array<cl::sycl::cl_int, array_size> in, out;
  std::iota(begin(in),end(in),0);
```

到现在为止一切如此相似。我们再一次创建一组数组用于保存我们的输入输出数据。

```
cl::sycl::buffer<int> in_buffer(in.data(), cl::sycl::range<1>(in.size()));
cl::sycl::buffer<int> out_buffer(out.data(), cl::sycl::range<1>(out.size()));
cl::sycl::queue q;
```

这里我们创建类似上个例子的缓存和队列。

```
sycl::sycl_execution_policy<class Mul> sycl_policy(q);
```

这就是有趣的部分。我们从我们的队列中创建 `sycl_execution_policy`，给它一个名称让内核使用。这个执行策略然后可以像 `std::execution::par` 或 `std::execution::seq` 那样使用。

```
transform(sycl_policy, begin(in_buffer), end(in_buffer), begin(out_buffer),
          [](int x) { return x*2; });
```

现在我们的内核分发看起来像提供了一个执行策略的 `std::transform` 调用。我们传递的闭包会被编译并在设备上执行，而不需要我们做其它更加复杂的设置。

当然，除了 `transform` 你可以做更多。开发的时候，SYCL 并行 STL 支持以下算法：

*   `sort`
*   `transform`
*   `for_each`
*   `for_each_n`
*   `count_if`
*   `reduce`
*   `inner_product`
*   `transform_reduce`


这就是这篇短文需要介绍的东西。如果你想和 SYCL 的开发保持同步，那就要看 [sycl.tech][9]。最近重要的开发就是移植 [Eigen][10] 和 [Tensorflow][11] 到 SYCL ，为 OpenCL 设备带来引入关注的人工智能编程。对我个人而言，我很高兴看到高级编程模型可以用于异构程序自动优化，以及它们是怎样支持类似 [HPX][12] 或 [SkelCL][13] 等更高级的技术。

--------------------------------------------------------------------------------

via: https://blog.tartanllama.xyz/c++/2017/05/19/sycl/

作者：[TartanLlama][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.twitter.com/TartanLlama
[1]:https://blog.tartanllama.xyz/c++/2017/05/19/sycl/#fnref:1
[2]:https://blog.tartanllama.xyz/c++/2017/05/19/sycl/#fn:1
[3]:https://blog.tartanllama.xyz/c++/2017/05/19/sycl/#fn:2
[4]:https://www.khronos.org/sycl
[5]:https://www.codeplay.com/products/computesuite/computecpp/reference/platform-support-notes
[6]:https://www.codeplay.com/products/computesuite/computecpp/reference/release-notes/
[7]:https://github.com/codeplaysoftware/computecpp-sdk
[8]:https://github.com/KhronosGroup/SyclParallelSTL
[9]:http://sycl.tech/
[10]:https://github.com/ville-k/sycl_starter
[11]:http://deep-beta.co.uk/setting-up-tensorflow-with-opencl-using-sycl/
[12]:https://github.com/STEllAR-GROUP/hpx
[13]:https://github.com/skelcl/skelcl
