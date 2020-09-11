[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Keeping an open source project alive when people leave)
[#]: via: (https://opensource.com/article/19/5/code-missing-community-management)
[#]: author: (Rodrigo Duarte Sousa https://opensource.com/users/rodrigods/users/tellesnobrega)

Keeping an open source project alive when people leave
======
How to find out what's done, what's not, and what's missing.
![][1]

Suppose you wake up one day and decide to finally use that recipe video you keep watching all over social media. You get the ingredients, organize the necessary utensils, and start to follow the recipe steps. You cut this, cut that, then start heating the oven at the same time you put butter and onions in a pan. Then, your phone reminds you: you have a dinner appointment with your boss, and you're already late! You turn off everything and leave immediately, stopping the cooking process somewhere near the end.

Some minutes later, your roommate arrives at home ready to have dinner and finds only the _ongoing work_ in the kitchen. They have the following options:

  1. Clean up the mess and start cooking something from scratch.
  2. Order dinner and don’t bother to cook and/or fix the mess you left.
  3. Start cooking “around” the mess you left, which will probably take more time since most of the utensils are dirty and there isn’t much space left in the kitchen.



If you left the printed version of the recipe somewhere, your roommate also has a fourth option. They could finish what you started! The problem is that they have no idea what's missing. It is not like you crossed out each completed step. Their best bet is either to call you or to examine all of your _changes_ to infer what is missing.

In this example, the kitchen is like a software project, the utensils are the code, and the recipe is a new feature being implemented. Leaving something behind is not usually doable in a company's private project since you're accountable for your work and—in a scenario where you need to leave—it's almost certain that there is someone tracking/following the project, so they avoid having a "single point of failure." With open source projects, though, this continuity rarely happens. So how can we in the open source community deal with legacy, unfinished code, or code that is completed but no one dares touch it?

### Knowledge legacy in open source projects

We have always felt that open source is one of the best ways for an inexperienced software engineer to improve her skills. For many, open source projects offer their first hands-on experience with particular tools. [Version control systems][2], [unit][3] and [integration][4] tests, [continuous delivery][5], [code reviews][6], [features planning][7], [bug reporting/fixing][8], and more.

In addition to learning opportunities, we can also view open source projects as a career opportunity—many senior engineers in the community get paid to be there, and you can add your contributions to your resume. That’s pretty cool. There's nothing like learning while improving your resume and getting potential employers' attention so you can pay your rent.

Is this whole situation an infinite loop where everyone wins? The answer is obviously no. This post focuses on one of the main issues that arise in any project: the [bus/truck factor][9]. In the open source context, specifically, when people experience major changes such as a new job or other more personal factors, they tend to leave the community. We will first describe the problems that can arise from people leaving their _recipes_ unfinished by using [OpenStack][10] as an example. Then, we'll try to discuss some ideas to try to mitigate the issues.

### Common problems

In the past few years, we've seen a lot of changes in the [OpenStack][11] community, where some projects lost some portion of their active contributors team. These losses led to incomplete work and even finished modules without clear maintainers. Below are other examples of what happens when people suddenly leave. While this article uses OpenStack terms, such as “specs,” these issues easily apply to software development in general:

  * **Broken documentation:** A new API or setting either wasn't documented, or it was documented but not implemented.
  * **Hard to resolve knowledge deficits:** For example, a new requirement and/or feature requires part of the code to be refactored but no one has the necessary expertise.
  * **Incomplete features:** What are the missing tasks required for each feature? Which tasks were completed?
  * **Debugging drama:** If the person who wrote the code isn't there, meaning that it takes a lot of engineering hours just to decrypt—so to speak—the code path that needs to be fixed.



To illustrate, we will use the [Project Tree Deletion][12] feature. Project Tree Deletion is a tiny feature that one of us proposed more than three years ago and couldn’t complete. Basically, the main goal was to enable an OpenStack user/operator to erase a whole branch of projects without having to manually disable/delete every single of them starting from the leaves. Very straightforward, right? The PTD spec has been merged and has the following _work items_ :

  * Update API spec documentation.
  * Add new rules to the file **policy.json**.
  * Add new endpoints to mirror the new features.
  * Implement the new deletion/disabling behavior for the project’s hierarchy.



What about the sequence of steps (roadmap) to get these work items done? How do we know where to start and when what to tackle next? Are there any logical dependencies between the work items? How do we know where to start, and with what?

Also, how do we know which work has been completed (if any)? One of the things that we do is look in the [blueprint][13] and/or the new [bug tracker][14], for example:

  * Recursive deletion and project disabling: <https://review.openstack.org/148730>(merged)
  * API changes for Reseller: <https://review.openstack.org/153007>(merged)
  * Add parent_id to GET /projects: <https://review.openstack.org/166326>(merged)
  * Manager support for project cascade update: <https://review.openstack.org/243584>(merged)
  * API support for cascade update: <https://review.openstack.org/243585>(abandoned)
  * Manager support for project delete cascade: <https://review.openstack.org/244149>(merged)
  * API support for project cascade delete: <https://review.openstack.org/244248>(abandoned)
  * Add backend support for deleting a projects list: <https://review.openstack.org/245916>(merged)
  * Test list project hierarchy is correct for a large tree: <https://review.openstack.org/277512>(merged)
  * Fix cascade operations documentation: <https://review.openstack.org/274836>(merged)
  * Revert “Fix cascade operations documentation”: <https://review.openstack.org/286716>(merged)
  * Remove the APIs from the doc that aren't supported yet: <https://review.openstack.org/368570>(merged)



Here we can see a lot of merged patches, but also that some were abandoned, and that some include the words Revert and Remove in their titles. Now we have strong evidence that this work is not completed, but at least some work was started to clean it up and avoid exposing something incomplete in the service API. Let’s dig a little bit deeper and look at the [_current_ delete project code][15].

There, we can see an added **cascade** argument (“cascade” resembles deleting related things together, so this argument must be somehow related to the proposed feature), and that it has a special block to treat the cases for the possible values of **cascade** :


```
`def _delete_project(self, project, initiator=None, cascade=False):`[/code] [code]

if cascade:
# Getting reversed project's subtrees list, i.e. from the leaves
# to the root, so we do not break parent_id FK.
subtree_list = self.list_projects_in_subtree(project_id)
subtree_list.reverse()
if not self._check_whole_subtree_is_disabled(
project_id, subtree_list=subtree_list):
raise exception.ForbiddenNotSecurity(
_('Cannot delete project %(project_id)s since its subtree '
'contains enabled projects.')
% {'project_id': project_id})

project_list = subtree_list + [project]
projects_ids = [x['id'] for x in project_list]

ret = self.driver.delete_projects_from_ids(projects_ids)
for prj in project_list:
self._post_delete_cleanup_project(prj['id'], prj, initiator)
else:
ret = self.driver.delete_project(project_id)
self._post_delete_cleanup_project(project_id, project, initiator)
```

What about the callers of this function? Do they use **cascade** at all? If we search for it, we only find occurrences in the backend tests:


```
$ git grep "delete_project" | grep "cascade" | grep -v "def"
keystone/tests/unit/resource/test_backends.py: PROVIDERS.resource_api.delete_project(root_project['id'], cascade=True)
keystone/tests/unit/resource/test_backends.py: PROVIDERS.resource_api.delete_project(p1['id'], cascade=True)
```

We can also confirm this finding by looking at the [delete projects API implementation][16].

So it seems that we have a problem here, something simple that I started was left behind a very long time ago. How could the community or I have prevented this from happening?

From the example above, one of the most apparent problems is the lack of a clear roadmap and list of completed tasks somewhere. To follow the actual implementation status, we had to dig into the blueprint/bug comments and the code.

Based on this issue, we can sketch an idea: for each new feature, we need a roadmap stored somewhere to reflect the implementation status. Once the roadmap is defined within a spec, we can track each step as a [Launchpad][17] entry, for example, and have a better view of the progress status of that spec.

Of course, these steps won’t prevent unfinished projects and they add a little bit of process, but following them can give a better view of what's missing so someone else from the community could finish or even revert what's there.

### That’s not all

What about other aspects of the project besides feature completion? We shouldn’t expect that every person on the core team is an expert in every single project module. This issue highlights another very important aspect of any open source community: mentoring.

New people come to the community all the time and many have an incentive to continuing coming back as we discussed earlier. However, are our current community members willing to mentor them? How many times have you participated as a mentor in a program such as [Outreachy ][18]or [Google Summer of Code][19], or taken time to answer questions in the project’s chat?

We also know that people eventually move on to other open source communities, so we have the chance of not leaving what we learned behind. We can always transmit that knowledge directly to those who are currently interested and actively asking questions, or indirectly, by writing documentation, blog posts, giving talks, and so forth.

In order to have a healthy open source community, knowledge can’t be dominated by few people. We need to make an effort to have as many people capable of moving the project forward as possible. Also, a key aspect of mentoring is not only related to coding, but also to leadership skills. Preparing people to take roles like Project Team Lead, joining the Technical Committee, and so on is crucial if we intend to see the community grow even when we're not around anymore.

Needless to say, mentoring is also an important skill for climbing the engineering ladder in most companies. Consider that another motivation.

### To conclude

Open source should not be treated as only the means to an end. Collaboration is a crucial part of these projects, and alongside mentoring, should always be treated as a first citizen in any open source community. And, of course, we will fix the unfinished spec used as this article's example.

If you are part of an open source community, it is your responsibility to be focusing on sharing your knowledge while you are still around. Chances are that no one is going to tell you to do so, it should be part of the routine of any open source collaborator.

What are other ways of sharing knowledge? What are your thoughts and ideas about the issue?

_This original article was posted on[rodrigods][20]._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/code-missing-community-management

作者：[Rodrigo Duarte Sousa][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rodrigods/users/tellesnobrega
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BIZ_question_B.png?itok=f88cyt00
[2]: https://en.wikipedia.org/wiki/Version_control
[3]: https://en.wikipedia.org/wiki/Unit_testing
[4]: https://en.wikipedia.org/wiki/Integration_testing
[5]: https://en.wikipedia.org/wiki/Continuous_delivery
[6]: https://en.wikipedia.org/wiki/Code_review
[7]: https://www.agilealliance.org/glossary/sprint-planning/
[8]: https://www.softwaretestinghelp.com/how-to-write-good-bug-report/
[9]: https://en.wikipedia.org/wiki/Bus_factor
[10]: https://www.openstack.org/
[11]: /resources/what-is-openstack
[12]: https://review.opendev.org/#/c/148730/35
[13]: https://blueprints.launchpad.net/keystone/+spec/project-tree-deletion
[14]: https://bugs.launchpad.net/keystone/+bug/1816105
[15]: https://github.com/openstack/keystone/blob/master/keystone/resource/core.py#L475-L519
[16]: https://github.com/openstack/keystone/blob/master/keystone/api/projects.py#L202-L214
[17]: https://launchpad.net
[18]: https://www.outreachy.org/
[19]: https://summerofcode.withgoogle.com/
[20]: https://blog.rodrigods.com/knowledge-legacy-the-issue-of-passing-the-baton/
