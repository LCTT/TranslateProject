Translating by stevenzdg988.

An introduction to Libral, a systems management library for Linux
============================================================

### Libral provides a uniform management API across system resources and serves as a solid foundation for scripting management tasks and building configuration-management systems.


![An introduction to Libral, a systems management library for Linux](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/yearbook-haff-rx-linux-file-lead_0.png?itok=48iDNoH8 "An introduction to Libral, a systems management library for Linux")
>Image by : [Internet Archive Book Images][10]. Modified by Opensource.com. CC BY-SA 4.0

Linux, in keeping with Unix traditions, doesn't have a comprehensive systems management API. Instead, management is done through a variety of special-purpose tools and APIs, all with their own conventions and idiosyncrasies. That makes scripting even simple systems-management tasks difficult and brittle.

For example, changing the login shell of the "app" user is done by running **usermod -s /sbin/nologin app**. This works great until it is attempted on a system that does not have an app user. To fix the ensuing failure, the enterprising script writer might now resort to:

```
    grep -q app /etc/passwd \
      && usermod -s /sbin/nologin app \
      || useradd ... -s /sbin/nologin app
```

So that the change in the login shell is performed when the app user is present on the system, and the user is created if it is not present yet. Unfortunately, this approach to scripting systems-management tasks is not sustainable: For each kind of resource, a different set of tools and their idiosyncrasies must be taken into account; inconsistent and often incomplete error reporting makes error handling difficult; and it is easy to trip over small bugs caused by the ad hoc nature of the tools involved.

In fact, the above example is not correct: **grep** doesn't look for the **app** user, it simply looks for any line in **/etc/passwd** that contains the string **app**, something that might work most of the time, but can fail—usually at the worst possible moment.



Clearly, management tools that make it hard to perform simple tasks from scripts are, at best, a difficult basis for larger management systems. Recognizing this, existing configuration-management systems, such as Puppet, Chef, or Ansible, have gone to great lengths to build their own internal APIs around the management of basic operating system resources. These resource abstractions are internal APIs, and closely tied to the needs of their respective tools. This causes not only a colossal duplication of effort, but also creates a strong barrier to entry for new and innovative management tools.

One area where this barrier to entry becomes evident is in building VM or container images: In the course of building such images, it is often necessary to either answer simple questions about them or make simple changes to them. But since the tools for this all require special treatment, these questions and changes face exactly the problems that somebody trying to script them faces. As a consequence, image building must rely on either ad hoc scripts or using (and installing) a quite substantial configuration-management system.

[Libral][11] establishes a solid foundation for management tools and tasks by providing a common management API across system resources and by making it available through a command line tool, **ralsh**, that enables users to query and to modify system resources in a uniform way, with predictable error reporting. In the above example, checking whether the app user exists is done with **ralsh -aq user app**; checking whether the package **foo** is installed is done with **ralsh -aq package foo**; and, in general, checking whether a resource of type **TYPE** with name **NAME** is present is done with **ralsh -aq TYPE NAME**. Similarly, to create or change an existing user, one runs:

```
    ralsh user app home=/srv/app shell=/sbin/nologin
```

and to create or change an entry in **/etc/hosts**, one runs:

```
    ralsh hostmyhost.example.com ip=10.0.0.1 \
      host_aliases=myhost,apphost
```

In this manner, the user of ralsh is isolated from the fact that these two commands work quite differently internally: The first one needs to use the proper invocation of **useradd** or **usermod**, whereas the second needs to edit the file **/etc/hosts**. For the user, though, they both appear to take the same shape: "Make sure that this resource is in the state that I need."

### Where to get Libral and how to use it

Libral is available from [this git repo][12]. Its core is written in C++, and instructions for building it can be found [in the repo][13]. That is only necessary if you actually want to contribute to Libral's C++ core. The Libral site also contains a [prebuilt tarball][14] that can be used on any Linux machine that uses **glibc 2.12** or later. The contents of that tarball can be used both to explore ralsh further and to develop new providers, which give Libral the capability to manage new kinds of resources.

