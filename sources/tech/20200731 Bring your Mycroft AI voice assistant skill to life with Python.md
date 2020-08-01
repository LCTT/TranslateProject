[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bring your Mycroft AI voice assistant skill to life with Python)
[#]: via: (https://opensource.com/article/20/7/mycroft-voice-skill)
[#]: author: (Steve Ovens https://opensource.com/users/stratusss)

Bring your Mycroft AI voice assistant skill to life with Python
======
Put the final polishes on your Mycroft skill by managing dependencies,
debugging, collecting user-specific data, and getting everything into
your Python code.
![Hands on a keyboard with a Python book ][1]

In the first two articles of this series on [Mycroft][2], an open source, privacy-focused digital voice assistant, I covered the [background behind voice assistants][3] and some of Mycroft's [core tenets][4]. In Part 3, I started [outlining the Python code][5] required to provide some basic functionality to a skill that adds items to [OurGroceries][6], a grocery list app. And in Part 4, I talked about the different types of [intent parsers][7] (and when to use each) and expanded the Python code so Mycroft could provide audible feedback while working through the skill.

In this fifth article, I will walk through the remaining sections required to build this skill. I'll talk about project dependencies, logging output for debugging purposes, working with the Mycroft web UI for setting values (such as usernames and passwords), and how to get this information into your Python code.

### Dealing with project dependencies

There are generally three sources for project dependencies when writing a Mycroft skill:

  * Python packages from [PyPI][8]
  * System-level packages pulled from a repository
  * Other Mycroft skills



There are a couple of ways to deal with dependencies in Mycroft. You can use "requirements" files, or you can use the `manifest.yml` file.

Since most of the skills in the Mycroft store use requirement files, I will merely touch on the `manifest.yml` file. The `manifest.yml` file is pretty straightforward. There is a `dependencies:` section, and under this are three options: `python:`, `system:`, and `skill:`. Under each heading, you should specify the names of required dependencies. An example file could look like this:


```
dependencies:
  # Pip dependencies on PyPI
   python:
    - requests
     - gensim

   system:
    # For simple packages, this is all that is necessary
     all: pianobar piano-dev

   # Require the installation of other skills before installing this skill
   skill:
    - my-other-skill
```

However, since the majority of skills use requirement files, I'll use that option for this project, so you can use it as an example for other skills you may wish to use or create.

In Python, the `requirements.txt` file, which lists all the Python dependencies a project requires, is very common. This file is pretty simple; it can either be a list of packages or a list with specific versions. I will specify a minimal version with some code I submitted to the `ourgroceries` project. There are three options for this project's `requirements.txt`:

  * `ourgroceries==1.3.5`: Specifies that the package must be version 1.3.5
  * `ourgroceries>=1.3.5`: Specifies that the package must be version 1.3.5 or higher
  * `ourgroceries`: Allows any version of the package



My `requirements.txt` uses `ourgroceries>=1.3.5` to allow for future updates. Following this same logic, your `requirements.txt` could list different packages instead of specifying a single package.

The entirety of my `requirements.txt` file is one line:


```
`ourgroceries>=1.3.5`
```

You can also opt to use `requirements.sh`. This is a shell script that can be used to install packages, download modules from Git, or do any number of things. This file executes while installing a new skill. The [Zork skill][9] has an example of a `requirements.sh` script. However, while you can use this, if you want to submit your skill to the store, the `requirements.sh` will be scrutinized fairly heavily to mitigate security issues.

### Debug your skill

There are a couple of ways to debug your skill. You can use the Mycroft logger, or you can use standard Python debugging tools. Both methods are available in the Mycroft command-line interface (CLI), which is very handy for debugging.

#### Use Mycroft logger

To get started with the Mycroft logger, you just need to have the `MycroftSkill` imported because logger is part of the base class. This means that as long as you are working inside the class for your skill, logger is available. For example, the following code demonstrates how to create a very basic skill with a log entry:


```
from mycroft import MycroftSkill

class MyFakeSkill(MycroftSkill):
                def __init__(self):
                self.log.info("Skill starting up")

def create_skill():
                return MyFakeSkill()
```

Logger has all the log levels you might expect:

  * **debug:** Provides the highest level of detail but is _not_ logged by default
  * **info:** Provides general information when a skill is running as expected; it is always logged
  * **warning:** Indicates something is wrong, but it is not fatal
  * **error:** Fatal problems; they are displayed in red in the CLI
  * **exception:** Similar to errors except they include stack traces



Along with showing in the CLI, logger writes to `skills.log`. The file's location varies depending on how you installed Mycroft. Common locations are `/var/log/mycroft/skills.log`, `~/snap/mycroft/common/logs/skills.log`, and `/var/opt/mycroft/skills.log`.

There may be times when you want to use the Mycroft logger outside the instantiated class. For example, if you have some global functions defined outside the class, you can import `LOG` specifically:


```
from mycroft import MycroftSkill
from mycroft.util import LOG

def my_global_funct():
                LOG.info("This is being logged outside the class")

class MyFakeSkill(MycroftSkill):
                def __init__(self):
                self.log.info("Skill starting up")

def create_skill():
                return MyFakeSkill()
```

#### Use Python's debugging tools

If you want something that stands out more, you can use the built-in Python `print()` statements to debug. I have found that there are occasions where the Mycroft logger is slow to produce output. Other times, I just want something that jumps out at me visually. In either case, I prefer using `print()` statements when I am debugging outside an IDE.

Take the following code, for example:


```
if category_name is None:
    self.log.info("---------------&gt; Adding %s to %s" % (item_to_add, list_name))
    print("-------------&gt; Adding %s to %s" % (item_to_add, list_name))
```

This produces the following output in the `mycroft-cli-client`:


```
~~~~ings:104 | Skill settings successfully saved to /opt/mycroft/skills/fallback-wolfram-alpha.mycroftai/settings.json
~~~~1 | mycroft.skills.mycroft_skill.mycroft_skill:handle_settings_change:272 | Updating settings for skill AlarmSkill
~~~~save_settings:104 | Skill settings successfully saved to /opt/mycroft/skills/mycroft-alarm.mycroftai/settings.json
 10:50:38.528 | INFO     | 51831 | ConfigurationSkill | Remote configuration updated
 10:50:43.862 | INFO     | 51831 | OurGroceriesSkill | ---------------&gt; Adding hot dogs to my shopping
\---------------&gt; Adding hot dogs to my shopping
~~~~7.654 | INFO     | 51831 | mycroft.skills.skill_loader:reload:108 | ATTEMPTING TO RELOAD SKILL: ourgroceries-skill
~~~~831 | mycroft.skills.skill_loader:_execute_instance_shutdown:146 | Skill ourgroceries-skill shut down successfully
```

I find that, as the text scrolls, it is much easier to visually identify a print statement that does not have the uniform header of the other messages. This is a personal preference and not meant as any sort of recommendation for programming best practices.

### Get input from users

Now that you know how to see output from your skill, it's time to get some environment-specific information from your users. In many cases, your skill will need some user information to function properly. Most of the time, this is a username and password. Often, this information is required for the skill to initialize properly.

#### Get user input with internet-connected Mycroft

If your Mycroft device has a connection to the internet, you can use Mycroft's web UI to enter user information. Log into <https://account.mycroft.ai> and navigate to the [skills][10] section. Once you have configured your skill correctly, you will see something like this:

![Mycroft Web UI][11]

Here, you can discover which devices have your skill installed. In my case, there are two devices: `Arch Pi4` and `Asus`. There are also input text boxes to get information from the user.

This interface is created automatically if you have configured Mycroft's Settings file. You have two choices for file types: you can create a `settingsmeta.yaml` or a `settingsmeta.json`. I prefer the YAML syntax, so that is what I used for this project. Here is my `settingsmeta.yaml` for this skill:


```
skillMetadata:
  sections:
  - name: OurGroceries Account
    fields:
    - type: label
      label: "Provide your OurGroceries username/password and then Connect with the button below."
    - name: user_name
      type: text
      label: username
      value: ''
    - name: password
      type: password
      label: Ourgroceries password
      value: ''
    - name: default_list
      type: text
      label: Default Shopping List
      value: ''
```

The structure of this file is pretty easy to understand. Each file must start with a `skillsMetadata` heading. Next, there is a `sections` heading. Every new section is denoted by `- name:`, which is YAML syntax for an item on a list. Above, there is only a single section called `OurGroceries Account`, but you can have as many sections as you want.

Fields are used to both convey and store information. A field can be as simple as a label, which can provide an instruction to the user. More interesting for this skill, however, are the `text` and `password` fields. Text fields allow the user to view what they are typing and are displayed in plain text. This is suitable for non-sensitive information. Password fields are not specific to passwords but are intended to hide sensitive information. After the users enter their information and click the `save` button, Mycroft replaces the `settings.json` file created the first time the skill initializes. The new file contains the values the user input in the web UI. The skill will also use this file to look up credentials and other information. If you are having problems using the correct values in your skill, take a look at the `settings.json` file for proper naming of variables and whether or not values are being stored in the JSON file.

#### Get user input with offline Mycroft

As you may have surmised, without internet connectivity, it is more difficult to receive information from end users. There are only a few options. First, you could write your skill such that, on the first run, it prompts the user for the information your skill requires. You could then write this out to `settings.json` if you wish to use the built-in settings parser, or you could write this to a file of your choice and your skill could handle the parsing. Be aware that if you write to `settings.json`, there is a chance that this file could be overwritten if Mycroft re-initializes your skill.

Another method is having static values in a `settings.json` or another file that is stored with the project. This has some obvious security implications, but if your repository is secure, this is a viable option.

The third and final option is to enable the user to edit the file directly. This could be done through Network File System (NFS) or [Samba][12] file sharing protocols, or you could simply grant the appropriate permissions to a secure shell (SSH) user who could use any Unix editor to make changes.

Since this project requires access to the internet, I will not explore these options. If you have questions, you can always engage the community on [Mattermost][13].

### Access settings from your skill

Provided that the other parts in the chain are working (i.e., the users updated their settings via the web UI, and Mycroft updated `settings.json` based on those settings), using user-provided settings is easy to understand.

As I mentioned in the [third article][5] (where I discussed the `__init__` and `initialize` methods), it is impossible to retrieve values from `settings.json` with the `__init__(self)` method. Therefore, you must use another method to handle the settings. In my case, I created an appropriately named `_create_initial_grocery_connection` method:


```
def _create_initial_grocery_connection(self):
    """
    This gets the username/password from the config file and gets the session cookie
    for any interactions
    :return: None
    """
    self.username = self.settings.get('user_name')
    self.password = self.settings.get('password')
    self.ourgroceries_object = OurGroceries(self.username, self.password)
    asyncio.run(self.ourgroceries_object.login())
```

As you can see, you can extract information from `settings.json` by using `self.settings.get()`. The only thing to note is that the value you pass in _must_ match the name in `settingsmeta.yaml`. In this case, because I am not using the username or password outside this method, I could have opted to not make these variables part of the class scope (i.e., I could have called them `password` instead of `self.password`). This is because I am setting the `ourgroceries_object` to the class scope, and it contains all the information required for the rest of the skill to function.

### Wrapping up

Voice assistants are expanding into a multi-million (if not -billion) dollar business and some analysts think a majority of homes in the next few years will have one (or more). With Apple, Google, Facebook, and others frequently in the news for privacy violations, not to mention the constant stream of data breaches reported, it is important to have an open source, privacy-focused alternative to the big players. Mycroft puts your privacy first, and its small but dedicated team of contributors is making inroads into the most common scenarios for voice assistants.

This series dove into the nitty-gritty of skill development, talking about the importance of thinking things through before you start and having a good outline. Knowing where you are going in the big picture helps you organize your code. Breaking the tasks down into individual pieces is also a key part of your strategy. Sometimes, it's a good idea to write bits or significant chunks outside the Mycroft skill environment to ensure that your code will work as expected. This is not necessary but can be a great starting point for people who are new to skill development.

The series also explored intent parsers and how to understand when to use each one. The [Padatious][14] and [Adapt][15] parsers each have strengths and weaknesses.

  * Padatious intents rely on phrases and entities within those phrases to understand what the user is attempting to accomplish, and they are often the default used for Mycroft skills.
  * On the other hand, Adapt uses regular expressions to accomplish similar goals. When you need Mycroft to be context-aware, Adapt is the only way to go. It is also extremely good at parsing complex utterances. However, you need to take great care when using regular expressions, or you will end up with unexpected results.



I also covered the basics of dealing with a project. It's an important step in complex skill development to ensure that a skill has all the proper dependencies to work. Ensuring maximum portability is paramount for a skill, and dependency resolution is a key part of that, as your skill may not work properly with unsatisfied dependencies.

Finally, I explained how to get skill-specific settings from users, whether the device is internet-connected or not. Which method you choose really depends on your use case.

While it was not my aim to provide an encyclopedia of Mycroft skill development, by working through this series, you should have a very solid foundation for developing most skills you want to create. I hope the concrete examples in this series will show you how to handle the majority of tasks you may want to accomplish during skill development. I didn't go line-by-line through the whole skill but the code is hosted on [GitLab][16] if you'd like to explore it further. Comments and questions are always welcome. I am very much still learning and growing as a fledgling Mycroft developer, so hit me up on [Twitter][17] or the [Mycroft Mattermost][18] instance, and let's learn together!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/mycroft-voice-skill

作者：[Steve Ovens][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stratusss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd (Hands on a keyboard with a Python book )
[2]: https://mycroft.ai/
[3]: https://opensource.com/article/20/6/open-source-voice-assistant
[4]: https://opensource.com/article/20/6/mycroft
[5]: https://opensource.com/article/20/6/mycroft-voice-assistant-skill
[6]: https://www.ourgroceries.com/overview
[7]: https://opensource.com/article/20/6/mycroft-intent-parsers
[8]: https://pypi.org/
[9]: https://github.com/forslund/white-house-adventure/blob/6eba5df187bc8a7735b05e93a28a6390b8c6f40c/requirements.sh
[10]: https://home.mycroft.ai/skills
[11]: https://opensource.com/sites/default/files/mycroft_skills_webui.png (Mycroft Web UI)
[12]: https://www.samba.org/
[13]: https://chat.mycroft.ai/community/channels/skills
[14]: https://mycroft-ai.gitbook.io/docs/skill-development/user-interaction/intents/padatious-intents
[15]: https://mycroft-ai.gitbook.io/docs/skill-development/user-interaction/intents/adapt-intents
[16]: https://gitlab.com/stratus-ss/mycroft-ourgroceries-skill
[17]: https://twitter.com/linuxovens
[18]: https://chat.mycroft.ai/community/channels/town-square
