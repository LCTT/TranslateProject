icecoobe translating

part 7 - How to manage binary blobs with Git
=====================


In the previous six articles in this series we learned how to manage version control on text files with Git. But what about binary files? Git has extensions for handling binary blobs such as multimedia files, so today we will learn how to manage binary assets with Git.

One thing everyone seems to agree on is Git is not great for big binary blobs. Keep in mind that a binary blob is different from a large text file; you can use Git on large text files without a problem, but Git can't do much with an impervious binary file except treat it as one big solid black box and commit it as-is.

Say you have a complex 3D model for the exciting new first person puzzle game you're making, and you save it in a binary format, resulting in a 1 gigabyte file. Yougit commit it once, adding a gigabyte to your repository's history. Later, you give the model a different hair style and commit your update; Git can't tell the hair apart from the head or the rest of the model, so you've just committed another gigabyte. Then you change the model's eye color and commit that small change: another gigabyte. That is three gigabytes for one model with a few minor changes made on a whim. Scale that across all the assets in a game, and you have a serious problem.

Contrast that to a text file like the .obj format. One commit stores everything, just as with the other model, but an .obj file is a series of lines of plain text describing the vertices of a model. If you modify the model and save it back out to .obj, Git can read the two files line by line, create a diff of the changes, and process a fairly small commit. The more refined the model becomes, the smaller the commits get, and it's a standard Git use case. It is a big file, but it uses a kind of overlay or sparse storage method to build a complete picture of the current state of your data.

However, not everything works in plain text, and these days everyone wants to work with Git. A solution was required, and several have surfaced.

[OSTree](https://ostree.readthedocs.io/en/latest/) began as a GNOME project and is intended to manage operating system binaries. It doesn't apply here, so I'll skip it.

[Git Large File Storage](https://git-lfs.github.com/) (LFS) is an open source project from GitHub that began life as a fork of git-media. [git-media](https://github.com/alebedev/git-media) and [git-annex](https://git-annex.branchable.com/walkthrough/) are extensions to Git meant to manage large files. They are two different approaches to the same problem, and they each have advantages. These aren't official statements from the projects themselves, but in my experience, the unique aspects of each are:

*   git-media is a centralised model, a repository for common assets. You tellgit-media where your large files are stored, whether that is a hard drive, a server, or a cloud storage service, and each user on your project treats that location as the central master location for large assets.
*   git-annex favors a distributed model; you and your users create repositories, and each repository gets a local .git/annex directory where big files are stored. The annexes are synchronized regularly so that all assets are available to all users as needed. Unless configured otherwise with annex-cost, git-annex prefers local storage before off-site storage.

Of these options, I've used git-media and git-annex in production, so I'll give you an overview of how they each work.

```
git-media
```

git-media uses Ruby, so you must install a gem for it. Instructions are on the[website](https://github.com/alebedev/git-media). Each user who wants to use git-media needs to install it, but it is cross-platform, so that is not a problem.

After installing git-media, you must set some Git configuration options. You only need to do this once per machine you use:

```
$ git config filter.media.clean "git-media filter-clean"$ git config filter.media.smudge "git-media filter-smudge"
```

In each repository that you want to use git-media, set an attribute to marry the filters you've just created to the file types you want to classify as media. Don't get confused by the terminology; a better term is "assets," since "media" usually means audio, video, and photos, but you might just as easily classify 3D models, bakes, and textures as media.

For example:

```
$ echo "*.mp4 filter=media -crlf" >> .gitattributes$ echo "*.mkv filter=media -crlf" >> .gitattributes$ echo "*.wav filter=media -crlf" >> .gitattributes$ echo "*.flac filter=media -crlf" >> .gitattributes$ echo "*.kra filter=media -crlf" >> .gitattributes
```

When you stage a file of those types, the file is copied to .git/media.

Assuming you have a Git repository on the server already, the final step is to tell your Git repository where the "mothership" is; that is, where the media files will go when they have been pushed for all users to share. Set this in the repository's.git/config file, substituting your own user, host, and path:

```
[git-media]
transport = scp
autodownload = false #true to pull assets by default
scpuser = seth
scphost = example.com
scppath = /opt/jupiter.git
```

If you have complex SSH settings on your server, such as a non-standard port or path to a non-default SSH key file use .ssh/config to set defaults for the host.

Life with git-media is mostly normal; you work in your repository, you stage files and blobs alike, and commit them as usual. The only difference in workflow is that at some point along the way, you should sync your secret stockpile of assets (er, media) to the shared repository.

When you are ready to publish your assets for your team or for your own backup, use this command:

```
$ git media sync
```

To replace a file in git-media with a changed version (for example, an audio file has been sweetened, or a matte painting has been completed, or a video file has been colour graded), you must explicitly tell Git to update the media. This overrides git-media's default to not copy a file if it already exists remotely:

```
$ git update-index --really-refresh
```

When other members of your team (or you, on a different computer) clones the repository, no assets will be downloaded by default unless you have set theautodownload option in .git/config to true. A git media sync cures all ills.

```
git-annex
```

git-annex has a slightly different workflow, and defaults to local repositories, but the basic ideas are the same. You should be able to install git-annex from your distribution's repository, or you can get it from the website as needed. As withgit-media, any user using git-annex must install it on their machine.

The initial setup is simpler than git-media. To create a bare repository on your server run this command, substituting your own path:

```
$ git init --bare --shared /opt/jupiter.git
```

Then clone it onto your local computer, and mark it as a git-annex location:

```
$ git clone seth@example.com:/opt/jupiter.cloneCloning into 'jupiter.clone'... warning: You appear to have clonedan empty repository. Checking connectivity... done.$ git annex init "seth workstation" init seth workstation ok
```

Rather than using filters to identify media assets or large files, you configure what gets classified as a large file by using the git annex command:

```
$ git annex add bigblobfile.flacadd bigblobfile.flac (checksum) ok(Recording state in Git...)
```

Committing is done as usual:

```
$ git commit -m 'added flac source for sound fx'
```

But pushing is different, because git annex uses its own branch to track assets. The first push you make may need the -u option, depending on how you manage your repository:

```
$ git push -u origin master git-annexTo seth@example.com:/opt/jupiter.git* [new branch] master -> master* [new branch] git-annex -> git-annex
```

As with git-media, a normal git push does not copy your assets to the server, it only sends information about the media. When you're ready to share your assets with the rest of the team, run the sync command:

```
$ git annex sync --content
```

If someone else has shared assets to the server and you need to pull them, git annex sync will prompt your local checkout to pull assets that are not present on your machine, but that exist on the server.

Both git-media and git-annex are flexible and can use local repositories instead of a server, so they're just as useful for managing private local projects, too.

Git is a powerful and extensible system, and by now there is really no excuse for not using it. Try it out today!

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/8/how-manage-binary-blobs-git-part-7

作者：[Seth Kenlon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
