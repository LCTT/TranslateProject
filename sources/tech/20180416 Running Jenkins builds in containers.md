Running Jenkins builds in containers
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_scale_performance.jpg?itok=R7jyMeQf)
Running applications in containers has become a well-accepted practice in the enterprise sector, as [Docker][1] with [Kubernetes][2] (K8s) now provides a scalable, manageable application platform. The container-based approach also suits the [microservices architecture][3] that's gained significant momentum in the past few years.

One of the most important advantages of a container application platform is the ability to dynamically bring up isolated containers with resource limits. Let's check out how this can change the way we run our continuous integration/continuous development (CI/CD) tasks.

Building and packaging an application requires an environment that can download the source code, access dependencies, and have the build tools installed. Running unit and component tests as part of the build may use local ports or require third-party applications (e.g., databases, message brokers, etc.) to be running. In the end, we usually have multiple, pre-configured build servers with each running a certain type of job. For tests, we maintain dedicated instances of third-party apps (or try to run them embedded) and avoid running jobs in parallel that could mess up each other's outcome. The pre-configuration for such a CI/CD environment can be a hassle, and the required number of servers for different jobs can significantly change over time as teams shift between versions and development platforms.

Once we have access to a container platform (onsite or in the cloud), it makes sense to move the resource-intensive CI/CD task executions into dynamically created containers. In this scenario, build environments can be independently started and configured for each job execution. Tests during the build have free reign to use available resources in this isolated box, while we can also bring up a third-party application in a side container that exists only for this job's lifecycle.

It sounds nice… Let's see how it works in real life.

Note: This article is based on a real-world solution for a project running on a [Red Hat OpenShift][4] v3.7 cluster. OpenShift is the enterprise-ready version of Kubernetes, so these practices work on a K8s cluster as well. To try, download the [Red Hat CDK][5] and run the `jenkins-ephemeral` or `jenkins-persistent` [templates][6] that create preconfigured Jenkins masters on OpenShift.

### Solution overview

The solution to executing CI/CD tasks (builds, tests, etc.) in containers on OpenShift is based on [Jenkins distributed builds][7], which means:

  * We need a Jenkins master; it may run inside the cluster but also works with an external master
  * Jenkins features/plugins are available as usual, so existing projects can be used
  * The Jenkins GUI is available to configure, run, and browse job output
  * if you prefer code, [Jenkins Pipeline][8] is also available



From a technical point of view, the dynamic containers to run jobs are Jenkins agent nodes. When a build kicks off, first a new node starts and "reports for duty" to the Jenkins master via JNLP (port 5000). The build is queued until the agent node comes up and picks up the build. The build output is sent back to the master—just like with regular Jenkins agent servers—but the agent container is shut down once the build is done.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/1_running_jenkinsincontainers.png?itok=fR4ntnn8)

Different kinds of builds (e.g., Java, NodeJS, Python, etc.) need different agent nodes. This is nothing new—labels could previously be used to restrict which agent nodes should run a build. To define the config for these Jenkins agent containers started for each job, we will need to set the following:

  * The Docker image to boot up
  * Resource limits
  * Environment variables
  * Volumes mounted



The core component here is the [Jenkins Kubernetes plugin][9]. This plugin interacts with the K8s cluster (by using a ServiceAccount) and starts/stops the agent nodes. Multiple agent types can be defined as Kubernetes pod templates under the plugin's configuration (refer to them by label in projects).

These [agent images][10] are provided out of the box (also on [CentOS7][11]):

  * [jenkins-slave-base-rhel7][12]: Base image starting the agent that connects to Jenkins master; the Java heap is set according to container memory
  * [jenkins-slave-maven-rhel7][13]: Image for Maven and Gradle builds (extends base)
  * [jenkins-slave-nodejs-rhel7][14]: Image with NodeJS4 tools (extends base)