After downloading and unpacking the tarball, the **ralsh** command can be found in **ral/bin**. Running it without arguments will list all resource types that Libral knows about. Passing the **--help **option prints output that contains more example of how to use **ralsh**.

### Relationship to configuration-management systems

Well-known configuration-management systems, such as Puppet, Chef, or Ansible, address some of the same problems that Libral addresses. What sets Libral apart from them is mostly in the things that these systems do and Libral doesn't. Configuration-management systems are built to deal with the variety and complexity of managing many different things across large numbers of nodes. Libral, on the other hand, aims at providing a low-level systems management API that is well-defined, independent of any particular tool, and usable with a wide variety of programming languages.

By removing the application logic that the large configuration-management systems contain, Libral is much more versatile in how it can be used, from the simple scripting tasks mentioned in the introduction, to serving as the building blocks for complex management applications. Focusing on these basics also allows it to be very small, currently less than 2.5 MB, an important consideration for resource-constrained environments, including containers and small devices.

### The Libral API

The design of the Libral API is guided by the experience of implementing large configuration-management systems over the last decade; while it is not directly tied to any of them, it takes them into account and makes choices to overcome their shortcomings.

There are four important principles that the API design rests on:

*   Desired state 

*   Bidirectionality 

*   Lightweight abstractions

*   Ease of extension

Basing a management API on desired state, i.e., the idea that the user expresses what the system should look like after an operation rather than how to get into that state, is hardly controversial at this point. Bidirectionality makes it possible to use the same API and, more importantly, the same resource abstractions to read existing state and to enforce changes to it. Lightweight abstractions ensure that it is easy to learn the API and make use of it quickly; past attempts at such management APIs have unduly burdened the user with learning a modeling framework, an important factor in their lack of adoption.

Finally, it has to be easy to extend Libral's management capabilities so that users can teach Libral how to manage new kinds of resources. This is important both because of the sheer amount of resources that one might want to manage (and that Libral will manage in due time), as well as because even a fully built-out Libral will always fall short of a user's custom management needs.

Currently, the main way to interact with the Libral API is through the **ralsh **command line tool. It exposes the underlying C++ API, which is still in flux, and is mainly geared at simple scripting tasks. The project also provides language bindings for CRuby, with others to follow.

In the future, Libral will also provide a daemon with a remote API, so that it can serve as the basis for management systems that do not need to install additional agents on managed nodes. This, coupled with the ability to tailor the management capabilities of Libral, makes it possible to tightly control which aspects of a system can be managed and which ones are protected from any interference.

For example, a Libral installation that is restricted to managing users and services will be guaranteed to not interfere with the packages installed on a node. Controlling what gets managed in this manner is currently not possible with any of the existing configuration-management systems; in particular, systems that require arbitrary SSH access to a managed node also expose that system to unwanted accidental or malicious interference.

The basis of the Libral API is formed by two very simple operations: **get** to retrieve the current state of resources, and **set** to enforce the state of current resources. Idealizing a little from the actual implementation, they can be thought of as:

```
  provider.get(names) -> List[resource]
  provider.set(List[update]) -> List[change]
```

The **provider** is the object that knows how to manage a certain kind of resource, like a user, a service, or a package, and the Libral API provides ways to look up the provider for a certain kind of resource.

The **get** operation receives a list of resource names, e.g., usernames, and needs to produce a list of resources, which are essentially hashes listing the attributes of each resource. This list must contain resources with the provided names, but might contain more, so that a naive **get** implementation can simply ignore the names and list all the resources it knows about.

The **set** operation is used to enforce desired state and receives a list of updates. Each update contains **update.is**, a resource representing the current state, and **update.should**, a resource representing the desired state. Calling the **set** method will make sure that the resources mentioned in the update list will be in the state indicated in **update.should** and produces a list of the changes made to each resource.

