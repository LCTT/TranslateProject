12 useful zypper command examples
======
Learn zypper command with 12 useful examples along with sample outputs. zypper is used for package and patch management in Suse Linux systems.

![zypper command examples][1]

zypper is package management system powered by [ZYpp package manager engine][2]. Suse Linux uses zypper for package management. In this article we will be sharing 12 useful zypper commands along with examples whcih are helpful for your day today sysadmin tasks.

Without any argument `zypper` command will list you all available switches which can be used. Its quite handy than referring to man page which is pretty much in detail.

```
root@kerneltalks # zypper
  Usage:
        zypper [--global-options] <command> [--command-options] [arguments]
        zypper <subcommand> [--command-options] [arguments]
 
  Global Options:
        --help, -h              Help.
        --version, -V           Output the version number.
        --promptids             Output a list of zypper's user prompts.
        --config, -c <file>     Use specified config file instead of the default                                                                                        .
        --userdata <string>     User defined transaction id used in history and                                                                                         plugins.
        --quiet, -q             Suppress normal output, print only error
                                messages.
        --verbose, -v           Increase verbosity.
        --color
        --no-color              Whether to use colors in output if tty supports                                                                                         it.
        --no-abbrev, -A         Do not abbreviate text in tables.
        --table-style, -s       Table style (integer).
        --non-interactive, -n   Do not ask anything, use default answers
                                automatically.
        --non-interactive-include-reboot-patches
                                Do not treat patches as interactive, which have
                                the rebootSuggested-flag set.
        --xmlout, -x            Switch to XML output.
        --ignore-unknown, -i    Ignore unknown packages.
 
        --reposd-dir, -D <dir>  Use alternative repository definition file
                                directory.
        --cache-dir, -C <dir>   Use alternative directory for all caches.
        --raw-cache-dir <dir>   Use alternative raw meta-data cache directory.
        --solv-cache-dir <dir>  Use alternative solv file cache directory.
        --pkg-cache-dir <dir>   Use alternative package cache directory.
 
     Repository Options:
        --no-gpg-checks         Ignore GPG check failures and continue.
        --gpg-auto-import-keys  Automatically trust and import new repository
                                signing keys.
        --plus-repo, -p <URI>   Use an additional repository.
        --plus-content <tag>    Additionally use disabled repositories providing                                                                                         a specific keyword.
                                Try '--plus-content debug' to enable repos indic                                                                                        ating to provide debug packages.
        --disable-repositories  Do not read meta-data from repositories.
        --no-refresh            Do not refresh the repositories.
        --no-cd                 Ignore CD/DVD repositories.
        --no-remote             Ignore remote repositories.
        --releasever            Set the value of $releasever in all .repo files                                                                                         (default: distribution version)
 
     Target Options:
        --root, -R <dir>        Operate on a different root directory.
        --disable-system-resolvables
                                Do not read installed packages.
 
  Commands:
        help, ?                 Print help.
        shell, sh               Accept multiple commands at once.
 
     Repository Management:
        repos, lr               List all defined repositories.
        addrepo, ar             Add a new repository.
        removerepo, rr          Remove specified repository.
        renamerepo, nr          Rename specified repository.
        modifyrepo, mr          Modify specified repository.
        refresh, ref            Refresh all repositories.
        clean                   Clean local caches.
 
     Service Management:
        services, ls            List all defined services.
        addservice, as          Add a new service.
        modifyservice, ms       Modify specified service.
        removeservice, rs       Remove specified service.
        refresh-services, refs  Refresh all services.
 
     Software Management:
        install, in             Install packages.
        remove, rm              Remove packages.
        verify, ve              Verify integrity of package dependencies.
        source-install, si      Install source packages and their build
                                dependencies.
        install-new-recommends, inr
                                Install newly added packages recommended
                                by installed packages.
 
     Update Management:
        update, up              Update installed packages with newer versions.
        list-updates, lu        List available updates.
        patch                   Install needed patches.
        list-patches, lp        List needed patches.
        dist-upgrade, dup       Perform a distribution upgrade.
        patch-check, pchk       Check for patches.
 
     Querying:
        search, se              Search for packages matching a pattern.
        info, if                Show full information for specified packages.
        patch-info              Show full information for specified patches.
        pattern-info            Show full information for specified patterns.
        product-info            Show full information for specified products.
        patches, pch            List all available patches.
        packages, pa            List all available packages.
        patterns, pt            List all available patterns.
        products, pd            List all available products.
        what-provides, wp       List packages providing specified capability.
 
     Package Locks:
        addlock, al             Add a package lock.
        removelock, rl          Remove a package lock.
        locks, ll               List current package locks.
        cleanlocks, cl          Remove unused locks.
 
     Other Commands:
        versioncmp, vcmp        Compare two version strings.
        targetos, tos           Print the target operating system ID string.
        licenses                Print report about licenses and EULAs of
                                installed packages.
        download                Download rpms specified on the commandline to a                                                                                         local directory.
        source-download         Download source rpms for all installed packages
                                to a local directory.
 
     Subcommands:
        subcommand              Lists available subcommands.
 
Type 'zypper help <command>' to get command-specific help.
```
##### How to install package using zypper

