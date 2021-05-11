[#]: subject: (Make Jenkins logs pretty)
[#]: via: (https://opensource.com/article/21/5/jenkins-logs)
[#]: author: (Evan "Hippy" Slatis https://opensource.com/users/hippyod)
[#]: collector: (lujun9972)
[#]: translator: (DCOLIVERSUN)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Make Jenkins logs pretty
======
Jenkins' default logs can be hard to read, but they don't have to be.
![Person using a laptop][1]

Jenkins is a free and open source automation server for building, testing, and deploying code. It's the backbone of continuous integration and continuous delivery (CI/CD) and can save developers hours each day and protect them from having failed code go live. When code does fail, or when a developer needs to see the output of tests, [Jenkins][2] provides log files for review.

The default Jenkins pipeline logs can be difficult to read. This quick summary of Jenkins logging basics offers some tips (and code) on how to make them more readable.

### What you get

Jenkins pipelines are split into [stages][3]. Jenkins automatically logs the beginning of each stage, like this:


```
[Pipeline] // stage
[Pipeline] stage (hide)
[Pipeline] { (Apply all openshift resources)
[Pipeline] dir
```

The text is displayed without much contrast, and important things (like the beginning of a stage) aren't highlighted. In a pipeline log several hundred lines long, finding where one stage starts and another ends, especially if you're casually browsing the logs looking for a particular stage, can be daunting.

Jenkins pipelines are written as a mix of [Groovy][4] and shell scripting. In the Groovy code, logging is sparse; many times, it consists of grayed-out text in the command without details. In the shell scripts, debugging mode (`set -x`) is turned on, so every shell command is fully realized (variables are dereferenced and values printed) and logged in detail, as is the output.

It can be tedious to read through the logs to get relevant information, given that there can be so much. Since the Groovy logs that proceed and follow a shell script in a pipeline aren't very expressive, many times they lack context:


```
[Pipeline] dir
Running in /home/jenkins/agent/workspace/devop-master/devops-server-pipeline/my-repo-dir/src
[Pipeline] { (hide)
[Pipeline] findFiles
[Pipeline] findFiles
[Pipeline] readYaml
[Pipeline] }
```

I can see what directory I am working in, and I know I was searching for file(s) and reading a YAML file using Jenkins' steps. But what was I looking for, and what did I find and read?

### What can be done?

I'm glad you asked because there are a few simple practices and some small snippets of code that can help. First, the code:


```
def echoBanner(def ... msgs) {
   echo createBanner(msgs)
}

def errorBanner(def ... msgs) {
   error(createBanner(msgs))
}

def createBanner(def ... msgs) {
   return """
       ===========================================

       ${msgFlatten(null, msgs).join("\n        ")}

       ===========================================
   """
}

// flatten function hack included in case Jenkins security
// is set to preclude calling Groovy flatten() static method
// NOTE: works well on all nested collections except a Map
def msgFlatten(def list, def msgs) {
   list = list ?: []
   if (!(msgs instanceof String) &amp;&amp; !(msgs instanceof GString)) {
       msgs.each { msg -&gt;
           list = msgFlatten(list, msg)
       }
   }
   else {
       list += msgs
   }

   return  list
}
```

Add this code to the end of each pipeline or, to be more efficient, [load a Groovy file][5] or make it part of a [Jenkins shared library][6].

At the start of each stage (or at particular points within a stage), simply call `echoBanner`:


```
`echoBanner("MY STAGE", ["DOING SOMETHING 1", "DOING SOMETHING 2"])`
```

Your logs in Jenkins will display the following:


```
    ===========================================

    MY STAGE
    DOING SOMETHING 1
    DOING SOMETHING 2

    ===========================================
```

The banners are very easy to pick out in the logs. They also help define the pipeline flow when used properly, and they break the logs up nicely for reading.

I have used this for a while now professionally in a few places. The feedback has been very positive regarding helping make pipeline logs more readable and the flow more understandable.

The `errorBanner` method above works the same way, but it fails the script immediately. This helps highlight where and what caused the failure.

### Best practices

  1. Use `echo` Jenkins steps liberally throughout your Groovy code to inform the user what you're doing. These can also help with documenting your code.
  2. Use empty log statements (an empty echo step in Groovy, `echo ''`, or just `echo` in shell) to break up the output for easier readability. You probably use empty lines in your code for the same purpose.
  3. Avoid the trap of using `set +x` in your scripts, which hides logging executed shell statements. It doesn't so much clean up your logs as it makes your pipelines a black box that hides what your pipeline is doing and any errors that appear. Make sure your pipelines' functionality is as transparent as possible.
  4. If your pipeline creates intermediate artifacts that developers and/or DevOps personnel could use to help debug issues, then log their contents, too. Yes, it makes the logs longer, but it's only text. It will be useful information at some point, and what else is a log (if utilized properly) than a wealth of information about what happened and why?



### Kubernetes Secrets: Where full transparency won't work

There are some things that you _don't_ want to end up in your logs and be exposed. If you're using Kubernetes and referencing data held in a Kubernetes Secret, then you definitely don't want that data exposed in a log because the data is only obfuscated and not encrypted.

Imagine you want to take some data held in a Secret and inject it into a templated JSON file. (The full contents of the Secret and the JSON template are irrelevant for this example.) You want to be transparent and log what you're doing since that's best practice, but you don't want to expose your Secret data.

Change your script's mode from debugging (`set -x`) to command logging (`set -v`). At the end of the sensitive portion of the script, reset the shell to debugging mode:


```
sh """
   # change script mode from debugging to command logging
   set +x -v

   # capture data from secret in shell variable
   MY_SECRET=\$(kubectl get secret my-secret --no-headers -o 'custom-column=:.data.my-secret-data')

   # replace template placeholder inline
   sed s/%TEMPLATE_PARAM%/${MY_SECRET_DATA}/ my-template-file.json

   # do something with modified template-file.json...

   # reset the shell to debugging mode
   set -x +v
"""
```

This will output this line to the logs:


```
`sed s/%TEMPLATE_PARAM%/${MY_SECRET_DATA}/ my-template-file.json`
```

This doesn't realize the shell variable `MY_SECRET_DATA`, unlike in shell debug mode. Obviously, this isn't as helpful as debug mode if a problem occurs at this point in the pipeline and you're trying to figure out what went wrong. But it's the best balance between keeping your pipeline execution transparent for both developers and DevOps while also keeping your Secrets hidden.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/jenkins-logs

作者：[Evan "Hippy" Slatis][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hippyod
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://www.jenkins.io/
[3]: https://www.jenkins.io/doc/book/pipeline/syntax/#stage
[4]: https://opensource.com/article/20/12/groovy
[5]: https://www.jenkins.io/doc/pipeline/steps/workflow-cps/#load-evaluate-a-groovy-source-file-into-the-pipeline-script
[6]: https://www.jenkins.io/doc/book/pipeline/shared-libraries/