Note: This solution is not related to OpenShift's [Source-to-Image (S2I)][15] build, which can also be used for certain CI/CD tasks.

### Background learning material

There are several good blogs and documentation about Jenkins builds on OpenShift. The following are good to start with:

Take a look at them to understand the overall solution. In this article, we'll look at the different issues that come up while applying those practices.

### Build my application

For our [example][16], let's assume a Java project with the following build steps:

  * **Source:** Pull project source from a Git repository
  * **Build with Maven:** Dependencies come from an internal repository (let's use Apache Nexus) mirroring external Maven repos
  * **Deploy artifact:** The built JAR is uploaded to the repository



During the CI/CD process, we need to interact with Git and Nexus, so the Jenkins jobs have be able to access those systems. This requires configuration and stored credentials that can be managed at different places:

  * **In Jenkins:** We can add credentials to Jenkins that the Git plugin can use and add files to the project (using containers doesn't change anything).
  * **In OpenShift:** Use ConfigMap and secret objects that are added to the Jenkins agent containers as files or environment variables.
  * **In a fully customized Docker image:** These are pre-configured with everything to run a type of job; just extend one of the agent images.



Which approach you use is a question of taste, and your final solution may be a mix. Below we'll look at the second option, where the configuration is managed primarily in OpenShift. Customize the Maven agent container via the Kubernetes plugin configuration by setting environment variables and mounting files.

Note: Adding environment variables through the UI doesn't work with Kubernetes plugin v1.0 due to a [bug][17]. Either update the plugin or (as a workaround) edit `config.xml` directly and restart Jenkins.

### Pull source from Git

Pulling a public Git is trivial. For a private Git repo, authentication is required and the client also needs to trust the server for a secure connection. A Git pull can typically be done via two protocols:

  * HTTPS: Authentication is with username/password. The server's SSL certificate must be trusted by the job, which is only tricky if it's signed by a custom CA.


```
git clone https://git.mycompany.com:443/myapplication.git

```

  * SSH: Authentication is with a private key. The server is trusted when its public key's fingerprint is found in the `known_hosts` file.


```
git clone ssh://git@git.mycompany.com:22/myapplication.git

```

Downloading the source through HTTP with username/password is OK when it's done manually; for automated builds, SSH is better.

#### Git with SSH

For a SSH download, we need to ensure that the SSH connection works between the agent container and the Git's SSH port. First, we need a private-public key pair. To generate one, run:
```
ssh keygen -t rsa -b 2048 -f my-git-ssh -N ''

```

It generates a private key in `my-git-ssh` (empty passphrase) and the matching public key in `my-git-ssh.pub`. Add the public key to the user on the Git server (preferably a ServiceAccount); web UIs usually support upload. To make the SSH connection work, we need two files on the agent container:

  * The private key at `~/.ssh/id_rsa`
  * The server's public key in `~/.ssh/known_hosts`. To get this, try `ssh git.mycompany.com` and accept the fingerprint; this will create a new line in the `known_hosts` file. Use that.



Store the private key as `id_rsa` and server's public key as `known_hosts` in an OpenShift secret (or config map).
```
apiVersion: v1

kind: Secret

metadata:

  name: mygit-ssh

stringData:

  id_rsa: |-

    -----BEGIN RSA PRIVATE KEY-----

    ...

    -----END RSA PRIVATE KEY-----

  known_hosts: |-

    git.mycompany.com ecdsa-sha2-nistp256 AAA...

```

Then configure this as a volume in the Kubernetes plugin for the Maven pod at mount point `/home/jenkins/.ssh/`. Each item in the secret will be a file matching the key name under the mount directory. We can use the UI (`Manage Jenkins / Configure / Cloud / Kubernetes`), or edit Jenkins config `/var/lib/jenkins/config.xml`:
```
<org.csanchez.jenkins.plugins.kubernetes.PodTemplate>

<name>maven</name>

...

  <volumes>

    <org.csanchez.jenkins.plugins.kubernetes.volumes.SecretVolume>

      <mountPath>/home/jenkins/.ssh</mountPath>

      <secretName>mygit-ssh</secretName>

    </org.csanchez.jenkins.plugins.kubernetes.volumes.SecretVolume>

  </volumes>

```

Pulling a Git source through SSH should work in the jobs running on this agent now.

Note: It's also possible to customize the SSH connection in `~/.ssh/config`, for example, if we don't want to bother with `known_hosts` or the private key is mounted to a different location:
```
Host git.mycompany.com

   StrictHostKeyChecking no

   IdentityFile /home/jenkins/.config/git-secret/ssh-privatekey

```

#### Git with HTTP

If you prefer an HTTP download, add the username/password to a [Git-credential-store][18] file somewhere:

  * E.g. `/home/jenkins/.config/git-secret/credentials` from an OpenShift secret, one site per line:


```
https://username:password@git.mycompany.com

https://user:pass@github.com

```

  * Enable it in [git-config][19] expected at `/home/jenkins/.config/git/config`:


```
[credential]

  helper = store --file=/home/jenkins/.config/git-secret/credentials

```

If the Git service has a certificate signed by a custom certificate authority (CA), the quickest hack is to set the `GIT_SSL_NO_VERIFY=true` environment variable (EnvVar) for the agent. The proper solution needs two things:

  * Add the custom CA's public certificate to the agent container from a config map to a path (e.g. `/usr/ca/myTrustedCA.pem`).
  * Tell Git the path to this cert in an EnvVar `GIT_SSL_CAINFO=/usr/ca/myTrustedCA.pem` or in the `git-config` file mentioned above:


```
[http "https://git.mycompany.com"]

    sslCAInfo = /usr/ca/myTrustedCA.pem

```

Note: In OpenShift v3.7 (and earlier), the config map and secret mount points [must not overlap][20], so we can't map to `/home/jenkins` and `/home/jenkins/dir` at the same time. This is why we didn't use the well-known file locations above. A fix is expected in OpenShift v3.9.

### Maven

To make a Maven build work, there are usually two things to do:

  * A corporate Maven repository (e.g., Apache Nexus) should be set up to act as a proxy for external repos. Use this as a mirror.
  * This internal repository may have an HTTPS endpoint with a certificate signed by a custom CA.



Having an internal Maven repository is practically essential if builds run in containers because they start with an empty local repository (cache), so Maven downloads all the JARs every time. Downloading from an internal proxy repo on the local network is obviously quicker than downloading from the Internet.

The [Maven Jenkins agent][13] image supports an environment variable that can be used to set the URL for this proxy. Set the following in the Kubernetes plugin container template:
```
MAVEN_MIRROR_URL=https://nexus.mycompany.com/repository/maven-public

```

The build artifacts (JARs) should also be archived in a repository, which may or may not be the same as the one acting as a mirror for dependencies above. Maven `deploy` requires the repo URL in the `pom.xml` under [Distribution management][21] (this has nothing to do with the agent image):
```
<project ...>

<distributionManagement>

 <snapshotRepository>

  <id>mynexus</id>

  <url>https://nexus.mycompany.com/repository/maven-snapshots/</url>

 </snapshotRepository>

 <repository>

  <id>mynexus</id>

  <url>https://nexus.mycompany.com/repository/maven-releases/</url>

 </repository>

</distributionManagement>

```

Uploading the artifact may require authentication. In this case, username/password must be set in the `settings.xml` under the server ID matching the one in `pom.xml`. We need to mount a whole `settings.xml` with the URL, username, and password on the Maven Jenkins agent container from an OpenShift secret. We can also use environment variables as below:

  * Add environment variables from a secret to the container:


```
MAVEN_SERVER_USERNAME=admin

MAVEN_SERVER_PASSWORD=admin123

```

  * Mount `settings.xml` from a config map to `/home/jenkins/.m2/settings.xml`:


```
<settings ...>

 <mirrors>

  <mirror>

   <mirrorOf>external:*</mirrorOf>

   <url>${env.MAVEN_MIRROR_URL}</url>

   <id>mirror</id>

  </mirror>

 </mirrors>

 <servers>

  <server>

   <id>mynexus</id>

   <username>${env.MAVEN_SERVER_USERNAME}</username>

   <password>${env.MAVEN_SERVER_PASSWORD}</password>

  </server>

 </servers>

</settings>

```

Disable interactive mode (use batch mode) to skip the download log by using `-B` for Maven commands or by adding `<interactiveMode>false</interactiveMode>` to `settings.xml`.

If the Maven repository's HTTPS endpoint uses a certificate signed by a custom CA, we need to create a Java KeyStore using the [keytool][22] containing the CA certificate as trusted. This KeyStore should be uploaded as a config map in OpenShift. Use the `oc` command to create a config map from files:
```
 oc create configmap maven-settings --from-file=settings.xml=settings.xml --from-

file=myTruststore.jks=myTruststore.jks

```

Mount the config map somewhere on the Jenkins agent. In this example we use `/home/jenkins/.m2`, but only because we have `settings.xml` in the same config map. The KeyStore can go under any path.

Then make the Maven Java process use this file as a trust store by setting Java parameters in the `MAVEN_OPTS` environment variable for the container:
```
MAVEN_OPTS=

-Djavax.net.ssl.trustStore=/home/jenkins/.m2/myTruststore.jks

-Djavax.net.ssl.trustStorePassword=changeit

```

### Memory usage

This is probably the most important part—if we don't set max memory correctly, we'll run into intermittent build failures after everything seems to work.

Running Java in a container can cause high memory usage errors if we don't set the heap in the Java command line. The JVM [sees the total memory of the host machine][23] instead of the container's memory limit and sets the [default max heap][24] accordingly. This is typically much more than the container's memory limit, and OpenShift simply kills the container when a Java process allocates more memory for the heap.

Although the `jenkins``-slave-base` image has a built-in [script to set max heap ][25]to half the container memory (this can be modified via EnvVar `CONTAINER_HEAP_PERCENT=0.50`), it only applies to the Jenkins agent Java process. In a Maven build, we have important additional Java processes running:

  * The `mvn` command itself is a Java tool.
  * The [Maven Surefire-plugin][26] executes the unit tests in a forked JVM by default.



At the end of the day, we'll have three Java processes running at the same time in the container, and it's important to estimate their memory usage to avoid unexpectedly killed pods. Each process has a different way to set JVM options:

  * Jenkins agent heap is calculated as mentioned above, but we definitely shouldn't let the agent have such a big heap. Memory is needed for the other two JVMs. Setting `JAVA_OPTS` works for the Jenkins agent.
  * The `mvn` tool is called by the Jenkins job. Set `MAVEN_OPTS` to customize this Java process.
  * The JVM spawned by the Maven `surefire` plugin for the unit tests can be customized by the [argLine][27] Maven property. It can be set in the `pom.xml`, in a profile in `settings.xml` or simply by adding `-DargLine=… to mvn` command in `MAVEN_OPTS`.



Here is an example of how to set these environment variables for the Maven agent container:
```
 JAVA_OPTS=-Xms64m -Xmx64m

MAVEN_OPTS=-Xms128m -Xmx128m -DargLine=${env.SUREFIRE_OPTS}

SUREFIRE_OPTS=-Xms256m -Xmx256m

```

These numbers worked in our tests with 1024Mi agent container memory limit building and running unit tests for a SpringBoot app. These are relatively low numbers and a bigger heap size; a higher limit may be needed for complex Maven projects and unit tests.

Note: The actual memory usage of a Java8 process is something like `HeapSize + MetaSpace + OffHeapMemory`, and this can be significantly more than the max heap size set. With the settings above, the three Java processes took more than 900Mi memory in our case. See RSS memory for processes within the container: `ps -e -o ``pid``,user``,``rss``,comm``,args`

The Jenkins agent images have both JDK 64 bit and 32 bit installed. For `mvn` and `surefire`, the 64-bit JVM is used by default. To lower memory usage, it makes sense to force 32-bit JVM as long as `-Xmx` is less than 1.5 GB:
```
JAVA_HOME=/usr/lib/jvm/Java-1.8.0-openjdk-1.8.0.161–0.b14.el7_4.i386

```

Note that it's also possible to set Java arguments in the `JAVA_TOOL_OPTIONS` EnvVar, which is picked up by any JVM started. The parameters in `JAVA_OPTS` and `MAVEN_OPTS` overwrite the ones in `JAVA_TOOL_OPTIONS`, so we can achieve the same heap configuration for our Java processes as above without using `argLine`:
```
JAVA_OPTS=-Xms64m -Xmx64m

MAVEN_OPTS=-Xms128m -Xmx128m

JAVA_TOOL_OPTIONS=-Xms256m -Xmx256m

```

It's still a bit confusing, as all JVMs log `Picked up JAVA_TOOL_OPTIONS:`

### Jenkins Pipeline

Following the settings above, we should have everything prepared to run a successful build. We can pull the code, download the dependencies, run the unit tests, and upload the artifact to our repository. Let's create a Jenkins Pipeline project that does this:
```
pipeline {

  /bin /boot /dev /etc /home /lib /lib64 /lost+found /media /mnt /opt /proc /root /run /sbin /srv /sys /tmp /usr /var Which container to bring up for the build. Pick one of the templates configured in Kubernetes plugin. */

  agent {

    label 'maven'

  }



  stages {

    stage('Pull Source') {

      steps {

        git url: 'ssh://git@git.mycompany.com:22/myapplication.git', branch: 'master'

      }

    }

    stage('Unit Tests') {

      steps {

        sh 'mvn test'

      }

    }

    stage('Deploy to Nexus') {

      steps {

        sh 'mvn deploy -DskipTests'

      }

    }

  }

}

```

For a real project, of course, the CI/CD pipeline should do more than just the Maven build; it could deploy to a development environment, run integration tests, promote to higher environments, etc. The learning articles linked above show examples of how to do those things.

### Multiple containers

One pod can be running multiple containers with each having their own resource limits. They share the same network interface, so we can reach started services on `localhost`, but we need to think about port collisions. Environment variables are set separately, but the volumes mounted are the same for all containers configured in one Kubernetes pod template.

Bringing up multiple containers is useful when an external service is required for unit tests and an embedded solution doesn't work (e.g., database, message broker, etc.). In this case, this second container also starts and stops with the Jenkins agent.

See the Jenkins `config.xml` snippet where we start an `httpbin` service on the side for our Maven build:
```
<org.csanchez.jenkins.plugins.kubernetes.PodTemplate>

  <name>maven</name>

  <volumes>

    ...

  </volumes>

  <containers>

    <org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>

      <name>jnlp</name>

      <image>registry.access.redhat.com/openshift3/jenkins-slave-maven-rhel7:v3.7</image>

      <resourceLimitCpu>500m</resourceLimitCpu>

      <resourceLimitMemory>1024Mi</resourceLimitMemory>

      <envVars>

      ...

      </envVars>        

      ...

    </org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>

    <org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>

      <name>httpbin</name>

      <image>citizenstig/httpbin</image>

      <resourceLimitCpu></resourceLimitCpu>

      <resourceLimitMemory>256Mi</resourceLimitMemory>

      <envVars/>

      ...

    </org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>

  </containers>

  <envVars/>

</org.csanchez.jenkins.plugins.kubernetes.PodTemplate>

```

### Summary

For a summary, see the created OpenShift resources and the Kubernetes plugin configuration from Jenkins `config.xml` with the configuration described above.
```
apiVersion: v1

kind: List

metadata: {}

items:

- apiVersion: v1

  kind: ConfigMap

  metadata:

    name: git-config

  data:

    config: |

      [credential]

          helper = store --file=/home/jenkins/.config/git-secret/credentials

      [http "http://git.mycompany.com"]

          sslCAInfo = /home/jenkins/.config/git/myTrustedCA.pem

    myTrustedCA.pem: |-

      -----BEGIN CERTIFICATE-----

      MIIDVzCCAj+gAwIBAgIJAN0sC...

      -----END CERTIFICATE-----

- apiVersion: v1

  kind: Secret

  metadata:

    name: git-secret

  stringData:

    ssh-privatekey: |-

      -----BEGIN RSA PRIVATE KEY-----

      ...

      -----END RSA PRIVATE KEY-----

    credentials: |-

      https://username:password@git.mycompany.com

      https://user:pass@github.com

- apiVersion: v1

  kind: ConfigMap

  metadata:

    name: git-ssh

  data:

    config: |-

      Host git.mycompany.com

        StrictHostKeyChecking yes

        IdentityFile /home/jenkins/.config/git-secret/ssh-privatekey

    known_hosts: '[git.mycompany.com]:22 ecdsa-sha2-nistp256 AAAdn7...'

- apiVersion: v1

  kind: Secret

  metadata:

    name: maven-secret

  stringData:

    username: admin

    password: admin123

```

One additional config map was created from files:
```
 oc create configmap maven-settings --from-file=settings.xml=settings.xml

--from-file=myTruststore.jks=myTruststore.jks

```

Kubernetes plugin configuration:
```
<?xml version='1.0' encoding='UTF-8'?>

<hudson>

...

  <clouds>

    <org.csanchez.jenkins.plugins.kubernetes.KubernetesCloud plugin="kubernetes@1.0">

      <name>openshift</name>

      <defaultsProviderTemplate></defaultsProviderTemplate>

      <templates>

        <org.csanchez.jenkins.plugins.kubernetes.PodTemplate>

          <inheritFrom></inheritFrom>

          <name>maven</name>

          <namespace></namespace>

          <privileged>false</privileged>

          <alwaysPullImage>false</alwaysPullImage>

          <instanceCap>2147483647</instanceCap>

          <slaveConnectTimeout>100</slaveConnectTimeout>

          <idleMinutes>0</idleMinutes>

          <label>maven</label>

          <serviceAccount>jenkins37</serviceAccount>

          <nodeSelector></nodeSelector>

          <nodeUsageMode>NORMAL</nodeUsageMode>

          <customWorkspaceVolumeEnabled>false</customWorkspaceVolumeEnabled>

          <workspaceVolume class="org.csanchez.jenkins.plugins.kubernetes.volumes.workspace.EmptyDirWorkspaceVolume">

            <memory>false</memory>

          </workspaceVolume>

          <volumes>

            <org.csanchez.jenkins.plugins.kubernetes.volumes.SecretVolume>

              <mountPath>/home/jenkins/.config/git-secret</mountPath>

              <secretName>git-secret</secretName>

            </org.csanchez.jenkins.plugins.kubernetes.volumes.SecretVolume>

            <org.csanchez.jenkins.plugins.kubernetes.volumes.ConfigMapVolume>

              <mountPath>/home/jenkins/.ssh</mountPath>

              <configMapName>git-ssh</configMapName>

            </org.csanchez.jenkins.plugins.kubernetes.volumes.ConfigMapVolume>

            <org.csanchez.jenkins.plugins.kubernetes.volumes.ConfigMapVolume>

              <mountPath>/home/jenkins/.config/git</mountPath>

              <configMapName>git-config</configMapName>

            </org.csanchez.jenkins.plugins.kubernetes.volumes.ConfigMapVolume>

            <org.csanchez.jenkins.plugins.kubernetes.volumes.ConfigMapVolume>

              <mountPath>/home/jenkins/.m2</mountPath>

              <configMapName>maven-settings</configMapName>

            </org.csanchez.jenkins.plugins.kubernetes.volumes.ConfigMapVolume>

          </volumes>

          <containers>

            <org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>

              <name>jnlp</name>

              <image>registry.access.redhat.com/openshift3/jenkins-slave-maven-rhel7:v3.7</image>

              <privileged>false</privileged>

              <alwaysPullImage>false</alwaysPullImage>

              <workingDir>/tmp</workingDir>

              <command></command>

              <args>${computer.jnlpmac} ${computer.name}</args>

              <ttyEnabled>false</ttyEnabled>

              <resourceRequestCpu>500m</resourceRequestCpu>

              <resourceRequestMemory>1024Mi</resourceRequestMemory>

              <resourceLimitCpu>500m</resourceLimitCpu>

              <resourceLimitMemory>1024Mi</resourceLimitMemory>

              <envVars>

                <org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>

                  <key>JAVA_HOME</key>

                  <value>/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.i386</value>

                </org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>

                <org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>

                  <key>JAVA_OPTS</key>

                  <value>-Xms64m -Xmx64m</value>

                </org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>

                <org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>

                  <key>MAVEN_OPTS</key>

                  <value>-Xms128m -Xmx128m -DargLine=${env.SUREFIRE_OPTS} -Djavax.net.ssl.trustStore=/home/jenkins/.m2/myTruststore.jks -Djavax.net.ssl.trustStorePassword=changeit</value>

                </org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>

                <org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>

                  <key>SUREFIRE_OPTS</key>

                  <value>-Xms256m -Xmx256m</value>

                </org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>

                <org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>

                  <key>MAVEN_MIRROR_URL</key>

                  <value>https://nexus.mycompany.com/repository/maven-public</value>

                </org.csanchez.jenkins.plugins.kubernetes.ContainerEnvVar>

                <org.csanchez.jenkins.plugins.kubernetes.model.SecretEnvVar>

                  <key>MAVEN_SERVER_USERNAME</key>

                  <secretName>maven-secret</secretName>

                  <secretKey>username</secretKey>

                </org.csanchez.jenkins.plugins.kubernetes.model.SecretEnvVar>

                <org.csanchez.jenkins.plugins.kubernetes.model.SecretEnvVar>

                  <key>MAVEN_SERVER_PASSWORD</key>

                  <secretName>maven-secret</secretName>

                  <secretKey>password</secretKey>

                </org.csanchez.jenkins.plugins.kubernetes.model.SecretEnvVar>

              </envVars>

              <ports/>

              <livenessProbe>

                <execArgs></execArgs>

                <timeoutSeconds>0</timeoutSeconds>

                <initialDelaySeconds>0</initialDelaySeconds>

                <failureThreshold>0</failureThreshold>

                <periodSeconds>0</periodSeconds>

                <successThreshold>0</successThreshold>

              </livenessProbe>

            </org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>

            <org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>

              <name>httpbin</name>

              <image>citizenstig/httpbin</image>

              <privileged>false</privileged>

              <alwaysPullImage>false</alwaysPullImage>

              <workingDir></workingDir>

              <command>/run.sh</command>

              <args></args>

              <ttyEnabled>false</ttyEnabled>

              <resourceRequestCpu></resourceRequestCpu>

              <resourceRequestMemory>256Mi</resourceRequestMemory>

              <resourceLimitCpu></resourceLimitCpu>

              <resourceLimitMemory>256Mi</resourceLimitMemory>

              <envVars/>

              <ports/>

              <livenessProbe>

                <execArgs></execArgs>

                <timeoutSeconds>0</timeoutSeconds>

                <initialDelaySeconds>0</initialDelaySeconds>

                <failureThreshold>0</failureThreshold>

                <periodSeconds>0</periodSeconds>

                <successThreshold>0</successThreshold>

              </livenessProbe>

            </org.csanchez.jenkins.plugins.kubernetes.ContainerTemplate>

          </containers>

          <envVars/>

          <annotations/>

          <imagePullSecrets/>

        </org.csanchez.jenkins.plugins.kubernetes.PodTemplate>

      </templates>

      <serverUrl>https://172.30.0.1:443</serverUrl>

      <serverCertificate>-----BEGIN CERTIFICATE-----

MIIC6jCC...

-----END CERTIFICATE-----</serverCertificate>

      <skipTlsVerify>false</skipTlsVerify>

      <namespace>first</namespace>

      <jenkinsUrl>http://jenkins.cicd.svc:80</jenkinsUrl>

      <jenkinsTunnel>jenkins-jnlp.cicd.svc:50000</jenkinsTunnel>

      <credentialsId>1a12dfa4-7fc5-47a7-aa17-cc56572a41c7</credentialsId>

      <containerCap>10</containerCap>

      <retentionTimeout>5</retentionTimeout>

      <connectTimeout>0</connectTimeout>

      <readTimeout>0</readTimeout>

      <maxRequestsPerHost>32</maxRequestsPerHost>

    </org.csanchez.jenkins.plugins.kubernetes.KubernetesCloud>

  </clouds>



</hudson>

```

Happy builds!

This was originally published on [ITNext][28] and is reprinted with permission.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/running-jenkins-builds-containers

作者：[Balazs Szeti][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bszeti
[1]:https://opensource.com/resources/what-docker
[2]:https://opensource.com/resources/what-is-kubernetes
[3]:https://martinfowler.com/articles/microservices.html
[4]:https://www.openshift.com/
[5]:https://developers.redhat.com/products/cdk/overview/
[6]:https://github.com/openshift/origin/tree/master/examples/jenkins
[7]:https://wiki.jenkins.io/display/JENKINS/Distributed+builds
[8]:https://jenkins.io/doc/book/pipeline/
[9]:https://github.com/jenkinsci/kubernetes-plugin
[10]:https://access.redhat.com/containers/#/search/jenkins%2520slave
[11]:https://hub.docker.com/search/?isAutomated=0&isOfficial=0&page=1&pullCount=0&q=openshift+jenkins+slave+&starCount=0
[12]:https://github.com/openshift/jenkins/tree/master/slave-base
[13]:https://github.com/openshift/jenkins/tree/master/slave-maven
[14]:https://github.com/openshift/jenkins/tree/master/slave-nodejs
[15]:https://docs.openshift.com/container-platform/3.7/architecture/core_concepts/builds_and_image_streams.html#source-build
[16]:https://github.com/bszeti/camel-springboot/tree/master/camel-rest-complex
[17]:https://issues.jenkins-ci.org/browse/JENKINS-47112
[18]:https://git-scm.com/docs/git-credential-store/1.8.2
[19]:https://git-scm.com/docs/git-config/1.8.2
[20]:https://bugzilla.redhat.com/show_bug.cgi?id=1430322
[21]:https://maven.apache.org/pom.html#Distribution_Management
[22]:https://docs.oracle.com/javase/8/docs/technotes/tools/unix/keytool.html
[23]:https://developers.redhat.com/blog/2017/03/14/java-inside-docker/
[24]:https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/parallel.html#default_heap_size
[25]:https://github.com/openshift/jenkins/blob/master/slave-base/contrib/bin/run-jnlp-client
[26]:http://maven.apache.org/surefire/maven-surefire-plugin/examples/fork-options-and-parallel-execution.html
[27]:http://maven.apache.org/surefire/maven-surefire-plugin/test-mojo.html#argLine
[28]:https://itnext.io/running-jenkins-builds-in-containers-458e90ff2a7b
