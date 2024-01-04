[#]: subject: "Writing Docs with Kate"
[#]: via: "https://fedoramagazine.org/writing-docs-with-kate-and-git/"
[#]: author: "Hank Lee https://fedoramagazine.org/author/hankuoffroad/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Writing Docs with Kate
======

![][1]

Photo by [Daria Glakteeva][2] on [Unsplash][3]

Kate ( **K** DE **A** dvanced **T** ext **E** ditor) is a Free and Open Source text editor, available for Linux, Windows and macOS.

For documentation writers, the integrated Git features of Kate can help simplify the writing process. You do not need to remember Git commands and type them in the terminal every time you make changes to files or switch branches.

This article focuses on key features of Kate for contributors working on various Fedora documentation repositories. The capabilities can be extended to other documentation repositories.

### Preparations For Using Kate With Your Repository

  1. Add SSH key to settings of your account on Pagure, GitLab or GitHub.
    * On Pagure, go to My Settings – SSH Keys – Add SSH Key
    * On GitLab, Preferences – User Settings – Add an SSH Key
    * On GitHub, Settings – SSH and GPG keys – New SSH key
  2. Fork a project: Go to the upstream repository and select the Fork button
  3. Clone the repository
    * In your forked repository, select Clone with SSH.
    * Next, copy that link to your clipboard and paste it in GIT URL in terminal.
    * When cloning a repository, you can specify the new directory name as an additional argument. $ git clone <GIT URL> new directory
  4. Install Kate. If you are Linux users, go to the packager manager of your distro to install Kate. If you use Fedora Linux, we recommend the Fedora Linux RPM version or Flatpak.



### Sessions

Sessions in Kate text editor keep separate projects grouped together and help you work with multiple documentation repositories in a single view.

To save repositories in a session:

Go to the _File_ , pull down menu – Select _Open folder_ – Choose the cloned directory.
From the _Sessions,_ pull down menu – Select _Save session_ – Enter a session name – Press OK.

On the left pane, click _project list_ saved to a new session ‘Magazine’. Next time you open Kate, the cloned repositories saved to the session will reappear.

![Sessions Menu][4]

### Using the Status Bar to checkout a branch

With Kate editor, you can switch branches or create a new branch on the status bar and pop-up screen.

The current branch is shown in the lower right corner in the status bar.
To create a new branch, select _Main_ branch.
From the popup menu select _Create New Branch_ and enter a new branch name.

![Popup menu showing Create New branch][5]

### Built-in support for AsciiDoc highlighting

Files with the AsciiDoc extension will automatically be highlighted using the rules in asciidoc.xml. You don’t need to install external plugins.

### On-the-fly spell checking

If you want automatic spell checking as you type, press Ctrl + Shift + O. This key combination will toggle spell check on and off.

### Git toolview

The toolview on the left pane shows the git status of each open files.

![Show diff][6]

_Staged_ means the files are added (same as Git add) and will be committed if you select the **Commit** button at the top.

_Modified_ shows the changes that are not staged yet.

Click the _Commit_ button at the top of the left panel to show the diff for that commit. This will open the selected commit in the Commit toolview. If you want to see all the changes in the commit, right click and select _Show Full Commit_. Add a commit message.

_git push_ button is to the right of the _commit_ button. _git pull_ button is to the right of the git push button.

Select the _refresh_ icon (circular arrows) to see what has been going on with staged files and commits.

### Integrated terminal

Press _F4_ , or select the _terminal_ button, to toggle the integrated terminal on and off.

You may take your writing to the next level, ensure documentation quality, by using build scripts and Vale linter via the integrated terminal.

**Step 1. Run build scripts**

To check document quality locally, you may run build and preview scripts in the integrated terminal. Build and preview scripts let you view the changes exactly how it will be published in Docs pages through Antora static site generator.

Note: check the README page of your Fedora documentation repositories to use the correct file name for build scripts and instructions. The following is an example:

To build and preview the site, run:

$ ./docsbuilder.sh -p

The result will be available at <http://localhost:8080>

To stop the preview:

$ ./docsbuilder.sh -k

**Step 2. Run Vale on your text**

Vale is a command line tool that checks your text for adherence to a defined style guide. Run Vale locally referring [to the guide][7].

### Credits and acknowledgements

Big thanks to Nicco, a KDE developer, who provided me with a great deal of inspiration from his video tutorial channel ‘[Nicco loves Linux][8]‘.

Kate Version used in this article was 23.08.3

[Upstream documentation][9]

The following are Fedora documentation Git repos used in this article;

[Quick Docs][10]
[Kinoite User Docs][11]
[IoT User Docs][12]
[Documentation Contributors Guide][13]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/writing-docs-with-kate-and-git/

作者：[Hank Lee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/hankuoffroad/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/12/writing_w_kate-816x345.jpg
[2]: https://unsplash.com/@olenichek?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[3]: https://unsplash.com/photos/a-person-typing-on-a-laptop-on-a-desk-2w0IdiEI-hg?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[4]: https://fedoramagazine.org/wp-content/uploads/2023/12/1-multirepo-1024x418.png
[5]: https://fedoramagazine.org/wp-content/uploads/2023/12/2-branch-1024x493.png
[6]: https://fedoramagazine.org/wp-content/uploads/2023/12/4-Show-diff-1024x313.png
[7]: https://docs.fedoraproject.org/en-US/fedora-docs/contributing-docs/tools-vale-linter/
[8]: https://www.youtube.com/c/Niccol%C3%B2Ve
[9]: https://docs.kde.org/stable5/en/kate/kate/index.html
[10]: https://pagure.io/fedora-docs/quick-docs.git
[11]: https://pagure.io/fedora-kde/kinoite-docs.git
[12]: https://github.com/fedora-iot/iot-docs.git
[13]: https://gitlab.com/fedora/docs/community-tools/documentation-contributors-guide.git
