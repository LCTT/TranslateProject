[#]: collector: (lujun9972)
[#]: translator: ( guevaraya)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Troubleshoot Kubernetes with the power of tmux and kubectl)
[#]: via: (https://opensource.com/article/20/2/kubernetes-tmux-kubectl)
[#]: author: (Abhishek Tamrakar https://opensource.com/users/tamrakar)

Troubleshoot Kubernetes with the power of tmux and kubectl
======
A kubectl plugin that uses tmux to make troubleshooting Kubernetes much
simpler.
![Woman sitting in front of her laptop][1]

[Kubernetes][2] is a thriving open source container orchestration platform that offers scalability, high availability, robustness, and resiliency for applications. One of its many features is support for running custom scripts or binaries through its primary client binary, [kubectl][3]. Kubectl is very powerful and allows users to do anything with it that they could do directly on a Kubernetes cluster.

### Troubleshooting Kubernetes with aliases

Anyone who uses Kubernetes for container orchestration is aware of its features—as well as the complexity it brings because of its design. For example, there is an urgent need to simplify troubleshooting in Kubernetes with something that is quicker and has little need for manual intervention (except in critical situations).

There are many scenarios to consider when it comes to troubleshooting functionality. In one scenario, you know what you need to run, but the command's syntax—even when it can run as a single command—is excessively complex, or it may need one or two inputs to work.

For example, if you frequently need to jump into a running container in the System namespace, you may find yourself repeatedly writing:


```
`kubectl --namespace=kube-system exec -i -t <your-pod-name>`
```

To simplify troubleshooting, you could use command-line aliases of these commands. For example, you could add the following to your dotfiles (.bashrc or .zshrc):


```
`alias ksysex='kubectl --namespace=kube-system exec -i -t'`
```

This is one of many examples from a [repository of common Kubernetes aliases][4] that shows one way to simplify functions in kubectl. For something simple like this scenario, an alias is sufficient.

### Switching to a kubectl plugin

A more complex troubleshooting scenario involves the need to run many commands, one after the other, to investigate an environment and come to a conclusion. Aliases alone are not sufficient for this use

case; you need repeatable logic and correlations between the many parts of your Kubernetes deployment. What you really need is automation to deliver the desired output in less time.

Consider 10 to 20—or even 50 to 100—namespaces holding different microservices on your cluster. What would be helpful for you to start troubleshooting this scenario?

  * You would need something that can quickly tell which pod in which namespace is throwing errors.
  * You would need something that can watch logs of all the pods in a namespace.
  * You might also need to watch logs of certain pods in a specific namespace that have shown errors.



Any solution that covers these points would be very useful in investigating production issues as well as during development and testing cycles.

To create something more powerful than a simple alias, you can use [kubectl plugins][5]. Plugins are like standalone scripts written in any scripting language but are designed to extend the functionality of your main command when serving as a Kubernetes admin.

To create a plugin, you must use the proper syntax of **kubectl-&lt;your-plugin-name&gt;** to copy the script to one of the exported pathways in your **$PATH** and give it executable permissions (**chmod +x**).

After creating a plugin and moving it into your path, you can run it immediately. For example, I have kubectl-krawl and kubectl-kmux in my path:


```
$ kubectl plugin list
The following compatible plugins are available:

/usr/local/bin/kubectl-krawl
/usr/local/bin/kubectl-kmux

$ kubectl kmux
```

Now let's explore what this looks like when you power Kubernetes with tmux.

### Harnessing the power of tmux

[Tmux][6] is a very powerful tool that many sysadmins and ops teams rely on to troubleshoot issues related to ease of operability—from splitting windows into panes for running parallel debugging on multiple machines to monitoring logs. One of its major advantages is that it can be used on the command line or in automation scripts.

I created [a kubectl plugin][7] that uses tmux to make troubleshooting much simpler. I will use annotations to walk through the logic behind the plugin (and leave it for you to go through the plugin's full code):


```
#NAMESPACE is namespace to monitor.
#POD is pod name
#Containers is container names

# initialize a counter n to count the number of loop counts, later be used by tmux to split panes.
n=0;

# start a loop on a list of pod and containers
while IFS=' ' read -r POD CONTAINERS
do

           # tmux create the new window for each pod
            tmux neww $COMMAND -n $POD 2&gt;/dev/null

           # start a loop for all containers inside a running pod
        for CONTAINER in ${CONTAINERS//,/ }
        do

        if [ x$POD = x -o x$CONTAINER = x ]; then
        # if any of the values is null, exit.
        warn "Looks like there is a problem getting pods data."
        break
        fi
           
            # set the command to execute
        COMMAND=”kubectl logs -f $POD -c $CONTAINER -n $NAMESPACE”
        # check tmux session
        if tmux has-session -t &lt;session name&gt; 2&gt;/dev/null;
        then
        &lt;set session exists&gt;
        else
        &lt;create session&gt;
        fi

           # split planes in the current window for each containers
        tmux selectp -t $n \; \
        splitw $COMMAND \; \
        select-layout tiled \;

           # end loop for containers
        done

           # rename the window to identify by pod name
        tmux renamew $POD 2&gt;/dev/null
       
            # increment the counter
        ((n+=1))

# end loop for pods
done&lt; &lt;(&lt;fetch list of pod and containers from kubernetes cluster&gt;)

# finally select the window and attach session
 tmux selectw -t &lt;session name&gt;:1 \; \
  attach-session -t &lt;session name&gt;\;
```

After the plugin script runs, it will produce output similar to the image below. Each pod has its own window, and each container (if there is more than one) is split by the panes in its pod window, streaming logs as they arrive. The beauty of tmux can be seen below; with the proper configuration, you can even see which window has activity going on (see the white tabs).

![Output of kmux plugin][8]

### Conclusion

Aliases are always helpful for simple troubleshooting in Kubernetes environments. When the environment gets more complex, a kubectl plugin is a powerful option for using more advanced scripting. There are no limits on which programming language you can use to write kubectl plugins. The only requirements are that the naming convention in the path is executable, and it doesn't have the same name as an existing kubectl command.

To read the complete code or try the plugins I created, check my [kube-plugins-github][7] repository. Issues and pull requests are welcome.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/kubernetes-tmux-kubectl

作者：[Abhishek Tamrakar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tamrakar
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_4.png?itok=VGZO8CxT (Woman sitting in front of her laptop)
[2]: https://opensource.com/resources/what-is-kubernetes
[3]: https://kubernetes.io/docs/reference/kubectl/overview/
[4]: https://github.com/ahmetb/kubectl-aliases/blob/master/.kubectl_aliases
[5]: https://kubernetes.io/docs/tasks/extend-kubectl/kubectl-plugins/
[6]: https://opensource.com/article/19/6/tmux-terminal-joy
[7]: https://github.com/abhiTamrakar/kube-plugins
[8]: https://opensource.com/sites/default/files/uploads/kmux-output.png (Output of kmux plugin)
