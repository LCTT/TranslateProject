translating---geekpi

Cloud Integrated Advanced Orchestrator
============================================================

Cloud Integrated Advanced Orchestrator (ciao) is a new workload scheduler designed to address limitations in current cloud OS projects. Ciao provides a lightweight, fully TLS-based, minimal Config. It is workload-agnostic, easily updateable, has an optimized-for-speed scheduler, and is currently optimized for OpenStack*.

Design decisions and the innovative approach were informed by requirements for security, scalability, usability, and deployability:

**Scalability:** The initial design targets are to scale past 5,000 nodes. Thus, the scheduler architecture is approached in a new way:

In ciao, decision-making is decentralized. It is based on a pull model, allowing compute nodes to request jobs from the scheduling agent. The scheduler is always aware of the launchers capacities, never asking for updates, and the scheduling decision time is kept to a minimum. Launchers asynchronously send capacity to the scheduler.

Tracking of persistent state is separated from scheduler decision-making, allowing the scheduler to remain lightweight. This separation increases reliability, scalability, and performance. The result is that the scheduler gets out of the way and is not a bottleneck.

**Usability:** Virtual machines, containers, and bare metal are integrated into one scheduler; all workloads are treated as equal citizens. For further ease of use, networking is simplified with a minimalist, asynchronous protocol between components, requiring minimal configuration. Ciao also includes a new, simple UI. Integration of all these functions leads to simpler installation, configuration, maintenance, and operation.

**Ease of Deployment:** Upgrade should be the expectation, not the exception. This new architecture, with decentralization of state, allows for seamless upgrades. To make sure that the infrastructure (e.g. OpenStack) is always up to date, a Continuous Integration/Continuous Delivery (CI/CD) model is implemented. Ciao is designed so that one can kill any Ciao component on the fly, replace it, and restart it with minimal impact on availability.

**Security is mandatory:** Connections to the scheduler are always encrypted: SSL is on by default, not off. Encryption is from end to end: HTTPS is required for all external connections, and internal communication between components is TLS-based. Integration of networking support guarantees tenant separation.

Initial results are proving to be significant: 10k Docker Containers and 5k VM’s in 65 seconds. Further optimization is ongoing.

Documentation: [https://clearlinux.org/documentation/ciao/ciao.html][3]

Github link: [https://github.com/01org/ciao(link is external)][1]

Mailing list link: [https://lists.clearlinux.org/mailman/listinfo/ciao-devel][2]

--------------------------------------------------------------------------------

via: https://clearlinux.org/ciao

作者：[ciao][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://clearlinux.org/ciao
[1]:https://github.com/01org/ciao
[2]:https://lists.clearlinux.org/mailman/listinfo/ciao-devel
[3]:https://clearlinux.org/documentation/ciao/ciao.html
