Automating upstream releases with release-bot
======
All you need to do is file an issue into your upstream repository and release-bot takes care of the rest.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_robots.png?itok=TOZgajrd)

If you own or maintain a GitHub repo and have ever pushed a package from it into [PyPI][1] and/or [Fedora][2], you know it requires some additional work using the Fedora infrastructure.

Good news: We have developed a tool called [release-bot][3] that automates the process. All you need to do is file an issue into your upstream repository and release-bot takes care of the rest. But let’s not get ahead of ourselves. First, let’s look at what needs to be set up for this automation to happen. I’ve chosen the **meta-test-family** upstream repository as an example.

### Configuration files for release-bot

There are two configuration files for release-bot: **conf.yaml** and **release-conf.yaml**.

#### conf.yaml

**conf.yaml** must be accessible during bot initialization; it specifies how to access the GitHub repository. To show that, I have created a new git repository named **mtf-release-bot** , which contains **conf.yaml** and the other secret files.

```
repository_name: name
repository_owner: owner
# https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/
github_token: xxxxxxxxxxxxxxxxxxxxxxxxx
# time in seconds during checks for new releases
refresh_interval: 180
```

For the meta-test-family case, the configuration file looks like this:

```
repository_name: meta-test-family
repository_owner: fedora-modularity
github_token: xxxxxxxxxxxxxxxxxxxxx
refresh_interval: 180
```

#### release-conf.yaml

**release-conf.yaml** must be stored [in the repository itself][4]; it specifies how to do GitHub/PyPI/Fedora releases.

```
# list of major python versions that bot will build separate wheels for
python_versions:
  - 2
   - 3
# optional:
changelog:
  - Example changelog entry
   - Another changelog entry
# this is info for the authorship of the changelog
# if this is not set, person who merged the release PR will be used as an author
author_name: John Doe
author_email: johndoe@example.com
# whether to release on fedora. False by default
fedora: false
# list of fedora branches bot should release on. Master is always implied
fedora_branches:
  - f27
```

For the meta-test-family case, the configuration file looks like this:

```
python_versions:
-       2
fedora: true
fedora_branches:
-       f29
-       f28
trigger_on_issue: true
```

#### PyPI configuration file

The file **.pypirc** , stored in your **mtf-release-bot** private repository, is needed for uploading the new package version into PyPI:

```
[pypi]
username = phracek
password = xxxxxxxx
```

Private SSH key, **id_rsa** , that you configured in [FAS][5].

The final structure of the git repository, with **conf.yaml** and the others, looks like this:

```
$ ls -la
total 24
drwxrwxr-x   3 phracek phracek 4096 Sep 24 12:38 .
drwxrwxr-x. 20 phracek phracek 4096 Sep 24 12:37 ..
-rw-rw-r--   1 phracek phracek  199 Sep 24 12:26 conf.yaml
drwxrwxr-x   8 phracek phracek 4096 Sep 24 12:38 .git
-rw-rw-r--   1 phracek phracek 3243 Sep 24 12:38 id_rsa
-rw-------   1 phracek phracek   78 Sep 24 12:28 .pypirc
```

### Requirements

**requirements.txt** with both versions of pip. You must also set up your PyPI login details in **$HOME/.pypirc** , as described in the `-k/–keytab`. Also, **fedpkg** requires that you have an SSH key in your keyring that you uploaded to FAS.

### How to deploy release-bot

Releasing to PyPI requires the [wheel package][6] for both Python 2 and Python 3, so installwith both versions of pip. You must also set up your PyPI login details in, as described in the [PyPI documentation][7] . If you are releasing to Fedora, you must have an active [Kerberos][8] ticket while the bot runs, or specify the path to the Kerberos keytab file with. Also,requires that you have an SSH key in your keyring that you uploaded to FAS.

There are two ways to use release-bot: as a Docker image or as an OpenShift template.

#### Docker image

Let’s build the image using the `s2i` command:

