ictlyh Translating
Accelerating your C++ on GPU with SYCL
============================================================


### WARNING: This is an incomplete draft. There are likely many mistaeks and unfinished sections.

* * *

 Leveraging the power of graphics cards for compute applications is all the rage right now in fields such as machine learning, computer vision and high-performance computing. Technologies like OpenCL expose this power through a hardware-independent programming model, allowing you to write code which abstracts over different architecture capabilities. The dream of this is “write once, run anywhere”, be it an Intel CPU, AMD discrete GPU, DSP, etc. Unfortunately, for everyday programmers, OpenCL has something of a steep learning curve; a simple Hello World program can be a hundred or so lines of pretty ugly-looking code. However, to ease this pain, the Khronos group have developed a new standard called [SYCL][4], which is a C++ abstraction layer on top of OpenCL. Using SYCL, you can develop these general-purpose GPU (GPGPU) applications in clean, modern C++ without most of the faff associated with OpenCL. Here’s a simple vector multiplication example written in SYCL using the parallel STL implementation:

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

For comparison, here’s a mostly equivalent version written in OpenCL using the C++ API (don’t spend much time reading this, just note that it looks ugly and is really long):

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

In this post I’ll give an introduction on using SYCL to accelerate your C++ code on the GPU.

* * *

### Lightning intro to GPGPU

Before I get started on how to use SYCL, I’ll give a brief outline of why you might want to run compute jobs on the GPU for those who are unfamiliar. I’ve you’ve already used OpenCL, CUDA or similar, feel free to skip ahead.

The key difference between a GPU and a CPU is that, rather than having a small number of complex, powerful cores (1-8 for common consumer desktop hardware), a GPU has a huge number of small, simple processing elements.

