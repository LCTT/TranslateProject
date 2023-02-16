[#]: subject: "How Tracee solves the lack of BTF information"
[#]: via: "https://opensource.com/article/22/9/ebpf-monitor-traffic-tracee"
[#]: author: "Alessio Greggi https://opensource.com/users/alegrey91"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How Tracee solves the lack of BTF information
======
By tracing processes using Linux eBPF (Berkeley packet filter) technology, Tracee can correlate collected information and identify malicious behavioral patterns.

![Mesh networking connected dots][1]

Tracee is a project by Aqua Security for tracing processes at runtime. By tracing processes using [Linux eBPF][2] (Berkeley packet filter) technology, Tracee can correlate collected information and identify malicious behavioral patterns.

### eBPF

BPF is a system to help in network traffic analysis. The later eBPF system extends classic BPF to improve the programmability of the Linux kernel in different areas, such as network filtering, function hooking, and so on. Thanks to its register-based virtual machine, which is embedded in the kernel, eBPF can execute programs written with a restricted C language without needing to recompile the kernel or load a module. Through eBPF, you can run your program in kernel context and hook various events in the kernel path. To do so, eBPF needs to have deep knowledge about data structures that the kernel is using.

### eBPF CO-RE

eBPF interfaces with Linux kernel ABI (application binary interface). Access to kernel structures from eBPF VM depends on the specific Linux kernel release.

eBPF CO-RE (compile once, run everywhere) is the ability to write an eBPF program that will successfully compile, pass kernel verification, and work correctly across different kernel releases without the need to recompile it for each particular kernel.

#### Ingredients

CO-RE needs a precise synergism of these components:

* BTF (BPF type format) information: Allows the capture of crucial pieces of information about kernel and BPF program types and code, enabling all the other parts of BPF CO-RE puzzle.
* Compiler (Clang): Records relocation information. For example, if you were going to access the task_struct->pid field, Clang would record that it was exactly a field named `pid` of type `pid_t` residing within a struct `task_struct`. This system ensures that even if a target kernel has a `task_struct` layout in which the `pid` field is moved to a different offset within a `task_struct` structure, you'll still be able to find it just by its name and type information.
* BPF loader (libbpf): Ties BTFs from kernel and BPF programs together to adjust compiled BPF code to specific kernels on target hosts.

So how do these ingredients mix together for a successful recipe?

#### Development/build

To make the code portable, the following tricks come into play:

* CO-RE helpers/macros
* BTF-defined maps
* #include "vmlinux.h" (the header file containing all the kernel types)

#### Run

The kernel must be built with the `CONFIG_DEBUG_INFO_BTF=y` option in order to provide the `/sys/kernel/btf/vmlinux` interface that exposes BTF-formatted kernel types. This allows libbpf to resolve and match all the types and fields and update necessary offsets and other relocatable data to make sure that the eBPF program is working properly for the specific kernel on the target host.

### The problem

The problem arises when an eBPF program is written to be portable but the target kernel doesn't expose the `/sys/kernel/btf/vmlinux` interface. For more information, [refer to this list][3] of distributions that support BTF.

To load an run an eBPF object in different kernels, the libbpf loader uses the BTF information to calculate field offset relocations. Without the BTF interface, the loader doesn't have the necessary information to adjust the previously recorded types that the program tries to access after processing the object for the running kernel.

Is it possible to avoid this problem?

#### Use cases

This article explores [Tracee][4], an Aqua Security open source project, that provides a possible solution.

Tracee provides different running modes to adapt itself to the environment conditions. It supports two eBPF integration modes:

* CO-RE: A portable mode, which seamlessly runs on all supported environments
* Non CO-RE: A kernel-specific mode, requiring the eBPF object to be built for the target host

Both of them are implemented in the eBPF C code (`pkg/ebpf/c/tracee.bpf.c` ), where the pre-processing conditional directive takes place. This allows you to compile CO-RE the eBPF binary, passing the `-DCORE` argument at build time with Clang (take a look at the `bpf-core` Make target).

In this article, we're going to cover a case of the portable mode when the eBPF binary is built CO-RE, but the target kernel has not been built with `CONFIG_DEBUG_INFO_BTF=y` option.

To better understand this scenario, it helps to understand what's possible when the kernel doesn't expose BTF-formatted types on sysfs.

#### No BTF support

If you want to run Tracee on a host without BTF support, there are two options:

1. [Build and install][5] the eBPF object for your kernel. This depends on Clang and on the availability of a kernel version-specific kernel-headers package.
2. Download the BTF files from [BTFHUB][6] for your kernel release and provide it to the `tracee-ebpf`'s loader through the `TRACEE_BTF_FILE` environment variable.

The first option is not a CO-RE solution. It compiles the eBPF binary, including a long list of kernel headers. That means you need kernel development packages installed on the target system. Also, this solution needs Clang installed on your target machine. The Clang compiler can be resource-heavy, so compiling eBPF code can use a significant amount of resources, potentially affecting a carefully balanced production workload. That said, it's a good practice to avoid the presence of a compiler in your production environment. This could lead to attackers successfully building an exploit and performing a privilege escalation.

The second option is a CO-RE solution. The problem here is that you have to provide the BTF files in your system in order to make Tracee work. The entire archive is nearly 1.3 GB. Of course you can provide just the right BTF file for your kernel release, but that can be difficult when dealing with different kernel releases.

In the end, these possible solutions can also introduce problems, and that's where Tracee works its magic.

### A portable solution

With a non-trivial building procedure, the Tracee project compiles a binary to be CO-RE even if the target environment doesn't provide BTF information. This is possible with the `embed` Go package that provides, at runtime, access to files embedded in the program. During the build, the continuous integration (CI) pipeline downloads, extracts, minimizes, and then embeds BTF files along with the eBPF object inside the `tracee-ebpf` resultant binary.

Tracee can extract the right BTF file and provide it to libbpf, which in turn loads the eBPF program to run across different kernels. But how can Tracee embed all these BTF files downloaded from BTFHub without weighing too much in the end?

It uses a feature recently introduced in bpftool by the Kinvolk team called [BTFGen][7], available using the `bpftool gen min_core_btf` subcommand. Given an eBPF program, BTFGen generates reduced BTF files, collecting just what the eBPF code needs for its run. This reduction allows Tracee to embed all these files that are now lighter (just a few kilobytes) and support kernels that don't have the `/sys/kernel/btf/vmlinux` interface exposed.

#### Tracee build

Here's the execution flow of the Tracee build:

![Detailed flowchart of tracee build from tracee/3rdparty/btfhub.sh to tracee-ebpf bin compiled][8]

Image by: (Alessio Greggi and Massimiliano Giovagnoli, CC BY-SA 4.0)

First, you must build the `tracee-ebpf` binary, the Go program that loads the eBPF object. The Makefile provides the command `make bpf-core` to build the `tracee.bpf.core.o` object with BTF records.

Then `STATIC=1 BTFHUB=1 make all` builds `tracee-ebpf`, which has `btfhub` targeted as a dependency. This last target runs the script `3rdparty/btfhub.sh`, which is responsible for downloading the BTFHub repositories:

* btfhub
* btfhub-archive

Once downloaded and placed in the `3rdparty` directory, the procedure executes the downloaded script `3rdparty/btfhub/tools/btfgen.sh`. This script generates reduced BTF files, tailored for the `tracee.bpf.core.o` eBPF binary.

The script collects `*.tar.xz` files from `3rdparty/btfhub-archive/` to uncompress them and finally process them with bpftool, using the following command:

```
for file in $(find ./archive/${dir} -name *.tar.xz); do
    dir=$(dirname $file)
    base=$(basename $file)
    extracted=$(tar xvfJ $dir/$base)
    bpftool gen min_core_btf ${extracted} dist/btfhub/${extracted} tracee.bpf.core.o
done
```

This code has been simplified to make it easier to understand the scenario.

Now, you have all the ingredients available for the recipe:

* tracee.bpf.core.o eBPF object
* BTF reduced files (for all kernel releases)
* tracee-ebpf Go source code

At this point, `go build` is invoked to do its job. Inside the `embedded-ebpf.go` file, you can find the following code:

```
//go:embed "dist/tracee.bpf.core.o"
//go:embed "dist/btfhub/*"
```

Here, the Go compiler is instructed to embed the eBPF CO-RE object with all the BTF-reduced files inside itself. Once compiled, these files will be available using the `embed.FS` file system. To have an idea of the current situation, you can imagine the binary with a file system structured like this:

```
dist
├── btfhub
│   ├── 4.19.0-17-amd64.btf
│   ├── 4.19.0-17-cloud-amd64.btf
│   ├── 4.19.0-17-rt-amd64.btf
│   ├── 4.19.0-18-amd64.btf
│   ├── 4.19.0-18-cloud-amd64.btf
│   ├── 4.19.0-18-rt-amd64.btf
│   ├── 4.19.0-20-amd64.btf
│   ├── 4.19.0-20-cloud-amd64.btf
│   ├── 4.19.0-20-rt-amd64.btf
│   └── ...
└── tracee.bpf.core.o
```

The Go binary is ready. Now to try it out!

#### Tracee run

Here's the execution flow of the Tracee run:

![Flow chart of tracee run assuming BTF info is not available in the kernel, which leads to "copy btf kernel related file" and "load btf file using libbpf under the hood"][9]

Image by: (Alessio Greggi and Massimiliano Giovagnoli, CC BY-SA 4.0)

As the flow chart illustrates, one of the very first phases of `tracee-ebpf` execution is to discover the environment where it is running. The first condition is an abstraction of the `cmd/tracee-ebpf/initialize/bpfobject.go` file, specifically where the `BpfObject()` function takes place. The program performs some checks to understand the environment and make decisions based on it:

1. BPF file given and BTF (vmlinux or env) exists: always load BPF as CO-RE
2. BPF file given but no BTF exists: it is a non CO-RE BPF
3. No BPF file given and BTF (vmlinux or env) exists: load embedded BPF as CO-RE
4. No BPF file given and no BTF available: check embedded BTF files
5. No BPF file given and no BTF available and no embedded BTF: non CO-RE BPF

Here's the code extract:

```
func BpfObject(config *tracee.Config, kConfig *helpers.KernelConfig, OSInfo *helpers.OSInfo) error {
    ...
    bpfFilePath, err := checkEnvPath("TRACEE_BPF_FILE")
    ...
    btfFilePath, err := checkEnvPath("TRACEE_BTF_FILE")
    ...
    // Decision ordering:
    // (1) BPF file given & BTF (vmlinux or env) exists: always load BPF as CO-RE
    ...
    // (2) BPF file given & if no BTF exists: it is a non CO-RE BPF
    ...
    // (3) no BPF file given & BTF (vmlinux or env) exists: load embedded BPF as CO-RE
    ...
    // (4) no BPF file given & no BTF available: check embedded BTF files
    unpackBTFFile = filepath.Join(traceeInstallPath, "/tracee.btf")
    err = unpackBTFHub(unpackBTFFile, OSInfo)
    
    if err == nil {
        if debug {
            fmt.Printf("BTF: using BTF file from embedded btfhub: %v\n", unpackBTFFile)
        }
        config.BTFObjPath = unpackBTFFile
        bpfFilePath = "embedded-core"
        bpfBytes, err = unpackCOREBinary()
        if err != nil {
            return fmt.Errorf("could not unpack embedded CO-RE eBPF object: %v", err)
        }
    
        goto out
    }
    // (5) no BPF file given & no BTF available & no embedded BTF: non CO-RE BPF
    ...
out:
    config.KernelConfig = kConfig
    config.BPFObjPath = bpfFilePath
    config.BPFObjBytes = bpfBytes
    
    return nil
}
```

This analysis focuses on the fourth case, when eBPF program and BTF files are not provided to `tracee-ebpf`. At that point, `tracee-ebpf` tries to load the eBPF program extracting all the necessary files from its embed file system. `tracee-ebpf` is able to provide the files that it needs to run, even in a hostile environment. It is a sort of high-resilience mode used when none of the conditions have been satisfied.

As you see, `BpfObject()` calls these functions in the fourth case branch:

* unpackBTFHub()
* unpackCOREBinary()

They extract respectively:

* The BTF file for the underlying kernel
* The BPF CO-RE binary

##### Unpack the BTFHub

Now take a look starting from `unpackBTFHub()` :

```
func unpackBTFHub(outFilePath string, OSInfo *helpers.OSInfo) error {
    var btfFilePath string

    osId := OSInfo.GetOSReleaseFieldValue(helpers.OS_ID)
    versionId := strings.Replace(OSInfo.GetOSReleaseFieldValue(helpers.OS_VERSION_ID), "\"", "", -1)
    kernelRelease := OSInfo.GetOSReleaseFieldValue(helpers.OS_KERNEL_RELEASE)
    arch := OSInfo.GetOSReleaseFieldValue(helpers.OS_ARCH)

    if err := os.MkdirAll(filepath.Dir(outFilePath), 0755); err != nil {
        return fmt.Errorf("could not create temp dir: %s", err.Error())
    }

    btfFilePath = fmt.Sprintf("dist/btfhub/%s/%s/%s/%s.btf", osId, versionId, arch, kernelRelease)
    btfFile, err := embed.BPFBundleInjected.Open(btfFilePath)
    if err != nil {
        return fmt.Errorf("error opening embedded btfhub file: %s", err.Error())
    }
    defer btfFile.Close()

    outFile, err := os.Create(outFilePath)
    if err != nil {
        return fmt.Errorf("could not create btf file: %s", err.Error())
    }
    defer outFile.Close()

    if _, err := io.Copy(outFile, btfFile); err != nil {
        return fmt.Errorf("error copying embedded btfhub file: %s", err.Error())

    }

    return nil
}
```

The function has a first phase where it collects information about the running kernel (`osId`, `versionId`, `kernelRelease`, etc). Then, it creates the directory that is going to host the BTF file (`/tmp/tracee` by default). It retrieves the right BTF file from the `embed` file system:

```
btfFile, err := embed.BPFBundleInjected.Open(btfFilePath)
```

Finally, it creates and fills the file.

##### Unpack the CORE Binary

The `unpackCOREBinary()` function does a similar thing:

```
func unpackCOREBinary() ([]byte, error) {
    b, err := embed.BPFBundleInjected.ReadFile("dist/tracee.bpf.core.o")
    if err != nil {
        return nil, err
    }

    if debug.Enabled() {
        fmt.Println("unpacked CO:RE bpf object file into memory")
    }

    return b, nil
}
```

Once the main function `BpfObject()` returns, `tracee-ebpf` is ready to load the eBPF binary through `libbpfgo`. This is done in the `initBPF()` function, inside `pkg/ebpf/tracee.go`. Here's the configuration of the program execution:

```
func (t *Tracee) initBPF() error {
    ...
    newModuleArgs := bpf.NewModuleArgs{
        KConfigFilePath: t.config.KernelConfig.GetKernelConfigFilePath(),
        BTFObjPath:      t.config.BTFObjPath,
        BPFObjBuff:      t.config.BPFObjBytes,
        BPFObjName:      t.config.BPFObjPath,
    }

    // Open the eBPF object file (create a new module)

    t.bpfModule, err = bpf.NewModuleFromBufferArgs(newModuleArgs)
    if err != nil {
        return err
    }
    ...
}
```

In this piece of code we are initializing the eBPF args filling the libbfgo structure `NewModuleArgs{}`. Through its `BTFObjPath` argument, we are able to instruct libbpf to use the BTF file, previously extracted by the `BpfObject()` function.

At this point, `tracee-ebpf` is ready to run properly!

![Illustration of the kernel][10]

Image by: (Alessio Greggi and Massimiliano Giovagnoli, CC BY-SA 4.0)

##### eBPF module initialization

Next, during the execution of the `Tracee.Init()` function, the configured arguments will be used to open the eBPF object file:

```
Tracee.bpfModule = libbpfgo.NewModuleFromBufferArgs(newModuleArgs)
```

Initialize the probes:

```
t.probes, err = probes.Init(t.bpfModule, netEnabled)
```

Load the eBPF object into kernel:

```
err = t.bpfModule.BPFLoadObject()
```

Populate eBPF maps with initial data:

```
err = t.populateBPFMaps()
```

And finally, attach eBPF programs to selected events' probes:

```
err = t.attachProbes()
```

### Conclusion

Just as eBPF simplified the way to program the kernel, CO-RE is tackling another barrier. But leveraging such features has some requirements. Fortunately, with Tracee, the Aqua Security team found a way to take advantage of portability in case those requirements can't be satisfied.

At the same time, we're sure that this is only the beginning of a continuously evolving subsystem that will find increasing support over and over, even in different operating systems.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/ebpf-monitor-traffic-tracee

作者：[Alessio Greggi][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alegrey91
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/mesh_networking_dots_connected.png
[2]: https://opensource.com/article/22/8/ebpf-network-observability-cloud
[3]: https://github.com/aquasecurity/btfhub/blob/main/docs/supported-distros.md
[4]: https://github.com/aquasecurity/tracee
[5]: https://aquasecurity.github.io/tracee/dev/building/nocore-ebpf/#install-the-non-co-re-ebpf-object
[6]: https://github.com/aquasecurity/btfhub-archive
[7]: https://kinvolk.io/blog/2022/03/btfgen-one-step-closer-to-truly-portable-ebpf-programs/
[8]: https://opensource.com/sites/default/files/2022-08/tracee%20build.png
[9]: https://opensource.com/sites/default/files/2022-08/tracee%20run.png
[10]: https://opensource.com/sites/default/files/2022-08/tracee%20bpf.png