`zypper` takes `in` or `install` switch to install package on your system. Its same as [yum package installation][3], supplying package name as argument and package manager (zypper here) will resolve all dependencies and install them along with your required package.

```
# zypper install telnet
Refreshing service 'SMT-http_smt-ec2_susecloud_net'.
Refreshing service 'cloud_update'.
Loading repository data...
Reading installed packages...
Resolving package dependencies...
 
The following NEW package is going to be installed:
  telnet
 
1 new package to install.
Overall download size: 51.8 KiB. Already cached: 0 B. After the operation, additional 113.3 KiB will be used.
Continue? [y/n/...? shows all options] (y): y
Retrieving package telnet-1.2-165.63.x86_64                                                                                        (1/1),  51.8 KiB (113.3 KiB unpacked)
Retrieving: telnet-1.2-165.63.x86_64.rpm .........................................................................................................................[done]
Checking for file conflicts: .....................................................................................................................................[done]
(1/1) Installing: telnet-1.2-165.63.x86_64 .......................................................................................................................[done]
```

Above output for your reference in which we installed `telnet` package.

Suggested read : [Install packages in YUM and APT systems][3]

##### How to remove package using zypper

For erasing or removing packages in Suse Linux, use `zypper` with `remove` or `rm` switch.

```
root@kerneltalks # zypper rm telnet
Loading repository data...
Reading installed packages...
Resolving package dependencies...
 
The following package is going to be REMOVED:
  telnet
 
1 package to remove.
After the operation, 113.3 KiB will be freed.
Continue? [y/n/...? shows all options] (y): y
(1/1) Removing telnet-1.2-165.63.x86_64 ..........................................................................................................................[done]
```
We removed previously installed telnet package here.

##### Check dependencies and verify integrity of installed packages using zypper

There are times when one can install package by force ignoring dependencies. `zypper` gives you power to scan all installed packages and checks for their dependencies too. If any dependency is missing, it offers you to install/rempve it and hence maintain integrity of your installed packages.

Use `verify` or `ve` switch with `zypper` to check integrity of installed packages.

```
root@kerneltalks # zypper ve
Refreshing service 'SMT-http_smt-ec2_susecloud_net'.
Refreshing service 'cloud_update'.
Loading repository data...
Reading installed packages...
 
Dependencies of all installed packages are satisfied.
```
In above output, you can see last line confirms that all dependencies of installed packages are completed and no action required.

##### How to download package using zypper in Suse Linux

`zypper` offers way to download package in local directory without installation. You can use this downloaded package on another system with same configuration. Packages will be downloaded to `/var/cache/zypp/packages/<repo>/<arch>/` directory.

