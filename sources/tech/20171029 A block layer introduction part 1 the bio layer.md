A block layer introduction part 1: the bio layer
============================================================

### A block layer introduction part 1: the bio layer

In reply to: [A block layer introduction part 1: the bio layer][1] by amarao
Parent article: [A block layer introduction part 1: the bio layer][2]Hi,
the problem you describe here is not directly related to the block layer. It is probably a driver bug, possible a SCSI-layer bug, but definitely not a block-layer problem.
Reporting bugs against Linux is, unfortunately, a bit of a hit-and-miss affair. Some developers refused to touch bugzilla, some love it, and some (like me) only use it begrudgingly.
The alternative is to send email. For that you need to choose the right list and maybe the right developer, and you need to catch them when they are in a good mood or aren't too busy or not on holidays. Some people will make an effort to respond to everything, others are completely unpredictable - and that is for me who usually sends a patch with any bug report. If you just have a bug that you barely understand yourself, your expected response rate is probably lower. Sad, but true.

Lots of bugs do get responded to and dealt with, but lots do not.

I don't think it is fair to say that nobody cares, but it probably is true that nobody sees it as being as important as you do. If you want a solution, then you need to drive it. One way to drive it is to spend money on a consultant or with a support contract from a distributor. I suspect that isn't possible in your situation. Another way is to learn how the code works and find a solution yourself. Lots of people do that, but again it might not be an option for you. Another way is to keep raising the issue on different relevant forums until you get a response. Persistence can bear fruit. You would need to be prepared to perform whatever testing is asked of you, possibly including building a new kernel to test.

If you are able to reproduce this problem on a recent kernel (4.12 or later) I suggest that you email a report to
linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, and me (neilb@suse.com) (note that you do not need to subscribe to these lists to send mail, just send it). Describe the hardware and how to trigger the problem.
Include the stack trace of any process in "D" state. You can get this with
cat /proc/$PID/stack
where "$PID" is the pid of the process.

Be sure to avoid complaining or saying how this has been broken for years and how it is grossly inadequate. Nobody cares about that. We do care about bugs and generally want to fix them. So just report the relevant facts.
Try to include all facts in the mail rather than via links to somewhere else. Sometimes links are necessary, but in the case of your script, it is 8 lines long so just include it in the email (and avoid descriptions like "fuckup"; just call it "broken" or similar). Also make sure your email isn't sent as HTML. We like just plain text. HTML is rejected by all @vger.kernel.org mailing lists. You might need to configure your email program to not send HTML.

--------------------------------------------------------------------------------

via: https://lwn.net/Articles/737655/

作者：[ neilbrown][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://lwn.net/Articles/737655/
[1]:https://lwn.net/Articles/737588/
[2]:https://lwn.net/Articles/736534/
