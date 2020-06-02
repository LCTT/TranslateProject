[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use FastAPI to build web services in Python)
[#]: via: (https://fedoramagazine.org/use-fastapi-to-build-web-services-in-python/)
[#]: author: (Clément Verna https://fedoramagazine.org/author/cverna/)

Use FastAPI to build web services in Python
======

![][1]

_[FastAPI][2]_ is a modern Python web framework that leverage the latest Python improvement in asyncio. In this article you will see how to set up a container based development environment and implement a small web service with FastAPI.

### Getting Started

The development environment can be set up using the Fedora container image. The following Dockerfile prepares the container image with FastAPI, [Uvicorn][3] and [aiofiles][4].

```
FROM fedora:32
RUN dnf install -y python-pip \
    && dnf clean all \
    && pip install fastapi uvicorn aiofiles
WORKDIR /srv
CMD ["uvicorn", "main:app", "--reload"]
```

After saving this Dockerfile in your working directory, build the container image using podman.

```
$ podman build -t fastapi .
$ podman images
REPOSITORY TAG IMAGE ID CREATED SIZE
localhost/fastapi latest 01e974cabe8b 18 seconds ago 326 MB
```

Now let’s create a basic FastAPI program and run it using that container image.

```
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello Fedora Magazine!"}
```

Save that source code in a _main.py_ file and then run the following command to execute it:

```
$ podman run --rm -v $PWD:/srv:z -p 8000:8000 --name fastapi -d fastapi
$ curl http://127.0.0.1:8000
{"message":"Hello Fedora Magazine!"
```

You now have a running web service using FastAPI. Any changes to _main.py_ will be automatically reloaded. For example, try changing the “Hello Fedora Magazine!” message.

To stop the application, run the following command.

```
$ podman stop fastapi
```

### Building a small web service

To really see the benefits of FastAPI and the performance improvement it brings ([see comparison][5] with other Python web frameworks), let’s build an application that manipulates some I/O. You can use the output of the _dnf history_ command as data for that application.

First, save the output of that command in a file.

```
$ dnf history | tail --lines=+3 > history.txt
```

The command is using _tail_ to remove the headers of _dnf history_ which are not needed by the application. Each dnf transaction can be represented with the following information:

  * id : number of the transaction (increments every time a new transaction is run)
  * command : the dnf command run during the transaction
  * date: the date and time the transaction happened



Next, modify the _main.py_ file to add that data structure to the application.

```
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class DnfTransaction(BaseModel):
    id: int
    command: str
    date: str
```

FastAPI comes with the [pydantic][6] library which allow you to easily build data classes and benefit from type annotation to validate your data.

Now, continue building the application by adding a function that will read the data from the _history.txt_ file.

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

This function makes use of the _[aiofiles][4]_ library which provides an asyncio API to manipulate files in Python. This means that opening and reading the file will not block other requests made to the server.

Finally, change the root function to return the data stored in the transactions list.

```
@app.get("/")
async def read_root():
    return await read_history()
```

To see the output of the application, run the following command

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

### Conclusion

_FastAPI_ is gaining a lot a popularity in the Python web framework ecosystem because it offers a simple way to build web services using asyncio. You can find more information about _FastAPI_ in the [documentation][2].

The code of this article is available in [this GitHub repository][7].

* * *

_Photo by [Jan Kubita][8] on [Unsplash][9]._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-fastapi-to-build-web-services-in-python/

作者：[Clément Verna][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