![CPU architecture](https://blog.tartanllama.xyz/assets/cpu.png)

Above is a comically simplified diagram of a CPU with four cores. Each core has a set of registers and is attached to various levels of cache (some might be shared, some not), and then main memory.

![GPU architecture](https://blog.tartanllama.xyz/assets/gpu.png)

In the GPU, tiny processing elements are grouped into execution units. Each processing element has a bit of memory attached to it, and each execution unit has some memory shared between its processing elements. After that, there’s some GPU-wide memory, then the same main memory which the CPU uses. The elements within an execution unit execute in  _lockstep_ , where each element executes the same instruction on a different piece of data.

There are many aspects of GPGPU programming which make it an entirely different beast to everyday CPU programming. For example, transferring data from main memory to the GPU is  _slow_ .  _Really_  slow. Like, kill all your performance and get you fired slow. Therefore, the tradeoff with GPU programming is to make as much of the ridiculously high throughput of your accelerator to hide the latency of shipping the data to and from it.

There are other issues which might not be immediately apparent, like the cost of branching. Since the processing elements in an execution unit work in lockstep, nested branches which cause them to take different paths (divergent control flow) is a real problem. This is often solved by executing all branches for all elements and masking out the unneeded results. That’s a polynomial explosion in complexity based on the level of nesting, which is A Bad Thing ™. Of course, there are optimizations which can aid this, but the idea stands: simple assumptions and knowledge you bring from the CPU world might cause you big problems in the GPU world.

Before we get back to SYCL, some short pieces of terminology. The  _host_  is the main CPU running on your machine which executes and the  _device_  is what will be running your OpenCL code. A device could be the same as the host, or it could be some accelerator sitting in your machine, a simulator, whatever. A  _kernel_  is a special function which is the entry point to the code which will run on your device. It will often be supplied with buffers for input and output data which have been set up by the host.

* * *

### Back to SYCL

There are currently two implementations of SYCL available; “triSYCL”, an experimental open source version by Xilinx (mostly used as a testbed for the standard), and “ComputeCpp”, an industry-strength implementation by Codeplay[1][2] (currently in open beta). Only ComputeCpp supports execution of kernels on the GPU, so we’ll be using that in this post.

Step 1 is to get ComputeCpp up and running on your machine. The main components are a runtime library which implements the SYCL API, and a Clang-based compiler which compiles both your host code and your device code. At the time of writing, Intel CPUs and some AMD GPUs are officially supported on Ubuntu and CentOS. It should be pretty easy to get it working on other Linux distributions (I got it running on my Arch system, for instance). Support for more hardware and operating systems is being worked on, so check the [supported platforms document][5] for an up-to-date list. The dependencies and components are listed [here][6]. You might also want to download the [SDK][7], which contains samples, documentation, build system integration files, and more. I’ll be using the [SYCL Parallel STL][8] in this post, so get that if you want to play along at home.

Once you’re all set up, we can get GPGPUing! As noted in the introduction, my first sample used the SYCL parallel STL implementation. We’ll now take a look at how to write that code with bare SYCL.

```
#include <CL/sycl.hpp>

#include <array>
#include <numeric>
#include <iostream>

int main() {
      const size_t array_size = 1024*512;
      std::array<cl::sycl::cl_int, array_size> in,out;
      std::iota(begin(in),end(in),0);

      cl::sycl::queue device_queue;
      cl::sycl::range<1> n_items{array_size};
      cl::sycl::buffer<cl::sycl::cl_int, 1> in_buffer(in.data(), n_items);
      cl::sycl::buffer<cl::sycl::cl_int, 1> out_buffer(out.data(), n_items);

      device_queue.submit([&](cl::sycl::handler &cgh) {
          constexpr auto sycl_read = cl::sycl::access::mode::read_write;
          constexpr auto sycl_write = cl::sycl::access::mode::write;

          auto in_accessor = in_buffer.get_access<sycl_read>(cgh);
          auto out_accessor = out_buffer.get_access<sycl_write>(cgh);

          cgh.parallel_for<class VecScalMul>(n_items,
              [=](cl::sycl::id<1> wiID) {
                  out_accessor[wiID] = in_accessor[wiID]*2;
              });
     });

     device_queue.wait();
}
```

I’ll break this down piece-by-piece.

```
#include <CL/sycl.hpp>
```

The first thing we do is include the SYCL header file, which will put the SYCL runtime library at our command.

```
const size_t array_size = 1024*512;
std::array<cl::sycl::cl_int, array_size> in,out;
std::iota(begin(in),end(in),0);
```

Here we construct a large array of integers and initialize it with the numbers from `0` to `array_size-1` (this is what `std::iota` does). Note that we use `cl::sycl::cl_int` to ensure compatibility.

```
cl::sycl::queue device_queue;
```

Now we create our command queue. The command queue is where all work (kernels) will be enqueued before being dispatched to the device. There are many ways to customise the queue, such as providing a device to enqueue on or setting up asynchronous error handlers, but the default constructor will do for this example; it looks for a compatible GPU and falls back on the host CPU if it fails.

```
cl::sycl::range<1> n_items{array_size};
```

Next we create a range, which describes the shape of the data which the kernel will be executing on. In our simple example, it’s a one-dimensional array, so we use `cl::sycl::range<1>`. If the data was two-dimensional we would use `cl::sycl::range<2>` and so on. Alongside `cl::sycl::range`, there is `cl::sycl::ndrange`, which allows you to specify work group sizes as well as an overall range, but we don’t need that for our example.

```
cl::sycl::buffer<cl::sycl::cl_int, 1> in_buffer(in.data(), n_items);
cl::sycl::buffer<cl::sycl::cl_int, 1> out_buffer(out.data(), n_items);
```

In order to control data sharing and transfer between the host and devices, SYCL provides a `buffer` class. We create two SYCL buffers to manage our input and output arrays.

```
      device_queue.submit([&](cl::sycl::handler &cgh) {/*...*/});
```

After setting up all of our data, we can enqueue our actual work. There are a few ways to do this, but a simple method for setting up a parallel execution is to call the `.submit` function on our queue. To this function we pass a  _command group functor_ [2][3] which will be executed when the runtime schedules that task. A command group handler sets up any last resources needed by the kernel and dispatches it.

```
constexpr auto sycl_read = cl::sycl::access::mode::read_write;
constexpr auto sycl_write = cl::sycl::access::mode::write;

auto in_accessor = in_buffer.get_access<sycl_read>(cgh);
auto out_accessor = out_buffer.get_access<sycl_write>(cgh);
```

In order to control access to our buffers and to tell the runtime how we will be using the data, we need to create  _accessors_ . It should be clear that we are creating one accessor for reading from `in_buffer`, and one accessor for writing to `out_buffer`.

```
cgh.parallel_for<class VecScalMul>(n_items,
    [=](cl::sycl::id<1> wiID) {
         out_accessor[wiID] = in_accessor[wiID]*2;
    });
```

Now that we’ve done all the setup, we can actually do some computation on our device. Here we dispatch a kernel on the command group handler `cgh` over our range `n_items`. The actual kernel itself is a lambda which takes a work-item identifier and carries out our computation. In this case, we are reading from `in_accessor` at the index of our work-item identifier, multiplying it by `2`, then storing the result in the relevant place in `out_accessor`. That `<class VecScalMul>` is an unfortunate byproduct of how SYCL needs to work within the confines of standard C++, so we need to give a unique class name to the kernel for the compiler to be able to do its job.

```
device_queue.wait();
```

Our last line is kind of like calling `.join()` on a `std::thread`; it waits until the queue has executed all work which has been submitted. After this point, we could now access `out` and expect to see the correct results. Queues will also wait implicitly on destruction, so you could alternatively place it in some inner scope and let the synchronisation happen when the scope ends.

There are quite a few new concepts at play here, but hopefully you can see the power and expressibility we get using these techniques. However, if you just want to toss some code at your GPU and not worry about the customisation, then you can use the SYCL Parallel STL implementation.

* * *

### SYCL Parallel STL

The SYCL Parallel STL is an implementation of the Parallelism TS which dispatches your algorithm function objects as SYCL kernels. We already saw an example of this at the top of the page, so lets run through it quickly.

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
  std::iota(begin(in),end(out),0);
```

So far, so similar. Again we’re creating a couple of arrays to hold our input and output data.

```
cl::sycl::buffer<int> in_buffer(in.data(), cl::sycl::range<1>(in.size()));
cl::sycl::buffer<int> out_buffer(out.data(), cl::sycl::range<1>(out.size()));
cl::sycl::queue q;
```

Here we are creating our buffers and our queue like in the last example.

```
sycl::sycl_execution_policy<class Mul> sycl_policy(q);
```

Here’s where things get interesting. We create a `sycl_execution_policy` from our queue and give it a name to use for the kernel. This execution policy can then be used like `std::execution::par` or `std::execution::seq`.

```
transform(sycl_policy, begin(in_buffer), end(in_buffer), begin(out_buffer),
          [](int x) { return x*2; });
```

Now our kernel dispatch looks like a call to `std::transform` with an execution policy provided. That closure we pass in will be compiled for and executed on the device without us having to do any more complex set up.

Of course, you can do more than just `transform`. At the time of writing, the SYCL Parallel STL supports these algorithms:

*   `sort`

*   `transform`

*   `for_each`

*   `for_each_n`

*   `count_if`

*   `reduce`

*   `inner_product`

*   `transform_reduce`

* * *

That covers things for this short introduction. If you want to keep up to date with developments in SYCL, be sure to check out [sycl.tech][9]. Notable recent developments have been porting [Eigen][10] and [Tensorflow][11] to SYCL to bring expressive artificial intelligence programming to OpenCL devices. Personally, I’m excited to see how the high-level programming models can be exploited for automatic optimization of heterogeneous programs, and how they can support even higher-level technologies like [HPX][12] or [SkelCL][13].

1.  I work for Codeplay, but this post was written in my own time with no suggestion from my employer. [↩][1]

2.  Hey, “functor” is in the spec, don’t @ me.

--------------------------------------------------------------------------------

via: https://blog.tartanllama.xyz/c++/2017/05/19/sycl/

作者：[TartanLlama  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
