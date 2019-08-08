[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Sending custom emails with Python)
[#]: via: (https://opensource.com/article/19/8/sending-custom-emails-python)
[#]: author: (Brian "bex" Exelbierd https://opensource.com/users/bexelbie)

Sending custom emails with Python
======
Customize your group emails with Mailmerge, a command-line program that
can handle simple and complex emails.
![Chat via email][1]

Email remains a fact of life. Despite all its warts, it's still the best way to send information to most people, especially in automated ways that allow messages to queue for recipients.

One of the highlights of my work as the [Fedora Community Action and Impact Coordinator][2] is giving people good news about travel funding. I often send this information over email. Here, I'll show you how I send custom messages to groups of people using [Mailmerge][3], a command-line Python program that can handle simple and complex emails.

### Install Mailmerge

Mailmerge is packaged and available in Fedora, and you can install it from the command line with **sudo dnf install python3-mailmerge**. You can also install it from PyPI using **pip**, as the project's [README explains][4].

### Configure your Mailmerge files

Three files control how Mailmerge works. If you run **mailmerge --sample**, it will create template files for you. The files are:

  * **mailmerge_server.conf:** This contains the configuration details for your SMTP host to send emails. Your password is _not_ stored in this file.
  * **mailmerge_database.csv:** This holds the custom data for each email, including the recipients' email addresses.
  * **mailmerge_template.txt:** This is your email's text with placeholder fields that will be replaced using the data from **mailmerge_database.csv**.



#### Server.conf

The sample **mailmerge_server.conf** file includes several examples that should be familiar. If you've ever added email to your phone or set up a desktop email client, you've seen this data before. The big thing to remember is to update your username in the file, especially if you are using one of the example configurations.

#### Database.csv

The **mailmerge_database.csv** file is a bit more complicated. It must contain (at minimum) the recipients' email addresses and any other custom details necessary to replace the fields in your email. It is a good idea to write the **mailmerge_template.txt** file at the same time you create the fields list for this file. I find it helpful to use a spreadsheet to capture this data and export it as a CSV file when I am done. This sample file:


```
email,name,number
[myself@mydomain.com][5],"Myself",17
[bob@bobdomain.com][6],"Bob",42
```

allows you to send emails to two people, using their first name and telling them a number. This file, while not terribly interesting, illustrates an important habit: Always make yourself the first recipient in the file. This enables you to send yourself a test email to verify everything works as expected before you email the entire list.

If any of your values contain commas, you _**must**_ enclose the entire value in double-quotes (**"**). If you need to include a double-quote in a double-quoted field, use two double-quotes in a row. Quoting rules are fun, so read about [CSVs in Python 3][7] for specifics.

#### Template.txt

As part of my work, I get to share news about travel-funding decisions for our Fedora contributor conference, [Flock][8]. A simple email tells people they've been selected for travel funding and their specific funding details. One user-specific detail is how much money we can allocate for their airfare. Here is an abbreviated version of my template file (I've snipped out a lot of the text for brevity):


```
$ cat mailmerge_template.txt
TO: {{Email}}
SUBJECT: Flock 2019 Funding Offer
FROM: Brian Exelbierd &lt;[bexelbie@redhat.com][9]&gt;

Hi {{Name}},

I am writing you on behalf of the Flock funding committee.  You requested funding for your attendance at Flock.  After careful consideration we are able to offer you the following funding:

Travel Budget: {{Travel_Budget}}

&lt;&lt;snip&gt;&gt;
```

The top of the template specifies the recipient, sender, and subject. After the blank line, there's the body of the email. This email needs the recipients' **Email**, **Name**, and **Travel_Budget** from the **database.csv** file. Notice that those fields are surrounded by double curly braces (**{{** and **}}**). The corresponding **mailmerge_database.csv** looks like this:


```
$ cat mailmerge_database.csv
Name,Email,Travel_Budget
Brian,[bexelbie@redhat.com][9],1000
PersonA,[persona@fedoraproject.org][10],1500
PèrsonB,[personb@fedoraproject.org][11],500
```

Notice that I listed myself first (for testing) and there are two other people in the file. The second person, PèrsonB, has an accented character in their name; Mailmerge will automatically encode it.

That's the whole template concept: Write your email and put placeholders in double curly braces. Then create a database that provides those values. Now let's test the email.

### Test and send simple email merges

#### Do a dry-run

Start by doing a dry-run that prints the emails, with the placeholder fields completed, to the screen. By default, if you run the command **mailmerge**, it will do a dry-run of the first email:


```
$ mailmerge
&gt;&gt;&gt; encoding ascii
&gt;&gt;&gt; message 0
TO: [bexelbie@redhat.com][9]
SUBJECT: Flock 2019 Funding Offer
FROM: Brian Exelbierd &lt;[bexelbie@redhat.com][9]&gt;
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Date: Sat, 20 Jul 2019 18:17:15 -0000

Hi Brian,

I am writing you on behalf of the Flock funding committee.  You requested funding for your attendance at Flock.  After careful consideration we are able to offer you the following funding:

Travel Budget: 1000

&lt;&lt;snip&gt;&gt;

&gt;&gt;&gt; sent message 0 DRY RUN
&gt;&gt;&gt; No attachments were sent with the emails.
&gt;&gt;&gt; Limit was 1 messages.  To remove the limit, use the --no-limit option.
&gt;&gt;&gt; This was a dry run.  To send messages, use the --no-dry-run option.
```

Reviewing the first email (**message 0**, as counting starts from zero, like many things in computer science), you can see my name and travel budget are correct. If you want to review every email, enter **mailmerge --no-limit** to tell Mailmerge not to limit itself to the first email. Here's the dry-run of the third email, which shows the special character encoding:


```
&gt;&gt;&gt; message 2
TO: [personb@fedoraproject.org][11]
SUBJECT: Flock 2019 Funding Offer
FROM: Brian Exelbierd &lt;[bexelbie@redhat.com][9]&gt;
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jul 2019 18:22:48 -0000

Hi P=E8rsonB,
```

That's not an error; **P=E8rsonB** is the encoded form of **PèrsonB**.

#### Send a test message

Now, send a test email with the command **mailmerge --no-dry-run**, which tells Mailmerge to send a message to the first email on the list:


```
$ mailmerge --no-dry-run
&gt;&gt;&gt; encoding ascii
&gt;&gt;&gt; message 0
TO: [bexelbie@redhat.com][9]
SUBJECT: Flock 2019 Funding Offer
FROM: Brian Exelbierd &lt;[bexelbie@redhat.com][9]&gt;
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Date: Sat, 20 Jul 2019 18:25:45 -0000

Hi Brian,

I am writing you on behalf of the Flock funding committee.  You requested funding for your attendance at Flock.  After careful consideration we are able to offer you the following funding:

Travel Budget: 1000

&lt;&lt;snip&gt;&gt;

&gt;&gt;&gt; Read SMTP server configuration from mailmerge_server.conf
&gt;&gt;&gt;   host = smtp.gmail.com
&gt;&gt;&gt;   port = 587
&gt;&gt;&gt;   username = [bexelbie@redhat.com][9]
&gt;&gt;&gt;   security = STARTTLS
&gt;&gt;&gt; password for [bexelbie@redhat.com][9] on smtp.gmail.com:
&gt;&gt;&gt; sent message 0
&gt;&gt;&gt; No attachments were sent with the emails.
&gt;&gt;&gt; Limit was 1 messages.  To remove the limit, use the --no-limit option.
```

On the fourth to last line, you can see it prompts you for your password. If you're using two-factor authentication or domain-managed logins, you will need to create an application password that bypasses these controls. If you're using Gmail and similar systems, you can do it directly from the interface; otherwise, contact your email system administrator. This will not compromise the security of your email system, but you should still keep the password complex and secret.

When I checked my email account, I received a beautifully formatted test email. If your test email looks ready, send all the emails by entering **mailmerge --no-dry-run --no-limit**.

### Send complex emails

You can really see the power of Mailmerge when you take advantage of [Jinja2 templating][12]. I've found it useful for including conditional text and sending attachments. Here is a complex template and the corresponding database:


```
$ cat mailmerge_template.txt
TO: {{Email}}
SUBJECT: Flock 2019 Funding Offer
FROM: Brian Exelbierd &lt;[bexelbie@redhat.com][9]&gt;
ATTACHMENT: attachments/{{File}}

Hi {{Name}},

I am writing you on behalf of the Flock funding committee.  You requested funding for your attendance at Flock.  After careful consideration we are able to offer you the following funding:

Travel Budget: {{Travel_Budget}}
{% if Hotel == "Yes" -%}
Lodging: Lodging in the hotel Wednesday-Sunday (4 nights)
{%- endif %}

&lt;&lt;snip&gt;&gt;

$ cat mailmerge_database.csv
Name,Email,Travel_Budget,Hotel,File
Brian,[bexelbie@redhat.com][9],1000,Yes,visa_bex.pdf
PersonA,[persona@fedoraproject.org][10],1500,No,visa_person_a.pdf
PèrsonB,[personb@fedoraproject.org][11],500,Yes,visa_person_b.pdf
```

There are two new things in this email. First, there's an attachment. I have to send visa invitation letters to international travelers to help them come to Flock, and the **ATTACHMENT** part of the header specifies which file to attach. To keep my directory clean, I put all of them in my Attachments subdirectory. Second, it includes conditional information about a hotel, because some people receive funding for their hotel stay, and I need to include those details for those who do. This is done with the **if** construction:


```
{% if Hotel == "Yes" -%}
Lodging: Lodging in the hotel Wednesday-Sunday (4 nights)
{%- endif %}
```

This works just like an **if** in most programming languages. Jinja2 is very expressive and can do multi-level conditions. Experiment with making your life easier by including database elements that control the contents of the email. Using whitespace is important for email readability. The minus (**-**) symbols in **if** and **endif** are part of how Jinja2 controls [whitespace][13]. There are lots of options, so experiment to see what looks best for you.

Also note that I extended the database with two fields, **Hotel** and **File**. These are the values that control the inclusion of the hotel text and provide the name of the attachment. In my example, PèrsonB and I got hotel funding, while PersonA didn't.

Doing a dry-run and sending the emails is the same whether you're using a simple or a complex template. Give it a try!

You can also experiment with using conditionals (**if** … **endif**) in the header. You can, for example, have an attachment only if one is in the database, or maybe you need to change the sender's name for some emails but not others.

### Mailmerge's advantages

The Mailmerge program provides a powerful but simple method of sending lots of customized emails. Everyone gets only the information they need, and extraneous steps and details are omitted.

Even for simple group emails, I have found this method much more effective than sending one email to a bunch of people using CC or BCC. A lot of people filter their email and delay reading anything not sent directly to them. Using Mailmerge ensures that every person gets their own email. Messages will filter properly for the recipient and no one can accidentally "reply all" to the entire group.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/sending-custom-emails-python

作者：[Brian "bex" Exelbierd][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bexelbie
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_chat_communication_message.png?itok=LKjiLnQu (Chat via email)
[2]: https://docs.fedoraproject.org/en-US/council/fcaic/
[3]: https://github.com/awdeorio/mailmerge
[4]: https://github.com/awdeorio/mailmerge#install
[5]: mailto:myself@mydomain.com
[6]: mailto:bob@bobdomain.com
[7]: https://docs.python.org/3/library/csv.html
[8]: https://flocktofedora.org/
[9]: mailto:bexelbie@redhat.com
[10]: mailto:persona@fedoraproject.org
[11]: mailto:personb@fedoraproject.org
[12]: http://jinja.pocoo.org/docs/latest/templates/
[13]: http://jinja.pocoo.org/docs/2.10/templates/#whitespace-control
