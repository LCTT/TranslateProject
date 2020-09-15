[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Deploy a deep learning model on Kubernetes)
[#]: via: (https://opensource.com/article/20/9/deep-learning-model-kubernetes)
[#]: author: (Chaimaa Zyani https://opensource.com/users/chaimaa)

Deploy a deep learning model on Kubernetes
======
Learn how to deploy, scale, and manage a deep learning model that serves
up image recognition predictions with Kubermatic Kubernetes Platform.
![Brain on a computer screen][1]

As enterprises increase their use of artificial intelligence (AI), machine learning (ML), and deep learning (DL), a critical question arises: How can they scale and industrialize ML development? These conversations often focus on the ML model; however, this is only one step along the way to a complete solution. To achieve in-production application and scale, model development must include a repeatable process that accounts for the critical activities that precede and follow development, including getting the model into a public-facing deployment.

This article demonstrates how to deploy, scale, and manage a deep learning model that serves up image recognition predictions using [Kubermatic Kubernetes Platform][2].

Kubermatic Kubernetes Platform is a production-grade, open source Kubernetes cluster-management tool that offers flexibility and automation to integrate with ML/DL workflows with full cluster lifecycle management.

### Get started

This example deploys a deep learning model for image recognition. It uses the [CIFAR-10][3] dataset that consists of 60,000 32x32 color images in 10 classes with the [Gluon][4] library in [Apache MXNet][5] and NVIDIA GPUs to accelerate the workload. If you want to use a pre-trained model on the CIFAR-10 dataset, check out the [getting started guide][6].

The model was trained over a span of 200 epochs, as long as the validation error kept decreasing slowly without causing the model to overfit. This plot shows the training process:

![Deep learning model training plot][7]

(Chaimaa Zyami, [CC BY-SA 4.0][8])

After training, it's essential to save the model's parameters so they can be loaded later:


```
file_name = "net.params"
net.save_parameters(file_name)
```

Once the model is ready, wrap your prediction code in a Flask server. This allows the server to accept an image as an argument to its request and return the model's prediction in the response:


```
from gluoncv.model_zoo import get_model
import matplotlib.pyplot as plt
from mxnet import gluon, nd, image
from mxnet.gluon.data.vision import transforms
from gluoncv import utils
from PIL import Image
import io
import flask
app = flask.Flask(__name__)

@app.route("/predict",methods=["POST"])
def predict():
    if flask.request.method == "POST":
        if flask.request.files.get("img"):
           img = Image.open(io.BytesIO(flask.request.files["img"].read()))
            transform_fn = transforms.Compose([
            transforms.Resize(32),
            transforms.CenterCrop(32),
            transforms.ToTensor(),
            transforms.Normalize([0.4914, 0.4822, 0.4465], [0.2023, 0.1994, 0.2010])])
            img = transform_fn(nd.array(img))
            net = get_model('cifar_resnet20_v1', classes=10)
            net.load_parameters('net.params')
            pred = net(img.expand_dims(axis=0))
            class_names = ['airplane', 'automobile', 'bird', 'cat', 'deer',
                       'dog', 'frog', 'horse', 'ship', 'truck']
            ind = nd.argmax(pred, axis=1).astype('int')
            prediction = 'The input picture is classified as [%s], with probability %.3f.'%
                         (class_names[ind.asscalar()], nd.softmax(pred)[0][ind].asscalar())
    return prediction

if __name__ == '__main__':
   app.run(host='0.0.0.0')
```

### Containerize the model

Before you can deploy your model to Kubernetes, you need to install Docker and create a container image with your model.

  1. Download, install, and start Docker: [code]

sudo yum install -y yum-utils device-mapper-persistent-data lvm2

sudo yum-config-manager --add-repo <https://download.docker.com/linux/centos/docker-ce.repo>

sudo yum install docker-ce

sudo systemctl start docker

```
  2. Create a directory where you can organize your code and dependencies: [code]

mkdir kubermatic-dl
cd kubermatic-dl
```

  3. Create a `requirements.txt` file to contain the packages the code needs to run: [code]

flask
gluoncv
matplotlib
mxnet
requests
Pillow

```
  4. Create the Dockerfile that Docker will read to build and run the model: [code]

FROM python:3.6
WORKDIR /app
COPY requirements.txt /app
RUN pip install -r ./requirements.txt
COPY app.py /app
CMD ["python", "app.py"]~

[/code] This Dockerfile can be broken down into three steps. First, it creates the Dockerfile and instructs Docker to download a base image of Python 3. Next, it asks Docker to use the Python package manager `pip` to install the packages in `requirements.txt`. Finally, it tells Docker to run your script via `python app.py`.

  5. Build the Docker container: [code]`sudo docker build -t kubermatic-dl:latest .`[/code] This instructs Docker to build a container for the code in your current working directory, `kubermatic-dl`.

  6. Check that your container is working by running it on your local machine: [code]`sudo docker run -d -p 5000:5000 kubermatic-dl`
```

  7. Check the status of your container by running `sudo docker ps -a`:

![Checking the container's status][9]

(Chaimaa Zyami, [CC BY-SA 4.0][8])




### Upload the model to Docker Hub

Before you can deploy the model on Kubernetes, it must be publicly available. Do that by adding it to [Docker Hub][10]. (You will need to create a Docker Hub account if you don't have one.)

  1. Log into your Docker Hub account: [code]`sudo docker login`
```
  2. Tag the image so you can refer to it for versioning when you upload it to Docker Hub: [code]

sudo docker tag &lt;your-image-id&gt; &lt;your-docker-hub-name&gt;/&lt;your-app-name&gt;

sudo docker push &lt;your-docker-hub-name&gt;/&lt;your-app-name&gt;
```

![Tagging the image][11]

(Chaimaa Zyami, [CC BY-SA 4.0][8])

  3. Check your image ID by running `sudo docker images`.




### Deploy the model to a Kubernetes cluster

  1. Create a project on the Kubermatic Kubernetes Platform, then create a Kubernetes cluster using the [quick start tutorial][12].

![Create a Kubernetes cluster][13]

(Chaimaa Zyami, [CC BY-SA 4.0][8])

  2. Download the `kubeconfig` used to configure access to your cluster, change it into the download directory, and export it into your environment:

![Kubernetes cluster example][14]

(Chaimaa Zyami, [CC BY-SA 4.0][8])

  3. Using `kubectl`, check the cluster information, such as the services that `kube-system` starts on your cluster: [code]`kubectl cluster-info`
```
![Checking the cluster info][15]

(Chaimaa Zyami, [CC BY-SA 4.0][8])

  4. To run the container in the cluster, you need to create a deployment (`deployment.yaml`) and apply it to the cluster: [code]

apiVersion: apps/v1
kind: Deployment
metadata:
  name: kubermatic-dl-deployment
spec:
  selector:
    matchLabels:
      app: kubermatic-dl
  replicas: 3
  template:
    metadata:
      labels:
        app: kubermatic-dl
    spec:
     containers:
     - name: kubermatic-dl
       image: kubermatic00/kubermatic-dl:latest
       imagePullPolicy: Always
       ports:
       - containerPort: 8080

[/code] [code]`kubectl apply -f deployment.yaml`
```

  5. To expose your deployment to the outside world, you need a service object that will create an externally reachable IP for your container: [code]`kubectl expose deployment kubermatic-dl-deployment  --type=LoadBalancer --port 80 --target-port 5000`
```
6. You're almost there! Check your services to determine the status of your deployment and get the IP address to call your image recognition API: [code]`kubectl get service`
```

![Get the IP address to call your image recognition API][16]

(Chaimaa Zyami, [CC BY-SA 4.0][8])

  7. Test your API with these two images using the external IP:

![Horse][17]

(Chaimaa Zyami, [CC BY-SA 4.0][8])

![Dog][18]

(Chaimaa Zyami, [CC BY-SA 4.0][8])

![Testing the API][19]

(Chaimaa Zyami, [CC BY-SA 4.0][8])




### Summary

In this tutorial, you created a deep learning model to be served as a [REST API][20] using Flask. It put the application inside a Docker container, uploaded the container to Docker Hub, and deployed it with Kubernetes. Then, with just a few commands, Kubermatic Kubernetes Platform deployed the app and exposed it to the world.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/deep-learning-model-kubernetes

作者：[Chaimaa Zyani][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/chaimaa
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain_computer_solve_fix_tool.png?itok=okq8joti (Brain on a computer screen)
[2]: https://www.loodse.com/products/kubermatic/
[3]: https://www.cs.toronto.edu/~kriz/cifar.html
[4]: https://gluon.mxnet.io/
[5]: https://mxnet.apache.org/
[6]: https://gluon-cv.mxnet.io/build/examples_classification/demo_cifar10.html
[7]: https://opensource.com/sites/default/files/uploads/trainingplot.png (Deep learning model training plot)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://opensource.com/sites/default/files/uploads/containerstatus.png (Checking the container's status)
[10]: https://hub.docker.com/
[11]: https://opensource.com/sites/default/files/uploads/tagimage.png (Tagging the image)
[12]: https://docs.kubermatic.com/kubermatic/v2.13/installation/install_kubermatic/_installer/
[13]: https://opensource.com/sites/default/files/uploads/kubernetesclusterempty.png (Create a Kubernetes cluster)
[14]: https://opensource.com/sites/default/files/uploads/kubernetesexamplecluster.png (Kubernetes cluster example)
[15]: https://opensource.com/sites/default/files/uploads/clusterinfo.png (Checking the cluster info)
[16]: https://opensource.com/sites/default/files/uploads/getservice.png (Get the IP address to call your image recognition API)
[17]: https://opensource.com/sites/default/files/uploads/horse.jpg (Horse)
[18]: https://opensource.com/sites/default/files/uploads/dog.jpg (Dog)
[19]: https://opensource.com/sites/default/files/uploads/testapi.png (Testing the API)
[20]: https://www.redhat.com/en/topics/api/what-is-a-rest-api
