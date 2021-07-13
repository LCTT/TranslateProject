[#]: subject: (Use VS Code to develop in containers)
[#]: via: (https://opensource.com/article/21/7/vs-code-remote-containers-podman)
[#]: author: (Brant Evans https://opensource.com/users/branic)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Use VS Code to develop in containers
======
Create consistency to avoid problems when you have multiple developers
working on the same project.
![Women programming][1]

Coding and testing inconsistencies are a risk when you have multiple developers with different development environments working on a project. [Visual Studio Code][2] (VS Code) is an integrated development environment (IDE) that can help minimize these issues. It can be combined with containers to provide separate development environments for each application alongside a consistent development environment.

VS Code's [Remote - Containers extension][3] enables you to define a container, use that definition to build a container, and develop inside the container. This container definition can be checked into the source code repository along with the application code, which allows all developers to use the same definition to build and develop within a container.

By default, the Remote - Containers extension uses Docker to build and run the container, but it is easy to use [Podman][4] for container runtimes, and it enables using [rootless containers][5].

This article walks you through the setup to develop inside a rootless container using Podman with VS Code and the Remote - Containers extension.

### Initial configuration

Before continuing, ensure your Red Hat Enterprise Linux (RHEL) or Fedora workstation is updated with the latest errata and that VS Code and the Remote - Containers extension are installed. (See the [VS Code website][2] for more information on installing.)

Next, install Podman and its supporting packages with a simple `dnf install` command:


```
`$ sudo dnf install -y podman`
```

After you install Podman, configure VS Code to use the Podman executable (instead of Docker) for interacting with the container. Within VS Code, navigate to **File &gt; Preferences &gt; Settings** and click the **&gt;** icon next to **Extensions**. In the dropdown menu that appears, select **Remote - Containers**, and scroll down to find the **Remote &gt; Containers: Docker Path** option. In the text box, replace docker with **podman**.

![Enter "podman" in the text box][6]

(Brant Evans, [CC BY-SA 4.0][7])

Now that the configurations are done, create and open a new folder or an existing folder for the project in VS Code.

### Define the container

This tutorial uses the example of creating a container for Python 3 development.

The Remote - Containers extension can add the necessary basic configuration files to the project folder. To add these files, open the Command Pallet by entering **Ctrl+Shift+P** on your keyboard, search for **Remote-Containers: Add Development Container Configuration Files**, and select it.

![Remote-Containers: Add Development Container Configuration Files][8]

(Brant Evans, [CC BY-SA 4.0][7])

In the next pop-up, define the type of development environment you want to set up. For this example configuration, search for the **Python 3** definition and select it.

![Select Python 3 definition][9]

(Brant Evans, [CC BY-SA 4.0][7])

Next, select the version of Python that will be used in the container. Select the **3 (default)** option to use the latest version.

![Select the 3 \(default\) option][10]

(Brant Evans, [CC BY-SA 4.0][7])

The Python configuration can also install Node.js, but for this example, **uncheck Install Node.js** and click OK.

![Uncheck "Install Node.js"][11]

(Brant Evans, [CC BY-SA 4.0][7])

It will create a `.devcontainer` folder containing files named `devcontainer.json` and `Dockerfile`. VS Code automatically opens the `devcontainer.json` file so that you can customize it.

### Enable rootless containers

In addition to the obvious security benefits, one of the other reasons to run a container as rootless is that all the files created in the project folder will be owned by the correct user ID (UID) outside the container. To run the development container as a rootless container, modify the `devcontainer.json` file by adding the following lines to the end of it:


```
"workspaceMount": "source=${localWorkspaceFolder},target=/workspace,type=bind,Z",
"workspaceFolder": "/workspace",

"runArgs": ["--userns=keep-id"],
"containerUser": "vscode"
```

These options tell VS Code to mount the Workspace with the proper SELinux context, create a user namespace that maps your UID and GID to the same values inside the container, and use `vscode` as your username inside the container. The `devcontainer.json` file should look like this (don't forget the commas at the end of the lines, as indicated):

![Updated devcontainer.json file][12]

(Brant Evans, [CC BY-SA 4.0][7])

Now that you've set up the container configuration, you can build the container and open the workspace inside it. Reopen the Command Palette (with **Ctrl+Shift+P**), and search for **Remote-Containers: Rebuild and Reopen in Container**. Click on it, and VS Code will start to build the container. Now is a great time to take a break (and get your favorite beverage), as building the container may take several minutes.

![Building the container][13]

(Brant Evans, [CC BY-SA 4.0][7])

Once the container build completes, the project will open inside the container. Files created or edited within the container will be reflected in the filesystem outside the container with the proper user permissions applied to the files. Now, you can proceed with development within the container. VS Code can even bring your SSH keys and Git configuration into the container so that committing code will work just like it does when editing outside the container.

### Next steps

Now that you've completed the basic setup and configuration, you can further enhance the configuration's usefulness. For example:

  * Modify the Dockerfile to install additional software (e.g., required Python modules).
  * Use a customized container image. For example, if you're doing Ansible development, you could use Quay.io's [Ansible Toolset][14]. (Be sure to add the `vscode` user to the container image via the Dockerfile.)
  * Commit the files in the `.devcontainer` directory to the source code repository so that other developers can take advantage of the container definition for their development efforts.



Developing inside a container helps prevent conflicts between different projects by keeping the dependencies and code for each separate. You can use Podman to run containers in a rootless environment that increases security. By combining VS Code, the Remote - Containers extension, and Podman, you can easily set up a consistent environment for multiple developers, decrease setup time, and reduce bugs from differences in development environments in a secure fashion.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/vs-code-remote-containers-podman

作者：[Brant Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/branic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/collab-team-pair-programming-code-keyboard2.png?itok=WnKfsl-G (Women programming)
[2]: https://code.visualstudio.com/
[3]: https://code.visualstudio.com/docs/remote/containers
[4]: https://podman.io/
[5]: https://www.redhat.com/sysadmin/rootless-podman-makes-sense
[6]: https://opensource.com/sites/default/files/uploads/vscode-remote_podman.png (Enter "podman" in the text box)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/adddevelopmentcontainerconfigurationfiles.png (Remote-Containers: Add Development Container Configuration Files)
[9]: https://opensource.com/sites/default/files/uploads/python3.png (Select Python 3 definition)
[10]: https://opensource.com/sites/default/files/uploads/python3default.png (Select the 3 (default) option)
[11]: https://opensource.com/sites/default/files/uploads/unchecknodejs.png (Uncheck "Install Node.js")
[12]: https://opensource.com/sites/default/files/uploads/newdevcontainerjson.png (Updated devcontainer.json file)
[13]: https://opensource.com/sites/default/files/uploads/buildingcontainer.png (Building the container)
[14]: https://quay.io/repository/ansible/toolset
