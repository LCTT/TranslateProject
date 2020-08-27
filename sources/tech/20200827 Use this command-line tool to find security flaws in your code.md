[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use this command-line tool to find security flaws in your code)
[#]: via: (https://opensource.com/article/20/8/static-code-security-analysis)
[#]: author: (Ari Noman https://opensource.com/users/arinoman)

Use this command-line tool to find security flaws in your code
======
Featuring broad language support, Graudit allows you to audit the
security of your code during the development process.
![Code on a screen][1]

Testing is an important part of the software development lifecycle (SDLC), and there are several stages to it. Today, I want to talk about finding security issues in the code.

You can't ignore security when developing a piece of software. That's why there is a term called DevSecOps, which is fundamentally responsible for identifying and resolving security vulnerabilities in an application. There are open source solutions for checking [OWASP vulnerabilities][2] and which will derive insights by creating a threat model of the source code.

There are different approaches to handling security issues, e.g., static application security testing (SAST), dynamic application security testing (DAST), interactive application security testing (IAST), software composition analysis, etc.

Static application security testing runs at the code level and analyzes applications by uncovering errors in the code that has already been written. This approach doesn't require the code to be running, which is why it's called static analysis.

I'll focus on static code analysis and use an open source tool to have a hands-on experience.

### Why use an open source tool to check code security

There are many reasons to choose open source software, tools, and projects as a part of your development. It won't cost any money, as you're using a tool developed by a like-minded community of developers who want to help other developers. If you have a small team or a startup, it's good to find open source software to check your code security. This keeps you from having to hire a separate DevSecOps team, keeping your costs lower.

Good open source tools are always made with flexibility in mind, and they should be able to be used in any environment, covering as many cases as possible. It makes life easier for developers to connect that piece of software with their existing system.

But there can be times where you need a feature that is not available within the tool that you chose. Then you have the option to fork the code and develop your own feature on top of it and use it in your system.

Since, most of the time, open source software is driven by a community, the pace of the development tends to be a plus for the users of that tool because they iterate the project based on user feedback, issues, or bug-posting.

### Using Graudit to ensure that your code is secure

There are various open source static code analysis tools available, but as you know, the tool analyzes the code itself, and that's why there is no generic tool for any and all programming languages. But some of them follow OWASP guidelines and try to cover as many languages as they can.

Here, we'll use [Graudit][3], which is a simple command-line tool that allows us to find security flaws in our codebase. It has support for different languages but a fixed signature set.

Graudit uses grep, which is a GNU-licensed utility tool, and there are similar types of static code analysis tools like Rough Auditing Tool for Security (RATS), Securitycompass Web Application Analysis Tool (SWAAT), flawfinder, etc. But the technical requirement it has is minimal and very flexible. Still, you might have requirements that are not served by Graudit. If so, you can look at this [list][4] for other options.

We can install this tool under a specific project, or in the global namespace, or under a specific user—whatever we like, it's flexible. Let's clone the repo first:


```
`$ git clone https://github.com/wireghoul/graudit`
```

Now, we need to create a symbolic link of Graudit so that we can use it as a command:


```
$ cd ~/bin &amp;&amp; mkdir graudit
$ ln --symbolic ~/graudit/graudit ~/bin/graudit
```

Add an alias to .bashrc (or the config file for whatever shell you're using):


```
#------ .bashrc ------

alias graudit="~/bin/graudit"
```

and reload the shell:


```
$ source ~/.bashrc # OR
$ exex $SHELL
```

Let's check whether or not we have successfully installed the tool by running this:


```
`$ graudit -h`
```

If you get something similar to this, then you're good to go.

![Graudit terminal screen showing help page][5]

Fig. 1 Graudit help page

I'm using one of my existing projects to test the tool. To run the tool, we need to pass the database of the respective language. You'll find the databases under the signatures folder:


```
`$ graudit -d ~/gradit/signatures/js.db`
```

I ran this on two JavaScript files from my existing projects, and you can see that it throws the vulnerable code in the console:

![JavaScript file showing Graudit display of vulnerable code][6]

![JavaScript file showing Graudit display of vulnerable code][7]

You can try running this on one of your projects, and they have a long list of [databases][8] included in the project itself for supporting different languages.

### Graudit pros and cons

Graudit supports a lot of languages, which makes it a good bet for users on many different systems. It's comparable to other free or paid tools because of its simplicity of use and broad language support. Most importantly, they are under development, and the community supports other users too.

Though this is a handy tool, you may find it difficult to identify a specific code as "vulnerable." Maybe the developers will include this function in future versions of the tool. But, it is always good to keep an eye on security issues in the code by using tools like this.

### Conclusion

In this article, I've only covered one of the many types of security testing—static application security testing. It's easy to start with static code analysis, but that's just the beginning. You can add other types of application security testing in your application development pipeline to enrich your overall security awareness.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/static-code-security-analysis

作者：[Ari Noman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/arinoman
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_code_screen_display.jpg?itok=2HMTzqz0 (Code on a screen)
[2]: https://owasp.org/www-community/vulnerabilities/
[3]: https://github.com/wireghoul/graudit
[4]: https://project-awesome.org/mre/awesome-static-analysis
[5]: https://opensource.com/sites/default/files/uploads/graudit_1.png (Graudit terminal screen showing help page)
[6]: https://opensource.com/sites/default/files/uploads/graudit_2.png (JavaScript file showing Graudit display of vulnerable code)
[7]: https://opensource.com/sites/default/files/uploads/graudit_3.png (JavaScript file showing Graudit display of vulnerable code)
[8]: https://github.com/wireghoul/graudit#databases
