Debbugs Versioning: Merging
======
One of the key features of Debbugs, the [bug tracking system Debian uses][1], is its ability to figure out which bugs apply to which versions of a package by tracking package uploads. This system generally works well, but when a package maintainer's workflow doesn't match the assumptions of Debbugs, unexpected things can happen. In this post, I'm going to:

  1. introduce how Debbugs tracks versions
  2. provide an example of a merge-based workflow which Debbugs doesn't handle well
  3. provide some suggestions on what to do in this case



### Debbugs Versioning

Debbugs tracks versions using a set of one or more [rooted trees][2] which it builds from the ordering of debian/changelog entries. In the simplist case, every upload of a Debian package has changelogs in the same order, and each upload adds just one version. For example, in the case of [dgit][3], to start with the package has this (abridged) version tree:

![][4]

the next upload, 3.13, has a changelog with this version ordering: `3.13 3.12 3.11 3.10`, which causes the 3.13 version to be added as a descendant of 3.12, and the version tree now looks like this:

![][5]

dgit is being developed while also being used, so new versions with potentially disruptive changes are uploaded to experimental while production versions are uploaded to unstable. For example, the 4.0 experimental upload was based on the 3.10 version, with the changelog ordering `4.0 3.10`. The tree now has two branches, but everything seems as you would expect:

![][6]

### Merge based workflows

Bugfixes in the maintenance version of dgit also are made to the experimental package by merging changes from the production version using git. In this case, some changes which were present in the 3.12 and 3.11 versions are merged using git, corresponds to a git merge flow like this:

![][7]

If an upload is prepared with changelog ordering `4.1 4.0 3.12 3.11 3.10`, Debbugs combines this new changelog ordering with the previously known tree, to produce this version tree:

![][8]

This looks a bit odd; what happened? Debbugs walks through the new changelog, connecting each of the new versions to the previous version if and only if that version is not already an ancestor of the new version. Because the changelog says that 3.12 is the ancestor of 4.0, that's where the `4.1 4.0` version tree is connected.

Now, when 4.2 is uploaded, it has the changelog ordering (based on time) `4.2 3.13 4.1 4.0 3.12 3.11 3.10`, which corresponds to this git merge flow:

![][9]

Debbugs adds in 3.13 as an ancestor of 4.2, and because 4.1 was not an ancestor of 3.13 in the previous tree, 4.1 is added as an ancestor of 3.13. This results in the following graph:

![][10]

Which doesn't seem particularly helpful, because

![][11]

is probably the tree that more closely resembles reality.

### Suggestions on what to do

Why does this even matter? Bugs which are found in 3.11, and fixed in 3.12 now show up as being found in 4.0 after the 4.1 release, though they weren't found in 4.0 before that release. It also means that 3.13 now shows up as having all of the bugs fixed in 4.2, which might not be what is meant.

To avoid this, my suggestion is to order the entries in changelogs in the same order that the version graph should be traversed from the leaf version you are releasing to the root. So if the previous version tree is what is wanted, 3.13 should have a changelog with ordering `3.13 3.12 3.11 3.10`, and 4.2 should have a changelog with ordering `4.2 4.1 4.0 3.10`.

What about making the BTS support DAGs which are not trees? I think something like this would be useful, but I don't personally have a good idea on how this could be specified using the changelog or how bug fixed/found/absent should be propagated in the DAG. If you have better ideas, email me!

--------------------------------------------------------------------------------

via: https://www.donarmstrong.com/posts/debbugs_merge_versions/

作者：[Don Armstrong][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.donarmstrong.com/
[1]:https://bugs.debian.org
[2]:https://en.wikipedia.org/wiki/Tree_%28graph_theory%29#Forest
[3]:https://packages.debian.org/dgit
[4]:https://www.donarmstrong.com/graph-5d3f559f0fb850f47a5ea54c62b96da18bba46b8.png
[5]:https://www.donarmstrong.com/graph-04a0cac92e522aa8816397090f0a23ef51e49379.png
[6]:https://www.donarmstrong.com/graph-65493d1d56cbf3a32fc6e061d4d933f609d0dd9d.png
[7]:https://www.donarmstrong.com/graph-cc7df2f6e47656a87ca10d313e65a8e3d55fb937.png
[8]:https://www.donarmstrong.com/graph-94b259ce6dd4d28c04d692c72f6e021622b5b33a.png
[9]:https://www.donarmstrong.com/graph-72f98ac7aa28e7dd40aaccf7742359f5dd2de378.png
[10]:https://www.donarmstrong.com/graph-70ebe94be503db5ba97c4693f9e00fbb1dc3c9f7.png
[11]:https://www.donarmstrong.com/graph-3f8db089ab21b48bcae9d536c1887b3bc6fc4bcb.png
