translating---geekpi

# Check your Local and Public IP address


**Your Local IP address is:**

**192.168.1.100**

Above is your local/private IP address(es) assigned to your internal hardware or virtual network card on your computer. Depending on your LAN configuration the above IP addresses may be static or dynamic. 

**In case you can't find any address above, to check your internal IP address manually on Linux with `ifconfig` or `ip` command execute:**

```
# ifconfig | grep -w inet | awk '{ print $2}'
OR
# ip a s | grep -w inet | awk '{ print $2}'
```


**Your Public IP address is:**

**123.115.72.251**

The above address is your public/external IP address assigned to you by your Internet Service Provider ( ISP ). Depending on your current plan with your ISP this IP address may be dynamic, meaning it will change every time you restart your router or it may be static which means it will never change. 

**In case you can't find any address above, to check your public IP address manually on Linux with `wget` or `curl` command execute:**
```
# echo $(wget -qO - https://api.ipify.org)
OR
# echo $(curl -s https://api.ipify.org)
```

--------------------------------------------------------------------------------

via: https://linuxconfig.org/check-your-local-and-public-ip-address

作者：[Lubos Rendek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/check-your-local-and-public-ip-address
