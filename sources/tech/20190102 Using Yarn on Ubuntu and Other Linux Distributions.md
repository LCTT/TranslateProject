[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using Yarn on Ubuntu and Other Linux Distributions)
[#]: via: (https://itsfoss.com/install-yarn-ubuntu)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Using Yarn on Ubuntu and Other Linux Distributions
======

**This quick tutorial shows you the official way of installing Yarn package manager on Ubuntu and Debian Linux. You’ll also learn some basic Yarn commands and the steps to remove Yarn completely.**

[Yarn][1] is an open source JavaScript package manager developed by Facebook. It is an alternative or should I say improvement to the popular npm package manager. [Facebook developers’ team][2] created Yarn to overcome the shortcomings of [npm][3]. Facebook claims that Yarn is faster, reliable and more secure than npm.

Like npm, Yarn provides you a way to automate the process of installing, updating, configuring, and removing packages retrieved from a global registry.

The advantage of Yarn is that it is faster as it caches every package it downloads so it doesn’t need to download it again. It also parallelizes operations to maximize resource utilization. Yarn also uses [checksums to verify the integrity][4] of every installed package before its code is executed. Yarn also guarantees that an install that worked on one system will work exactly the same way on any other system.

If you are [using nodejs on Ubuntu][5], probably you already have npm installed on your system. In that case, you can use npm to install Yarn globally in the following manner:

```
sudo npm install yarn -g
```

However, I would recommend using the official way to install Yarn on Ubuntu/Debian.

### Installing Yarn on Ubuntu and Debian [The Official Way]

![Yarn JS][6]

The instructions mentioned here should be applicable to all versions of Ubuntu such as Ubuntu 18.04, 16.04 etc. The same set of instructions are also valid for Debian and other Debian based distributions.

Since the tutorial uses Curl to add the GPG key of Yarn project, it would be a good idea to verify whether you have Curl installed already or not.

```
sudo apt install curl
```

The above command will install Curl if it wasn’t installed already. Now that you have curl, you can use it to add the GPG key of Yarn project in the following fashion:

```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
```

After that, add the repository to your sources list so that you can easily upgrade the Yarn package in future with the rest of the system updates:

```
sudo sh -c 'echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list'
```

You are set to go now. [Update Ubuntu][7] or Debian system to refresh the list of available packages and then install yarn:

```
sudo apt update
sudo apt install yarn
```

This will install Yarn along with nodejs. Once the process completes, verify that Yarn has been installed successfully. You can do that by checking the Yarn version.

```
yarn --version
```

For me, it showed an output like this:

```
yarn --version
1.12.3
```

This means that I have Yarn version 1.12.3 installed on my system.

### Using Yarn

I presume that you have some basic understandings of JavaScript programming and how dependencies work. I am not going to go in details here. I’ll show you some of the basic Yarn commands that will help you getting started with it.

#### Creating a new project with Yarn

Like npm, Yarn also works with a package.json file. This is where you add your dependencies. All the packages of the dependencies are cached in the node_modules directory in the root directory of your project.

In the root directory of your project, run the following command to generate a fresh package.json file:

It will ask you a number of questions. You can skip the questions r go with the defaults by pressing enter.

```
yarn init
yarn init v1.12.3
question name (test_yarn): test_yarn_proect
question version (1.0.0): 0.1
question description: Test Yarn
question entry point (index.js):
question repository url:
question author: abhishek
question license (MIT):
question private:
success Saved package.json
Done in 82.42s.
```

With this, you get a package.json file of this sort:

```
{
 "name": "test_yarn_proect",
 "version": "0.1",
 "description": "Test Yarn",
 "main": "index.js",
 "author": "abhishek",
 "license": "MIT"
}
```

Now that you have the package.json, you can either manually edit it to add or remove package dependencies or use Yarn commands (preferred).

#### Adding dependencies with Yarn

You can add a dependency on a certain package in the following fashion:

```
yarn add <package_name>
```

For example, if you want to use [Lodash][8] in your project, you can add it using Yarn like this:

```
yarn add lodash
yarn add v1.12.3
info No lockfile found.
[1/4] Resolving packages…
[2/4] Fetching packages…
[3/4] Linking dependencies…
[4/4] Building fresh packages…
success Saved lockfile.
success Saved 1 new dependency.
info Direct dependencies
└─ [email protected]
info All dependencies
└─ [email protected]
Done in 2.67s.
```

And you can see that this dependency has been added automatically in the package.json file:

```
{
 "name": "test_yarn_proect",
 "version": "0.1",
 "description": "Test Yarn",
 "main": "index.js",
 "author": "abhishek",
 "license": "MIT",
 "dependencies": {
 "lodash": "^4.17.11"
 }
}
```

By default, Yarn will add the latest version of a package in the dependency. If you want to use a specific version, you may specify it while adding.

As always, you can also update the package.json file manually.

#### Upgrading dependencies with Yarn

You can upgrade a particular dependency to its latest version with the following command:

```
yarn upgrade <package_name>
```

It will see if the package in question has a newer version and will update it accordingly.

You can also change the version of an already added dependency in the following manner:

You can also upgrade all the dependencies of your project to their latest version with one single command:

```
yarn upgrade
```

It will check the versions of all the dependencies and will update them if there are any newer versions.

#### Removing dependencies with Yarn

You can remove a package from the dependencies of your project in this way:

```
yarn remove <package_name>
```

#### Install all project dependencies

If you made any changes to the project.json file, you should run either

```
yarn
```

or

```
yarn install
```

to install all the dependencies at once.

### How to remove Yarn from Ubuntu or Debian

I’ll complete this tutorial by mentioning the steps to remove Yarn from your system if you used the above steps to install it. If you ever realized that you don’t need Yarn anymore, you will be able to remove it.

Use the following command to remove Yarn and its dependencies.

```
sudo apt purge yarn
```

You should also remove the Yarn repository from the repository list:

```
sudo rm /etc/apt/sources.list.d/yarn.list
```

The optional next step is to remove the GPG key you had added to the trusted keys. But for that, you need to know the key. You can get that using the apt-key command:

Warning: apt-key output should not be parsed (stdout is not a terminal) pub rsa4096 2016-10-05 [SC] 72EC F46A 56B4 AD39 C907 BBB7 1646 B01B 86E5 0310 uid [ unknown] Yarn Packaging

Warning: apt-key output should not be parsed (stdout is not a terminal) pub rsa4096 2016-10-05 [SC] 72EC F46A 56B4 AD39 C907 BBB7 1646 B01B 86E5 0310 uid [ unknown] Yarn Packaging yarn@dan.cx sub rsa4096 2016-10-05 [E] sub rsa4096 2019-01-02 [S] [expires: 2020-02-02]

The key here is the last 8 characters of the GPG key’s fingerprint in the line starting with pub.

So, in my case, the key is 86E50310 and I’ll remove it using this command:

```
sudo apt-key del 86E50310
```

You’ll see an OK in the output and the GPG key of Yarn package will be removed from the list of GPG keys your system trusts.

I hope this tutorial helped you to install Yarn on Ubuntu, Debian, Linux Mint, elementary OS etc. I provided some basic Yarn commands to get you started along with complete steps to remove Yarn from your system.

I hope you liked this tutorial and if you have any questions or suggestions, please feel free to leave a comment below.


--------------------------------------------------------------------------------

via: https://itsfoss.com/install-yarn-ubuntu

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://yarnpkg.com/lang/en/
[2]: https://code.fb.com/
[3]: https://www.npmjs.com/
[4]: https://itsfoss.com/checksum-tools-guide-linux/
[5]: https://itsfoss.com/install-nodejs-ubuntu/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/01/yarn-js-ubuntu-debian.jpeg?resize=800%2C450&ssl=1
[7]: https://itsfoss.com/update-ubuntu/
[8]: https://lodash.com/
