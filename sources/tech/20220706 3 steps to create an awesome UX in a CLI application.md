[#]: subject: "3 steps to create an awesome UX in a CLI application"
[#]: via: "https://opensource.com/article/22/7/awesome-ux-cli-application"
[#]: author: "Noaa Barki https://opensource.com/users/noaa-barki"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

3 steps to create an awesome UX in a CLI application
======
Here is what I've learned to be the key factors that go into a successful user experience for a CLI project.

As I was sitting in a meeting room, speaking with one of my teammates, our manager walked in with the rest of the dev team. The door slammed shut and our manager revealed that he had a big announcement. What unfolded before our eyes was the next project we were going to develop—an open source CLI (command line interface) application.

In this article, I'd like to share what I learned during our development process, and specifically what I wish I had known before we began developing [Datree's CLI][3]. Perhaps the next person can use these tips to create a great CLI application faster.

My name is Noaa Barki. I've been a full-stack developer for over six years, and I'll let you in on a little secret—I have a superpower: My interest and expertise are evenly split between back-end and front-end development. I simply cannot choose one without the other.

So when my manager revealed the news about our future CLI, the back-end developer-me got very excited because I'd never created a CLI (or any open source project, for that matter). A few seconds later, the front-end developer-me started to wonder, *How can I build an awesome user experience in a CLI application?*

Since Datree CLI helps engineers prevent [Kubernetes misconfigurations][4], my users are primarily DevOps and engineers, so I interviewed all my DevOps friends and searched online about the general DevOps persona.

Here are the steps I came up with:

1. Design the commands
2. Design the UI
3. Provide backward compatibility

### Step 1: Design the commands

Once you have completed the strategic process, it's time to design the commands. I think about CLI applications like magic boxes—they hold great features that work in a magical way, but only if you know how to use them. That means a CLI application must be intuitive and easy to use.

#### My top six principles for CLI commands

Here are my top six principles and best practices for designing and developing CLI commands:

**1. Input flag vs. arguments**

Use arguments for required fields, and for everything else, use flags. Take, for example, the `datree test` command, which prints the policy results, and say that you want to enable the user to print the output into a specific file. If you use `datree test {pattern} {output-file}`, it is difficult to understand from reading the executed command which argument is the pattern and which argument is the file path.

For example, this occurs with the following command: `datree test **/* **.YAML`. However, if you use `datree test {pattern} -output {output-path}`, it becomes much clearer.

**Note:** Reports show that most users find flags to be clearer.

**2. Enum-style vs. Boolean flags**

It's preferable to use an enum-style flag over a Boolean-style flag because then you (a developer and user) need to think about all combinations of the presence or absence of the flags in the command. An enum-style flag is a flag that assumes a value. Enum-style flags make it much easier to implement tab completion.

**3. Use familiar language**

Remember that a CLI is built more for humans than machines. Pick real-world language for your commands and descriptions.

**4. Naming conventions**

Use CLI commands that are named in a SINGLE form and VERB-NOUN format. This allows the command to be read like an imperative or request, for example: *Computer, start app!*

Minimize with the total number of commands you use, and don't rush to introduce new verbs to new commands. This makes it easier for users to remember command names.

**5. Prompts**

Provide a bypass to the prompt option. The user cannot script the command if prompting is required to complete it. To avoid frustrating users, a simple `--output` flag can be a valuable solution to allow the user to parse the output and script the CLI.

**6. Command descriptions**

The root command should list all the commands with their descriptions. Provide a command description to all commands (or do not offer descriptions at all), choose the screen width you want it to fit into (generally an 80-character width), and begin with a lowercase character. Also, don't end with a period to avoid unclear line breaks or lost periods.

### Step 2: Design the UI

Now you have a solid definition for your users. You have also planned and designed your commands and outputs. Next it's time to think about making the CLI application aesthetic, accessible, and easy to learn.

If you think about it, almost every app must deal with UX (user experience) challenges during the users' onboarding and journey. The *how* part of UX for web applications is much more obvious because you have many component libraries (such as material-UI and bootstrap) that make it easier to adopt standard style guides and functionality flows. But what about CLI applications? Are there any design conventions for CLI interfaces? How can you create an aesthetic design of the CLI functionality that is also accessible? Is there any way to make the CLI UI as friendly as a GUI?

#### Top three UI and UX best practices for CLI applications

**1. Use colors**

Colors are a great way to attract your user's eyes and help them read commands and outputs much faster. The most recommended font colors are magenta, cyan, blue, green, and gray, but don't forget that background colors can provide more variety. I encourage you to use yellow and red colors but remember that these are typically saved for errors and warnings.

**2. Input-output consistency**

Be consistent with inputs and outputs across the application; this encourages usability and allows the user to learn how to interact with new commands quickly.

**3. Ordering arguments**

Choose an argument's position based on how it correlates with the command's action. Consider NestJS's generate command `nest generate {schematic} {name}`, which needs *schematic* and *name* as arguments. Notice that the action *generate* refers directly to the *schematic*, not *name*, so it makes more sense for *schematic* to be the first arg.

### Step 3: Provide backward compatibility

Avoid modifying the output. Now that you know how to create a perfect CLI application, don't forget to keep your users in the back of your mind, especially when enabling scripting the CLI. Remember that any change in the command's outputs may break users' current scripts; therefore, avoid modifying the output.

### Wrap up

Creating a new CLI is exciting and challenging, and doing so with a helpful and easy UX adds to the challenge. My experience shows that three key factors go into a successful UX for a CLI project:

1. Design the commands
2. Design the UI
3. Provide backward compatibility

Each of these phases has its own components that support the logic and make the lives of your users easier.

I hope these concepts are useful and that you have the opportunity to apply them in your next project.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/awesome-ux-cli-application

作者：[Noaa Barki][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/noaa-barki
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png
[2]: https://creativecommons.org/licenses/by/3.0/us/
[3]: https://www.datree.io/
[4]: https://opensource.com/article/22/4/kubernetes-policies-config-datree
