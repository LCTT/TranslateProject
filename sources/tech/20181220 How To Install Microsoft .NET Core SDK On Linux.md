[#]: collector: (lujun9972)
[#]: translator: (runningwater)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Install Microsoft .NET Core SDK On Linux)
[#]: via: (https://www.ostechnix.com/how-to-install-microsoft-net-core-sdk-on-linux/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

How To Install Microsoft .NET Core SDK On Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/12/NET-Core-SDK-720x340.png)

The **.NET Core** is a free, cross platform and open source framework developed by Microsoft to build desktop applications, mobile apps, web apps, IoT apps and gaming apps etc. If you’re dotnet developer coming from Windows platform, .NET core helps you to setup your development environment easily on any Linux and Unix-like operating systems. This step by step guide explains how to install Microsoft .NET Core SDK on Linux and how to write your first app using .Net.

### Install Microsoft .NET Core SDK On Linux

The .NET core supports GNU/Linux, Mac OS and Windows. .Net core can be installed on popular GNU/Linux operating systems including Debian, Fedora, CentOS, Oracle Linux, RHEL, SUSE/openSUSE, and Ubuntu. As of writing this guide, the latest .NET core version was **2.2**.

On **Debian 9** , you can install .NET Core SDK as shown below.

First of all, you need to register Microsoft key and add .NET repository by running the following commands:

```
$ wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
$ sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
$ wget -q https://packages.microsoft.com/config/debian/9/prod.list
$ sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
$ sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
$ sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list
```

After registering the key and adding the repository, install .NET SDK using commands:

```
$ sudo apt-get update
$ sudo apt-get install dotnet-sdk-2.2
```

**On Debian 8:**

Add Microsoft key and enable .NET repository:

```
$ wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
$ sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
$ wget -q https://packages.microsoft.com/config/debian/8/prod.list
$ sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
$ sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
$ sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list
```

Install .NET SDK:

```
$ sudo apt-get update
$ sudo apt-get install dotnet-sdk-2.2
```

**On Fedora 28:**

Add Microsoft key and enable .NET repository:

```
$ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
$ wget -q https://packages.microsoft.com/config/fedora/27/prod.repo
$ sudo mv prod.repo /etc/yum.repos.d/microsoft-prod.repo
$ sudo chown root:root /etc/yum.repos.d/microsoft-prod.repo
```

Now, Install .NET SDK:

```
$ sudo dnf update
$ sudo dnf install dotnet-sdk-2.2
```

On **Fedora 27** , add the key and repository using commands:

```
$ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
$ wget -q https://packages.microsoft.com/config/fedora/27/prod.repo
$ sudo mv prod.repo /etc/yum.repos.d/microsoft-prod.repo
$ sudo chown root:root /etc/yum.repos.d/microsoft-prod.repo
```

And install .NET SDK using commands:

```
$ sudo dnf update
$ sudo dnf install dotnet-sdk-2.2
```

**On CentOS/Oracle Linux:**

Add Microsoft key and enable .NET core repository:

```
$ sudo rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
```

Update the repositories and install .NET SDK:

```
$ sudo yum update
$ sudo yum install dotnet-sdk-2.2
```

**On openSUSE Leap:**

Add key, enable repository and install necessary dependencies using the following commands:

```
$ sudo zypper install libicu
$ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
$ wget -q https://packages.microsoft.com/config/opensuse/42.2/prod.repo
$ sudo mv prod.repo /etc/zypp/repos.d/microsoft-prod.repo
$ sudo chown root:root /etc/zypp/repos.d/microsoft-prod.repo
```

Update the repositories and Install .NET SDK using commands:

```
$ sudo zypper update
$ sudo zypper install dotnet-sdk-2.2
```

**On Ubuntu 18.04 LTS:**

Register the Microsoft key and .NET core repository using commands:

```
$ wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
$ sudo dpkg -i packages-microsoft-prod.deb
```

Enable ‘Universe’ repository using:

```
$ sudo add-apt-repository universe
```

Then, install .NET Core SDK using command:

```
$ sudo apt-get install apt-transport-https
$sudo apt-get update
$ sudo apt-get install dotnet-sdk-2.2
```

**On Ubuntu 16.04 LTS:**

Register Microsoft key and .NET repository using commands:

```
$ wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
$ sudo dpkg -i packages-microsoft-prod.deb
```

And then, Install .NET core SDK:

```
$ sudo apt-get install apt-transport-https
$ sudo apt-get update
$ sudo apt-get install dotnet-sdk-2.2
```

### Create Your First App

We have successfully installed .Net Core SDK in our Linux box. It is time to create our first app using dotnet.

For the purpose of this guide, I am going to create a new app called **“ostechnixApp”**. To do so, simply run the following command:

```
$ dotnet new console -o ostechnixApp
```

**Sample output:**

```
Welcome to .NET Core!
---------------------
Learn more about .NET Core: https://aka.ms/dotnet-docs
Use 'dotnet --help' to see available commands or visit: https://aka.ms/dotnet-cli-docs

Telemetry
---------
The .NET Core tools collect usage data in order to help us improve your experience. The data is anonymous and doesn't include command-line arguments. The data is collected by Microsoft and shared with the community. You can opt-out of telemetry by setting the DOTNET_CLI_TELEMETRY_OPTOUT environment variable to '1' or 'true' using your favorite shell.

Read more about .NET Core CLI Tools telemetry: https://aka.ms/dotnet-cli-telemetry

ASP.NET Core
------------
Successfully installed the ASP.NET Core HTTPS Development Certificate.
To trust the certificate run 'dotnet dev-certs https --trust' (Windows and macOS only). For establishing trust on other platforms refer to the platform specific documentation.
For more information on configuring HTTPS see https://go.microsoft.com/fwlink/?linkid=848054.
Getting ready...
The template "Console Application" was created successfully.

Processing post-creation actions...
Running 'dotnet restore' on ostechnixApp/ostechnixApp.csproj...
Restoring packages for /home/sk/ostechnixApp/ostechnixApp.csproj...
Generating MSBuild file /home/sk/ostechnixApp/obj/ostechnixApp.csproj.nuget.g.props.
Generating MSBuild file /home/sk/ostechnixApp/obj/ostechnixApp.csproj.nuget.g.targets.
Restore completed in 894.27 ms for /home/sk/ostechnixApp/ostechnixApp.csproj.

Restore succeeded.
```

As you can see in the above output, .Net has created a new application of type console. The parameter -o creates a directory named “ostechnixApp” where you store your app data with all necessary files.

Let us switch to ostechnixApp directory and see what’s in there.

```
$ cd ostechnixApp/
$ ls
obj ostechnixApp.csproj Program.cs
```

As you there are three files named **ostechnixApp.csproj** and **Program.cs** and one directory named **obj**. By default, the Program.cs file will contain the code to run the ‘Hello World’ program in the console. Let us have a look at the code.

```
$ cat Program.cs
using System;

namespace ostechnixApp
{
 class Program
 {
 static void Main(string[] args)
 {
 Console.WriteLine("Hello World!");
 }
 }
}
```

To run the newly created app, simply run the following command:

```
$ dotnet run
Hello World!
```

![](https://www.ostechnix.com/wp-content/uploads/2018/12/run-dotnet.png)

Simple, isn’t it? Yes, it is! Now, you can write your code in the **Program.cs** file and run it as shown above.

Alternatively, you can create a new directory, for example mycode, using commands:

```
$ mkdir ~/.mycode

$ cd mycode/
```

…and make that as your new development environment by running the following command:

```
$ dotnet new console
```

Sample output:

```
The template "Console Application" was created successfully.

Processing post-creation actions...
Running 'dotnet restore' on /home/sk/mycode/mycode.csproj...
Restoring packages for /home/sk/mycode/mycode.csproj...
Generating MSBuild file /home/sk/mycode/obj/mycode.csproj.nuget.g.props.
Generating MSBuild file /home/sk/mycode/obj/mycode.csproj.nuget.g.targets.
Restore completed in 331.87 ms for /home/sk/mycode/mycode.csproj.

Restore succeeded.
```

The above command will create two files named **mycode.csproj** and **Program.cs** and one directory named **obj**. Open the Program.cs file in your favorite editor, delete or modify the existing ‘hello world’ code with your own code.

Once the code is written, save and close the Program.cs file and run the app using command:

```
$ dotnet run
```

To check the installed .NET core SDK version, simply run:

```
$ dotnet --version
2.2.101
```

To get help, run:

```
$ dotnet --help
```

### Get Microsoft Visual Studio Code Editor

To write the code, you can use your favorite editors of your choice. Microsoft has also its own editor named “ **Microsoft Visual Studio Code** ” with support for .NET. It is an open source, lightweight and powerful source code editor. It comes with built-in support for JavaScript, TypeScript and Node.js and has a rich ecosystem of extensions for other languages (such as C++, C#, Python, PHP, Go) and runtimes (such as .NET and Unity). It is a cross-platform code editor, so you can use it in Microsoft Windows, GNU/Linux, and Mac OS X. You can use it if you’re interested.

To know how to install and use it on Linux, please refer the following guide.

[Install Microsoft Visual Studio Code In Linux][3]

[**This page**][1] has some basic tutorials to learn .NET Core and .NET Core SDK tools using Visual Studio Code editor. Go and check them to learn more.

### Telemetry

By default, the .NET core SDK will collect the usage data using a feature called **‘Telemetry’**. The collected data is anonymous and shared to the development team and community under the [Creative Commons Attribution License][2]. So the .NET team will understand how the tools are used and decide how they can be improved over time. If you don’t want to share your usage information, you can simply opt-out of telemetry by setting the **DOTNET_CLI_TELEMETRY_OPTOUT** environment variable to **‘1’** or **‘true’** using your favorite shell.

And, that’s all. You know how to install .NET Core SDK on various Linux platforms and how to create a basic app using it. TO learn more about .NET usage, refer the links given at the end of this guide.

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-install-microsoft-net-core-sdk-on-linux/

作者：[SK][a]
选题：[lujun9972][b]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://docs.microsoft.com/en-us/dotnet/core/tutorials/index
[2]: https://creativecommons.org/licenses/by/4.0/
[3]: https://www.ostechnix.com/install-microsoft-visual-studio-code-linux/
