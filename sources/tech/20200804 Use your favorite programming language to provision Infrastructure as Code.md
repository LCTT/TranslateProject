[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use your favorite programming language to provision Infrastructure as Code)
[#]: via: (https://opensource.com/article/20/8/infrastructure-as-code-pulumi)
[#]: author: (Lee Briggs https://opensource.com/users/lbriggs)

Use your favorite programming language to provision Infrastructure as Code
======
Provision everything you need to get your infrastructure off the ground
with Node.js or another programming language.
![Puzzle pieces coming together to form a computer screen][1]

As you navigate the world of IT and technology, there are some terms you come across repeatedly. Some of them are hard to quantify and may take on different meanings as time goes on. ["DevOps"][2] is an example of a word that seems (to me) to change depending on the person using it; the original DevOps pioneers might not even recognize what we call DevOps today.

If you're a software developer, "Infrastructure as Code" (IaC) may be one of those terms. IaC is using the same software-development practices you'd use to write user-facing features to declare the infrastructure that applications run on. This often means using tools like [Git][3] or [Mercurial][4] for version control and Puppet, Chef, or Ansible for [configuration management][5]. At the infrastructure-provisioning layer, the most common technology is CloudFormation (for AWS specifically) or [Terraform][6] as an open source alternative for creating hybrid-cloud resources for your applications to run on.

There are great options in the configuration-management space to write IaC as either configuration files or preferred programming languages, but this choice is not well-known in the infrastructure-provisioning space.

[Pulumi][7] offers an option to use standard programming languages to define infrastructure. It supports an array of languages, including [JavaScript][8], [TypeScript][9], [Go][10], [Python][11] and [C#][12]. Much like Terraform, Pulumi has first-class support for many familiar cloud providers, like [AWS][13], [Azure][14], [Google Cloud][15], and [other providers][16].

In this article, I'll show you how to use Pulumi to write infrastructure in Node.js.

### Prerequisites

First, make sure you're ready to use Pulumi. Pulumi supports all major operating systems, so the methods you use to install its prerequisites depend on the operating system you're using.

First, install the interpreter for your preferred programming language. I'll be using TypeScript, so I need to install the `node` binary. Consult Node's [installation instructions][17] for information about your operating system. You can use [Homebrew][18] on [Mac][19] or [Linux][20] to install:


```
`brew install node`
```

On Linux, you can alternately use your usual package manager, such as **apt** or **dnf**:


```
`$ sudo dnf install nodejs`
```

In either case, the result should be that the `node` binary is available in your `$PATH`. To confirm it's accessible, run:


```
`node --version`
```

Next, install the Pulumi command-line interface (CLI). You can find operating system-specific [installation instructions][21] in Pulumi's docs. With `brew` on a Mac or Linux:


```
`brew install pulumi`
```

Alternately, you can use the install script. First download it and review it, and then execute it:


```
$ curl -fsSL --output pulumi_installer.sh \
<https://get.pulumi.com/>
$ more  pulumi_installer.sh
$ sh ./pulumi_installer.sh
```

Again, the desired result is to have the `pulumi` binary available in your path. Check the version to make sure you're ready to proceed:


```
pulumi version
v2.5.0
```

### Configure Pulumi

Before you start provisioning any infrastructure, give Pulumi somewhere to store its [state][22].

Pulumi stores its state in a backend. The default backend is Pulumi's software-as-a-service (which has a free plan for individual users), but for this example, use the alternative file backend. The file backend will create a file on your local filesystem to store the state with:


```
`pulumi login --local`
```

If you're planning on sharing this project with someone else, the file backend might not be a good starting point. Pulumi can also store its state in a cloud object store like AWS S3. To use it, create an S3 bucket and log in:


```
`pulumi login --cloud-url s3://my-pulumi-state-bucket`
```

Now that you've logged into a state backend, you can create a project and a stack!

Before you start creating a Pulumi project, get to know the following Pulumi terminology, which you'll see in this tutorial.

#### Project

A [project][23] is a directory that contains a Pulumi.yaml file. This file contains metadata Pulumi needs to know to do its thing. Example fields you'll find in a Pulumi.yaml file are:

  * The runtime (e.g., Python, Node, Go, .Net)
  * A description of the project (e.g., "my first Pulumi project")
  * A name for the project



A project is a loosely defined concept that can fit your needs. Generally, a project contains a bunch of _resources_, which are things you want to provision and control. You might choose to have small Pulumi projects with very few resources or large projects that contain all the resources you need. As you become more familiar with Pulumi, it'll become more apparent how you want to lay out your projects.

#### Stack

A Pulumi [stack][24] allows you to differentiate your Pulumi projects depending on configurable values. A common use is to deploy a project to different environments like development or production or different regions like Europe, the Middle East and Africa, and the US.

When getting started, you're not likely to need a complex stack setup, so this walkthrough uses the default stack name, `dev`.

### Use TypeScript for IaC

You can bootstrap a Pulumi project using the handy `pulumi new` command. The `new` command has a whole host of flags and options that should help you get started with Pulumi, so go ahead and create your first project:


```
$ pulumi new typescript
This command will walk you through creating a new Pulumi project.

Enter a value or leave blank to accept the (default), and press &lt;ENTER&gt;.
Press ^C at any time to quit.

project name: (pulumi) my-first-project
project description: (A minimal TypeScript Pulumi program) My very first Pulumi program
Created project 'my-first-project'

Please enter your desired stack name.
To create a stack in an organization, use the format &lt;org-name&gt;/&lt;stack-name&gt; (e.g. `acmecorp/dev`).
stack name: (dev) dev
Created stack 'dev'

Installing dependencies...

&gt; node scripts/postinstall

added 82 packages from 126 contributors and audited 82 packages in 2.84s

13 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

Finished installing dependencies

Your new project is ready to go! ✨

To perform an initial deployment, run 'pulumi up'
```

A lot happened here, so I'll break it down:

The first part identifies a template for your Pulumi project. I chose the generic `typescript` option, but there are [many options available][25].

This `new` command grabbed the template from your templates repository and copied this file locally, including the runtime dependencies (in this case, `package.json`).

The `new` command took care of installing those dependencies by running `npm install` inside this directory. Then `npm install` downloaded and installed everything needed to run your Pulumi program, which, in this case, is very straightforward: the `@pulumi/pulumi` NPM package.

You're ready to create your very first resource!

### Create your first cloud resource

A resource is a thing that is managed by your infrastructure-provisioning software lifecycle. Resources are generally a cloud provider object, like an S3 bucket. Pulumi providers handle Pulumi resources, and providers are specific to the cloud provider they manage. Pulumi has around [40 providers][26] you can use, but for your first resource, use one of the simplest—the [random provider][27].

The random provider does what the name suggests: it idempotently creates a random resource (which could be a string, for example) and stores it in the Pulumi state.

Add this as a dependency to your Pulumi project using npm:


```
`npm install @pulumi/random`
```

The npm package manager downloads and installs the random provider package and installs it for you. Now you're ready to write your Pulumi program.

When you generated your project earlier, Pulumi's bootstrap process created an `index.ts` TypeScript file. Open it in your favorite integrated development environment (IDE) and add your first resource:


```
import * as pulumi from "@pulumi/pulumi";
import * as random from "@pulumi/random";

const password = new random.RandomString(`password`, {
    length: 10
})
```

If you're at all familiar with TypeScript or JavaScript, this will look very familiar because it's written in a programming language you know. This also applies if you're using one of Pulumi's other supported languages. Here's that same random resource from before, but this time in Python:


```
import pulumi_random as random

password = random.RandomString("password", length=10)
```

Pulumi projects currently support only a single language, but each project can reference other projects written in other languages—a useful trick for members of the polyglot team.

You've written your first Pulumi resource. Now you need to deploy it.

Leave your editor and head back to the command line. From your project directory, run `pulumi up` and watch the magic happen:


```
pulumi up

Previewing update (dev):
     Type                          Name                  Plan
 +   pulumi:pulumi:Stack           my-first-project-dev  create
 +   └─ random:index:RandomString  password              create

Resources:
    + 2 to create

Do you want to perform this update? yes
Updating (dev):
     Type                          Name                  Status
 +   pulumi:pulumi:Stack           my-first-project-dev  created
 +   └─ random:index:RandomString  password              created

Resources:
    + 2 created

Duration: 2s

Permalink: file:///Users/lbriggs/.pulumi/stacks/dev.json
```

Excellent, you have your first Pulumi resource! While you might be enjoying this sense of achievement, unfortunately, this random resource isn't that useful—it's just a random string, and you can't even see what it is. Address that part first: Modify your earlier program and add `export` to the constant you created:


```
import * as pulumi from "@pulumi/pulumi";
import * as random from "@pulumi/random";

export const password = new random.RandomString(`password`, {
    length: 10
})
```

Rerun `pulumi up` and look at the output:


```
pulumi up
Previewing update (dev):
     Type                 Name                  Plan
     pulumi:pulumi:Stack  my-first-project-dev

Outputs:
  + password: {
      + id             : "&amp;+r?{}J$J7"
      + keepers        : output&lt;string&gt;
      + length         : 10
      + lower          : true
      + minLower       : 0
      + minNumeric     : 0
      + minSpecial     : 0
      + minUpper       : 0
      + number         : true
      + overrideSpecial: output&lt;string&gt;
      + result         : "&amp;+r?{}J$J7"
      + special        : true
      + upper          : true
      + urn            : "urn:pulumi:dev::my-first-project::random:index/randomString:RandomString::password"
    }

Resources:
    2 unchanged

Do you want to perform this update? yes
Updating (dev):
     Type                 Name                  Status
     pulumi:pulumi:Stack  my-first-project-dev

Outputs:
  + password: {
      + id        : "&amp;+r?{}J$J7"
      + length    : 10
      + lower     : true
      + minLower  : 0
      + minNumeric: 0
      + minSpecial: 0
      + minUpper  : 0
      + number    : true
      + result    : "&amp;+r?{}J$J7"
      + special   : true
      + upper     : true
      + urn       : "urn:pulumi:dev::my-first-project::random:index/randomString:RandomString::password"
    }

Resources:
    2 unchanged

Duration: 1s
Permalink: file:///Users/lbriggs/.pulumi/stacks/dev.json
```

Now you can see a randomly generated string under the `result` section of the `Outputs`. The resource you created has a number of properties that you can see now.

This is all well and good, but if you want to enjoy IaC, you're going to have to provision something other than a random string. Give it a try!

### Deploy a container

So far, you've bootstrapped your Pulumi experience by installing dependencies and registered a simple random resource. Now deploy some actual infrastructure, albeit to your local machine.

First, add the `@pulumi/docker` provider to your stack. Use your chosen package manager to add it to the project:


```
`npm install @pulumi/docker`
```

You've pulled down the Pulumi Docker provider package from npm, which means you can now create Docker images in your project.

If you don't have Docker installed on your machine, now is an excellent time to get it. Instructions will depend on your operating system, so take a look at [Docker's installation page][28] for information.

Open up your favorite IDE again and run a Docker container. Modify your `index.ts` file from earlier to make it look like this:


```
import * as pulumi from "@pulumi/pulumi";
import * as random from "@pulumi/random";
import * as docker from "@pulumi/docker";

const password = new random.RandomString(`password`, {
    length: 10
})

const container = new docker.Container(`my-password`, {
    image: 'hashicorp/http-echo',
    command: [ pulumi.interpolate`-text=Your super secret password is: ${password.result}` ],
    ports: [{
        internal: 5678,
        external: 5678,
    }]
})

export const id = container.id
```

This creates a container that creates a web server. The output of the web server is your randomly generated string, in this case, a password. Run this and see what happens:


```
pulumi up

Previewing update (dev):
     Type                       Name                  Plan
     pulumi:pulumi:Stack        my-first-project-dev
 +   └─ docker:index:Container  my-password           create

Outputs:
  + id      : output&lt;string&gt;
  ~ password: {
        id        : "&amp;+r?{}J$J7"
        length    : 10
        lower     : true
        minLower  : 0
        minNumeric: 0
        minSpecial: 0
        minUpper  : 0
        number    : true
        result    : "&amp;+r?{}J$J7"
        special   : true
        upper     : true
        urn       : "urn:pulumi:dev::my-first-project::random:index/randomString:RandomString::password"
    }

Resources:
    + 1 to create
    2 unchanged

Do you want to perform this update? yes
Updating (dev):
     Type                       Name                  Status
     pulumi:pulumi:Stack        my-first-project-dev
 +   └─ docker:index:Container  my-password           created

Outputs:
  + id      : "e73b34aeca34a64b72b61b0b9b8438637ce28853937bc359a1528ca99f49ddda"
    password: {
        id        : "&amp;+r?{}J$J7"
        length    : 10
        lower     : true
        minLower  : 0
        minNumeric: 0
        minSpecial: 0
        minUpper  : 0
        number    : true
        result    : "&amp;+r?{}J$J7"
        special   : true
        upper     : true
        urn       : "urn:pulumi:dev::my-first-project::random:index/randomString:RandomString::password"
    }

Resources:
    + 1 created
    2 unchanged

Duration: 2s
Permalink: file:///Users/lbriggs/.pulumi/stacks/dev.json
```

You'll notice in the `Outputs` section that the values you're outputting have changed; it's just a Docker container ID. Check whether your very simple password generator works:


```
curl <http://localhost:5678>
Your super secret password is: &amp;+r?{}J$J7
```

It does! You just provisioned your first piece of infrastructure with TypeScript!

#### A quick note on Pulumi outputs

You'll notice in the code that creates the Docker container that it uses a special `pulumi.interpolate` call. If you're familiar with TypeScript, you might be curious why that's needed (as it's Pulumi-specific). There's an interesting reason.

When Pulumi creates a resource, there are values that Pulumi doesn't know until the program executes. In Pulumi, these are called `Outputs`. These `Outputs` can be seen in the code above; for example, in your first random resource, you used the `export` keyword to output the random resource's properties, and you also exported the container ID of the container you created.

Because Pulumi doesn't know the value of these `Outputs` until execution time, it needs special helpers to use them when manipulating strings. If you want to know more about this special programming model, watch [this short video][29].

### Wrapping up

IaC has evolved in many ways as complexity has arisen in hybrid-cloud infrastructures. In the infrastructure-provisioning space, Pulumi is a great choice for using your favorite programming language to provision everything you need to get your infrastructure off the ground, then you can tag in your favorite configuration management tooling to take the next steps.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/infrastructure-as-code-pulumi

作者：[Lee Briggs][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lbriggs
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://opensource.com/resources/devops
[3]: https://git-scm.com/
[4]: https://www.mercurial-scm.org/
[5]: https://opensource.com/article/18/12/configuration-management-tools
[6]: https://opensource.com/article/20/7/terraform-kubernetes
[7]: https://www.pulumi.com/
[8]: https://developer.mozilla.org/en-US/docs/Web/JavaScript
[9]: https://www.typescriptlang.org/
[10]: https://golang.org/
[11]: https://www.python.org/
[12]: https://en.wikipedia.org/wiki/C_Sharp_(programming_language)
[13]: https://www.pulumi.com/docs/intro/cloud-providers/aws/
[14]: https://www.pulumi.com/docs/intro/cloud-providers/azure/
[15]: https://www.pulumi.com/docs/intro/cloud-providers/gcp/
[16]: https://www.pulumi.com/docs/reference/pkg/
[17]: https://nodejs.org/en/download/
[18]: https://brew.sh/
[19]: https://opensource.com/article/20/6/homebrew-mac
[20]: https://opensource.com/article/20/6/homebrew-linux
[21]: https://www.pulumi.com/docs/get-started/install/
[22]: https://www.pulumi.com/docs/intro/concepts/state/
[23]: https://www.pulumi.com/docs/intro/concepts/project/
[24]: https://www.pulumi.com/docs/intro/concepts/stack/
[25]: https://github.com/pulumi/templates
[26]: https://www.pulumi.com/docs/intro/cloud-providers/
[27]: https://www.pulumi.com/docs/intro/cloud-providers/random/
[28]: https://docs.docker.com/get-docker/
[29]: https://www.youtube.com/watch?v=lybOxul2otM
