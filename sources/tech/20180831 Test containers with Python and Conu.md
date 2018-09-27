Test containers with Python and Conu
======

![](https://fedoramagazine.org/wp-content/uploads/2018/08/conu-816x345.jpg)

More and more developers are using containers to develop and deploy their applications. This means that easily testing containers is also becoming important. [Conu][1] (short for container utilities) is a Python library that makes it easy to write tests for your containers. This article shows you how to use it to test your containers.

### Getting started

First you need a container application to test. For that, the following commands create a new directory with a container Dockerfile, and a Flask application to be served by the container.
```
$ mkdir container_test
$ cd container_test
$ touch Dockerfile
$ touch app.py

```

Copy the following code inside the app.py file. This is the customary basic Flask application that returns the string “Hello Container World!”
```
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
 return 'Hello Container World!'

if __name__ == '__main__':
 app.run(debug=True,host='0.0.0.0')

```

### Create and Build a Test Container

To build the test container, add the following instructions to the Dockerfile.
```
FROM registry.fedoraproject.org/fedora-minimal:latest
RUN microdnf -y install python3-flask && microdnf clean all
ADD ./app.py /srv
CMD ["python3", "/srv/app.py"]

```

Then build the container using the Docker CLI tool.
```
$ sudo dnf -y install docker
$ sudo systemctl start docker
$ sudo docker build . -t flaskapp_container

```

Note : The first two commands are only needed if Docker is not installed on your system.

After the build use the following command to run the container.
```
$ sudo docker run -p 5000:5000 --rm flaskapp_container
* Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
* Restarting with stat
* Debugger is active!
* Debugger PIN: 473-505-51

```

Finally, use curl to check that the Flask application is correctly running inside the container:
```
$ curl http://127.0.0.1:5000
Hello Container World!

```

With the flaskapp_container now running and ready for testing, you can stop it using **Ctrl+C**.

### Create a test script

Before you write the test script, you must install conu. Inside the previously created container_test directory run the following commands.
```
$ python3 -m venv .venv
$ source .venv/bin/activate
(.venv)$ pip install --upgrade pip
(.venv)$ pip install conu

$ touch test_container.py

```

Then copy and save the following script in the test_container.py file.
```
import conu

PORT = 5000

with conu.DockerBackend() as backend:
 image = backend.ImageClass("flaskapp_container")
 options = ["-p", "5000:5000"]
 container = image.run_via_binary(additional_opts=options)

 try:
 # Check that the container is running and wait for the flask application to start.
 assert container.is_running()
 container.wait_for_port(PORT)

 # Run a GET request on / port 5000.
 http_response = container.http_request(path="/", port=PORT)

 # Check the response status code is 200
 assert http_response.ok

 # Get the response content
 response_content = http_response.content.decode("utf-8")

 # Check that the "Hello Container World!" string is served.
 assert "Hello Container World!" in response_content

 # Get the logs from the container
 logs = [line for line in container.logs()]
 # Check the the Flask application saw the GET request.
 assert b'"GET / HTTP/1.1" 200 -' in logs[-1]

 finally:
 container.stop()
 container.delete()

```

#### Test Setup

The script starts by setting conu to use Docker as a backend to run the container. Then it sets the container image to use the flaskapp_container you built in the first part of this tutorial.

The next step is to configure the options needed to run the container. In this example, the Flask application serves the content on port 5000. Therefore you need to expose this port and map it to the same port on the host.

Finally, the script starts the container, and it’s now ready to be tested.

#### Testing methods

Before testing a container, check that the container is running and ready. The example script is using container.is_running and container.wait_for_port. These methods ensure the container is running and the service is available on the expected port.

The container.http_request is a wrapper around the [requests][2] library which makes it convenient to send HTTP requests during the tests. This method returns a [requests.Response][3]object, so it’s easy to access the content of the response for testing.

Conu also gives access to the container logs. Once again, this can be useful during testing. In the example above, the container.logs method returns the container logs. You can use them to assert that a specific log was printed, or for example that no exceptions were raised during testing.

Conu provides many other useful methods to interface with containers. A full list of the APIs is available in the [documentation][4]. You can also consult the examples available on [GitHub][5].

All the code and files needed to run this tutorial are available on [GitHub][6] as well. For readers who want to take this example further, you can look at using [pytest][7] to run the tests and build a container test suite.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/test-containers-python-conu/

作者：[Clément Verna][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/cverna/
[1]: https://github.com/user-cont/conu
[2]: http://docs.python-requests.org/en/master/
[3]: http://docs.python-requests.org/en/master/api/#requests.Response
[4]: https://conu.readthedocs.io/en/latest/index.html
[5]: https://github.com/user-cont/conu/tree/master/docs/source/examples
[6]: https://github.com/cverna/container_test_script
[7]: https://docs.pytest.org/en/latest/