```
$ s2i build $CONFIGURATION_REPOSITORY_URL usercont/release-bot app-name
```

where `$CONFIGURATION_REPOSITORY_URL` is a reference to the GitHub repository, like _https:// <GIT_LAB_PATH>/mtf-release-conf._

Let’s look at Docker images:

```
$ docker images
REPOSITORY                                      TAG                     IMAGE ID                CREATED                 SIZE
mtf-release-bot                         latest                  08897871e65e            6 minutes ago           705 MB
docker.io/usercont/release-bot                  latest                  5b34aa670639            9 days ago              705 MB
```

Now let’s try to run the **mtf-release-bot** image with this command:

```
$ docker run mtf-release-bot
---> Setting up ssh key...
Agent pid 12
Identity added: ./.ssh/id_rsa (./.ssh/id_rsa)
12:21:18.982 configuration.py  DEBUG  Loaded configuration for fedora-modularity/meta-test-family
12:21:18.982 releasebot.py      INFO   release-bot v0.4.1 reporting for duty!
12:21:18.982 github.py          DEBUG  Fetching release-conf.yaml
12:21:37.611 releasebot.py      DEBUG  No merged release PR found
12:21:38.282 releasebot.py      INFO   Found new release issue with version: 0.8.5
12:21:42.565 releasebot.py      DEBUG  No more open issues found
12:21:43.190 releasebot.py      INFO   Making a new PR for release of version 0.8.5 based on an issue.
12:21:46.709 utils.py           DEBUG  ['git', 'clone', 'https://github.com/fedora-modularity/meta-test-family.git', '.']

12:21:47.401 github.py          DEBUG  {"message":"Branch not found","documentation_url":"https://developer.github.com/v3/repos/branches/#get-branch"}
12:21:47.994 utils.py           DEBUG  ['git', 'config', 'user.email', 'the.conu.bot@gmail.com']

12:21:47.996 utils.py           DEBUG  ['git', 'config', 'user.name', 'Release bot']

12:21:48.009 utils.py           DEBUG  ['git', 'checkout', '-b', '0.8.5-release']

12:21:48.014 utils.py           ERROR  No version files found. Aborting version update.
12:21:48.014 utils.py           WARNING No CHANGELOG.md present in repository
[Errno 2] No such file or directory: '/tmp/tmpmbvb05jq/CHANGELOG.md'
12:21:48.020 utils.py           DEBUG  ['git', 'commit', '--allow-empty', '-m', '0.8.5 release']
[0.8.5-release 7ee62c6] 0.8.5 release

12:21:51.342 utils.py           DEBUG  ['git', 'push', 'origin', '0.8.5-release']

12:21:51.905 github.py          DEBUG  No open PR's found
12:21:51.905 github.py          DEBUG  Attempting a PR for 0.8.5-release branch
12:21:53.215 github.py          INFO   Created PR: https://github.com/fedora-modularity/meta-test-family/pull/243
12:21:53.216 releasebot.py      INFO   I just made a PR request for a release version 0.8.5
12:21:54.154 github.py          DEBUG  Comment added to PR: I just made a PR request for a release version 0.8.5
 Here's a [link to the PR](https://github.com/fedora-modularity/meta-test-family/pull/243)
12:21:54.154 github.py          DEBUG  Attempting to close issue #242
12:21:54.992 github.py          DEBUG  Closed issue #242
```

