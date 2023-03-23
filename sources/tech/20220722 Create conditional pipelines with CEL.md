[#]: subject: "Create conditional pipelines with CEL"
[#]: via: "https://opensource.com/article/22/7/conditional-tekton-pipelines-cel"
[#]: author: "Camilla Conte https://opensource.com/users/spotlesstofu"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Create conditional pipelines with CEL
======
Control when automated builds happen in Tekton with CEL.

![Plumbing tubes in many directions][1]

You just followed a guide to start your Tekton pipeline (or task) when a merge request is created or updated on your GitLab project. So you configured GitLab to send merge request **events** as **webhooks**. And you deployed some **Tekton** components:

* EventListener: receives webhooks from GitLab
* Trigger: starts your Pipeline every time the EventListener receives a new webhook from GitLab
* Pipeline: fetches the source code from GitLab and builds it

Then you notice that any event in your merge request (a new comment, a tag change) triggers the pipeline. That's not the behavior you desire. You don't need to build a comment or a tag, after all. You only want the pipeline to run when there is actual new code to build. Here's how I use Tekton's CEL Interceptor to create conditionals for my pipelines.

### Have your trigger ready

I expect you have a trigger already defined. It's probably something similar to the snippet below.

The trigger's interceptor rejects anything that's not coming from a merge request. Still, the interceptor is not able to differentiate between code and non-code updates (like new comments).

```
apiVersion: triggers.tekton.dev/v1beta1
kind: Trigger
metadata:
  name: webhook-listener-trigger
spec:
  interceptors:
    # reject any payload that's not a merge request webhook
    - name: "filter-event-types"
      ref:
        name: "gitlab"
        kind: ClusterInterceptor
      params:
        - name: eventTypes
          value:
            - "Merge Request Hook"
  bindings:
    - ref: binding
  template:
    ref: template
```

### Add a CEL interceptor

Here comes the `cel` interceptor. This interceptor filters the webhook payload using the CEL expression language. If the filter expression evaluates to `true`, the pipeline starts.

Here I'm checking for the `object_attributes.oldrev` field to exist in the JSON body of the webhook payload. If `object_attributes.oldrev` exists, then that means this event is about a code change. If there wasn't a code change, there's no previous revision (`oldrev` ) to refer to.

```
spec:
  interceptors:
    - name: "allow-code-changes-only"
      ref:
        name: cel
        kind: ClusterInterceptor
      params:
        - name: filter
          value: >
            has(body.object_attributes.oldrev)
```

Add the new interceptor to your trigger. Now your trigger looks like this:

```
apiVersion: triggers.tekton.dev/v1beta1
kind: Trigger
metadata:
  name: gitlab-listener-trigger
spec:
  interceptors:
    - name: "verify-gitlab-payload"
      ref:
        name: "gitlab"
        kind: ClusterInterceptor
      params:
        - name: eventTypes
          value:
            - "Merge Request Hook"
    - name: "allow-code-changes-only"
      ref:
        name: "cel"
        kind: ClusterInterceptor
      params:
        - name: filter
          value: >
            has(body.object_attributes.oldrev)
  bindings:
    - ref: binding
  template:
    ref: template
```

Deploy this new version of the trigger and enjoy the powers of automation. From now on, your pipeline only starts if there is some new code to build.

### Tips

There are no limits to the conditions you can set in a CEL filter.

You may check that the merge request is currently open:

```
body.object_attributes.state in ['opened']
```

You can make sure the contributor finished their work on the code:

```
body.object_attributes.work_in_progress == false
```

You just have to concatenate multiple conditions correctly:

```
- name: filter
  value: >
    has(body.object_attributes.oldrev) &&
    body.object_attributes.state in ['opened'] &&
    body.object_attributes.work_in_progress == false
```

Check out the [merge request events][2] documentation to get inspired to write your own conditions.

You may need the [CEL language definition][3] to know how to translate your thoughts into code.

To evaluate types other than strings, you want to know the [mapping between JSON and CEL][4] types.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/conditional-tekton-pipelines-cel

作者：[Camilla Conte][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/spotlesstofu
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/plumbing_pipes_tutorial_how_behind_scenes.png
[2]: https://docs.gitlab.com/ee/user/project/integrations/webhook_events.html#merge-request-events
[3]: https://github.com/google/cel-spec/blob/master/doc/langdef.md
[4]: https://github.com/google/cel-spec/blob/master/doc/langdef.md#json-data-conversion
