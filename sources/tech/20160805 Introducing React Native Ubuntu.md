ch_cn translating
Introducing React Native Ubuntu
=====================

In the Webapps team at Canonical, we are always looking to make sure that web and near-web technologies are available to developers. We want to make everyone's life easier, enable the use of tools that are familiar to web developers and provide an easy path to using them on the Ubuntu platform.

We have support for web applications and creating and packaging Cordova applications, both of these enable any web framework to be used in creating great application experiences on the Ubuntu platform.

One popular web framework that can be used in these environments is React.js; React.js is a UI framework with a declarative programming model and strong component system, which focuses primarily on the composition of the UI, so you can use what you like elsewhere.

While these environments are great, sometimes you need just that bit more performance, or to be able to work with native UI components directly, but working in a less familiar environment might not be a good use of time. If you are familiar with React.js, it's easy to move into full native development with all your existing knowledge and tools by developing with React Native. React Native is the sister to React.js, you can use the same style and code to create an application that works directly with native components with native levels of performance, but with the ease of and rapid development you would expect.


![](http://i.imgur.com/ZsSHWXP.png)

We are happy to announce that along with our HTML5 application support, it is now possible to develop React Native applications on the Ubuntu platform. You can port existing iOS or Android React Native applications, or you can start a new application leveraging your web-dev skills.

You can find the source code for React Native Ubuntu [here][1],

To get started, follow the instructions in [README-ubuntu.md][2] and create your first application.

The Ubuntu support includes the ability to generate packages. Managed by the React Native CLI, building a snap is as easy as 'react-native package-ubuntu --snap'. It's also possible to build a click package for Ubuntu devices; meaning React Native Ubuntu apps are store ready from the start.

Over the next little while there will be blogs posts on everything you need to know about developing a React Native Application for the Ubuntu platform; creating the app, the development process, packaging and releasing to the store. There will also be some information on how to develop new reusable modules, that can add extra functionality to the runtime and be distributed as Node Package Manager (npm) modules.

Go and experiment, and see what you can create.

--------------------------------------------------------------------------------

via: https://developer.ubuntu.com/en/blog/2016/08/05/introducing-react-native-ubuntu/?utm_source=javascriptweekly&utm_medium=email

作者：[Justin McPherson][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://developer.ubuntu.com/en/blog/authors/justinmcp/
[1]: https://github.com/CanonicalLtd/react-native
[2]: https://github.com/CanonicalLtd/react-native/blob/ubuntu/README-ubuntu.md
