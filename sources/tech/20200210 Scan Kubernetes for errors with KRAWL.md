[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Scan Kubernetes for errors with KRAWL)
[#]: via: (https://opensource.com/article/20/2/kubernetes-scanner)
[#]: author: (Abhishek Tamrakar https://opensource.com/users/tamrakar)

Scan Kubernetes for errors with KRAWL
======
The KRAWL script identifies errors in Kubernetes pods and containers.
![Ship captain sailing the Kubernetes seas][1]

When you're running containers with Kubernetes, you often find that they pile up. This is by design. It's one of the advantages of containers: they're cheap to start whenever a new one is needed. You can use a front-end like OpenShift or OKD to manage pods and containers. Those make it easy to visualize what you have set up, and have a rich set of commands for quick interactions.

If a platform to manage containers doesn't fit your requirements, though, you can also get that information using only a Kubernetes toolchain, but there are a lot of commands you need for a full overview of a complex environment. For that reason, I wrote [KRAWL][2], a simple script that scans pods and containers under the namespaces on Kubernetes clusters and displays the output of events, if any are found. It can also be used as Kubernetes plugin for the same purpose. It's a quick and easy way to get a lot of useful information.

### Prerequisites

  * You must have kubectl installed.
  * Your cluster's kubeconfig must be either in its default location ($HOME/.kube/config) or exported (KUBECONFIG=/path/to/kubeconfig).



### Usage


```
`$ ./krawl`
```

![KRAWL script][3]

### The script


```
#!/bin/bash
# AUTHOR: Abhishek Tamrakar
# EMAIL: [abhishek.tamrakar08@gmail.com][4]
# LICENSE: Copyright (C) 2018 Abhishek Tamrakar
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       <http://www.apache.org/licenses/LICENSE-2.0>
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
##
#define the variables
KUBE_LOC=~/.kube/config
#define variables
KUBECTL=$(which kubectl)
GET=$(which egrep)
AWK=$(which awk)
red=$(tput setaf 1)
normal=$(tput sgr0)
# define functions

# wrapper for printing info messages
info()
{
  printf '\n\e[34m%s\e[m: %s\n' "INFO" "$@"
}

# cleanup when all done
cleanup()
{
  rm -f results.csv
}

# just check if the command we are about to call is available
checkcmd()
{
  #check if command exists
  local cmd=$1
  if [ -z "${!cmd}" ]
  then
    printf '\n\e[31m%s\e[m: %s\n' "ERROR"  "check if $1 is installed !!!"
    exit 1
  fi
}

get_namespaces()
{
  #get namespaces
  namespaces=( \
          $($KUBECTL get namespaces --ignore-not-found=true | \
          $AWK '/Active/ {print $1}' \
          ORS=" ") \
          )
#exit if namespaces are not found
if [ ${#namespaces[@]} -eq 0 ]
then
  printf '\n\e[31m%s\e[m: %s\n' "ERROR"  "No namespaces found!!"
  exit 1
fi
}

#get events for pods in errored state
get_pod_events()
{
  printf '\n'
  if [ ${#ERRORED[@]} -ne 0 ]
  then
      info "${#ERRORED[@]} errored pods found."
      for CULPRIT in ${ERRORED[@]}
      do
        info "POD: $CULPRIT"
        info
        $KUBECTL get events \
        --field-selector=involvedObject.name=$CULPRIT \
        -ocustom-columns=LASTSEEN:.lastTimestamp,REASON:.reason,MESSAGE:.message \
        --all-namespaces \
        --ignore-not-found=true
      done
  else
      info "0 pods with errored events found."
  fi
}

#define the logic
get_pod_errors()
{
  printf "%s %s %s\n" "NAMESPACE,POD_NAME,CONTAINER_NAME,ERRORS" &gt; results.csv
  printf "%s %s %s\n" "---------,--------,--------------,------" &gt;&gt; results.csv
  for NAMESPACE in ${namespaces[@]}
  do
    while IFS=' ' read -r POD CONTAINERS
    do
      for CONTAINER in ${CONTAINERS//,/ }
      do
        COUNT=$($KUBECTL logs --since=1h --tail=20 $POD -c $CONTAINER -n $NAMESPACE 2&gt;/dev/null| \
        $GET -c '^error|Error|ERROR|Warn|WARN')
        if [ $COUNT -gt 0 ]
        then
            STATE=("${STATE[@]}" "$NAMESPACE,$POD,$CONTAINER,$COUNT")
        else
        #catch pods in errored state
            ERRORED=($($KUBECTL get pods -n $NAMESPACE --no-headers=true | \
                awk '!/Running/ {print $1}' ORS=" ") \
                )
        fi
      done
    done&lt; &lt;($KUBECTL get pods -n $NAMESPACE --ignore-not-found=true -o=custom-columns=NAME:.metadata.name,CONTAINERS:.spec.containers[*].name --no-headers=true)
  done
  printf "%s\n" ${STATE[@]:-None} &gt;&gt; results.csv
  STATE=()
}
#define usage for seprate run
usage()
{
cat &lt;&lt; EOF

  USAGE: "${0##*/} &lt;/path/to/kube-config&gt;(optional)"

  This program is a free software under the terms of Apache 2.0 License.
  COPYRIGHT (C) 2018 Abhishek Tamrakar

EOF
exit 0
}

#check if basic commands are found
trap cleanup EXIT
checkcmd KUBECTL
#
#set the ground
if [ $# -lt 1 ]; then
  if [ ! -e ${KUBE_LOC} -a ! -s ${KUBE_LOC} ]
  then
    info "A readable kube config location is required!!"
    usage
  fi
elif [ $# -eq 1 ]
then
  export KUBECONFIG=$1
elif [ $# -gt 1 ]
then
  usage
fi
#play
get_namespaces
get_pod_errors

printf '\n%40s\n' 'KRAWL'
printf '%s\n' '---------------------------------------------------------------------------------'
printf '%s\n' '  Krawl is a command line utility to scan pods and prints name of errored pods   '
printf '%s\n\n' ' +and containers within. To use it as kubernetes plugin, please check their page '
printf '%s\n' '================================================================================='

cat results.csv | sed 's/,/,|/g'| column -s ',' -t
get_pod_events
```

* * *

_This was originally published as the README in [KRAWL's GitHub repository][2] and is reused with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/kubernetes-scanner

作者：[Abhishek Tamrakar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tamrakar
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://github.com/abhiTamrakar/kube-plugins/tree/master/krawl
[3]: https://opensource.com/sites/default/files/uploads/krawl_0.png (KRAWL script)
[4]: mailto:abhishek.tamrakar08@gmail.com
