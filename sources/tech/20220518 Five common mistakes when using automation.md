[#]: subject: "Five common mistakes when using automation"
[#]: via: "https://fedoramagazine.org/five-common-mistakes-when-using-automation/"
[#]: author: "Gary Scarborough https://fedoramagazine.org/author/gscarbor/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Five common mistakes when using automation
======

![][1]

Background image from ["Modern Times" (1936)][2], [United Artists][3], Public domain, via Wikimedia Commons

As automation expands to cover more aspects of IT, more administrators are learning automation skills and applying them to ease their workload. Automation can ease the burden of repetitive tasks and add a level of conformity to infrastructure. But when IT workers deploy automation, there are common mistakes that can wreak havoc on infrastructures large and small. Five common mistakes are typically seen in automation deployments.

### Lack of testing

A beginner’s mistake that is commonly made is that automation scripts are not thoroughly tested. A simple shell script can have adverse affects on a server due to typos or logic errors. Multiply that mistake by the number of servers in your infrastructure, and you can have a big mess to clean up. Always test your automation scripts before deploying in large scale.

### Unexpected server load

The second mistake that frequently occurs is not predicting the system load the script may put on other resources. Running a script that downloads a file or installs a package from a repository may be fine when the target is a dozen servers. Scripts are often run against hundreds or thousands of servers. This load can bring supporting services to a stand still or crash them entirely. Don’t forget to consider end point impact or set a reasonable concurrency rate.

### Run away scripts

One use of automation tools is to ensure compliance to standard settings. Automation can make it easy to ensure that every server in a group has exactly the same settings. Problems may arise if a server in that group needs to be altered from that baseline, and the administrator is not aware of the compliance standard. Unneeded and unwanted services can be installed and enabled leading to possible security concerns.

### Lack of documentation

A constant duty for administrators should be to document their work. Companies can have frequent new employees in IT departments due to contracts ending or promotions or regular employee turnover. It is also not uncommon for work groups within a company to be siloed from each other. For these reasons it is important to document what automation is in place. Unlike user run scripts, automation may continue long after the person who created it leaves the group. Administrators can find themselves facing strange behaviors in their infrastructure from automation left unchecked.

### Lack of experience

The last mistake on the list is when administrators do not know enough about the systems they are automating. Too often admins are hired to work positions where they do not have adequate training and no one to learn from. This has been especially relevant since COVID when companies are struggling to fill vacancies. Admins are then forced to deal with infrastructure they didn’t set up and may not fully understand. This can lead to very inefficient scripts that waste resources or misconfigured servers.

### Conclusion

More and more admins are learning automation to help them in their everyday tasks. As a result, automation is being applied to more areas of technology. Hopefully this list will help prevent new users from making these mistakes and urge seasoned admins to re-evaluate their IT strategies. Automation is meant to ease the burden of repetitive tasks, not cause more work for the end user.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/five-common-mistakes-when-using-automation/

作者：[Gary Scarborough][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/gscarbor/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/05/modern-times-816x345.jpg
[2]: https://en.wikipedia.org/wiki/Modern_Times_(film)
[3]: https://commons.wikimedia.org/wiki/File:Chaplin_-_Modern_Times.jpg