```
root@kerneltalks # zypper download telnet
Refreshing service 'SMT-http_smt-ec2_susecloud_net'.
Refreshing service 'cloud_update'.
Loading repository data...
Reading installed packages...
Retrieving package telnet-1.2-165.63.x86_64                                                                                        (1/1),  51.8 KiB (113.3 KiB unpacked)
(1/1) /var/cache/zypp/packages/SMT-http_smt-ec2_susecloud_net:SLES12-SP3-Pool/x86_64/telnet-1.2-165.63.x86_64.rpm ................................................[done]
 
download: Done.
 
# ls -lrt /var/cache/zypp/packages/SMT-http_smt-ec2_susecloud_net:SLES12-SP3-Pool/x86_64/
total 52
-rw-r--r-- 1 root root 53025 Feb 21 03:17 telnet-1.2-165.63.x86_64.rpm
 
```
You can see we have downloaded telnet package locally using `zypper`

Suggested read : [Download packages in YUM and APT systems without installing][4]

##### How to list available package update in zypper

`zypper` allows you to view all available updates for your installed packages so that you can plan update activity in advance. Use `list-updates` or `lu` switch to show you list of all available updates for installed packages.

```
root@kerneltalks # zypper lu
Refreshing service 'SMT-http_smt-ec2_susecloud_net'.
Refreshing service 'cloud_update'.
Loading repository data...
Reading installed packages...
S | Repository                        | Name                       | Current Version               | Available Version                  | Arch
--|-----------------------------------|----------------------------|-------------------------------|------------------------------------|-------
v | SLES12-SP3-Updates                | at-spi2-core               | 2.20.2-12.3                   | 2.20.2-14.3.1                      | x86_64
v | SLES12-SP3-Updates                | bash                       | 4.3-82.1                      | 4.3-83.5.2                         | x86_64
v | SLES12-SP3-Updates                | ca-certificates-mozilla    | 2.7-11.1                      | 2.22-12.3.1                        | noarch
v | SLE-Module-Containers12-Updates   | containerd                 | 0.2.5+gitr639_422e31c-20.2    | 0.2.9+gitr706_06b9cb351610-16.8.1  | x86_64
v | SLES12-SP3-Updates                | crash                      | 7.1.8-4.3.1                   | 7.1.8-4.6.2                        | x86_64
v | SLES12-SP3-Updates                | rsync                      | 3.1.0-12.1                    | 3.1.0-13.10.1                      | x86_64
```
Output is properly formatted for easy reading. Column wise it shows name of repo where package belongs, package name, installed version, new updated available version & architecture.

##### List and install patches in Suse linux

Use `list-patches` or `lp` switch to display all available patches for your Suse Linux system which needs to be applied.

```
root@kerneltalks # zypper lp
Refreshing service 'SMT-http_smt-ec2_susecloud_net'.
Refreshing service 'cloud_update'.
Loading repository data...
Reading installed packages...
 
Repository                        | Name                                     | Category    | Severity  | Interactive | Status | Summary                                 
----------------------------------|------------------------------------------|-------------|-----------|-------------|--------|------------------------------------------------------------------------------------
SLE-Module-Containers12-Updates   | SUSE-SLE-Module-Containers-12-2018-273   | security    | important | ---         | needed | Version update for docker, docker-runc, containerd, golang-github-docker-libnetwork
SLE-Module-Containers12-Updates   | SUSE-SLE-Module-Containers-12-2018-62    | recommended | low       | ---         | needed | Recommended update for sle2docker       
SLE-Module-Public-Cloud12-Updates | SUSE-SLE-Module-Public-Cloud-12-2018-268 | recommended | low       | ---         | needed | Recommended update for python-ecdsa     
SLES12-SP3-Updates                | SUSE-SLE-SERVER-12-SP3-2018-116          | security    | moderate  | ---         | needed | Security update for rsync               
---- output clipped ----
SLES12-SP3-Updates                | SUSE-SLE-SERVER-12-SP3-2018-89           | security    | moderate  | ---         | needed | Security update for perl-XML-LibXML     
SLES12-SP3-Updates                | SUSE-SLE-SERVER-12-SP3-2018-90           | recommended | low       | ---         | needed | Recommended update for lvm2             
 
Found 37 applicable patches:
37 patches needed (18 security patches)
```

