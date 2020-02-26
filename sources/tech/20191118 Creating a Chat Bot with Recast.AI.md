[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Creating a Chat Bot with Recast.AI)
[#]: via: (https://opensourceforu.com/2019/11/creating-a-chat-bot-with-recast-ai/)
[#]: author: (Athira Lekshmi C.V https://opensourceforu.com/author/athira-lekshmi/)

Creating a Chat Bot with Recast.AI
======

[![][1]][2]

_According to a Gartner report from February 2018, “25 per cent of customer service and support operations will integrate virtual customer assistant (VCA) or chatbot technology across engagement channels by 2020, up from less than 2 per cent in 2017.” In the light of this, readers will find this tutorial on how the open source Recast. AI bot-creating platform works, helpful._

Chat bots, both voice based and others, have been in use for quite a while now. From chatbots that engage the user in a murder mystery game to bots which help in real estate deals and medical diagnosis, chatbots have traversed across domains.

There are many platforms which enable users to create and deploy bots. Recast.AI (now known as SAP Conversational AI after its acquisition by SAP) is a forerunner amongst these.

The cool interface, its collaborative nature and the analytics tools it provides, make it a popular choice.
As the Recast official site says, “It is an ultimate collaborative platform to build, train, deploy and monitor intelligent bots.”

![Figure 1: Setting the bot properties][3]

![Figure 2: Bot dashboard][4]

![Figure 3: Searching an intent][5]

**Building a basic bot in Recast**
Let us look at how to build a basic bot in Recast.

  1. Create an account in _<https://cai.tools.sap>_. Signing up can be done either with an email ID or with a GitHub account.
  2. Once you log in, you will land on the dashboard. Click on the + New Bot icon on the top right-hand side to create a new bot.
  3. On the next screen, you will see that there is a set of predefined skills you can select. Select Greetings for the time being (Figure 1). This bot is already trained to understand basic greetings.
  4. Provide a name for your bot. For now, since this is a very basic bot, you can have the bot crack some jokes, so let us name it Joke Bot and select the default language as English.
  5. Select Non-personal data under the data policy since you won’t be dealing with any sensitive information; then select the Public bot option and click on Create a bot.



So that’s your bot created on the Recast platform.

![Figure 4: @joke intent][6]

![Figure 5: Predefined expressions][7]

**The five stages of developing a bot**
To use the words from the official Recast blog, there are five stages in a bot’s life.

  * Training – Teaching your bot what it needs to understand
  * Building – Creating your conversational flow with the Bot Builder tool
  * Coding – Connecting your bot with external APIs or a database
  * Connecting – Shipping your bot to one or several messaging platforms
  * Monitoring – Training your bot to make it sharper and get insights on its usage



**Training a bot through intents**
You will be able to see the options to either search, fork or create an intent in the dashboard.
“An intent is a box of expressions that mean the same thing but which are constructed in different ways. Intents are the heart of your bot’s understanding. Each one of your intents represents an idea your bot is able to understand.” (from the _Recast.AI_ website)
As decided earlier, you need the bot to be able to crack jokes. So the base line is that the bot should be able to understand that the user is asking it to tell a joke; it shouldn’t be that even when the user just says, “Hi,” the bot responds with a joke – that would not be good.
So group the utterances that the user might make, like:

```
Tell me a joke.
Tell me a funny fact.
Can you crack a joke?
What’s funny today?
```

…………………

Before going on to create the intent from scratch, let us explore the Search/fork option. Type _Joke_ in the search field (Figure 3). This gives a list of intents created by users of Recast around the globe, which is public, and this is why Recast is said to be collaborative in nature. So there’s no need to create all intents from scratch, one can build upon intents already created. This brings down the effort needed to train the bot with common intents.

  * Select the first intent in the list and fork it into the bot.
  * Click on the Fork button. The intent is now added to the bot (Figure 4).
  * Click on the intent @joke, and a list of expressions which already exist in the intent will be displayed (Figure 5).
  * Add a few more expressions to it (Figure 6).



![Figure 6: Suggested expressions][8]

![Figure 7: Suggested expressions][9]

Once a few expressions are added, the bot gives suggestions like shown in Figure 7. Select a few and add them to the intent (Figure 7).
You can also tag your own custom entities to detect keywords, depending on your bot’s context.

**Skills**
A skill is a block of conversation that has a clear purpose and that your bot can execute to achieve a goal. It can be as simple as the ability to greet someone, but it can also be more complex, like giving movie suggestions based on information provided by the user.

It need not be just a one query-answer set, but rather, skills running through multiple exchanges. For example, consider a bot which helps you learn about currency exchange rates. It starts by asking the source currency, then the target currency, before giving the exact response. Skills can be combined to create complex conversational flows.
Here’s how you create a skill for the joke bot:

  * Go to the _Build_ tab. Click on the + icon to create a skill.
  * Name the skill _Joke_ (Figure 8)
  * Once created, click on the skill. You will see four tabs. _Read me, Triggers, Requirements and Actions_.
  * Navigate to the Requirements tab. You should store the information only if the intent joke is present. So, add a requirement as shown in Figure 9.



![Figure 8: Skills dashboard][10]

![Figure 9: Adding a trigger][11]

Since this is a simple use case, you needn’t consider any specific requirements in the Requirement tab but consider a case for which a response needs to be triggered only if certain keywords or entities are present – in such a case you will need ‘requirements’.

Requirements are either intents or entities that your skill needs to retrieve before executing actions. Requirements are pieces of information that are important in the conversation and that your bot can use; for example, the user’s name or a location. Once a requirement is completed, the associated value is stored in the bot’s memory for the entire conversation.

Now let us move to the Action tab to set the responses (see Figure 10).
Click on Add _new message group_. Then select _Send message_ and add a text message, which can be any joke in this case. Also, since you don’t want your bot to crack the same joke each time, you can add multiple messages which will be randomly picked each time.

![Figure 10: Adding actions][12]

![Figure 11: Adding text messages][13]

![Figure 12: Setting up webchat][14]

**Channel integrations**
Well, the success of a bot also depends upon how easily it is accessible. Recast has built-in integrations with many messaging channels such as Skype for Business, Kik Messenger, Telegram, Line, Facebook Messenger, Slack, Alexa, etc. In addition to that, Recast also provides SDKs to develop custom channels.

Also, there is a ready-to-use Web chat provided by Recast (in the Connect tab). You can customise the colour schemes, headers, bot pictures, etc. It provides you with a script tag to be injected into the page. Your interface is now up (Figure 12).

The Web chat code base is open sourced, which makes it easier for developers to play around with the look and feel, the standard response types and much more.
The dashboard provides step-by-step procedures on how to deploy the bot on various channels. The joke bot was deployed in Telegram and in Web chat, as shown in Figure 13.

![Figure 13: Webchat deployed][15]

![Figure 14: Bot deployed in Telegram][16]

![Figure 15: Multi-language bot][17]

**And there is more**
Recast supports multiple languages, Select one language as the base while creating the bot, but then you also have the option to add as many languages as you want.

The example considered here is a simple static joke bot, but actual use cases will need interaction with various systems. Recast has a Web hook feature which allows users to connect with various systems to get responses. Also, there is detailed API documentation to help leverage each independent feature of the platform.

As for analytics, Recast has a monitoring dashboard which helps you understand the accuracy of the bot and train it further.

![Avatar][18]

[Athira Lekshmi C.V][19]

The author is an open-source enthusiast.

[![][20]][21]

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/11/creating-a-chat-bot-with-recast-ai/

作者：[Athira Lekshmi C.V][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/athira-lekshmi/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/04/Build-ChatBoat.jpg?resize=696%2C442&ssl=1 (Build ChatBoat)
[2]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/04/Build-ChatBoat.jpg?fit=900%2C572&ssl=1
[3]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-1-Setting-the-bot-properties.jpg?resize=350%2C201&ssl=1
[4]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-2-Setting-the-bot-properties.jpg?resize=350%2C217&ssl=1
[5]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-3-Searching-an-intent.jpg?resize=350%2C271&ssl=1
[6]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-4-@joke-intent.jpg?resize=350%2C214&ssl=1
[7]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-5-Predefined-expressions-350x227.jpg?resize=350%2C227&ssl=1
[8]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-6-Suggested-expressions-350x197.jpg?resize=350%2C197&ssl=1
[9]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-7-Suggested-expressions-350x248.jpg?resize=350%2C248&ssl=1
[10]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-8-Skills-dashboard.jpg?resize=350%2C187&ssl=1
[11]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-9-Adding-a-trigger.jpg?resize=350%2C197&ssl=1
[12]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-10-Adding-actions.jpg?resize=350%2C175&ssl=1
[13]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-11-Adding-text-messages.jpg?resize=350%2C255&ssl=1
[14]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-12-Setting-up-webchat.jpg?resize=350%2C326&ssl=1
[15]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-13-Webchat-deployed.jpg?resize=350%2C425&ssl=1
[16]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-14-Bot-deployed-in-Telegram.jpg?resize=350%2C269&ssl=1
[17]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-15-Multi-language-bot.jpg?resize=350%2C419&ssl=1
[18]: https://secure.gravatar.com/avatar/d24503a2a0bb8bd9eefe502587d67323?s=100&r=g
[19]: https://opensourceforu.com/author/athira-lekshmi/
[20]: https://opensourceforu.com/wp-content/uploads/2019/11/assoc.png
[21]: https://feedburner.google.com/fb/a/mailverify?uri=LinuxForYou&loc=en_US
