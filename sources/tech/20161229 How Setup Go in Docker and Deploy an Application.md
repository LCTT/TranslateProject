translating---geekpi

Hi, in this tutorial we are going to learn how to deploy a golang web application with a docker. You may be already aware of the fact that docker is entirely written in golang due to its high performance and reliability. Before we dive in details, make sure that you have already installed docker and golang and basic understanding of both of them.

###  About docker

Docker is an open-source program that enables a Linux application bundled with complete dependencies and packaged as container sharing the same kernel of host operating system. On the other hand, the hyper-visor based virtualization OS container like VMware provides a high level of isolation and security since the communication between guest and host is accomplished through hyper-visor as they don't share kernel space. This led to performance overhead due to hardware emulation. So the container virtualization was born that ensures a lightweight virtual environment which groups and isolates a set of processes and resources from the host as well as other containers. Therefor processes inside the container cannot see processes or resources outside the container.

### Create "Hello World" web apps in GO

Let us first create a directory for GO apps which will display "Hello World in the browser". Create a web-app directory and make it current directory. Navigate to web-app directory and edit a file by the name "main.go"

    root@demohost:~# mkdir web-app
    root@demohost:~# cd web-app/
    root@demohost:~/web-app# vim.tiny main.go

    package main
    import (
    "fmt"
    "net/http"
    )

    func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello %s", r.URL.Path[1:])
    }

    func main() {
    http.HandleFunc("/World", handler)
    http.ListenAndServe(":8080", nil)
    }

Run the above "Hello World" GO application with the following command. Test it by pointing your favourite browser to http://127.0.0.1:8080/World You will see the "Hello World" message in the browser.

    root@demohost:~/web-app# PORT=8080 go run main.go

Our next step is to containerize the above application in a docker. Therefore we will create a dockerfile which will tells the docker how to containerize our web-app.

    root@demohost:~/web-app# vim.tiny Dockerfile

    # Get latest golang docker image.
    FROM golang:latest

    # Create a directory inside the container to store our web-app and then make it working directory.
    RUN mkdir -p /go/src/web-app
    WORKDIR /go/src/web-app

    # Copy the web-app directory into the container.
    COPY . /go/src/web-app

    # Download and install third party dependencies into the container.
    RUN go-wrapper download
    RUN go-wrapper install

    # Set the PORT environment variable
    ENV PORT 8080

    # Expose port 8080 to the host so that outer-world can access your application
    EXPOSE 8080

    # Tell Docker what command to run when the container starts
    CMD ["go-wrapper", "run"]

### Build / Run the container

Build your GO web-app with the following command, You will get confirmation after successful build.

    root@demohost:~/web-app# docker build --rm -t web-app .
    Sending build context to Docker daemon 3.584 kB
    Step 1 : FROM golang:latest
    latest: Pulling from library/golang
    386a066cd84a: Already exists
    75ea84187083: Pull complete
    88b459c9f665: Pull complete
    a31e17eb9485: Pull complete
    1b272d7ab8a4: Pull complete
    eca636a985c1: Pull complete
    08158782d330: Pull complete
    Digest: sha256:02718aef869a8b00d4a36883c82782b47fc01e774d0ac1afd434934d8ccfee8c
    Status: Downloaded newer image for golang:latest
    ---> 9752d71739d2
    Step 2 : RUN mkdir -p /go/src/web-app
    ---> Running in 9aef92fff9e8
    ---> 49936ff4f50c
    Removing intermediate container 9aef92fff9e8
    Step 3 : WORKDIR /go/src/web-app
    ---> Running in 58440a93534c
    ---> 0703574296dd
    Removing intermediate container 58440a93534c
    Step 4 : COPY . /go/src/web-app
    ---> 82be55bc8e9f
    Removing intermediate container cae309ac7757
    Step 5 : RUN go-wrapper download
    ---> Running in 6168e4e96ab1
    + exec go get -v -d
    ---> 59664b190fee
    Removing intermediate container 6168e4e96ab1
    Step 6 : RUN go-wrapper install
    ---> Running in e56f093b6f03
    + exec go install -v
    web-app
    ---> 584cd410fdcd
    Removing intermediate container e56f093b6f03
    Step 7 : ENV PORT 8080
    ---> Running in 298e2a415819
    ---> c87fd2b43977
    Removing intermediate container 298e2a415819
    Step 8 : EXPOSE 8080
    ---> Running in 4f639a3790a7
    ---> 291167229d6f
    Removing intermediate container 4f639a3790a7
    Step 9 : CMD go-wrapper run
    ---> Running in 6cb6bc28e406
    ---> b32ca91bdfe0
    Removing intermediate container 6cb6bc28e406
    Successfully built b32ca91bdfe0

