What is CI/CD?
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_progress_cycle_momentum_arrow.png?itok=q-ZFa_Eh)

Continuous integration (CI) and continuous delivery (CD) are extremely common terms used when talking about producing software. But what do they really mean? In this article, I'll explain the meaning and significance behind these and related terms, such as continuous testing and continuous deployment.

### Quick summary

An assembly line in a factory produces consumer goods from raw materials in a fast, automated, reproducible manner. Similarly, a software delivery pipeline produces releases from source code in a fast, automated, and reproducible manner. The overall design for how this is done is called "continuous delivery." The process that kicks off the assembly line is referred to as "continuous integration." The process that ensures quality is called "continuous testing" and the process that makes the end product available to users is called "continuous deployment." And the overall efficiency experts that make everything run smoothly and simply for everyone are known as "DevOps" practitioners.

### What does "continuous" mean?

Continuous is used to describe many different processes that follow the practices I describe here. It doesn't mean "always running." It does mean "always ready to run." In the context of creating software, it also includes several core concepts/best practices. These are:

  * **Frequent releases:** The goal behind continuous practices is to enable delivery of quality software at frequent intervals. Frequency here is variable and can be defined by the team or company. For some products, once a quarter, month, week, or day may be frequent enough. For others, multiple times a day may be desired and doable. Continuous can also take on an  "occasional, as-needed" aspect. The end goal is the same: Deliver software updates of high quality to end users in a repeatable, reliable process. Often this may be done with little to no interaction or even knowledge of the users (think device updates).

  * **Automated processes:** A key part of enabling this frequency is having automated processes to handle nearly all aspects of software production. This includes building, testing, analysis, versioning, and, in some cases, deployment.

  * **Repeatable:** If we are using automated processes that always have the same behavior given the same inputs, then processing should be repeatable. That is, if we go back and enter the same version of code as an input, we should get the same set of deliverables. This also assumes we have the same versions of external dependencies (i.e., other deliverables we don't create that our code uses). Ideally, this also means that the processes in our pipelines can be versioned and re-created (see the DevOps discussion later on).

  * **Fast processing:** "Fast" is a relative term here, but regardless of the frequency of software updates/releases, continuous processes are expected to process changes from source code to deliverables in an efficient manner. Automation takes care of much of this, but automated processes may still be slow. For example, integrated testing across all aspects of a product that takes most of the day may be too slow for product updates that have a new candidate release multiple times per day.




### What is a "continuous delivery pipeline"?

The different tasks and jobs that handle transforming source code into a releasable product are usually strung together into a software "pipeline" where successful completion of one automatic process kicks off the next process in the sequence. Such pipelines go by many different names, such as continuous delivery pipeline, deployment pipeline, and software development pipeline. An overall supervisor application manages the definition, running, monitoring, and reporting around the different pieces of the pipeline as they are executed.

### How does a continuous delivery pipeline work?

The actual implementation of a software delivery pipeline can vary widely. There are a large number and variety of applications that may be used in a pipeline for the various aspects of source tracking, building, testing, gathering metrics, managing versions, etc. But the overall workflow is generally the same. A single orchestration/workflow application manages the overall pipeline, and each of the processes runs as a separate job or is stage-managed by that application. Typically, the individual "jobs" are defined in a syntax and structure that the orchestration application understands and can manage as a workflow.

Jobs are created to do one or more functions (building, testing, deploying, etc.). Each job may use a different technology or multiple technologies. The key is that the jobs are automated, efficient, and repeatable. If a job is successful, the workflow manager application triggers the next job in the pipeline. If a job fails, the workflow manager alerts developers, testers, and others so they can correct the problem as quickly as possible. Because of the automation, errors can be found much more quickly than by running a set of manual processes. This quick identification of errors is called "fail fast" and can be just as valuable in getting to the pipeline's endpoint.

### What is meant by "fail fast"?

One of a pipeline's jobs is to quickly process changes. Another is to monitor the different tasks/jobs that create the release. Since code that doesn't compile or fails a test can hold up the pipeline, it's important for the users to be notified quickly of such situations. Fail fast refers to the idea that the pipeline processing finds problems as soon as possible and quickly notifies users so the problems can be corrected and code resubmitted for another run through the pipeline. Often, the pipeline process can look at the history to determine who made that change and notify the person and their team.

### Do all parts of a continuous delivery pipeline have to be automated?

Nearly all parts of the pipeline should be automated. For some parts, it may make sense to have a spot for human intervention/interaction. An example might be for user-acceptance testing (having end users try out the software and make sure it does what they want/expect). Another case might be deployment to production environments where groups want to have more human control. And, of course, human intervention is required if the code isn't correct and breaks.

With that background on the meaning of continuous, let's look at the different types of continuous processing and what each means in the context of a software pipeline.

### What is continuous integration?

Continuous integration (CI) is the process of automatically detecting, pulling, building, and (in most cases) doing unit testing as source code is changed for a product. CI is the activity that starts the pipeline (although certain pre-validations—often called "pre-flight checks"—are sometimes incorporated ahead of CI).

The goal of CI is to quickly make sure a new change from a developer is "good" and suitable for further use in the code base.

### How does continuous integration work?

The basic idea is having an automated process "watching" one or more source code repositories for changes. When a change is pushed to the repositories, the watching process detects the change, pulls down a copy, builds it, and runs any associated unit tests.

### How does continuous integration detect changes?

These days, the watching process is usually an application like [Jenkins][1] that also orchestrates all (or most) of the processes running in the pipeline and monitors for changes as one of its functions. The watching application can monitor for changes in several different ways. These include:

  * **Polling:** The monitoring program repeatedly asks the source management system,  "Do you have anything new in the repositories I'm interested in?" When the source management system has new changes, the monitoring program "wakes up" and does its work to pull the new code and build/test it.

  * **Periodic:** The monitoring program is configured to periodically kick off a build regardless of whether there are changes or not. Ideally, if there are no changes, then nothing new is built, so this doesn't add much additional cost.

  * **Push:** This is the inverse of the monitoring application checking with the source management system. In this case, the source management system is configured to  "push out" a notification to the monitoring application when a change is committed into a repository. Most commonly, this can be done in the form of a "webhook"—a program that is "hooked" to run when new code is pushed and sends a notification over the internet to the monitoring program. For this to work, the monitoring program must have an open port that can receive the webhook information over the internet.




### What are "pre-checks" (aka pre-flight checks)?

Additional validations may be done before code is introduced into the source repository and triggers continuous integration. These follow best practices such as test builds and code reviews. They are usually built into the development process before the code is introduced in the pipeline. But some pipelines may also include them as part of their monitored processes or workflows.

As an example, a tool called [Gerrit][2] allows for formal code reviews, validations, and test builds after a developer has pushed code but before it is allowed into the ([Git][3] remote) repository. Gerrit sits between the developer's workspace and the Git remote repository. It "catches" pushes from the developer and can do pass/fail validations to ensure they pass before being allowed to make it into the repository. This can include detecting the proposed change and kicking off a test build (a form of CI). It also allows for groups to do formal code reviews at that point. In this way, there is an extra measure of confidence that the change will not break anything when it is merged into the codebase.

### What are "unit tests"?

Unit tests (also known as "commit tests") are small, focused tests written by developers to ensure new code works in isolation. "In isolation" here means not depending on or making calls to other code that isn't directly accessible nor depending on external data sources or other modules. If such a dependency is required for the code to run, those resources can be represented by mocks. Mocks refer to using a code stub that looks like the resource and can return values but doesn't implement any functionality.

In most organizations, developers are responsible for creating unit tests to prove their code works. In fact, one model (known as test-driven development [TDD]) requires unit tests to be designed first as a basis for clearly identifying what the code should do. Because such code changes can be fast and numerous, they must also be fast to execute.

As they relate to the continuous integration workflow, a developer creates or updates the source in their local working environment and uses the unit tests to ensure the newly developed function or method works. Typically, these tests take the form of asserting that a given set of inputs to a function or method produces a given set of outputs. They generally test to ensure that error conditions are properly flagged and handled. Various unit-testing frameworks, such as [JUnit][4] for Java development, are available to assist.

### What is continuous testing?

Continuous testing refers to the practice of running automated tests of broadening scope as code goes through the CD pipeline. Unit testing is typically integrated with the build processes as part of the CI stage and focused on testing code in isolation from other code interacting with it.

Beyond that, there are various forms of testing that can/should occur. These can include:

  * **Integration testing** validates that groups of components and services all work together.

  * **Functional testing** validates the result of executing functions in the product are as expected.

  * **Acceptance testing** measures some characteristic of the system against acceptable criteria. Examples include performance, scalability, stress, and capacity.




All of these may not be present in the automated pipeline, and the lines between some of the different types can be blurred. But the goal of continuous testing in a delivery pipeline is always the same: to prove by successive levels of testing that the code is of a quality that it can be used in the release that's in progress. Building on the continuous principle of being fast, a secondary goal is to find problems quickly and alert the development team. This is usually referred to as fail fast.

### Besides testing, what other kinds of validations can be done against code in the pipeline?

In addition to the pass/fail aspects of tests, applications exist that can also tell us the number of source code lines that are exercised (covered) by our test cases. This is an example of a metric that can be computed across the source code. This metric is called code-coverage and can be measured by tools (such as [JaCoCo][5] for Java source).

Many other types of metrics exist, such as counting lines of code, measuring complexity, and comparing coding structures against known patterns. Tools such as [SonarQube][6] can examine source code and compute these metrics. Beyond that, users can set thresholds for what kind of ranges they are willing to accept as "passing" for these metrics. Then, processing in the pipeline can be set to check the computed values against the thresholds, and if the values aren't in the acceptable range, processing can be stopped. Applications such as SonarQube are highly configurable and can be tuned to check only for the things that a team is interested in.

### What is continuous delivery?

Continuous delivery (CD) generally refers to the overall chain of processes (pipeline) that automatically gets source code changes and runs them through build, test, packaging, and related operations to produce a deployable release, largely without any human intervention.

The goals of CD in producing software releases are automation, efficiency, reliability, reproducibility, and verification of quality (through continuous testing).

CD incorporates CI (automatically detecting source code changes, executing build processes for the changes, and running unit tests to validate), continuous testing (running various kinds of tests on the code to gain successive levels of confidence in the quality of the code), and (optionally) continuous deployment (making releases from the pipeline automatically available to users).

### How are multiple versions identified/tracked in pipelines?

Versioning is a key concept in working with CD and pipelines. Continuous implies the ability to frequently integrate new code and make updated releases available. But that doesn't imply that everyone always wants the "latest and greatest." This may be especially true for internal teams that want to develop or test against a known, stable release. So, it is important that the pipeline versions objects that it creates and can easily store and access those versioned objects.

The objects created in the pipeline processing from the source code can generally be called artifacts. Artifacts should have versions applied to them when they are built. The recommended strategy for assigning version numbers to artifacts is called semantic versioning. (This also applies to versions of dependent artifacts that are brought in from external sources.)

Semantic version numbers have three parts: major, minor, and patch. (For example, 1.4.3 reflects major version 1, minor version 4, and patch version 3.) The idea is that a change in one of these parts represents a level of update in the artifact. The major version is incremented only for incompatible API changes. The minor version is incremented when functionality is added in a backward-compatible manner. And the patch version is incremented when backward-compatible bug fixes are made. These are recommended guidelines, but teams are free to vary from this approach, as long as they do so in a consistent and well-understood manner across the organization. For example, a number that increases each time a build is done for a release may be put in the patch field.

### How are artifacts "promoted"?

Teams can assign a promotion "level" to artifacts to indicate suitability for testing, production, etc. There are various approaches. Applications such as Jenkins or [Artifactory][7] can be enabled to do promotion. Or a simple scheme can be to add a label to the end of the version string. For example, -snapshot can indicate the latest version (snapshot) of the code was used to build the artifact. Various promotion strategies or tools can be used to "promote" the artifact to other levels such as -milestone or -production as an indication of the artifact's stability and readiness for release.

### How are multiple versions of artifacts stored and accessed?

Versioned artifacts built from source can be stored via applications that manage "artifact repositories." Artifact repositories are like source management for built artifacts. The application (such as Artifactory or [Nexus][8]) can accept versioned artifacts, store and track them, and provide ways for them to be retrieved.

Pipeline users can specify the versions they want to use and have the pipeline pull in those versions.

### What is continuous deployment?

Continuous deployment (CD) refers to the idea of being able to automatically take a release of code that has come out of the CD pipeline and make it available for end users. Depending on the way the code is "installed" by users, that may mean automatically deploying something in a cloud, making an update available (such as for an app on a phone), updating a website, or simply updating the list of available releases.

An important point here is that just because continuous deployment can be done doesn't mean that every set of deliverables coming out of a pipeline is always deployed. It does mean that, via the pipeline, every set of deliverables is proven to be "deployable." This is accomplished in large part by the successive levels of continuous testing (see the section on Continuous Testing in this article).

Whether or not a release from a pipeline run is deployed may be gated by human decisions and various methods employed to "try out" a release before fully deploying it.

### What are some ways to test out deployments before fully deploying to all users?

Since having to rollback/undo a deployment to all users can be a costly situation (both technically and in the users' perception), numerous techniques have been developed to allow "trying out" deployments of new functionality and easily "undoing" them if issues are found. These include:

#### Blue/green testing/deployments

In this approach to deploying software, two identical hosting environments are maintained — a _blue_ one and a _green_ one. (The colors are not significant and only serves as identifers.) At any given point, one of these is the _production_ deployment and the other is the _candidate_ deployment.

In front of these instances is a router or other system that serves as the customer “gateway” to the product or application. By pointing the router to the desired blue or green instance, customer traffic can be directed to the desired deployment. In this way, swapping out which deployment instance is pointed to (blue or green) is quick, easy, and transparent to the user.

When a new release is ready for testing, it can be deployed to the non-production environment. After it’s been tested and approved, the router can be changed to point the incoming production traffic to it (so it becomes the new production site). Now the hosting environment that was production is available for the next candidate.

Likewise, if a problem is found with the latest deployment and the previous production instance is still deployed in the other environment, a simple change can point the customer traffic back to the previous production instance — effectively taking the instance with the problem “offline” and rolling back to the previous version. The new deployment with the problem can then be fixed in the other area.

#### Canary testing/deployment

In some cases, swapping out the entire deployment via a blue/green environment may not be workable or desired. Another approach is known as _canary_ testing/deployment. In this model, a portion of customer traffic is rerouted to new pieces of the product. For example, a new version of a search service in a product may be deployed alongside the current production version of the service. Then, 10% of search queries may be routed to the new version to test it out in a production environment.

If the new service handles the limited traffic with no problems, then more traffic may be routed to it over time. If no problems arise, then over time, the amount of traffic routed to the new service can be increased until 100% of the traffic is going to it. This effectively “retires” the previous version of the service and puts the new version into effect for all customers.

#### Feature toggles

For new functionality that may need to be easily backed out (in case a problem is found), developers can add a feature toggle. This is a software if-then switch in the code that only activates the code if a data value is set. This data value can be a globally accessible place that the deployed application checks to see whether it should execute the new code. If the data value is set, it executes the code; if not, it doesn't.

This gives developers a remote "kill switch" to turn off the new functionality if a problem is found after deployment to production.

#### Dark launch

In this practice, code is incrementally tested/deployed into production, but changes are not made visible to users (thus the "dark" name). For example, in the production release, some portion of web queries might be redirected to a service that queries a new data source. This information can be collected by development for analysis—without exposing any information about the interface, transaction, or results back to users.

The idea here is to get real information on how a candidate change would perform under a production load without impacting users or changing their experience. Over time, more load can be redirected until either a problem is found or the new functionality is deemed ready for all to use. Feature flags can be used actually to handle the mechanics of dark launches.

### What is DevOps?

[DevOps][9] is a set of ideas and recommended practices around how to make it easier for development and operational teams to work together on developing and releasing software. Historically, development teams created products but did not install/deploy them in a regular, repeatable way, as customers would do. That set of install/deploy tasks (as well as other support tasks) were left to the operations teams to sort out late in the cycle. This often resulted in a lot of confusion and problems, since the operations team was brought into the loop late in the cycle and had to make what they were given work in a short timeframe. As well, development teams were often left in a bad position—because they had not sufficiently tested the product's install/deploy functionality, they could be surprised by problems that emerged during that process.

This often led to a serious disconnect and lack of cooperation between development and operations teams. The DevOps ideals advocate ways of doing things that involve both development and operations staff from the start of the cycle through the end, such as CD.

### How does CD intersect with DevOps?

The CD pipeline is an implementation of several DevOps ideals. The later stages of a product, such as packaging and deployment, can always be done on each run of the pipeline rather than waiting for a specific point in the product development cycle. As well, both development and operations staff can clearly see when things work and when they don't, from development to deployment. For a cycle of a CD pipeline to be successful, it must pass through not only the processes associated with development but also the ones associated with operations.

Carried to the next level, DevOps suggests that even the infrastructure that implements the pipeline be treated like code. That is, it should be automatically provisioned, trackable, easy to change, and spawn a new run of the pipeline if it changes. This can be done by implementing the pipeline as code.

### What is "pipeline-as-code"?

Pipeline-as-code is a general term for creating pipeline jobs/tasks via programming code, just as developers work with source code for products. The goal is to have the pipeline implementation expressed as code so it can be stored with the code, reviewed, tracked over time, and easily spun up again if there is a problem and the pipeline must be stopped. Several tools allow this, including [Jenkins 2][1].

### How does DevOps impact infrastructure for producing software?

Traditionally, individual hardware systems used in pipelines were configured with software (operating systems, applications, development tools, etc.) one at a time. At the extreme, each system was a custom, hand-crafted setup. This meant that when a system had problems or needed to be updated, that was frequently a custom task as well. This kind of approach goes against the fundamental CD ideal of having an easily reproducible and trackable environment.

Over the years, applications have been developed to standardize provisioning (installing and configuring) systems. As well, virtual machines were developed as programs that emulate computers running on top of other computers. These VMs require a supervisory program to run them on the underlying host system. And they require their own operating system copy to run.

Next came containers. Containers, while similar in concept to VMs, work differently. Instead of requiring a separate program and a copy of an OS to run, they simply use some existing OS constructs to carve out isolated space in the operating system. Thus, they behave similarly to a VM to provide the isolation but don't require the overhead.

Because VMs and containers are created from stored definitions, they can be destroyed and re-created easily with no impact to the host systems where they are running. This allows a re-creatable system to run pipelines on. Also, for containers, we can track changes to the definition file they are built from—just as we would for source code.

Thus, if we run into a problem in a VM or container, it may be easier and quicker to just destroy and re-create it instead of trying to debug and make a fix to the existing one.

This also implies that any change to the code for the pipeline can trigger a new run of the pipeline (via CI) just as a change to code would. This is one of the core ideals of DevOps regarding infrastructure.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/what-cicd

作者：[Brent Laster][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bclaster
[1]:https://jenkins.io
[2]:https://www.gerritcodereview.com
[3]:https://opensource.com/resources/what-is-git
[4]:https://junit.org/junit5/
[5]:https://www.eclemma.org/jacoco/
[6]:https://www.sonarqube.org/
[7]:https://jfrog.com/artifactory/
[8]:https://www.sonatype.com/nexus-repository-sonatype
[9]:https://opensource.com/resources/devops
