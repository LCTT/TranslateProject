[#]: subject: "My top 5 tips for setting up Terraform"
[#]: via: "https://opensource.com/article/21/8/terraform-tips"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "cool-summer-021"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

My top 5 tips for setting up Terraform
======
These are the lessons I've learned after five years with Terraform.
![Puzzle pieces coming together to form a computer screen][1]

Working with Terraform for over five years has taught me some key lessons. Five practices have been critical to having a logical and usable Terraform setup regardless of the size of the team or the nature of the project.

### 1\. Know your target audience.

This one might seem obvious, but I've seen it go wrong several times. When organizing Terraform code, either standardizing the directory structure or defining naming conventions, it's vital to consider the intended audience. Will your team be using these Terraform scripts and modules? Are you handing the work over to another team? Will new people be joining your team sooner or later? Are you working on this project solo? Will you be using this setup in six months or a year, or will it be assigned to someone else?

Questions like these affect several decisions. Ideally, you should have [Remote State][2] and [State Locking][3] in place regardless of the team size now or in the future. Remote State will ensure your laptop is not the only place your Terraform works, and State Locking will ensure that only one person at a time is changing the infrastructure.

The naming convention should make sense to the eventual owners of the project, not just the team that is writing the code. If the project is for another team, make sure they have a say in the naming convention. If non-technical stakeholders or internal security/GCR teams review the code, make sure they check the naming convention. In addition to resource names, you should leverage resource tags to highlight any data classification/privacy requirements (high, medium, low) for more careful examination by reviewers.

### 2\. Reuse. Reuse. Reuse.

The [Terraform Registry][4] provides a library of ready-to-use modules for the most common use-cases. I've written about the extensive parameterization available in the VPC module and security groups. Simply calling modules with different parameters is enough to handle most, if not all, potential use cases. Reuse these shared modules as much as possible to avoid endless typing, testing, checking, fixing, and refactoring.

I've also found that separating modules and resources based on the frequency of use or change is beneficial. For example, infrastructure scaffolding used only once belongs together, such as setting up the VPC, security groups, routing tables, VPC endpoints, and so on. But things like private hosted zone entries, autoscaling groups, target groups, load balancers, etc., might change with every deployment, so separating these from the one-time scaffolding will make code reviews easier and debugging faster.

### 3\. Be explicit rather than implicit.

There are common patterns to Terraform code that I have seen lead to incorrect assumptions baked into the design. Teams can assume that the Terraform version used to write the code today will never change, or the external modules won't change, or the providers they are using won't change. These lead to invisible issues a few weeks down the road when these external dependencies inevitably get updated.

Ensure you explicitly define versions everywhere possible: In the main Terraform block, in the provider block, in the module block, etc. Defining versions ensures that your dependent libraries stay frozen so that you can explicitly update dependencies when required after thorough discussions, reviews, and testing.

### 4\. Automate everywhere. Your laptop. Your shared VM. Your CI/CD.

Leveraging automation at every stage of the deployment process can avoid future problems before they even arise.

Use [Git pre-commit hooks][5] to run `terraform fmt` and `terraform validate` before you commit your code. Pre-commit hooks ensure that code is, at a bare minimum, adequately formatted and syntactically correct. Check-in this pre-commit file to the repo, and everyone on your team can benefit from the same automation. This small but vital quality control at the first step of the process can achieve substantial time savings as your project progresses.

All modern deployment tools have CI processes. You can use these to run SAST and unit testing tools when pushing your code to origin. I've written on my blog about how [Checkov can test Terraform code for security and compliance and create custom checks][6] for organization-specific conventions. Add these unit testing tools to your CI pipeline to improve code quality and robustness.

### 5\. Have an awesome README.md.

We all like to think that Terraform code is self-documenting. Sure it is, but only if your future team already knows your company's naming conventions and guidelines and secret handshakes and inside jokes and whatever else your repo contains besides valid Terraform code. Getting into the habit of having a good `README.md` can be a huge time saver, and it keeps your team honest by holding them accountable for everything explicitly committed to in the README.

At a minimum, your README should contain the steps to initialize the right Terraform environment on your workstations (Linux, Windows, Mac, and so on), including the Terraform version to install. It should specify the required dependencies (Checkov, TerraGrunt, and others) with versions and any handy Linux aliases your team uses (some people like to define `tff` as a short-hand for `terraform fmt`). Most importantly, the branching and PR review strategy and process, naming conventions, and resource tagging standards should be specified.

The README should pass a simple test: if a new member joins your team tomorrow, is the README enough to teach them what to do and how to do it correctly? If not, you may find yourself hosting never-ending standards and process meetings repeatedly for the next few months.

### Wrap up

After many years of working with Terraform, these are my five best bits of wisdom to pass along. Feel free to share your own best practices below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/terraform-tips

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://www.terraform.io/docs/language/state/index.html
[3]: https://www.terraform.io/docs/language/state/locking.html
[4]: https://registry.terraform.io/
[5]: https://opensource.com/life/16/8/how-construct-your-own-git-server-part-6
[6]: https://notes.ayushsharma.in/2021/07/cloud-infrastructure-sast-terraform-checkov
