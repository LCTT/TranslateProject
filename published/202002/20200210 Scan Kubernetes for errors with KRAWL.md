[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11936-1.html)
[#]: subject: (Scan Kubernetes for errors with KRAWL)
[#]: via: (https://opensource.com/article/20/2/kubernetes-scanner)
[#]: author: (Abhishek Tamrakar https://opensource.com/users/tamrakar)

使用 KRAWL 扫描 Kubernetes 错误
======

> 用 KRAWL 脚本来识别 Kubernetes Pod 和容器中的错误。

![Ship captain sailing the Kubernetes seas][1]

当你使用 Kubernetes 运行容器时，你通常会发现它们堆积在一起。这是设计使然。它是容器的优点之一：每当需要新的容器时，它们启动成本都很低。你可以使用前端工具（如 OpenShift 或 OKD）来管理 Pod 和容器。这些工具使可视化设置变得容易，并且它具有一组丰富的用于快速交互的命令。

如果管理容器的平台不符合你的要求，你也可以仅使用 Kubernetes 工具链获取这些信息，但这需要大量命令才能全面了解复杂环境。出于这个原因，我编写了 [KRAWL][2]，这是一个简单的脚本，可用于扫描 Kubernetes 集群命名空间下的 Pod 和容器，并在发现任何事件时，显示事件的输出。它也可用作为 Kubernetes 插件使用。这是获取大量有用信息的快速简便方法。

### 先决条件

  * 必须安装 `kubectl`。
  * 集群的 kubeconfig 配置必须在它的默认位置（`$HOME/.kube/config`）或已被导出到环境变量（`KUBECONFIG=/path/to/kubeconfig`）。

### 使用


```
$ ./krawl
```

![KRAWL script][3]

### 脚本


```
#!/bin/bash
# AUTHOR: Abhishek Tamrakar
# EMAIL: abhishek.tamrakar08@gmail.com
# LICENSE: Copyright (C) 2018 Abhishek Tamrakar
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
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
    printf '\n\e[31m%s\e[m: %s\n' "ERROR"  "check if $1 is installed !!!"
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
  printf '\n\e[31m%s\e[m: %s\n' "ERROR"  "No namespaces found!!"
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
  printf "%s %s %s\n" "NAMESPACE,POD_NAME,CONTAINER_NAME,ERRORS" > results.csv
  printf "%s %s %s\n" "---------,--------,--------------,------" >> results.csv
  for NAMESPACE in ${namespaces[@]}
  do
    while IFS=' ' read -r POD CONTAINERS
    do
      for CONTAINER in ${CONTAINERS//,/ }
      do
        COUNT=$($KUBECTL logs --since=1h --tail=20 $POD -c $CONTAINER -n $NAMESPACE 2>/dev/null| \
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
    done< <($KUBECTL get pods -n $NAMESPACE --ignore-not-found=true -o=custom-columns=NAME:.metadata.name,CONTAINERS:.spec.containers[*].name --no-headers=true)
  done
  printf "%s\n" ${STATE[@]:-None} >> results.csv
  STATE=()
}
#define usage for seprate run
usage()
{
cat << EOF

  USAGE: "${0##*/} </path/to/kube-config>(optional)"

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
printf '%s\n' '  Krawl is a command line utility to scan pods and prints name of errored pods   '
printf '%s\n\n' ' +and containers within. To use it as kubernetes plugin, please check their page '
printf '%s\n' '================================================================================='

cat results.csv | sed 's/,/,|/g'| column -s ',' -t
get_pod_events
```

此文最初发布在 [KRAWL 的 GitHub 仓库][2]下的 README 中，并被或许重用。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/kubernetes-scanner

作者：[Abhishek Tamrakar][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tamrakar
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://github.com/abhiTamrakar/kube-plugins/tree/master/krawl
[3]: https://opensource.com/sites/default/files/uploads/krawl_0.png (KRAWL script)
[4]: mailto:abhishek.tamrakar08@gmail.com
