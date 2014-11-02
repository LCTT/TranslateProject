Linux有问必答：如何显示Linux网桥的MAC学习表
================================================================================

> **问题**：我想要检查一下我用brctl工具创建的Linux网桥的MAC地址学习状态。请问，我要怎样才能查看Linux网桥的MAC学习表（或者转发表）？

Linux网桥是网桥的软件实现，这是Linux内核的内核部分。与硬件网桥相类似，Linux网桥维护了一个2层转发表（也称为MAC学习表，转发数据库，或者仅仅称为FDB），它跟踪记录了MAC地址与端口的对应关系。当一个网桥在端口N收到一个包时（源MAC地址为X），它在FDB中记录为MAC地址X可以从端口N到达。这样的话，以后当网桥需要转发一个包到地址X时，它就可以从FDB查询知道转发到哪里。构建一个FDB常常称之为“MAC学习”或仅仅称为“学习”过程。

你可以使用以下命令来检查Linux网桥当前转发表或MAC学习表。

    $ sudo brctl showmacs <bridge-name>

![](https://farm4.staticflickr.com/3856/14963353726_8971873948_z.jpg)

该命令将显示一个学习到的MAC地址与关联端口的列表。各个条目都有一个相关的附于其上的老化计时器，因此转发条目可以在一定时间后刷新，以使MAC学习表更新到最新。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/show-mac-learning-table-linux-bridge.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
