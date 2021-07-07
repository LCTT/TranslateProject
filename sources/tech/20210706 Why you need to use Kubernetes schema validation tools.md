[#]: subject: (Why you need to use Kubernetes schema validation tools)
[#]: via: (https://opensource.com/article/21/7/kubernetes-schema-validation)
[#]: author: (Eyar Zilberman https://opensource.com/users/eyarz)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Why you need to use Kubernetes schema validation tools
======
Compare schema validation tools that help you avoid misconfigurations in
your Kubernetes clusters.
![Net catching 1s and 0s or data in the clouds][1]

How do you ensure the stability of your Kubernetes (K8s) clusters? How do you know that your manifests are syntactically valid? Are you sure you don't have any invalid data types? Are any mandatory fields missing?

Most often, we become aware of these misconfigurations only at the worst time: when we're trying to deploy the new manifests.

Specialized tools and a "shift-left" approach make it possible to verify a Kubernetes schema before it's applied to a cluster. This article addresses how you can avoid misconfigurations and which tools are the best to use.

> ## TL;DR
>
> Running schema validation tests is important, and the sooner the better. If all machines (e.g., local developer environments, continuous integration [CI], etc.) have access to your Kubernetes cluster, run `kubectl --dry-run` in server mode on every code change. If this isn't possible and you want to perform schema validation tests offline, use kubeconform together with a policy-enforcement tool to have optimal validation coverage.

### Schema-validation tools

Verifying the state of Kubernetes manifests may seem like a trivial task because the Kubernetes command-line interface (CLI), kubectl, can verify resources before they're applied to a cluster. You can verify the schema by using the [dry-run][2] flag (`--dry-run=client/server`) when specifying the `kubectl create` or `kubectl apply` commands; these will perform the validation without applying Kubernetes resources to the cluster.

But I can assure you that it's actually more complex. A running Kubernetes cluster must obtain the schema for the set of resources being validated. So, when incorporating manifest verification into a CI process, you must also manage connectivity and credentials to perform the validation. This becomes even more challenging when dealing with multiple microservices in several environments (e.g., prod, dev, etc.).

[Kubeval][3] and [kubeconform][4] are CLI tools developed to validate Kubernetes manifests without requiring a running Kubernetes environment. Because kubeconform was inspired by kubeval, they operate similarly; verification is performed against pre-generated JSON schemas created from the OpenAPI specifications ([swagger.json][5]) for each Kubernetes version. All that remains [to run][6] the schema validation tests is to point the tool executable to a single manifest, directory or pattern.

![Kubeval and kubeconform ][7]

(Eyar Zilberman, [CC BY-SA 4.0][8])

### Comparing the tools

Now that you're aware of the tools available for Kubernetes schema validation, let's compare some core abilities—misconfiguration coverage, speed tests, support for different versions, Custom Resource Definitions support, and docs—in:

  * kubeval
  * kubeconform
  * kubectl dry-run in client mode
  * kubectl dry-run in server mode



#### Misconfiguration coverage

I donned my QA hat and generated some (basic) Kubernetes manifest files with some [intentional misconfigurations][9] and then ran them against all four tools.

Misconfig/Tool |

kubeval /
kubeconform

|

kubectl dry-run
in client mode

|

kubectl dry-run
in server mode

---|---|---|---
[API deprecation][10] | ✅ Caught | ✅ Caught | ✅ Caught
[Invalid kind value][11] | ✅ Caught | ❌ Didn't catch | ✅ Caught
[Invalid label value][12] | ❌ Didn't catch | ❌ Didn't catch | ✅ Caught
[Invalid protocol type][13] | ✅ Caught | ❌ Didn't catch | ✅ Caught
[Invalid spec key][14] | ✅ Caught | ✅ Caught | ✅ Caught
[Missing image][15] | ❌ Didn't catch | ❌ Didn't catch | ✅ Caught
[Wrong K8s indentation][16] | ✅ Caught | ✅ Caught | ✅ Caught

In summary: all misconfiguration was caught by `kubectl` dry-run in server mode.

Some misconfigurations were caught by everything:

  * Invalid spec key: Caught successfully by everything!
  * API deprecation: Caught successfully by everything!
  * Wrong k8s indentation: Caught successfully by everything!



However, some had mixed results:

  * Invalid kind value: Caught by Kubeval / Kubeconform but missed by Kubectl client.
  * Invalid protocol type: Caught by Kubeval / Kubeconform but missed by Kubectl client.
  * Invalid label value: Missed by both Kubeval / Kubeconform and Kubectl client.
  * Missing image: Missed by both Kubeval / Kubeconform and Kubectl client.



Conclusion: Running kubectl dry-run in server mode caught all misconfigurations, while kubeval/kubeconform missed two of them. It's also interesting to see that running kubectl dry-run in client mode is almost useless because it's missing some obvious misconfigurations and also requires a connection to a running Kubernetes environment.

  * All the schemas validation tests were performed against Kubernetes version 1.18.0.
  * Because kubeconform is based on kubeval, they provide the same result when run against the files with the misconfigurations.
  * kubectl is one tool, but each mode (client or server) produces a different result (as you can see from the table).



#### Benchmark speed test

I used [hyperfine][17] to benchmark the execution time of each tool. First, I ran it against all the [files with misconfigurations][18] (seven files in total). Then I ran it against [100 Kubernetes files][19] (all the files contain the same config).

Results for running the tools against seven files with different Kubernetes schema misconfigurations:

Tool | Mean | Min | Max
---|---|---|---
kubeconform | 0.2 ms ± 0.3 ms | 0.0 ms | 2.3 ms
kubeval | 1.443 s ± 1.551 s | 0.741 s | 5.842 s
kubectl --dry-run=client | 1.92 s ± 0.035 s | 1.872 s | 2.009 s
kubectl --dry-run=server | 2.288 s ± 0.027 s | 2.241 s | 2.323 s

Results for running the tools against 100 files with valid Kubernetes schemas:

Tool | Mean | Min | Max
---|---|---|---
kubeconform | 0.3 ms ± 0.3 ms | 0.0 ms | 1.9 ms
kubeval | 1.152 s ± 0.197 s | 0.989 s | 1.669 s
kubectl --dry-run=client | 1.274 s ± 0.028 s | 1.234 s | 1.313 s
kubectl --dry-run=server | 60.675 s ± 0.546 s | 60.489 s | 62.228 s

Conclusion: While kubeconform (#1), kubeval (#2), and kubectl `--dry-run=client` (#3) provide fast results on both tests, kubectl `--dry-run=server` (#4) is slower, especially when it evaluates 100 files. Yet 60 seconds for generating a result is still a good outcome in my opinion.

#### Kubernetes versions support

Both kubeval and kubeconform accept the Kubernetes schema version as a flag. Although both tools are similar (as mentioned, kubeconform is based on kubeval), one of the key differences is that each tool relies on its own set of pre-generated JSON schemas:

  * **Kubeval:** [instrumenta/kubernetes-json-schema][20] (last commit: [133f848][21] on April 29, 2020)
  * **Kubeconform:** [yannh/kubernetes-json-schema][22] (last commit: [a660f03][23] on May 15, 2021)



As of May 2021, kubeval supports Kubernetes schema versions only up to 1.18.1, while kubeconform supports the latest Kubernetes schema available, 1.21.0. With kubectl, it's a little bit trickier. I don't know which version of kubectl introduced the dry run, but I tried it with Kubernetes version 1.16.0 and it still worked, so I know it's available in Kubernetes versions 1.16.0–1.18.0.

The variety of supported Kubernetes schemas is especially important if you want to migrate to a new Kubernetes version. With kubeval and kubeconform, you can set the version and start evaluating which configurations must be changed to support the cluster upgrade.

Conclusion: The fact that kubeconform has all the schemas for all the different Kubernetes versions available—and also doesn't require Minikube setup (as kubectl does)—makes it a superior tool when comparing these capabilities to its alternatives.

### Other things to consider

#### Custom Resource Definition (CRD) support

Both kubectl dry-run and kubeconform support the [CRD][24] resource type, while kubeval does not. According to kubeval's docs, you can pass a flag to kubeval to tell it to ignore missing schemas so that it will not fail when testing a bunch of manifests where only some are resource type CRD.

#### Documentation

Kubeval is a more popular project than kubeconform; therefore, its community and [documentation][25] are more extensive. Kubeconform doesn't have official docs, but it does have a [well-written README][26] file that explains its capabilities pretty well. The interesting part is that although Kubernetes-native tools such as kubectl are usually well-documented, it was really hard to find the information needed to understand how the `dry-run` flag works and its limitations.

Conclusion: Although it's not as famous as kubeval, the CRD support and good-enough documentation make kubeconform the winner, in my opinion.

### Strategies for validating Kubernetes schema using these tools

Now that you know the pros and cons of each tool, here are some best practices for leveraging them within your Kubernetes production-scale development flow:

  * ⬅️ Shift-left: When possible, the best setup is to run `kubectl --dry-run=server` on every code change. You probably can't do that because you can't allow every developer or CI machine in your organization to have a connection to your cluster. So, the second-best effort is to run kubeconform.
  * 🚔 Because kubeconform doesn't cover all common misconfigurations, it's recommended to run it with a policy enforcement tool on every code change to fill the coverage gap.
  * 💸 Buy vs. build: If you enjoy the [engineering overhead][27], then kubeconform + [conftest][28] is a great combination of tools to get good coverage. Alternatively, there are tools that can provide you with an out-of-the-box experience to help you save time and resources, such as [Datree][29] (whose schema validation is powered by kubeconform).
  * 🚀 During the CD step, it shouldn't be a problem to connect with your cluster, so you should always run `kubectl --dry-run=server` before deploying your new code changes.
  * 👯 Another option for using kubectl dry-run in server mode, without having a connection to your Kubernetes environment, is to run Minikube + `kubectl --dry-run=server`. The downside of this hack is that you must also set up the Minikube cluster like prod (i.e., same volumes, namespace, etc.), or you'll encounter errors when trying to validate your Kubernetes manifests.



_Thank you to_ [_Yann Hamon_][30] _for creating kubeconform—it's awesome! This article wouldn't be possible without you. Thank you for all of your guidance._

* * *

_This article originally appeared on [Datree.io][31] and is reprinted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/kubernetes-schema-validation

作者：[Eyar Zilberman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/eyarz
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_analytics_cloud.png?itok=eE4uIoaB (Net catching 1s and 0s or data in the clouds)
[2]: https://github.com/kubernetes/enhancements/blob/master/keps/sig-api-machinery/576-dry-run/README.md
[3]: https://github.com/instrumenta/kubeval/tree/master/kubeval
[4]: https://github.com/yannh/kubeconform
[5]: https://raw.githubusercontent.com/kubernetes/kubernetes/master/api/openapi-spec/swagger.json
[6]: https://github.com/datreeio/kubernetes-schema-validation#running-schema-validation-tests
[7]: https://opensource.com/sites/default/files/uploads/kubeval-and-kubeconform.png (Kubeval and kubeconform )
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://github.com/datreeio/kubernetes-schema-validation#misconfigs
[10]: https://github.com/datreeio/kubernetes-schema-validation#api-deprecationyaml
[11]: https://github.com/datreeio/kubernetes-schema-validation#invalid-kind-valueyaml
[12]: https://github.com/datreeio/kubernetes-schema-validation#invalid-label-valueyaml
[13]: https://github.com/datreeio/kubernetes-schema-validation#invalid-protocol-typeyaml
[14]: https://github.com/datreeio/kubernetes-schema-validation#invalid-spec-keyyaml
[15]: https://github.com/datreeio/kubernetes-schema-validation#missing-imageyaml
[16]: https://github.com/datreeio/kubernetes-schema-validation#wrong-k8s-indentationyaml
[17]: https://github.com/sharkdp/hyperfine
[18]: https://github.com/datreeio/kubernetes-schema-validation/tree/main/misconfigs
[19]: https://github.com/datreeio/kubernetes-schema-validation/tree/main/benchmark
[20]: https://github.com/instrumenta/kubernetes-json-schema
[21]: https://github.com/instrumenta/kubernetes-json-schema/commit/133f84871ccf6a7a7d422cc40e308ae1c044c2ab
[22]: https://github.com/yannh/kubernetes-json-schema
[23]: https://github.com/yannh/kubernetes-json-schema/commit/a660f03314fad36fb4cbfb4fa2f9a76b7766cf51
[24]: https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/
[25]: https://kubeval.instrumenta.dev/
[26]: https://github.com/yannh/kubeconform/blob/master/Readme.md
[27]: https://jrott.com/posts/why-buy/
[28]: https://www.conftest.dev/
[29]: https://hub.datree.io/schema-validation/?utm_source=our_blog&utm_medium=schema-validation
[30]: https://github.com/yannh
[31]: https://www.datree.io/resources/kubernetes-schema-validation
