Translating by qhwdw
# LEAST PRIVILEGE CONTAINER ORCHESTRATION


The Docker platform and the container has become the standard for packaging, deploying, and managing applications. In order to coordinate running containers across multiple nodes in a cluster, a key capability is required: a container orchestrator.

![container orchestrator](https://i0.wp.com/blog.docker.com/wp-content/uploads/f753d4e8-9e22-4fe2-be9a-80661ef696a8-3.jpg?resize=536%2C312&ssl=1)

Orchestrators are responsible for critical clustering and scheduling tasks, such as:

*   Managing container scheduling and resource allocation.

*   Support service discovery and hitless application deploys.

*   Distribute the necessary resources that applications need to run.

Unfortunately, the distributed nature of orchestrators and the ephemeral nature of resources in this environment makes securing orchestrators a challenging task. In this post, we will describe in detail the less-considered—yet vital—aspect of the security model of container orchestrators, and how Docker Enterprise Edition with its built-in orchestration capability, Swarm mode, overcomes these difficulties.

Motivation and threat model
============================================================

One of the primary objectives of Docker EE with swarm mode is to provide an orchestrator with security built-in. To achieve this goal, we developed the first container orchestrator designed with the principle of least privilege in mind.

In computer science,the principle of least privilege in a distributed system requires that each participant of the system must only have access to  the information and resources that are necessary for its legitimate purpose. No more, no less.

> #### ”A process must be able to access only the information and resources that are necessary for its legitimate purpose.”

#### Principle of Least Privilege

Each node in a Docker EE swarm is assigned role: either manager or worker. These roles define a coarsegrained level of privilege to the nodes: administration and task execution, respectively. However, regardless of its role, a node has access only to the information and resources it needs to perform the necessary tasks, with cryptographically enforced guarantees. As a result, it becomes easier to secure clusters against even the most sophisticated attacker models: attackers that control the underlying communication networks or even compromised cluster nodes.

# Secure-by-default core

There is an old security maxim that states: if it doesn’t come by default, no one will use it. Docker Swarm mode takes this notion to heart, and ships with secure-by-default mechanisms to solve three of the hardest and most important aspects of the orchestration lifecycle:

1.  Trust bootstrap and node introduction.

2.  Node identity issuance and management.

3.  Authenticated, Authorized, Encrypted information storage and dissemination.

Let’s look at each of these aspects individually

### Trust Bootstrap and Node Introduction

The first step to a secure cluster is tight control over membership and identity. Without it, administrators cannot rely on the identities of their nodes and enforce strict workload separation between nodes. This means that unauthorized nodes can’t be allowed to join the cluster, and nodes that are already part of the cluster aren’t able to change identities, suddenly pretending to be another node.

To address this need, nodes managed by Docker EE’s Swarm mode maintain strong, immutable identities. The desired properties are cryptographically guaranteed by using two key building-blocks:

1.  Secure join tokens for cluster membership.

2.  Unique identities embedded in certificates issued from a central certificate authority.

### Joining the Swarm

To join the swarm, a node needs a copy of a secure join token. The token is unique to each operational role within the cluster—there are currently two types of nodes: workers and managers. Due to this separation, a node with a copy of a worker token will not be allowed to join the cluster as a manager. The only way to get this special token is for a cluster administrator to interactively request it from the cluster’s manager through the swarm administration API.

The token is securely and randomly generated, but it also has a special syntax that makes leaks of this token easier to detect: a special prefix that you can easily monitor for in your logs and repositories. Fortunately, even if a leak does occur, tokens are easy to rotate, and we recommend that you rotate them often—particularly in the case where your cluster will not be scaling up for a while.

![Docker Swarm](https://i1.wp.com/blog.docker.com/wp-content/uploads/92d171d4-52c7-4702-8143-110c6f52017c-2.jpg?resize=547%2C208&ssl=1)

### Bootstrapping trust

As part of establishing its identity, a new node will ask for a new identity to be issued by any of the network managers. However, under our threat model, all communications can be intercepted by a third-party. This begs the question: how does a node know that it is talking to a legitimate manager?

![Docker Security](https://i0.wp.com/blog.docker.com/wp-content/uploads/94e3fef0-5bd2-4970-b9e9-25b566d926ad-2.jpg?resize=528%2C348&ssl=1)

Fortunately, Docker has a built-in mechanism for preventing this from happening. The join token, which the host uses to join the swarm, includes a hash of the root CA’s certificate. The host can therefore use one-way TLS and use the hash to verify that it’s joining the right swarm: if the manager presents a certificate not signed by a CA that matches the hash, the node knows not to trust it.

### Node identity issuance and management

Identities in a swarm are embedded in x509 certificates held by each individual node. In a manifestation of the least privilege principle, the certificates’ private keys are restricted strictly to the hosts where they originate. In particular, managers do not have access to private keys of any certificate but their own.

### Identity Issuance

To receive their certificates without sharing their private keys, new hosts begin by issuing a certificate signing request (CSR), which the managers then convert into a certificate. This certificate now becomes the new host’s identity, making the node a full-fledged member of the swarm!

#### 
![](https://i0.wp.com/blog.docker.com/wp-content/uploads/415ae6cf-7e76-4ba8-9d84-6d49bf327d8f-2.jpg?resize=548%2C350&ssl=1)

When used alongside with the secure bootstrapping mechanism, this mechanism for issuing identities to joining nodes is secure by default: all communicating parties are authenticated, authorized and no sensitive information is ever exchanged in clear-text.

### Identity Renewal

However, securely joining nodes to a swarm is only part of the story. To minimize the impact of leaked or stolen certificates and to remove the complexity of managing CRL lists, Swarm mode uses short-lived certificates for the identities. These certificates have a default expiration of three months, but can be configured to expire every hour!

![Docker secrets](https://i0.wp.com/blog.docker.com/wp-content/uploads/55e2ab9a-19cd-465d-82c6-fa76110e7ecd-2.jpg?resize=556%2C365&ssl=1)

This short certificate expiration time means that certificate rotation can’t be a manual process, as it usually is for most PKI systems. With swarm, all certificates are rotated automatically and in a hitless fashion. The process is simple: using a mutually authenticated TLS connection to prove ownership over a particular identity, a Swarm node generates regularly a new public/private key pair and sends the corresponding CSR to be signed, creating a completely new certificate, but maintaining the same identity.

### Authenticated, Authorized, Encrypted information storage and dissemination.

During the normal operation of a swarm, information about the tasks has to be sent to the worker nodes for execution. This includes not only information on which containers are to be executed by a node;but also, it includes  all the resources that are necessary for the successful execution of that container, including sensitive secrets such as private keys, passwords, and API tokens.

### Transport Security

The fact that every node participating in a swarm is in possession of a unique identity in the form of a X509 certificate, communicating securely between nodes is trivial: nodes can use their respective certificates to establish mutually authenticated connections between one another, inheriting the confidentiality, authenticity and integrity properties of TLS.

![Swarm Mode](https://i0.wp.com/blog.docker.com/wp-content/uploads/972273a3-d9e5-4053-8fcb-a407c8cdcbf6-2.jpg?resize=347%2C271&ssl=1)

One interesting detail about Swarm mode is the fact that it uses a push model: only managers are allowed to send information to workers—significantly reducing the surface of attack manager nodes expose to the less privileged worker nodes.

### Strict Workload Separation Into Security Zones

One of the responsibilities of manager nodes is deciding which tasks to send to each of the workers. Managers make this determination using a variety of strategies; scheduling the workloads across the swarm depending on both the unique properties of each node and each workload.

In Docker EE with Swarm mode, administrators have the ability of influencing these scheduling decisions by using labels that are securely attached to the individual node identities. These labels allow administrators to group nodes together into different security zones limiting the exposure of particularly sensitive workloads and any secrets related to them.

![Docker Swarm Security](https://i0.wp.com/blog.docker.com/wp-content/uploads/67ffa551-d4ae-4522-ba13-4a646a158592-2.jpg?resize=546%2C375&ssl=1)

### Secure Secret Distribution

In addition to facilitating the identity issuance process, manager nodes have the important task of storing and distributing any resources needed by a worker. Secrets are treated like any other type of resource, and are pushed down from the manager to the worker over the secure mTLS connection.

![Docker Secrets](https://i1.wp.com/blog.docker.com/wp-content/uploads/4341da98-2f8c-4aed-bb40-607246344dd8-2.jpg?resize=508%2C326&ssl=1)

On the hosts, Docker EE ensures that secrets are provided only to the containers they are destined for. Other containers on the same host will not have access to them. Docker exposes secrets to a container as a temporary file system, ensuring that secrets are always stored in memory and never written to disk. This method is more secure than competing alternatives, such as [storing them in environment variables][12]. Once a task completes the secret is gone forever.

### Storing secrets

On manager hosts secrets are always encrypted at rest. By default, the key that encrypts these secrets (known as the Data Encryption Key, DEK) is also stored in plaintext on disk. This makes it easy for those with minimal security requirements to start using Docker Swarm mode.

However, once you are running a production cluster, we recommend you enable auto-lock mode. When auto-lock mode is enabled, a newly rotated DEK is encrypted with a separate Key Encryption Key (KEK). This key is never stored on the cluster; the administrator is responsible for storing it securely and providing it when the cluster starts up. This is known as unlocking the swarm.

Swarm mode supports multiple managers, relying on the Raft Consensus Algorithm for fault tolerance. Secure secret storage scales seamlessly in this scenario. Each manager host has a unique disk encryption key, in addition to the shared key. Furthermore, Raft logs are encrypted on disk and are similarly unavailable without the KEK when in autolock mode.

### What happens when a node is compromised?

![Docker Secrets](https://i0.wp.com/blog.docker.com/wp-content/uploads/2a78b37d-bbf0-40ee-a282-eb0900f71ba9-2.jpg?resize=502%2C303&ssl=1)

In traditional orchestrators, recovering from a compromised host is a slow and complicated process. With Swarm mode, recovery is as easy as running the docker node rm command. This removes the affected node from the cluster, and Docker will take care of the rest, namely re-balancing services and making sure other hosts know not to talk to the affected node.

As we have seen, thanks to least privilege orchestration, even if the attacker were still active on the host, they would be cut off from the rest of the network. The host’s certificate — its identity — is blacklisted, so the managers will not accept it as valid.

# Conclusion

Docker EE with Swarm mode ensures security by default in all key areas of orchestration:

*   Joining the cluster. Prevents malicious nodes from joining the cluster.

*   Organizing hosts into security zones. Prevents lateral movement by attackers.

*   Scheduling tasks. Tasks will be issued only to designated and allowed nodes.

*   Allocating resources. A malicious node cannot “steal” another’s workload or resources.

*   Storing secrets. Never stored in plaintext and never written to disk on worker nodes.

*   Communicating with the workers. Encrypted using mutually authenticated TLS.

As Swarm mode continues to improve, the Docker team is working to take the principle of least privilege orchestration even further. The task we are tackling is: how can systems remain secure if a manager is compromised? The roadmap is in place, with some of the features already available such as the ability of whitelisting only specific Docker images, preventing managers from executing arbitrary workloads. This is achieved quite naturally using Docker Content Trust.

--------------------------------------------------------------------------------

via: https://blog.docker.com/2017/10/least-privilege-container-orchestration/

作者：[Diogo Mónica ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.docker.com/author/diogo/
[1]:http://www.linkedin.com/shareArticle?mini=true&url=http://dockr.ly/2yZoNdy&title=Least%20Privilege%20Container%20Orchestration&summary=The%20Docker%20platform%20and%20the%20container%20has%20become%20the%20standard%20for%20packaging,%20deploying,%20and%20managing%20applications.%20In%20order%20to%20coordinate%20running%20containers%20across%20multiple%20nodes%20in%20a%20cluster,%20a%20key%20capability%20is%20required:%20a%20container%20orchestrator.Orchestrators%20are%20responsible%20for%20critical%20clustering%20and%20scheduling%20tasks,%20such%20as:%20%20%20%20Managing%20...
[2]:http://www.reddit.com/submit?url=http://dockr.ly/2yZoNdy&title=Least%20Privilege%20Container%20Orchestration
[3]:https://plus.google.com/share?url=http://dockr.ly/2yZoNdy
[4]:http://news.ycombinator.com/submitlink?u=http://dockr.ly/2yZoNdy&t=Least%20Privilege%20Container%20Orchestration
[5]:https://blog.docker.com/author/diogo/
[6]:https://blog.docker.com/tag/docker-orchestration/
[7]:https://blog.docker.com/tag/docker-secrets/
[8]:https://blog.docker.com/tag/docker-security/
[9]:https://blog.docker.com/tag/docker-swarm/
[10]:https://blog.docker.com/tag/least-privilege-orchestrator/
[11]:https://blog.docker.com/tag/tls/
[12]:https://diogomonica.com/2017/03/27/why-you-shouldnt-use-env-variables-for-secret-data/


