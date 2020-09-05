[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Build a remote management console using Python and Jupyter Notebooks)
[#]: via: (https://opensource.com/article/20/9/remote-management-jupyter)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Build a remote management console using Python and Jupyter Notebooks
======
Turn Jupyter into a remote administration console.
![Computer laptop in space][1]

Secure shell (SSH) is a powerful tool for remote administration, but it lacks some niceties. Writing a full-fledged remote administration console sounds like it would be a lot of work. Surely, someone in the open source community has already written something?

They have, and its name is [Jupyter][2]. You might think Jupyter is one of those tools data scientists use to analyze trends in ad clicks over a week or something. This is not wrong—they do, and it is a great tool for that. But that is just scratching its surface.

### About SSH port forwarding

Sometimes, there is a server that you can SSH into over port 22. There is no reason to assume you can connect to any other port. Maybe you are SSHing through another "jumpbox" server that has more access or there are host or network firewalls that restrict ports. There are good reasons to restrict IP ranges for access, of course. SSH is a secure protocol for remote management, but allowing anyone to connect to any port is quite unnecessary.

Here is an alternative: Run a simple SSH command with port forwarding to forward a local port to a _remote_ _local_ connection. When you run an SSH port-forwarding command like `-L 8111:127.0.0.1:8888`, you are telling SSH to forward your _local_ port `8111` to what the _remote_ host thinks `127.0.0.1:8888` is. The remote host thinks `127.0.0.1` is itself.

Just like on _Sesame Street_, "here" is a subtle word.

The address `127.0.0.1` is how you spell "here" to the network.

### Learn by doing

This might sound confusing, but running this is less complicated than explaining it:


```
$ ssh -L 8111:127.0.0.1:8888 moshez@172.17.0.3
Linux 6ad096502e48 5.4.0-40-generic #44-Ubuntu SMP Tue Jun 23 00:01:04 UTC 2020 x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Wed Aug  5 22:03:25 2020 from 172.17.0.1
$ jupyter/bin/jupyter lab --ip=127.0.0.1
[I 22:04:29.771 LabApp] JupyterLab application directory is /home/moshez/jupyter/share/jupyter/lab
[I 22:04:29.773 LabApp] Serving notebooks from local directory: /home/moshez
[I 22:04:29.773 LabApp] Jupyter Notebook 6.1.1 is running at:
[I 22:04:29.773 LabApp] <http://127.0.0.1:8888/?token=df91012a36dd26a10b4724d618b2e78cb99013b36bb6a0d1>
&lt;MORE STUFF SNIPPED&gt;
```

Port-forward `8111` to `127.0.0.1` and start Jupyter on the remote host that's listening on `127.0.0.1:8888`.

Now you need to understand that Jupyter is lying. It thinks you need to connect to port `8888`, but you forwarded that to port `8111`. So, after you copy the URL to your browser, but before clicking Enter, modify the port from `8888` to `8111`:

![Jupyter remote management console][3]

(Moshe Zadka, [CC BY-SA 4.0][4])

There it is: your remote management console. As you can see, there is a "Terminal" icon at the bottom. Click it to get a terminal:

![Terminal in Jupyter remote console][5]

(Moshe Zadka, [CC BY-SA 4.0][4])

You can run a command. Creating a file will show it in the file browser on the side. You can click on that file to open it in an editor that is running locally:

![Opening a file][6]

(Moshe Zadka, [CC BY-SA 4.0][4])

You can also download, rename, or delete files:

![File options in Jupyter remote console][7]

(Moshe Zadka, [CC BY-SA 4.0][4])

Clicking on the little **Up arrow** will let you upload files. Why not upload the screenshot above?

![Uploading a screenshot][8]

(Moshe Zadka, [CC BY-SA 4.0][4])

As a nice final tidbit, Jupyter lets you view the remote images directly by double-clicking on them.

Oh, right, and if you want to do systems automation using Python, you can also use Jupyter to open a notebook.

So the next time you need to remotely manage a firewalled environment, why not use Jupyter?

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/remote-management-jupyter

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_space_graphic_cosmic.png?itok=wu493YbB (Computer laptop in space)
[2]: https://jupyter.org/
[3]: https://opensource.com/sites/default/files/uploads/output_1_0.png (Jupyter remote management console)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/output_3_0.png (Terminal in Jupyter remote console)
[6]: https://opensource.com/sites/default/files/uploads/output_5_0.png (Opening a file)
[7]: https://opensource.com/sites/default/files/uploads/output_7_0.png (File options in Jupyter remote console)
[8]: https://opensource.com/sites/default/files/uploads/output_9_0.png (Uploading a screenshot)
