[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create interactive learning games for kids with open source)
[#]: via: (https://opensource.com/article/20/5/jclic-games-kids)
[#]: author: (Peter Cheer https://opensource.com/users/petercheer)

Create interactive learning games for kids with open source
======
Help your students learn by creating fun puzzles and games in JClic, an
easy Java-based app.
![Family learning and reading together at night in a room][1]

Schools are closed in many countries around the world to slow the spread of COVID-19. This has suddenly thrown many parents and teachers into homeschooling. Fortunately, there are plenty of educational resources on the internet to use or adapt, although their licenses vary. You can try searching for Creative Commons Open Educational Resources, but if you want to create your own materials, there are many options for that to.

If you want to create digital educational activities with puzzles or tests, two easy-to-use, open source, cross-platform applications that fit the bill are eXeLearning and JClic. My earlier article on [eXeLearning][2] is a good introduction to that program, so here I'll look at [JClic][3]. It is an open source software project for creating various types of interactive activities such as associations, text-based activities, crosswords, and other puzzles with text, graphics, and multimedia elements.

Although it's been around since the 1990s, JClic never developed a large user base in the English-speaking world. It was created in Catalonia by the [Catalan Educational Telematic Network][4] (XTEC).

### About JClic

JClic is a Java-based application that's available in many Linux repositories and can be downloaded from [GitHub][5]. It runs on Linux, macOS, and Windows, but because it is a Java program, you must have a Java runtime environment [installed][6].

The program's interface has not really changed much over the years, even while features have been added or dropped, such as introducing HTML5 export functionality to replace Java Applet technology for web-based deployment. It hasn't needed to change much, though, because it's very effective at what it does.

### Creating a JClic project

Many teachers from many countries have used JClic to create interactive materials for a wide variety of ability levels, subjects, languages, and curricula. Some of these materials have been collected in an [downloadable activities library][7]. Although few activities are in English, you can get a sense of the possibilities JClic offers.

As JClic has a visual, point-and-click program interface, it is easy enough to learn that a new user can quickly concentrate on content creation. [Documentation][8] is available on GitHub.

The screenshots below are from one of the JClic projects I created to teach basic Excel skills to learners in Papua New Guinea.

A JClic project is created in its authoring tool and consists of the following four elements:

#### 1\. Metadata about the project

![JClic metadata][9]

#### 2\. A library of the graphical and other resources it uses

![JClic media][10]

#### 3\. A series of one or more activities

![JClic activities][11]

JClic can produce seven different activity types:

  * Associations where the user discovers the relationships between two information sets
  * Memory games where the user discovers pairs of identical elements or relations (which are hidden) between them
  * Exploration activities involving the identification and information, based on a single Information set
  * Puzzles where the user reconstructs information that is initially presented in a disordered form; the activity can include graphics, text, sound, or a combination of them
  * Written-response activities that are solved by writing text, either a single word or a sentence
  * Text activities that are based on words, phrases, letters, and paragraphs of text that need to be completed, understood, corrected, or ordered; these activities can contain images and windows with active content
  * Word searches and crosswords



Because of variants in the activities, there are 16 possible activity types.

#### 4\. A timeline to sequence the activities

![JClic timeline][12]

### Using JClic content

Projects can run in JClic's player (part of the Java application you used to create the project), or they can be exported to HTML5 so they can run in a web browser.

The one thing I don't like about JClic is that its default HTML5 export function assumes you'll be online when running a project. If you want a project to work offline as needed, you must download a compiled and minified HTML5 player from [Github][13], and place it in the same folder as your JClic project.

Next, open the **index.html** file in a text editor and replace this line:


```
`<script type="text/javascript" src="https://clic.xtec.cat/dist/jclic.js/jclic.min.js"></script>`
```

With:


```
`<script type="text/javascript" src="jclic.min.js"></script>`
```

Now the HTML5 version of your project runs in a web browser, whether the user is online or not.

JClic also provides a reports function that can store test scores in an ODBC-compliant database. I have not explored this feature, as my tests and puzzles are mostly used for self-assessment and to prompt reflection by the learner, rather than as part of a formal scheme, so the scores are not very important. If you would like to learn about it, there is [documentation][14] on running JClic Reports Server with Tomcat and MySQL (or [mariaDB][15]).

### Conclusion

JClic offers a wide range of activity types that provide plenty of room to be creative in designing content to fit your subject area and type of learner. JClic is a valuable addition for anyone who needs a quick and easy way to develop educational resources.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/jclic-games-kids

作者：[Peter Cheer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/petercheer
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/family_learning_kids_night_reading.png?itok=6K7sJVb1 (Family learning and reading together at night in a room)
[2]: https://opensource.com/article/18/5/exelearning
[3]: https://clic.xtec.cat/legacy/en/jclic/index.html
[4]: https://clic.xtec.cat/legacy/en/index.html
[5]: https://github.com/projectestac/jclic
[6]: https://adoptopenjdk.net/installation.html
[7]: https://clic.xtec.cat/repo/
[8]: https://github.com/projectestac/jclic/wiki/JClic_Guide
[9]: https://opensource.com/sites/default/files/uploads/metadata.png (JClic metadata)
[10]: https://opensource.com/sites/default/files/uploads/media.png (JClic media)
[11]: https://opensource.com/sites/default/files/uploads/activities.png (JClic activities)
[12]: https://opensource.com/sites/default/files/uploads/sequence.png (JClic timeline)
[13]: http://projectestac.github.io/jclic.js/
[14]: https://github.com/projectestac/jclic/wiki/Jclic-Reports-Server-with-Tomcat-and-MySQL-on-Ubuntu
[15]: https://mariadb.org/
