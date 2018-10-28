Using Your Own Private Registry with Docker Enterprise Edition
======

![docker trusted registry][1]

One of the things that makes Docker really cool, particularly compared to using virtual machines, is how easy it is to move around Docker images. If you've already been using Docker, you've almost certainly pulled images from [Docker Hub][2]. Docker Hub is Docker's cloud-based registry service and has tens of thousands of Docker images to choose from. If you're developing your own software and creating your own Docker images though, you'll want your own private Docker registry. This is particularly true if you have images with proprietary licenses, or if you have a complex continuous integration (CI) process for your build system.

Docker Enterprise Edition includes Docker Trusted Registry (DTR), a highly available registry with secure image management capabilities which was built to run either inside of your own data center or on your own cloud-based infrastructure. In the next few weeks, we'll go over how DTR is a critical component of delivering a secure, repeatable and consistent [software supply chain][3].  You can get started with it today through our [free hosted demo][4] or by downloading and installing the free 30-day trial. The steps to get started with your own installation are below.

## Setting Up Docker Enterprise Edition

Docker Trusted Registry runs on top of Universal Control Plane (UCP), so to begin let's install a single-node cluster. If you've already got your own UCP cluster, you can skip this step.  On your docker host, run the command:

```
# Pull and install UCP

docker run -it -rm -v /var/run/docker.sock:/var/run/docker.sock -name ucp docker/ucp:latest install
```

Once UCP is up and running, there are a few more things you should do before you install DTR. Open up your browser against the UCP instance you just installed. There should be a link to it at the end of your log output. If you have already have a Docker Enterprise Edition license, go ahead and upload it through the UI. If you don't, visit the [Docker Store][5] and pick up a free, 30-day trial.

Once you've got licensing squared away, you're probably going to want to change the port which UCP is running on. Since this is a single node cluster, DTR and UCP are going to want to use the same TCP ports for running their web services. If you've got a UCP swarm with more than one node, this probably isn't a problem because DTR will look for a node which has the required free ports. Inside of UCP, click on Admin Settings -> Cluster Configuration and change the Controller Port to something like 5443.

## Installing DTR

We're going to install a simple, single-node instance of Docker Trusted Registry.  If you were setting up your DTR for production use, you would likely set things up in High Availability (HA) mode which would require a different type of storage such as a cloud-based object store, or NFS. Since this is a single-node instance, we're going to stick with the default local storage.

First we need to pull the DTR bootstrap image. The bootstrap image is a tiny, self-contained installer which connects to UCP and sets up all of the containers, volumes, and logical networks required to get DTR up and running.

Use the command:

```
# Pull and run the DTR bootstrapper

docker run -it -rm docker/dtr:latest install -ucp-insecure-tls
```

NOTE:  Both UCP and DTR by default come with their own certs which won't be recognized by your system.  If you've set up UCP with TLS certs which are trusted by your system, you can omit the `-ucp-insecure-tls` option. Alternatively, you can use the `-ucp-ca` option which will let you specify the UCP CA certificate directly.

The DTR bootstrap image should then ask you for a couple of settings, such as the URL of your UCP installation and your UCP admin username and password.  It should only take a minute or two to pull all of the DTR images and set everything up.

## Keeping Everything Secure

Once everything is up and running, you're ready to push and pull images to and from

the registry.  Before we do that step though, let's set up our TLS certificates so that we can securely talk to DTR.

On Linux, we can use these commands (just make certain you change DTR_HOSTNAME to reflect the DTR we just set up):

```
# Pull the CA certificate from DTR (you can use wget if curl is unavailable)

DTR_HOSTNAME=<Your DTR hostname>

curl -k https://$(DTR_HOSTNAME)/ca > $(DTR_HOSTNAME).crt

sudo mkdir /etc/docker/certs.d/$(DTR_HOSTNAME)

sudo cp $(DTR_HOSTNAME) /etc/docker/certs.d/$(DTR_HOSTNAME)

# Restart the docker daemon (use `sudo service docker restart` on Ubuntu 14.04)

sudo systemctl restart docker
```

On Docker for Mac and Windows, we'll set up our client a little bit differently.  Go in to Settings -> Daemon and in the Insecure Registries section, enter in your DTR hostname.  Click Apply, and your docker daemon should restart and you should be good to go.

## Pushing and Pulling Images

We now need to set up a repository to hold an image. This is a little bit different than Docker Hub which automatically creates a repository if one doesn't exist when you do a docker push. To create the repository, point your browser to https://<Your DTR hostname> and then sign-in with your admin credentials when prompted. If you added a license to UCP, that license will automatically have been picked up by DTR. If not, make certain you upload your license now.

Once you're in, click on the 'New Repository` button and create a new repository.

We'll create a repo to hold Alpine linux, so type `alpine` in the name field, and click

`Save` (it's labelled `Create` in DTR 2.5 and newer).

Now let's go back to our shell and type the commands:

```
# Pull the latest version of Alpine Linux

docker pull alpine:latest

# Sign in to your new DTR instance

docker login <Your DTR hostname>

# Tag Alpine to be able to push it to your DTR

docker tag alpine:latest <Your DTR hostname>/admin/alpine:latest

# Push the image to DTR

docker push <Your DTR hostname>/admin/alpine:latest
```

And that's it!  We just pulled a copy of the latest Alpine Linux, re-tagged it so that we could store it inside of DTR, and then pushed it to our private registry.  If you want to pull that image to a different Docker engine, set up your DTR certs as shown above, and issue the command:

```
# Pull the image from DTR

docker pull <Your DTR hostname>/admin/alpine:latest
```

DTR has a lot of great image management features built right in such as image caching, mirroring, scanning, signing, and even automated supply chain policies.  We'll leave these to future blog posts which we can explore in more detail.




--------------------------------------------------------------------------------

via: https://blog.docker.com/2018/01/dtr/

作者：[Patrick Devine;Rolf Neugebauer;Docker Core Engineering;Matt Bentley][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.docker.com/author/pdevine/
[1]:https://i1.wp.com/blog.docker.com/wp-content/uploads/ccd278d2-29c2-4866-8285-c2fe60b4bd5e-1.jpg?resize=965%2C452&ssl=1
[2]:https://hub.docker.com/
[3]:https://blog.docker.com/2016/08/securing-enterprise-software-supply-chain-using-docker/
[4]:https://www.docker.com/trial
[5]:https://store.docker.com/search?offering=enterprise&page=1&q=&type=edition
