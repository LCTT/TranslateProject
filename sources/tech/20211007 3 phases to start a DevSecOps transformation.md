[#]: subject: "3 phases to start a DevSecOps transformation"
[#]: via: "https://opensource.com/article/21/10/first-phases-devsecops-transformation"
[#]: author: "Will Kelly https://opensource.com/users/willkelly"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

3 phases to start a DevSecOps transformation
======
Taking the right steps at the right time smooths the path toward full
adoption.
![Green graph of measurements][1]

DevSecOps is another step in the DevOps journey for your organization. Breaking down your transformation into phases facilitates working directly with developers and other team members. A phased approach also allows you to get feedback from those affected by the change and iterate as necessary.

Here are the first three phases of a DevSecOps transformation:

### Phase 1: analysis, education, and training

In phase 1, you do the preliminary work necessary to make DevSecOps the next step in your DevOps journey.

This phase is even more critical for your teams if you're moving from a waterfall software development lifecycle (SDLC) model. Making that leap may require you to put more time and effort into DevOps training to bridge any knowledge gaps between your current processes and DevSecOps.

#### Analyze your development process maturity

Whether DevSecOps is just the next step in your DevSecOps journey or you're making your initial foray into DevSecOps straight from a waterfall SDLC, analyzing the [maturity of your software development process][2] is a critical step. An effective analysis includes:

  * Documenting the current state of any processes
  * Gathering any reporting data about your current development processes
  * Identifying what's working and not working in your development processes by interviewing key developers



#### Define DevSecOps for your organization

DevOps and now DevSecOps can mean many things to people. Software vendor marketing and the open source software (OSS) community each put their spin on the definition of DevSecOps. Spare your teams from any misunderstandings and document your definition of DevSecOps. A clear definition includes:

  * What DevSecOps means to your organization
  * The expected outcomes after moving to DevSecOps
  * The tools and processes your organization is putting into place to ensure employee success



Writing a definition is not merely creating a project charter for your DevOps to DevSecOps transformation; it identifies your true north.

#### Foster a DevSecOps culture

You can't _buy_ DevSecOps. Your managers and key technology team members need to work together to foster DevSecOps cultural philosophies to set a foundation for your DevOps to DevSecOps transformation.

Here are some vital elements of DevSecOps culture that are important to foster during and after your transformation:

##### Continuous feedback

Remote DevSecOps teams have their advantages and disadvantages with continuous feedback. The manager's role is not simply to deliver feedback on the DevSecOps team's performance. Instead, the purpose of feedback is to enable teams to collaborate more effectively. [Open source chat tools][3] provide the instant communication necessary for DevSecOps teams to collaborate in real time.

##### Container-based architectures

DevSecOps sets the stage for moving to container-based architectures that can be another cultural change for DevOps teams. A proper and robust implementation of containers changes developer and operations cultures because it changes how architects design solutions, programmers create code, and operations teams maintain production applications.

##### Team autonomy

DevSecOps is no place for micromanagers at any level of your organization. A standard part of DevSecOps culture is enabling your teams to choose their tools and create processes based on their work. DevSecOps also promotes distributed decision making that supports greater agility and innovation.

##### DevSecOps training

Providing security training to your developers is another step towards making security part of everyone's job. Training could take the form of in-house developer training in casual formats such as lunch-and-learns, or it could include more formal training classes conducted by your organization's training department.

Depending on your security ambitions (and budget), there is always the option to send your DevOps team members to get a DevSecOps vendor certification, such as the DevSecOps Foundation certification from the [DevOps Institute][4] or the Certified DevSecOps Professional (CDP) from [Practical DevSecOps][5].

### Phase 2: integrate security into your DevOps lifecycle

During phase 2 of your DevOps to DevSecOps transformation, you integrate security processes and tools into your DevOps life cycle. If your enterprise is already using DevOps toolchains, this phase integrates security tools into your existing DevOps toolchains. This phase is also the time to perform a security audit on your continuous integration and continuous delivery/deployment (CI/CD) toolchains to ensure security.

Suppose your organization takes the fast track to DevSecOps from a waterfall SDLC or other legacy development process. In that case, security needs to become a requirement of your CI/CD toolchain build.

### Phase 3: introduce automation into your DevOps lifecycle

The automation phase includes analysis, outreach, and experimentation. Applying automation to everyday software development tasks such as quality assurance and security checks isn't an exact science. Expect a push and pull between your executives and development teams. Executives often want to automate as much as possible, even to the extreme. Developers and sysadmins are going to approach automation more cautiously.

Automation is foundational to DevSecOps because it removes the prospect of human error from some everyday build tasks and security checks. If you're building and running cloud workloads, you need automation.

How well the automation tools are implemented determines how effectively you can enforce security practices and facilitate security sign-offs.

Here are some tips for introducing automation into your DevOps toolchain:

  * Dispel the notion in your management and stakeholders that you'll be able to automate every task along with your toolchain. Engage with your stakeholders to learn their automation priorities and take that feedback into an automation strategy for your DevOps teams.
  * Engage with your development teams — not just the team leads and managers — about how automation can help them perform their jobs. Listen to their concerns with empathy and answer their questions with definitive answers.
  * Create an automation roadmap that charts how you'll introduce automation into your toolchains. Start small and expand with automation across your toolchains. Seek a small project such as a patch or a feature update to test your implementation plan.
  * Automate one build, quality assurance, or security check for one of your DevOps teams as a proof-of-concept project. Document your findings from this small project, especially the lessons learned and any other feedback from the DevOps team members working on the project.
  * Communicate the successes, lessons learned, and, yes, even the mistakes made on the pilot project to your stakeholders and internal DevOps community.



You can use your existing DevOps center of excellence or DevSecOps center of excellence as an opportunity to gather input from employees from across your organization about how automation affects their work. Otherwise, look for formal and informal channels in your development and operations organizations to gain the input. For example, informal lunch and learns, group chat channels, or team meetings can be ideal for gathering input depending on your corporate culture.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/first-phases-devsecops-transformation

作者：[Will Kelly][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/willkelly
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_lead-steps-measure.png?itok=DG7rFZPk (Green graph of measurements)
[2]: https://opensource.com/article/21/10/devsecops-maturity-model
[3]: https://opensource.com/article/20/4/open-source-chat
[4]: https://www.devopsinstitute.com/
[5]: http://practical-devsecops.com/
