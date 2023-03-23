[#]: subject: "Use OCI containers to run WebAssembly workloads"
[#]: via: "https://opensource.com/article/22/10/wasm-containers"
[#]: author: "Aditya R https://opensource.com/users/adir"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Use OCI containers to run WebAssembly workloads
======
Run Wasm/WASI workloads natively on Podman and Kubernetes using crun.

![Ships at sea on the web][1]

WebAssembly (also referred to as Wasm) has gained popularity as a portable binary instruction format with an embeddable and isolated execution environment for client and server applications. Think of WebAssembly as a small, fast, efficient, and very secure stack-based virtual machine designed to execute portable bytecode that doesn't care what CPU or operating system it runs on. WebAssembly was initially designed for web browsers to be a lightweight, fast, safe, and polyglot container for functions, but it's no longer limited to the web.

On the web, WebAssembly uses the existing APIs provided by browsers. WebAssembly System Interface (WASI) was created to fill the void between WebAssembly and systems running outside the browser. This enables non-browser systems to leverage the portability of WebAssembly, making WASI a good choice for portability while distributing and isolation while running the workload.

WebAssembly offers several advantages. Because it is platform neutral, one single binary can be compiled and executed on a variety of operating systems and architectures simultaneously, with a very low disk footprint and startup time. Useful security features include module signing and security knobs controllable at the run-time level rather than depending on the host operating system's user privilege. Sandboxed memory can still be managed by existing container tools infrastructure.

In this article, I will walk through a scenario for configuring [container runtimes][2] to run Wasm workloads from lightweight container images.

### Adoption on cloud infrastructure and blockers

WebAssembly and WASI are fairly new, so the standards for running Wasm workloads natively on container ecosystems have not been set. This article presents only one solution, but there are other viable methods.

Some of the solutions include switching native Linux container runtimes with components that are Wasm compatible. For instance, Krustlet v1.0.0-alpha1 allows users to introduce Kubernetes nodes where Krustlet is used as a replacement for a standard kubelet. The limitation of this approach is that users have to choose between Linux container runtime and Wasm runtime.

Another solution is using a base image with Wasm runtime and manually invoking compiled binary. However, this method makes container images bloated with runtime, which is not necessarily needed if we invoke Wasm runtime natively at a lower level than container runtime.

I will describe how you can avoid this by creating a hybrid setup where existing Open Containers Initiative (OCI) runtimes can run both native Linux containers and WASI-compatible workloads.

### Using crun in a hybrid setup of Wasm and Linux containers

Some of the problems discussed above can be easily addressed by allowing an existing OCI runtime to invoke both Linux containers and Wasm containers at a lower level. This avoids issues like depending on container images to carry Wasm runtime or introducing a new layer to infrastructure that supports only Wasm containers.

One container runtime that can handle the task: crun.

Crun is fast, has a low-memory footprint, and is a fully OCI-compliant container runtime that can be used as a drop-in replacement for your existing container runtime. Crun was originally written to run Linux containers, but it also offers handlers capable of running arbitrary extensions inside the container sandbox in a native manner.

This is an informal way of replacing existing runtime with crun just to showcase that crun is a complete replacement for your existing OCI runtime.

```
$ mv /path/to/exisiting-runtime /path/to/existing-runtime.backup
$ cp /path/to/crun /path/to/existing-runtime
```

One such handler is `crun-wasm-handler`, which delegates specially configured container images (a Wasm compat image) to the parts of existing Wasm runtimes in a native approach inside the crun sandbox. This way, end users do not need to maintain Wasm runtimes by themselves.

Crun has native integration with [wasmedge][3], [wasmtime][4], and [wasmer][5] to support this functionality out of the box. It dynamically invokes parts of these runtimes as crun detects whether the configured image contains any Wasm/WASI workload, and it does so while still supporting the native Linux containers.

For details on building crun with Wasm/WASI support, see the [crun repository on GitHub][6].

### Building and running Wasm images using Buildah on Podman and Kubernetes

Users can create and run platform-agnostic Wasm images on [Podman][7] and Kubernetes using crun as an OCI runtime under the hood. Here's a tutorial:

#### Creating Wasm compat images using Buildah

Wasm/WASI compatible images are special. They contain a magic annotation that helps an OCI runtime like crun classify whether it is a Linux-native image or an image with a Wasm/WASI workload. Then it can invoke handlers if needed.

Creating these Wasm compat images is extremely easy with any container image build tools, but for this article, I will l demonstrate using [Buildah][8].

1. Compile your `.wasm` module.

2. Prepare a Containerfile with your `.wasm` module.

```
FROM scratch

COPY hello.wasm /

CMD ["/hello.wasm"]
```

3. Build a Wasm image using Buildah with annotation `module.wasm.image/variant=compat`

```
$ buildah build --annotation "module.wasm.image/variant=compat" -t mywasm-image
```

Once the image is built and the container engine is configured to use crun, crun will automagically do the needful and run the provided workload by the configured Wasm handler.

#### Running a WASM workload with Podman

Crun is the default OCI runtime for Podman. Podman contains knobs and handles to utilize most crun features, including the crun Wasm handler. Once a Wasm compat image is built, it can be used by Podman just like any other container image:

```
$ podman run mywasm-image:latest
```

Podman runs the requested Wasm compat image `mywasm-image:latest` using crun's Wasm handler and returns output confirming that our workload was executed.

```
$ hello world from the webassembly module !!!!
```

#### Kubernetes-supported and tested container run-time interface (CRI) implementations

Here's how to configure two popular container runtimes:

##### CRI-O

* Configure CRI-O to use crun instead of runc by editing config at `/etc/crio/crio.conf`. Red Hat OpenShift documentation contains more details about [configuring CRI-O][9].
* Restart CRI-O with `sudo systemctl restart crio`.
* CRI-O automatically propagates pod annotations to the container spec.

##### Containerd

* Containerd supports switching container runtime via a custom configuration defined at `/etc/containerd/config.toml`.
* Configure containerd to use crun by making sure the run-time binary points to crun. More details are available in the [containerd documentation][10].
* Configure containerd to allowlist Wasm annotations so they can be propagated to the OCI spec by setting `pod_annotations` in the configuration: `pod_annotations = ["module.wasm.image/variant.*"]`.
* Restart containerd with `sudo systemctl start containerd`.
* Now containerd should propagate Wasm pod annotations to containers.

The following is an example of a Kubernetes pod spec that works with both CRI-O and containerd:

```
apiVersion: v1
kind: Pod
metadata:
  name: pod-with-wasm-workload
  namespace: mynamespace
  annotations:
    module.wasm.image/variant: compat
spec:
  containers:
  - name: wasm-container
    image: myrepo/mywasmimage:latest
```

### Known issues and workarounds

Complex Kubernetes infrastructure contains pods and, in many cases, pods with sidecars. That means crun's Wasm integration is not useful when a deployment contains sidecars and sidecar containers do not contain a Wasm entry point, such as infrastructure setups with service mesh like Linkerd, Gloo, and Istio or a proxy like Envoy.

You can solve this issue by adding two smart annotations for Wasm handlers: `compat-smart` and `wasm-smart`. These annotations serve as a smart switch that only toggles Wasm runtime if it's necessary for a container. Hence while running deployments with sidecars, only containers that contain valid Wasm workloads are executed by Wasm handlers. Regular containers are treated as usual and delegated to the native Linux container runtime.

Thus when building images for such a use case, use annotation `module.wasm.image/variant=compat-smart` instead of `module.wasm.image/variant=compat`.

You can find other known issues in [crun documentation on GitHub][11].

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/10/wasm-containers

作者：[Aditya R][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/adir
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/kubernetes_containers_ship_lead.png
[2]: https://opensource.com/article/21/9/container-runtimes
[3]: https://wasmedge.org/
[4]: https://wasmtime.dev/
[5]: https://wasmer.io/
[6]: https://github.com/containers/crun/
[7]: https://www.redhat.com/sysadmin/topics/podman?intcmp=7013a000002qLH8AAM
[8]: https://opensource.com/article/22/2/build-your-own-container-linux-buildah
[9]: https://docs.openshift.com/container-platform/3.11/crio/crio_runtime.html#configure-crio-use-crio-engine
[10]: https://github.com/containerd/containerd/blob/main/docs/cri/config.md
[11]: https://github.com/containers/crun/blob/main/docs/wasm-wasi-on-kubernetes.md#known-issues
