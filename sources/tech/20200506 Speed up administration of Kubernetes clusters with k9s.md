[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Speed up administration of Kubernetes clusters with k9s)
[#]: via: (https://opensource.com/article/20/5/kubernetes-administration)
[#]: author: (Jessica Cherry https://opensource.com/users/cherrybomb)

Speed up administration of Kubernetes clusters with k9s
======
Check out this cool terminal UI for Kubernetes administration.
![Dogs playing chess][1]

Usually, my articles about Kubernetes administration are full of kubectl commands for administration for your clusters. Recently, however, someone pointed me to the [k9s][2] project for a fast way to review and resolve day-to-day issues in Kubernetes. It's been a huge improvement to my workflow and I'll show you how to get started in this tutorial. 

Installation can be done on a Mac, in Windows, and Linux. Instructions for each operating system can be found [here][2]. Be sure to complete installation to be able to follow along.

I will be using Linux and Minikube, which is a lightweight way to run Kubernetes on a personal computer. Install it following [this tutorial][3] or by using the [documentation][4].

### Setting the k9s configuration file

Once you've installed the k9s app, it's always good to start with the help command.


```
$ k9s help
K9s is a CLI to view and manage your Kubernetes clusters.

Usage:
  k9s [flags]
  k9s [command]

Available Commands:
  help        Help about any command
  info        Print configuration info
  version     Print version/build info

Flags:
  -A, --all-namespaces                 Launch K9s in all namespaces
      --as string                      Username to impersonate for the operation
      --as-group stringArray           Group to impersonate for the operation
      --certificate-authority string   Path to a cert file for the certificate authority
      --client-certificate string      Path to a client certificate file for TLS
      --client-key string              Path to a client key file for TLS
      --cluster string                 The name of the kubeconfig cluster to use
  -c, --command string                 Specify the default command to view when the application launches
      --context string                 The name of the kubeconfig context to use
      --demo                           Enable demo mode to show keyboard commands
      --headless                       Turn K9s header off
  -h, --help                           help for k9s
      --insecure-skip-tls-verify       If true, the server's caCertFile will not be checked for validity
      --kubeconfig string              Path to the kubeconfig file to use for CLI requests
  -l, --logLevel string                Specify a log level (info, warn, debug, error, fatal, panic, trace) (default "info")
  -n, --namespace string               If present, the namespace scope for this CLI request
      --readonly                       Disable all commands that modify the cluster
  -r, --refresh int                    Specify the default refresh rate as an integer (sec) (default 2)
      --request-timeout string         The length of time to wait before giving up on a single server request
      --token string                   Bearer token for authentication to the API server
      --user string                    The name of the kubeconfig user to use

Use "k9s [command] --help" for more information about a command.
```

As you can see, there is a lot of functionality we can configure with k9s. The only step we need to take place to get off the ground is to write a configuration file. The **info** command will point us to where the application is looking for it.


```
$ k9s info
 ____  __.________
|    |/ _/   __   \\______
|      &lt; \\____    /  ___/
|    |  \   /    /\\___ \
|____|__ \ /____//____  &gt;
        \/            \/

Configuration:   /Users/jess/.k9s/config.yml
Logs:            /var/folders/5l/c1y1gcw97szdywgf9rk1100m0000gn/T/k9s-jess.log
Screen Dumps:    /var/folders/5l/c1y1gcw97szdywgf9rk1100m0000gn/T/k9s-screens-jess
```

 By default, k9s expects a configuration file and will fail to run without one. The command will return without any message, but if we look at the log file we see an error.


```
$ tail -1 /var/folders/5l/c1y1gcw97szdywgf9rk1100m0000gn/T/k9s-mbbroberg.log
10:56AM FTL Unable to connect to api server error="Missing or incomplete configuration info.  Please point to an existing, complete config file:\n\n  1. Via the command-line flag --kubeconfig\n  2. Via the KUBECONFIG environment variable\n  3. In your home directory as ~/.kube/config\n\nTo view or setup config directly use the 'config' command."
```

To add a file, make the directory if it doesn't already exist and then add one.


```
$ mkdir -p ~/.k9s/
$ touch ~/.k9s/config.yml
```

For this introduction, we will use the default config.yml recommendations from the k9s repository. The maintainers note that this format is subject to change, so we can [check here][5] for the latest version.


```
k9s:
  refreshRate: 2
  headless: false
  readOnly: false
  noIcons: false
  logger:
    tail: 200
    buffer: 500
    sinceSeconds: 300
    fullScreenLogs: false
    textWrap: false
    showTime: false
  currentContext: minikube
  currentCluster: minikube
  clusters:
    minikube:
      namespace:
        active: ""
        favorites:
       - all
        - kube-system
        - default
      view:
        active: dp
  thresholds:
    cpu:
      critical: 90
      warn: 70
    memory:
      critical: 90
      warn: 70
```

We set k9s to look for a local minikube configuration, so I'm going to confirm minikube is online and ready to go. 


```
$ minikube status
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```

### Running k9s to explore a Kubernetes cluster

### With a configuration file set and pointing at our local cluster, we can now run the **k9s** command.


```
`$ k9s`
```

Once you start it up, the k9s text-based user interface (UI) will pop up. With no flag for a namespace, it will show you the pods in the default namespace.

![K9s screenshot][6]

If you run in an environment with a lot of pods, the default view can be overwhelming. Alternatively, we can focus on a given namespace. Exit the application and run **k9s -n &lt;namespace&gt;** where _&lt;namespace&gt;_ is an existing namespace. In the picture below, I ran **k9s -n minecraft,** and it shows my broken pod

![K9s screenshot][7]

So once you have k9s up and running, there are a bunch of things you can do quickly. 

Navigating k9s happens through shortcut keys. We can always use arrow keys and the enter key to choose items listed. There are quite a few other universal keystrokes to navigate to different views:

  * **0**—Show all pods in all namespaces



![K9s screenshot][8]

  * **d**—Describe the selected pod



![K9s screenshot][9]

  * **l**—Show logs for the selected pod pod



![Using k9s to show Kubernetes pod logs][10]

You may notice that k9s is set to use [Vim command keys][11], including moving up and down using **J** and **K** keys. Good luck exiting, emacs users :)

### Viewing different Kubernetes resources quickly

Need to get to something that's not a pod? Yea I do too. There are a number of shortcuts that are available when we enter a colon (":") key. From there, you can use the following commands to navigate around there.

  * **:svc**—Jump to a services view.



![K9s screenshot][12]

  * **:deploy**—Jump to a deployment view.



![K9s screenshot][13]

  * **:rb**—Jump to a Rolebindings view for [role-based access control (RBAC)][14] management.



![K9s screenshot][15]

  * **:namespace**—Jump back to the namespaces view.



![K9s screenshot][16]

  * **:cj**—Jump to the cronjobs view to see what jobs are scheduled in the cluster.



![K9s screenshot][17]

The most used tool for this application will be the keyboard; to go up or down on any page, use the arrow keys. If you need to quit, remember to use Vim keybindings. Type **:q** and hit enter to leave.

### Example of troubleshooting Kubernetes with k9s

How does k9s help when something goes wrong? To walk through an example, I let several pods die due to misconfiguration. Below you can see my terrible hello deployment that's crashing. Once we highlight it, we press **d** to run a _describe_ command to see what is causing the failure.

![K9s screenshot][18]

![K9s screenshot][19]

Skimming the events does not tell us a reason for the failure. Next, I hit the **esc** key and go check the logs by highlighting the pod and entering **&lt;shift-l&gt;**.

![K9s screenshot][20]

Unfortunately, the logs don't offer anything helpful either (probably because the deployment was never correctly configured), and the pod will not come up.

I then **esc** to step back out, and I will see if deleting the pod will take care of this issue. To do so, I highlight the pod and use **&lt;ctrl-d&gt;**. Thankfully, k9s prompts users before deletion. 

![K9s screenshot][21]

While I did delete the pod, the deployment resource still exists, so a new pod will come back up. It will also continue to restart and crash for whatever reason (we don't know yet).

Here is the point where I would repeat reviewing logs, describing resources, and use the **e** shortcut to even edit a running pod to troubleshoot the behavior. In this particular case, the failing pod is not configured to run in this environment. So let's delete the deployment to stop crash-then-reboot loop we are in.

We can get to deployments by typing **:deploy** and clicking enter. From there we highlight and press **&lt;ctrl-d&gt;** to delete.

![K9s screenshot][22]

![K9s screenshot][23]

And poof the deployment is gone! It only took a few keystrokes to clean up this failed deployment.

### k9s is incredibly customizable

So this application has a ton of customization options, down to the color scheme of the UI. Here are a few editable options you may be interested in:

  * Adjust where you put the config.yml file (so you can store it in [version control][24])
  * Add [custom aliases][25] to an **alias.yml** file
  * Create [custom hotkeys][26] in a **hotkey.yml** file
  * Explore available [plugins][27] or write your own



The entire application is configured in YAML files, so customization will feel familiar to any Kubernetes administrator.

### Simplify your life with k9s

I'm prone to administrating over my team's systems in a very manual way, more for brain training than anything else. When I first heard about k9s, I thought, "This is just lazy Kubernetes," so I dismissed it and went back to doing my manual intervention everywhere. I actually started using it daily while working through my backlog, and I was blown away at how much faster it was to use than kubectl alone. Now I'm a convert. 

It's important to know your tools and master the "hard way" of doing something. It is also important to remember, as far as administration goes, it's important to work smarter, not harder. Using k9s is the way I live up to that objective. I guess we can call it lazy Kubernetes administration, and that's okay.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/kubernetes-administration

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/game-dogs-chess-play-lead.png?itok=NAuhav4Z (Dogs playing chess)
[2]: https://github.com/derailed/k9s
[3]: https://opensource.com/article/18/10/getting-started-minikube
[4]: https://kubernetes.io/docs/tasks/tools/install-minikube/
[5]: https://github.com/derailed/k9s#k9s-configuration
[6]: https://opensource.com/sites/default/files/uploads/k9s_1.png (K9s screenshot)
[7]: https://opensource.com/sites/default/files/uploads/k9s_2.png (K9s screenshot)
[8]: https://opensource.com/sites/default/files/uploads/k9s_3.png (K9s screenshot)
[9]: https://opensource.com/sites/default/files/uploads/k9s_5_0.png (K9s screenshot)
[10]: https://opensource.com/sites/default/files/uploads/k9s-show-logs-opensourcedotcom.png (Using k9s to show Kubernetes pod logs)
[11]: https://opensource.com/article/19/3/getting-started-vim
[12]: https://opensource.com/sites/default/files/uploads/k9s_5.png (K9s screenshot)
[13]: https://opensource.com/sites/default/files/uploads/k9s_6.png (K9s screenshot)
[14]: https://kubernetes.io/docs/reference/access-authn-authz/rbac/
[15]: https://opensource.com/sites/default/files/uploads/k9s_7.png (K9s screenshot)
[16]: https://opensource.com/sites/default/files/uploads/k9s_8.png (K9s screenshot)
[17]: https://opensource.com/sites/default/files/uploads/k9s_9.png (K9s screenshot)
[18]: https://opensource.com/sites/default/files/uploads/k9s_10.png (K9s screenshot)
[19]: https://opensource.com/sites/default/files/uploads/k9s_11.png (K9s screenshot)
[20]: https://opensource.com/sites/default/files/uploads/k9s_12.png (K9s screenshot)
[21]: https://opensource.com/sites/default/files/uploads/k9s_13.png (K9s screenshot)
[22]: https://opensource.com/sites/default/files/uploads/k9s_14.png (K9s screenshot)
[23]: https://opensource.com/sites/default/files/uploads/k9s_15.png (K9s screenshot)
[24]: https://opensource.com/article/19/3/move-your-dotfiles-version-control
[25]: https://k9scli.io/topics/aliases/
[26]: https://k9scli.io/topics/hotkeys/
[27]: https://github.com/derailed/k9s/tree/master/plugins