Output is pretty much nicely organised with respective headers. You can easily figure out and plan your patch update accordingly. We can see out of 37 patches available on our system 18 are security ones and needs to be applied on high priority!

You can install all needed patches by issuing `zypper patch` command.

##### How to update package using zypper

To update package using zypper, use `update` or `up` switch followed by package name. In above list updates command we learned that `rsync` package update is available on our server. Let update it now –

```
root@kerneltalks # zypper update rsync
Refreshing service 'SMT-http_smt-ec2_susecloud_net'.
Refreshing service 'cloud_update'.
Loading repository data...
Reading installed packages...
Resolving package dependencies...
 
The following package is going to be upgraded:
  rsync
 
1 package to upgrade.
Overall download size: 325.2 KiB. Already cached: 0 B. After the operation, additional 64.0 B will be used.
Continue? [y/n/...? shows all options] (y): y
Retrieving package rsync-3.1.0-13.10.1.x86_64                                                                                      (1/1), 325.2 KiB (625.5 KiB unpacked)
Retrieving: rsync-3.1.0-13.10.1.x86_64.rpm .......................................................................................................................[done]
Checking for file conflicts: .....................................................................................................................................[done]
(1/1) Installing: rsync-3.1.0-13.10.1.x86_64 .....................................................................................................................[done]
```

##### Search package using zypper in Suse Linux

If you are not sure about full package name, no worries. You can search packages in zypper by supplying search string with `se` or `search` switch

```
root@kerneltalks # zypper se lvm
Refreshing service 'SMT-http_smt-ec2_susecloud_net'.
Refreshing service 'cloud_update'.
Loading repository data...
Reading installed packages...
 
S  | Name          | Summary                      | Type
---|---------------|------------------------------|-----------
   | libLLVM       | Libraries for LLVM           | package
   | libLLVM-32bit | Libraries for LLVM           | package
   | llvm          | Low Level Virtual Machine    | package
   | llvm-devel    | Header Files for LLVM        | package
   | lvm2          | Logical Volume Manager Tools | srcpackage
i+ | lvm2          | Logical Volume Manager Tools | package
   | lvm2-devel    | Development files for LVM2   | package
 
```
In above example we searched `lvm` string and came up with the list shown above. You can use `Name` in zypper install/remove/update commands.

##### Check installed package information using zypper

You can check installed packages details using zypper. `info` or `if` switch will list out information of installed package. It can also displays package details which is not installed. In that case, `Installed` parameter will reflect `No` value.
```
root@kerneltalks # zypper info rsync
Refreshing service 'SMT-http_smt-ec2_susecloud_net'.
Refreshing service 'cloud_update'.
Loading repository data...
Reading installed packages...
 
 
Information for package rsync:
------------------------------
Repository     : SLES12-SP3-Updates
Name           : rsync
Version        : 3.1.0-13.10.1
Arch           : x86_64
Vendor         : SUSE LLC <https://www.suse.com/>
Support Level  : Level 3
Installed Size : 625.5 KiB
Installed      : Yes
Status         : up-to-date
Source package : rsync-3.1.0-13.10.1.src
Summary        : Versatile tool for fast incremental file transfer
Description    :
    Rsync is a fast and extraordinarily versatile file  copying  tool. It can copy
    locally, to/from another host over any remote shell, or to/from a remote rsync
    daemon. It offers a large number of options that control every aspect of its
    behavior and permit very flexible specification of the set of files to be
    copied. It is famous for its delta-transfer algorithm, which reduces the amount
    of data sent over the network by sending only the differences between the
    source files and the existing files in the destination. Rsync is widely used
    for backups and mirroring and as an improved copy command for everyday use.
```

##### List repositories using zypper

To list repo use `lr` or `repos` switch with zypper command. It will list all available repos which includes enabled and not-enabled both repos.

