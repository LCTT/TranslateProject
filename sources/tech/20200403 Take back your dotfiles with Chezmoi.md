[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Take back your dotfiles with Chezmoi)
[#]: via: (https://fedoramagazine.org/take-back-your-dotfiles-with-chezmoi/)
[#]: author: (Ryan Walter https://fedoramagazine.org/author/rwaltr/)

Take back your dotfiles with Chezmoi
======

![][1]

In Linux, dotfiles are hidden text files that are used to store various configuration settings for many such as Bash and Git to more complex applications like i3 or VSCode.

Most of these files are contained in the _~/.config_ directory or right in the home directory. Editing these files allows you to customize applications beyond what a settings menu may provide, and they tend to be portable across devices and even other Linux distributions. But one talking point across the Linux enthusiast community is how to manage these dotfiles and how to share them.

We will be showcasing a tool called [Chezmoi][2] that does this task a little differently from the others.

### The history of dotfile management

If you search [GitHub for dotfiles][3], what you will see are over 100k repositories after one goal: Store people’s dotfiles in a shareable and repeatable manor. However, other than using git, they store their files differently.

While Git has solved code management problems that also translates to config file management, It does not solve how to separate between distributions, roles (such as home vs work computers) secrets management, and per device configuration.

Because of this, many users decide to craft their own solutions, and the community has responded with multiple answers over the years. This article will briefly cover some of the solutions that have been created.

#### Experiment in an isolated environment

Do you want to try these below solutions quickly in a contained environment? Run:

```
$ podman run --rm -it fedora
```

… to create a Fedora container to try the applications in. This container will automatically delete itself when you exit the shell.

#### The install problem

If you store your dotfiles in Git repository, you will want to make it easy for your changes to automatically be applied inside your home directory, the easiest way to do this at first glance is to use a symlink, such as _ln -s ~/.dotfies/bashrc ~/.bashrc_. This will allow your changes to take place instantly when your repository is updated.

The problem with symlinks is that managing symlinks can be a chore. Stow and [RCM (covered here on Fedora Magazine)][4] can help you manage those, but these are not seamless solutions. Files that are private will need to be modified and chmoded properly after download. If you revamp your dotfiles on one system, and download your repository to another system, you may get conflicts and require troubleshooting.

Another solution to this problem is writing your own install script. This is the most flexible option, but has the tradeoff of requiring more time into building a custom solution.

#### The secrets problem

Git is designed to track changes. If you store a secret such as a password or an API key in your git repository, you will have a difficult time and will need to rewrite your git history to remove that secret. If your repository is public, your secret would be impossible to recover if someone else has downloaded your repository. This problem alone will prevent many individuals from sharing their dotfiles with the public world.

#### The multi-device config problem

The problem is not pulling your config to multiple devices, the problem is when you have multiple devices that require different configuration. Most individuals handle this by either having different folders or by using different forks. This makes it difficult to share configs across the different devices and role sets

### How Chezmoi works

Chezmoi is a tool to manage your dotfiles with the above problems in mind, it doesn’t blindly copy or symlink files from your repository. Chezmoi acts more like a template engine to generate your dotfiles based on system variables, templates, secret managers, and Chezmoi’s own config file.

#### Getting Started with Chezmoi

Currently Chezmoi is not in the default repositories. You can download the current version of Chezmoi as of writing with the following command.

```
$ sudo dnf install https://github.com/twpayne/chezmoi/releases/download/v1.7.17/chezmoi-1.7.17-x86_64.rpm
```

This will install the pre-packaged RPM to your system.

Lets go ahead and create your repository using:

```
$ chezmoi init
```

It will create your new repository in _~/.local/share/chezmoi/_. You can easily cd to this directory by using:

```
$ chezmoi cd
```

Lets add our first file:

```
chezmoi add ~/.bashrc
```

… to add your bashrc file to your chezmoi repository.

Note: if your bashrc file is actually a symlink, you will need to add the -f flag to follow it and read the contents of the real file.

You can now edit this file using:

```
$ chezmoi edit ~/.bashrc
```

Now lets add a private file, This is a file that has the permissions 600 or similar. I have a file at .ssh/config that I would like to add by using

```
$ chezmoi add ~/.ssh/config
```

Chezmoi uses special prefixes to keep track of what is a hidden file and a private file to work around Git’s limitations. Run the following command to see it:

```
$ chezmoi cd
```

**Do note that files that are marked as private are not actually private, they are still saved as plain text in your git repo. More on that later.**

You can apply any changes by using:

```
$ chezmoi apply
```

and inspect what is different by using

```
$ chezmoi diff
```

#### Using variables and templates

To export all of your data Chezmoi can gather, run:

```
$ chezmoi data
```

Most of these are information about your username, arch, hostname, os type and os name. But you can also add our own variables.

Go ahead and run:

```
$ chezmoi edit-config
```

… and input the following:

```
[data]
         email = "fedorauser@example.com"
         name = "Fedora Mcdora"
```

Save your file and run chezmoi data again. You will see on the bottom that your email and name are now added. You can now use these with templates with Chezmoi. Run:

```
$ chezmoi add  -T --autotemplate ~/.gitconfig
```

… to add your gitconfig as a template into Chezmoi. If Chezmoi is successful in inferring template correctly, you could get the following:

```
[user]
         email = "{{ .email }}"
         name = "{{ .name }}"
```

If it does not, you can change the file to this instead.

Inspect your file with:

```
$ chezmoi edit ~/.gitconfig
```

After using

```
$ chezmoi cat ~/.gitconfig
```

… to see what chezmoi will generate for this file. My generated example is below:

```
[root@a6e273a8d010 ~]# chezmoi cat ~/.gitconfig
 [user]
     email = "fedorauser@example.com"
     name = "Fedora Mcdora"
 [root@a6e273a8d010 ~]#
```

It will generate a file filled with the variables in our chezmoi config.
You can also use the varibles to perform simple logic statements. One example is:

```
{{- if eq .chezmoi.hostname "fsteel" }}
# this will only be included if the host name is equal to "fsteel"
{{- end }}
```

Do note that for this to work the file has to be a template. You can check this by seeing if the file has a “.tmpl” appended to its name on the file in _chezmoi cd_, or by readding the file using the -T option

#### Keeping secrets… secret

To troubleshoot your setup, use the following command.

```
$ chezmoi doctor
```

What is important here is that it also shows you the [password managers it supports][5].

```
[root@a6e273a8d010 ~]# chezmoi doctor
 warning: version dev
      ok: runtime.GOOS linux, runtime.GOARCH amd64
      ok: /root/.local/share/chezmoi (source directory, perm 700)
      ok: /root (destination directory, perm 550)
      ok: /root/.config/chezmoi/chezmoi.toml (configuration file)
      ok: /bin/bash (shell)
      ok: /usr/bin/vi (editor)
 warning: vimdiff (merge command, not found)
      ok: /usr/bin/git (source VCS command, version 2.25.1)
      ok: /usr/bin/gpg (GnuPG, version 2.2.18)
 warning: op (1Password CLI, not found)
 warning: bw (Bitwarden CLI, not found)
 warning: gopass (gopass CLI, not found)
 warning: keepassxc-cli (KeePassXC CLI, not found)
 warning: lpass (LastPass CLI, not found)
 warning: pass (pass CLI, not found)
 warning: vault (Vault CLI, not found)
 [root@a6e273a8d010 ~]#
```

You can use either of these clients, or a [generic client][6], or your system’s [Keyring][7].

For GPG, you will need to add the following to your config using:

```
$ chezmoi edit-config
```

```
[gpg]
   recipient = "<Your GPG keys Recipient"
```

You can use:

```
$ chezmoi add --encrypt
```

… to add any files, these will be encrypted in your source respository and not exposed to the public world as plain text. Chezmoi will automatically decrypt them when applying.

We can also use them in templates. For example, a secret token stored in [Pass (covered on Fedora Magazine)][8]. Go ahead and generate your secret.

In this example, it’s called “githubtoken”:

```
rwaltr@fsteel:~] $ pass ls
 Password Store
 └── githubtoken
 [rwaltr@fsteel:~] $
```

Next, edit your template, such as your .gitconfig we created earlier and add this lines.

```
token = {{ pass "githubtoken" }}
```

Then lets inspect using*:*

```
$ chezmoi cat ~/.gitconfig
```

```
[rwaltr@fsteel:~] $ chezmoi cat ~/.gitconfig
 This is Git's per-user configuration file.
 [user]
           name = Ryan Walter
           email = rwalt@pm.me
           token = mysecrettoken
 [rwaltr@fsteel:~] $
```

Now your secrets are properly secured in your password manager, your config can be publicly shared without risk!

### Final notes

This is only scratching the surface. Please check out [Chezmoi’s website][2] for more information. The author also has his [dotfiles public][9] if you are looking for more examples on how to use Chezmoi.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/take-back-your-dotfiles-with-chezmoi/

作者：[Ryan Walter][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rwaltr/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/03/chezmoi-cover-816x346.png
[2]: https://www.chezmoi.io/
[3]: https://github.com/search?q=dotfiles&type=Repositories
[4]: https://fedoramagazine.org/managing-dotfiles-rcm/
[5]: https://www.chezmoi.io/docs/how-to/#keep-data-private
[6]: https://www.chezmoi.io/docs/how-to/#use-a-generic-tool-to-keep-your-secrets
[7]: https://www.chezmoi.io/docs/how-to/#use-a-keyring-to-keep-your-secrets
[8]: https://fedoramagazine.org/using-pass-to-manage-your-passwords-on-fedora/
[9]: https://github.com/twpayne/dotfiles
