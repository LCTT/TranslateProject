[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage multiple Terraform versions with tfenv)
[#]: via: (https://opensource.com/article/20/11/tfenv)
[#]: author: (Jessica Cherry https://opensource.com/users/cherrybomb)

Manage multiple Terraform versions with tfenv
======
If you use multiple Terraform versions in your environment, tfenv will
make your life much easier.
![Computer screen with files or windows open][1]

In my [Terraform for Kubernetes beginners][2] article, I used Terraform 11, and in an upcoming article, I'll cover upgrading from Terraform 11 to 12. To prepare for that, in this article, I'll show you how to use [tfenv][3], a tool that makes it much easier to convert from one version to another, as well as to manage multiple Terraform versions in your work environment.

### Install tfenv

Many coding languages have tools that allow you to go back and forth between versions based on environmental rules. One example (which tfenv is based on) is [rbenv][4], which allows you to choose which version of [Ruby][5] you want to work with.

tfenv works on Linux, macOS, and Windows; I'll cover the Linux installation using Ubuntu 18.04, but the tool's GitHub repository has [installation instructions][6] for the other operating systems.

The Linux installation uses some Git commands (check out the [intro to Git][7] series if you're not already familiar with it).

First, create a `.tfenv` folder in your `${HOME}` directory:


```
`jess@Athena:~$ mkdir .tfenv`
```

Clone the `tfenv` repository:


```
jess@Athena:~$ git clone <https://github.com/tfutils/tfenv.git> ~/.tfenv
Cloning into '/home/jess/.tfenv'...
remote: Enumerating objects: 21, done.
remote: Counting objects: 100% (21/21), done.
remote: Compressing objects: 100% (19/19), done.
remote: Total 1105 (delta 8), reused 10 (delta 2), pack-reused 1084
Receiving objects: 100% (1105/1105), 216.01 KiB | 2.84 MiB/s, done.
Resolving deltas: 100% (703/703), done.
```

If you prefer [Homebrew][8], you can use:


```
`$ brew install tfenv`
```

Export your path into your Bash profile:


```
`jess@Athena:~$ echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile`
```

If you want to use just the base commands for Ubuntu/Debian-based systems, there is another option that makes things a little easier. After doing the clone in the `.tfenv` directory, set your profile to put the `tfenv` command into your profile in your next session:


```
`jess@Athena:~/.tfenv$ . ~/.profile`
```

Once the profile is set, you can symlink your directory to your `.local/bin` directory to make `tfenv` an executable binary:


```
`jess@Athena:~/.tfenv$ ln -s ~/.tfenv/bin/* ~/.local/bin`
```

Run the `which` command, and you should see `tfenv`'s location:


```
jess@Athena:~/.tfenv$ which tfenv
/home/jess/.local/bin/tfenv
```

### How to use tfenv

Now that everything is installed, check out what commands are available:


```
jess@Athena:~$ tfenv
tfenv 2.0.0-37-g0494129
Usage: tfenv &lt;command&gt; [&lt;options&gt;]

Commands:
   install      Install a specific version of Terraform
   use          Switch a version to use
   uninstall    Uninstall a specific version of Terraform
   list         List all installed versions
   list-remote  List all installable versions
```

As you can see, it's a pretty straightforward tool that enables you to install and uninstall Terraform versions as needed.

Before you decide what to install, check which versions are available. This is a small snippet, as the list is about a mile long:


```
jess@Athena:~$ tfenv list-remote
0.14.0-beta1
0.14.0-alpha20201007
0.14.0-alpha20200923
0.14.0-alpha20200910
0.13.5
0.13.4
0.13.3
0.13.2
0.13.1
0.13.0
0.13.0-rc1
0.13.0-beta3
0.13.0-beta2
0.13.0-beta1
0.12.29
0.12.28
0.12.27
```

#### Install Terraform versions

To install the latest version of Terraform:


```
jess@Athena:~$ tfenv install latest
Installing Terraform v0.13.5
Downloading release tarball from <https://releases.hashicorp.com/terraform/0.13.5/terraform\_0.13.5\_linux\_amd64.zip>
###################################################################################################################################################################################### 100.0%
Downloading SHA hash file from <https://releases.hashicorp.com/terraform/0.13.5/terraform\_0.13.5\_SHA256SUMS>
No keybase install found, skipping OpenPGP signature verification
Archive:  tfenv_download.N3bzZ2/terraform_0.13.5_linux_amd64.zip
  inflating: /home/jess/.tfenv/versions/0.13.5/terraform  
Installation of terraform v0.13.5 successful. To make this your default version, run 'tfenv use 0.13.5'
```

To install a specific Terraform version (in this case, 0.12.29):


```
jess@Athena:~$ tfenv install 0.12.29
Installing Terraform v0.12.29
Downloading release tarball from <https://releases.hashicorp.com/terraform/0.12.29/terraform\_0.12.29\_linux\_amd64.zip>
###################################################################################################################################################################################### 100.0%
Downloading SHA hash file from <https://releases.hashicorp.com/terraform/0.12.29/terraform\_0.12.29\_SHA256SUMS>
No keybase install found, skipping OpenPGP signature verification
Archive:  tfenv_download.1YFOLh/terraform_0.12.29_linux_amd64.zip
  inflating: /home/jess/.tfenv/versions/0.12.29/terraform  
Installation of terraform v0.12.29 successful. To make this your default version, run 'tfenv use 0.12.29'
```

Finally, to install the latest version of Terraform 0.11:


```
jess@Athena:~$ tfenv install latest:^0.11
Installing Terraform v0.11.15-oci
Downloading release tarball from <https://releases.hashicorp.com/terraform/0.11.15-oci/terraform\_0.11.15-oci\_linux\_amd64.zip>
###################################################################################################################################################################################### 100.0%
Downloading SHA hash file from <https://releases.hashicorp.com/terraform/0.11.15-oci/terraform\_0.11.15-oci\_SHA256SUMS>
No keybase install found, skipping OpenPGP signature verification
Archive:  tfenv_download.8OxQ8k/terraform_0.11.15-oci_linux_amd64.zip
  inflating: /home/jess/.tfenv/versions/0.11.15-oci/terraform  
Installation of terraform v0.11.15-oci successful. To make this your default version, run 'tfenv use 0.11.15-oci'
```

That was simple, and now you can put them to use!

#### Change Terraform versions

Once you have installed several versions of Terraform, you can pick one to use. First, find out your options by listing the installed versions:


```
jess@Athena:~$ tfenv list
  0.13.5 (set by /home/jess/.tfenv/version)
  0.12.29
  0.11.15-oci
```

By default, tfenv chooses the most up-to-date version of Terraform you have installed. Find out the default by running the `tfenv use` command:


```
jess@Athena:~$ tfenv use
Switching default version to v0.13.5
Switching completed

jess@Athena:~$ terraform --version
Terraform v0.13.5
```

But what if you need to use an older version? This example switches to the oldest version I have installed:


```
jess@Athena:~$ tfenv use 0.11.15-oci
Switching default version to v0.11.15-oci
Switching completed

jess@Athena:~$ terraform -version
Terraform v0.11.15-oci

Your version of Terraform is out of date! The latest version
is 0.13.5. You can update by downloading from [www.terraform.io/downloads.html][9]
```

It's easy as pie! Just run the `list` command and use the naming convention provided.

#### Uninstall Terraform versions

If you have a version of Terraform you don't want or need any more, you can remove it with the `uninstall` command. For example, I don't need Terraform version 0.13:


```
jess@Athena:~$ tfenv uninstall 0.13.5
Uninstall Terraform v0.13.5
Terraform v0.13.5 is successfully uninstalled
```

To confirm it's no longer installed:


```
jess@Athena:~$ tfenv list
  0.12.29
  0.11.15-oci
```

### Final thoughts

The tfenv tool is great for many reasons. If you need to update from one version of Terraform to another, this is one of the faster ways to upgrade and test the outcome. If your environment has things running on several Terraform versions, it's easy to switch back and forth as needed. If you use Terraform, try tfenv and see how it can transform your environment.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/tfenv

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://opensource.com/article/20/7/terraform-kubernetes
[3]: https://github.com/tfutils/tfenv
[4]: https://github.com/rbenv/rbenv
[5]: https://www.ruby-lang.org/en/
[6]: https://github.com/tfutils/tfenv#installation
[7]: https://opensource.com/life/16/7/stumbling-git
[8]: https://opensource.com/article/20/6/homebrew-linux
[9]: http://www.terraform.io/downloads.html
