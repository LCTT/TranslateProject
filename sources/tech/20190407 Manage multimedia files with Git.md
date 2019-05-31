[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage multimedia files with Git)
[#]: via: (https://opensource.com/article/19/4/manage-multimedia-files-git)
[#]: author: (Seth Kenlon  https://opensource.com/users/seth)

Manage multimedia files with Git
======
Learn how to use Git to track large multimedia files in your projects in
the final article in our series on little-known uses of Git.
![video editing dashboard][1]

Git is very specifically designed for source code version control, so it's rarely embraced by projects and industries that don't primarily work in plaintext. However, the advantages of an asynchronous workflow are appealing, especially in the ever-growing number of industries that combine serious computing with seriously artistic ventures, including web design, visual effects, video games, publishing, currency design (yes, that's a real industry), education… the list goes on and on.

In this series leading up to Git's 14th anniversary, we've shared six little-known ways to use Git. In this final article, we'll look at software that brings the advantages of Git to managing multimedia files.

### The problem with managing multimedia files with Git

It seems to be common knowledge that Git doesn't work well with non-text files, but it never hurts to challenge assumptions. Here's an example of copying a photo file using Git:


```
$ du -hs
108K .
$ cp ~/photos/dandelion.tif .
$ git add dandelion.tif
$ git commit -m 'added a photo'
[master (root-commit) fa6caa7] two photos
1 file changed, 0 insertions(+), 0 deletions(-)
create mode 100644 dandelion.tif
$ du -hs
1.8M .
```

Nothing unusual so far; adding a 1.8MB photo to a directory results in a directory 1.8MB in size. So, let's try removing the file:


```
$ git rm dandelion.tif
$ git commit -m 'deleted a photo'
$ du -hs
828K .
```

You can see the problem here: Removing a large file after it's been committed increases a repository's size roughly eight times its original, barren state (from 108K to 828K). You can perform tests to get a better average, but this simple demonstration is consistent with my experience. The cost of committing files that aren't text-based is minimal at first, but the longer a project stays active, the more changes people make to static content, and the more those fractions start to add up. When a Git repository becomes very large, the major cost is usually speed. The time to perform pulls and pushes goes from being how long it takes to take a sip of coffee to how long it takes to wonder if your computer got kicked off the network.

The reason static content causes Git to grow in size is that formats based on text allow Git to pull out just the parts that have changed. Raster images and music files make as much sense to Git as they would to you if you looked at the binary data contained in a .png or .wav file. So Git just takes all the data and makes a new copy of it, even if only one pixel changes from one photo to the next.

### Git-portal

In practice, many multimedia projects don't need or want to track the media's history. The media part of a project tends to have a different lifecycle than the text or code part of a project. Media assets generally progress in one direction: a picture starts as a pencil sketch, proceeds toward its destination as a digital painting, and, even if the text is rolled back to an earlier version, the art continues its forward progress. It's rare for media to be bound to a specific version of a project. The exceptions are usually graphics that reflect datasets—usually tables or graphs or charts—that can be done in text-based formats such as SVG.

So, on many projects that involve both media and text (whether it's narrative prose or code), Git is an acceptable solution to file management, as long as there's a playground outside the version control cycle for artists to play in.

![Graphic showing relationship between art assets and Git][2]

A simple way to enable that is [Git-portal][3], a Bash script armed with Git hooks that moves your asset files to a directory outside Git's purview and replaces them with symlinks. Git commits the symlinks (sometimes called aliases or shortcuts), which are trivially small, so all you commit are your text files and whatever symlinks represent your media assets. Because the replacement files are symlinks, your project continues to function as expected because your local machine follows the symlinks to their "real" counterparts. Git-portal maintains a project's directory structure when it swaps out a file with a symlink, so it's easy to reverse the process, should you decide that Git-portal isn't right for your project or you need to build a version of your project without symlinks (for distribution, for instance).

Git-portal also allows remote synchronization of assets over rsync, so you can set up a remote storage location as a centralized source of authority.

Git-portal is ideal for multimedia projects, including video game and tabletop game design, virtual reality projects with big 3D model renders and textures, [books][4] with graphics and .odt exports, collaborative [blog websites][5], music projects, and much more. It's not uncommon for an artist to perform versioning in their application—in the form of layers (in the graphics world) and tracks (in the music world)—so Git adds nothing to multimedia project files themselves. The power of Git is leveraged for other parts of artistic projects (prose and narrative, project management, subtitle files, credits, marketing copy, documentation, and so on), and the power of structured remote backups is leveraged by the artists.

#### Install Git-portal

There are RPM packages for Git-portal located at <https://klaatu.fedorapeople.org/git-portal>, which you can download and install.

Alternately, you can install Git-portal manually from its home on GitLab. It's just a Bash script and some Git hooks (which are also Bash scripts), but it requires a quick build process so that it knows where to install itself:


```
$ git clone <https://gitlab.com/slackermedia/git-portal.git> git-portal.clone
$ cd git-portal.clone
$ ./configure
$ make
$ sudo make install
```

#### Use Git-portal

Git-portal is used alongside Git. This means, as with all large-file extensions to Git, there are some added steps to remember. But you only need Git-portal when dealing with your media assets, so it's pretty easy to remember unless you've acclimated yourself to treating large files the same as text files (which is rare for Git users). There's one setup step you must do to use Git-portal in a project:


```
$ mkdir bigproject.git
$ cd !$
$ git init
$ git-portal init
```

Git-portal's **init** function creates a **_portal** directory in your Git repository and adds it to your .gitignore file.

Using Git-portal in a daily routine integrates smoothly with Git. A good example is a MIDI-based music project: the project files produced by the music workstation are text-based, but the MIDI files are binary data:


```
$ ls -1
_portal
song.1.qtr
song.qtr
song-Track_1-1.mid
song-Track_1-3.mid
song-Track_2-1.mid
$ git add song*qtr
$ git-portal song-Track*mid
$ git add song-Track*mid
```

If you look into the **_portal** directory, you'll find the original MIDI files. The files in their place are symlinks to **_portal** , which keeps the music workstation working as expected:


```
$ ls -lG
[...] _portal/
[...] song.1.qtr
[...] song.qtr
[...] song-Track_1-1.mid -> _portal/song-Track_1-1.mid*
[...] song-Track_1-3.mid -> _portal/song-Track_1-3.mid*
[...] song-Track_2-1.mid -> _portal/song-Track_2-1.mid*
```

As with Git, you can also add a directory of files:


```
$ cp -r ~/synth-presets/yoshimi .
$ git-portal add yoshimi
Directories cannot go through the portal. Sending files instead.
$ ls -lG _portal/yoshimi
[...] yoshimi.stat -> ../_portal/yoshimi/yoshimi.stat*
```

Removal works as expected, but when removing something in **_portal** , you should use **git-portal rm** instead of **git rm**. Using Git-portal ensures that the file is removed from **_portal** :


```
$ ls
_portal/ song.qtr song-Track_1-3.mid@ yoshimi/
song.1.qtr song-Track_1-1.mid@ song-Track_2-1.mid@
$ git-portal rm song-Track_1-3.mid
rm 'song-Track_1-3.mid'
$ ls _portal/
song-Track_1-1.mid* song-Track_2-1.mid* yoshimi/
```

If you forget to use Git-portal, then you have to remove the portal file manually:


```
$ git-portal rm song-Track_1-1.mid
rm 'song-Track_1-1.mid'
$ ls _portal/
song-Track_1-1.mid* song-Track_2-1.mid* yoshimi/
$ trash _portal/song-Track_1-1.mid
```

Git-portal's only other function is to list all current symlinks and find any that may have become broken, which can sometimes happen if files move around in a project directory:


```
$ mkdir foo
$ mv yoshimi foo
$ git-portal status
bigproject.git/song-Track_2-1.mid: symbolic link to _portal/song-Track_2-1.mid
bigproject.git/foo/yoshimi/yoshimi.stat: broken symbolic link to ../_portal/yoshimi/yoshimi.stat
```

If you're using Git-portal for a personal project and maintaining your own backups, this is technically all you need to know about Git-portal. If you want to add in collaborators or you want Git-portal to manage backups the way (more or less) Git does, you can a remote.

#### Add Git-portal remotes

Adding a remote location for Git-portal is done through Git's existing remote function. Git-portal implements Git hooks, scripts hidden in your repository's .git directory, to look at your remotes for any that begin with **_portal**. If it finds one, it attempts to **rsync** to the remote location and synchronize files. Git-portal performs this action anytime you do a Git push or a Git merge (or pull, which is really just a fetch and an automatic merge).

If you've only cloned Git repositories, then you may never have added a remote yourself. It's a standard Git procedure:


```
$ git remote add origin [git@gitdawg.com][6]:seth/bigproject.git
$ git remote -v
origin [git@gitdawg.com][6]:seth/bigproject.git (fetch)
origin [git@gitdawg.com][6]:seth/bigproject.git (push)
```

The name **origin** is a popular convention for your main Git repository, so it makes sense to use it for your Git data. Your Git-portal data, however, is stored separately, so you must create a second remote to tell Git-portal where to push to and pull from. Depending on your Git host, you may need a separate server because gigabytes of media assets are unlikely to be accepted by a Git host with limited space. Or maybe you're on a server that permits you to access only your Git repository and not external storage directories:


```
$ git remote add _portal [seth@example.com][7]:/home/seth/git/bigproject_portal
$ git remote -v
origin [git@gitdawg.com][6]:seth/bigproject.git (fetch)
origin [git@gitdawg.com][6]:seth/bigproject.git (push)
_portal [seth@example.com][7]:/home/seth/git/bigproject_portal (fetch)
_portal [seth@example.com][7]:/home/seth/git/bigproject_portal (push)
```

You may not want to give all of your users individual accounts on your server, and you don't have to. To provide access to the server hosting a repository's large file assets, you can run a Git frontend like **[Gitolite][8]** , or you can use **rrsync** (i.e., restricted rsync).

Now you can push your Git data to your remote Git repository and your Git-portal data to your remote portal:


```
$ git push origin HEAD
master destination detected
Syncing _portal content...
sending incremental file list
sent 9,305 bytes received 18 bytes 1,695.09 bytes/sec
total size is 60,358,015 speedup is 6,474.10
Syncing _portal content to example.com:/home/seth/git/bigproject_portal
```

If you have Git-portal installed and a **_portal** remote configured, your **_portal** directory will be synchronized, getting new content from the server and sending fresh content with every push. While you don't have to do a Git commit and push to sync with the server (a user could just use rsync directly), I find it useful to require commits for artistic changes. It integrates artists and their digital assets into the rest of the workflow, and it provides useful metadata about project progress and velocity.

### Other options

If Git-portal is too simple for you, there are other options for managing large files with Git. [Git Large File Storage][9] (LFS) is a fork of a defunct project called git-media and is maintained and supported by GitHub. It requires special commands (like **git lfs track** to protect large files from being tracked by Git) and requires the user to manage a .gitattributes file to update which files in the repository are tracked by LFS. It supports _only_ HTTP and HTTPS remotes for large files, so your LFS server must be configured so users can authenticate over HTTP rather than SSH or rsync.

A more flexible option than LFS is [git-annex][10], which you can learn more about in my article about [managing binary blobs in Git][11] (ignore the parts about the deprecated git-media, as its former flexibility doesn't apply to its successor, Git LFS). Git-annex is a flexible and elegant solution with a detailed system for adding, removing, and moving large files within a repository. Because it's flexible and powerful, there are lots of new commands and rules to learn, so take a look at its [documentation][12].

If, however, your needs are simple and you like a solution that utilizes existing technology to do simple and obvious tasks, Git-portal might be the tool for the job.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/manage-multimedia-files-git

作者：[Seth Kenlon (Red Hat, Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/video_editing_folder_music_wave_play.png?itok=-J9rs-My (video editing dashboard)
[2]: https://opensource.com/sites/default/files/uploads/git-velocity.jpg (Graphic showing relationship between art assets and Git)
[3]: http://gitlab.com/slackermedia/git-portal.git
[4]: https://www.apress.com/gp/book/9781484241691
[5]: http://mixedsignals.ml
[6]: mailto:git@gitdawg.com
[7]: mailto:seth@example.com
[8]: https://opensource.com/article/19/4/file-sharing-git
[9]: https://git-lfs.github.com/
[10]: https://git-annex.branchable.com/
[11]: https://opensource.com/life/16/8/how-manage-binary-blobs-git-part-7
[12]: https://git-annex.branchable.com/walkthrough/
