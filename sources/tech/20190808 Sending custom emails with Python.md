[#]: collector: (lujun9972)
[#]: translator: (silentdawn-zz)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Sending custom emails with Python)
[#]: via: (https://opensource.com/article/19/8/sending-custom-emails-python)
[#]: author: (Brian "bex" Exelbierd https://opensource.com/users/bexelbie)

使用Python发送定制邮件
======
Mailmerge是一个可以处理简单邮件和复杂邮件的命令行程序，可以用它定制组邮件。
![Chat via email][1]

电子邮件还是生活的一部分，尽管有种种不足，它仍然是大多数人发送信息的最佳方式，尤其是在以自动化方式实现受众信息队列的场景。

我作为[Fedora社区行动和影响协调员 ][2]的工作之一就是给人们发送旅行基金相关的好消息，我经常通过电子邮件做这些事。这里，我将给你展示如何使用[Mailmerge][3]，一个可以处理简单邮件及复杂邮件的命令行程序，向一组人发送定制信息。

### 安装 Mailmerge

在Fedora中，Mailmerge已经打包可用，你可以通过在命令行中运行**sudo dnf install python3-mailmerge**来安装它。你还可以使用**pip**命令从PyPi中安装，具体可以参阅该项目的[说明][4]。

### 配置 Mailmerge

三个配置文件控制着Mailmerge的工作模式。运行**mailmerge --sample**，将生成配置文件模板。这些文件包括：

  * **mailmerge_server.conf:** 这里保存着SMTP服务端邮件发送相关详细配置，但你的密码 _不_ 在这里保存。
  * **mailmerge_database.csv:** 这里保存每封邮件的个性数据，包括收件人电子邮件地址。
  * **mailmerge_template.txt:** 这里保存电子邮件的文本，文本中包含占位符，这些占位符会使用**mailmerge_database.csv**中的数据替换。



#### Server.conf

配置模板文件**mailmerge_server.conf**包含几个大家应该很熟悉的例子。如果你曾经往手机上添加过电子邮件或者设置过桌面电子邮件客户端，那你就应该看到过这些数据。需要提醒的是要记得把你的用户名更新到这个文件中，尤其是在你使用模板所提供的配置时。

#### Database.csv

**mailmerge_database.csv**这个配置文件稍微有点复杂。最起码要将邮件接收者的电子邮件地址保存在这里，其它在电子邮件中任何需要替换的定制信息也要保存在这里。推荐在创建本文件的占位符列表时，同步步编辑**mailmerge_template.txt**文件。我发现一个有效的做法是，使用电子表格软件录入这些数据，完成后导出为CSV文件。使用下面的示例文件:


```
email,name,number
[myself@mydomain.com][5],"Myself",17
[bob@bobdomain.com][6],"Bob",42
```

你可以使用他们的名字，给这两个人发送邮件，并各告诉他们一个数字。这个示例文件虽然不是特别有趣，但应用了一个重要的原则，那就是：始终让自己处于邮件接收列表的首位。这样你可以在向列表全员发送邮件之前，先给自己发送一个测试邮件，以验证邮件的效果是否如你预期。

任何包含半角逗号的值，都 _**必须**_ 以半角双引号(**"**)封闭。如果恰好在半角双引号封闭的区域需要有一个半角双引号，那就在同一行中使用两个半角双引号。引用的定义规则比较有趣，去[Python3中的CSV][7]一探究竟吧。

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

你还可以尝试在邮件头中使用条件判断(**if** … **endif**). You can, for example, have an attachment only if one is in the database, or maybe you need to change the sender's name for some emails but not others.

### Mailmerge的优点

Mailmerge是用来批量发送个性化邮件的简洁而高效的工具。每个人只接受到他需要的信息，其它额外的操作和细节都是透明的。

我还发现，即使是在发送简单的集团邮件时，相对于使用CC或者BCC向一组受众发送一封邮件，采用Mailmerge也是非常高效的。很多人使用了邮件过滤，那些不是直接发给他们的邮件，他们一律不会立刻处理。使用Mailmerge保证了每名受众接收到的就是自己的邮件。所有的信息会对接收者进行正确过滤，再也不会有人无意间回复到整个邮件组。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/sending-custom-emails-python

作者：[Brian "bex" Exelbierd][a]
选题：[lujun9972][b]
译者：[silentdawn-zz](https://github.com/译者ID)
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
