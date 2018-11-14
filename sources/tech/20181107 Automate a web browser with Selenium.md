translating---geekpi

Automate a web browser with Selenium
======
![](https://fedoramagazine.org/wp-content/uploads/2018/10/selenium-816x345.jpg)

[Selenium][1] is a great tool for browser automation. With Selenium IDE you can record sequences of commands (like click, drag and type), validate the result and finally store this automated test for later. This is great for active development in the browser. But when you want to integrate these tests with your CI/CD flow it’s time to move on to Selenium WebDriver.

WebDriver exposes an API with bindings for many programming languages, which lets you integrate browser tests with your other tests. This post shows you how to run WebDriver in a container and use it together with a Python program.

### Running Selenium with Podman

Podman is the container runtime in the following examples. See [this previous post][2] for how to get started with Podman.

This example uses a standalone container for Selenium that contains both the WebDriver server and the browser itself. To launch the server container in the background run the following comand:

```
$ podman run -d --network host --privileged --name server \
 docker.io/selenium/standalone-firefox
```

When you run the container with the privileged flag and host networking, you can connect to this container later from a Python program. You do not need to use sudo.

### Using Selenium from Python

Now you can provide a simple program that uses this server. This program is minimal, but should give you an idea about what you can do:

```
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

server ="http://127.0.0.1:4444/wd/hub"

driver = webdriver.Remote(command_executor=server,
 desired_capabilities=DesiredCapabilities.FIREFOX)

print("Loading page...")
driver.get("https://fedoramagazine.org/")
print("Loaded")
assert "Fedora" in driver.title

driver.quit()
print("Done.")
```

First the program connects to the container you already started. Then it loads the Fedora Magazine web page and asserts that “Fedora” is part of the page title. Finally, it quits the session.

Python bindings are required in order to run the program. And since you’re already using containers, why not do this in a container as well? Save the following to a file name Dockerfile:

```
FROM fedora:29
RUN dnf -y install python3
RUN pip3 install selenium
```

Then build your container image using Podman, in the same folder as Dockerfile:

```
$ podman build -t selenium-python .
```

To run your program in the container, mount the file containing your Python code as a volume when you run the container:

```
$ podman run -t --rm --network host \
 -v $(pwd)/browser-test.py:/browser-test.py:z \
 selenium-python python3 browser-test.py
```

The output should look like this:

```
Loading page...
Loaded
Done.
```

### What to do next

The example program above is minimal, and perhaps not that useful. But it barely scratched the surface of what’s possible! Check out the documentation for [Selenium][3] and for the [Python bindings][4]. There you’ll find examples for how to locate elements in a page, handle popups, or fill in forms. Drag and drop is also possible, and of course waiting for various events.

With a few nice tests implemented, you may want to include the whole thing in your CI/CD pipeline. Luckily enough, this is fairly straightforward since everything was containerized to begin with.

You may also be interested in setting up a [grid][5] to run the tests in parallel. Not only does this help speed things up, but it also allows you to test several different browsers at the same time.

### Cleaning up

When you’re done playing with your containers, you can stop and remove the standalone container with the following commands:

```
$ podman stop server
$ podman rm server
```

If you also want to free up disk space, run these commands to remove the images as well:

```
$ podman rmi docker.io/selenium/standalone-firefox
$ podman rmi selenium-python fedora:29
```

### Conclusion

In this post, you’ve seen how easy it is to get started with Selenium using container technology. It allowed you to automate interaction with a website, as well as test the interaction. Podman allowed you to run the containers necessary without super user privileges or the Docker daemon. Finally, the Python bindings let you use normal Python code to interact with the browser.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/automate-web-browser-selenium/

作者：[Lennart Jern][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/lennartj/
[b]: https://github.com/lujun9972
[1]: https://www.seleniumhq.org/
[2]: https://fedoramagazine.org/running-containers-with-podman/
[3]: https://www.seleniumhq.org/docs/
[4]: https://selenium-python.readthedocs.io
[5]: https://www.seleniumhq.org/docs/07_selenium_grid.jsp
