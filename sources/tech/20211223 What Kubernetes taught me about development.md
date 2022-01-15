[#]: subject: "What Kubernetes taught me about development"
[#]: via: "https://opensource.com/article/21/12/kubernetes-developer"
[#]: author: "Noaa Barki https://opensource.com/users/noaa-barki"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What Kubernetes taught me about development
======
Why policy management was the key to understanding Kubernetes and the
DevOps pipeline.
![Ships at sea on the web][1]

As a full-stack developer, especially a front-end developer, DevOps technologies and the way DevOps developers think were always a mystery to me. When the company I work for launched a new command-line interface (CLI) application called [Gatekeeper][2], I jumped into the world of DevOps and Kubernetes, and what I learned turned out to be very valuable. I now have a much better understanding of Kubernetes and the DevOps pipeline, and I can better explain how our CLI application supports them both.

Here is my story.

### About me

My name is Noaa Barki. I've been a full-stack developer for more than five years, and I work at a fantastic company called Datree, where we help developers and DevOps engineers prevent Kubernetes (K8s) misconfigurations from ever reaching production.

### Understanding the problem

Picture this: you've had a long week, but it's Friday now and you're dreaming peacefully, ready for a long weekend. Your weekend comes sooner than expected, however, because at 03:46 AM you wake up to the sound of your phone after 15 missed calls from work. Apparently, you forgot to add a memory limit in one of the deployments, which caused a memory leak in one of the containers, which caused all the Kubernetes nodes to run out of memory.

How could this have happened? Your DevOps team put so much effort into educating developers about K8s and the importance of the memory limit.

To avoid accidents like this, you have to set requirements for an ideal solution and search for platforms and libraries that help prevent misconfigurations from ever affecting your cluster. Actual requirements may differ based on your infrastructure, but here's a good example:

  * **Enforce policy restrictions on development:** A way to enforce restrictions before they apply resources to the cluster
  * **Enable restrictions management:** ****Flexible management of the restrictions in a dedicated place across the entire organization, which empowers administrators to have complete control over all their systems
  * **Educate about best practices:** Liberate the DevOps team from the constant need to review, fence, and future-proof all possible pitfalls on all current and future use cases that are part of the self-deployment.



Working as a developer is all about solving real-life problems, but sometimes context makes all the difference. You have to understand how a problem occurs in the first place before you can work to solve it effectively.

  * Why do organizations adopt K8s at all?
  * What is the role of the DevOps engineer?
  * And most of all, for whom am I developing my application?



### Who are DevOps engineers?

Initially, I knew very little about DevOps engineer personas and next to nothing about their tech, especially Kubernetes. I read, researched, and interviewed my DevOps friends about their jobs and responsibilities. I asked questions like:

  * What are your daily goals?
  * Who are your customers?
  * What do your days look like?



It took me a while, but after a few months, I finally found the answer—or, to be honest, the courage to experience the work of DevOps.

Surprisingly, the thing that helped the most was acknowledging that we just think in different terms. DevOps engineers have to zoom out in their minds. They start with the smallest application component, then scale and build on top of it, like an onion.

Developers, on the other hand, can start from the same app component, but they're used to thinking in the opposite direction: from the high level to the bits and bytes of the software. Developers peel off the layers—from the server, to the service, to the function, to the variable, to its memory allocation—until we reach the smallest component. Each one works on the opposite edge of the pipeline, but we both work on the same pipeline.

This made me wonder, what if the solution were somewhere _along_ the pipeline, something both sides can integrate?

Wondering whether the solution should be part of the pipeline led me to think about what else DevOps and developers might have in common. I thought about my workflows as a developer and compared them to the DevOps developers' workflows until suddenly, it hit me:

**We All Have Policies.**

### Why you can't always rely on OPA

Developers and engineers all have standards and best practices that we try to maintain to be more confident in our work. As a developer, I use [SOLID and clean code principles][3], unit tests, and integration tests, and I try to learn all the best practices of every technology I use.

One morning I asked my CEO: "As a DevOps engineer, what are your policies? What do you use to create and manage your policies?" He looked me in the eye and said one word: "OPA."

#### What is OPA?

OPA, an acronym for Open Policy Agent, is like a super engine. You can write all your policies in it, then execute it with each input to check whether it violates any policies and, if so, in what way. The main idea behind OPA is the ability to decouple the policy decision-making logic from the policy-enforcement usage.

Suppose you work in multiservices architecture. You might have to make policy decisions, for example, when that microservice receives an API request (like authorization). That logic is based on predicted rules in your organization, so, in this case, you can offload and unify all your decision-making logic to a dedicated service: OPA.

#### How to use OPA

  1. **Integrate with OPA:** If your services are written in Go, you can embed OPA as a package within your project. Otherwise, you can deploy OPA as a host-level daemon.
  2. **Write and store your policies:** To define your policies in OPA, you need to write them in [Rego][4] and send them to OPA. This way, whenever you use OPA for policy enforcement, OPA will query the input against these policies.
  3. **Request policy evaluation:** When your application needs to make a policy decision, it will send an API query request using JSON, containing all the required data via HTTP.



#### When OPA isn't sufficient

As you can see, OPA answers the need for policy management and enforcement across an organization, because it is an excellent utility-based tool and provides a magnificent infrastructure solution. However, OPA also requires a lot of heavy lifting and configuration, generally too much for a company in the middle of intensive growth.

When it comes to policies in K8s, OPA isn't tailored for small teams, because DevOps engineers can still spend too much time fixing emergencies. Using OPA isn't always the best way to enforce K8s policies, but investigating it gave me a sense of what policies are in the DevOps world.

### Using ConfTest—almost there!

ConfTest enables you to write tests for any structured file and is specially designed to be used with CI or local testing. You can think of it as a unit-testing library for structured files. ConfTest is built on top of OPA.

ConfTest's primary purpose is its `test` command:

`$ conftest test deployment.yaml`

This accepts the path for the files you want to test, then evaluates all the policies on those files. By default, all the policies (unit tests) should be placed in a directory called policy, but you can override this. Since it's built on top of OPA, the policies must also be written in Rego.

Additionally, ConfTest provides the ability to push and pull policies from any Open Container Initiative (OCI) registry (such as Dockerhub, Quay.io, and others).

#### The problem with ConfTest

At first glance, ConfTest seems like the perfect solution. You don't need to deploy a service like OPA, yet the ability to pull and push from OCI registries means you can unify your policies in dedicated spaces and therefore get more control. The real power of ConfTest is when it's used in the CI process, which makes K8s maintenance clearer for developers who are accustomed to testing their code and integrating with it continuously.

Unfortunately, ConfTest doesn't offer enough policy management power. Unifying policies in a dedicated location is not enough. What if you want to execute a group of policies on one service and another on a different service? You'd still need a way to leverage the tests in the CI process while also grouping the policies.

Studying ConfTest made me realize that the real issue is not only about enforcing what you'll push to the cluster at the moment, but also what you can or might push tomorrow. It's like unit tests; it exists to keep you confident that any current or future changes to the code will not harm existing production. You need a solution that will enforce policies for the future and the past.

### DevOps, Kubernetes, and me

Now that I've ruled out other methods of enforcing policies, it's time to go on the next adventure and start to study Kubernetes.

If you're a developer who wants to go on a K8s adventure with me, I have three tips that I would like to share with you.

#### K8s for developers: tips and guidelines

  * **Learn about CI/CD:** If you want to start learning about K8s, it's essential to know what exactly happens in the CI/CD pipeline, the differences between CI and CD, and why, last but not least, your company uses it at all. I started with the smallest component that I thought I understood—one of our microservices—and drew a chart with all the resources and the environments connected to it. I wrote down everything that happens from the moment I commit my code until it magically appears in my production environment.

  * **Learn your platform:** Using Kubernetes takes a lot of configuration work that may not be related to Kubernetes itself. You need to understand how your platform works, which resources you use and need, and how they're connected from a networking perspective.

  * **Understand deployment:** Deployment is probably the most common expression I have heard in DevOps, but what is it, really? Is it a Kubernetes resource? A process? An artifact? In Kubernetes, deployment means the "state of my application."




What interested me most, however, was the CLI application I mentioned earlier, Gatekeeper. Learning about OPA Gatekeeper taught me the need to acquire visibility and pass through the loop of all the policies—seeing what's out of compliance and then taking action to fix things. In addition to my article on [Gatekeeper][2], I also recommend reading [Gatekeeper's docs][5].

#### My personal mantra

The sense of accomplishment that comes from delivering a solution using technology with creativity and ingenuity is the reason I'm a developer. Our job as developers isn't about writing code but about real-life problems. Not every bug is worth solving, not every feature is worth coding, and not all messy code is worth refactoring. Code must have a purpose: otherwise, it shouldn't be written at all.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/kubernetes-developer

作者：[Noaa Barki][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/noaa-barki
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/kubernetes_containers_ship_lead.png?itok=9EUnSwci (Ships at sea on the web)
[2]: https://opensource.com/article/21/12/kubernetes-gatekeeper
[3]: https://opensource.com/article/19/10/test-driven-development-best-practices
[4]: https://www.openpolicyagent.org/docs/latest/#rego
[5]: https://open-policy-agent.github.io/gatekeeper/website/docs/