```
root@kerneltalks # zypper lr
Refreshing service 'cloud_update'.
Repository priorities are without effect. All enabled repositories share the same priority.
 
#  | Alias                                                                                | Name                                                  | Enabled | GPG Check | Refresh
---|--------------------------------------------------------------------------------------|-------------------------------------------------------|---------|-----------|--------
 1 | SMT-http_smt-ec2_susecloud_net:SLE-Module-Adv-Systems-Management12-Debuginfo-Pool    | SLE-Module-Adv-Systems-Management12-Debuginfo-Pool    | No      | ----      | ----
 2 | SMT-http_smt-ec2_susecloud_net:SLE-Module-Adv-Systems-Management12-Debuginfo-Updates | SLE-Module-Adv-Systems-Management12-Debuginfo-Updates | No      | ----      | ----
 3 | SMT-http_smt-ec2_susecloud_net:SLE-Module-Adv-Systems-Management12-Pool              | SLE-Module-Adv-Systems-Management12-Pool              | Yes     | (r ) Yes  | No
 4 | SMT-http_smt-ec2_susecloud_net:SLE-Module-Adv-Systems-Management12-Updates           | SLE-Module-Adv-Systems-Management12-Updates           | Yes     | (r ) Yes  | Yes
 5 | SMT-http_smt-ec2_susecloud_net:SLE-Module-Containers12-Debuginfo-Pool                | SLE-Module-Containers12-Debuginfo-Pool                | No      | ----      | ----
 6 | SMT-http_smt-ec2_susecloud_net:SLE-Module-Containers12-Debuginfo-Updates             | SLE-Module-Containers12-Debuginfo-Updates             | No      | ----      | ----
```

here you need to check enabled column to check which repos are enabled and which are not.

##### Add and remove repo in Suse Linux using zypper

To add repo you will need URI of repo/.repo file or else you end up in below error.

```
root@kerneltalks # zypper addrepo -c SLES12-SP3-Updates
If only one argument is used, it must be a URI pointing to a .repo file.
```


With URI, you can add repo like below :

```
root@kerneltalks # zypper  addrepo -c http://smt-ec2.susecloud.net/repo/SUSE/Products/SLE-SDK/12-SP3/x86_64/product?credentials=SMT-http_smt-ec2_susecloud_net SLE-SDK12-SP3-Pool
Adding repository 'SLE-SDK12-SP3-Pool' ...........................................................................................................................[done]
Repository 'SLE-SDK12-SP3-Pool' successfully added
 
URI         : http://smt-ec2.susecloud.net/repo/SUSE/Products/SLE-SDK/12-SP3/x86_64/product?credentials=SMT-http_smt-ec2_susecloud_net
Enabled     : Yes
GPG Check   : Yes
Autorefresh : No
Priority    : 99 (default priority)
 
Repository priorities are without effect. All enabled repositories share the same priority.
```

Use `addrepo` or `ar` switch with `zypper` to add repo in Suse. Followed by URI and lastly you need to provide alias as well.

To remove repo in Suse, use `removerepo` or `rr` switch with `zypper`.
```
root@kerneltalks # zypper removerepo nVidia-Driver-SLE12-SP3
Removing repository 'nVidia-Driver-SLE12-SP3' ....................................................................................................................[done]
Repository 'nVidia-Driver-SLE12-SP3' has been removed.
```

##### Clean local zypper cache

Cleaning up local zypper caches with `zypper clean` command –

```
root@kerneltalks # zypper clean
All repositories have been cleaned up.
```

--------------------------------------------------------------------------------

via: https://kerneltalks.com/commands/12-useful-zypper-command-examples/

作者：[KernelTalks][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kerneltalks.com
[1]:https://a2.kerneltalks.com/wp-content/uploads/2018/02/zypper-command-examples.png
[2]:https://en.wikipedia.org/wiki/ZYpp
[3]:https://kerneltalks.com/tools/package-installation-linux-yum-apt/
[4]:https://kerneltalks.com/howto/download-package-using-yum-apt/
