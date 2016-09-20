Down and dirty with Windows Nano Server 2016
====

![](http://images.techhive.com/images/article/2016/04/pokes-fun-at-1164459_1280-100654917-primary.idge.jpg)

>Nano Server is a very fast, powerful tool for remotely administering Windows servers, but you need to know what you're doing

There's been a good deal of talk around the [upcoming Nano version of Windows Server 2016][1], the remote-administered, command-line version designed with private clouds and datacenters in mind. But there's also a big difference between talking about it and getting your hands into it. Let's get into the guts.

Nano has no local login, is 64-bit all the way (applications, tools, and agents), and is fast to set up, update, and restart (for the rare times it needs to restart). It's perfect for compute hosts in or out of a cluster, a storage host, a DNS server, an IIS web server, and any server-hosting applications running in a container or virtual-machine guest operating system.

A Nano Server isn't all that fun to play with: You have to know what you want to accomplish. Otherwise, you'll be looking at a remote PowerShell connection and wondering what you're supposed to do next. But if you know what you want, it's very fast and powerful.

Microsoft has provided a [quick-start guide][2] to setting up Nano Server. Here, I take the boots-on-the-ground approach to show you what it's like in the real world.

First, you have to create a .vhd virtual hard drive file. As you can see in Figure 1, I had a few issues with files not being in the right place. PowerShell errors often indicate a mistyped line, but in this case, I had to keep double-checking where I put the files so that it could use the ISO information (which has to be copied and pasted to the server you want to create the .vhd file on). Once you have everything in place, you should see it go through the process of creating the .vhd file.

![](http://images.techhive.com/images/article/2016/09/nano-server-1-100682371-large.idge.jpg)
>Figure 1: One of the many file path errors I got when trying to run the New-NanoServerImage script. Once I worked out the file-location issues, it went through and created the .vhd file (as shown here).

Next, when you create the VM in Hyper-V using the VM wizard, you need to point to an existing virtual hard disk and point to the new .vhd file you created (Figure 2).

![](http://images.techhive.com/images/article/2016/09/nano-server-2-100682368-large.idge.jpg)
>Figure 2: Connecting to a virtual hard disk (the one you created at the start).

When you start up the Nano server, you may get a memory error depending on how much memory you allocated and how much memory the Hyper-V server has left if you have other VMs running. I had to shut off a few VMs and increase the RAM until it finally started up. That was unexpected -- [Microsoft's Nano system][3] requirements say you can run it with 512MB, although it recommends you give it at least 800MB. (I ended up allocating 8GB after 1GB didn't work; I was impatient, so I didn't try increments in between.)

I finally came to the login screen, then signed in to get the Nano Server Recovery Console (Figure 3), which is essentially Nano server's terminal screen.

![](http://images.techhive.com/images/article/2016/09/nano-server-3-100682369-large.idge.jpg)
>Figure 3: The Nano Server Recovery Console.

Once I was in, I thought I was golden. But in trying to figure out a few details (how to join a domain, how to inject drivers I might not have, how to add roles), I realized that some configuration pieces would have been easier to add when I ran the New-NanoServerImage cmdlet by popping in a few more parameters.

However, once you have the server up and running, there are ways to configure it live. It all starts with a Remote PowerShell connection, as Figure 4 shows.

![](http://images.techhive.com/images/article/2016/09/nano-server-4-100682370-large.idge.jpg)
>Figure 4: Getting information from the Nano Server Recovery Console that you can use to perform a PowerShell Remote connection.

Microsoft provides direction on how to make the connection happen, but after trying four different sites, I found MSDN has the clearest (working) direction on the subject. Figure 5 shows the result.

![](http://images.techhive.com/images/article/2016/09/nano-server-5-100682372-large.idge.jpg)
>Figure 5: Making the remote PowerShell connection to your Nano Server.

Note: Once you've done the remote connection the long way, you can connect more quickly using a single line:

```
Enter-PSSession –ComputerName "192.168.0.100"-Credential ~\Administrator.
```

If you knew ahead of time that this server was going to be a DNS server or be part of a compute cluster and so on, you would have added those roles or feature packages when you were creating the .vhd image in the first place. If you're looking to do so after the fact, you'll need to make the remote PowerShell connection, then install the NanoServerPackage and import it. Then you can see which packages you want to deploy using Find-NanoServerPackage (shown in Figure 6).

![](http://images.techhive.com/images/article/2016/09/nano-server-6-100682373-large.idge.jpg)
>Figure 6: Once you have installed and imported the NanoServerPackage, you can find the one you need to get your Nano Server up and running with the roles and features you require.

I tested this out by running the DNS package with the following command: `Install-NanoServerPackage –Name Microsoft-NanoServer-DNS-Package`. Once it was installed, I had to enable it with the following command: `Enable-WindowsOptionalFeature –Online –FeatureName DNS-Server-Full-Role`.

Obviously I didn't know these commands ahead of time. I have never run them before in my life, nor had I ever enabled a DNS role this way, but with a little research I had a DNS (Nano) Server up and running.

The next part of the process involves using PowerShell to configure the DNS server. That's a completely different topic and one best researched online. But it doesn't appear to be mind-blowingly difficult once you've learned the cmdlets to use: Add a zone? Use the Add-DNSServerPrimaryZone cmdlet. Add a record in that zone? Use the Add-DNSServerResourceRecordA. And so on.

After doing all this command-line work, you'll likely want proof that any of this is working. You should be able to do a quick review of PowerShell commands and not the many DNS ones that now present themselves (using Get-Command).

But if you need a GUI-based confirmation, you can open Server Manager on a GUI-based server and add the IP address of the Nano Server. Then right-click that server and choose Manage As to provide your credentials (~\Administrator and password). Once you have connected, right-click the server in Server Manager and choose Add Roles and Features; it should show that you have DNS installed as a role, as Figure 7 shows.

![](http://images.techhive.com/images/article/2016/09/nano-server-7-100682374-large.idge.jpg)
>Figure 7: Proving through the GUI that DNS was installed.

Don't bother trying to remote-desktop into the server. There is only so much you can do through the Server Manager tool, and that isn't one of them. And just because you can confirm the DNS role doesn't mean you have the ability to add new roles and features through the GUI. It's all locked down. Nano Server is how you'll make any needed adjustments.

--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/3119770/windows-server/down-and-dirty-with-windows-nano-server-2016.html?utm_source=webopsweekly&utm_medium=email

作者：[J. Peter Bruzzese ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.infoworld.com/author/J.-Peter-Bruzzese/
[1]: http://www.infoworld.com/article/3049191/windows-server/nano-server-a-slimmer-slicker-windows-server-core.html
[2]: https://technet.microsoft.com/en-us/windows-server-docs/compute/nano-server/getting-started-with-nano-server
[3]: https://technet.microsoft.com/en-us/windows-server-docs/get-started/system-requirements--and-installation

