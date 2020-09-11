[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Testing a Go-based S2I builder image)
[#]: via: (https://opensource.com/article/19/5/source-image-golang-part-3)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)

Testing a Go-based S2I builder image
======
In the third article in this series on Source-to-Image for Golang
applications, build your application image and take it out for a spin.
![gopher illustrations][1]

In the first two articles in this series, we explored the general [requirements of a Source To Image (S2I) system][2] and [prepared an environment][3] specifically for a Go (Golang) application. Now let's give it a spin.

### Building the builder image

Once the Dockerfile and Source-to-Image (S2I) scripts are ready, the Golang builder image can be created with the **docker build** command:


```
`docker build -t golang-builder .`
```

This will produce a builder image named **golang-builder** with the context of our current directory.

### Building the application image

The golang-builder image is not much use without an application to build. For this exercise, we will build a simple **hello-world** application.

#### GoHelloWorld

Let's meet our test app, [GoHelloWorld][4]. Download the latest [version of Go][5] if you want to follow along. There are two important (for this exercise) files in this repository:


```
// goHelloWorld.go
package main

import "fmt"

func main() {
fmt.Println("Hello World!")
}
```

This is a very basic app, but it will work fine for testing the builder image. We also have a basic test for GoHelloWorld:


```
// goHelloWorld_test.go
package main

import "testing"

func TestMain(t *testing.T) {
t.Log("Hello World!")
}
```

#### Build the application image

Building the application image entails running the **s2i build** command with arguments for the repository containing the code to build (or **.** to build with code from the current directory), the name of the builder image to use, and the name of the resulting application image to create.


```
`$ s2i build https://github.com/clcollins/goHelloWorld.git golang-builder go-hello-world`
```

To build from a local directory on a filesystem, replace the Git URL with a period to represent the current directory. For example:


```
`$ s2i build . golang-builder go-hello-world`
```

_Note:_ If a Git repository is initialized in the current directory, S2I will fetch the code from the repository URL rather than using the local code. This results in local, uncommitted changes not being used when building the image (if you're unfamiliar with what I mean by "uncommitted changes," brush up on your [Git terminology over here][6]). Directories that are not Git-initialized repositories behave as expected.

#### Run the application image

Once the application image is built, it can be tested by running it with the **Docker** command. Source-to-Image has replaced the **CMD** in the image with the run script created earlier so it will execute the **/go/src/app/app** binary created during the build process:


```
$ docker run go-hello-world
Hello World!
```

Success! We now have a compiled Go application inside a Docker image created by passing the contents of a Git repo to S2I and without needing a special Dockerfile for our application.

The application image we just built includes not only the application, but also its source code, test code, the S2I scripts, Golang libraries, and _much of the Debian Linux distribution_ (because the Golang image is based on the Debian base image). The resulting image is not small:


```
$ docker images | grep go-hello-world
go-hello-world latest 75a70c79a12f 4 minutes ago 789 MB
```

For applications written in languages that are interpreted at runtime and depend on linked libraries, like Ruby or Python, having all the source code and operating system are necessary to run. The build images will be pretty large as a result, but at least we know it will be able to run. With these languages, we could stop here with our S2I builds.

There is the option, however, to more explicitly define the production requirements for the application.

Since the resulting application image would be the same image that would run the production app, I want to assure the required ports, volumes, and environment variables are added to the Dockerfile for the builder image. By writing these in a declarative way, our app is closer to the [Twelve-Factor App][7] recommended practice. For example, if we were to use the builder image to create application images for a Ruby on Rails application running [Puma][8], we would want to open a port to access the webserver. We should add the line **PORT 3000** in the builder Dockerfile so it can be inherited by all the images generated from it.

But for the Go app, we can do better.

### Build a runtime image

Since our builder image created a statically compiled Go binary with our application, we can create a final "runtime" image containing _only_ the binary and none of the other cruft.

Once the application image is created, the compiled GoHelloWorld app can be extracted and put into a new, empty image using the save-artifacts script.

#### Runtime files

Only the application binary and a Dockerfile are required to create the runtime image.

##### Application binary

Inside of the application image, the save-artifacts script is written to stream a tar archive of the app binary to stdout. We can check the files included in the tar archive created by save-artifacts with the **-vt** flags for tar:


```
$ docker run go-hello-world /usr/libexec/s2i/save-artifacts | tar -tvf -
-rwxr-xr-x 1001/root 1997502 2019-05-03 18:20 app
```

If this results in errors along the lines of "This does not appear to be a tar archive," the save-artifacts script is probably outputting other data in addition to the tar stream, as mentioned above. We must make sure to suppress all output other than the tar stream.

If everything looks OK, we can use **save-artifacts** to copy the binary out of the application image:


```
`$ docker run go-hello-world /usr/libexec/s2i/save-artifacts | tar -xf -`
```

This will copy the app file into the current directory, ready to be added to its own image.

##### Dockerfile

The Dockerfile is extremely simple, with only three lines. The **FROM scratch** source denotes that it uses an empty, blank parent image. The rest of the Dockerfile specifies copying the app binary into **/app** in the image and using that binary as the image **ENTRYPOINT** :


```
FROM scratch
COPY app /app
ENTRYPOINT ["/app"]
```

Save this Dockerfile as **Dockerfile-runtime**.

Why **ENTRYPOINT** and not **CMD**? We could do either, but since there is nothing else in the image (no filesystem, no shell), we couldn't run anything else anyway.

#### Building the runtime image

With the Dockerfile and binary ready to go, we can build the new runtime image:


```
`$ docker build -f Dockerfile-runtime -t go-hello-world:slim .`
```

The new runtime image is considerably smaller—just 2MB!


```
$ docker images | grep -e 'go-hello-world *slim'
go-hello-world slim 4bd091c43816 3 minutes ago 2 MB
```

We can test that it still works as expected with **docker run** :


```
$ docker run go-hello-world:slim
Hello World!
```

### Bootstrapping s2i with s2i create

While we hand-created all the S2I files in this example, the **s2i** command has a sub-command to help scaffold all the files we might need for a Source-to-Image build: **s2i create**.

Using the **s2i create** command, we can generate a new project, creatively named **go-hello-world-2** in the **./ghw2** directory:


```
$ s2i create go-hello-world-2 ./ghw2
$ ls ./ghw2/
Dockerfile Makefile README.md s2i test
```

The **create** sub-command creates a placeholder Dockerfile, a README.md with information about how to use Source-to-Image, some example S2I scripts, a basic test framework, and a Makefile. The Makefile is a great way to automate building and testing the Source-to-Image builder image. Out of the box, running **make** will build our image, and it can be extended to do more. For example, we could add steps to build a base application image, run tests, or generate a runtime Dockerfile.

### Conclusion

In this tutorial, we have learned how to use Source-to-Image to build a custom Golang builder image, create an application image using **s2i build** , and extract the application binary to create a super-slim runtime image.

In a future extension to this series, I would like to look at how to use the builder image we created with [OKD][9] to automatically deploy our Golang apps with **buildConfigs** , **imageStreams** , and **deploymentConfigs**. Please let me know in the comments if you are interested in me continuing the series, and thanks for reading.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/source-image-golang-part-3

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/go-golang.png?itok=OAW9BXny (gopher illustrations)
[2]: https://opensource.com/article/19/5/source-image-golang-part-1
[3]: https://opensource.com/article/19/5/source-image-golang-part-2
[4]: https://github.com/clcollins/goHelloWorld.git
[5]: https://golang.org/doc/install
[6]: /article/19/2/git-terminology
[7]: https://12factor.net/
[8]: http://puma.io/
[9]: https://okd.io/
