Translated by chunyang-wen
GitLab Workflow: An Overview
======

GitLab is a Git-based repository manager and a powerful complete application for software development.

With an _"user-and-newbie-friendly" interface_, GitLab allows you to work effectively, both from the command line and from the UI itself. It's not only useful for developers, but can also be integrated across your entire team to bring everyone into a single and unique platform.

The GitLab Workflow logic is intuitive and predictable, making the entire platform easy to use and easier to adopt. Once you do, you won't want anything else!

* * *

### In this post

*   [GitLab Workflow][53]
    *   [Stages of Software Development][22]
*   [GitLab Issue Tracker][52]
    *   [Confidential Issues][21]
    *   [Due dates][20]
    *   [Assignee][19]
    *   [Labels][18]
    *   [Issue Weight][17]
    *   [GitLab Issue Board][16]
*   [Code Review with GitLab][51]
    *   [First Commit][15]
    *   [Merge Request][14]
    *   [WIP MR][13]
    *   [Review][12]
*   [Build, Test, and Deploy][50]
    *   [Koding][11]
    *   [Use-Cases][10]
*   [Feedback: Cycle Analytics][49]
*   [Enhance][48]
    *   [Issue and MR Templates][9]
    *   [Milestones][8]
*   [Pro Tips][47]
    *   [For both Issues and MRs][7]
        *   [Subscribe][3]
        *   [Add TO-DO][2]
        *   [Search for your Issues and MRs][1]
    *   [Moving Issues][6]
    *   [Code Snippets][5]
*   [GitLab WorkFlow Use-Case Scenario][46]
*   [Conclusions][45]

* * *

### GitLab Workflow

The **GitLab Workflow** is a logical sequence of possible actions to be taken during the entire lifecycle of the software development process, using GitLab as the platform that hosts your code.

The GitLab Workflow takes into account the [GitLab Flow][97], which consists of **Git-based** methods and tactics for version management, such as **branching strategy**, **Git best practices**, and so on.

With the GitLab Workflow, the [goal][96] is to help teams work cohesively and effectively from the first stage of implementing something new (ideation) to the last stage—deploying implementation to production. That's what we call "going faster from idea to production in 10 steps."

