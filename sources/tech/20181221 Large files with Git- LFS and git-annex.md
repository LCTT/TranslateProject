[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Large files with Git: LFS and git-annex)
[#]: via: (https://anarc.at/blog/2018-12-21-large-files-with-git/)
[#]: author: (Anarc.at https://anarc.at/)

Large files with Git: LFS and git-annex
======

Git does not handle large files very well. While there is work underway to handle large repositories through the [commit graph work][2], Git's internal design has remained surprisingly constant throughout its history, which means that storing large files into Git comes with a significant and, ultimately, prohibitive performance cost. Thankfully, other projects are helping Git address this challenge. This article compares how Git LFS and git-annex address this problem and should help readers pick the right solution for their needs.

### The problem with large files

As readers probably know, Linus Torvalds wrote Git to manage the history of the kernel source code, which is a large collection of small files. Every file is a "blob" in Git's object store, addressed by its cryptographic hash. A new version of that file will store a new blob in Git's history, with no deduplication between the two versions. The pack file format can store binary deltas between similar objects, but if many objects of similar size change in a repository, that algorithm might fail to properly deduplicate. In practice, large binary files (say JPEG images) have an irritating tendency of changing completely when even the smallest change is made, which makes delta compression useless.

There have been different attempts at fixing this in the past. In 2006, Torvalds worked on [improving the pack-file format][3] to reduce object duplication between the index and the pack files. Those changes were eventually reverted because, as Nicolas Pitre [put it][4]: "that extra loose object format doesn't appear to be worth it anymore".

Then in 2009, [Caca Labs][5] worked on improving the `fast-import` and `pack-objects` Git commands to do special handling for big files, in an effort called [git-bigfiles][6]. Some of those changes eventually made it into Git: for example, since [1.7.6][7], Git will stream large files directly to a pack file instead of holding them all in memory. But files are still kept forever in the history.

An example of trouble I had to deal with is for the Debian security tracker, which follows all security issues in the entire Debian history in a single file. That file is around 360,000 lines for a whopping 18MB. The resulting repository takes 1.6GB of disk space and a local clone takes 21 minutes to perform, mostly taken up by Git resolving deltas. Commit, push, and pull are noticeably slower than a regular repository, taking anywhere from a few seconds to a minute depending one how old the local copy is. And running annotate on that large file can take up to ten minutes. So even though that is a simple text file, it's grown large enough to cause significant problems for Git, which is otherwise known for stellar performance.

Intuitively, the problem is that Git needs to copy files into its object store to track them. Third-party projects therefore typically solve the large-files problem by taking files out of Git. In 2009, Git evangelist Scott Chacon released [GitMedia][8], which is a Git filter that simply takes large files out of Git. Unfortunately, there hasn't been an official release since then and it's [unclear][9] if the project is still maintained. The next effort to come up was [git-fat][10], first released in 2012 and still maintained. But neither tool has seen massive adoption yet. If I would have to venture a guess, it might be because both require manual configuration. Both also require a custom server (rsync for git-fat; S3, SCP, Atmos, or WebDAV for GitMedia) which limits collaboration since users need access to another service.

### Git LFS

That was before GitHub [released][11] Git Large File Storage (LFS) in August 2015. Like all software taking files out of Git, LFS tracks file hashes instead of file contents. So instead of adding large files into Git directly, LFS adds a pointer file to the Git repository, which looks like this:

```
version https://git-lfs.github.com/spec/v1
oid sha256:4d7a214614ab2935c943f9e0ff69d22eadbb8f32b1258daaa5e2ca24d17e2393
size 12345
```

LFS then uses Git's smudge and clean filters to show the real file on checkout. Git only stores that small text file and does so efficiently. The downside, of course, is that large files are not version controlled: only the latest version of a file is kept in the repository.

Git LFS can be used in any repository by installing the right hooks with `git lfs install` then asking LFS to track any given file with `git lfs track`. This will add the file to the `.gitattributes` file which will make Git run the proper LFS filters. It's also possible to add patterns to the `.gitattributes` file, of course. For example, this will make sure Git LFS will track MP3 and ZIP files:

```
$ cat .gitattributes
*.mp3 filter=lfs -text
*.zip filter=lfs -text
```

After this configuration, we use Git normally: `git add`, `git commit`, and so on will talk to Git LFS transparently.

The actual files tracked by LFS are copied to a path like `.git/lfs/objects/{OID-PATH}`, where `{OID-PATH}` is a sharded file path of the form `OID[0:2]/OID[2:4]/OID` and where `OID` is the content's hash (currently SHA-256) of the file. This brings the extra feature that multiple copies of the same file in the same repository are automatically deduplicated, although in practice this rarely occurs.

Git LFS will copy large files to that internal storage on `git add`. When a file is modified in the repository, Git notices, the new version is copied to the internal storage, and the pointer file is updated. The old version is left dangling until the repository is pruned.

This process only works for new files you are importing into Git, however. If a Git repository already has large files in its history, LFS can fortunately "fix" repositories by retroactively rewriting history with [git lfs migrate][12]. This has all the normal downsides of rewriting history, however --- existing clones will have to be reset to benefit from the cleanup.

LFS also supports [file locking][13], which allows users to claim a lock on a file, making it read-only everywhere except in the locking repository. This allows users to signal others that they are working on an LFS file. Those locks are purely advisory, however, as users can remove other user's locks by using the `--force` flag. LFS can also [prune][14] old or unreferenced files.

The main [limitation][15] of LFS is that it's bound to a single upstream: large files are usually stored in the same location as the central Git repository. If it is hosted on GitHub, this means a default quota of 1GB storage and bandwidth, but you can purchase additional "packs" to expand both of those quotas. GitHub also limits the size of individual files to 2GB. This [upset][16] some users surprised by the bandwidth fees, which were previously hidden in GitHub's cost structure.

While the actual server-side implementation used by GitHub is closed source, there is a [test server][17] provided as an example implementation. Other Git hosting platforms have also [implemented][18] support for the LFS [API][19], including GitLab, Gitea, and BitBucket; that level of adoption is something that git-fat and GitMedia never achieved. LFS does support hosting large files on a server other than the central one --- a project could run its own LFS server, for example --- but this will involve a different set of credentials, bringing back the difficult user onboarding that affected git-fat and GitMedia.

Another limitation is that LFS only supports pushing and pulling files over HTTP(S) --- no SSH transfers. LFS uses some [tricks][20] to bypass HTTP basic authentication, fortunately. This also might change in the future as there are proposals to add [SSH support][21], resumable uploads through the [tus.io protocol][22], and other [custom transfer protocols][23].

Finally, LFS can be slow. Every file added to LFS takes up double the space on the local filesystem as it is copied to the `.git/lfs/objects` storage. The smudge/clean interface is also slow: it works as a pipe, but buffers the file contents in memory each time, which can be prohibitive with files larger than available memory.

### git-annex

The other main player in large file support for Git is git-annex. We [covered the project][24] back in 2010, shortly after its first release, but it's certainly worth discussing what has changed in the eight years since Joey Hess launched the project.

Like Git LFS, git-annex takes large files out of Git's history. The way it handles this is by storing a symbolic link to the file in `.git/annex`. We should probably credit Hess for this innovation, since the Git LFS storage layout is obviously inspired by git-annex. The original design of git-annex introduced all sorts of problems however, especially on filesystems lacking symbolic-link support. So Hess has implemented different solutions to this problem. Originally, when git-annex detected such a "crippled" filesystem, it switched to [direct mode][25], which kept files directly in the work tree, while internally committing the symbolic links into the Git repository. This design turned out to be a little confusing to users, including myself; I have managed to shoot myself in the foot more than once using this system.

Since then, git-annex has adopted a different v7 mode that is also based on smudge/clean filters, which it called "[unlocked files][26]". Like Git LFS, unlocked files will double disk space usage by default. However it is possible to reduce disk space usage by using "thin mode" which uses hard links between the internal git-annex disk storage and the work tree. The downside is, of course, that changes are immediately performed on files, which means previous file versions are automatically discarded. This can lead to data loss if users are not careful.

Furthermore, git-annex in v7 mode suffers from some of the performance problems affecting Git LFS, because both use the smudge/clean filters. Hess actually has [ideas][27] on how the smudge/clean interface could be improved. He proposes changing Git so that it stops buffering entire files into memory, allows filters to access the work tree directly, and adds the hooks he found missing (for `stash`, `reset`, and `cherry-pick`). Git-annex already implements some tricks to work around those problems itself but it would be better for those to be implemented in Git natively.

Being more distributed by design, git-annex does not have the same "locking" semantics as LFS. Locking a file in git-annex means protecting it from changes, so files need to actually be in the "unlocked" state to be editable, which might be counter-intuitive to new users. In general, git-annex has some of those unusual quirks and interfaces that often come with more powerful software.

And git-annex is much more powerful: it not only addresses the "large-files problem" but goes much further. For example, it supports "partial checkouts" --- downloading only some of the large files. I find that especially useful to manage my video, music, and photo collections, as those are too large to fit on my mobile devices. Git-annex also has support for location tracking, where it knows how many copies of a file exist and where, which is useful for archival purposes. And while Git LFS is only starting to look at transfer protocols other than HTTP, git-annex already supports a [large number][28] through a [special remote protocol][29] that is fairly easy to implement.

"Large files" is therefore only scratching the surface of what git-annex can do: I have used it to build an [archival system for remote native communities in northern Québec][30], while others have built a [similar system in Brazil][31]. It's also used by the scientific community in projects like [GIN][32] and [DataLad][33], which manage terabytes of data. Another example is the [Japanese American Legacy Project][34] which manages "upwards of 100 terabytes of collections, transporting them from small cultural heritage sites on USB drives".

Unfortunately, git-annex is not well supported by hosting providers. GitLab [used to support it][35], but since it implemented Git LFS, it [dropped support for git-annex][36], saying it was a "burden to support". Fortunately, thanks to git-annex's flexibility, it may eventually be possible to treat [LFS servers as just another remote][37] which would make git-annex capable of storing files on those servers again.

### Conclusion

Git LFS and git-annex are both mature and well maintained programs that deal efficiently with large files in Git. LFS is easier to use and is well supported by major Git hosting providers, but it's less flexible than git-annex.

Git-annex, in comparison, allows you to store your content anywhere and espouses Git's distributed nature more faithfully. It also uses all sorts of tricks to save disk space and improve performance, so it should generally be faster than Git LFS. Learning git-annex, however, feels like learning Git: you always feel you are not quite there and you can always learn more. It's a double-edged sword and can feel empowering for some users and terrifyingly hard for others. Where you stand on the "power-user" scale, along with project-specific requirements will ultimately determine which solution is the right one for you.

Ironically, after thorough evaluation of large-file solutions for the Debian security tracker, I ended up proposing to rewrite history and [split the file by year][38] which improved all performance markers by at least an order of magnitude. As it turns out, keeping history is critical for the security team so any solution that moves large files outside of the Git repository is not acceptable to them. Therefore, before adding large files into Git, you might want to think about organizing your content correctly first. But if large files are unavoidable, the Git LFS and git-annex projects allow users to keep using most of their current workflow.

> This article [first appeared][39] in the [Linux Weekly News][40].

--------------------------------------------------------------------------------

via: https://anarc.at/blog/2018-12-21-large-files-with-git/

作者：[Anarc.at][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://anarc.at/
[b]: https://github.com/lujun9972
[1]: https://anarc.at/blog/
[2]: https://github.com/git/git/blob/master/Documentation/technical/commit-graph.txt
[3]: https://public-inbox.org/git/Pine.LNX.4.64.0607111010320.5623@g5.osdl.org/
[4]: https://public-inbox.org/git/alpine.LFD.0.99.0705091422130.24220@xanadu.home/
[5]: http://caca.zoy.org/
[6]: http://caca.zoy.org/wiki/git-bigfiles
[7]: https://public-inbox.org/git/7v8vsnz2nc.fsf@alter.siamese.dyndns.org/
[8]: https://github.com/alebedev/git-media
[9]: https://github.com/alebedev/git-media/issues/15
[10]: https://github.com/jedbrown/git-fat
[11]: https://blog.github.com/2015-04-08-announcing-git-large-file-storage-lfs/
[12]: https://github.com/git-lfs/git-lfs/blob/master/docs/man/git-lfs-migrate.1.ronn
[13]: https://github.com/git-lfs/git-lfs/wiki/File-Locking
[14]: https://github.com/git-lfs/git-lfs/blob/master/docs/man/git-lfs-prune.1.ronn
[15]: https://github.com/git-lfs/git-lfs/wiki/Limitations
[16]: https://medium.com/@megastep/github-s-large-file-storage-is-no-panacea-for-open-source-quite-the-opposite-12c0e16a9a91
[17]: https://github.com/git-lfs/lfs-test-server
[18]: https://github.com/git-lfs/git-lfs/wiki/Implementations%0A
[19]: https://github.com/git-lfs/git-lfs/tree/master/docs/api
[20]: https://github.com/git-lfs/git-lfs/blob/master/docs/api/authentication.md
[21]: https://github.com/git-lfs/git-lfs/blob/master/docs/proposals/ssh_adapter.md
[22]: https://tus.io/
[23]: https://github.com/git-lfs/git-lfs/blob/master/docs/custom-transfers.md
[24]: https://lwn.net/Articles/419241/
[25]: http://git-annex.branchable.com/direct_mode/
[26]: https://git-annex.branchable.com/tips/unlocked_files/
[27]: http://git-annex.branchable.com/todo/git_smudge_clean_interface_suboptiomal/
[28]: http://git-annex.branchable.com/special_remotes/
[29]: http://git-annex.branchable.com/special_remotes/external/
[30]: http://isuma-media-players.readthedocs.org/en/latest/index.html
[31]: https://github.com/RedeMocambos/baobaxia
[32]: https://web.gin.g-node.org/
[33]: https://www.datalad.org/
[34]: http://www.densho.org/
[35]: https://docs.gitlab.com/ee/workflow/git_annex.html
[36]: https://gitlab.com/gitlab-org/gitlab-ee/issues/1648
[37]: https://git-annex.branchable.com/todo/LFS_API_support/
[38]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=908678#52
[39]: https://lwn.net/Articles/774125/
[40]: http://lwn.net/
