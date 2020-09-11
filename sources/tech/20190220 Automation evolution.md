[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Automation evolution)
[#]: via: (https://leancrew.com/all-this/2019/02/automation-evolution/)
[#]: author: (Dr.Drang https://leancrew.com)

Automation evolution
======

In my experience, scripts and macros almost never end up the way they start. This shouldn’t be a surprise. Just as spending time performing a particular task makes you realize it should be automated, spending time working with the automation makes you realize how it can be improved. Contra [XKCD][3], this doesn’t mean the decision to automate a task puts you on an endless treadmill of tweaking that’s never worth the time you invest. It means you’re continuing to think about how you do things and how your methods can be improved. I have an example that I’ve been working on for years.

Two of the essential but dull parts of my job involve sending out invoices to clients and following up when those invoices aren’t paid on time. I’ve gradually built up a system to handle both of these interrelated duties. I’ve written about certain details before, but here I want to talk about how and why the system has evolved.

It started with [TextExpander][4] snippets. One was for the text of the email that accompanied the invoice when it was first sent, and it looked like this (albeit less terse):

```
Attached is invoice A for $B on project C. Payment is due on D.
```

where the A, B, C, and D were [fill-in fields][5]. Similarly, there was a snippet for the followup emails.

```
The attached invoice, X for $Y on project Z, is still outstanding
and is now E days old. Pay up.
```

While these snippets was certainly better than typing this boilerplate out again and again, they weren’t using the computer for what it’s good at: looking things up and calculating. The invoices are PDFs that came out of my company’s accounting system and contain the information for X, Y, Z, and D. The age of the invoice, E, can be calculated from D and the current date.

So after a month or two of using the snippets, I wrote an invoicing script in Python that read the invoice PDF and created an email message with all of the parts filled in. It also added a subject line and used a project database to look up the client’s email address to put in the To field. A similar script created a dunning email message. Both of these scripts could be run from the Terminal and took the invoice PDF as their argument, e.g.,

```
invoice 12345.pdf
```

and

```
dun 12345.pdf
```

I should mention that these scripts created the email messages, but they didn’t send them. Sometimes I need to add an extra sentence or two to handle particular situations, and these scripts stopped short of sending so I could do that.

It didn’t take very long for me to realize that opening a Terminal window just to run a single command was itself a waste of time. I used Automator to add Quick Action workflows that run the `invoice` and `dun` scripts to the Services menu. That allowed me to run the scripts by right-clicking on an invoice PDF file in the Finder.

This system lasted quite a while. Eventually, though, I decided it was foolish to rely on my memory (or periodic checking of my outstanding invoices) to decide when to send out the followup emails on unpaid bills. I added a section to the `invoice` script that created a reminder along with the invoicing email. The reminder went in the Invoices list of the Reminders app and was given a due date of the first Tuesday at least 45 days after the invoice date. My invoices are net 30, so 45 days seemed like a good starting time for followups. And rather than having the reminder pop up on any day of the week, I set it to Tuesday—early in the week but unlikely to be on a holiday.1

Changing the `invoice` script changed the behavior of the Services menu item that called it; I didn’t have to make any changes in Automator.

This system was the state of the art until it hit me that I could write a script that checked Reminders for every invoice that was past due and run the `dun` script on all of them, creating a series of followup emails in one fell swoop. I wrote this script as a combination of Python and AppleScript and embedded it in a [Keyboard Maestro][6] macro. With this macro in place, I no longer had to hunt for the invoices to right-click on.

A couple of weeks ago, after reading Federico Viticci’s article on [using a Mac from iOS][7], I began thinking about the hole in my followup system: I have to be at my Mac to run Keyboard Maestro. What if I’m traveling on Tuesday and want to send out followup emails from my iPhone or iPad? OK, sure, I could use Screens to connect to the Mac and run the Keyboard Maestro macro that way, but that’s very slow and clumsy over a cellular network connection, especially when trying to manipulate windows on a 27″ iMac screen as viewed through an iPhone-sized keyhole.

The obvious solution, which wasn’t obvious to me until I’d thought of and rejected a few other ideas, was to change the `dun` script to create and save the followup email. Saving the email puts it in the Drafts folder, which I can get at from all of my devices. I also changed the Keyboard Maestro macro that executes the `dun` script on every overdue invoice to run every Tuesday morning at 5:00 am. When the reminders pop up later in the day, the emails are already written and waiting for me in the Drafts folder.

Yesterday was the first “live” test of the new system. I was in an airport restaurant—nothing but the best cuisine for me—when my watch buzzed with reminders for two overdue invoices. I pulled out my phone, opened Mail, and there were the emails, waiting to be sent. In this case, I didn’t have to edit the messages before sending, but it wouldn’t have been a big deal if I had—no more difficult than writing any other email from my phone.

Am I done with this? History suggests I’m not, and I’m OK with that. By getting rid of more scutwork, I’ve made myself better at following up on old invoices, and my average time-to-collection has improved. Even XKCD would think that’s worth the effort.

--------------------------------------------------------------------------------

via: https://leancrew.com/all-this/2019/02/automation-evolution/

作者：[Dr.Drang][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://leancrew.com
[b]: https://github.com/lujun9972
[1]: https://leancrew.com/all-this/2019/02/regex-groups-and-numerals/
[2]: https://leancrew.com/all-this/2019/02/transparency/
[3]: https://xkcd.com/1319/
[4]: https://textexpander.com/
[5]: https://textexpander.com/help/desktop/fillins.html
[6]: https://www.keyboardmaestro.com/main/
[7]: https://www.macstories.net/ipad-diaries/ipad-diaries-using-a-mac-from-ios-part-1-finder-folders-siri-shortcuts-and-app-windows-with-keyboard-maestro/
