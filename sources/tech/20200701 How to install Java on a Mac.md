[#]: collector: (lujun9972)
[#]: translator: (Yufei-Yan)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to install Java on a Mac)
[#]: via: (https://opensource.com/article/20/7/install-java-mac)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)

How to install Java on a Mac
======
macOS users can run the open source release of Java as well as newer
frameworks for cloud-native development.
![Coffee and laptop][1]

In late May, [Java][2] celebrated its 25th anniversary, and to commemorate the occasion, developers around the world used the hashtag [#MovedByJava][3] to share their achievements, memories, and insights with the programming language.

> My timeline:
>
> * 1999 Started learning Java
>  * 2007 Created [@grailsframework][4]
>  * 2008 Cofounded G2One
>  * 2009 Acquired by SpringSource
>  * 2015 Joined [@ObjectComputing][5]
>  * 2018 Created [@micronautfw][6] / won [@groundbreakers][7] award
>  * 2019 Became [@Java_Champions][8]
>
> Thank u [@java][9]![#MovedByJava][10]
>
> — Graeme Rocher (@graemerocher) [May 21, 2020][11]

Over the years, many technologies and trends have contributed to the Java stack's development, deployment, and ability to run multiple applications on standard application servers. Building container images for [Kubernetes][12] enables Java developers to package and deploy [microservices][13] in multiple cloud environments rather than running several application servers on virtual machines.

![Timeline of technology contributions to Java][14]

(Daniel Oh, [CC BY-SA 4.0][15])

With these technologies, the Java application stack has been optimized to run larger heaps and highly dynamic frameworks that can make decisions at runtime. Unfortunately, those efforts weren't good enough to make Java the preferred programming language for developers to implement cloud-native Java applications for serverless and event-driven platforms. Other languages filled in the space, particularly JavaScript, Python, and Go, with Rust and WebAssembly offering new alternatives.

Despite this competition, [cloud-native Java][16] is making an impact on cloud-centric software development. Luckily, new Java frameworks (e.g., [Quarkus][17], [Micronaut][18], and [Helidon][19]) have recently broken through the challenges by offering smaller applications that compile faster and are designed with distributed systems in mind.

### How to install Java on macOS

This future for Java development starts with more people installing and using Java. So I will walk through installing and getting started with the Java development environment on macOS. (If you are running Linux, please see Seth Kenlon's article [_How to install Java on Linux_][20].)

#### Install OpenJDK from a Brew repository

Homebrew is the de-facto standard package manager for macOS. If you haven't installed it yet, Matthew Broberg's [_Introduction to Homebrew_][21] walks you through the steps.

Once you have Homebrew on your Mac, use the `brew` command to install [OpenJDK][22], which is the open source way to write Java applications:


```
`$ brew cask install java`
```

In just a few minutes, you will see:


```
`🍺 java was successfully installed!`
```

Confirm that OpenJDK installed correctly with `$ java -version`:


```
$ java -version
openjdk version "14.0.1" 2020-04-14
OpenJDK Runtime Environment (build 14.0.1+7)
OpenJDK 64-Bit Server VM (build 14.0.1+7, mixed mode, sharing
```

The output confirms OpenJDK 14 (the latest version, as of this writing) is installed.

#### Install OpenJDK from a binary

If you are not a fan of package management and prefer managing Java yourself, there's always the option to download and install it manually.

I found a download link to the latest version on the OpenJDK homepage. Download the OpenJDK 14 binary:


```
`$ wget https://download.java.net/java/GA/jdk14.0.1/664493ef4a6946b186ff29eb326336a2/7/GPL/openjdk-14.0.1_osx-x64_bin.tar.gz`
```

Move to the directory where you downloaded the binary file and extract it:


```
`$ tar -xf openjdk-14.0.1_osx-x64_bin.tar.gz`
```

Next, add Java to your PATH:


```
`$ export PATH=$PWD/jdk-14.0.1.jdk/Contents/Home/bin:$PATH`
```

Also, add this to the path to your dotfiles, `.bash_profile` or `.zshrc` depending on what shell you are running. You can learn more about configuring the `$PATH` variable in [_How to set your $PATH variable in Linux_][23].

Finally, verify your OpenJDK 14 installation:


```
$ java -version
openjdk version "14.0.1" 2020-04-14
OpenJDK Runtime Environment (build 14.0.1+7)
OpenJDK 64-Bit Server VM (build 14.0.1+7, mixed mode, sharing)
```

### Write your first Java microservice on a Mac

Now you are ready to develop a cloud-native Java application with OpenJDK stack on macOS. In this how-to, you'll create a new Java project on [Quarkus][17] that exposes a REST API using dependency injection.

You will need [Maven][24], a popular Java dependency manager, to start. [Install][25] it from Maven's website or using Homebrew with `brew install maven`.

Execute the following Maven commands to configure a Quarkus project and create a simple web app:


```
$ mvn io.quarkus:quarkus-maven-plugin:1.5.1.Final:create \
    -DprojectGroupId=com.example \
    -DprojectArtifactId=getting-started \
    -DclassName="com.example.GreetingResource" \
    -Dpath="/hello"
cd getting-started
```

Run the application:


```
`$ ./mvnw quarkus:dev`
```

You will see this output when the application starts:


```
__  ____  __  _____   ___  __ ____  ______
 --/ __ \/ / / / _ | / _ \/ //_/ / / / __/
 -/ /_/ / /_/ / __ |/ , _/ ,&lt; / /_/ /\ \  
\--\\___\\_\\____/_/ |_/_/|_/_/|_|\\____/___/  
2020-06-13 00:03:06,413 INFO  [io.quarkus] (Quarkus Main Thread) getting-started 1.0-SNAPSHOT on JVM (powered by Quarkus 1.5.1.Final) started in 1.125s. Listening on: <http://0.0.0.0:8080>
2020-06-13 00:03:06,416 INFO  [io.quarkus] (Quarkus Main Thread) Profile dev activated. Live Coding activated.
2020-06-13 00:03:06,416 INFO  [io.quarkus] (Quarkus Main Thread) Installed features: [cdi, resteasy]
```

Access the REST endpoint using the `curl` command:


```
$ curl -w "\n" <http://localhost:8080/hello>
hello
```

Congratulations! You have quickly gone from not even having Java installed to building your first web application using Maven and Quarkus.

### What to do next with Java

Java is a mature programming language that continues to grow in popularity through new frameworks designed for cloud-native application development.

If you are on the path toward building that future, you may be interested in more practical Quarkus development lessons or other modern frameworks. No matter what you're building, the next step is configuring your text editor. Read my tutorial on [_Writing Java with Quarkus in VS Code_][26], then explore what else you can do.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/install-java-mac

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o (Coffee and laptop)
[2]: https://opensource.com/resources/java
[3]: https://twitter.com/search?q=%23MovedByJava&src=typed_query
[4]: https://twitter.com/grailsframework?ref_src=twsrc%5Etfw
[5]: https://twitter.com/ObjectComputing?ref_src=twsrc%5Etfw
[6]: https://twitter.com/micronautfw?ref_src=twsrc%5Etfw
[7]: https://twitter.com/groundbreakers?ref_src=twsrc%5Etfw
[8]: https://twitter.com/Java_Champions?ref_src=twsrc%5Etfw
[9]: https://twitter.com/java?ref_src=twsrc%5Etfw
[10]: https://twitter.com/hashtag/MovedByJava?src=hash&ref_src=twsrc%5Etfw
[11]: https://twitter.com/graemerocher/status/1263484918157410304?ref_src=twsrc%5Etfw
[12]: https://opensource.com/resources/what-is-kubernetes
[13]: https://opensource.com/resources/what-are-microservices
[14]: https://opensource.com/sites/default/files/uploads/javatimeline.png (Timeline of technology contributions to Java)
[15]: https://creativecommons.org/licenses/by-sa/4.0/
[16]: https://opensource.com/article/20/1/cloud-native-java
[17]: https://quarkus.io/
[18]: https://micronaut.io/
[19]: https://helidon.io/#/
[20]: https://opensource.com/article/19/11/install-java-linux
[21]: https://opensource.com/article/20/6/homebrew-mac
[22]: https://openjdk.java.net/
[23]: https://opensource.com/article/17/6/set-path-linux
[24]: https://maven.apache.org/index.html
[25]: https://maven.apache.org/install.html
[26]: https://opensource.com/article/20/4/java-quarkus-vs-code
