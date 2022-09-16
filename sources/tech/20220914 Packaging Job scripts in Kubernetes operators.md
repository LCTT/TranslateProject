[#]: subject: "Packaging Job scripts in Kubernetes operators"
[#]: via: "https://opensource.com/article/22/9/packaging-job-scripts-kubernetes-operators"
[#]: author: "Bobby Gryzynger https://opensource.com/users/bgryzyng"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Packaging Job scripts in Kubernetes operators
======
Embed scripts into your Kubernetes operators with Go.

![Ships at sea on the web][1]

When using a complex Kubernetes operator, you often have to orchestrate Jobs to perform workload tasks. [Examples of Job implementations][2] typically provide trivial scripts written directly in the manifest. In any reasonably-complex application, however, determining how to handle more-than-trivial scripts can be challenging.

In the past, I've tackled this problem by including my scripts in an application image. This approach works well enough, but it does have a drawback. Anytime changes are required, I'm forced to rebuild the application image to include the revisions. This is a lot of time wasted, especially when my application image takes a significant amount of time to build. This also means that I'm maintaining both an application image and an operator image. If my operator repository doesn't include the application image, then I'm making related changes across repositories. Ultimately, I'm multiplying the number of commits I make, and complicating my workflow. Every change means I have to manage and synchronize commits and image references between repositories.

Given these challenges, I wanted to find a way to keep my Job scripts within my operator's code base. This way, I could revise my scripts in tandem with my operator's reconciliation logic. My goal was to devise a workflow that would only require me to rebuild the operator's image when I needed to make revisions to my scripts. Fortunately, I use the Go programming language, which provides the immensely helpful [go:embed][3] feature. This allows developers to package text files in with their application's binary. By leveraging this feature, I've found that I can maintain my Job scripts within my operator's image.

### Embed Job script

For demonstration purposes, my task script doesn't include any actual business logic. However, by using an embedded script rather than writing the script directly into the Job manifest, this approach keeps complex scripts both well-organized and abstracted from the Job definition itself.

Here's my simple example script:

```
$ cat embeds/task.sh
#!/bin/sh
echo "Starting task script."
# Something complicated...
echo "Task complete."
```

Now to work on the operator's logic.

### Operator logic

Here's the process within my operator's reconciliation:

1. Retrieve the script's contents
2. Add the script's contents to a ConfigMap
3. Run the ConfigMap's script within the Job by
  4. Defining a volume that refers to the ConfigMap
  5. Making the volume's contents executable
  6. Mounting the volume to the Job

Here's the code:

```
// STEP 1: retrieve the script content from the codebase.
//go:embed embeds/task.sh
var taskScript string

func (r *MyReconciler) Reconcile(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
  ctxlog := ctrllog.FromContext(ctx)
  myresource := &myresourcev1alpha.MyResource{}
  r.Get(ctx, req.NamespacedName, d)

  // STEP 2: create the ConfigMap with the script's content.
  configmap := &corev1.ConfigMap{}
  err := r.Get(ctx, types.NamespacedName{Name: "my-configmap", Namespace: myresource.Namespace}, configmap)
  if err != nil && apierrors.IsNotFound(err) {

    ctxlog.Info("Creating new ConfigMap")
    configmap := &corev1.ConfigMap{
      ObjectMeta: metav1.ObjectMeta{
        Name:      "my-configmap",
        Namespace: myresource.Namespace,
      },
      Data: map[string]string{
        "task.sh": taskScript,
      },
    }

    err = ctrl.SetControllerReference(myresource, configmap, r.Scheme)
    if err != nil {
      return ctrl.Result{}, err
    }
    err = r.Create(ctx, configmap)
    if err != nil {
      ctxlog.Error(err, "Failed to create ConfigMap")
      return ctrl.Result{}, err
    }
    return ctrl.Result{Requeue: true}, nil
  }

  // STEP 3: create the Job with the ConfigMap attached as a volume.
  job := &batchv1.Job{}
  err = r.Get(ctx, types.NamespacedName{Name: "my-job", Namespace: myresource.Namespace}, job)
  if err != nil && apierrors.IsNotFound(err) {

    ctxlog.Info("Creating new Job")
    configmapMode := int32(0554)
    job := &batchv1.Job{
      ObjectMeta: metav1.ObjectMeta{
        Name:      "my-job",
        Namespace: myresource.Namespace,
      },
      Spec: batchv1.JobSpec{
        Template: corev1.PodTemplateSpec{
          Spec: corev1.PodSpec{
            RestartPolicy: corev1.RestartPolicyNever,
            // STEP 3a: define the ConfigMap as a volume.
            Volumes: []corev1.Volume{{
              Name: "task-script-volume",
              VolumeSource: corev1.VolumeSource{
                ConfigMap: &corev1.ConfigMapVolumeSource{
                  LocalObjectReference: corev1.LocalObjectReference{
                    Name: "my-configmap",
                  },
                  DefaultMode: &configmapMode,
                },
              },
            }},
            Containers: []corev1.Container{
              {
                Name:  "task",
                Image: "busybox",
                Resources: corev1.ResourceRequirements{
                  Requests: corev1.ResourceList{
                    corev1.ResourceCPU:    *resource.NewMilliQuantity(int64(50), resource.DecimalSI),
                    corev1.ResourceMemory: *resource.NewScaledQuantity(int64(250), resource.Mega),
                  },
                  Limits: corev1.ResourceList{
                    corev1.ResourceCPU:    *resource.NewMilliQuantity(int64(100), resource.DecimalSI),
                    corev1.ResourceMemory: *resource.NewScaledQuantity(int64(500), resource.Mega),
                  },
                },
                // STEP 3b: mount the ConfigMap volume.
                VolumeMounts: []corev1.VolumeMount{{
                  Name:      "task-script-volume",
                  MountPath: "/scripts",
                  ReadOnly:  true,
                }},
                // STEP 3c: run the volume-mounted script.
                Command: []string{"/scripts/task.sh"},
              },
            },
          },
        },
      },
    }

    err = ctrl.SetControllerReference(myresource, job, r.Scheme)
    if err != nil {
      return ctrl.Result{}, err
    }
    err = r.Create(ctx, job)
    if err != nil {
      ctxlog.Error(err, "Failed to create Job")
      return ctrl.Result{}, err
    }
    return ctrl.Result{Requeue: true}, nil
  }

  // Requeue if the job is not complete.
  if *job.Spec.Completions == 0 {
    ctxlog.Info("Requeuing to wait for Job to complete")
    return ctrl.Result{RequeueAfter: time.Second * 15}, nil
  }

  ctxlog.Info("All done")
  return ctrl.Result{}, nil
}
```

After my operator defines the Job, all that's left to do is wait for the Job to complete. Looking at my operator's logs, I can see each step in the process recorded until the reconciliation is complete:

```
2022-08-07T18:25:11.739Z  INFO  controller.myresource   Creating new ConfigMap  {"reconciler group": "myoperator.myorg.com", "reconciler kind": "MyResource", "name": "myresource-example", "namespace": "default"}
2022-08-07T18:25:11.765Z  INFO  controller.myresource   Creating new Job  {"reconciler group": "myoperator.myorg.com", "reconciler kind": "MyResource", "name": "myresource-example", "namespace": "default"}
2022-08-07T18:25:11.780Z  INFO  controller.myresource   All done  {"reconciler group": "myoperator.myorg.com", "reconciler kind": "MyResource", "name": "myresource-example", "namespace": "default"}
```

### Go for Kubernetes

When it comes to managing scripts within operator-managed workloads and applications, `go:embed` provides a useful mechanism for simplifying the development workflow and abstracting business logic. As your operator and its scripts become more complex, this kind of abstraction and separation of concerns becomes increasingly important for the maintainability and clarity of your operator.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/packaging-job-scripts-kubernetes-operators

作者：[Bobby Gryzynger][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bgryzyng
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/kubernetes_containers_ship_lead.png
[2]: https://kubernetes.io/docs/concepts/workloads/controllers/job/#running-an-example-job
[3]: https://pkg.go.dev/embed
