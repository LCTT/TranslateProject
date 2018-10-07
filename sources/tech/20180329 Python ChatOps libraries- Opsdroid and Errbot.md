Python ChatOps libraries: Opsdroid and Errbot
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/idea_innovation_mobile_phone.png?itok=RqVtvxkd)
This article was co-written with [Lacey Williams Henschel][1].

ChatOps is conversation-driven development. The idea is you can write code that is executed in response to something typed in a chat window. As a developer, you could use ChatOps to merge pull requests from Slack, automatically assign a support ticket to someone from a received Facebook message, or check the status of a deployment through IRC.

In the Python world, the most widely used ChatOps libraries are Opsdroid and Errbot. In this month's Python column, let's chat about what it's like to use them, what each does well, and how to get started with them.

### Opsdroid

[Opsdroid][2] is a relatively young (since 2016) open source chatbot library written in Python. It has good documentation, a great tutorial, and includes plugins to help you connect to popular chat services.

#### What's built in

The library itself doesn't ship with everything you need to get started, but this is by design. The lightweight framework encourages you to enable its existing connectors (what Opsdroid calls the plugins that help you connect to chat services) or write your own, but it doesn't weigh itself down by shipping with connectors you may not need. You can easily enable existing Opsdroid connectors for:


+ The command line
+ Cisco Spark
+ Facebook
+ GitHub
+ Matrix
+ Slack
+ Telegram
+ Twitter
+ Websockets


Opsdroid calls the functions the chatbot performs "skills." Skills are `async` Python functions and use Opsdroid's matching decorators, called "matchers." You can configure your Opsdroid project to use skills from the same codebase your configuration file is in or import skills from outside public or private repositories.

You can enable some existing Opsdroid skills as well, including [seen][3], which tells you when a specific user was last seen by the bot, and [weather][4], which will report the weather to the user.

Finally, Opdroid allows you to configure databases using its existing database modules. Current databases with Opsdroid support include:


+ Mongo
+ Redis
+ SQLite


You configure databases, skills, and connectors in the `configuration.yaml` file in your Opsdroid project.

#### Opsdroid pros

**Docker support:** Opsdroid is meant to work well in Docker from the get-go. Docker instructions are part of its [installation documentation][5]. Using Opsdroid with Docker Compose is also simple: Set up Opsdroid as a service and when you run `docker-compose up`, your Opsdroid service will start and your chatbot will be ready to chat.
```
version: "3"



services:

  opsdroid:

    container_name: opsdroid

    build:

      context: .

      dockerfile: Dockerfile

```

**Lots of connectors:** Opsdroid supports nine connectors to services like Slack and GitHub out of the box; all you need to do is enable those connectors in your configuration file and pass necessary tokens or API keys. For example, to enable Opsdroid to post in a Slack channel named `#updates`, add this to the `connectors` section of your configuration file:
```
 - name: slack

    api-token: "this-is-my-token"

    default-room: "#updates"

```

You will have to [add a bot user][6] to your Slack workspace before configuring Opsdroid to connect to Slack.

If you need to connect to a service that Opsdroid does not support, there are instructions for adding your own connectors in the [docs][7].

**Pretty good docs.** Especially for a young-ish library in active development, Opsdroid's docs are very helpful. The docs include a [tutorial][8] that leads you through creating a couple of different basic skills. The Opsdroid documentation on [skills][9], [connectors][7], [databases][10], and [matchers][11] is also clear.

The repositories for its supported skills and connectors provide helpful example code for when you start writing your own custom skills and connectors.

**Natural language processing:** Opsdroid supports regular expressions for its skills, but also several NLP APIs, including [Dialogflow][12], [luis.ai][13], [Recast.AI][14], and [wit.ai][15].

#### Possible Opsdroid concern

Opsdroid doesn't yet enable the full features of some of its connectors. For example, the Slack API allows you to add color bars, images, and other "attachments" to your message. The Opsdroid Slack connector doesn't enable the "attachments" feature, so you would need to write a custom Slack connector if those features were important to you. If a connector is missing a feature you need, though, Opsdroid would welcome your [contribution][16]. The docs could use some more examples, especially of expected use cases.

#### Example usage

`hello/__init__.py`
```
from opsdroid.matchers import match_regex

import random





@match_regex(r'hi|hello|hey|hallo')

async def hello(opsdroid, config, message):

    text = random.choice(["Hi {}", "Hello {}", "Hey {}"]).format(message.user)

    await message.respond(text)

```

