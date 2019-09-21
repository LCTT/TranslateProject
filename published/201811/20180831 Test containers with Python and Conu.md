用 Python 和 Conu 测试容器
======

![](https://fedoramagazine.org/wp-content/uploads/2018/08/conu-816x345.jpg)

越来越多的开发人员使用容器开发和部署他们的应用。这意味着可以轻松地测试容器也变得很重要。[Conu][1] (container utilities 的简写) 是一个 Python 库，让你编写容器测试变得简单。本文向你介绍如何使用它测试容器。

### 开始吧

首先，你需要一个容器程序来测试。为此，以下命令创建一个包含一个容器的 Dockerfile 和一个被容器伺服的 Flask 应用程序的文件夹。

```bash
$ mkdir container_test
$ cd container_test
$ touch Dockerfile
$ touch app.py
```

将以下代码复制到 `app.py` 文件中。这是惯常的基本 Flask 应用，它返回字符串 “Hello Container World！”。

```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello Container World!'

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')
```

### 创建和构建测试容器

为了构建测试容器，将以下指令添加到 Dockerfile。

```dockerfile
FROM registry.fedoraproject.org/fedora-minimal:latest
RUN microdnf -y install python3-flask && microdnf clean all
ADD ./app.py /srv
CMD ["python3", "/srv/app.py"]
```

然后使用 Docker CLI 工具构建容器。

```bash
$ sudo dnf -y install docker
$ sudo systemctl start docker
$ sudo docker build . -t flaskapp_container
```

提示：只有在系统上未安装 Docker 时才需要前两个命令。

构建之后使用以下命令运行容器。

```bash
$ sudo docker run -p 5000:5000 --rm flaskapp_container
* Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
* Restarting with stat
* Debugger is active!
* Debugger PIN: 473-505-51
```

最后，使用 `curl` 检查 Flask 应用程序是否在容器内正确运行：

```bash
$ curl http://127.0.0.1:5000
Hello Container World!
```

现在，flaskapp_container 正在运行并准备好进行测试，你可以使用 `Ctrl+C` 将其停止。

### 创建测试脚本

在编写测试脚本之前，必须安装 `conu`。在先前创建的 `container_test` 目录中，运行以下命令。

```bash
$ python3 -m venv .venv
$ source .venv/bin/activate
(.venv)$ pip install --upgrade pip
(.venv)$ pip install conu
$ touch test_container.py
```

然后将以下脚本复制并保存在 `test_container.py` 文件中。

```python
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

#### 测试设置

这个脚本首先设置 `conu` 使用 Docker 作为后端来运行容器。然后它设置容器镜像以使用你在本教程第一部分中构建的 flaskapp_container。

下一步是配置运行容器所需的选项。在此示例中，Flask 应用在端口5000上提供内容。于是你需要暴露此端口并将其映射到主机上的同一端口。

最后，用这个脚本启动容器，现在可以测试了。

#### 测试方法

在测试容器之前，检查容器是否正在运行并准备就绪。示范脚本使用 `container.is_running` 和 `container.wait_for_port`。这些方法可确保容器正在运行，并且服务在预设端口上可用。

`container.http_request` 是 [request][2] 库的包装器，可以方便地在测试期间发送 HTTP 请求。这个方法返回[requests.Responseobject][3]，因此可以轻松地访问响应的内容以进行测试。

`conu` 还可以访问容器日志。又一次，这在测试期间非常有用。在上面的示例中，`container.logs` 方法返回容器日志。你可以使用它们断言打印了特定日志，或者，例如在测试期间没有异常被引发。

`conu` 提供了许多与容器接合的有用方法。[文档][4]中提供了完整的 API 列表。你还可以参考 [GitHub][5] 上提供的示例。

运行本教程所需的所有代码和文件也可以在 [GitHub][6] 上获得。 对于想要进一步采用这个例子的读者，你可以看看使用 [pytest][7] 来运行测试并构建一个容器测试套件。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/test-containers-python-conu/

作者：[Clément Verna][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[GraveAccent](https://github.com/GraveAccent)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/cverna/
[1]: https://github.com/user-cont/conu
[2]: http://docs.python-requests.org/en/master/
[3]: http://docs.python-requests.org/en/master/api/#requests.Response
[4]: https://conu.readthedocs.io/en/latest/index.html
[5]: https://github.com/user-cont/conu/tree/master/docs/source/examples
[6]: https://github.com/cverna/container_test_script
[7]: https://docs.pytest.org/en/latest/
