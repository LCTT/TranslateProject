[#]: subject: "Turn your Python script into a command-line application"
[#]: via: "https://opensource.com/article/22/7/bootstrap-python-command-line-application"
[#]: author: "Mark Meyer https://opensource.com/users/ofosos"
[#]: collector: "lkxed"
[#]: translator: "MjSeven"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Turn your Python script into a command-line application
======
With scaffold and click in Python, you can level up even a simple utility into a full-fledged command-line interface tool.

![Python programming language logo and Tux the Penguin logo for Linux][1]

Image by: Opensource.com

I've written, used, and seen a lot of loose scripts in my career. They start with someone that needs to semi-automate some task. After a while, they grow. They can change hands many times in their lifetime. I've often wished for a more command-line *tool-like* feeling in those scripts. But how hard is it really to bump the quality level from a one-off script to a proper tool? It turns out it's not that hard in Python.

### Scaffolding

In this article, I start with a little Python snippet. I'll drop it into a `scaffold` module, and extend it with `click` to accept command-line arguments.

```
#!/usr/bin/python

from glob import glob
from os.path import join, basename
from shutil import move
from datetime import datetime
from os import link, unlink

LATEST = 'latest.txt'
ARCHIVE = '/Users/mark/archive'
INCOMING = '/Users/mark/incoming'
TPATTERN = '%Y-%m-%d'

def transmogrify_filename(fname):
    bname = basename(fname)
    ts = datetime.now().strftime(TPATTERN)
    return '-'.join([ts, bname])

def set_current_latest(file):
    latest = join(ARCHIVE, LATEST)
    try:
        unlink(latest)
    except:
        pass
    link(file, latest)

def rotate_file(source):
    target = join(ARCHIVE, transmogrify_filename(source))
    move(source, target)
    set_current_latest(target)

def rotoscope():
    file_no = 0
    folder = join(INCOMING, '*.txt')
    print(f'Looking in {INCOMING}')
    for file in glob(folder):
        rotate_file(file)
        print(f'Rotated: {file}')
        file_no = file_no + 1
    print(f'Total files rotated: {file_no}')

if __name__ == '__main__':
    print('This is rotoscope 0.4.1. Bleep, bloop.')
    rotoscope()
```

All non-inline code samples in this article refer to a specific version of the code you can find at [https://codeberg.org/ofosos/rotoscope][2]. Every commit in that repo describes some meaningful step in the course of this how-to article.

This snippet does a few things:

* Check whether there are any text files in the path specified in `INCOMING`
* If it exists, it creates a new filename with the current timestamp and moves the file to `ARCHIVE`
* Delete the current `ARCHIVE/latest.txt` link and create a new one pointing to the file just added

As an example, this is pretty small, but it gives you an idea of the process.

### Create an application with pyscaffold

First, you need to install the `scaffold`, `click`, and [tox Python modules][3].

```
$ python3 -m pip install scaffold click tox
```

After installing `scaffold`, change to the directory where the example `rotoscope` project resides, and then execute the following command:

```
$ putup rotoscope -p rotoscope \
--force --no-skeleton -n rotoscope \
-d 'Move some files around.' -l GLWT \
-u http://codeberg.org/ofosos/rotoscope \
--save-config --pre-commit --markdown
```

Pyscaffold overwrote my `README.md`, so restore it from Git:

```
$ git checkout README.md
```

Pyscaffold set up a complete sample project in the docs hierarchy, which I won't cover here but feel free to explore it later. Besides that, Pyscaffold can also provide you with continuous integration (CI) templates in your project.

* packaging: Your project is now PyPi enabled, so you can upload it to a repo and install it from there.
* documentation: Your project now has a complete docs folder hierarchy, based on Sphinx and including a readthedocs.org builder.
* testing: Your project can now be used with the tox test runner, and the tests folder contains all necessary boilerplate to run pytest-based tests.
* dependency management: Both the packaging and test infrastructure need a way to manage dependencies. The `setup.cfg` file solves this and includes dependencies.
* pre-commit hook: This includes the Python source formatter "black" and the "flake8" Python style checker.

Take a look into the tests folder and run the `tox` command in the project directory. It immediately outputs an error. The packaging infrastructure cannot find your package.

Now create a Git tag (for instance, `v0.2` ) that the tool recognizes as an installable version. Before committing the changes, take a pass through the auto-generated `setup.cfg` and edit it to suit your use case. For this example, you might adapt the `LICENSE` and project descriptions. Add those changes to Git's staging area, I have to commit them with the pre-commit hook disabled. Otherwise, I'd run into an error because flake8, Python style checker, complains about lousy style.

```
$ PRE_COMMIT_ALLOW_NO_CONFIG=1 git commit
```

It would also be nice to have an entry point into this script that users can call from the command line. Right now, you can only run it by finding the `.py` file and executing it manually. Fortunately, Python's packaging infrastructure has a nice "canned" way to make this an easy configuration change. Add the following to the `options.entry_points` section of your `setup.cfg` :

```
console_scripts =
    roto = rotoscope.rotoscope:rotoscope
```

This change creates a shell command called `roto`, which you can use to call the rotoscope script. Once you install rotoscope with `pip`, you can use the `roto` command.

That's that. You have all the packaging, testing, and documentation setup for free from Pyscaffold. You also got a pre-commit hook to keep you (mostly) honest.

### CLI tooling

Right now, there are values hardcoded into the script that would be more convenient as command [arguments][4]. The `INCOMING` constant, for instance, would be better as a command-line parameter.

First, import the [click][5] library. Annotate the `rotoscope()` method with the command annotation provided by Click, and add an argument that Click passes to the `rotoscope` function. Click provides a set of validators, so add a path validator to the argument. Click also conveniently uses the function's here-string as part of the command-line documentation. So you end up with the following method signature:

```
@click.command()
@click.argument('incoming', type=click.Path(exists=True))
def rotoscope(incoming):
    """
    Rotoscope 0.4 - Bleep, blooop.
    Simple sample that move files.
    """
```

The main section calls `rotoscope()`, which is now a Click command. It doesn't need to pass any parameters.

Options can get filled in automatically by [environment variables][6], too. For instance, change the `ARCHIVE` constant to an option:

```
@click.option('archive', '--archive', default='/Users/mark/archive', envvar='ROTO_ARCHIVE', type=click.Path())
```

The same path validator applies again. This time, let Click fill in the environment variable, defaulting to the old constant's value if nothing's provided by the environment.

Click can do many more things. It has colored console output, prompts, and subcommands that allow you to build complex CLI tools. Browsing through the Click documentation reveals more of its power.

Now add some tests to the mix.

### Testing

Click has some advice on [running end-to-end tests][7] using the CLI runner. You can use this to implement a complete test (in the [sample project][8], the tests are in the `tests` folder.)

The test sits in a method of a testing class. Most of the conventions follow what I'd use in any other Python project very closely, but there are a few specifics because rotoscope uses `click`. In the `test` method, I create a `CliRunner`. The test uses this to run the command in an isolated file system. Then the test creates `incoming` and `archive` directories and a dummy `incoming/test.txt` file within the isolated file system. Then it invokes the CliRunner just like you'd invoke a command-line application. After the run completes, the test examines the isolated filesystem and verifies that `incoming` is empty, and that `archive` contains two files (the latest link and the archived file.)

```
from os import listdir, mkdir
from click.testing import CliRunner
from rotoscope.rotoscope import rotoscope

class TestRotoscope:
    def test_roto_good(self, tmp_path):
        runner = CliRunner()

        with runner.isolated_filesystem(temp_dir=tmp_path) as td:
            mkdir("incoming")
            mkdir("archive")
            with open("incoming/test.txt", "w") as f:
                f.write("hello")

            result = runner.invoke(rotoscope, ["incoming", "--archive", "archive"])
            assert result.exit_code == 0

            print(td)
            incoming_f = listdir("incoming")
            archive_f = listdir("archive")
            assert len(incoming_f) == 0
            assert len(archive_f) == 2
```

To execute these tests on my console, run `tox` in the project's root directory.

During implementing the tests, I found a bug in my code. When I did the Click conversion, rotoscope just unlinked the latest file, whether it was present or not. The tests started with a fresh file system (not my home folder) and promptly failed. I can prevent this kind of bug by running in a nicely isolated and automated test environment. That'll avoid a lot of "it works on my machine" problems.

### Scaffolding and modules

This completes our tour of advanced things you can do with `scaffold` and `click`. There are many possibilities to level up a casual Python script, and make even your simple utilities into full-fledged CLI tools.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/bootstrap-python-command-line-application

作者：[Mark Meyer][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ofosos
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/python_linux_tux_penguin_programming.png
[2]: https://codeberg.org/ofosos/rotoscope
[3]: https://opensource.com/article/19/5/python-tox
[4]: https://opensource.com/article/21/8/linux-terminal#argument
[5]: https://click.palletsprojects.com
[6]: https://opensource.com/article/19/8/what-are-environment-variables
[7]: https://click.palletsprojects.com/en/8.1.x/testing
[8]: https://codeberg.org/ofosos/rotoscope/commit/dfa60c1bfcb1ac720ad168e5e98f02bac1fde17d
