Terrible Ideas in Git
============================================================


 ![Corey Quinn](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/corey-quinn-lcna.png?itok=IU3oGzfn "Corey Quinn") 
"Git does let you do some extraordinarily powerful things. Powerful, of course, in this talk, is a polite euphemism for stupid," says Corey Quinn of FutureAdvisor at LinuxCon North America.[The Linux Foundation][2]

"Git does let you do some extraordinarily powerful things. Powerful, of course, in this talk, is a polite euphemism for stupid," says Corey Quinn of FutureAdvisor at [LinuxCon North America][5]. Who hasn't experienced at least one moment of feeling like a complete dunce when using Git? Sure, Git is wonderful, everyone uses it, and you can do most of your work with a few basic commands. But it also has mighty powers to make us feel like we have no idea what we're doing.

But that's really not being fair to ourselves. Nobody knows everything, and everyone knows something different. Quinn reminds us, "During the Q and A section for some of my talks, people sometimes raise their hand and say, "Well, I have a really dumb question," and you see people in there are, "Yeah! That's a really dumb question". But when they get an answer, those people are taking an awful lot of notes."

![Git](https://www.linux.com/sites/lcom/files/styles/floated_images/public/heffalump-git-corey-quinn_0.png?itok=xh5JlnLW "Git") 

[Used with permission][1]

Quinn starts his talk with some fun demonstrations of terrible things you can do with Git such as messing up an entire project by rebasing master and then making a forced push, mis-typing commands and getting scolded by Git, and committing large binaries. Then he demonstrates how to make these terrible things less terrible, such as managing large binaries more sanely. "You can commit large binaries. You can commit atrocities in Git. If you wind up needing to store large binaries, there are two tools out there that tend to really speed up loads. One is git-annex, which was was created by Joey Hess, a Debian developer, and git-lfs, which is supported by GitHub".

Do you keep making the same typo, like typing "git stitis" when you want "git status"? Quinn has an answer for this: "Git does have built-in support for aliases, so you can use relatively long, complex things and alias it to a short Git command." You can also use shell aliases.

Quinn says, "We've all heard about rebasing master, and then doing a forced push, a hilarious prank to all of your co-workers. What that does is it changes history, so that suddenly what happened before is not what people are actually working on, and everyone else winds up getting screwed in the process. A group of whales is called a 'pod', a group of crows is called a 'murder', and a group of developers is called a 'merge conflict'...On a more serious note, if someone does do something like this, you do have a few options." These include restoring master from a known good backup, revert commits, or "Hurl the person responsible, screaming, from the roof of your office." Or, take a dose of prevention and use a little-known Git feature called branch protection. When you enable branch protection, branches cannot be deleted or force-pushed, and pull requests must have at least one review before acceptance.

Quinn demonstrates several more wonderfully useful tools to make Git more efficient and foolproof such as mr, vcsh, and customized shell prompts. You can see these in the complete video (below), and enjoy more silly jokes.

--------------------------------------------------------------------------------

via: https://www.linux.com/news/event/LinuxCon-Europe/2016/terrible-ideas-git-0

作者：[CARLA SCHRODER][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/linux-foundation
[3]:https://www.linux.com/files/images/heffalump-git-corey-quinnpng-0
[4]:https://www.linux.com/files/images/corey-quinn-lcnapng
[5]:http://events.linuxfoundation.org/events/linuxcon-north-america