`configuration.yaml`
```
connectors:

  - name: websocket



skills:



  - name: hello

    repo: "https://github.com/<user_id>/hello-skill"

```

### Errbot

[Errbot][17] is a batteries-included open source chatbot. Errbot was released in 2012 and has everything anyone would expect from a mature project, including good documentation, a great tutorial, and plenty of plugins to help you connect to existing popular chat services.

#### What's built in

Unlike Opsdroid, which takes a more lightweight approach, Errbot ships with everything you need to build a customized bot safely.

Errbot includes support for XMPP, IRC, Slack, Hipchat, and Telegram services natively. It lists support for 10 other services through community-supplied backends.

#### Errbot pros

**Good docs:** Errbot's docs are mature and easy to use.

**Dynamic plugin architecture:** Errbot allow you to securely install, uninstall, update, enable, and disable plugins by chatting with the bot. This makes development and adding features easy. For the security conscious, this can all be locked down thanks to Errbot's granular permission system.

Errbot uses your plugin docstrings to generate documentation for available commands when someone types `!help`, which makes it easier to know what each command does.

**Built-in administration and security:** Errbot allows you to restrict lists of users who have administrative rights and even has fine-grained access controls. For example, you can restrict which commands may be called by specific users and/or specific rooms.

**Extensive plugin framework:** Errbot supports hooks, callbacks, subcommands, webhooks, polling, and many [more features][18]. If those aren't enough, you can even write [Dynamic plugins][19]. This feature is useful if you want to enable chat commands based on what commands are available on a remote server.

**Ships with a testing framework:** Errbot supports [pytest][20] and ships with some useful utilities that make testing your plugins easy and possible. Its "[testing your plugins][21]" docs are well thought out and provide enough to get started.

#### Possible Errbot concerns

**Initial !:** By default, Errbot commands are issued starting with an exclamation mark (`!help` and `!hello`). Some people may like this, but others may find it annoying. Thankfully, this is easy to turn off.

**Plugin metadata:** At first, Errbot's [Hello World][22] plugin example seems easy to use. However, I couldn't get my plugin to load until I read further into the tutorial and discovered that I also needed a `.plug` file, a file Errbot uses to load plugins. This is a pretty minor nitpick, but it wasn't obvious to me until I dug further into the docs.

#### Example usage

`hello.py`
```
import random

from errbot import BotPlugin, botcmd



class Hello(BotPlugin):



    @botcmd

    def hello(self, msg, args):

        text = random.choice(["Hi {}", "Hello {}", "Hey {}"]).format(message.user)

        return text

```

`hello.plug`
```
[Core]

Name = Hello

Module = hello



[Python]

Version = 2+



[Documentation]

Description = Example "Hello" plugin

```

Have you used Errbot or Opsdroid? If so, please leave a comment with your impressions on these tools.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/python-chatops-libraries-opsdroid-and-errbot

作者：[Jeff Triplett][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/laceynwilliams
[1]:https://opensource.com/users/laceynwilliams
[2]:https://opsdroid.github.io/
[3]:https://github.com/opsdroid/skill-seen
[4]:https://github.com/opsdroid/skill-weather
[5]:https://opsdroid.readthedocs.io/en/stable/#docker
[6]:https://api.slack.com/bot-users
[7]:https://opsdroid.readthedocs.io/en/stable/extending/connectors/
[8]:https://opsdroid.readthedocs.io/en/stable/tutorials/introduction/
[9]:https://opsdroid.readthedocs.io/en/stable/extending/skills/
[10]:https://opsdroid.readthedocs.io/en/stable/extending/databases/
[11]:https://opsdroid.readthedocs.io/en/stable/matchers/overview/
[12]:https://opsdroid.readthedocs.io/en/stable/matchers/dialogflow/
[13]:https://opsdroid.readthedocs.io/en/stable/matchers/luis.ai/
[14]:https://opsdroid.readthedocs.io/en/stable/matchers/recast.ai/
[15]:https://opsdroid.readthedocs.io/en/stable/matchers/wit.ai/
[16]:https://opsdroid.readthedocs.io/en/stable/contributing/
[17]:http://errbot.io/en/latest/
[18]:http://errbot.io/en/latest/features.html#extensive-plugin-framework
[19]:http://errbot.io/en/latest/user_guide/plugin_development/dynaplugs.html
[20]:http://pytest.org/
[21]:http://errbot.io/en/latest/user_guide/plugin_development/testing.html
[22]:http://errbot.io/en/latest/index.html#simple-to-build-upon
