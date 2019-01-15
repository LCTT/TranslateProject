使用 Selenium 自动化 Web 浏览器
======

![](https://fedoramagazine.org/wp-content/uploads/2018/10/selenium-816x345.jpg)

[Selenium][1] 是浏览器自动化的绝佳工具。使用 Selenium IDE，你可以录制命令序列（如单击、拖动和输入），验证结果并最终存储此自动化测试供日后使用。这非常适合在浏览器中进行活跃开发。但是当你想要将这些测试与 CI/CD 流集成时，是时候使用 Selenium WebDriver 了。

WebDriver 公开了一个绑定了许多编程语言的 API，它允许你将浏览器测试与其他测试集成。这篇文章向你展示了如何在容器中运行 WebDriver 并将其与 Python 程序一起使用。

### 使用 Podman 运行 Selenium

Podman 是下面例子的容器运行时。有关如何开始使用 Podman 的信息，请参见[此前文章][2]。

此例使用了 Selenium 的独立容器，其中包含 WebDriver 服务器和浏览器本身。要在后台启动服务器容器，请运行以下命令：

```
$ podman run -d --network host --privileged --name server docker.io/selenium/standalone-firefox
```

当你使用特权标志和主机网络运行容器时，你可以稍后从在 Python 中连接到此容器。你不需要使用 `sudo`。

### 在 Python 中使用 Selenium

现在你可以提供一个使用此服务器的简单程序。这个程序很小，但应该会让你知道可以做什么：

```
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

首先，程序连接到你已经启动的容器。然后它加载 Fedora Magazine 网页并判断 “Fedora” 是页面标题的一部分。最后，它退出会话。

需要 Python 绑定才能运行此程序。既然你已经在使用容器了，为什么不在容器中这样做呢？将以下内容保存到 Dockerfile 中：

```
FROM fedora:29
RUN dnf -y install python3
RUN pip3 install selenium
```

然后使用 Podman 在与 Dockerfile 相同的文件夹中构建容器镜像：

```
$ podman build -t selenium-python .
```

要在容器中运行程序，在运行容器时将包含 Python 代码的文件作为卷挂载：

```
$ podman run -t --rm --network host \
 -v $(pwd)/browser-test.py:/browser-test.py:z \
 selenium-python python3 browser-test.py
```

输出看上去像这样：

```
Loading page...
Loaded
Done.
```

### 接下来做什么

上面的示例程序是最小的，也许没那么有用。但这仅仅是最表面的东西！查看 [Selenium][3] 和 [Python 绑定][4] 的文档。在那里，你将找到有关如何在页面中查找元素、处理弹出窗口或填写表单的示例。拖放也是可能的，当然还有等待事件。

在实现一些不错的测试后，你可能希望将它们包含在 CI/CD 流程中。幸运的是，这是相当直接的，因为一切都是容器化的。

你可能也有兴趣设置 [grid][5] 来并行运行测试。这不仅有助于加快速度，还允许你同时测试多个不同的浏览器。

### 清理

当你容器使用完后，可以使用以下命令停止并删除独立容器：

```
$ podman stop server
$ podman rm server
```

如果你还想释放磁盘空间，请运行以下命令删除镜像：

```
$ podman rmi docker.io/selenium/standalone-firefox
$ podman rmi selenium-python fedora:29
```

### 总结

在本篇中，你已经看到使用容器技术开始使用 Selenium 是多么容易。它允许你自动化与网站的交互，以及测试交互。Podman 允许你在没有超级用户权限或 Docker 守护程序的情况下运行所需的容器。最后，Python 绑定允许你使用普通的 Python 代码与浏览器进行交互。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/automate-web-browser-selenium/

作者：[Lennart Jern][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/lennartj/
[b]: https://github.com/lujun9972
[1]: https://www.seleniumhq.org/
[2]: https://linux.cn/article-10156-1.html
[3]: https://www.seleniumhq.org/docs/
[4]: https://selenium-python.readthedocs.io
[5]: https://www.seleniumhq.org/docs/07_selenium_grid.jsp
