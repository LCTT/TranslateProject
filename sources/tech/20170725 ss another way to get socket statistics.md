    Vic020

ss: another way to get socket statistics
============================================================

### Share or save

In an earlier blog post I mentioned **ss**, another tool that comes with the  _iproute2_  package and allows you to query statistics about sockets. The same thing that can be done with **netstat**, with the added benefit that it is typically a little bit faster, and shorter to type.

Just **ss **by default will display much the same thing as netstat, and can be similarly passed options to limit the output to just what you want. For instance:

```
$ ss -t
State       Recv-Q Send-Q       Local Address:Port                        Peer Address:Port
ESTAB       0      0                127.0.0.1:postgresql                     127.0.0.1:48154
ESTAB       0      0            192.168.0.136:35296                      192.168.0.120:8009
ESTAB       0      0            192.168.0.136:47574                     173.194.74.189:https
```

[…]

**ss -t **shows just TCP connections. **ss -u **can be used to show UDP connections, **-l **will show only listening ports, and things can be further filtered to just the information you want.

I have not tested all the possible options, but you can even forcibly close sockets with **-K**.

One place where **ss** really shines though is in its filtering capabilities. Let’s list all connections with a source port of 22 (ssh):

```
$ ss state all sport = :ssh
Netid State      Recv-Q Send-Q     Local Address:Port                      Peer Address:Port
tcp   LISTEN     0      128                    *:ssh                                  *:*
tcp   ESTAB      0      0          192.168.0.136:ssh                      192.168.0.102:46540
tcp   LISTEN     0      128                   :::ssh                                 :::*
```

And if I want to show only connected sockets (everything but  _listening_  or  _closed_ ):

```
$ ss state connected sport = :ssh
Netid State      Recv-Q Send-Q     Local Address:Port                      Peer Address:Port
tcp   ESTAB      0      0          192.168.0.136:ssh                      192.168.0.102:46540
```

Similarly, you can have it list all connections to a specific host or range; in this case, using the 74.125.0.0/16 subnet, which apparently belongs to Google:

```
$ ss state all dst 74.125.0.0/16
Netid State      Recv-Q Send-Q     Local Address:Port                      Peer Address:Port
tcp   ESTAB      0      0          192.168.0.136:33616                   74.125.142.189:https
tcp   ESTAB      0      0          192.168.0.136:42034                    74.125.70.189:https
tcp   ESTAB      0      0          192.168.0.136:57408                   74.125.202.189:https
```

This is very much the same syntax as for  _iptables_ , so if you’re familiar with that already, it will be quite easy to pick up. You can also install the  _iproute2-doc_  package, and look in  _/usr/share/doc/iproute2-doc/ss.html_  for the full documentation.

Try it for yourself! You’ll see how well it works. If anything, I’m glad for the fewer characters this makes me type.

--------------------------------------------------------------------------------

via: https://insights.ubuntu.com/2017/07/25/ss-another-way-to-get-socket-statistics/

作者：[ Mathieu Trudel-Lapierre  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.ubuntu.com/author/mathieu-trudel-lapierre/
[1]:https://insights.ubuntu.com/author/mathieu-trudel-lapierre/
