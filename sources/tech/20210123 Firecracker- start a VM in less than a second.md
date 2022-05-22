[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Firecracker: start a VM in less than a second)
[#]: via: (https://jvns.ca/blog/2021/01/23/firecracker--start-a-vm-in-less-than-a-second/)
[#]: author: (Julia Evans https://jvns.ca/)

Firecracker: start a VM in less than a second
======

Hello! I spent this whole past week figuring out how to use [Firecracker][1] and I really like it so far.

Initially when I read about Firecracker being released, I thought it was just a tool for cloud providers to use – I knew that AWS Fargate and <https://fly.io> used it, but I didn’t think that it was something that I could directly use myself.

But it turns out that Firecracker is relatively straightforward to use (or at least as straightforward as anything else that’s for running VMs), the documentation and examples are pretty clear, you definitely don’t need to be a cloud provider to use it, and as advertised, it starts VMs really fast!

So I wanted to write about using Firecracker from a more DIY “I just want to run some VMs” perspective.

I’ll start out by talking about what I’m using it for, and then I’ll explain a few things I learned about it along the way.

### my goal: a game where every player gets their own virtual machine

I’m working on a sort of game to help people learn command line tools by giving them a problem to solve and a virtual machine to solve it in, a little like a CTF. It still basically exists only on my computer, but I’ve been working on it for a while.

Here’s a screenshot of one of the puzzles I’m working on right now. This one is about setting file extended attributes with `setfacl`.

<https://jvns.ca/images/read-me.png>

### why not use containers?

I wanted to use virtual machines and not containers for this project basically because I wanted to mimic a real production machine that the user has root access to – I wanted folks to be able to set sysctls, use `nsenter`, make `iptables` rules, configure networking with `ip`, run `perf`, basically literally anything.

### the problem: starting a virtual machine is slow

I wanted people to be able to click “Start” on a puzzle and instantly launch a virtual machine. Originally I was launching a DigitalOcean VM every time, but they took about a minute to boot, I was getting really impatient waiting for them every time, and I didn’t think it was an acceptable user experience for people to have to wait a minute.

I also tried using qemu, but for reasons I don’t totally understand, starting a VM with qemu was also kind of slow – it seemed to take at least maybe 20 seconds.

### Firecracker can start a VM in less than a second!

Firecracker says this about performance in their [specification][2]:

> It takes &lt;= 125 ms to go from receiving the Firecracker InstanceStart API call to the start of the Linux guest user-space /sbin/init process.

So far I’ve been using Firecracker to start relatively large VMs – Ubuntu VMs running systemd as an init system – and it takes maybe 2-3 seconds for them to boot. I haven’t been measuring that closely because honestly 5 seconds is fast enough and I don’t mind too much about an extra 200ms either way.

But enough background, let’s talk about how to actually use Firecracker.

### here’s a “hello world” script to start a Firecracker VM

I said at the beginning of this post that Firecracker is pretty straightforward to get started with. Here’s how.

Firecracker’s [getting started][3] instructions are really good (they just work!) but it was separated into a bunch of steps and I wanted to see everything you have to do together in 1 shell script. So I wrote a short shell script you can use to start a Firecracker VM, and some quick instructions for how to use it.

Running a script like this was the first thing I did when trying to wrap my head around Firecracker. There’s basically 3 steps:

**step 1**: Download Firecracker from their [releases page][4] and put it somewhere

**step 2**: Run this script as root (you might have to edit the last line with the path to the `firecracker` binary if it’s not in root’s PATH)

I also put this script in a gist: [firecracker-hello-world.sh][5]. The IP addresses here are chosen pretty arbitrarily. Most the script is just writing a JSON file.

```
set -eu

# download a kernel and filesystem image
[ -e hello-vmlinux.bin ] || wget https://s3.amazonaws.com/spec.ccfc.min/img/hello/kernel/hello-vmlinux.bin
[ -e hello-rootfs.ext4 ] || wget -O hello-rootfs.ext4 https://github.com/firecracker-microvm/firecracker-demo/raw/master/xenial.rootfs.ext4
[ -e hello-id_rsa ] || wget -O hello-id_rsa https://raw.githubusercontent.com/firecracker-microvm/firecracker-demo/ec271b1e5ffc55bd0bf0632d5260e96ed54b5c0c/xenial.rootfs.id_rsa

TAP_DEV="fc-88-tap0"

# set up the kernel boot args
MASK_LONG="255.255.255.252"
MASK_SHORT="/30"
FC_IP="169.254.0.21"
TAP_IP="169.254.0.22"
FC_MAC="02:FC:00:00:00:05"

KERNEL_BOOT_ARGS="ro console=ttyS0 noapic reboot=k panic=1 pci=off nomodules random.trust_cpu=on"
KERNEL_BOOT_ARGS="${KERNEL_BOOT_ARGS} ip=${FC_IP}::${TAP_IP}:${MASK_LONG}::eth0:off"

# set up a tap network interface for the Firecracker VM to user
ip link del "$TAP_DEV" 2> /dev/null || true
ip tuntap add dev "$TAP_DEV" mode tap
sysctl -w net.ipv4.conf.${TAP_DEV}.proxy_arp=1 > /dev/null
sysctl -w net.ipv6.conf.${TAP_DEV}.disable_ipv6=1 > /dev/null
ip addr add "${TAP_IP}${MASK_SHORT}" dev "$TAP_DEV"
ip link set dev "$TAP_DEV" up

# make a configuration file
cat <<EOF > vmconfig.json
{
  "boot-source": {
    "kernel_image_path": "hello-vmlinux.bin",
    "boot_args": "$KERNEL_BOOT_ARGS"
  },
  "drives": [
    {
      "drive_id": "rootfs",
      "path_on_host": "hello-rootfs.ext4",
      "is_root_device": true,
      "is_read_only": false
    }
  ],
  "network-interfaces": [
      {
          "iface_id": "eth0",
          "guest_mac": "$FC_MAC",
          "host_dev_name": "$TAP_DEV"
      }
  ],
  "machine-config": {
    "vcpu_count": 2,
    "mem_size_mib": 1024,
    "ht_enabled": false
  }
}
EOF
# start firecracker
firecracker --no-api --config-file vmconfig.json
```

**step 3**: You have a VM running!

You can also SSH into the VM like this, with the SSH key that the script downloaded:

```
ssh -o StrictHostKeyChecking=false  [email protected] -i hello-id_rsa
```

You might notice that if you run `ping 8.8.8.8` inside this VM, it doesn’t work: it’s not able to connect to the outside internet. I think I’m actually going to use a setup like this for my puzzles where people don’t need to connect to the internet.

The networking commands and the rootfs image in this script are from the [firecracker-demo][6] repository which I found really helpful.

### how I put a Firecracker VM on the Docker bridge

I had a couple of problems with this “hello world” setup though:

  * I wanted to be able to SSH to them from a Docker container (because I was running my game’s webserver in `docker-compose`)
  * I wanted them to be able to connect to the outside internet



I struggled with trying to understand what a Linux bridge was and how it worked for about a day before figuring out how to get this to work. Here’s a slight modification of the previous script [firecracker-hello-world-docker-bridge.sh][7] which runs a Firecracker VM on the Docker bridge

You can run it as root and SSH to the resulting VM like this (the IP is different because it has to be in the Docker subnet).

```
ssh -o StrictHostKeyChecking=false  [email protected] -i hello-id_rsa
```

It basically just changes 2 things:

  1. There’s an extra `sudo brctl addif docker0 $TAP_DEV` to add the VM’s network interface to the Docker bridge
  2. It changes the gateway in the kernel boot args to the Docker bridge network interface’s IP (172.17.0.1)



My guess is that most people probably won’t want to use the Docker bridge, if you just want the VM to be able to connect to the outside internet I think the best way is to create a new bridge.

In my application I’m actually using a bridge called `firecracker0` which is a docker-compose network I made. It feels a little sketchy to be using a bridge managed by Docker in this way but for now it works so I’ll keep doing that unless I find a better way.

### how I built my own Firecracker images

This “hello world” example is all very well and good, but you might say – ok, how do I build my own images?

Basically you have to do 2 things:

  1. Make a Linux kernel. I wanted a 5.8 kernel so I used the instructions in the [firecracker docs on creating your own image][8] for compiling a Linux kernel and they worked. I was kind of intimidated by this because I’d somehow never compiled a Linux kernel before, but I followed the instructions and it just worked the first time. I thought it would be super slow but it actually took less than 10 minutes to compile from scratch.
  2. Make an `ext4` filesystem image with all the files you want in your VM’s filesystem.



Here’s how I put together my filesystem. Initially I tried downloading Ubuntu’s focal cloud image and extracting the root partition with `dd`, but I couldn’t get it work.

Instead, I did what the Firecracker docs suggested and I built a Docker container and copied the contents of the container into a filesystem image.

Here’s what the `Dockerfile` I used looked like approximately: (I haven’t tested this exact Dockerfile but I think it should work). The main things are that you have to install some kind of init system because the default `ubuntu:20.04` image doesn’t come with one because you don’t need one in a container. I also ran `unminimize` to restore some man pages because the container is for interactive use.

```
FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y init openssh-server
RUN yes | unminimize
# copy over some SSH keys and install other programs I wanted
```

And here’s the basic shell script I’ve been using to create a filesystem image from the Docker container. I ran the whole thing as root, but technically you only have to run `mount` as root.

```
IMG_ID=$(docker build -q .)
CONTAINER_ID=$(docker run -td $IMG_ID /bin/bash)

MOUNTDIR=mnt
FS=mycontainer.ext4

mkdir $MOUNTDIR
qemu-img create -f raw $FS 800M
mkfs.ext4 $FS
mount $FS $MOUNTDIR
docker cp $CONTAINER_ID:/ $MOUNTDIR
umount $MOUNTDIR
```

I’m still not quite sure how much I’m going to like this approach of using Docker containers to create VM images – it feels a bit weird to me but it’s been working fine so far.

I think most people who use Firecracker use a more lightweight init system than systemd and it’s definitely not necessary to use systemd but I think I’m going to stick with systemd for now because I want it to feel mostly like a normal production Linux system and a lot of the production servers I’ve used have used systemd.

Okay, that’s all I have to say about creating images. Let’s talk a bit more about configuring Firecracker.

### Firecracker supports either a socket interface or a configuration file

You can start a Firecracker VM 2 ways:

  1. create a configuration file and run `firecracker --no-api --config-file vmconfig.json`
  2. create an API socket and write instructions to the API socket (like they explain in their [getting started][3] instructions)



I really liked the configuration file approach for doing some initial experimentation because I found it easier to be able to see everything all in one place. But when integrating Firecracker with my actual application in real life, I found it easier to use the API.

### how I wrote a HTTP service that starts Firecracker VMs: use the Go SDK!

I wanted to have a little HTTP service that I could call from my Ruby on Rails server to start new VMs and stop them when I was done with them.

Here’s what the interface looks like – you give it a root image and a kernel and it returns an ID an the VM’s IP address. All of the files paths are just local paths on my machine.

```
$ http post localhost:8080/create root_image_path=/images/base.ext4 kernel_path=/images/vmlinux-5.8
HTTP/1.1 200 OK
{
    "id": "D248122A-1CCA-475C-856E-E3003A913F32",
    "ip_address": "172.102.0.4"
}
```

and then here’s what deleting a VM looks like (I might make this use the `DELETE` method later to make it more REST-y :) )

```
$ http post localhost:8080/delete id=D248122A-1CCA-475C-856E-E3003A913F32
HTTP/1.1 200 OK
```

At first I wasn’t sure how I was going to use the Firecracker socket API to implement this interface, but then I discovered that there’s a [Go SDK][9]! This made it way easier to generate the correct JSON, because there were a bunch of structs and the compiler would tell me if I made a typo in a field name.

I basically wrote all of my code so far by copying and modifying code from [firectl][10], a Go command line tool. The reason I wrote my own tool insted of just using `firectl` directly was that I wanted to have a HTTP API that could launch and stop lots of different VMs.

I found the `firectl` code and the Go SDK pretty easy to understand so I won’t say too much more about it here.

If you’re interested you can see [a gist with my current HTTP service for managing Firecracker VMs][11] which is a huge mess and pretty buggy and not intended for anyone but me to use. It does start VMs successfully though which is an important first step!!!

### DigitalOcean supports nested virtualization

Another question I had was: “ok, where am I going to run these Firecracker VMs in production?“. The funny thing about running a VM in the cloud is that cloud instances are _already_ VMs. Running a VM inside a VM is called “nested virtualization” and not all cloud providers support it – for example AWS doesn’t.

Right now I’m using DigitalOcean and I was delighted to see that DigitalOcean does support nested virtualization even on their smallest droplets – I tried running the “hello world” Firecracker script from above and it just worked!

I think GCP supports nested virtualization too but I haven’t tried it. The official Firecracker documentation suggests using a `metal` instance on AWS, probably because Firecracker is made by AWS.

I don’t know what the performance implications of using nested virtualization are yet but I guess I’ll find out!

### Firecracker only runs on Linux

I should say that Firecracker uses KVM so it only runs on Linux. I don’t know if there’s a way to start VMs in a similarly fast way on a Mac, maybe there is? Or maybe there’s something special about KVM? I don’t understand how KVM works.

### some open questions

A few things I still haven’t figured out:

  * Right now I’m not using `jailer`, another part of Firecracker that helps further isolate the Firecracker VM by adding some `seccomp-BPF` rules and other things. Maybe I should be! `firectl` uses `jailer` so it would be pretty easy to copy the code that does that.
  * I still don’t totally understand _why_ Firecracker is fast (or alternatively, why qemu is slow). This [LWN article][12] says that it’s because Firecracker emulates less devices than qemu does, but I don’t know exactly which devices are the ones that are making qemu slow to start.
  * will it be slow to use nested virtualization?
  * I don’t know if it’s possible to run graphical applications in Firecracker, it seems like it might not because it’s intended for servers, but maybe it is possible?
  * I’m not sure how many Firecracker VMs I can run at a time on my little $5/month DigitalOcean droplet, I need to do some of experiments.



--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/01/23/firecracker--start-a-vm-in-less-than-a-second/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://github.com/firecracker-microvm/firecracker/
[2]: https://github.com/firecracker-microvm/firecracker/blob/master/SPECIFICATION.md
[3]: https://github.com/firecracker-microvm/firecracker/blob/master/docs/getting-started.md#getting-the-firecracker-binary
[4]: https://github.com/firecracker-microvm/firecracker/releases
[5]: https://gist.github.com/jvns/c8470e75af67deec2e91ff1bd9883e53
[6]: https://github.com/firecracker-microvm/firecracker-demo/
[7]: https://gist.github.com/jvns/e13e6f498d26b584d8ab66651cdb04e0
[8]: https://github.com/firecracker-microvm/firecracker/blob/master/docs/rootfs-and-kernel-setup.md
[9]: https://github.com/firecracker-microvm/firecracker-go-sdk
[10]: https://github.com/firecracker-microvm/firectl/
[11]: https://gist.github.com/jvns/9b274f24cfa1db7abecd0d32483666a3
[12]: https://lwn.net/Articles/775736/
