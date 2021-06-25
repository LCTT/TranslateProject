[#]: subject: (What is a CI/CD pipeline?)
[#]: via: (https://opensource.com/article/21/6/what-cicd-pipeline)
[#]: author: (Will Kelly https://opensource.com/users/willkelly)
[#]: collector: (lujun9972)
[#]: translator: (baddate)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

What is a CI/CD pipeline?
======
How you define a continuous integration/continuous deployment pipeline
depends on your organization's requirements.
![Plumbing tubes in many directions][1]

A continuous integration/continuous deployment (CI/CD) pipeline is an anchor for every DevOps initiative. The CI/CD pipeline breaks down traditional silos and enables development and operations teams to collaborate throughout the entire software development lifecycle.

Better yet, moving to DevOps and a CI/CD pipeline can help your organization [deliver software][2] more securely at a higher velocity.

### Breaking down the CI/CD pipeline

There are many definitions of CI/CD pipelines out there, so I always advise organizations to define their own version of a CI/CD pipeline and other DevOps concepts rather than using someone else's. Open source CI/CD tools give you the freedom and options to construct a CI/CD pipeline that meets your organization's requirements.

The stages that form a CI/CD pipeline are distinct subsets of tasks grouped into _pipeline stages_. Typical pipeline stages include:

  * **Build:** Developers compile the application code. 
  * **Test**: The quality assurance (QA) team tests the application code using automated testing tools and strategies. 
  * **Release:** The development team delivers the application code to the code repository.
  * **Deploy**: The DevOps team stages application code to production. 
  * **Security and compliance**: The QA team validates a build based on the project's requirements. This is the stage where organizations deploy container-scanning tools that check the quality of images against Common Vulnerabilities and Exposures (CVEs). 



These are standard stages for a CI/CD pipeline, yet some organizations adapt the CI/CD pipeline model to fit their requirements. For example, an organization building applications for the healthcare market, with its stringent compliance standards, may distribute the test, validation, and compliance gates throughout their toolchain.

Other examples might be an organization that depends on a complex software supply chain with open source software (OSS). Commercial components may institute a gate where development team members generate a [software bill of materials][3] (SBOM) for OSS packages or the outside commercial software vendor must deliver an SBOM as part of their contract deliverable.

### Barriers to CI/CD pipelines

Implementing a CI/CD pipeline changes a team's processes and culture. While many developers are receptive to automation of some tasks and testing, people can be a barrier to CI/CD adoption.

Moving from a waterfall process to CI/CD can shake up the fundamental and implied power structure in some organizations. Since a CI/CD pipeline increases software delivery velocity, the "gatekeepers" of your old manual process may feel threatened by this change.

### Integration opportunities

The open source roots of the tools comprising a CI/CD toolchain create opportunities for some exciting integrations as you achieve greater DevOps maturity levels in your culture, processes, and tooling.

Analyst firm Forrester predicted in 2020 that just-in-time learning will join the CI/CD pipeline. It makes sense if you think about it. It makes even more sense in the current era of remote work and even for remote onboarding of new employees. For instance, an organization could integrate a documentation wiki into its pipeline with documentation of internal processes.

A more ambitious organization can integrate a learning management system (LMS) such as [Moodle][4] into its CI/CD pipeline. It could use the LMS to publish short videos about new DevOps toolchain features that developers need to learn as they onboard or when tools are updated across the pipeline.

Some organizations are integrating group chat and other collaboration tools directly into their CI/CD pipelines. The chat platform serves alerts and enables collaboration and communication among teams. Integrating Mattermost, Rocket.Chat, or another [enterprise chat][5] platform into your CI/CD pipeline requires upfront planning and analysis to ensure that pipeline users won't drown in alerts.

Another integration opportunity to explore is building analytics and advanced reporting into your CI/CD pipeline. This helps you harness the data that courses through your pipeline.

### Final thoughts

The CI/CD pipeline is foundational to DevOps. And open source makes it adaptable and flexible to new requirements resulting from operational changes you implement during your DevOps journey.

I hope to see an open source response to the unified DevOps platform trend, in which organizations seek an end-to-end CI/CD solution. The makings of such a solution are out there. After all, GitLab and GitHub trace their platforms back to open source roots.

Lastly, don't forget the education and outreach underlying every successful CI/CD toolchain. Documenting your toolchains and accompanying processes will improve developer onboarding and ongoing DevOps team training.

How do you and your organization define your CI/CD toolchain? Please share your feedback in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/what-cicd-pipeline

作者：[Will Kelly][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/willkelly
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/plumbing_pipes_tutorial_how_behind_scenes.png?itok=F2Z8OJV1 (Plumbing tubes in many directions)
[2]: https://techbeacon.com/devops/5-reasons-why-cicd-vital-your-organizations-value-stream
[3]: https://www.ntia.gov/SBOM
[4]: https://moodle.org/
[5]: https://opensource.com/alternatives/slack
