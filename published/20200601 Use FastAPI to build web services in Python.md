[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12280-1.html)
[#]: subject: (Use FastAPI to build web services in Python)
[#]: via: (https://fedoramagazine.org/use-fastapi-to-build-web-services-in-python/)
[#]: author: (Clément Verna https://fedoramagazine.org/author/cverna/)

使用 Python FastAPI 构建 Web 服务
======

![](https://img.linux.net.cn/data/attachment/album/202006/04/105930wr333sx3erz3k2ur.jpg)

[FastAPI][2] 是一个使用 Python 编写的 Web 框架，还应用了 Python asyncio 库中最新的优化。本文将会介绍如何搭建基于容器的开发环境，还会展示如何使用 FastAPI 实现一个小型 Web 服务。

### 起步

我们将使用 Fedora 作为基础镜像来搭建开发环境，并使用 Dockerfile 为镜像注入 FastAPI、[Uvicorn][3] 和 [aiofiles][4] 这几个包。

```
FROM fedora:32
RUN dnf install -y python-pip \
    && dnf clean all \
    && pip install fastapi uvicorn aiofiles
WORKDIR /srv
CMD ["uvicorn", "main:app", "--reload"]
```

在工作目录下保存 `Dockerfile` 之后，执行 `podman` 命令构建容器镜像。

```
$ podman build -t fastapi .
$ podman images
REPOSITORY TAG IMAGE ID CREATED SIZE
localhost/fastapi latest 01e974cabe8b 18 seconds ago 326 MB
```

下面我们可以开始创建一个简单的 FastAPI 应用程序，并通过容器镜像运行。

```
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello Fedora Magazine!"}
```

将上面的代码保存到 `main.py` 文件中，然后执行以下命令开始运行：

```
$ podman run --rm -v $PWD:/srv:z -p 8000:8000 --name fastapi -d fastapi
$ curl http://127.0.0.1:8000
{"message":"Hello Fedora Magazine!"
```

这样，一个基于 FastAPI 的 Web 服务就跑起来了。由于指定了 `--reload` 参数，一旦 `main.py` 文件发生了改变，整个应用都会自动重新加载。你可以尝试将返回信息 `"Hello Fedora Magazine!"` 修改为其它内容，然后观察效果。

可以使用以下命令停止应用程序：

```
$ podman stop fastapi
```

### 构建一个小型 Web 服务

接下来我们会构建一个需要 I/O 操作的应用程序，通过这个应用程序，我们可以看到 FastAPI 自身的特点，以及它在性能上有什么优势（可以在[这里][5]参考 FastAPI 和其它 Python Web 框架的对比）。为简单起见，我们直接使用 `dnf history` 命令的输出来作为这个应用程序使用的数据。

首先将 `dnf history` 命令的输出保存到文件。

```
$ dnf history | tail --lines=+3 > history.txt
```

在上面的命令中，我们使用 `tail` 去除了 `dnf history` 输出内容中无用的表头信息。剩余的每一条 `dnf` 事务都包括了以下信息：

  * `id`：事务编号（每次运行一条新事务时该编号都会递增）
  * `command`：事务中运行的 `dnf` 命令
  * `date`：执行事务的日期和时间

然后修改 `main.py` 文件将相关的数据结构添加进去。

```
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class DnfTransaction(BaseModel):
    id: int
    command: str
    date: str
```

FastAPI 自带的 [pydantic][6] 库让你可以轻松定义一个数据类，其中的类型注释对数据的验证也提供了方便。

再增加一个函数，用于从 `history.txt` 文件中读取数据。

```
import aiofiles

from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class DnfTransaction(BaseModel):
    id: int
    command: str
    date: str


async def read_history():
    transactions = []
    async with aiofiles.open("history.txt") as f:
        async for line in f:
            transactions.append(DnfTransaction(
                id=line.split("|")[0].strip(" "),
                command=line.split("|")[1].strip(" "),
                date=line.split("|")[2].strip(" ")))
    return transactions
```

这个函数中使用了 `aiofiles` 库，这个库提供了一个异步 API 来处理 Python 中的文件，因此打开文件或读取文件的时候不会阻塞其它对服务器的请求。

最后，修改 `root` 函数，让它返回事务列表中的数据。

```
@app.get("/")
async def read_root():
    return await read_history()
```

执行以下命令就可以看到应用程序的输出内容了。

```
$ curl http://127.0.0.1:8000 | python -m json.tool
[
{
"id": 103,
"command": "update",
"date": "2020-05-25 08:35"
},
{
"id": 102,
"command": "update",
"date": "2020-05-23 15:46"
},
{
"id": 101,
"command": "update",
"date": "2020-05-22 11:32"
},
....
]
```

### 总结

FastAPI 提供了一种使用 asyncio 构建 Web 服务的简单方法，因此它在 Python Web 框架的生态中日趋流行。要了解 FastAPI 的更多信息，欢迎查阅 [FastAPI 文档][2]。

本文中的代码可以在 [GitHub][7] 上找到。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-fastapi-to-build-web-services-in-python/

作者：[Clément Verna][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/cverna/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/05/fastapi-python-816x345.jpg
[2]: https://fastapi.tiangolo.com/
[3]: https://www.uvicorn.org/
[4]: https://github.com/Tinche/aiofiles
[5]: https://www.techempower.com/benchmarks/#section=test&runid=7464e520-0dc2-473d-bd34-dbdfd7e85911&hw=ph&test=composite&l=z8kflr-v&a=2&f=jz8cg-0-3s-0-3k-6bo-0-0-18y74-8s5c-0
[6]: https://pydantic-docs.helpmanual.io/
[7]: https://github.com/cverna/fastapi_app
[8]: https://unsplash.com/@jankubita?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[9]: https://unsplash.com/s/photos/fast-snake?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
