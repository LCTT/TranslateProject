[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10943-1.html)
[#]: subject: (Using Testinfra with Ansible to verify server state)
[#]: via: (https://opensource.com/article/19/5/using-testinfra-ansible-verify-server-state)
[#]: author: (Clement Verna https://opensource.com/users/cverna/users/paulbischoff/users/dcritch/users/cobiacomm/users/wgarry155/users/kadinroob/users/koreyhilpert)

使用 Testinfra 和 Ansible 验证服务器状态
======

> Testinfra 是一个功能强大的库，可用于编写测试来验证基础设施的状态。另外它与 Ansible 和 Nagios 相结合，提供了一个用于架构即代码  (IaC)  的简单解决方案。

![Terminal command prompt on orange background][1]

根据设计，[Ansible][2] 传递机器的期望状态，以确保 Ansible 剧本或角色的内容部署到目标机器上。但是，如果你需要确保所有基础架构更改都在 Ansible 中，该怎么办？或者想随时验证服务器的状态？

[Testinfra][3] 是一个基础架构测试框架，它可以轻松编写单元测试来验证服务器的状态。它是一个 Python 库，使用强大的 [pytest][4] 测试引擎。

### 开始使用 Testinfra

可以使用 Python 包管理器（`pip`）和 Python 虚拟环境轻松安装 Testinfra。

```
$ python3 -m venv venv
$ source venv/bin/activate
(venv) $ pip install testinfra
```

Testinfra 也可以通过 Fedora 和 CentOS 的 EPEL 仓库中使用。例如，在 CentOS 7 上，你可以使用以下命令安装它：

```
$ yum install -y epel-release
$ yum install -y python-testinfra
```

#### 一个简单的测试脚本

在 Testinfra 中编写测试很容易。使用你选择的代码编辑器，将以下内容添加到名为 `test_simple.py` 的文件中：

```
import testinfra

def test_os_release(host):
    assert host.file("/etc/os-release").contains("Fedora")

def test_sshd_inactive(host):
    assert host.service("sshd").is_running is False
```

默认情况下，Testinfra 为测试用例提供了一个 `host` 对象，该对象能访问不同的辅助模块。例如，第一个测试使用 `file` 模块来验证主机上文件的内容，第二个测试用例使用 `service` 模块来检查 systemd 服务的状态。

要在本机运行这些测试，请执行以下命令：

```
(venv)$ pytest test_simple.py
================================ test session starts ================================
platform linux -- Python 3.7.3, pytest-4.4.1, py-1.8.0, pluggy-0.9.0
rootdir: /home/cverna/Documents/Python/testinfra
plugins: testinfra-3.0.0
collected 2 items
test_simple.py ..

================================ 2 passed in 0.05 seconds ================================
```

有关 Testinfra API 的完整列表，你可以参考[文档][5]。

### Testinfra 和 Ansible

Testinfra 支持的后端之一是 Ansible，这意味着 Testinfra 可以直接使用 Ansible 的清单文件和清单中定义的一组机器来对它们进行测试。

我们使用以下清单文件作为示例：

```
[web]
app-frontend01
app-frontend02

[database]
db-backend01
```

我们希望确保我们的 Apache Web 服务器在 `app-frontend01` 和 `app-frontend02` 上运行。让我们在名为 `test_web.py` 的文件中编写测试：

```
def check_httpd_service(host):
    """Check that the httpd service is running on the host"""
    assert host.service("httpd").is_running
```

要使用 Testinfra 和 Ansible 运行此测试，请使用以下命令：


```
(venv) $ pip install ansible
(venv) $ py.test --hosts=web --ansible-inventory=inventory --connection=ansible test_web.py
```

在调用测试时，我们使用 Ansible 清单文件的 `[web]` 组作为目标计算机，并指定我们要使用 Ansible 作为连接后端。

#### 使用 Ansible 模块

Testinfra 还为 Ansible 提供了一个很好的可用于测试的 API。该 Ansible 模块能够在测试中运行 Ansible 动作，并且能够轻松检查动作的状态。

```
def check_ansible_play(host):
    """ 
    Verify that a package is installed using Ansible
    package module
    """
    assert not host.ansible("package", "name=httpd state=present")["changed"]
```

默认情况下，Ansible 的[检查模式][6]已启用，这意味着 Ansible 将报告在远程主机上执行动作时会发生的变化。

### Testinfra 和 Nagios

现在我们可以轻松地运行测试来验证机器的状态，我们可以使用这些测试来触发监控系统上的警报。这是捕获意外的更改的好方法。

Testinfra 提供了与 [Nagios][7] 的集成，它是一种流行的监控解决方案。默认情况下，Nagios 使用 [NRPE][8] 插件对远程主机进行检查，但使用 Testinfra 可以直接从 Nagios 主控节点上运行测试。

要使 Testinfra 输出与 Nagios 兼容，我们必须在触发测试时使用 `--nagios` 标志。我们还使用 `-qq` 这个 pytest 标志来启用 pytest 的静默模式，这样就不会显示所有测试细节。

```
(venv) $ py.test --hosts=web --ansible-inventory=inventory --connection=ansible --nagios -qq line test.py
TESTINFRA OK - 1 passed, 0 failed, 0 skipped in 2.55 seconds
```

Testinfra 是一个功能强大的库，可用于编写测试以验证基础架构的状态。 另外与 Ansible 和 Nagios 相结合，提供了一个用于架构即代码  (IaC)  的简单解决方案。 它也是使用 [Molecule][9] 开发 Ansible 角色过程中添加测试的关键组件。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/using-testinfra-ansible-verify-server-state

作者：[Clement Verna][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cverna/users/paulbischoff/users/dcritch/users/cobiacomm/users/wgarry155/users/kadinroob/users/koreyhilpert
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://www.ansible.com/
[3]: https://testinfra.readthedocs.io/en/latest/
[4]: https://pytest.org/
[5]: https://testinfra.readthedocs.io/en/latest/modules.html#modules
[6]: https://docs.ansible.com/ansible/playbooks_checkmode.html
[7]: https://www.nagios.org/
[8]: https://en.wikipedia.org/wiki/Nagios#NRPE
[9]: https://github.com/ansible/molecule
