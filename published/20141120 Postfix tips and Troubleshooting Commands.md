Postfix 技巧和故障排除命令
================================================================================
这里是一些我每天用的命令，当然，其他的email管理员也会使用，因此我写下来，以防我忘记。

列出/打印当前邮件队列

    # postqueue –p

    # mailq

如果队列太长，可以使用tail管道读取。

    # mailq | tail

清理队列

    # postqueue -f

立即投递某domain.com域名的所有邮件

    # postqueue -s domain.com

删除所有队列

    # postsuper -d ALL

删除指定的消息

    # postsuper -d messageid

重新排队邮件或者重新发送指定邮件

    #postfix -r msgid

查找邮件版本

    #postconf -d mail_version
    mail_version = 2.6.6

你也可以查看下面的连接，这个连接有很多例子和不错的可用的解释文档，可以用来配置postfix.

[Postfix Configuration][1]

--------------------------------------------------------------------------------

via: http://techarena51.com/index.php/postfix-configuration-and-explanation-of-parameters/

作者：[Leo G][a]
译者：[Vic020](http://www.vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://techarena51.com/
[1]:http://www.apricot.net/apricot2004/doc/cd_content/24th%20February%202004/04%20-%20TTF%20Anti%20Spam%20&%20Anti%20Net%20Abuse%20-%20Suresh%20Ramasubramaniam/Devdas%20Bhagat.pdf
