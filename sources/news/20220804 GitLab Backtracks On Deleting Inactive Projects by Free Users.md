[#]: subject: "GitLab Backtracks On Deleting Inactive Projects by Free Users"
[#]: via: "https://news.itsfoss.com/gitlab-inactive-projects-policy/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

GitLab Backtracks On Deleting Inactive Projects by Free Users
======
GitLab almost turned into a villain we never expected with this new policy change. What are your thoughts on it?

![gitlab][1]

Right after Microsoft acquired GitHub, many users migrated to GitLab and other [GitHub alternatives][2].

Considering many popular open-source projects can be found on GitLab, it has a good reputation with developers and project maintainers.

**Update, Aug 5:** Originally reported by [The Register][3], GitLab planned to remove inactive projects by free user accounts. Now, GitLab seems to have [dropped the idea][4] after netizens expressed their concerns about it.

> We discussed internally what to do with inactive repositories. \
> We reached a decision to move unused repos to object storage. \
> Once implemented, they will still be accessible but take a bit longer to access after a long period of inactivity.

[@gitlab's tweet][5]

### GitLab Will Move Inactive Repos to Object Storage

GitLab shared a statement sharing that they will no longer delete inactive projects. Instead, they will move those projects to object storage, making them slower to access.

GitLab’s Co-founder and CEO, **Sid Sijbrandij**, further clarified that those projects would remain visible to everyone.

> Archived projects [https://t.co/4rOeJHNilh][6] is a user activated state that signals intent. We're not sure yet but very likely the storage type used is orthogonal to that. Our current plan for object storage [https://t.co/fLRl2TY744][7] would keep the repos visible to everyone.

[@sytses's tweet][8]

As per *The Register*, sources who requested anonymity revealed that a new policy was scheduled to come into force in September 2022, which would have resulted in removing several inactive projects on GitLab.

This move would have helped GitLab save up to **$1 million** yearly in hosting costs.

Now that they will no longer be deleting those projects, will they save hosting costs by moving projects to object storage?

*The Register* mentions that there have been internal discussions about the possibility of moving unused repos to object storage, where GitLab’s cost of maintaining it may increase due to required redundant backups.

**So, what changed in GitLab’s policy now?** Without official clarification by GitLab, we remain clueless.

### More Decisions to Make

GitLab hasn’t made any public statements regarding the entire situation. But, **GitLab’s CEO** mentioned the following when it comes to identifying inactive projects:

> We’re not sure yet. Probably all write operations would keep a project active, creating an issue, a merge request, pushing changes to a branch, etc. We might also keep it active as long as people are doing read operations such as cloning, forking, etc.

While we no longer have to worry about deleted projects, more clarity on this will be added to this in the coming days.

### A Valid Excuse: Was it?

GitLab deleting projects to save disk space was a big deal.

The entire point of offering free services was to let users host code on their platform, whether the project remains active or not. One can agree that everyone should encourage projects to have some activity. But why should that be a requirement to host your code on a platform that promises free services?

A developer can simply choose to make a simple tool/program and keep it at GitLab for anyone to find and fork it, with no aim to maintain/update it. Sometimes, the developer may no longer be available or have access to add activity to their projects.

**For example**, we have plenty of GitHub projects that haven’t seen any activity for years, but people still rely on it, fork it, and use it.

So, I’m sure you will come across several hundred projects that do not have any activity but are helpful or have a working fork.

**I think** GitLab, as a company with a good reputation shouldn’t have even thought about such an idea, to begin with.

*What do you think about GitLab’s original report on auto-deletion policy? Is object storage the perfect alternative for saving old repos? Kindly let me know your thoughts in the comments down below.*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gitlab-inactive-projects-policy/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/08/gitlab-backdrop-warning.jpg
[2]: https://itsfoss.com/github-alternatives/
[3]: https://www.theregister.com/2022/08/04/gitlab_data_retention_policy/
[4]: https://www.theregister.com/2022/08/05/gitlab_reverses_deletion_policy/
[5]: https://twitter.com/gitlab/status/1555325376687226883?ref_src=twsrc%5Etfw
[6]: https://docs.gitlab.com/ee/user/project/settings/
[7]: https://gitlab.com/groups/gitlab-org/-/epics/4959
[8]: https://twitter.com/sytses/status/1555344675761819648?ref_src=twsrc%5Etfw
