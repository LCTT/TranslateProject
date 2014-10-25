Translating----geekpi

SUSE Linux – Zypper Command Examples
================================================================================
Zypper is command line interface in SuSE Linux which is used to  install, update, remove software, manage repositories, perform various queries, and lot more. In this article we will discuss different examples of zypper command .

Syntax :

    # zypper [--global-opts] <command> [--command-opts] [command-arguments]

The components mentioned in brackets are not required. The simplest way to execute zypper is to type its name followed by the command.

### Example:1 List the available global options & commands. ###

Open the Terminal , type the Zypper command and press enter , it will display all the global options and command that can be used within zypper.

    linux-xa3t:~ # zypper

### Examples:2 Getting help for Specific zypper Command. ###

Syntax : zypper help [command]

    linux-xa3t:~ # zypper help remove
    remove (rm) [options] <capability> ...
    
    Remove packages with specified capabilities.
    A capability is NAME[.ARCH][OP<VERSION>], where OP is one of <, <=, =, >=, >.
    
    Command options:
    -r, --repo <alias|#|URI> Load only the specified repository.
    -t, --type <type> Type of package (package, patch, pattern, product).
    
     Default: package.
    -n, --name Select packages by plain name, not by capability.
    -C, --capability Select packages by capability.
    --debug-solver Create solver test case for debugging.
    -R, --no-force-resolution Do not force the solver to find solution,let it ask.
    --force-resolution Force the solver to find a solution (even an aggressive one).
    -u, --clean-deps Automatically remove unneeded dependencies.
    -U, --no-clean-deps No automatic removal of unneeded dependencies.
    -D, --dry-run Test the removal, do not actually remove.

### Example:3 Open Zypper Shell or session ###

    linux-xa3t:~ # zypper sh
    zypper>
    
    or
    
    linux-xa3t:~ # zypper shell
    zypper>

### Example:4 Listing defined Repositories ###

    linux-xa3t:~ # zypper repos

![](http://www.linuxtechi.com/wp-content/uploads/2014/10/zypper-repos.png)

or

    linux-xa3t:~ # zypper lr

#### 4.1) List Repos URI in Table. ####

![](http://www.linuxtechi.com/wp-content/uploads/2014/10/zypper-repos-uri.png)

#### 4.2) List Repos by priority ####

    linux-xa3t:~ # zypper lr -p

![](http://www.linuxtechi.com/wp-content/uploads/2014/10/zypper-repos-priority.png)

### Example:5 Refreshing Repositories. ###

    linux-xa3t:~ # zypper ref
    Repository 'openSUSE-13.1-Non-Oss' is up to date.
    Repository 'openSUSE-13.1-Oss' is up to date.
    Repository 'openSUSE-13.1-Update' is up to date.
    Repository 'openSUSE-13.1-Update-Non-Oss' is up to date.
    All repositories have been refreshed.

### Example:6 Modifying Zypper Repositories ###

zypper repositories can be modified by alias, number, or URI, or by the ‘–all, –remote, –local, –medium-type’ aggregate options.

linux-xa3t:~ # zypper mr -d 6                 #disable repo #6
linux-xa3t:~ # zypper mr -rk -p 70 upd #enable autorefresh and rpm files ‘caching’ for ‘upd’ repo and set its priority to 70
linux-xa3t:~ # zypper mr -Ka               #disable rpm files caching for all repos
linux-xa3t:~ # zypper mr -kt               #enable rpm files caching for remote repos

### Example:7 Adding Repository ###

Syntax : zypper addrepo OR zypper ar <repo url and alias >

    linux-xa3t:~ # zypper ar http://download.opensuse.org/update/13.1/ update
    Adding repository 'update' .............................................[done]
    Repository 'update' successfully added
    Enabled: Yes
    Autorefresh: No
    GPG check: Yes
    URI: http://download.opensuse.org/update/13.1/

### Example:8 Removing Repository ###

Syntax : zypper removerepo <Repo Name> <Alias>

OR

zypper rr <Repo Name> <Alias>

    linux-xa3t:~ # zypper rr openSUSE-13.1-1.10 openSUSE-13.1-1.10
    Removing repository 'openSUSE-13.1-1.10' ............................[done]
    Repository 'openSUSE-13.1-1.10' has been removed.

### Example:9 Installing Package ###

syntax : zypper install <Package-Name>  OR  zypper in <Package Name>

    linux-xa3t:~ # zypper install vlc

### Example:10 Removing a Package ###

Syntax : zypper remove <Package-Name> OR zypper rm <Package-Name>

    linux-xa3t:~ # zypper remove sqlite

### Example:11 Exporting & importing Repository ###

Syntax of Exporting Repos : zypper repos –export or zypper lr -e

    linux-xa3t:~ # zypper lr --export repo-backup/back.repo
    Repositories have been successfully exported to repo-backup/back.repo.

Syntax of Importing Repos :

    linux-xa3t:~ # zypper ar repo-backup/back.repo

### Example:12 Updating a package ###

Syntax : zypper update <Package-Name> OR zypper up <Package-Name>

    linux-xa3t:~ # zypper update bash

### Example:13 Install source Package ###

Syntax : zypper source-install <source-package> OR zypper si <source-package>

    linux-xa3t:~ # zypper source-install zypper

### Example:14 Install only Build Dependency. ###

command in example:13 will install & build dependencies of the specified package. If you want to install source package then use, the option -D.

    # zypper source-install -D package_name

To install only the build dependencies use -d.

    # zypper source-install -d package_name

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/suse-linux-zypper-command-examples/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/