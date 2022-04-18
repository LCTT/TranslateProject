[#]: subject: "MLCube and Podman"
[#]: via: "https://fedoramagazine.org/mlcube-and-podman/"
[#]: author: "Benson Muite https://fedoramagazine.org/author/fed500/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

MLCube and Podman
======

![Two sides of a blue cube with the text "Machine" and "Learning" on one face, and "Pod" and "Management" on the other face. The background is comprised of alternating zeroes and ones in green on black.][1]

[MLCube][2] is a new open source container based infrastructure specification introduced to enable reproducibility in Python based machine learning workflows. It can utilize tools such as [Podman][3], [Singularity][4] and [Docker][5]. Execution on remote platforms is also supported. One of the chairs of the MLCommons Best Practices working group that is developing MLCube is [Diane Feddema][6] from Red Hat. This introductory article explains how to run the [hello world MLCube example][7] using Podman on Fedora Linux.

[Yazan Monshed][8] has written a very helpful introduction to [Podman on Fedora][9] which gives more details on some of the steps used here.

First install the necessary dependencies.

```

    sudo dnf -y update
    sudo dnf -y install podman git virtualenv \
                        policycoreutils-python-utils

```

Then, following the documentation, setup a virtual environment and get the example code. To ensure reproducibility, use a specific commit as the project is being actively improved.

```

    virtualenv -p python3 ./env_mlcube
    source ./env_mlcube/bin/activate
    git clone https://github.com/mlcommons/mlcube_examples.git
    cd ./mlcube_examples/hello_world
    git checkout 5fe69bd
    pip install mlcube mlcube-docker
    mlcube describe

```

Now change the runner command from _docker_ to _podman_ by editing the file $HOME/mlcube.yaml so that the line

```

    docker: docker

```

becomes

```

    docker: podman

```

If you are on a computer with x86_64 architecture, you can get the container using

```

    mlcube configure --mlcube=. --platform=docker

```

You will see a number of options

```

    ? Please select an image:
      ▸ registry.fedoraproject.org/mlcommons/hello_world:0.0.1
        registry.access.redhat.com/mlcommons/hello_world:0.0.1
        docker.io/mlcommons/hello_world:0.0.1
        quay.io/mlcommons/hello_world:0.0.1

```

Choose docker.io/mlcommons/hello_world:0.0.1 to obtain the container.

If you are not on a computer with x86_64 architecture, you will need to build the container. Change the file $HOME/mlcube.yaml so that the line

```

    build_strategy: pull

```

becomes

```

    build_strategy: auto

```

and then build the container using

```

    mlcube configure --mlcube=. --platform=docker

```

To run the tests, you may need to set SELinux permissions in the directories appropriately. You can check that SELinux is enabled by typing

```

    sudo sestatus

```

which should give you output similar to

```

    SELinux status:                 enabled
    ...

```

[Josphat Mutai][10], [Christopher Smart][11] and [Daniel Walsh][12] explain that you need to be careful in setting appropriate SELinux policies for files used by containers. Here, you will allow the container to read and write to the _workspace_ directory.

```

    sudo semanage fcontext -a -t container_file_t "$PWD/workspace(/.*)?"
    sudo restorecon -Rv $PWD/workspace

```

Now check the directory policy by checking that

```

    ls -Z

```

gives output similar to

```

    unconfined_u:object_r:user_home_t:s0 Dockerfile
    unconfined_u:object_r:user_home_t:s0 README.md
    unconfined_u:object_r:user_home_t:s0 mlcube.yaml
    unconfined_u:object_r:user_home_t:s0 requirements.txt
    unconfined_u:object_r:container_file_t:s0 workspace

```

Now run the example

```

    mlcube run --mlcube=. --task=hello --platform=docker
    mlcube run --mlcube=. --task=bye --platform=docker

```

Finally, check that the output

```

    cat workspace/chats/chat_with_alice.txt

```

has text similar to

```

    Hi, Alice! Nice to meet you.
    Bye, Alice! It was great talking to you.

```

You can create your own MLCube as described [here][13]. Contributions to the [MLCube examples repository][14] are welcome. [Udica][15] is a new project that promises more fine grained SELinux policy controls for containers that are easy for system administrators to apply. Active development of these projects is ongoing. Testing and providing feedback on them would help make secure data management on systems with SELinux easier and more effective.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/mlcube-and-podman/

作者：[Benson Muite][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/fed500/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/04/MLCubePodman-816x345.jpg
[2]: https://mlcommons.org/en/mlcube/
[3]: https://podman.io/
[4]: https://sylabs.io/singularity/
[5]: https://www.docker.com/
[6]: https://www.redhat.com/en/authors/diane-feddema
[7]: https://mlcommons.github.io/mlcube/getting-started/hello-world/
[8]: https://fedoramagazine.org/author/yazanalmonshed/
[9]: https://fedoramagazine.org/getting-started-with-podman-in-fedora/
[10]: https://computingforgeeks.com/set-selinux-context-label-for-podman-graphroot-directory/
[11]: https://blog.christophersmart.com/2021/01/31/podman-volumes-and-selinux/
[12]: https://opensource.com/article/18/2/selinux-labels-container-runtimes
[13]: https://mlcommons.github.io/mlcube/tutorials/create-mlcube/
[14]: https://github.com/mlcommons/mlcube_examples
[15]: https://github.com/containers/udica
