[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Automating Helm deployments with Bash)
[#]: via: (https://opensource.com/article/20/1/automating-helm-deployments-bash)
[#]: author: (Darin London https://opensource.com/users/dmlond)

Automating Helm deployments with Bash
======
This Bash script enables developers to focus on their code rather than
the deployment logic in each project.
![Person using a laptop][1]

Some of our applications are hosted in a [Kubernetes][2] cluster, and we use GitLab Continuous Integration (CI) to automate deployments and Helm 2 to deploy our applications. Helm charts enable the storage of templates of Kubernetes object YAML files with variables that can be programmatically set from command-line arguments passed when the chart is used during deployments. This allows us to store critical secrets in GitLab-protected environment variables or in Hashicorp Vault and use them within the CI deployment job.

Our deployment job uses a [Bash script to run the deployment process][3]. This Bash script presents a number of features that are valuable for use within a CI/CD environment:

  1. It facilitates use outside of the CI/CD environment. GitLab CI and other CI systems store job steps as lines of executable shell code in a "script" section of a CI text file (.gitlab-ci.yml, for example). While this is useful to ensure basic executable steps can be stored without external dependencies, it prevents developers from using the same code in testing or manual deployment scenarios. In addition, many advanced features of the Bash system cannot be easily used in these script sections.
  2. It facilitates unit testing of important deployment processes. None of the CI systems provide a way of testing whether deployment logic performs as expected. Carefully constructed [Bash scripts can be unit tested with BATS][4].
  3. It facilitates reuse of individual functions within the script. The last section uses a guard clause, **if [[ "${BASH_SOURCE[0]}" == "${0}" ]]**, which prevents the **run_main** function from being called when the script is not being executed. This allows the script to be sourced, which then allows users to make use of the many useful individual functions within it. This is crucial for proper BATS testing.
  4. It uses environment variables to protect sensitive information and make the script reusable across many projects and project application environments. GitLab CI makes many of these environment variables available when run by a GitLab CI runner. These must be manually set before using the script outside GitLab CI.



The script performs all tasks required to deploy a Helm chart for an application to Kubernetes and waits for the deployment to be ready using kubectl and Helm. Helm runs with a local Tiller installation instead of running Tiller in the Kubernetes cluster. The Kubernetes **HELM_USER** and **HELM_PASSWORD** are used to log into the Kubernetes **CLUSTER_SERVER** and **PROJECT_NAMESPACE**. Tiller is started, Helm is initialized in client-only mode, and its repo is updated. The template is linted with Helm to ensure that syntax errors have not been accidentally committed. The template is then deployed in declarative mode, using **helm upgrade --install**. Helm waits for the deployment to be ready using the **\--wait flag**.

The script ensures that certain template variables are set during the deployment and allows special project-specific variables to be specified in the GitLab CI **PROJECT_SPECIFIC_DEPLOY_ARGS** environment variable. All environment variables required in the deployment are checked early in the script execution, and the script exits with a non-zero exit status if any are missing.

This script has been used in multiple GitLab CI-hosted projects. It has helped us focus on our code rather than the deployment logic in each project.

### The script


```
#!/bin/bash

# MIT License
#
# Copyright (c) 2019 Darin London
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

log_level_for()
{
  case "${1}" in
    "error")
      echo 1
      ;;

    "warn")
      echo 2
      ;;

    "debug")
      echo 3
      ;;

    "info")
      echo 4
      ;;
    *)
      echo -1
      ;;
  esac
}

current_log_level()
{
  log_level_for "${LOG_LEVEL}"
}

error()
{
  [ $(log_level_for "error") -le $(current_log_level) ] &amp;&amp;  echo "${1}" &gt;&amp;2
}

warn()
{
  [ $(log_level_for "warn") -le $(current_log_level) ] &amp;&amp;  echo "${1}" &gt;&amp;2
}

debug()
{
  [ $(log_level_for "debug") -le $(current_log_level) ] &amp;&amp;  echo "${1}" &gt;&amp;2
}

info()
{
  [ $(log_level_for "info") -le $(current_log_level) ] &amp;&amp;  echo "${1}" &gt;&amp;2
}

check_required_environment() {
  local required_env="${1}"

  for reqvar in $required_env
  do
    if [ -z "${!reqvar}" ]
    then
      error "missing ENVIRONMENT ${reqvar}!"
      return 1
    fi
  done
}

check_default_environment() {
  local required_env="${1}"

  for varpair in $required_env
  do
    local manual_environment=$(echo "${varpair}" | cut -d':' -f1)
    local default_if_not_set=$(echo "${varpair}" | cut -d':' -f2)
    if [ -z "${!manual_environment}" ] &amp;&amp; [ -z "${!default_if_not_set}" ]
    then
      error "missing default ENVIRONMENT, set ${manual_environment} or ${default_if_not_set}!"
      return 1
    fi
  done
}

dry_run() {
  [ ${DRY_RUN} ] &amp;&amp; info "skipping for dry run" &amp;&amp; return
  return 1
}

init_tiller() {
  info "initializing local tiller"
  dry_run &amp;&amp; return

  export TILLER_NAMESPACE=$PROJECT_NAMESPACE
  export HELM_HOST=localhost:44134
  # <https://rimusz.net/tillerless-helm/>
  # run tiller locally instead of in the cluster
  tiller --storage=secret &amp;
  export TILLER_PID=$!
  sleep 1
  kill -0 ${TILLER_PID}
  if [ $? -gt 0 ]
  then
    error "tiller not running!"
    return 1
  fi
}

init_helm() {
  info "initializing helm"
  dry_run &amp;&amp; return

  helm init --client-only
  if [ $? -gt 0 ]
  then
    error "could not initialize helm"
    return 1
  fi
}

init_helm_with_tiller() {
  init_tiller || return 1
  init_helm || return 1
  info "updating helm client repository information"
  dry_run &amp;&amp; return
  helm repo update
  if [ $? -gt 0 ]
  then
    error "could not update helm repository information"
    return 1
  fi
}

decommission_tiller() {
  if [ -n "${TILLER_PID}" ]
  then
    kill ${TILLER_PID}
    if [ $? -gt 0 ]
    then
     return
    fi
  fi
}

check_required_deploy_arg_environment() {
  [ -z "${PROJECT_SPECIFIC_DEPLOY_ARGS}" ] &amp;&amp; return
  for reqvar in ${PROJECT_SPECIFIC_DEPLOY_ARGS}
  do
    if [ -z ${!reqvar} ]
    then
      error "missing Deployment ENVIRONMENT ${reqvar} required!"
      return 1
    fi
  done
}

project_specific_deploy_args() {
  [ -z "${PROJECT_SPECIFIC_DEPLOY_ARGS}" ] &amp;&amp; echo "" &amp;&amp; return

  extraArgs=''
  for deploy_arg_key in ${PROJECT_SPECIFIC_DEPLOY_ARGS}
  do
    extraArgs="${extraArgs} --set $(echo "${deploy_arg_key}" | sed 's/__/\\./g' | tr '[:upper:]' '[:lower:]')=${!deploy_arg_key}"
  done

  echo "${extraArgs}"
}

check_required_cluster_login_environment() {
  check_required_environment "HELM_TOKEN HELM_USER PROJECT_NAMESPACE CLUSTER_SERVER" || return 1
}

cluster_login() {
  info "authenticating ${HELM_USER} in ${PROJECT_NAMESPACE}"
  dry_run &amp;&amp; return

  kubectl config set-cluster ci_kube --server="${CLUSTER_SERVER}" || return 1
  kubectl config set-credentials "${HELM_USER}" --token="${HELM_TOKEN}" || return 1
  kubectl config set-context ${PROJECT_NAMESPACE}-deploy  --cluster=ci_kube --namespace=${PROJECT_NAMESPACE} --user=${HELM_USER} || return 1
  kubectl config use-context ${PROJECT_NAMESPACE}-deploy || return 1
}

lint_template() {
  info "linting template"
  dry_run &amp;&amp; return

  helm lint ${CI_PROJECT_DIR}/helm-chart/${CI_PROJECT_NAME}
}

check_required_image_pull_environment() {
  if [ "${CI_PROJECT_VISIBILITY}" == "public" ]
  then
    check_required_environment "CI_REGISTRY CI_DEPLOY_USER CI_DEPLOY_PASSWORD" || return 1
  fi
}

image_pull_settings() {
  if [ "${CI_PROJECT_VISIBILITY}" == "public" ]
  then
    echo ""
  else
    echo "--set registry.root=${CI_REGISTRY} --set registry.secret.username=${CI_DEPLOY_USER} --set registry.secret.password=${CI_DEPLOY_PASSWORD}"
  fi
}

deployment_name() {
  if [ -n "${DEPLOYMENT_NAME}" ]
  then
    echo "${DEPLOYMENT_NAME}"
  else
    echo "${CI_ENVIRONMENT_SLUG}-${CI_PROJECT_NAME}"
  fi
}

deploy_template() {
  info "deploying $(deployment_name) from template"
  if dry_run
  then
    info "helm upgrade --force --recreate-pods --debug --set image.repository=${CI_REGISTRY_IMAGE}/${CI_PROJECT_NAME} --set image.tag=${CI_COMMIT_SHORT_SHA} --set environment=${CI_ENVIRONMENT_NAME} --set-string git_commit=${CI_COMMIT_SHORT_SHA} --set git_ref=${CI_COMMIT_REF_SLUG} --set ci_job_id=${CI_JOB_ID} $(environment_url_settings) $(image_pull_settings) $(project_specific_deploy_args) --wait --install $(deployment_name) ${CI_PROJECT_DIR}/helm-chart/${CI_PROJECT_NAME}"
  else
    helm upgrade --force --recreate-pods --debug \
    --set image.repository="${CI_REGISTRY_IMAGE}/${CI_PROJECT_NAME}" \
    --set image.tag="${CI_COMMIT_SHORT_SHA}" \
    --set environment="${CI_ENVIRONMENT_NAME}" \
    --set-string git_commit="${CI_COMMIT_SHORT_SHA}" \
    --set git_ref="${CI_COMMIT_REF_SLUG}" \
    --set ci_job_id="${CI_JOB_ID}" \
    $(image_pull_settings) \
    $(project_specific_deploy_args) \
    --wait \
    --install $(deployment_name) ${CI_PROJECT_DIR}/helm-chart/${CI_PROJECT_NAME}
  fi
}

get_pods() {
  kubectl get pods -l ci_job_id="${CI_JOB_ID}"
}

watch_deployment() {
  local watch_deployment=$(deployment_name)
  if [ -n "${WATCH_DEPLOYMENT}" ]
  then
    watch_deployment="${WATCH_DEPLOYMENT}"
  fi
  info "waiting until deployment ${watch_deployment} is ready"
  dry_run &amp;&amp; return

  kubectl rollout status deployment/${watch_deployment} -w || return 1
  sleep 5
  get_pods || return 1
  # see what has been deployed
  kubectl describe deployment -l app=${CI_PROJECT_NAME},environment=${CI_ENVIRONMENT_NAME},git_commit=${CI_COMMIT_SHORT_SHA} || return 1
  if [ -n "${CI_ENVIRONMENT_URL}" ]
  then
    kubectl describe service -l app=${CI_PROJECT_NAME},environment=${CI_ENVIRONMENT_NAME} || return 1
    kubectl describe route -l app=${CI_PROJECT_NAME},environment=${CI_ENVIRONMENT_NAME} || return 1
  fi
}

run_main() {
  check_required_environment "CI_PROJECT_NAME CI_PROJECT_DIR CI_COMMIT_REF_SLUG CI_REGISTRY_IMAGE CI_ENVIRONMENT_NAME CI_JOB_ID CI_COMMIT_SHORT_SHA" || return 1
  check_default_environment "WATCH_DEPLOYMENT:CI_ENVIRONMENT_SLUG" || return 1
  check_required_deploy_arg_environment || return 1
  check_required_cluster_login_environment || return 1
  check_required_image_pull_environment || return 1
  cluster_login
  if [ $? -gt 0 ]
  then
    error "could not login kubectl"
    return 1
  fi

  init_helm_with_tiller
  if [ $? -gt 0 ]
  then
    error "could not initialize helm"
    return 1
  fi

  lint_template
  if [ $? -gt 0 ]
  then
    error "linting failed"
    return 1
  fi

  deploy_template
  if [ $? -gt 0 ]
  then
    error "could not deploy template"
    return 1
  fi

  watch_deployment
  if [ $? -gt 0 ]
  then
    error "could not watch deployment"
    return 1
  fi

  decommission_tiller
  info "ALL Complete!"
  return
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
  run_main
  if [ $? -gt 0 ]
  then
    exit 1
  fi
fi
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/automating-helm-deployments-bash

作者：[Darin London][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dmlond
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/resources/what-is-kubernetes
[3]: https://gist.github.com/dmlond/016ff7c3757fee00f9d02e36e6c0c298
[4]: https://opensource.com/article/19/2/testing-bash-bats
