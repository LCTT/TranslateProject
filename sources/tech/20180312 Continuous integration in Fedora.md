Continuous integration in Fedora
======

![](https://fedoramagazine.org/wp-content/uploads/2017/07/ci-mar2018-945x400.jpg)
Continuous Integration (CI) is the process of running tests for every change made to a project, integrated as if this were the new deliverable. If done consistently, it means that software is always ready to be released. CI is a very well established process across the entire IT industry as well as free and open source projects. Fedora has been a little behind on this, but we’re catching up. Read below to find out how.

### Why do we need this?

CI will improve Fedora all around. It provides a more stable and consistent operating system by revealing bugs as early as possible. It lets you add tests when you encounter an issue so it doesn’t happen again (avoid regressions). CI can run tests from the upstream project as well as Fedora-specific ones that test the integration of the application in the distribution.

Above all, consistent CI allows automation and reduced manual labor. It frees up our valuable volunteers and contributors to spend more time on new things for Fedora.

### How will it look?

For starters, we’ll run tests for every commit to git repositories of Fedora’s packages (dist-git). These tests are independent of the tests each of these packages run when built. However, they test the functionality of the package in an environment as close as possible to what Fedora’s users run. In addition to package-specific tests, Fedora also runs some distribution-wide tests, such as upgrade testing from F27 to F28 or rawhide.

Packages are “gated” based on test results: test failures prevent an update being pushed to users. However, sometimes tests fail for various reasons. Perhaps the tests themselves are wrong, or not up to date with the software. Or perhaps an infrastructure issue occurred and prevented the tests from running correctly. Maintainers will be able to re-trigger the tests or waive their results until the tests are updated.

Eventually, Fedora’s CI will run tests when a new pull-request is opened or updated on <https://src.fedoraproject.org>. This will give maintainers information about the impact of the proposed change on the stability of the package, and help them decide how to proceed.

### What do we have today?

Currently, a CI pipeline runs tests on packages that are part of Fedora Atomic Host. Other packages can have tests in dist-git, but they won’t be run automatically yet. Distribution specific tests already run on all of our packages. These test results are used to gate packages with failures.

### How do I get involved?

The best way to get started is to read the documentation about [Continuous Integration in Fedora][1]. You should get familiar with the [Standard Test Interface][2], which describes a lot of the terminology as well as how to write tests and use existing ones.

With this knowledge, if you’re a package maintainer you can start adding tests to your packages. You can run them on your local machine or in a virtual machine. (This latter is advisable for destructive tests!)

The Standard Test Interface makes testing consistent. As a result, you can easily add any tests to a package you like, and submit them to the maintainers in a pull-request on its [repository][3].

Reach out on #fedora-ci on irc.freenode.net with feedback, questions or for a general discussion on CI.

Photo by [Samuel Zeller][4] on [Unsplash][5]

#### Like this:

Like

Loading...

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/continuous-integration-fedora/

作者：[Pierre-Yves Chibon;Dominik Perpeet][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:http://fedoraproject.org/wiki/CI
[2]:http://fedoraproject.org/wiki/CI/Standard_Test_Interface
[3]:https://src.fedoraproject.org
[4]:https://unsplash.com/photos/77oXlGwwOw0?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[5]:https://unsplash.com/search/photos/factory-line?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
