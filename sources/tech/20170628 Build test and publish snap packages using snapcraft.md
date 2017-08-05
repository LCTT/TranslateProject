【Snaplee准备翻译】Build, test, and publish snap packages using snapcraft
============================================================


### Share or save

 _This is a guest post by Ricardo Feliciano, Developer Evangelist at CircleCI. If you would like to contribute a guest post, please contact ubuntu-iot@canonical.com._ 

Snapcraft, the package management system fighting for its spot at the Linux table, re-imagines how you can deliver your software. A new set of cross-distro tools are available to help you build and publish “Snaps”. We’ll cover how to use CircleCI 2.0 to power this process and some potential gotchas along the way.

### What are snap packages? And Snapcraft?

**Snaps** are software packages for Linux distributions. They’re designed with lessons learned from delivering software on mobile platforms such as Android as well Internet of Things devices. **Snapcraft** is the name that encompasses Snaps and the command-line tool that builds them, [the website][9], and pretty much the entire ecosystem around the technologies that enables this.

Snap packages are designed to isolate and encapsulate an entire application. This concept enables Snapcraft’s goal of increasing security, stability, and portability of software allowing a single “snap” to be installed on not just multiple versions of Ubuntu, but Debian, Fedora, Arch, and more. Snapcraft’s description per their website:

“Package any app for every Linux desktop, server, cloud or device, and deliver updates directly.”

### Building a snap package on CircleCI 2.0

Building a snap on CircleCI is mostly the same as your local machine, wrapped with [CircleCI 2.0 syntax][10]. We’ll go through a sample config file in this post. If you’re not familiar with CircleCI or would like to know more about getting started with 2.0 specifically, you can start [here][11].

### Base Config

```
version: 2
jobs:
  build:
    machine: true
    working_directory: ~/project
    steps:
      - checkout
      - run:
          command: |
            sudo apt update && sudo apt install -y snapd
            sudo snap install snapcraft --edge --classic
            /snap/bin/snapcraft

```

This example uses the `machine` executor to install `snapd`, the executable that allows you to manage snaps and enables the platform, as well as `snapcraft`, the tool for creating snaps.

The `machine` executor is used rather than the `docker` executor as we need a newer kernel for the build process. Linux 4.4 is available here, which is new enough for our purposes.

### Userspace dependencies

The example above uses the `machine` executor, which currently is [a VM with Ubuntu 14.04 (Trusty)][12] and the Linux v4.4 kernel. This is fine if your project/snap requires build dependencies available in the Trusty repositories. What if you need dependencies available in a different version, perhaps Ubuntu 16.04 (Xenial)? We can still use Docker within the `machine` executor to build our snap.

```
version: 2
jobs:
  build:
    machine: true
    working_directory: ~/project
    steps:
      - checkout
      - run:
          command: |
            sudo apt update && sudo apt install -y snapd
            docker run -v $(pwd):$(pwd) -t ubuntu:xenial sh -c "apt update -qq && apt install snapcraft -y && cd $(pwd) && snapcraft"

```

In this example, we again install `snapd` in the `machine` executor’s VM, but we decide to install Snapcraft and build our snap within a Docker container built with the Ubuntu Xenial image. All `apt` packages available in Ubuntu 16.04 will be available to `snapcraft` during the build.

### Testing

Unit testing your software’s code has been covered extensively in [our blog][13], [our docs][14], and around the Internet. Searching for your language/framework and unit testing or CI will turn up tons of information. Building a snap on CircleCI means we end with a `.snap` file which we can test in addition to the code that created it.

### Workflows

Let’s say the snap we built was a webapp. We can build a testing suite to make sure this snap installs and runs correctly. We could try installing the snap. We could run [Selenium][15] to make sure the proper pages load, logins, work, etc. Here’s the catch, snaps are designed to run on multiple Linux distros. That means we need to be able to run this test suite in Ubuntu 16.04, Fedora 25, Debian 9, etc. CircleCI 2.0’s Workflows can efficiently solve this.

[A recent addition][16] to the CircleCI 2.0 beta is Workflows. This allows us to run discrete jobs in CircleCI with a certain flow logic. In this case, **after** our snap is built, which would be a single job, we could then kick off snap distro testing jobs, running in parallel. One for each distro we want to test. Each of these jobs would be a different [Docker image][17] for that distro (or in the future, additional `executors` will be available).

Here’s simple example of what this might look like:

