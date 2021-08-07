[#]: subject: "Use Python to parse configuration files"
[#]: via: "https://opensource.com/article/21/6/parse-configuration-files-python"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lujun9972"
[#]: translator: "zepoch"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13551-1.html"

使用 Python 解析配置文件
======

> 第一步是选择配置文件的格式：INI、JSON、YAML 或 TOML。

![](https://img.linux.net.cn/data/attachment/album/202107/05/113551tm0d0yp0px0xzp0n.jpg)

有时，程序需要足够的参数，将它们全部作为命令行参数或环境变量既不让人愉快也不可行。 在这些情况下，你将需要使用配置文件。

有几种流行的配置文件格式。其中包括古老的（虽然有时定义不明确）INI 格式，虽然流行但有时难以手写的 JSON 格式，使用广泛但有时在细节方面令人意外的 YAML 格式，以及很多人还没有听说过的最新出现的 TOML。

你的首要任务是选择一种格式，然后记录该选择。解决了这个简单的部分之后就是时候解析配置了。

有时，在配置中拥有一个与“抽象“数据相对应的类是一个不错的想法。因为这段代码不会对配置做任何事情，所以这是展示解析逻辑最简单的方式。

想象一下文件处理器的配置：它包括一个输入目录、一个输出目录和要提取的文件。

配置类的抽象定义可能类似于：

```
from __future__ import annotations
```

```
import attr

@attr.frozen
class Configuration:
    @attr.frozen
    class Files:
        input_dir: str
        output_dir: str
    files: Files
    @attr.frozen
    class Parameters:
        patterns: List[str]
    parameters: Parameters
```

为了使特定于格式的代码更简单，你还需要编写一个函数来从字典中解析此类。请注意，这假设配置将使用破折号，而不是下划线。 这种差异并不少见。

```
def configuration_from_dict(details):
    files = Configuration.Files(
        input_dir=details["files"]["input-dir"],
        output_dir=details["files"]["output-dir"],
    )
    parameters = Configuration.Paraneters(
        patterns=details["parameters"]["patterns"]
    )
    return Configuration(
        files=files,
        parameters=parameters,
    )
```

### JSON

JSON（JavaScript Object Notation）是一种类似于 JavaScript 的格式。

以下是 JSON 格式的示例配置：

```
json_config = """
{
    "files": {
        "input-dir": "inputs",
        "output-dir": "outputs"
    },
    "parameters": {
        "patterns": [
            "*.txt",
            "*.md"
        ]
    }
}
"""
```

解析逻辑使用 `json` 模块将 JSON 解析为 Python 的内置数据结构（字典、列表、字符串），然后从字典中创建类：

```
import json
def configuration_from_json(data):
    parsed = json.loads(data)
    return configuration_from_dict(parsed)
```

### INI

INI 格式，最初只在 Windows 上流行，之后成为配置标准格式。

这是与 INI 相同的配置：

```
ini_config="""
[files]
input-dir = inputs
output-dir = outputs

[parameters]
patterns = ['*.txt', '*.md']
"""
```

Python 可以使用内置的 `configparser` 模块解析它。解析器充当类似 `dict` 的对象，因此可以直接传递给 `configuration_from_dict`：

```
import configparser

def configuration_from_ini(data):
    parser = configparser.ConfigParser()
    parser.read_string(data)
    return configuration_from_dict(parser)
```

### YAML

YAML（Yet Another Markup Language）是 JSON 的扩展，旨在更易于手动编写。为了实现了这一点，部分原因是有一个很长的规范。

以下是 YAML 中的相同配置： 

```
yaml_config = """
files:
  input-dir: inputs
  output-dir: outputs
parameters:
  patterns:
  - '*.txt'
  - '*.md'
"""
```

要让 Python 解析它，你需要安装第三方模块。最受欢迎的是`PyYAML`（`pip install pyyaml`）。 YAML 解析器还返回可以传递给 `configuration_from_dict` 的内置 Python 数据类型。但是，YAML 解析器需要一个字节流，因此你需要将字符串转换为字节流。

```
import io
import yaml
def configuration_from_yaml(data):
    fp = io.StringIO(data)
    parsed = yaml.safe_load(fp)
    return configuration_from_dict(parsed)
```

### TOML

TOML（Tom's Own Markup Language）旨在成为 YAML 的轻量级替代品。其规范比较短，已经在一些地方流行了（比如 Rust 的包管理器 Cargo 就用它来进行包配置）。

这是与 TOML 相同的配置： 

```
toml_config = """
[files]
input-dir = "inputs"
output-dir = "outputs"

[parameters]
patterns = [ "*.txt", "*.md",]
"""
```

为了解析 TOML，你需要安装第三方包。最流行的一种被简单地称为 `toml`。 与 YAML 和 JSON 一样，它返回基本的 Python 数据类型。

```
import toml
def configuration_from_toml(data):
    parsed = toml.loads(data)
    return configuration_from_dict(parsed)
```

### 总结

选择配置格式是一种微妙的权衡。但是，一旦你做出决定，Python 就可以使用少量代码来解析大多数流行的格式。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/parse-configuration-files-python

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[zepoch](https://github.com/zepoch)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_programming_question.png?itok=cOeJW-8r "Python programming language logo with question marks"
