Latching Mutations with GitOps
============================================================

Immutable Infrastructure has become a hot topic recently. I’ve written a [couple][1] of [posts][2] about it, and I think the term should be more strict than how it’s usually used. In my opinion, total immutability of infrastructure is a good aspiration, but not very practical.

The definition of “infrastructure” itself is blurred. Your app devs are now operators; [they operate their own code, on top of a platform you provide][3]. They specify the version and size and number of the containers running their product code. That’s  _their_  infrastructure, and no-one would argue that a new cluster should be stood up every time they want to push a new version. The raison d’être of the cloud-native movement is to enable them to do that  _more_ and  _faster_ .

No system really can be fully immutable (are  _you_  writing everything in Haskell?). [Cindy Sridharan notes][4] that entropy will always build up, and one major source of that is the churn of the apps running atop your platform. It makes sense to let these apps change in place. (Immutable Architecture is a different beast — never changing the set of  _services _ provided by those apps by e.g. using protobuf to make sure the total API set only grows).

In response to a new build of an app, or adding one to its replica count, its cluster can be completely replaced with one containing the new version/scale, or it can be mutated in place (i.e. Pods replaced or added). While the latter might seem eminently more sensible, whichever you chose is kind of irrelevant to the argument I’m about to make. That said, I think it’s important to talk about the following in the context of the current conversation around immutable infrastructure.

* * *

[Alexis Richardson][5] has been posting a phenomenal series about “[GitOps][6]”*, providing great processes for controllable changes to infrastructure. Kelsey Hightower [has spoken about][7] applying the same principles to app deployment — a separate “infrastructure” repo for the Kubernetes definitions behind your apps, and deployments thereof by Pull Request.

 _*(In short: his thesis is that everything you run should be declared in git. Automated tooling keeps your clusters in sync with that single declaration of truth. All changes are mediated and discussed through Pull Requests coming in from dev branches.)_ 

If a cluster catches fire, so be it. A new one is started, and Weave Flux re-deploys everything that was previously running, because it’s all declared in git. Right? Well, should  _everything _ about the system be declared in git? My first reaction was “yes” — declare everything in git, bring it all under control. But what about something like application scale? We can  _guess_  at this a priori, but it’s ultimately a function of the environment — of actual user traffic rates — not of some engineering best-practice. And we certainly don’t want it done ad-hoc, with a dev watching CPU loads in grafana and raising a PR every minute.

Let’s consider the opposite: what if scale isn’t declared at all? Kelsey Hightower has said it shouldn’t be, so that an HPA can be used. But what if a system has traffic necessitating 10,000 Pods? If that cluster needs recovering, the result will be a Deployment of  _one_  Pod. That will be totally overwhelmed by the traffic, probably compound the problem by failing its healthcheck, and certainly offer no useful service to its users.

So I assert that we do want the scale declared in git. And, although the required scale is a function of the environment and can only be known empirically, that loop should be automated too; this is the essence of DevOps. Consider a tool that watches the Deployment and auto-commits each new scale (like a reverse Weave Flux). Even with a separate (app) infrastructure repo, that would be so noisy that actual version upgrades wouldn’t be easily spotted.

With dynamic properties like scale, being roughly right is good enough. The CPU target is always 70 or 80%, so there’s headroom. It’s sufficient just to declare a nearby round number: a multiple of 10, or an order of magnitude. This is what I suggest; auto-committing the closest round number of your current scale. This will get the system back to a place where it can  _cope._  It might be a bit slow, or a bit wasteful, but it won’t die. Declare enough to get the system back up with one click, and let the HPA take the fine-tuning from there.

From a manageability point-of-view, this “latching” behaviour keeps systems declared  _well enough_  in git, whilst not overloading operators with commits so numerous that they cease to have any value. This way, for example, they still function as audit logs — 3 users but a replica count of 10k probably means a computational complexity problem (or DoS attack) deserving attention. The automated tool could even PR each latch so it can be eyeballed to decide if its intentions are pure.

In GitOps terms, the “desired state”, i.e. that declared in git, is a rollback checkpoint; some things  _are_  meant to change, but if those changes go wrong, git will always describe the last, good, consistent state that you should go back to. All I’m saying is that a scale from 1 to 10,000 is something that’s material and should be checkpointed along the way. Think of it as a write-back cache maybe.

Clearly tools like kubediff either need to ignore this field, or understand the round-numbers latching policy.

Minimum scale should still be specified (it’s a function of your users’ SLAs, though it lived in the infra repo not code repo, as it’s the empirical result of that SLA married to a load test). Similarly, max scalecan and should also be specified, again as a result of load testing (the point at which you’ve determined that 2nd order effects and the Universal scalability law kill you). These bounds are a function of the users’ requirements and the codebase, whereas run-time scale results from the environment.

As a further example, take blue-green rollouts. If a cluster is recovered from git that was an unknown way through a roll-out, what state should be recreated? It’s wasteful to go back to 100% v1, if it was 90% through upgrading to v2\. Conversely, it’s unsafe to go all-out with v2 if the scant 1% that had been rolled out had failed their health-checks. I posit that the in-flight ReplicaSets should be watched their major progress milestones latched in git.

* * *

In conclusion, changes are inevitable. Whether you scale apps by adding more Pods to an existing cluster, or even if you do make a whole new cluster of  _n_ Pods every time, the problem is the same: some changes have to happen in response to the environment, rather than by operator diktat. Even with a mutating cluster, for purposes of recovery, audit, and easy roll-forwards, you still want an up-to-date description of every material aspect of it in git, but without overwhelming your tooling or operators. By  _latching_ , you capture the important details, while being pragmatic about the amount of incidental churn you want to be bothered by.

matt. @[mt165pro][8]

--------------------------------------------------------------------------------

via: https://medium.com/@mt165/latching-mutations-with-gitops-92155e84a404

作者：[Matt Turner ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@mt165?source=post_header_lockup
[1]:https://medium.com/@mt165/immutable-definitions-f7e61593e3b0
[2]:https://medium.com/@mt165/a-spectrum-of-mutability-3f527268a146
[3]:https://www.youtube.com/watch?v=nMLyr8q5AWE
[4]:https://twitter.com/copyconstruct/status/954133874002477056
[5]:https://twitter.com/monadic
[6]:https://www.weave.works/blog/gitops-operations-by-pull-request
[7]:https://youtu.be/07jq-5VbBVQ?t=900
[8]:https://twitter.com/mt165pro
