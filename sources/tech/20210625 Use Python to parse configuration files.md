[#]: subject: (Use Python to parse configuration files)
[#]: via: (https://opensource.com/article/21/6/parse-configuration-files-python)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Use Python to parse configuration files
======
The first step is choosing a configuration format: INI, JSON, YAML, or
TOML.
![Python programming language logo with question marks][1]

Sometimes, a program needs enough parameters that putting them all as command-line arguments or environment variables is not pleasant nor feasible. In those cases, you will want to use a configuration file.

There are several popular formats for configuration files. Among them are the venerable (although occasionally under-defined) `INI` format, the popular but sometimes hard to write by hand `JSON` format, the extensive yet occasionally surprising in details `YAML` format, and the newest addition, `TOML`, which many people have not heard of yet.

Your first task is to choose a format and then to document that choice. With this easy part out of the way, it is time to parse the configuration.

It is sometimes a good idea to have a class that corresponds to the "abstract" data in the configuration. Because this code will do nothing with the configuration, this is the simplest way to show parsing logic.

Imagine the configuration for a file processor: it includes an input directory, an output directory, and which files to pick up.

The abstract definition for the configuration class might look something like:


```
`from __future__ import annotations`[/code] [code]

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

To make the format-specific code simpler, you will also write a function to parse this class out of dictionaries. Note that this assumes the configuration will use dashes, not underscores. This kind of discrepancy is not uncommon.


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

JSON (JavaScript Object Notation) is a JavaScript-like format.

Here is an example configuration in JSON format:


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

The parsing logic parses the JSON into Python's built-in data structures (dictionaries, lists, strings) using the `json` module and then creates the class from the dictionary:


```
import json
def configuration_from_json(data):
    parsed = json.loads(data)
    return configuration_from_dict(parsed)
```

### INI

The INI format, originally popular on Windows, became a de facto configuration standard.

Here is the same configuration as an INI:


```
ini_config="""
[files]
input-dir = inputs
output-dir = outputs

[parameters]
patterns = ['*.txt', '*.md']
"""
```

Python can parse it using the built-in `configparser` module. The parser behaves as a `dict`-like object, so it can be passed directly to `configuration_from_dict`:


```
import configparser

def configuration_from_ini(data):
    parser = configparser.ConfigParser()
    parser.read_string(data)
    return configuration_from_dict(parser)
```

### YAML

YAML (Yet Another Markup Language) is an extension of JSON that is designed to be easier to write by hand. It accomplishes this, in part, by having a long specification.

Here is the same configuration in YAML:


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

For Python to parse this, you will need to install a third-party module. The most popular is `PyYAML` (`pip install pyyaml`). The YAML parser also returns built-in Python data types that can be passed to `configuration_from_dict`. However, the YAML parser expects a stream, so you need to convert the string into a stream.


```
import io
import yaml
def configuration_from_yaml(data):
    fp = io.StringIO(data)
    parsed = yaml.safe_load(fp)
    return configuration_from_dict(parsed)
```

### TOML

TOML (Tom's Own Markup Language) is designed to be a lightweight alternative to YAML. The specification is shorter, and it is already popular in some places (for example, Rust's package manager, Cargo, uses it for package configuration).

Here is the same configuration as a TOML:


```
toml_config = """
[files]
input-dir = "inputs"
output-dir = "outputs"

[parameters]
patterns = [ "*.txt", "*.md",]
"""
```

In order to parse TOML, you need to install a third-party package. The most popular one is called, simply, `toml`. Like YAML and JSON, it returns basic Python data types.


```
import toml
def configuration_from_toml(data):
    parsed = toml.loads(data)
    return configuration_from_dict(parsed)
```

### Summary

Choosing a configuration format is a subtle tradeoff. However, once you make the decision, Python can parse most of the popular formats using a handful of lines of code.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/parse-configuration-files-python

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_programming_question.png?itok=cOeJW-8r (Python programming language logo with question marks)
