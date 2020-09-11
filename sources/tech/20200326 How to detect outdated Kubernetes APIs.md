[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to detect outdated Kubernetes APIs)
[#]: via: (https://opensource.com/article/20/3/deprek8)
[#]: author: (Tyler Auerbeck https://opensource.com/users/tylerauerbeck)

How to detect outdated Kubernetes APIs
======
Deprek8 and Conftest alert you about deprecated APIs that threaten to
slip into your codebase.
![Ship captain sailing the Kubernetes seas][1]

Recently, deprecated APIs have been wreaking havoc on everyone's [Kubernetes][2] manifests. Why is this happening?!? It's because the objects that we've come to know and love are moving on to their new homes. And it's not like this happened overnight. Deprecation warnings have been in place for quite a few releases now. We've all just been lazy and thought the day would never come. Well, _it's here_!

So, maybe it caught up to us this time. But we'll be prepared next time, right?!? Yeah, that's what we said last time. But what if we could put something in place that makes sure that this doesn't happen?

### What is Deprek8?

[Deprek8][3] is a set of [Open Policy Agent][4] (OPA) policies that allow you to check your repository for deprecated API versions. These policies offer a way to provide warnings and errors when something is in the process of being or has already been deprecated. But **Deprek8** is just a set of policies that define what to watch for. How do you actually actively use these policies in order to monitor for deprecations?

There are a number of ways and tools that can do this; one way is to use the OPA Deprek8 policy.

### What is the OPA Deprek8 policy?

OPA is "an open source, general-purpose policy engine that enables unified, context-aware policy enforcement." In other words, OPA provides a means of establishing and enforcing a set of policies based upon a policy file. The policies are defined in a file (or set of files) using the [Rego query language][5]. This use case won't necessarily rely on the OPA application, but more specifically, it uses this query language to do the heavy lifting. By using Rego, you can check whether various manifests match certain criteria and then either warn or error them out based on your definition. For example, in Kubernetes 1.16, the Deployment object can no longer be served from the **extensions/v1beta1 apiVersion**. So in your .rego file, you could have something like:


```
_deny = msg {
  resources := ["Deployment"]
  input.apiVersion == "extensions/v1beta1"
  input.kind == resources[_]
  msg := sprintf("%s/%s: API extensions/v1beta1 for %s is no longer served by default, use apps/v1 instead.", [input.kind, input.metadata.name, input.kind])
}
```

This would alert that you have a deprecated manifest and print a message like:

> Deployment/myDeployment: API extensions/v1beta1 for Deployment is no longer served by default, use apps/v1 instead.

That's great! This is exactly what you need in order to avoid having old manifests lying around. But these are just the policies; you need something that will check these policies and put them into action.

### Conftest

This is where [Conftest][6] comes in. Conftest is a utility that allows you to put Rego policies into action against any number of configuration files. According to the repo, Conftest currently supports:


```
 - YAML
 - JSON
 - INI
 - TOML
 - HOCON
 - HCL
 - CUE
 - Dockerfile
 - HCL2 (Experimental)
 - EDN
 - VCL
 - XML
```

It has some fairly strict defaults (i.e., expecting policy files to be in certain locations), but they can be overridden with the appropriate flags if you have a layout that you prefer. If you want to know more about those specifics, please consult the [documentation][7] in the repository.

For example, you can run any policy file on Conftest with a command like:


```
`helm template --set podSecurityPolicy.enabled=true --set server.ingress.enabled=true . | conftest -p mypolicy.rego -`
```

This would generate the appropriate output from a Helm template and pipe it directly to the Conftest utility. Conftest inspects that output against any policies defined in the **mypolicy.rego** file and then gives any appropriate warnings or errors for objects that match against those policies. You can, of course, swap out any templating tooling of your choice, or you can feed specific files directly to the Conftest tool.

So now you have the tools to set your policies and enforce them against your configuration files. But how do you tie these two things together? Better yet: How do you automate this process to continuously monitor the codebase to make sure you never fall behind the deprecation line again?

### Using Git to run checks

There are many methods and tools to run checks against code. By adding similar steps to your continuous integration (CI) tooling (e.g., Jenkins, Tekton, etc.), you can accomplish the same goal. In this very basic use case, I used [GitHub Actions][8], a new feature of GitHub repositories.

GitHub Actions allows you to automate your entire workflow, so you don't have to sit in front of your keyboard and hack all of this together. With Actions, you can string together any number of steps into a workflow (or multiple workflows) by either rolling your own Actions if you're doing something custom or, in most cases, using something that already exists in the [Marketplace][9]. Luckily, others have provided Actions to do the things you need to do for this example, so you can lean on the community's expertise to pull your workflow together.

As described in the steps above, the workflow looks something like:

  1. Retrieve the Deprek8 policy you need and store it somewhere for later use.
  2. Run Conftest against the appropriate files/charts with the policy file you grabbed in step 1.



What does this boil down to? Well, all you really need to do is to use curl to pull your policy file and then run it through Conftest after pointing to your code, using the [curl][10] and [Conftest][11] Actions. Since these Actions already exist, you don't need to write any custom code! And as I'm sure you can tell by the names, they allow you to run the associated commands without having to do any custom work to pre-process anything or pull down any binaries.

Now that you have the Actions you need to use, how do you pull them together? This is where your workflow comes into play. While Actions are the pieces of code that get things done, they're useless without a way to string them together so that they can be triggered by some event. A GitHub Action workflow will look something like this:


```
name: Some Awesome Workflow Name
on: An Event That Triggers Our Workflow
jobs:
  awesome-job-name:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - name: awesome-step-name
        uses: someorg/someaction@version
        with:
          args: some args that I might pass to someaction
```

Now you have a workflow that has multiple steps, can be triggered by a specific GitHub event, and can be passed a set of parameters (if that is applicable to that specific Action). This example is _extremely basic_. But luckily, the workflow you're trying to put together is equally simple. This shouldn't be taken as a comprehensive example of a GitHub Action, as there are many more complicated (and elegant) things you can do. If you're interested in learning more, take a look at the [GitHub Actions documentation][12].

Now that you have an idea of what a workflow looks like and know what Actions you're interested in using, take a run at plugging the two together. For this example, you want to make sure that whenever your code is updated, it's checked to make sure it's not using any deprecated APIs.

First, rig up your workflow with some names and the events that you want to trigger off of. Give your workflow and job a useful name that will help you identify it (and what it does).


```
name: API Deprecation Check
on: pull_request, push
jobs:
 deprecation-check:
```

Next, you need to tell your workflow that you want to trigger these Actions based on any **pull_request** or **push** that happens to this repository because these are the two main events that get new code into a repository. You can do this by utilizing the **on** keyword.


```
name: API Deprecation Check
on: pull_request, push
jobs:
  deprecation-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
```

Then, add where you want these Actions to run and how the Action can get the code. You can tell the Action where to run by using the **runs-on** keyword. You have a few options here: Windows, Mac, or Ubuntu. In most cases, using Ubuntu is fine, as you'll frequently rely on Actions that run inside their own container (versus running on the base OS that you define here). It's also very important to understand that an Action does not check out code by default. When you need to do something that interacts with your code, make sure to use the Action **actions/checkout**. When this is included, your code will be available within your Action, and you can pass that through to the next step in your workflow.


```
name: API Deprecation Check
on: pull_request, push
name: API Deprecation Check
jobs:
  deprecation-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - name: curl
        uses: wei/curl@master
        with:
          args: <https://raw.githubusercontent.com/naquada/deprek8/master/policy/deprek8.rego> &gt; /github/home/deprek8.rego
```

Now that your code is checked out, you can start preparing to do something with it. As mentioned, before you can check code for deprecations, you first need the file that contains the policies that you want to check for, so just retrieve the file using the **curl** Action. This is a fairly straightforward Action, in that it accepts whatever parameters you would normally pass into the curl command. If you were doing something more complicated, this is where you could pass in things like specific HTTP Actions, headers, etc. However, in this case, you're just trying to retrieve a file, so the only thing you need to pass to your Action is the URL you want to retrieve (in this case, the one that contains your raw policy file) and then tell it where you want to write that file. In this case, you're going to have it write to **/github/home**. Why? It's because this filesystem persists between steps and will allow you to use the policy file within this next step.


```
name: API Deprecation Check
on: pull_request, push
jobs:
  deprecation-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - name: curl
        uses: wei/curl@master
        with:
          args: <https://raw.githubusercontent.com/naquada/deprek8/master/policy/deprek8.rego> &gt; /github/home/deprek8.rego
      - name: Check helm chart for deprecation
        uses: instrumenta/conftest-action/helm@master
        with:
          chart: nginx-test
          policy: /github/home/deprek8.rego
```

Now that you have your policy file, it's just a matter of running it against the code via **conftest**. Similar to the **curl** Action, the **conftest** Action just expects a series of parameters to understand how it should run against the code. In the example above, it runs against a Helm chart, but it can run against a specific file (or set of files) by changing the **uses** value to **instrumenta/[conftest-action@master][13]**. Just point to the path where your chart sits in the repository and then provide the path to your policy file (specified in the previous step). Once you have all of this together, you have a complete workflow. But what does this look like (assuming there's some bad code in your Helm chart)? To find out, take a look at the [example repository][14].

In the Nginx Helm chart, you'll notice that one of the templates is a [statefulset][15]. You may also notice that the apiVersion the StatefulSet is using is **apps/v1beta1**. This API was deprecated in Kubernetes 1.16 and is now hosted in **apps/v1**. So when your GitHub Actions workflow runs, it should detect this issue and serve an error like:


```
FAIL - StatefulSetf/web: API apps/v1beta1 is no longer served by default, use apps/v1 instead.
Error: plugin "conftest" exited with error
##[error]Docker run failed with exit code 1
```

The Action indicates there is something wrong and then fails the rest of the Action. You can see the [full workflow][16] if you are interested.

### Wrapping up

This workflow will save some future heartache by alerting you to any deprecated APIs that slip into your codebase. To be clear, this is an _alerting_ mechanism. This won't prevent you from merging bad code into your codebase. But, as long as you pay attention, you should be completely aware prior to (or just after) merging problematic code.

Where do you go from here? Well, there are a few things to keep in mind. Currently, Deprek8 is up to date as of Kubernetes 1.16. If you're interested in more recent versions, I'm sure Deprek8 would be happy to accept your [pull request][3].

The other shortcoming of this method is that the **conftest** and GitHub Actions are a bit limited in that they only allow you to point at specific files or a single chart at a time. What if you want to point at multiple directories of manifests or have multiple charts inside your repository? Currently, the only way to get around that is to either list out every single file you're interested in (in the case of having multiple charts) or have multiple steps inside your workflow. Other scenarios could become problematic, like other templating engines that require some custom logic to pair the parameters and template files together. But a simple workaround for that could be to have a step in your workflow that pulls down Conftest along with a tiny inline script to loop through some of this. I'm sure there are more elegant solutions (and if you come up with one, I'm sure these projects would be more than happy to take a look at your PR).

Regardless, you now have a mechanism that should allow you to sleep a bit easier when checking in your code! And hopefully, this method will help you build even more robust workflows to protect your code.

* * *

_This was originally published in [Tyler Auerbeck's GitHub repository][17] and is reposted, with edits, with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/deprek8

作者：[Tyler Auerbeck][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tylerauerbeck
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://opensource.com/resources/what-is-kubernetes
[3]: https://github.com/naquada/deprek8
[4]: https://github.com/open-policy-agent/opa
[5]: https://blog.openpolicyagent.org/opas-full-stack-policy-language-caeaadb1e077
[6]: https://github.com/instrumenta/conftest
[7]: https://github.com/instrumenta/conftest/tree/master/docs
[8]: https://github.com/features/actions
[9]: https://github.com/marketplace?type=actions
[10]: https://github.com/marketplace/actions/github-action-for-curl
[11]: https://github.com/instrumenta/conftest-action
[12]: https://help.github.com/en/actions
[13]: mailto:conftest-action@master
[14]: https://github.com/tylerauerbeck/deprek8-example
[15]: https://raw.githubusercontent.com/tylerauerbeck/deprek8-example/master/nginx-test/templates/statefulset.yaml
[16]: https://github.com/tylerauerbeck/deprek8-example/runs/426774566?check_suite_focus=true
[17]: https://github.com/tylerauerbeck/writing/blob/master/opa/deprek8.md
