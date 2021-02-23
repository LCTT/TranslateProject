[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Introduction to Thunderbird mail filters)
[#]: via: (https://fedoramagazine.org/introduction-to-thunderbird-mail-filters/)
[#]: author: (Richard England https://fedoramagazine.org/author/rlengland/)

Introduction to Thunderbird mail filters
======

![][1]

Everyone eventually runs into an inbox loaded with messages that they need to sort through. If you are like a lot of people, this is not a fast process. However, use of mail filters can make the task a little less tedious by letting Thunderbird pre-sort the messages into categories that reflect their source, priority, or usefulness. This article is an introduction to the creation of filters in Thunderbird.

Filters may be created for each email account you have created in Thunderbird. These are the accounts you see in the main Thunderbird folder pane shown at the left of the “Classic Layout”.

![Classic Layout][2]

There are two methods that can be used to create mail filters for your accounts. The first is based on the currently selected account and the second on the currently selected message. Both are discussed here.

### Message destination folder

Before filtering messages there has to be a destination for them. Create the destination by selecting a location to create a new folder. In this example the destination will be **Local Folders** shown in the accounts pane. Right click on **Local Folders** and select _New Folder…_ from the menu.

![Creating a new folder][3]

Enter the name of the new folder in the menu and select _Create Folder._ The mail to filter is coming from the New York Times so that is the name entered.

![Folder creation][4]

### Filter creation based on the selected account

Select the _Inbox_ for the account you wish to filter and select the toolbar menu item at _Tools &gt; Message_Filters_.

![Message_Filters menu location][5]

The _Message Filters_ menu appears and is set to your pre-selected account as indicated at the top in the selection menu labelled _Filters for:_.

![Message Filters menu][6]

Previously created filters, if any, are listed beneath the account name in the “_Filter Name”_ column. To the right of this list are controls that let you modify the filters selected. These controls are activated when you select a filter. More on this later.

Start creating your filter as follows:

  1. Verify the correct account has been pre-selected. It may be changed if necessary.
  2. Select _New…_ from the menu list at the right.



When you select _New_ you will see the _Filter Rules_ menu where you define your filter. Note that when using _New…_ you have the option to copy an existing filter to use as a template or to simply duplicate the settings.

Filter rules are made up of three things, the “property” to be tested, the “test”, and the “value” to be tested against. Once the condition is met, the “action” is performed.

![Message Filters menu][7]

Complete this filter as follows:

  1. Enter an appropriate name in the textbox labelled _Filter name:_
  2. Select the property _From_ in the left drop down menu, if not set.
  3. Leave the test set to _contains_.
  4. Enter the value, in this case the email address of the sender.



Under the _Perform these actions:_ section at the bottom, create an action rule to move the message and choose the destination.

  1. Select _Move Messages to_ from the left end of the action line.
  2. Select _Choose Folder…_ and select _Local Folders &gt; New York Times_.
  3. Select _OK_.



By default the **Apply filter when:** is set to _Manually Run_ and _Getting New Mail:_. This means that when new mail appears in the Inbox for this account the filter will be applied and you may run it manually at any time, if necessary. There are other options available but they are too numerous to be discussed in this introduction. They are, however, for the most part self explanatory.

If more than one rule or action is to be created during the same session, the “+” to the right of each entry provides that option. Additional property, test, and value entries can be added. If more than one rule is created, make certain that the appropriate option for _Match all of the following_ and _Match any of the following_ is selected. In this example the choice does not matter since we are only setting one filter.

After selecting _OK,_ the _Message Filters_ menu is displayed again showing your newly created filter. Note that the menu items on the right side of the menu are now active for _Edit…_ and _Delete._

![First filter in the Message Filters menu][8]

Also notice the message _“Enabled filters are run automatically in the order shown below”_. If there are multiple filters the order is changed by selecting the one to be moved and using the _Move to Top, Move Up, Move Down,_ or _Move to Bottom_ buttons. The order can change the destination of your messages so consider the tests used in each filter carefully when deciding the order.

Since you have just created this filter you may wish to use the _Run Now_ button to run your newly created filter on the Inbox shown to the left of the button.

### Filter creation based on a message

An alternative creation technique is to select a message from the message pane and use the _Create Filter From Message…_ option from the menu bar.

In this example the filter will use two rules to select the messages: the email address and a text string in the Subject line of the email. Start as follows:

  1. Select a message in the message page.
  2. Select the filter options on the toolbar at _Message &gt; Create Filter From Message…_.



![Create new filters from Messages][9]

The pre-selected message, highlighted in grey in the message pane above, determines the account used and _Create Filter From Message…_ takes you directly to the _Filter Rules_ menu.

![][10]

The property (_From_), test (_is_), and value (email) are pre-set for you as shown in the image above. Complete this filter as follows:

  1. Enter an appropriate name in the textbox labelled _Filter name:_. _COVID_ is the name in this case.
  2. Check that the property is _From_.
  3. Verify the test is set to _is_.
  4. Confirm that the value for the email address is from the correct sender.
  5. Select the “+” to the right of the _From_ rule to create a new filter rule.
  6. In the new rule, change the default property entry _From_ to _Subject_ using the pulldown menu.
  7. Set the test to _contains_.
  8. Enter the value text to be matched in the Email “Subject” line. In this case _COVID_.



Since we left the _Match all of the following_ item checked, each message will be from the address chosen AND will have the text _COVID_ in the email subject line.

Now use the action rule to choose the destination for the messages under the _Perform these actions:_ section at the bottom:

  1. Select _Move Messages to_ from the left menu.
  2. Select _Choose Folder…_ and select _Local Folders &gt; COVID in Scotland_. (This destination was created before this example was started. There was no magic here.)
  3. Select _OK_.



_OK_ will cause the _Message Filters_ menu to appear, again, verifying that the new filter has been created.

### The Message Filters menu

All the message filters you create will appear in the _Message Filters_ menu. Recall that the _Message Filters_ is available in the menu bar at _Tools &gt; Message Filters_.

Once you have created filters there are several options to manage them. To change a filter, select the filter in question and click on the _Edit_ button. This will take you back to the _Filter Rules_ menu for that filter. As mentioned earlier, you can change the order in which the rules are apply here using the _Move_ buttons. Disable a filter by clicking on the check mark in the _Enabled_ column.

![][11]

The _Run Now_ button will execute the selected filter immediately. You may also run your filter from the menu bar using _Tools &gt; Run Filters on Folder_ or _Tools &gt; Run Filters on Message_.

### Next step

This article hasn’t covered every feature available for message filtering but hopefully it provides enough information for you to get started. Places for further investigation are the “property”, “test”, and “actions” in the _Filter menu_ as well as the settings there for when your filter is to be run, _Archiving, After Sending,_ and _Periodically_.

### References

Mozilla: [Organize][12] [Your Messages][12] [by Using Filters][12]

MozillaZine: [Message][13] [Filters][13]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/introduction-to-thunderbird-mail-filters/

作者：[Richard England][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rlengland/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/01/Tbird_mail_filters-1-816x345.jpg
[2]: https://fedoramagazine.org/wp-content/uploads/2021/01/Image_001-1024x613.png
[3]: https://fedoramagazine.org/wp-content/uploads/2021/01/Image_New_Folder.png
[4]: https://fedoramagazine.org/wp-content/uploads/2021/01/Folder_name-1.png
[5]: https://fedoramagazine.org/wp-content/uploads/2021/01/Image_002-2-1024x672.png
[6]: https://fedoramagazine.org/wp-content/uploads/2021/01/Image_Message_Filters-1.png
[7]: https://fedoramagazine.org/wp-content/uploads/2021/01/Filter_rules_1-1.png
[8]: https://fedoramagazine.org/wp-content/uploads/2021/01/Messsage_Filters_1st_entry.png
[9]: https://fedoramagazine.org/wp-content/uploads/2021/01/Create_by_messasge.png
[10]: https://fedoramagazine.org/wp-content/uploads/2021/01/Filter_rules_2-1.png
[11]: https://fedoramagazine.org/wp-content/uploads/2021/01/Message_Filters_2nd_entry.png
[12]: https://support.mozilla.org/en-US/kb/organize-your-messages-using-filters
[13]: http://kb.mozillazine.org/Filters_%28Thunderbird%29
