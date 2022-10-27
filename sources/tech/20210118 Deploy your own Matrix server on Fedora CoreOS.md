[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Deploy your own Matrix server on Fedora CoreOS)
[#]: via: (https://fedoramagazine.org/deploy-your-own-matrix-server-on-fedora-coreos/)
[#]: author: (Clément VernaTimothée Ravier https://fedoramagazine.org/author/cverna/https://fedoramagazine.org/author/siosm/)

Deploy your own Matrix server on Fedora CoreOS
======

![][1]

Today it is very common for open source projects to distribute their software via container images. But how can these containers be run securely in production? This article explains how to deploy a Matrix server on Fedora CoreOS.

### What is Matrix?

Matrix provides an open source, federated and optionally end-to-end encrypted communication platform.

From [matrix.org][2]:

> Matrix is an open source project that publishes the Matrix open standard for secure, decentralised, real-time communication, and its Apache licensed reference implementations.

Matrix also includes bridges to other popular platforms such as Slack, IRC, XMPP and Gitter. Some open source communities are replacing IRC with Matrix or adding Matrix as an new communication channel (see for example [Mozilla][3], [KDE][4], and Fedora).

Matrix is a [federated][5] communication platform. If you host your own server, you can join conversations hosted on other Matrix instances. This makes it great for self hosting.

### What is Fedora CoreOS?

From the [Fedora CoreOS docs][6]:

> Fedora CoreOS is an automatically updating, minimal, monolithic, container-focused operating system, designed for clusters but also operable standalone, optimized for Kubernetes but also great without it.

With Fedora CoreOS (FCOS), you get all the benefits of Fedora (podman, cgroups v2, SELinux) packaged in a minimal automatically updating system thanks to rpm-ostree.

To get more familiar with Fedora CoreOS basics, check out this getting started article:

> [Getting started with Fedora CoreOS][7]

### Creating the Fedora CoreOS configuration

Running a Matrix service requires the following software:

  * [**Synapse**][8]: a Matrix server
  * [**PostgreSQL**][9]: a database
  * [**Nginx**][10]: a web server
  * [**Let’s Encrypt**][11]: a certificate provider
  * [**Element**][12]: a Matrix web client



This guide will demonstrate how to run all of the above software in containers on the same FCOS server. All the services will all be configured to run under [podman][13] container engines.

### Assembling the FCCT configuration

Configuring and provisioning these containers on the host requires an [Ignition][14] file. [FCCT][15] generates the ignition file using a YAML configuration file as input. On Fedora Linux you can install FCCT using _dnf_:

```
$ sudo dnf install fcct
```

A [GitHub repository][16] is available for the reader, it contains all the configuration needed and a basic template system to simplify the personnalisation of the configuration. These template values use the _%%VARIABLE%%_ format and each variable is defined in a file named _[secrets][17]_.

#### User and ssh access

The first configuration step is to define an SSH key for the default user _core_.

```
variant: fcos
version: 1.3.0
passwd:
  users:
    - name: core
      ssh_authorized_keys:
        - %%SSH_PUBKEY%%
```

#### Cgroups v2

Fedora CoreOS comes with cgroups version 1 by default, but it can be configured to use cgroups v2. Using the latest version of cgroups allows for better control of the host resources among other new features.

Switching to cgroups v2 is done via a systemd service that modifies the kernel arguments and reboots the host on first boot.

```
systemd:
  units:
    - name: cgroups-v2-karg.service
      enabled: true
      contents: |
        [Unit]
        Description=Switch To cgroups v2
        After=systemd-machine-id-commit.service
        ConditionKernelCommandLine=systemd.unified_cgroup_hierarchy
        ConditionPathExists=!/var/lib/cgroups-v2-karg.stamp
        [Service]
        Type=oneshot
        RemainAfterExit=yes
        ExecStart=/bin/rpm-ostree kargs --delete=systemd.unified_cgroup_hierarchy
        ExecStart=/bin/touch /var/lib/cgroups-v2-karg.stamp
        ExecStart=/bin/systemctl --no-block reboot
        [Install]
        WantedBy=multi-user.target
```

#### Podman pod

Podman supports the creation of pods. Pods are quite handy when you need to group containers together within the same network namespace. Containers within a pod can communicate with each other using the _localhost_ address.

Create and configure a pod to run the different services needed by Matrix:

```
- name: podmanpod.service
  enabled: true
  contents: |
    [Unit]
    Description=Creates a podman pod to run the matrix services.
    After=cgroups-v2-karg.service network-online.target
    Wants=After=cgroups-v2-karg.service network-online.target
    [Service]
    Type=oneshot
    RemainAfterExit=yes
    ExecStart=sh -c 'podman pod exists matrix || podman pod create -n matrix -p 80:80 -p 443:443 -p 8448:8448'
    [Install]
    WantedBy=multi-user.target
```

Another advantage of using a pod is that we can control which ports are exposed to the host from the pod as a whole. Here we expose the ports 80, 443 (HTTP and HTTPS) and 8448 (Matrix federation) to the host to make these services available outside of the pod.

#### A web server with Let’s Encrypt support

The Matrix protocol is HTTP based. Clients connect to their homeserver via HTTPS. Federation between Matrix homeservers is also done over HTTPS. For this setup, you will need three domains. Using distinct domains helps to isolate each service and protect against [cross-site scripting (XSS) vulnerabilities][18].

  * **example.tld**: The base domain for your homeserver. This will be part of the user Matrix IDs (for example: @username:example.tld).
  * **matrix.example.tld**: The sub-domain for your [Synapse][8] Matrix server.
  * **chat.example.tld**: The sub-domain for your [Element][12] web client.



To simplify the configuration, you only need to set your own domain once in the secrets file.

You will need to ask Let’s Encrypt for certificates on first boot for each of the three domains. Make sure that the domains are configured beforehand to resolve to the IP address that will be assigned to your server. If you do not know what IP address will be assigned to your server in advance, you might want to use another ACME challenge method to get Let’s Encrypt certificates (see [DNS Plugins][19]).

```
- name: certbot-firstboot.service
  enabled: true
  contents: |
    [Unit]
    Description=Run certbot to get certificates
    ConditionPathExists=!/var/srv/matrix/letsencrypt-certs/archive
    After=podmanpod.service network-online.target nginx-http.service
    Wants=network-online.target
    Requires=podmanpod.service nginx-http.service

    [Service]
    Type=oneshot
    ExecStart=/bin/podman run \
                  --name=certbot \
                  --pod=matrix \
                  --rm \
                  --cap-drop all \
                  --volume /var/srv/matrix/letsencrypt-webroot:/var/lib/letsencrypt:rw,z \
                  --volume /var/srv/matrix/letsencrypt-certs:/etc/letsencrypt:rw,z \
                  docker.io/certbot/certbot:latest \
                  --agree-tos --webroot certonly

    [Install]
    WantedBy=multi-user.target
```

Once the certificates are available, you can start the final instance of _nginx_. Nginx will act as an HTTPS reverse proxy for your services.

```
- name: nginx.service
  enabled: true
  contents: |
    [Unit]
    Description=Run the nginx server
    After=podmanpod.service network-online.target certbot-firstboot.service
    Wants=network-online.target
    Requires=podmanpod.service certbot-firstboot.service

    [Service]
    ExecStartPre=/bin/podman pull docker.io/nginx:stable
    ExecStart=/bin/podman run \
                  --name=nginx \
                  --pull=always \
                  --pod=matrix \
                  --rm \
                  --volume /var/srv/matrix/nginx/nginx.conf:/etc/nginx/nginx.conf:ro,z \
                  --volume /var/srv/matrix/nginx/dhparam:/etc/nginx/dhparam:ro,z \
                  --volume /var/srv/matrix/letsencrypt-webroot:/var/www:ro,z \
                  --volume /var/srv/matrix/letsencrypt-certs:/etc/letsencrypt:ro,z \
                  --volume /var/srv/matrix/well-known:/var/well-known:ro,z \
                  docker.io/nginx:stable
    ExecStop=/bin/podman rm --force --ignore nginx

    [Install]
    WantedBy=multi-user.target
```

Because Let’s Encrypt certificates have a short lifetime, they must be renewed frequently. Set up a system timer to automate their renewal:

```
- name: certbot.timer
  enabled: true
  contents: |
    [Unit]
    Description=Weekly check for certificates renewal
    [Timer]
    OnCalendar=Sun --* 02:00:00
    Persistent=true
    [Install]
    WantedBy=timers.target
- name: certbot.service
  enabled: false
  contents: |
  [Unit]
  Description=Let's Encrypt certificate renewal
  ConditionPathExists=/var/srv/matrix/letsencrypt-certs/archive
  After=podmanpod.service network-online.target
  Wants=network-online.target
  Requires=podmanpod.service
  [Service]
  Type=oneshot
  ExecStart=/bin/podman run \
                --name=certbot \
                --pod=matrix \
                --rm \
                --cap-drop all \
                --volume /var/srv/matrix/letsencrypt-webroot:/var/lib/letsencrypt:rw,z \
                --volume /var/srv/matrix/letsencrypt-certs:/etc/letsencrypt:rw,z \
                docker.io/certbot/certbot:latest \
                renew
  ExecStartPost=/bin/systemctl restart --no-block nginx.service
```

#### Synapse and database

Finally, configure the Synapse server and PostgreSQL database.

The Synapse server requires a configuration and secrets keys to be generated. Follow the GitHub repository’s [README][20] file section to generate those.

Once these steps completed, add a systemd service using podman to run Synapse as a container:

```
- name: synapse.service
  enabled: true
  contents: |
    [Unit]
    Description=Run the synapse service.
    After=podmanpod.service network-online.target
    Wants=network-online.target
    Requires=podmanpod.service
    [Service]
    ExecStart=/bin/podman run \
                  --name=synapse \
                  --pull=always  \
                  --read-only \
                  --pod=matrix \
                  --rm \
                  -v /var/srv/matrix/synapse:/data:z \
                  docker.io/matrixdotorg/synapse:v1.24.0
    ExecStop=/bin/podman rm --force --ignore synapse
    [Install]
    WantedBy=multi-user.target
```

Setting up the PostgreSQL database is very similar. You will also need to provide a _POSTGRES_PASSWORD_, in the repository’s secrets file and declare a systemd service (check [here][21] for all the details).

#### Setting the Fedora CoreOS host

FCCT provides a _storage_ directive which is useful for creating directories and adding files on the Fedora CoreOS host.

The following configuration makes sure that the configuration needed by each service is present under _/var/srv/matrix._ Each service has a dedicated directory. For example _/var/srv/matrix/nginx_ and _/var/srv/matrix/synapse_. These directories are mounted by podman as volumes when the containers are started.

```
storage:
  directories:
    - path: /var/srv/matrix
      mode: 0700
    - path: /var/srv/matrix/synapse/media_store
      mode: 0777
    - path: /var/srv/matrix/postgres
    - path: /var/srv/matrix/letsencrypt-webroot
  trees:
    - local: synapse
      path: /var/srv/matrix/synapse
    - local: nginx
      path: /var/srv/matrix/nginx
    - local: nginx-http
      path: /var/srv/matrix/nginx-http
    - local: letsencrypt-certs
      path: /var/srv/matrix/letsencrypt-certs
    - local: well-known
      path: /var/srv/matrix/well-known
    - local: element-web
      path: /var/srv/matrix/element-web
  files:
    - path: /etc/postgresql_synapse
      contents:
        local: postgresql_synapse
      mode: 0700
```

#### Auto-updates

You are now ready to setup the most powerful part of Fedora CoreOS ‒ auto-updates. On Fedora CoreOS, the system is automatically updated and restarted approximately once every two weeks for each new Fedora CoreOS release. On startup, all containers will be updated to the latest version (because the _pull=always_ option is set). The containers are stateless and volume mounts are used for any data that needs to be persistent across reboots.

The PostgreSQL container is an exception. It can not be fully updated automatically because it requires manual intervention for major releases. However, it will still be updated with new patch releases to fix security issues and bugs as long as the specified version is supported ([approximately five years][22]). Be aware that Synapse might start requiring a newer version before support ends. Consequently, you should plan a manual update approximately once per year for new PostgreSQL releases. The steps to update PostgreSQL are documented in [this project’s README][23].

To maximise availability and avoid service interruptions in the middle of the day, set an [update strategy in Zincati’s configuration][24] to only allow reboots for updates during certain periods of time. For example, one might want to restrict reboots to week days between 2 AM and 4 AM UTC. Make sure to pick the correct time for your timezone. Fedora CoreOS uses the UTC timezone by default. Here is an example configuration snippet that you could append to your _config.yaml_:

```
[updates]
strategy = "periodic"

[[updates.periodic.window]]
days = [ "Mon", "Tue", "Wed", "Thu", "Fri" ]
start_time = "02:00"
length_minutes = 120
```

### Creating your own Matrix server by using the git repository

Some sections where lightly edited to make this article easier to read but you can find the full, unedited configuration in [this GitHub repository][16]. To host your own server from this configuration, fill in the secrets values and generate the full configuration with _fcct_ via the provided _Makefile_:

```
$ cp secrets.example secrets
${EDITOR} secrets
# Fill in values not marked as generated by synapse
```

Next, generate the [Synapse secrets][25] and include them in the secrets file. Finally, you can build the final configuration with _make_:

```
$ make
# This will generate the config.ign file
```

You are now ready to deploy your Matrix homeserver on Fedora CoreOS. Follow the instructions for your platform of choice [from the documentation][26] to proceed.

### Registering new users

What’s a service without users? Open registration was disabled by default to avoid issues. You can re-enable open registration in the Synapse configuration if you are up for it. Alternatively, even with open registration disabled, it is possible to add new users to your server via the command line:

```
$ sudo podman run --rm --tty --interactive \
       --pod=matrix \
       -v /var/srv/matrix/synapse:/data:z,ro \
       --entrypoint register_new_matrix_user \
       docker.io/matrixdotorg/synapse:latest \
       -c /data/homeserver.yaml http://127.0.0.1:8008
```

### Conclusion

You are now ready to join the Matrix federated universe! Enjoy your quickly deployed and automatically updating Matrix server! Remember that auto-updates are made as safe as possible by the fact that if anything breaks, you can either rollback the system to the previous version or use the previous container image to work around any bugs while they are being fixed. Being able to quickly setup a system that will be kept updated and secure is the main advantage of the Fedora CoreOS model.

To go further, take a look at this other article that is taking advantage of Terraform to generate the configuration and directly deploy Fedora CoreOS on your platform of choice.

> [Deploy Fedora CoreOS servers with Terraform][27]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/deploy-your-own-matrix-server-on-fedora-coreos/

作者：[Clément VernaTimothée Ravier][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/cverna/https://fedoramagazine.org/author/siosm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/01/matrix-816x345.jpg
[2]: https://matrix.org/
[3]: https://wiki.mozilla.org/Matrix
[4]: https://community.kde.org/Matrix
[5]: https://matrix.org/faq/#what-does-federated-mean%3F
[6]: https://docs.fedoraproject.org/en-US/fedora-coreos/
[7]: https://fedoramagazine.org/getting-started-with-fedora-coreos/
[8]: https://github.com/matrix-org/synapse
[9]: https://www.postgresql.org/
[10]: https://www.nginx.com/
[11]: https://letsencrypt.org/
[12]: https://github.com/vector-im/element-web
[13]: https://podman.io/getting-started/
[14]: http://coreos.github.io/ignition/
[15]: https://coreos.github.io/fcct/getting-started/#container
[16]: https://github.com/travier/fedora-coreos-matrix
[17]: https://github.com/travier/fedora-coreos-matrix/tree/173cb59df81de531e9dc32798a6e4ff553cf6e79#how-to-use
[18]: https://en.wikipedia.org/wiki/Cross-site_scripting#Background
[19]: https://certbot.eff.org/docs/using.html#dns-plugins
[20]: https://github.com/travier/fedora-coreos-matrix/tree/173cb59df81de531e9dc32798a6e4ff553cf6e79#configuring-synapse
[21]: https://github.com/travier/fedora-coreos-matrix/blob/173cb59df81de531e9dc32798a6e4ff553cf6e79/config.yaml#L48
[22]: https://www.postgresql.org/support/versioning/
[23]: https://github.com/travier/fedora-coreos-matrix#postgresql-major-version-updates
[24]: https://coreos.github.io/zincati/usage/updates-strategy/#periodic-strategy
[25]: https://github.com/travier/fedora-coreos-matrix#configuring-synapse
[26]: https://docs.fedoraproject.org/en-US/fedora-coreos/getting-started/
[27]: https://fedoramagazine.org/deploy-fedora-coreos-with-terraform/
