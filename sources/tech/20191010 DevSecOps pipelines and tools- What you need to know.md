[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (DevSecOps pipelines and tools: What you need to know)
[#]: via: (https://opensource.com/article/19/10/devsecops-pipeline-and-tools)
[#]: author: (Sagar Nangare https://opensource.com/users/sagarnangare)

DevSecOps pipelines and tools: What you need to know
======
DevSecOps evolves DevOps to ensure security remains an essential part of
the process.
![An intersection of pipes.][1]

DevOps is well-understood in the IT world by now, but it's not flawless. Imagine you have implemented all of the DevOps engineering practices in modern application delivery for a project. You've reached the end of the development pipeline—but a penetration testing team (internal or external) has detected a security flaw and come up with a report. Now you have to re-initiate all of your processes and ask developers to fix the flaw.

This is not terribly tedious in a DevOps-based software development lifecycle (SDLC) system—but it does consume time and affects the delivery schedule. If security were integrated from the start of the SDLC, you might have tracked down the glitch and eliminated it on the go. But pushing security to the end of the development pipeline, as in the above scenario, leads to a longer development lifecycle.

This is the reason for introducing DevSecOps, which consolidates the overall software delivery cycle in an automated way.

In modern DevOps methodologies, where containers are widely used by organizations to host applications, we see greater use of [Kubernetes][2] and [Istio][3]. However, these tools have their own vulnerabilities. For example, the Cloud Native Computing Foundation (CNCF) recently completed a [Kubernetes security audit][4] that identified several issues. All tools used in the DevOps pipeline need to undergo security checks while running in the pipeline, and DevSecOps pushes admins to monitor the tools' repositories for upgrades and patches.

### What Is DevSecOps?

Like DevOps, DevSecOps is a mindset or a culture that developers and IT operations teams follow while developing and deploying software applications. It integrates active and automated security audits and penetration testing into agile application development.

To utilize [DevSecOps][5], you need to:

  * Introduce the concept of security right from the start of the SDLC to minimize vulnerabilities in software code.
  * Ensure everyone (including developers and IT operations teams) shares responsibility for following security practices in their tasks.
  * Integrate security controls, tools, and processes at the start of the DevOps workflow. These will enable automated security checks at each stage of software delivery.



DevOps has always been about including security—as well as quality assurance (QA), database administration, and everyone else—in the dev and release process. However, DevSecOps is an evolution of that process to ensure security is never forgotten as an essential part of the process.

### Understanding the DevSecOps pipeline

There are different stages in a typical DevOps pipeline; a typical SDLC process includes phases like Plan, Code, Build, Test, Release, and Deploy. In DevSecOps, specific security checks are applied in each phase.

  * **Plan:** Execute security analysis and create a test plan to determine scenarios for where, how, and when testing will be done.
  * **Code:** Deploy linting tools and Git controls to secure passwords and API keys.
  * **Build:** While building code for execution, incorporate static application security testing (SAST) tools to track down flaws in code before deploying to production. These tools are specific to programming languages.
  * **Test:** Use dynamic application security testing (DAST) tools to test your application while in runtime. These tools can detect errors associated with user authentication, authorization, SQL injection, and API-related endpoints.
  * **Release:** Just before releasing the application, employ security analysis tools to perform thorough penetration testing and vulnerability scanning.
  * **Deploy:** After completing the above tests in runtime, send a secure build to production for final deployment.



### DevSecOps tools

Tools are available for every phase of the SDLC. Some are commercial products, but most are open source. In my next article, I will talk more about the tools to use in different stages of the pipeline.

DevSecOps will play a more crucial role as we continue to see an increase in the complexity of enterprise security threats built on modern IT infrastructure. However, the DevSecOps pipeline will need to improve over time, rather than simply relying on implementing all security changes simultaneously. This will eliminate the possibility of backtracking or the failure of application delivery.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/devsecops-pipeline-and-tools

作者：[Sagar Nangare][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sagarnangare
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW-Internet_construction_9401467_520x292_0512_dc.png?itok=RPkPPtDe (An intersection of pipes.)
[2]: https://opensource.com/resources/what-is-kubernetes
[3]: https://opensource.com/article/18/9/what-istio
[4]: https://www.cncf.io/blog/2019/08/06/open-sourcing-the-kubernetes-security-audit/
[5]: https://resources.whitesourcesoftware.com/blog-whitesource/devsecops
