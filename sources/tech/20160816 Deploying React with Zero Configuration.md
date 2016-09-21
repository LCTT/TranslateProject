翻译中－－byzky001
Deploying React with Zero Configuration
========================

So you want to build an app with [React][1]? "[Getting started][2]" is easy… and then what?

React is a library for building user interfaces, which comprise only one part of an app. Deciding on all the other parts — styles, routers, npm modules, ES6 code, bundling and more — and then figuring out how to use them is a drain on developers. This has become known as [javascript fatigue][3]. Despite this complexity, usage of React continues to grow.

The community answers this challenge by sharing boilerplates. These [boilerplates][4] reveal the profusion of architectural choices developers must make. That official "Getting Started" seems so far away from the reality of an operational app.

### New, Zero-configuration Experience

Inspired by the cohesive developer experience provided by [Ember.js][5] and [Elm][6], the folks at Facebook wanted to provide an easy, opinionated way forward. They created a new way to develop React apps, `create-react-app`. In the three weeks since initial public release, it has received tremendous community awareness (over 8,000 GitHub stargazers) and support (dozens of pull requests).

`create-react-app` is different than many past attempts with boilerplates and starter kits. It targets zero configuration [[convention-over-configuration]][7], focusing the developer on what is interesting and different about their application.

A powerful side-effect of zero configuration is that the tools can now evolve in the background. Zero configuration lays the foundation for the tools ecosystem to create automation and delight developers far beyond React itself.

### Zero-configuration Deploy to Heroku

Thanks to the zero-config foundation of create-react-app, the idea of zero-config deployment seemed within reach. Since these new apps all share a common, implicit architecture, the build process can be automated and then served with intelligent defaults. So, [we created this community buildpack to experiment with no-configuration deployment to Heroku][8].

#### Create and Deploy a React App in Two Minutes

You can get started building React apps for free on Heroku.

```
npm install -g create-react-app
create-react-app my-app
cd my-app
git init
heroku create -b https://github.com/mars/create-react-app-buildpack.git
git add .
git commit -m "react-create-app on Heroku"
git push heroku master
heroku open
```

Try it yourself [using the buildpack docs][9].

### Growing Up from Zero Config

create-react-app is very new (currently version 0.2) and since its target is a crystal-clear developer experience, more advanced use cases are not supported (or may never be supported). For example, it does not provide server-side rendering or customized bundles.

To support greater control, create-react-app includes the command npm run eject. Eject unpacks all the tooling (config files and package.json dependencies) into the app's directory, so you can customize to your heart's content. Once ejected, changes you make may necessitate switching to a custom deployment with Node.js and/or static buildpacks. Always perform such project changes through a branch / pull request, so they can be easily undone. Heroku's Review Apps are perfect for testing changes to the deployment.

We'll be tracking progress on create-react-app and adapting the buildpack to support more advanced use cases as they become available. Happy deploying!



--------------------------------------------------------------------------------

via: https://blog.heroku.com/deploying-react-with-zero-configuration?c=7013A000000NnBFQA0&utm_campaign=Display%20-%20Endemic%20-Cooper%20-Node%20-%20Blog%20-%20Zero-Configuration&utm_medium=display&utm_source=cooperpress&utm_content=blog&utm_term=node

作者：[Mars Hall][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.heroku.com/deploying-react-with-zero-configuration?c=7013A000000NnBFQA0&utm_campaign=Display%20-%20Endemic%20-Cooper%20-Node%20-%20Blog%20-%20Zero-Configuration&utm_medium=display&utm_source=cooperpress&utm_content=blog&utm_term=node
[1]: https://facebook.github.io/react/
[2]: https://facebook.github.io/react/docs/getting-started.html
[3]: https://medium.com/@ericclemmons/javascript-fatigue-48d4011b6fc4
[4]: https://github.com/search?q=react+boilerplate
[5]: http://emberjs.com/
[6]: http://elm-lang.org/
[7]: http://rubyonrails.org/doctrine/#convention-over-configuration
[8]: https://github.com/mars/create-react-app-buildpack
[9]: https://github.com/mars/create-react-app-buildpack#usage