![FROM IDEA TO PRODUCTION IN 10 STEPS](https://about.gitlab.com/images/blogimages/idea-to-production-10-steps.png)

### Stages of Software Development

The natural course of the software development process passes through 10 major steps; GitLab has built solutions for all of them:

1.  **IDEA:** Every new proposal starts with an idea, which usually come up in a chat. For this stage, GitLab integrates with [Mattermost][44].
2.  **ISSUE:** The most effective way to discuss an idea is creating an issue for it. Your team and your collaborators can help you to polish and improve it in the [issue tracker][43].
3.  **PLAN:** Once the discussion comes to an agreement, it's time to code. But wait! First, we need to prioritize and organize our workflow. For this, we can use the [Issue Board][42].
4.  **CODE:** Now we're ready to write our code, once we have everything organized.
5.  **COMMIT:** Once we're happy with our draft, we can commit our code to a feature-branch with version control.
6.  **TEST:** With [GitLab CI][41], we can run our scripts to build and test our application.
7.  **REVIEW:** Once our script works and our tests and builds succeeds, we are ready to get our [code reviewed][40] and approved.
8.  **STAGING:** Now it's time to [deploy our code to a staging environment][39] to check if everything worked as we were expecting or if we still need adjustments.
9.  **PRODUCTION:** When we have everything working as it should, it's time to [deploy to our production environment][38]!
10.  **FEEDBACK:** Now it's time to look back and check what stage of our work needs improvement. We use [Cycle Analytics][37] for feedback on the time we spent on key stages of our process.

To walk through these stages smoothly, it's important to have powerful tools to support this workflow. In the following sections, you'll find an overview of the toolset available from GitLab.

### GitLab Issue Tracker

GitLab has a powerful issue tracker that allows you, your team, and your collaborators to share and discuss ideas, before and while implementing them.

![issue tracker - view list](https://about.gitlab.com/images/blogimages/gitlab-workflow-an-overview/issue-tracker-list-view.png)

Issues are the first essential feature of the GitLab Workflow. [Always start a discussion with an issue][95]; it's the best way to track the evolution of a new idea.

It's most useful for:

*   Discussing ideas
*   Submitting feature proposals
*   Asking questions
*   Reporting bugs and malfunction
*   Obtaining support
*   Elaborating new code implementations

Each project hosted by GitLab has an issue tracker. To create a new issue, navigate to your project's **Issues** > **New issue**, give it a title that summarizes the subject to be treated, and describe it using [Markdown][94]. Check the [pro tips][93] below to enhance your issue description.

The GitLab Issue Tracker presents extra functionalities to make it easier to organize and prioritize your actions, described in the following sections.

![new issue - additional settings](https://about.gitlab.com/images/blogimages/gitlab-workflow-an-overview/issue-features-view.png)

### Confidential Issues

Whenever you want to keep the discussion presented in a issue within your team only, you can make that [issue confidential][92]. Even if your project is public, that issue will be preserved. The browser will respond with a 404 error whenever someone who is not a project member with at least [Reporter level][91] tries to access that issue's URL.

### Due dates

Every issue enables you to attribute a [due date][90] to it. Some teams work on tight schedules, and it's important to have a way to setup a deadline for implementations and for solving problems. This can be facilitated by the due dates.

When you have due dates for multi-task projects—for example, a new release, product launch, or for tracking tasks by quarter—you can use [milestones][89].

### Assignee

Whenever someone starts to work on an issue, it can be assigned to that person. You can change the assignee as much as you need. The idea is that the assignee is responsible for that issue until he/she reassigns it to someone else to take it from there.

It also helps with filtering issues per assignee.

### Labels

GitLab labels are also an important part of the GitLab flow. You can use them to categorize your issues, to localize them in your workflow, and to organize them by priority with [Priority Labels][88].

Labels will enable you to work with the [GitLab Issue Board][87], facilitating your plan stage and organizing your workflow.

**New!** You can also create [Group Labels][86], which give you the ability to use the same labels per group of projects.

### Issue Weight

You can attribute an [Issue Weight][85] to make it clear how difficult the implementation of that idea is. Less difficult would receive weights of 01-03, more difficult, 07-09, and the ones in the middle, 04-06\. Still, you can get to an agreement with your team to standardize the weights according to your needs.

### GitLab Issue Board

The [GitLab Issue Board][84] is a tool ideal for planning and organizing your issues according to your project's workflow.

It consists of a board with lists corresponding to its respective labels. Each list contains their corresponding labeled issues, displayed as cards.

The cards can be moved between lists, which will cause the label to be updated according to the list you moved the card into.

![GitLab Issue Board](https://about.gitlab.com/images/blogimages/designing-issue-boards/issue-board.gif)

**New!** You can also create issues right from the Board, by clicking the  button on the top of a list. When you do so, that issue will be automatically created with the label corresponding to that list.

**New!** We've [recently introduced][83] **Multiple Issue Boards** per project ([GitLab Enterprise Edition][82] only); it is the best way to organize your issues for different workflows.

![Multiple Issue Boards](https://about.gitlab.com/images/8_13/m_ib.gif)

### Code Review with GitLab

After discussing a new proposal or implementation in the issue tracker, it's time to work on the code. You write your code locally and, once you're done with your first iteration, you commit your code and push to your GitLab repository. Your Git-based management strategy can be improved with the [GitLab Flow][81].

### First Commit

In your first commit message, you can add the number of the issue related to that commit message. By doing so, you create a link between the two stages of the development workflow: the issue itself and the first commit related to that issue.

To do so, if the issue and the code you're committing are both in the same project, you simply add `#xxx` to the commit message, where `xxx` is the issue number. If they are not in the same project, you can add the full URL to the issue (`https://gitlab.com/<username>/<projectname>/issues/<xxx>`).

```
`git commit -m "this is my commit message. Ref #xxx"` 
```

or

```
`git commit -m "this is my commit message. Related to https://gitlab.com/<username>/<projectname>/issues/<xxx>"` 
```

Of course, you can replace `gitlab.com` with the URL of your own GitLab instance.

**Note:** Linking your first commit to your issue is going to be relevant for tracking your process far ahead with [GitLab Cycle Analytics][80]. It will measure the time taken for planning the implementation of that issue, which is the time between creating an issue and making the first commit.

### Merge Request

Once you push your changes to a feature-branch, GitLab will identify this change and will prompt you to create a Merge Request (MR).

Every MR will have a title (something that summarizes that implementation) and a description supported by [Markdown][79]. In the description, you can shortly describe what that MR is doing, mention any related issues and MRs (creating a link between them), and you can also add the [issue closing pattern][78], which will close that issue(s) once the MR is **merged**.

For example:

```
`## Add new page

This MR creates a `readme.md` to this project, with an overview of this app.

Closes #xxx and https://gitlab.com/<username>/<projectname>/issues/<xxx>

Preview:

![preview the new page](#image-url)

cc/ @Mary @Jane @John` 
```

When you create an MR with a description like the one above, it will:

*   Close both issues `#xxx` and `https://gitlab.com/<username>/<projectname>/issues/<xxx>` when merged
*   Display an image
*   Notify the users `@Mary`, `@Jane`, and `@John` by e-mail

You can assign the MR to yourself until you finish your work, then assign it to someone else to conduct a review. It can be reassigned as many times as necessary, to cover all the reviews you need.

It can also be labeled and added to a [milestone][77] to facilitate organization and prioritization.

When you add or edit a file and commit to a new branch from the UI instead of from the command line, it's also easy to create a new merge request. Just mark the checkbox "start a new merge request with these changes" and GitLab will automatically create a new MR once you commit your changes.

![commit to a feature branch and add a new MR from the UI](https://about.gitlab.com/images/blogimages/gitlab-workflow-an-overview/start-new-mr-edit-from-ui.png)

**Note:** It's important to add the [issue closing pattern][76] to your MR in order to be able to track the process with [GitLab Cycle Analytics][75]. It will track the "code" stage, which measures the time between pushing a first commit and creating a merge request related to that commit.

**New!** We're currently developing [Review Apps][74], a new feature that gives you the ability to deploy your app to a dynamic environment, from which you can preview the changes based on the branch name, per merge request. See a [working example][73] here.

### WIP MR

A WIP MR, which stands for **Work in Progress Merge Request**, is a technique we use at GitLab to prevent that MR from getting merged before it's ready. Just add `WIP:` to the beginning of the title of an MR, and it will not be merged unless you remove it from there.

When your changes are ready to get merged, remove the `WIP:` pattern either by editing the issue and deleting manually, or use the shortcut available for you just below the MR description.

![WIP MR click to remove WIP from the title](https://about.gitlab.com/images/blogimages/gitlab-workflow-an-overview/gitlab-wip-mr.png)

**New!** The `WIP` pattern can be also [quickly added to the merge request][72] with the [slash command][71] `/wip`. Simply type it and submit the comment or the MR description.

### Review

Once you've created a merge request, it's time to get feedback from your team or collaborators. Using the diffs available on the UI, you can add inline comments, reply to them and resolve them.

You can also grab the link for each line of code by clicking on the line number.

The commit history is available from the UI, from which you can track the changes between the different versions of that file. You can view them inline or side-by-side.

![code review in MRs at GitLab](https://about.gitlab.com/images/blogimages/gitlab-workflow-an-overview/gitlab-code-review.png)

**New!** If you run into merge conflicts, you can quickly [solve them right for the UI][70], or even edit the file to fix them as you need:

![mr conflict resolution](https://about.gitlab.com/images/8_13/inlinemergeconflictresolution.gif)

### Build, Test, and Deploy

[GitLab CI][69] is an powerful built-in tool for [Continuous Integration, Continuos Deployment, and Continuous Delivery][68], which can be used to run scripts as you wish. The possibilities are endless: think of it as if it was your own command line running the jobs for you.

It's all set by an Yaml file called, `.gitlab-ci.yml`, placed at your project's repository. Enjoy the CI templates by simply adding a new file through the web interface, and type the file name as `.gitlab-ci.yml` to trigger a dropdown menu with dozens of possible templates for different applications.

![GitLab CI templates - dropdown menu](https://about.gitlab.com/images/blogimages/gitlab-workflow-an-overview/gitlab-ci-template.png)

### Koding

Use GitLab's [Koding integration][67] to run your entire development environment in the cloud. This means that you can check out a project or just a merge request in a full-fledged IDE with the press of a button.

### Use-Cases

Examples of GitLab CI use-cases:

*   Use it to [build][36] any [Static Site Generator][35], and deploy your website with [GitLab Pages][34]
*   Use it to [deploy your website][33] to `staging` and `production` [environments][32]
*   Use it to [build an iOS application][31]
*   Use it to [build and deploy your Docker Image][30] with [GitLab Container Registry][29]

We have prepared a dozen of [GitLab CI Example Projects][66] to offer you guidance. Check them out!

### Feedback: Cycle Analytics

When you follow the GitLab Workflow, you'll be able to gather feedback with [GitLab Cycle Analytics][65] on the time your team took to go from idea to production, for [each key stage of the process][64]:

*   **Issue:** the time from creating an issue to assigning the issue to a milestone or adding the issue to a list on your Issue Board
*   **Plan:** the time from giving an issue a milestone or adding it to an Issue Board list, to pushing the first commit
*   **Code:** the time from the first commit to creating the merge request
*   **Test:** the time CI takes to run the entire pipeline for the related merge request
*   **Review:** the time from creating the merge request to merging it
*   **Staging:** the time from merging until deploy to production
*   **Production** (Total): The time it takes between creating an issue and deploying the code to [production][28]

### Enhance

### Issue and MR Templates

[Issue and MR templates][63] allow you to define context-specific templates for issue and merge request description fields for your project.

You write them in [Markdown][62] and add them to the default branch of your repository. They can be accessed by the dropdown menu whenever an issue or MR is created.

They save time when describing issues and MRs and standardize the information necessary to follow along. It makes sure everything you need to proceed is there.

As you can create multiple templates, they serve for different purposes. For example, you can have one for feature proposals, and a different one for bug reports. Check the ones in [GitLab CE project][61] for real examples.

![issues and MR templates - dropdown menu screenshot](https://about.gitlab.com/images/blogimages/gitlab-workflow-an-overview/issues-choose-template.png)

### Milestones

[Milestones][60] are the best tool you have at GitLab to track the work of your team based on a common target, in a specific date.

The goal can be different for each situation, but the panorama is the same: you have a collection of issues and merge requests being worked on to achieve that particular objective.

This goal can be basically anything that groups the team work and effort to do something by a deadline. For example, publish a new release, launch a new product, get things done by that date, or assemble projects to get done by year quarters.

For instance, you can create a milestone for Q1 2017 and assign every issue and MR that should be finished by the end of March, 2017\. You can also create a milestone for an event that your company is organizing. Then you access that milestone and view an entire panorama on the progress of your team to get things done.

![milestone dashboard](https://about.gitlab.com/images/blogimages/gitlab-workflow-an-overview/gitlab-milestone.png)

### Pro Tips

### For both Issues and MRs

*   In issues and MRs descriptions:
    *   Type `#` to trigger a dropdown list of existing issues
    *   Type `!` to trigger a dropdown list of existing MRs
    *   Type `/` to trigger [slash commands][4]
    *   Type `:` to trigger emojis (also supported for inline comments)
*   Add images (jpg, png, gif) and videos to inline comments with the button **Attach a file**
*   [Apply labels automatically][27] with [GitLab Webhooks][26]
*   [Fenced blockquote][24]: use the syntax `>>>` to start and finish a blockquote

    ```
    `>>>
    Quoted text

    Another paragraph
    >>>` 
    ```
*   Create [task lists][23]:

    ```
    `- [ ] Task 1
    - [ ] Task 2
    - [ ] Task 3` 
    ```

#### Subscribe

Have you found an issue or an MR that you want to follow up? Expand the navigation on your right and click [Subscribe][59] and you'll be updated whenever a new comment comes up. What if you want to subscribe to multiple issues and MRs at once? Use [bulk subscriptions][58]. 😃

#### Add TO-DO

Besides keeping an eye on an issue or MR, if you want to take a future action on it, or whenever you want it in your GitLab TO-DO list, expand the navigation tab at your right and [click on **Add todo**][57].

#### Search for your Issues and MRs

When you're looking for an issue or MR you opened long ago in a project with dozens, hundreds or even thousands of them, it turns out to be hard to find. Expand the navigation on your left and click on **Issues** or **Merge Requests**, and you'll see the ones assigned to you. From there or from any issue tracker, you can filter issues or MRs by author, assignee, milestone, label and weight, also search for opened, merged, closed, and all of them (both merged, closed, and opened).

### Moving Issues

An issue end up in a wrong project? Don't worry. Click on **Edit**, and [move the issue][56] to the correct project.

### Code Snippets

Sometimes do you use exactly the same code snippet or template in different projects or files? Create a code snippet and leave it available for you whenever you want. Expand the navigation on your left and click **[Snippets][25]**. All of your snippets will be there. You can set them to public, internal (only for GitLab logged users), or private.

![Snippets - screenshot](https://about.gitlab.com/images/blogimages/gitlab-workflow-an-overview/gitlab-code-snippet.png)

### GitLab WorkFlow Use-Case Scenario

To wrap-up, let's put everything together. It's easy!

Let's suppose you work at a company focused in software development. You created a new issue for developing a new feature to be implemented in one of your applications.

### Labels Strategy

For this application, you already have created labels for "discussion", "backend", "frontend", "working on", "staging", "ready", "docs", "marketing", and "production." All of them already have their own lists in the Issue Board. Your issue currently have the label "discussion."

After the discussion in the issue tracker came to an agreement, your backend team started to work on that issue, so their lead moved the issue from the list "discussion" to the list "backend." The first developer to start writing the code assigned the issue to himself, and added the label "working on."

### Code & Commit

In his first commit message, he referenced the issue number. After some work, he pushed his commits to a feature-branch and created a new merge request, including the issue closing pattern in the MR description. His team reviewed his code and made sure all the tests and builds were passing.

### Using the Issue Board

Once the backend team finished their work, they removed the label "working on" and moved the issue from the list "backend" to "frontend" in the Issue Board. So, the frontend team knew that issue was ready for them.

### Deploying to Staging

When a frontend developer started working on that issue, he or she added back the label "working on" and reassigned the issue to him/herself. When ready, the implementation was deployed to a **staging** environment. The label "working on" was removed and the issue card was moved to the "staging" list in the Issue Board.

### Teamwork

Finally, when the implementation succeeded, your team moved it to the list "ready."

Then, the time came for your technical writing team to create the documentation for the new feature, and once someone got started, he/she added the label "docs." At the same time, your marketing team started to work on the campaign to launch and promote that feature, so someone added the label "marketing." When the tech writer finished the documentation, he/she removed the label "docs." Once the marketing team finished their work, they moved the issue from the list "marketing" to "production."

### Deploying to Production

At last, you, being the person responsible for new releases, merged the MR and deployed the new feature into the **production**environment and the issue was **closed**.

### Feedback

With [Cycle Analytics][55], you studied the time taken to go from idea to production with your team, and opened another issue to discuss the improvement of the process.

### Conclusions

GitLab Workflow helps your team to get faster from idea to production using a single platform:

*   It's **effective**, because you get your desired results.
*   It's **efficient**, because you achieve maximum productivity with minimum effort and expense.
*   It's **productive**, because you are able to plan effectively and act efficiently.
*   It's **easy**, because you don't need to setup different tools to accomplish what you need with just one, GitLab.
*   It's **fast**, because you don't need to jump across multiple platforms to get your job done.

A new GitLab version is released every single month (on the 22nd), for making it a better integrated solution for software development, and for bringing teams to work together in one single and unique interface.

At GitLab, everyone can contribute! Thanks to our amazing community we've got where we are. And thanks to them, we keep moving forward to provide you with a better product.

Questions? Feedback? Please leave a comment or tweet at us [@GitLab][54]! 🙌

--------------------------------------------------------------------------------

via: https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/

作者：[Marcia Ramos][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twitter.com/XMDRamos
[1]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#search-for-your-issues-and-mrs
[2]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#add-to-do
[3]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#subscribe
[4]:https://docs.gitlab.com/ce/user/project/slash_commands.html
[5]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#code-snippets
[6]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#moving-issues
[7]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#for-both-issues-and-mrs
[8]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#milestones
[9]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#issue-and-mr-templates
[10]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#use-cases
[11]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#koding
[12]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#review
[13]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#wip-mr
[14]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#merge-request
[15]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#first-commit
[16]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#gitlab-issue-board
[17]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#issue-weight
[18]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#labels
[19]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#assignee
[20]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#due-dates
[21]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#confidential-issues
[22]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#stages-of-software-development
[23]:https://docs.gitlab.com/ee/user/markdown.html#task-lists
[24]:https://about.gitlab.com/2016/07/22/gitlab-8-10-released/#blockquote-fence-syntax
[25]:https://gitlab.com/dashboard/snippets
[26]:https://docs.gitlab.com/ce/web_hooks/web_hooks.html
[27]:https://about.gitlab.com/2016/08/19/applying-gitlab-labels-automatically/
[28]:https://docs.gitlab.com/ce/ci/yaml/README.html#environment
[29]:https://about.gitlab.com/2016/05/23/gitlab-container-registry/
[30]:https://about.gitlab.com/2016/08/11/building-an-elixir-release-into-docker-image-using-gitlab-ci-part-1/
[31]:https://about.gitlab.com/2016/03/10/setting-up-gitlab-ci-for-ios-projects/
[32]:https://docs.gitlab.com/ce/ci/yaml/README.html#environment
[33]:https://about.gitlab.com/2016/08/26/ci-deployment-and-environments/
[34]:https://pages.gitlab.io/
[35]:https://about.gitlab.com/2016/06/17/ssg-overview-gitlab-pages-part-3-examples-ci/
[36]:https://about.gitlab.com/2016/04/07/gitlab-pages-setup/
[37]:https://about.gitlab.com/solutions/cycle-analytics/
[38]:https://about.gitlab.com/2016/08/05/continuous-integration-delivery-and-deployment-with-gitlab/
[39]:https://about.gitlab.com/2016/08/05/continuous-integration-delivery-and-deployment-with-gitlab/
[40]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#gitlab-code-review
[41]:https://about.gitlab.com/gitlab-ci/
[42]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#gitlab-issue-board
[43]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#gitlab-issue-tracker
[44]:https://about.gitlab.com/2015/08/18/gitlab-loves-mattermost/
[45]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#conclusions
[46]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#gitlab-workflow-use-case-scenario
[47]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#pro-tips
[48]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#enhance
[49]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#feedback
[50]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#build-test-and-deploy
[51]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#code-review-with-gitlab
[52]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#gitlab-issue-tracker
[53]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#gitlab-workflow
[54]:https://twitter.com/gitlab
[55]:https://about.gitlab.com/solutions/cycle-analytics/
[56]:https://about.gitlab.com/2016/03/22/gitlab-8-6-released/#move-issues-to-other-projects
[57]:https://about.gitlab.com/2016/06/22/gitlab-8-9-released/#manually-add-todos
[58]:https://about.gitlab.com/2016/07/22/gitlab-8-10-released/#bulk-subscribe-to-issues
[59]:https://about.gitlab.com/2016/03/22/gitlab-8-6-released/#subscribe-to-a-label
[60]:https://about.gitlab.com/2016/08/05/feature-highlight-set-dates-for-issues/#milestones
[61]:https://gitlab.com/gitlab-org/gitlab-ce/issues/new
[62]:https://docs.gitlab.com/ee/user/markdown.html
[63]:https://docs.gitlab.com/ce/user/project/description_templates.html
[64]:https://about.gitlab.com/2016/09/21/cycle-analytics-feature-highlight/
[65]:https://about.gitlab.com/solutions/cycle-analytics/
[66]:https://docs.gitlab.com/ee/ci/examples/README.html
[67]:https://about.gitlab.com/2016/08/22/gitlab-8-11-released/#koding-integration
[68]:https://about.gitlab.com/2016/08/05/continuous-integration-delivery-and-deployment-with-gitlab/
[69]:https://about.gitlab.com/gitlab-ci/
[70]:https://about.gitlab.com/2016/08/22/gitlab-8-11-released/#merge-conflict-resolution
[71]:https://docs.gitlab.com/ce/user/project/slash_commands.html
[72]:https://about.gitlab.com/2016/10/22/gitlab-8-13-released/#wip-slash-command
[73]:https://gitlab.com/gitlab-examples/review-apps-nginx/
[74]:https://about.gitlab.com/2016/10/22/gitlab-8-13-released/#ability-to-stop-review-apps
[75]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#feedback
[76]:https://docs.gitlab.com/ce/administration/issue_closing_pattern.html
[77]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#milestones
[78]:https://docs.gitlab.com/ce/administration/issue_closing_pattern.html
[79]:https://docs.gitlab.com/ee/user/markdown.html
[80]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#feedback
[81]:https://about.gitlab.com/2014/09/29/gitlab-flow/
[82]:https://about.gitlab.com/free-trial/
[83]:https://about.gitlab.com/2016/10/22/gitlab-8-13-released/#multiple-issue-boards-ee
[84]:https://about.gitlab.com/solutions/issueboard
[85]:https://docs.gitlab.com/ee/workflow/issue_weight.html
[86]:https://about.gitlab.com/2016/10/22/gitlab-8-13-released/#group-labels
[87]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#gitlab-issue-board
[88]:https://docs.gitlab.com/ee/user/project/labels.html#prioritize-labels
[89]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#milestones
[90]:https://about.gitlab.com/2016/08/05/feature-highlight-set-dates-for-issues/#due-dates-for-issues
[91]:https://docs.gitlab.com/ce/user/permissions.html
[92]:https://about.gitlab.com/2016/03/31/feature-highlihght-confidential-issues/
[93]:https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#pro-tips
[94]:https://docs.gitlab.com/ee/user/markdown.html
[95]:https://about.gitlab.com/2016/03/03/start-with-an-issue/
[96]:https://about.gitlab.com/2016/09/13/gitlab-master-plan/
[97]:https://about.gitlab.com/2014/09/29/gitlab-flow/