Its time to run our GO web-app, To do that execute the following command.

    root@demohost:~/web-app# docker run -p 8080:8080 --name="test" -d web-app
    7644606b9af28a3ef1befd926f216f3058f500ffad44522c1d4756c576cfa85b

View your web-apps in http://localhost:8080/World You have successfully containerized a Go web-app which is repeatable/deterministic. Use the following commands to  start, stop and check the status of the container.

    List all containers
    root@demohost:~/ docker ps -a

    Start the container using it's id
    root@demohost:~/ docker start CONTAINER_ID_OF_WEB_APP

    Stop the container using it's id
    root@demohost:~/ docker stop CONTAINER_ID_OF_WEB_APP

### Rebuild docker image

Lets suppose you are developing a web application and changing the codes. Now to view the result after updating of codes, you need to rebuild the docker image, stop the old image and run the new one and this continues for every time you change the code. To make this process automatic we will use docker volumes to share a directory between host and the container. What it means that you don't have to rebuild images to make changes inside the container. Now how the container will detect if you have made changes to the source code of your web apps ? The answer is there is a nice tool called "Gin" [https://github.com/codegangsta/gin][1]  that detects if you have made any changes to the source code, rebuilds the image/binary and run the processes inside the container with new updated codes.

To make this process automatic, we will edit the Dockerfile and install Gin and execute it as entry command. We will expose the port 3030 ( Gin proxy ) instead of 8080\. Gin proxy will forward traffic to port 8080 of web apps.

    root@demohost:~/web-app# vim.tiny Dockerfile

    # Get latest golang docker image.
    FROM golang:latest

    # Create a directory inside the container to store our web-app and then make it working directory.
    RUN mkdir -p /go/src/web-app
    WORKDIR /go/src/web-app

    # Copy the web-app directory into the container.
    COPY . /go/src/web-app

    # Download and install third party dependencies into the container.
    RUN go get github.com/codegangsta/gin
    RUN go-wrapper download
    RUN go-wrapper install

    # Set the PORT environment variable
    ENV PORT 8080

    # Expose port 8080 to the host so that outer-world can access your application
    EXPOSE 3030

    # Run Gin when the container starts
    CMD gin run

    # Tell Docker what command to run when the container starts
    CMD ["go-wrapper", "run"]

Now build the image and start the container

    root@demohost:~/web-app# docker build --rm -t web-app .

We will run the docker with  current working directory as root of web-app directory and  link CWD to the app directory in the container by  exposing port no 3030

    root@demohost:~/web-app# docker run -p 3030:3030 -v `pwd`:/go/src/web-app --name="test" -d web-app

Point your browser to http://localhost:3030/World , you will be able to view your web apps. Now if you change anything in the code, it will be reflected  in the browser once you refresh the browser.

### Conclusion

And that’s all, our Go web application is running in Ubuntu 16.04 Docker container! You can  extend the current web apps by using a GO framework for rapid development to develop APIs, web apps and back-end services quickly.

--------------------------------------------------------------------------------

via: http://linoxide.com/containers/setup-go-docker-deploy-application/

作者：[Dwijadas Dey][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/dwijadasd/
[1]:https://github.com/codegangsta/gin