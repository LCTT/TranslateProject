3 tips for organizing your open source project's workflow on GitHub
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ)

Managing an open source project is challenging work, and the challenges grow as a project grows. Eventually, a project may need to meet different requirements and span multiple repositories. These problems aren't technical, but they are important to solve to scale a technical project. [Business process management][1] methodologies such as agile and [kanban][2] bring a method to the madness. Developers and managers can make realistic decisions for estimating deadlines and team bandwidth with an organized development focus.

At the [UNICEF Office of Innovation][3], we use GitHub project boards to organize development on the MagicBox project. [MagicBox][4] is a full-stack application and open source platform to serve and visualize data for decision-making in humanitarian crises and emergencies. The project spans multiple GitHub repositories and works with multiple developers. With GitHub project boards, we organize our work across multiple repositories to better understand development focus and team bandwidth.

Here are three tips from the UNICEF Office of Innovation on how to organize your open source projects with the built-in project boards on GitHub.

### 1\. Bring development discussion to issues and pull requests

Transparency is a critical part of an open source community. When mapping out new features or milestones for a project, the community needs to see and understand a decision or why a specific direction was chosen. Filing new GitHub issues for features and milestones is an easy way for someone to follow the project direction. GitHub issues and pull requests are the cards (or building blocks) of project boards. To be successful with GitHub project boards, you need to use issues and pull requests.


![GitHub issues for magicbox-maps, MagicBox's front-end application][6]

GitHub issues for magicbox-maps, MagicBox's front-end application.

The UNICEF MagicBox team uses GitHub issues to track ongoing development milestones and other tasks to revisit. The team files new GitHub issues for development goals, feature requests, or bugs. These goals or features may come from external stakeholders or the community. We also use the issues as a place for discussion on those tasks. This makes it easy to cross-reference in the future and visualize upcoming work on one of our projects.

Once you begin using GitHub issues and pull requests as a way of discussing and using your project, organizing with project boards becomes easier.

### 2\. Set up kanban-style project boards

GitHub issues and pull requests are the first step. After you begin using them, it may become harder to visualize what work is in progress and what work is yet to begin. [GitHub's project boards][7] give you a platform to visualize and organize cards into different columns.

There are two types of project boards available:

  * **Repository** : Boards for use in a single repository
  * **Organization** : Boards for use in a GitHub organization across multiple repositories (but private to organization members)



The choice you make depends on the structure and size of your projects. The UNICEF MagicBox team uses boards for development and documentation at the organization level, and then repository-specific boards for focused work (like our [community management board][8]).

#### Creating your first board

Project boards are found on your GitHub organization page or on a specific repository. You will see the Projects tab in the same row as Issues and Pull requests. From the page, you'll see a green button to create a new project.

There, you can set a name and description for the project. You can also choose templates to set up basic columns and sorting for your board. Currently, the only options are for kanban-style boards.


![Creating a new GitHub project board.][10]

Creating a new GitHub project board.

After creating the project board, you can make adjustments to it as needed. You can create new columns, [set up automation][11], and add pre-existing GitHub issues and pull requests to the project board.

You may notice new options for the metadata in each GitHub issue and pull request. Inside of an issue or pull request, you can add it to a project board. If you use automation, it will automatically enter a column you configured.

### 3\. Build project boards into your workflow

After you set up a project board and populate it with issues and pull requests, you need to integrate it into your workflow. Project boards are effective only when actively used. The UNICEF MagicBox team uses the project boards as a way to track our progress as a team, update external stakeholders on development, and estimate team bandwidth for reaching our milestones.


![Tracking progress][13]

Tracking progress with GitHub project boards.

If you are an open source project and community, consider using the project boards for development-focused meetings. It also helps remind you and other core contributors to spend five minutes each day updating progress as needed. If you're at a company using GitHub to do open source work, consider using project boards to update other team members and encourage participation inside of GitHub issues and pull requests.

Once you begin using the project board, yours may look like this:


![Development progress board][15]

Development progress board for all UNICEF MagicBox repositories in organization-wide GitHub project boards.

### Open alternatives

GitHub project boards require your project to be on GitHub to take advantage of this functionality. While GitHub is a popular repository for open source projects, it's not an open source platform itself. Fortunately, there are open source alternatives to GitHub with tools to replicate the workflow explained above. [GitLab Issue Boards][16] and [Taiga][17] are good alternatives that offer similar functionality.

### Go forth and organize!

With these tools, you can bring a method to the madness of organizing your open source project. These three tips for using GitHub project boards encourage transparency in your open source project and make it easier to track progress and milestones in the open.

Do you use GitHub project boards for your open source project? Have any tips for success that aren't mentioned in the article? Leave a comment below to share how you make sense of your open source projects.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/keep-your-project-organized-git-repo

作者：[Justin W.Flory][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jflory
[1]:https://en.wikipedia.org/wiki/Business_process_management
[2]:https://en.wikipedia.org/wiki/Kanban_(development)
[3]:http://unicefstories.org/about/
[4]:http://unicefstories.org/magicbox/
[5]:/file/393356
[6]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/github-open-issues.png?itok=OcWPX575 (GitHub issues for magicbox-maps, MagicBox's front-end application)
[7]:https://help.github.com/articles/about-project-boards/
[8]:https://github.com/unicef/magicbox/projects/3?fullscreen=true
[9]:/file/393361
[10]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/github-project-boards-create-board.png?itok=pp7SXH9g (Creating a new GitHub project board.)
[11]:https://help.github.com/articles/about-automation-for-project-boards/
[12]:/file/393351
[13]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/github-issues-metadata.png?itok=xp5auxCQ (Tracking progress)
[14]:/file/393366
[15]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/github-project-boards-overview.png?itok=QSbOOOkF (Development progress board)
[16]:https://about.gitlab.com/features/issueboard/
[17]:https://taiga.io/