With **ralsh**, the current state of the **root** user can be retrieved with the command **ralsh user root**; by default, the command produces human-readable output, reminiscent of Puppet, but **ralsh** also supports a **--json** flag to make it produce JSON output for consumption by
scripts. The human-readable output is:

```
    # ralsh user root
    user::useradd { 'root':
      ensure  => 'present',
      comment => 'root',
      gid     => '0',
      groups  => ['root'],
      home    => '/root',
      shell   => '/bin/bash',
      uid     => '0',
    }
```

Similarly, the user can be changed with:

```
    # ralsh user root comment='The superuser'
    user::useradd { 'root':
      ensure  => 'present',
      comment => 'The superuser',
      gid     => '0',
      groups  => ['root'],
      home    => '/root',
      shell   => '/bin/bash',
      uid     => '0',
    }
    comment(root->The superuser)
```

The output of ralsh lists both the new state of the root user, with the changed comment attribute, and what changes were made (solely to the **comment** attribute in this case). Running the same command a second time will produce much the same output, but without any change indication, as none will be needed.

### Writing providers

It is crucially important that writing new providers for ralsh is easy and requires a minimum amount of effort. For this reason, ralsh offers a number of calling conventions that make it possible to trade the complexity of implementing a provider against the power of what the provider can do. Providers can either be external scripts that adhere to a specific calling convention or be implemented in C++ and built into Libral. Currently, there are three calling conventions:

*   The [simple][6] calling convention is geared towards writing shell scripts that serve as providers

*   The [JSON][7] calling convention is meant for writing providers in scripting languages like Ruby or Python

*   The [internal C++ API][8] can be used to implement providers natively

It is highly recommended to start provider development using the **simple** or the **JSON** calling convention. The file [simple.prov][15] on GitHub contains a skeleton for a simple shell provider, and it should be easy to adapt it for one's own provider. The file [python.prov][16] contains the skeleton of a JSON provider written in Python.

One problem with using higher-level scripting languages for providers is that the runtimes, including all supporting libraries, for these languages need to be present on the system on which Libral will run. In some cases, that is not an obstacle; for example, a provider that does package management based on **yum** can expect that Python is present on the system, as **yum** is written in it.

In many other cases though, there's no logical choice for a language beyond Bourne shell (or Bash) that can be expected to be installed on all managed systems. Often, provider writers need a more powerful scripting environment than just that. Unfortunately, bundling a full Ruby or Python interpreter with its runtime would increase Libral's size beyond what can reasonably be
used in resource-constrained environments. On the other hand, the canonical choices of Lua or Javascript as small embeddable scripting languages are not suitable for this context as they are both not familiar to most provider writers, and require quite a bit of work to expose commonly needed facilities for systems management.

Libral bundles a version of [mruby][17], a small, embeddable version of Ruby, to give provider writers a stable foundation, and a powerful programming language for their implementation. mruby is a full implementation of the Ruby language, albeit with a much reduced standard library. The mruby bundled with Libral contains the parts of Ruby's standard library most important for scripting management tasks, which will be enhanced further over time based on the needs of provider writers. Libral's mruby also bundles an API adpater that makes writing providers to the json convention more comfortable, as it contains simple utilities (like [Augeas][18] for modifying structured files) and conveniences around parsing and outputting JSON. The file [mruby.prov][19] contains a skeleton example of a json provider written in mruby.

### Future work

The most important next steps for Libral are to make it more widely usable—the [precompiled tarball][20] is a great way to get started and sufficient to develop providers, but Libral also needs to be packaged and made available in mainstream distributions. In a similar vein, the utility of Libral strongly depends on the set of providers it ships with and those need to be expanded to cover a core set of management functionality. The Libral site contains [a todo list][21] showing the providers that are most urgently needed.