As you can see, release-bot automatically closed the following issue, requesting a new upstream release of the meta-test-family: [https://github.com/fedora-modularity/meta-test-family/issues/243][9].

In addition, release-bot created a new PR with changelog. You can update the PR—for example, squash changelog—and once you merge it, it will automatically release to GitHub, and PyPI and Fedora will start.

You now have a working solution to easily release upstream versions of your package into PyPi and Fedora.

#### OpenShift template

Another option to deliver automated releases using release-bot is to deploy it in OpenShift.

The OpenShift template looks as follows:

```
kind: Template
apiVersion: v1
metadata:
  name: release-bot
  annotations:
    description: S2I Relase-bot image builder
    tags: release-bot s2i
    iconClass: icon-python
labels:
  template: release-bot
  role: releasebot_application_builder
objects:
  - kind : ImageStream
    apiVersion : v1
    metadata :
        name : ${APP_NAME}
        labels :
          appid : release-bot-${APP_NAME}
  - kind : ImageStream
    apiVersion : v1
    metadata :
      name : ${APP_NAME}-s2i
      labels :
        appid : release-bot-${APP_NAME}
    spec :
      tags :
        - name : latest
          from :
            kind : DockerImage
            name : usercont/release-bot:latest
         #importPolicy:
         #  scheduled: true
  - kind : BuildConfig
    apiVersion : v1
    metadata :
      name : ${APP_NAME}
      labels :
        appid : release-bot-${APP_NAME}
    spec :
      triggers :
        - type : ConfigChange
        - type : ImageChange
      source :
        type : Git
        git :
          uri : ${CONFIGURATION_REPOSITORY}
          contextDir : ${CONFIGURATION_REPOSITORY}
        sourceSecret :
          name : release-bot-secret
      strategy :
        type : Source
        sourceStrategy :
          from :
            kind : ImageStreamTag
            name : ${APP_NAME}-s2i:latest
      output :
        to :
          kind : ImageStreamTag
          name : ${APP_NAME}:latest
  - kind : DeploymentConfig
    apiVersion : v1
    metadata :
      name: ${APP_NAME}
      labels :
        appid : release-bot-${APP_NAME}
    spec :
      strategy :
        type : Rolling
      triggers :
         - type : ConfigChange
         - type : ImageChange
           imageChangeParams :
             automatic : true
             containerNames :
               - ${APP_NAME}
             from :
               kind : ImageStreamTag
               name : ${APP_NAME}:latest
      replicas : 1
      selector :
        deploymentconfig : ${APP_NAME}
      template :
        metadata :
          labels :
            appid: release-bot-${APP_NAME}
            deploymentconfig : ${APP_NAME}
        spec :
          containers :
            - name : ${APP_NAME}
              image : ${APP_NAME}:latest
              resources:
                requests:
                  memory: "64Mi"
                  cpu: "50m"
                limits:
                  memory: "128Mi"
                  cpu: "100m"

parameters :
  - name : APP_NAME
    description : Name of application
    value :
    required : true
  - name : CONFIGURATION_REPOSITORY
    description : Git repository with configuration
    value :
    required : true
```

The easiest way to deploy the **mtf-release-bot** repository with secret files into OpenShift is to use the following two commands:

```
$ curl -sLO https://github.com/user-cont/release-bot/raw/master/openshift-template.yml
```

In your OpenShift instance, deploy the template by running the following command:

```
oc process -p APP_NAME="mtf-release-bot" -p CONFIGURATION_REPOSITORY="git@<git_lab_path>/mtf-release-conf.git" -f openshift-template.yml | oc apply
```

### Summary

See the [example pull request][10] in the meta-test-family upstream repository, where you'll find information about what release-bot released. Once you get to this point, you can see that release-bot is able to push new upstream versions into GitHub, PyPI, and Fedora without heavy user intervention. It automates all the steps so you don’t need to manually upload and build new upstream versions of your package.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/upstream-releases-pypi-fedora-release-bot

作者：[Petr Stone Hracek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/phracek
[b]: https://github.com/lujun9972
[1]: https://pypi.org/
[2]: https://getfedora.org/
[3]: https://github.com/user-cont/release-bot
[4]: https://github.com/fedora-modularity/meta-test-family
[5]: https://admin.fedoraproject.org/accounts/
[6]: https://pypi.org/project/wheel/
[7]: https://packaging.python.org/tutorials/distributing-packages/#create-an-account
[8]: https://web.mit.edu/kerberos/
[9]: https://github.com/fedora-modularity/meta-test-family/issues/238
[10]: https://github.com/fedora-modularity/meta-test-family/pull/243
