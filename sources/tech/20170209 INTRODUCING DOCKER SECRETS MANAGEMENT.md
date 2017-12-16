
translating by HardworkFish

INTRODUCING DOCKER SECRETS MANAGEMENT
============================================================

Containers are changing how we view apps and infrastructure. Whether the code inside containers is big or small, container architecture introduces a change to how that code behaves with hardware – it fundamentally abstracts it from the infrastructure. Docker believes that there are three key components to container security and together they result in inherently safer apps.

 ![Docker Security](https://i2.wp.com/blog.docker.com/wp-content/uploads/e12387a1-ab21-4942-8760-5b1677bc656d-1.jpg?w=1140&ssl=1) 

A critical element of building safer apps is having a secure way of communicating with other apps and systems, something that often requires credentials, tokens, passwords and other types of confidential information—usually referred to as application secrets. We are excited to introduce Docker Secrets, a container native solution that strengthens the Trusted Delivery component of container security by integrating secret distribution directly into the container platform.

With containers, applications are now dynamic and portable across multiple environments. This  made existing secrets distribution solutions inadequate because they were largely designed for static environments. Unfortunately, this led to an increase in mismanagement of application secrets, making it common to find insecure, home-grown solutions, such as embedding secrets into version control systems like GitHub, or other equally bad—bolted on point solutions as an afterthought.

### Introducing Docker Secrets Management

We fundamentally believe that apps are safer if there is a standardized interface for accessing secrets. Any good solution will also have to follow security best practices, such as encrypting secrets while in transit; encrypting secrets at rest; preventing secrets from unintentionally leaking when consumed by the final application; and strictly adhere to the principle of least-privilege, where an application only has access to the secrets that it needs—no more, no less.

By integrating secrets into Docker orchestration, we are able to deliver a solution for the secrets management problem that follows these exact principles.

The following diagram provides a high-level view of how the Docker swarm mode architecture is applied to securely deliver a new type of object to our containers: a secret object.

 ![Docker Secrets Management](https://i0.wp.com/blog.docker.com/wp-content/uploads/b69d2410-9e25-44d8-aa2d-f67b795ff5e3.jpg?w=1140&ssl=1) 

In Docker, a secret is any blob of data, such as a password, SSH private key, TLS Certificate, or any other piece of data that is sensitive in nature. When you add a secret to the swarm (by running `docker secret create`), Docker sends the secret over to the swarm manager over a mutually authenticated TLS connection, making use of the [built-in Certificate Authority][17] that gets automatically created when bootstrapping a new swarm.

```
$ echo "This is a secret" | docker secret create my_secret_data -
```

Once the secret reaches a manager node, it gets saved to the internal Raft store, which uses NACL’s Salsa20Poly1305 with a 256-bit key to ensure no data is ever written to disk unencrypted. Writing to the internal store gives secrets the same high availability guarantees that the the rest of the swarm management data gets.

When a swarm manager starts up, the encrypted Raft logs containing the secrets is decrypted using a data encryption key that is unique per-node. This key, and the node’s TLS credentials used to communicate with the rest of the cluster, can be encrypted with a cluster-wide key encryption key, called the unlock key, which is also propagated using Raft and will be required on manager start.

When you grant a newly-created or running service access to a secret, one of the manager nodes (only managers have access to all the stored secrets stored) will send it over the already established TLS connection exclusively to the nodes that will be running that specific service. This means that nodes cannot request the secrets themselves, and will only gain access to the secrets when provided to them by a manager – strictly for the services that require them.

```
$ docker service  create --name="redis" --secret="my_secret_data" redis:alpine
```

The  unencrypted secret is mounted into the container in an in-memory filesystem at /run/secrets/<secret_name>.

```
$ docker exec $(docker ps --filter name=redis -q) ls -l /run/secrets
total 4
-r--r--r--    1 root     root            17 Dec 13 22:48 my_secret_data
```

If a service gets deleted, or rescheduled somewhere else, the manager will immediately notify all the nodes that no longer require access to that secret to erase it from memory, and the node will no longer have any access to that application secret.

```
$ docker service update --secret-rm="my_secret_data" redis

$ docker exec -it $(docker ps --filter name=redis -q) cat /run/secrets/my_secret_data

cat: can't open '/run/secrets/my_secret_data': No such file or directory
```

Check out the [Docker secrets docs][18] for more information and examples on how to create and manage your secrets. And a special shout out to Laurens Van Houtven (https://www.lvh.io/[)][19] in collaboration with the Docker security and core engineering team to help make this feature a reality.

[Get safer apps for dev and ops w/ new #Docker secrets management][5]

[CLICK TO TWEET][6]

### 
![Docker Security](https://i2.wp.com/blog.docker.com/wp-content/uploads/Screenshot-2017-02-08-23.30.13.png?resize=1032%2C111&ssl=1)

### Safer Apps with Docker

Docker secrets is designed to be easily usable by developers and IT ops teams to build and run safer apps. Docker secrets is a container first architecture designed to keep secrets safe and used only when needed by the exact container that needs that secret to operate. From defining apps and secrets with Docker Compose through an IT admin deploying that Compose file directly in Docker Datacenter, the services, secrets, networks and volumes will travel securely, safely with the application.

Resources to learn more:

*   [Docker Datacenter on 1.13 with Secrets, Security Scanning, Content Cache and More][7]

*   [Download Docker][8] and get started today

*   [Try secrets in Docker Datacenter][9]

*   [Read the Documentation][10]

*   Attend an [upcoming webinar][11]

--------------------------------------------------------------------------------

via: https://blog.docker.com/2017/02/docker-secrets-management/

作者：[ Ying Li][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.docker.com/author/yingli/
[1]:http://www.linkedin.com/shareArticle?mini=true&url=http://dockr.ly/2k6gnOB&title=Introducing%20Docker%20Secrets%20Management&summary=Containers%20are%20changing%20how%20we%20view%20apps%20and%20infrastructure.%20Whether%20the%20code%20inside%20containers%20is%20big%20or%20small,%20container%20architecture%20introduces%20a%20change%20to%20how%20that%20code%20behaves%20with%20hardware%20-%20it%20fundamentally%20abstracts%20it%20from%20the%20infrastructure.%20Docker%20believes%20that%20there%20are%20three%20key%20components%20to%20container%20security%20and%20...
[2]:http://www.reddit.com/submit?url=http://dockr.ly/2k6gnOB&title=Introducing%20Docker%20Secrets%20Management
[3]:https://plus.google.com/share?url=http://dockr.ly/2k6gnOB
[4]:http://news.ycombinator.com/submitlink?u=http://dockr.ly/2k6gnOB&t=Introducing%20Docker%20Secrets%20Management
[5]:https://twitter.com/share?text=Get+safer+apps+for+dev+and+ops+w%2F+new+%23Docker+secrets+management+&via=docker&related=docker&url=http://dockr.ly/2k6gnOB
[6]:https://twitter.com/share?text=Get+safer+apps+for+dev+and+ops+w%2F+new+%23Docker+secrets+management+&via=docker&related=docker&url=http://dockr.ly/2k6gnOB
[7]:http://dockr.ly/AppSecurity
[8]:https://www.docker.com/getdocker
[9]:http://www.docker.com/trial
[10]:https://docs.docker.com/engine/swarm/secrets/
[11]:http://www.docker.com/webinars
[12]:https://blog.docker.com/author/yingli/
[13]:https://blog.docker.com/tag/container-security/
[14]:https://blog.docker.com/tag/docker-security/
[15]:https://blog.docker.com/tag/secrets-management/
[16]:https://blog.docker.com/tag/security/
[17]:https://docs.docker.com/engine/swarm/how-swarm-mode-works/pki/
[18]:https://docs.docker.com/engine/swarm/secrets/
[19]:https://lvh.io%29/