There are also several ways in which the availability of Libral for different uses can be improved: from writing bindings for additional languages, for example, Python or Go, to making the use of **ralsh** in shell scripts even easier by offering, besides the existing human-readable output and JSON output, an output format that is easy to process in shell scripts. Use of Libral for larger-scale management can also be improved by adding the remote API discussed above, and by better supporting bulk installation of Libral via transports like SSH—that mostly requires providing prebuilt tarballs for more architectures and scripts that can select the right one based on the discovered architecture of the target system.

There are many more ways in which Libral, its API, and its capabilities could evolve; one intriguing possibility is adding notification capabilities to the API so that Libral can report changes to system resources as they happen outside of its purview. The challenge for Libral will be to continue to be a small, lightweight and well-defined tool while covering an ever increasing set of uses and management capabilities—a challenge and a journey that I encourage every reader to become a part of.

If any of this has made you curious, I would love to hear from you, be it in the form of a pull request, an enhancement request, or just a report of your experience trying out **ralsh**.

--------------------------------------------------------------------------------

作者简介：

David Lutterkort - David is a software engineer at Puppet, where he’s worked on projects such as Direct Puppet and Razor, the best provisioning tool, ever. He was one of the earliest contributors to Puppet and is the main author of Augeas, a configuration editing tool. 

------------------------

via: https://opensource.com/article/17/5/intro-libral-systems-management-library-linux

作者：[David Lutterkort][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/david-lutterkort
[1]:https://opensource.com/resources/what-is-linux?src=linux_resource_menu
[2]:https://opensource.com/resources/what-are-linux-containers?src=linux_resource_menu
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=7016000000127cYAAQ
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?src=linux_resource_menu&intcmp=7016000000127cYAAQ
[5]:https://opensource.com/tags/linux?src=linux_resource_menu
[6]:https://github.com/puppetlabs/libral/blob/master/doc/invoke-simple.md
[7]:https://github.com/puppetlabs/libral/blob/master/doc/invoke-json.md
[8]:https://github.com/puppetlabs/libral/blob/master/doc/invoke-native.md
[9]:https://opensource.com/article/17/5/intro-libral-systems-management-library-linux?rate=PqOZGb7A0LUlHQRwkzl23iaJZ2ZUy6gKcc6HOzaRL58
[10]:https://www.flickr.com/photos/internetarchivebookimages/14803082483/in/photolist-oy6EG4-pZR3NZ-i6r3NW-e1tJSX-boBtf7-oeYc7U-o6jFKK-9jNtc3-idt2G9-i7NG1m-ouKjXe-owqviF-92xFBg-ow9e4s-gVVXJN-i1K8Pw-4jybMo-i1rsBr-ouo58Y-ouPRzz-8cGJHK-85Evdk-cru4Ly-rcDWiP-gnaC5B-pAFsuf-hRFPcZ-odvBMz-hRCE7b-mZN3Kt-odHU5a-73dpPp-hUaaAi-owvUMK-otbp7Q-ouySkB-hYAgmJ-owo4UZ-giHgqu-giHpNc-idd9uQ-osAhcf-7vxk63-7vwN65-fQejmk-pTcLgA-otZcmj-fj1aSX-hRzHQk-oyeZfR
[11]:https://github.com/puppetlabs/libral
[12]:https://github.com/puppetlabs/libral
[13]:https://github.com/puppetlabs/libral#building-and-installation
[14]:http://download.augeas.net/libral/ralsh-latest.tgz
[15]:https://github.com/puppetlabs/libral/blob/master/examples/providers/simple.prov
[16]:https://github.com/puppetlabs/libral/blob/master/examples/providers/python.prov
[17]:http://mruby.org/
[18]:http://augeas.net/
[19]:https://github.com/puppetlabs/libral/blob/master/examples/providers/mruby.prov
[20]:http://download.augeas.net/libral/ralsh-latest.tgz
[21]:https://github.com/puppetlabs/libral#todo-list
[22]:https://opensource.com/user/140051/feed
[23]:https://opensource.com/users/david-lutterkort
