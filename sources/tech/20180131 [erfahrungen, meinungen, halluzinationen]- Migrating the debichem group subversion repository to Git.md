Migrating the debichem group subversion repository to Git - Part 1: svn-all-fast-export basics 
======
With the [deprecation of alioth.debian.org][1] the subversion service hosted there will be shut down too. [According to lintian][2] the estimated date is May 1st 2018 and there are currently more then 1500 source packages affected. In the [debichem group][3] we've used the subversion service since 2006. Our repository contains around 7500 commits done by around 20 different alioth user accounts and the packaging history of around 70 to 80 packages, including packaging attempts. I've spent the last days to prepare the Git migration, comparing different tools, controlling the created repositories and testing possibilities to automate the process as much as possible. The resulting scripts can currently be found [here][4].

Of course I began as described at the [Debian Wiki][5]. But following this guide, using `git-svn` and converting the tags with the script supplied under rubric Convert remote tags and branches to local one gave me really weird results. The tags were pointing to the wrong commit-IDs. I thought, that `git-svn` was to blame and reported this as [bug #887881][6]. In the following mail exchange Andreas Kaesorg explained to me, that the issue is caused by so-called mixed-revision-tags in our repository as shown in the following example:
```
$ svn log -v -r7405
------------------------------------------------------------------------
r7405 | dleidert | 2018-01-17 18:14:57 +0100 (Mi, 17. Jan 2018) | 1 Zeile
Geanderte Pfade:
 A /tags/shelxle/1.0.888-1 (von /unstable/shelxle:7396)
 R /tags/shelxle/1.0.888-1/debian/changelog (von /unstable/shelxle/debian/changelog:7404)
 R /tags/shelxle/1.0.888-1/debian/control (von /unstable/shelxle/debian/control:7403)
 D /tags/shelxle/1.0.888-1/debian/patches/qt5.patch
 R /tags/shelxle/1.0.888-1/debian/patches/series (von /unstable/shelxle/debian/patches/series:7402)
 R /tags/shelxle/1.0.888-1/debian/rules (von /unstable/shelxle/debian/rules:7403)

[svn-buildpackage] Tagging shelxle 1.0.888-1
------------------------------------------------------------------------

```

Looking into the git log, the tags deteremined by git-svn are really not in their right place in the history line, even before running the script to convert the branches into real Git tags. So IMHO git-svn is not able to cope with this kind of situation. Because it also cannot handle our branch model, where we use /branch/package/, I began to look for different tools and found [svn-all-fast-export][7], a tool created (by KDE?) to convert even large subversion repositories based on a ruleset. My attempt using this tool was so successful (not to speak of, how fast it is), that I want to describe it more. Maybe it will prove to be useful for others as well and it won't hurt to give some more information about this poorly documented tool :)

### Step 1: Setting up a local subversion mirror

First I suggest setting up a local copy of the subversion repository to migrate, that is kept in sync with the remote repository. This can be achieved using the svnsync command. There are several howtos for this, so I won't describe this step here. Please check out [this guide][8]. In my case I have such a copy in /srv/svn/debichem.

### Step 2: Creating the identity map

svn-all-fast-export needs at least two files to work. One is the so called identity map. This file contains the mapping between subversion user IDs (login names) and the (Git) committer info, like real name and mail address. The format is the same as used by git-svn:
```
loginname = author name <mail address>
```

e.g.
```
dleidert = Daniel Leidert <dleidert@debian.org>
```

The list of subversion user IDs can be obtained the same way as [described in the Wiki][9]:
```
svn log SVN_URL | awk -F'|' '/^r[0-9]+/ { print $2 }' | sort -u
```

Just replace the placeholder SVN_URL with your subversion URL. [Here][10] is the complete file for the debichem group.

### Step 3: Creating the rules

The most important thing is the second file, which contains the processing rules. There is really not much documentation out there. So when in doubt, one has to read the source file [src/ruleparser.cpp][11]. I'll describe, what I already found out. If you are impatient, [here][12] is my result so far.

The basic rules are:
```
create repository REPOSITORY
...
end repository

```

and
```
match PATTERN
...
end match

```

The first rule creates a bare git repository with the name you've chosen (above represented by REPOSITORY). It can have one child, that is the repository description to be put into the repositories description file. There are AFAIK no other elements allowed here. So in case of e.g. ShelXle the rule might look like this:
```
create repository shelxle
description packaging of ShelXle, a graphical user interface for SHELXL
end repository

```

You'll have to create every repository, before you can put something into it. Else svn-all-fast-export will exit with an error. JFTR: It won't complain, if you create a repository, but don't put anything into it. You will just end up with an empty Git repository.

Now the second type of rule is the most important one. Based on regular expression match patterns (above represented by PATTERN), one can define actions, including the possibility to limit these actions to repositories, branches and revisions. **The patterns are applied in their order of appearance. Thus if a matching pattern is found, other patterns matching but appearing later in the rules file, won't apply!** So a special rule should always be put above a general rule. The patterns, that can be used, seem to be of type [QRegExp][13] and seem like basic Perl regular expressions including e.g. capturing, backreferences and lookahead capabilities. For a multi-package subversion repository with standard layout (that is /PACKAGE/{trunk,tags,branches}/), clean naming and subversion history, the rules could be:
```
match /([^/]+)/trunk/
 repository \1
 branch master
end match

match /([^/]+)/tags/([^/]+)/
 repository \1
 branch refs/tags/debian/\2
 annotated true
end match

match /([^/]+)/branches/([^/]+)/
 repository \1
 branch \2
end match

```

The first rule captures the (source) package name from the path and puts it into the backreference `\1`. It applies to the trunk directory history and will put everything it finds there into the repository named after the directory - here we simply use the backreference `\1` to that name - and there into the master branch. Note, that svn-all-fast-export will error out, if it tries to access a repository, which has not been created. So make sure, all repositories are created as shown with the `create repository` rule. The second rule captures the (source) package name from the path too and puts it into the backreference `\1`. But in backreference `\2` it further captures (and applies to) all the tag directories under the /tags/ directory. Usually these have a Debian package version as name. With the branch statement as shown in this rule, the tags, which are really just branches in subversion, are automatically converted to [annotated][14] Git tags (another advantage of svn-all-fast-export over git-svn). Without enabling the `annotated` statement, the tags created will be [lightweight tags][15]. So the tag name (here: debian/VERSION) is determined via backreference `\2`. The third rule is almost the same, except that everything found in the matching path will be pushed into a Git branch named after the top-level directory captured from the subversion path.

Now in an ideal world, this might be enough and the actual conversion can be done. The command should only be executed in an empty directory. I'll assume, that the identity map is called authors and the rules file is called rules and that both are in the parent directory. I'll also assume, that the local subversion mirror of the packaging repository is at /srv/svn/mymirror. So ...
```
svn-all-fast-export --stats --identity-map=../authors.txt --rules=../debichem.rules --stats /srv/svn/mymirror
```

... will create one or more **bare** Git repositories (depending on your rules file) in the current directory. After the command succeeded, you can test the results ...
```
git -C REPOSITORY/ --bare show-ref
git -C REPOSITORY/ --bare log --all --graph

```

... and you will find your repositories description (if you added one to the rules file) in REPOSITORY/description:
```
cat REPOSITORY/description
```

**Please note, that not all the debian version strings are[well formed Git reference names][16] and therefor need fixing. There might also be gaps shown in the Git history log. Or maybe the command didn't even suceed or complained (without you noticing it) or you ended up with an empty repository, although the matching rules applied. I encountered all of these issues and I'll describe the cause and fixes in the next blog article.**

But if everything went well (you have no history gaps, the tags are in their right place within the linearized history and the repository looks fine) and you can and want to proceed, you might want to skip to the next step.

In the debichem group we used a different layout. The packaging directories were under /{unstable,experimental,wheezy,lenny,non-free}/PACKAGE/. This translates to [/unstable/][17]PACKAGE/ and [/non-free/][18]PACKAGE/ being the trunk directories and the [others][19] being the branches. The tags are in [/tags/][20]PACKAGE/. And packages, that are yet to upload are located in [/wnpp/][21]PACKAGE/. With this layout, the basic rules are:
```
# trunk handling
# e.g. /unstable/espresso/
# e.g. /non-free/molden/
match /(?:unstable|non-free)/([^/]+)/
 repository \1
 branch master
end match

# handling wnpp
# e.g. /wnpp/osra/
match /(wnpp)/([^/]+)/
 repository \2
 branch \1
end match

# branch handling
# e.g. /wheezy/espresso/
match /(lenny|wheezy|experimental)/([^/]+)/
 repository \2
 branch \1
end match

# tags handling
# e.g. /tags/espresso/VERSION/
match /tags/([^/]+)/([^/]+)/
 repository \1
 annotated true
 branch refs/tags/debian/\2
 substitute branch s/~/_/
 substitute branch s/:/_/
end match

```

In the first rule, there is a non-capturing expression (?: ... ), which simply means, that the rule applies to /unstable/ and /non-free/. Thus the backreference `\1` refers to second part of the path, the package directory name. The contents found are pushed to the master branch. In the second rule, the contents from the wnpp directory are not pushed to master, but instead to a branch called wnpp. This was necessary because of overlaps between /unstable/ and /wnpp/ history and already shows, that the repositories history makes things complicated. In the third rule, the first backreference `\1` determines the branch (note the capturing expression in contrast to the first rule) and the second backreference `\2` the package repository to act on. The last rule is similar, but now `\1` determines the package repository and `\2` the tag name (debian package version) based on the matching path. The example also shows another issue, which I'd like to explain more in the next article: some characters we use in debian package versions, e.g. the tilde sign and the colon, are not allowed within Git tag names and must therefor be substituted, which is done by the `substitute branch EXPRESSION` instructions.

### Step 4: Cleaning the bare repository

The [tool documentation][27] suggests to run ...
```
git -C REPOSITORY/ repack -a -d -f
```

... before you upload this bare repository to another location. But [Stuart Prescott told me on the debichem list][28], that this might not be enough and still leave some garbage behind. I'm not experienved enough to judge here, but his suggestion is, to clone the repository, either a bare clone or clone and init a new bare. I used the first approach:
```
git -C REPOSITORY/ --bare clone --bare REPOSITORY.git
git -C REPOSITORY.git/ repack -a -d -f

```

**Please note, that this won't copy the repositories description file. You'll have to copy it manually, if you wanna keep it.** The resulting bare repository can be uploaded (e.g. to [git.debian.org as personal repository][29]:
```
cp REPOSITORY/description REPOSITORY.git/description
touch REPOSITORY.git/git-daemon-export-ok
rsync -avz REPOSITORY.git git.debian.org:~/public_git/

```

Or you clone the repository, add a remote origin and push everything there. It is even possible to use the gitlab API at salsa.debian.org to create a project and push there. I'll save the latter for another post. If you are hasty, you'll find a script [here][30].

--------------------------------------------------------------------------------

via: http://www.wgdd.de/2018/01/migrating-debichem-group-subversion.html

作者：[Daniel Leidert][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.blogger.com/profile/17052464961644858181
[1]:https://wiki.debian.org/Alioth#Deprecation_of_Alioth
[2]:https://lintian.debian.org/tags/vcs-deprecated-in-debian-infrastructure.html
[3]:https://debichem.alioth.debian.org/
[4]:https://anonscm.debian.org/viewvc/debichem/tools/svn2git/
[5]:https://wiki.debian.org/de/Alioth/Git#Convert_a_SVN_Alioth_repository_to_Git
[6]:https://bugs.debian.org/887881
[7]:https://github.com/svn-all-fast-export/svn2git
[8]:http://www.microhowto.info/howto/mirror_a_subversion_repository.html
[9]:https://wiki.debian.org/de/Alioth/Git#Create_the_author_file
[10]:https://anonscm.debian.org/viewvc/debichem/tools/svn2git/authors.txt?view=co&content-type=text%2Fplain
[11]:https://raw.githubusercontent.com/svn-all-fast-export/svn2git/master/src/ruleparser.cpp
[12]:https://anonscm.debian.org/viewvc/debichem/tools/svn2git/debichem.rules?view=co&content-type=text%2Fplain
[13]:http://doc.qt.io/qt-5/qregexp.html#introduction
[14]:https://git-scm.com/book/en/v2/Git-Basics-Tagging#_annotated_tags
[15]:https://git-scm.com/book/en/v2/Git-Basics-Tagging#_lightweight_tags
[16]:https://git-scm.com/docs/git-check-ref-format
[17]:https://anonscm.debian.org/viewvc/debichem/unstable/
[18]:https://anonscm.debian.org/viewvc/debichem/non-free/
[19]:https://anonscm.debian.org/viewvc/debichem/experimental/
[20]:https://anonscm.debian.org/viewvc/debichem/tags/
[21]:https://anonscm.debian.org/viewvc/debichem/wnpp/
[22]:https://anonscm.debian.org/viewvc/debichem/unstable/espresso/
[23]:https://anonscm.debian.org/viewvc/debichem/non-free/molden/
[24]:https://anonscm.debian.org/viewvc/debichem/wnpp/osra/
[25]:https://anonscm.debian.org/viewvc/debichem/wheezy/espresso/
[26]:https://anonscm.debian.org/viewvc/debichem/tags/espresso/
[27]:https://techbase.kde.org/Projects/MoveToGit/UsingSvn2Git#Checking_for_proper_history_in_the_new_git_repository
[28]:http://lists.alioth.debian.org/pipermail/debichem-devel/2018-January/008816.html
[29]:https://wiki.debian.org/de/Alioth/Git#Using_personal_Git_repositories
[30]:https://anonscm.debian.org/viewvc/debichem/tools/svn2git/gitimport.sh?view=co&content-type=text%2Fplain
