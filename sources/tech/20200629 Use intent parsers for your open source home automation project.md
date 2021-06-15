[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use intent parsers for your open source home automation project)
[#]: via: (https://opensource.com/article/20/6/mycroft-intent-parsers)
[#]: author: (Steve Ovens https://opensource.com/users/stratusss)

Use intent parsers for your open source home automation project
======
Use Padatious, Adapt, conversational context, and dialogs to start
programming your first voice AI.
![Working from home at a laptop][1]

In [part 1][2] and [part 2][3] of this series on the [Mycroft][4] open source voice assistant, I laid the groundwork for learning how to create a skill. In [part 3][5], I walked through creating an outline for a skill and recommended creating the skill in pure Python first to ensure the methods work as intended. That way, when things go wrong, you know it is related to how your Mycroft skill is constructed and not the code itself.

In this article, you will enhance the outline from part 3 by adding:

  * Mycroft entities
  * Padatious intents
  * Adapt intents
  * Dialogs
  * Conversational contexts



The code for this project can be found in [my GitLab][6] repository.

Let's get to it!

### Improve your skill

As a reminder, the purpose of this project is to use Mycroft to add items to shopping lists in the [OurGroceries][7] app. However, this tutorial can be applied to a variety of home automation applications like turning on your lights, getting the morning weather report, or controlling your entertainment systems.

Here's what the skill's outline looks like so far:


```
from mycroft import intent_file_handler, MycroftSkill, intent_handler
from mycroft.skills.context import adds_context, removes_context

class OurGroceriesSkill(MycroftSkill):
    def __init__(self):
        MycroftSkill.__init__(self)

    # Mycroft should call this function directly when the user
    # asks to create a new item
    def create_item_on_list(self, message):
        pass

    # Mycroft should also call this function directly
    def create_shopping_list(self, message):
        pass

    # This is not called directly, but instead should be triggered
    # as part of context aware decisions
    def handle_dont_create_anyways_context(self):
        pass

    # This function is also part of the context aware decision tree
    def handle_create_anyways_context(self):
        pass

    def stop(self):
        pass

def create_skill():
    return OurGroceriesSkill()
```

As it stands, Mycroft will load the skill successfully, but it won't do anything because all the methods have the command `pass` in them. For now, ignore the `__init__(self)` method and start working with the `create_item_on_list` method. From the comments, you can see the intent is for Mycroft to call this method directly. That means that you need to declare an _intent_. How do you do that?

### Working with intents

You may have noticed that the [outline][8] `mycroft-msk` created (in the third article) has what looks like a weird function, `@intent_file_handler('ourgroceries.intent')`, above the `handle_test` method. These are special notations in Python called decorators (if you want, head over to Real Python for a [primer on Python decorators][9]). For this tutorial, it is sufficient to know that a decorator is a way to pass your function into a prebuilt function developed by Mycroft. This saves a lot of work and boilerplate code.

Recall from part three of this series that this project uses two intent parsers: Padacious and Adapt, which I described in the second article.

#### Padatious intents

So how do you know which decorator to use and where to use it? Great questions! I'll start with Padatious, which is the easier of the two to understand. If you recall from the second article, [Padatious][10] skills are _trained_ based on phrases that the skill's developer decides are relevant for the skill. As Mycroft may install many skills using the Padatious intent engine, each intent is given a score by the neural network module that Mycroft employs. Mycroft then chooses the highest-scoring intent and executes its functions.

The phrases which Mycroft will use to train the intent are placed inside a file with a `.intent` file extension. You can have multiple `.intent` files, but you must reference each file explicitly. That means if you have `create.item.intent` and `create.category.intent`, there will be no confusion about which file your variables are populated from, as you must call them by file name. As you can see in the output from `mycroft-msk`, the decorator is intuitively named `@intent_file_handler()`. Simply use the name of the file as the argument for the decorator, such as `@intent_file_handler("create.item.intent")`.

Think about what phrases someone might use to add an item to a shopping list. Since the motivating factor for this skill was using Mycroft to create a grocery list, the example code uses food-related terms, but you could use generic terms. With that said, here are some phrases you might say to add an item to your grocery list:

  * Add tomatoes to my shopping list
  * Add tomatoes to the grocery list
  * Add tomatoes to Costco list



You may choose to have some grammatically incorrect phrases as well, to account for Mycroft misunderstanding the user's voice. From the list above, what pieces of information are programmatically relevant? `tomatoes`, `shopping list`, `grocery list`, and `Costco list`. The official documentation refers to this type of object as an _entity_. You can think of an entity as a variable, if that makes more sense to you. This will become clearer later when you create an intent file. While the `mycroft-msk` command will put intents in `locale/en-us` by default, I put mine under `vocab/en-us/`. Why? Well, that's because the Adapt intent parser stores its files in `vocab`, and I prefer to keep all my intent files in the same location. My file `vocab/en-us/create.item.intent` starts with:


```
`add {Food} to my {ShoppingList}`
```

This defines the _entities_ `Food` and `ShoppingList`.

**IMPORTANT NOTE**:  Padatious entities are **not** case-sensitive, and Padatious interprets everything in lower-case. For example, `ShoppingList` will be `shoppinglist`.

Now that you have an intent, have Mycroft say a phrase containing your _entities_. Don't forget to add the intent decorator! Your new function will look like this:


```
    @intent_file_handler("create.item.intent")
    def create_item_on_list(self, message):
        """
        This function adds an item to the specified list

        :param message:
        :return: Nothing
        """
        item_to_add = message.data.get('food')
        list_name = message.data.get('shoppinglist')
        self.speak("Adding %s to %s" % (item_to_add, list_name))
```

The graphic below uses three phrases:

  * Add tomatoes to my shopping list
  * Add nails to my hardware list
  * Add buns to groceries list



Mycroft will not be able to figure out the intent behind one of these phrases. Can you guess which one and why?

![Mycroft processing intent][11]

(Steve Ovens, [CC BY-SA 4.0][12])

In case the video was a little too fast for you, here's the answer: Mycroft can't process the phrase `add buns to groceries list` because it is missing the keyword `my`. The intent explicitly says `add {Food} to my {ShoppingList}`. Without the word `my` as input from the user, the Padatious intent for the skill scores low and, therefore, Mycroft doesn't choose this skill to handle the request. The simplest solution is to add a new line to your intent file, like this:


```
`add {Food} to {ShoppingList}`
```

Mycroft can often reload skills when it detects a change, but I prefer to restart Mycroft's skills section to make sure. I also clear the logs a lot during testing, so I run the following command to do everything in one line:


```
` ./stop-mycroft.sh skills;sudo rm -f /var/log/mycroft/skills.log; ./start-mycroft.sh skills; mycroft-cli-client`
```

Testing the skill after Mycroft restarts yields the following results:


```
add buns to groceries list                                                                
 &gt;&gt; Adding buns to groceries list
```

In case it is not clear, any response Mycroft makes in the `mycroft-cli-client` is prefixed by `>>` to indicate its response. Now that you have a basic intent, go back and review the objectives for this skill from part 3 of this series:

  1. Login/authenticate
  2. Get a list of the current grocery lists
  3. Add item to a specific grocery list
  4. Add item to a category under a specific list
  5. Be able to add a category (since OurGroceries allows items to be placed in categories)



Ignore the first two items for now—those deal with the online portion of the project, and you need to complete the other objectives first. For the third item, you have a basic intent that, in theory, should be able to take the _entities_ Mycroft detects and turn them into variables in the Python code. For the fourth item on the list, add two new lines to your intent:


```
add {Food} to my {ShoppingList} under {Category}
add {Food} to {ShoppingList} under {Category}
```

You also need to alter your function slightly. When using the Padatious intent parser, _entities_ are returned via the `message.data.get()` function. This function will return `None` if the entity is undefined. In other words, if Mycroft cannot parse `{Category}` from an `utterance` the user makes, `message.data.get()` will return `None`. With this in mind, here is some quick test code:


```
    @intent_file_handler("create.item.intent")
    def create_item_on_list(self, message):
        """
        This function adds an item to the specified list

        :param message:
        :return: Nothing
        """
        item_to_add = message.data.get('food')
        list_name = message.data.get('shoppinglist')
        category_name = message.data.get('category')
        if category_name is None:
            self.speak("Adding %s to %s" % (item_to_add, list_name))
        else:
            self.speak("Adding %s to %s under the category %s" % (item_to_add, list_name, category_name))
```

Here is an example that tests these code changes:

![Mycroft testing code changes][13]

(Steve Ovens, [CC BY-SA 4.0][12])

In the example, Mycroft responds with `>> Adding nails to my hardware list under`, yet the only time you told Mycroft to say the word `under` is when `category_name` has a value other than `None`. This is because the intent parser is interpreting the word `under` as a part of the entity `ShoppingList`. Because the utterance had the word `my` in it, the sentences that matched the utterances could have been either:

  1. `add {Food} to my {ShoppingList}`
or
  2. `add {Food} to my {ShoppingList} under {Category}`



Since the user did not state the `{Category}`, Mycroft selected the first statement as the most correct. This means that anything _after_ the word `my` would be cast into the entity `{ShoppingList}`. Since, therefore, `{Category}` is `None`, Mycroft speaks, "Adding nails to my hardware list under" instead of "Adding nails to my hardware list under None."

Padatious may seem a bit simplistic at first. For each phrase you need Mycroft to match, simply add a line to the intent file. However, with a complex intent, you could have several dozen lines attempting to cover all the different utterances you want to handle.

There is another option that may be worth considering. Padatious intents support _parentheses expansion_. This means you can use a form of _OR_ statements to cut down on the number for lines in an intent. Going back, the example is trying to account for three cases:


```
add {Food} to my {ShoppingList}
add {Food} to my {ShoppingList} under {Category}
add {Food} to the {ShoppingList}
add {Food} to the {ShoppingList} under {Category}
add {Food} to {ShoppingList}
add {Food} to {ShoppingList} under {Category}
```

If you want to rewrite this using an _OR_ statement to combine the `my` and `the` keywords, you could write:


```
add {Food} to ( my | the ) {ShoppingList}
add {Food} to ( my | the ) {ShoppingList} under {Category}
add {Food} to {ShoppingList}
add {Food} to {ShoppingList} under {Category}
```

This removes two lines from the intent. Parentheses expansion also supports making something optional. So, if you want to make `the` and `my` optional and thus allow for the phrase `add {Food} to {ShoppingList}`, it would look like:


```
add {Food} to ( | my | the ) {ShoppingList}
add {Food} to ( | my | the ) {ShoppingList} under {Category}
```

This simple change covers all three scenarios (once you restart the Mycroft skills subsystem). You can go a step further and condense this into a single line if you wish:


```
`add {Food} to ( | my | the ) {ShoppingList} ( | under {Category})`
```

**Note:** For easier readability, use white spaces in your intent parentheses expansion.

To summarize the important points about Padatious intent parsing:

  * You have to give several examples of phrases for Mycroft to come up with the correct match.
  * Padatious intents use entities such as `{Food}` to identify object values that can be retrieved from your Python code.
  * Entities are _always lower-case_ regardless of how you declare them in the intent file.
  * If an entity cannot be parsed from an utterance, its value is `None`.
  * The decorator for Padatious intents is `@intent_file_handler('my.intent.file.intent')`.



#### Adapt intents

Unlike Padatious intents, where you specify entities in the intent file, the Adapt intent parser works with a series of keywords that work in combination with regular expression (regex) files to attempt to capture an entity. You would use Adapt over Padatious when you:

  1. Expect the utterance to be complex and the more robust parsing of regex is required
  2. Want or need Mycroft to be context-aware
  3. Need intents to be as lightweight as possible



That said, the `voc` files Adapt uses are quite flexible. They can include a single word (as shown in the [official documentation][14]), or they can include the start of a sentence you want to react to.

As one goal of this project is to have Mycroft create a new shopping list in the OurGroceries app, I wanted to add in some rudimentary checking so that the user is informed if a list with a similar name exists and asked if they still want to create a new list. This should cut down on list duplication and misplacement of items.

Mock up some code, and then you can deal with the vocab and regex files. While you could use Pytest or similar unit tests to assert specific values, for the sake of simplicity, you will create a list called "shopping list." The Python mock function will look like this:


```
    def create_shopping_list(self, message):
        fake_list = ["shopping list"]
        self.new_shopping_list_name = message.data['ListName'].lower()
        for current_shopping_list in fake_list:
            try:
                if self.new_shopping_list_name in current_shopping_list:
                    if self.new_shopping_list_name == current_shopping_list:
                        self.speak("The shopping list %s already exists" % self.new_shopping_list_name )
                        break
                    else:
                        self.speak("I found a similar naming list called %s" % current_shopping_list)
                        # This hands off to either handle_dont_create_anyways_context or handle_create_anyways_context
                        # to make a context aware decision
                        self.speak("Would you like me to add your new list anyways?", expect_response=True)
                        break
                else:
                    self.speak("Ok creating a new list called %s" % self.new_shopping_list_name)
            except Exception as ex:
                print(ex)
                pass
```

Notice I am using a `forloop` to iterate over `fake_list`. That is because, in theory, multiple lists will be returned from the OurGroceries app. Also note the `try/except` block; I have given a general pass on the exception because, right now, I don't know what kind of exceptions I may run into. As you use and debug your code, you can tighten this up a bit.

Another line to note is:


```
`self.speak("Would you like me to add your new list anyways?", expect_response=True) `
```

This bit of code will have Mycroft prompt the user for a response and store the result. I'll talk more about this bit of code in the conversational contexts section.

#### Regular expressions, entities, and Adapt intents

Now you have some pseudo code, but you need to add the decorator for Mycroft to action your code. You need to create three files for this to work: two vocab files and one regex file. The regex file, which I will name `add.shopping.list.rx`, looks like this:


```
start a new list called (?P&lt;ListName&gt;.*)
create a new list called (?P&lt;ListName&gt;.*)
add a new list called (?P&lt;ListName&gt;.*)
```

You could make this a one-liner, but for simplicity's sake, keep it as three lines. Note this strange-looking notation: `(?P<ListName>.*)`. This is the part of the code that captures and creates the entity. The entity, in this case, is called `ListName`. For checking your syntax, I recommend [Pythex][15]. It is very helpful when I am debugging my regex (I'm pretty terrible at regex).

**IMPORTANT NOTE:** Adapt intents are case sensitive.

#### Adapt and vocab files

Now that your regex includes the full sentences you expect, create your two vocab files. The first file is called `CreateKeyword.voc`. As you can surmise from the file name, all the words you want to associate with the `create` action should reside here. This file is very simple:


```
start a new
create a new
add a new
```

In the documentation, you will often see only a single word per line. However, due to some Mycroft default skills using `start` and `create`, I need to add words so that Mycroft will pick my skill appropriately.

The second file is even easier. It's called `ListKeyword.voc` and has a single word in it:


```
`list`
```

With these files defined, you can now construct your decorator:


```
`@intent_handler(IntentBuilder('CreateShoppingIntent').require('CreateKeyword').require('ListKeyword').require("ListName"))`
```

The first argument in the `IntentBuilder` is `'CreateShoppingIntent'`; this is the name of the intent and is completely optional. If you want to leave this blank, you can. The `require` section is a bit confusing. When it comes to keywords, the argument for `require` is the name of the file without the file extension. In this case, one of the files is called `ListKeyword.voc`, so the argument being passed into `require` is just `'ListKeyword'`.

While you can name your vocab files anything you want, I highly recommend using the word `Keyword` in the file so that when you are building your `intent_handler` decorator, it is clear what you are requiring.

If `require` is actually an entity from a regex file, the argument for `require` is the name of the entity as you defined it in the regex. If your regex was `start a new list called (?P<NewList>.*)`, then you would write `require('NewList')`.

Restart the Mycroft skills subsection and try it out. You should see this in the Mycroft command-line interface:


```
 add a new list called hardware
 &gt;&gt; Ok creating a new list called hardware
 
 create a new list called hardware
 &gt;&gt; Ok creating a new list called hardware
 
 start a new list called hardware
 &gt;&gt; Ok creating a new list called hardware
```

#### Conversational contexts

Great, it works! Now add the following decorator to your function:


```
`@adds_context("CreateAnywaysContext")`
```

This decorator is tied to the [conversational context][16] that Mycroft supports. Conversational contexts are essentially where you can speak normally to Mycroft and it will understand your meaning. For example, you could ask: "Who was John Quincy Adams?" After Mycroft responds, saying something like "John Quincy Adams was the sixth president of the United States," you could ask: "How old was he when he became president?" If you ask the second question first, Mycroft has no way to know who the pronoun _he_ refers to. However, in the context of this conversation, Mycroft understands that _he_ refers to John Quincy Adams.

Getting back to creating a conversational context, the argument for its decorator is the name of the context. This example calls the context `CreateAnywaysContext` and hence, the full decorator is `@adds_context("CreateAnywaysContext")`. This mock method is now complete. However, you now need to add two simple methods to handle the user's feedback. You can simplify the grocery list skill by requiring either a yes or a no answer. Create a `YesKeyword.voc` and a `NoKeyword.voc`, and place the words `yes` and `no` in them, respectively.

Now create two more methods in your Python:


```
@intent_handler(IntentBuilder('DoNotAddIntent').require("NoKeyword").require('CreateAnywaysContext').build())
@removes_context("CreateAnywayscontext")
def handle_dont_create_anyways_context(self):
    """
    Does nothing but acknowledges the user does not wish to proceed
    Uses dont.add.response.dialog
    :return:
    """
    self.speak_dialog('dont.add.response')

    @intent_handler(IntentBuilder('AddAnywaysIntent').require("YesKeyword").require('CreateAnywaysContext').build())
@removes_context("CreateAnywayscontext")
def handle_create_anyways_context(self):
    """
    If the user wants to create a similarly named list, it is handled here
    Uses do.add.response.dialog
    :return:
    """
    self.speak_dialog('do.add.response')
```

There are two things here you have not seen so far:

  1. `@remove_context`
  2. `self.speak_dialog`



If a method that requires `CreateAnywaysContext` is called, the decorator `@remove_context` gets rid of the context so that Mycroft does not accidentally action a context more than once. While multiple contexts can be applied to a method, this project will not use them.

#### Dialogs

Dialogs are files that have several prebuilt responses that Mycroft can pick from. These dialogs are stored in `dialog/{language tag}/`, and the language tag is based on the IETF standard. Examples can be found on [Venea.net][17] in the IETF LanguageTag column.

Mycroft picks randomly from the list of sentences in a specified dialog file. Why would you use a dialog file instead of implementing `self.speak` in Python? The answer is simple: When you create and use a dialog file, you do not have to change the Python code to support other languages.

For example, if the dialog file called `dont.add.response.dialog` exists under `en-us` with the following content:


```
Ok... exiting
Gotcha I won't add it
Ok I'll disregard it
Make up your mind!
```

You could also create `de-de/dont.add.response.dialog` with the following content:


```
Ok... Beenden
Erwischt Ich werde es nicht hinzufügen
Ok, ich werde es ignorieren.
Entscheiden Sie sich!
```

In your Python code, you would use `self.speak_dialog('dont.add.response')` to randomly select one of the answers for Mycroft to use. If a user's Mycroft language is set to German, Mycroft will automatically select the correct dialog and play the dialog in German instead of English.

To wrap up this section, create two files under `dialog/en-us`. For `dont.add.response.dialog`, use the same content as in the above example. For `do.add.response.dialog`, use:


```
Ok adding it now
Sure thing
Yup yup yup
```

At this point in this project, your tree should look something like this:


```
├── dialog
│   └── en-us
│       ├── do.add.response.dialog
│       └── dont.add.response.dialog
├── __init__.py
├── regex
│   └── en-us
│       └── ADD.shopping.list.rx
└── vocab
    └── en-us
        ├── CREATE.item.intent
        ├── CreateKeyword.voc
        └── ListKeyword.voc
```

Note that I created the files by hand. If you used the `mycroft-msk create` method, you might have `locale` directories, `settingsmeta.yaml,` or other artifacts.

#### Wrapping up

We've covered a lot so far. You have implemented the Padatious intent parser to, theoretically, add a new item to a list, whether or not you put it under a category. You have also used the Adapt intent parser to add a new category. You used conversational context to prompt the user for confirmation if a similar list already exists. Finally, you learned the concept of dialogs as a way for Mycroft to provide varied confirmation responses to the user.

Currently, the code looks like:


```
from mycroft import intent_file_handler, MycroftSkill, intent_handler
from mycroft.skills.context import adds_context, removes_context
from adapt.intent import IntentBuilder

class OurGroceriesSkill(MycroftSkill):
    def __init__(self):
        MycroftSkill.__init__(self)

    # Mycroft should call this function directly when the user
    # asks to create a new item
    @intent_file_handler("create.item.intent")
    def create_item_on_list(self, message):
        """
        This function adds an item to the specified list

        :param message:
        :return: Nothing
        """
        item_to_add = message.data.get('food')
        list_name = message.data.get('shoppinglist')
        category_name = message.data.get('category')
        if category_name is None:
            self.speak("Adding %s to %s" % (item_to_add, list_name))
        else:
            self.speak("Adding %s to %s under the category %s" % (item_to_add, list_name, category_name))

    # Mycroft should also call this function directly
    @intent_handler(IntentBuilder('CreateShoppingIntent').require('CreateKeyword').require('ListKeyword').require("ListName"))
    def create_shopping_list(self, message):
        fake_list = ["shopping list"]
        self.new_shopping_list_name = message.data['ListName'].lower()
        for current_shopping_list in fake_list:
            try:
                if self.new_shopping_list_name in current_shopping_list:
                    if self.new_shopping_list_name == current_shopping_list:
                        self.speak("The shopping list %s already exists" % self.new_shopping_list_name )
                        break
                    else:
                        self.speak("I found a similar naming list called %s" % current_shopping_list)
                        # This hands off to either handle_dont_create_anyways_context or handle_create_anyways_context
                        # to make a context aware decision
                        self.speak("Would you like me to add your new list anyways?", expect_response=True)
                        break
                else:
                    self.speak("Ok creating a new list called %s" % self.new_shopping_list_name)
            except AttributeError:
                pass
    # This is not called directly, but instead should be triggered
    # as part of context aware decisions
    @intent_handler(IntentBuilder('DoNotAddIntent').require("NoKeyword").require('CreateAnywaysContext').build())
    @removes_context("CreateAnywayscontext")
    def handle_dont_create_anyways_context(self):
        """
        Does nothing but acknowledges the user does not wish to proceed
        Uses dont.add.response.dialog
        :return:
        """
        self.speak_dialog('dont.add.response')

    # This function is also part of the context aware decision tree
    @intent_handler(IntentBuilder('AddAnywaysIntent').require("YesKeyword").require('CreateAnywaysContext').build())
    @removes_context("CreateAnywayscontext")
    def handle_create_anyways_context(self):
        """
        If the user wants to create a similarly named list, it is handled here
        Uses do.add.response.dialog
        :return:
        """
        self.speak_dialog('do.add.response')

    def stop(self):
        pass

def create_skill():
    return OurGroceriesSkill()
```

 

In the next article, I will go into logging, getting settings from the web UI, and continuing to fill out the skill into something more useful.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/mycroft-intent-parsers

作者：[Steve Ovens][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stratusss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://opensource.com/article/20/6/open-source-voice-assistant
[3]: https://opensource.com/article/20/6/mycroft
[4]: https://mycroft.ai/
[5]: https://opensource.com/article/20/6/outline-mycroft-voice-assistant-skill
[6]: https://gitlab.com/stratus-ss/mycroft-ourgroceries-skill
[7]: https://www.ourgroceries.com/overview
[8]: https://opensource.com/article/20/6/outline-mycroft-voice-assistant-skill#decorator
[9]: https://realpython.com/primer-on-python-decorators/
[10]: https://mycroft-ai.gitbook.io/docs/skill-development/user-interaction/intents/padatious-intents
[11]: https://opensource.com/sites/default/files/uploads/mycroft-padatious-first-intent.gif (Mycroft processing intent)
[12]: https://creativecommons.org/licenses/by-sa/4.0/
[13]: https://opensource.com/sites/default/files/uploads/mycroft-padatious-category1.gif (Mycroft testing code changes)
[14]: https://mycroft-ai.gitbook.io/docs/skill-development/user-interaction/intents/adapt-intents
[15]: https://pythex.org/
[16]: https://mycroft-ai.gitbook.io/docs/skill-development/user-interaction/conversational-context
[17]: https://www.venea.net/web/culture_code