```
workflows:
  version: 2
  build-test-and-deploy:
    jobs:
      - build
      - acceptance_test_xenial:
          requires:
            - build
      - acceptance_test_fedora_25:
          requires:
            - build
      - acceptance_test_arch:
          requires:
            - build
      - publish:
          requires:
            - acceptance_test_xenial
            - acceptance_test_fedora_25
            - acceptance_test_arch

```

This setup builds the snap, and then runs acceptance tests on it with four different distros. If and when all distro builds pass, then we can run the publish `job` in order to finish up any remaining snap task before pushing it to the Snap Store.

### Persisting the .snap package

To test our `.snap` package in the workflows example, a way of persisting that file between builds is needed. I’ll mention two ways here.

1.  **artifacts** – We could store the snap package as a CircleCI artifact during the `build`job. Then retrieve it within the following jobs. CircleCI Workflows has its own way of of handling sharing artifacts which can be found [here][1].

2.  **snap store channels** – When publishing a snap to the Snap Store, there’s more than one `channel` to choose from. It’s becoming a common practice to publish the master branch of your snap to the `edge` channel for internal and/or user testing. This can be done in the `build` job, with the following jobs installing the snap from the edge channel.

The first method is faster to complete and has the advantage of being able to run acceptance tests on your snap before it hits the Snap Store and touches any user, even testing users. The second method has the advantage of install from the Snap Store being one of the test that is run during CI.

### Authenticating with the snap store

The script [snapcraft-config-generator.py][18] can generate the store credentials and save them to `.snapcraft/snapcraft.cfg` (note: always inspect public scripts before running them). You don’t want to store this file in plaintext in your repo (for security reasons). You can either base64 encode the file and store it as a [private environment variable][19] or you can [encrypt the file][20] and just store the key in a private environment variable.

Here’s an example of having the store credentials in an encrypted file, and using the creds in a `deploy` step to publish to the Snap Store:

```
- deploy:
    name: Push to Snap Store
    command: |
      openssl aes-256-cbc -d -in .snapcraft/snapcraft.encrypted -out .snapcraft/snapcraft.cfg -k $KEY
      /snap/bin/snapcraft push *.snap

```

Instead of a deploy step, keeping with the Workflow examples from earlier, this could be a deploy job that only runs when and if the acceptance test jobs passed.

### More information

*   Alan Pope’s [Forum Post][2]: “popey” is a Canonical employee and wrote the post in [Snapcraft’s Forum][3] that inspired this blog post

*   [Snapcraft Website][4]: the official Snapcraft website

*   [Snapcraft’s CircleCI Bug Report][5]: There is an open bug report on Launchpad to add support for CircleCI to Snapcraft. This will make this process a little easier and more “official”. Please add your support.

*   How the [Nextcloud][6] snap is being built with CircleCI: a great blog post called [“Continuous acceptance tests for complex applications”][7]. Also influenced this blog post.

Original post [here][21]

--------------------------------------------------------------------------------

via: https://insights.ubuntu.com/2017/06/28/build-test-and-publish-snap-packages-using-snapcraft/

作者：[ Guest ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.ubuntu.com/author/guest/
[1]:https://circleci.com/docs/2.0/workflows/#using-workspaces-to-share-artifacts-among-jobs
[2]:https://forum.snapcraft.io/t/building-and-pushing-snaps-using-circleci/789
[3]:https://forum.snapcraft.io/
[4]:https://snapcraft.io/
[5]:https://bugs.launchpad.net/snapcraft/+bug/1693451
[6]:https://nextcloud.com/
[7]:https://kyrofa.com/posts/continuous-acceptance-tests-for-complex-applications
[8]:https://insights.ubuntu.com/author/guest/
[9]:https://snapcraft.io/
[10]:https://circleci.com/docs/2.0/
[11]:https://circleci.com/docs/2.0/first-steps/
[12]:https://circleci.com/docs/1.0/differences-between-trusty-and-precise/
[13]:https://circleci.com/blog/
[14]:https://circleci.com/docs/
[15]:http://www.seleniumhq.org/
[16]:https://circleci.com/blog/introducing-workflows-on-circleci-2-0/
[17]:https://circleci.com/docs/2.0/building-docker-images/
[18]:https://gist.github.com/3v1n0/479ad142eccdd17ad7d0445762dea755
[19]:https://circleci.com/docs/1.0/environment-variables/#setting-environment-variables-for-all-commands-without-adding-them-to-git
[20]:https://github.com/circleci/encrypted-files
[21]:https://circleci.com/blog/build-test-publish-snap-packages?utm_source=insightsubuntu&utm_medium=syndicatedblogpost
