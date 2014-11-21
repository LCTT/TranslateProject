    Vic020

Postfix tips and Troubleshooting Commands
================================================================================
Here’s a list of stuff I user everyday and other email admins will also be using, Let me know if I missed anything

List/Print current mail queue

    # postqueue –p

    # mailq

If it’s a huge que, you can pipe it with tail

    # mailq | tail

Flush the queue

    # postqueue -f

Schedule immediate delivery of all mail that is queued for the named as domain.come.

    # postqueue -s domain.com

TO delete all queue

    # postsuper -d ALL

To delete a particular message

    # postsuper -d messageid

Reque the mail or resend particular mail

    #postfix -r msgid

To find mail version

    #postconf -d mail_version
    mail_version = 2.6.6

You can also follow the steps in the link below which is the most simple and well explained documentation available with regards to Configuring postfix.

[Postfix Configuration - ][1]

--------------------------------------------------------------------------------

via: http://techarena51.com/index.php/postfix-configuration-and-explanation-of-parameters/

作者：[Leo G][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://techarena51.com/
[1]:http://www.apricot.net/apricot2004/doc/cd_content/24th%20February%202004/04%20-%20TTF%20Anti%20Spam%20&%20Anti%20Net%20Abuse%20-%20Suresh%20Ramasubramaniam/Devdas%20Bhagat.pdf
