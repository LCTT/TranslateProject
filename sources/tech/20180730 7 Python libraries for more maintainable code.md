7 Python libraries for more maintainable code
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_keyboard_coding.png?itok=E0Vvam7A)

> Readability counts.
>  — [The Zen of Python][1], Tim Peters

It's easy to let readability and coding standards fall by the wayside when a software project moves into "maintenance mode." (It's also easy to never establish those standards in the first place.) But maintaining consistent style and testing standards across a codebase is an important part of decreasing the maintenance burden, ensuring that future developers are able to quickly grok what's happening in a new-to-them project and safeguarding the health of the app over time.

### Check your code style

A great way to protect the future maintainability of a project is to use external libraries to check your code health for you. These are a few of our favorite libraries for [linting code][2] (checking for PEP 8 and other style errors), enforcing a consistent style, and ensuring acceptable test coverage as a project reaches maturity.

[PEP 8][3] is the Python code style guide, and it sets out rules for things like line length, indentation, multi-line expressions, and naming conventions. Your team might also have your own style rules that differ slightly from PEP 8. The goal of any code style guide is to enforce consistent standards across a codebase to make it more readable, and thus more maintainable. Here are three libraries to help prettify your code.

#### 1\. Pylint

[Pylint][4] is a library that checks for PEP 8 style violations and common errors. It integrates well with several popular [editors and IDEs][5] and can also be run from the command line.

To install, run `pip install pylint`.

To use Pylint from the command line, run `pylint [options] path/to/dir` or `pylint [options] path/to/module.py`. Pylint will output warnings about style violations and other errors to the console.

You can customize what errors Pylint checks for with a [configuration file][6] called `pylintrc`.

#### 2\. Flake8

[Flake8][7] is a "Python tool that glues together PEP8, Pyflakes (similar to Pylint), McCabe (code complexity checker), and third-party plugins to check the style and quality of some Python code."

To use Flake8, run `pip install flake8`. Then run `flake8 [options] path/to/dir` or `flake8 [options] path/to/module.py` to see its errors and warnings.

Like Pylint, Flake8 permits some customization for what it checks for with a [configuration file][8]. It has very clear docs, including some on useful [commit hooks][9] to automatically check your code as part of your development workflow.

Flake8 integrates with popular editors and IDEs, but those instructions generally aren't found in the docs. To integrate Flake8 with your favorite editor or IDE, search online for plugins (for example, [Flake8 plugin for Sublime Text][10]).

#### 3\. Isort

[Isort][11] is a library that sorts your imports alphabetically and breaks them up into [appropriate sections][12] (e.g., standard library imports, third-party library imports, imports from your own project, etc.). This increases readability and makes it easier to locate imports if you have a lot of them in your module.

Install isort with `pip install isort`, and run it with `isort path/to/module.py`. More configuration options are in the [documentation][13]. For example, you can [configure][14] how isort handles multi-line imports from one library in an `.isort.cfg` file.

Like Flake8 and Pylint, isort also provides plugins that integrate it with popular [editors and IDEs][15].

### Outsource your code style

Remembering to run linters manually from the command line for each file you change is a pain, and you might not like how a particular plugin behaves with your IDE. Also, your colleagues might prefer different linters or might not have plugins for their favorite editors, or you might be less meticulous about always running the linter and correcting the warnings. Over time, the codebase you all share will get messy and harder to read.

A great solution is to use a library that automatically reformats your code into something that passes PEP 8 for you. The three libraries we recommend all have different levels of customization and different defaults for how they format code. Some of these are more opinionated than others, so like with Pylint and Flake8, you'll want to test these out to see which offers the customizations you can't live without… and the unchangeable defaults you can live with.

#### 4\. Autopep8

[Autopep8][16] automatically formats the code in the module you specify. It will re-indent lines, fix indentation, remove extraneous whitespace, and refactor common comparison mistakes (like with booleans and `None`). See a full [list of corrections][17] in the docs.

To install, run `pip install --upgrade autopep8`. To reformat code in place, run `autopep8 --in-place --aggressive --aggressive <filename>`. The `aggressive` flags (and the number of them) indicate how much control you want to give autopep8 over your code style. Read more about [aggressive][18] options.

#### 5\. Yapf

[Yapf][19] is yet another option for reformatting code that comes with its own list of [configuration options][20]. It differs from autopep8 in that it doesn't just address PEP 8 violations. It also reformats code that doesn't violate PEP 8 specifically but isn't styled consistently or could be formatted better for readability.

To install, run `pip install yapf`. To reformat code, run, `yapf [options] path/to/dir` or `yapf [options] path/to/module.py`. There is also a full list of [customization options][20].

#### 6\. Black

[Black][21] is the new kid on the block for linters that reformat code in place. It's similar to autopep8 and Yapf, but way more opinionated. It has very few options for customization, which is kind of the point. The idea is that you shouldn't have to make decisions about code style; the only decision to make is to let Black decide for you. You can read about [limited customization options][22] and instructions on [storing them in a configuration file][23].

Black requires Python 3.6+ but can format Python 2 code. To use, run `pip install black`. To prettify your code, run: `black path/to/dir` or `black path/to/module.py`.

### Check your test coverage

You're writing tests, right? Then you will want to make sure new code committed to your codebase is tested and doesn't drop your overall amount of test coverage. While percentage of test coverage is not the only metric you should use to measure the effectiveness and sufficiency of your tests, it is one way to ensure basic testing standards are being followed in your project. For measuring test coverage, we have one recommendation: Coverage.

#### 7\. Coverage

[Coverage][24] has several options for the way it reports your test coverage to you, including outputting results to the console or to an HTML page and indicating which line numbers are missing test coverage. You can set up a [configuration file][25] to customize what Coverage checks for and make it easier to run.

To install, run `pip install coverage`. To run a program and see its output, run `coverage run [path/to/module.py] [args]`, and you will see your program's output. To see a report of which lines of code are missing coverage, run `coverage report -m`.

Continuous integration (CI) is a series of processes you can run to automatically check for linter errors and test coverage minimums before you merge and deploy code. There are lots of free or paid tools to automate this process, and a thorough walkthrough is beyond the scope of this article. But because setting up a CI process is an important step in removing blocks to more readable and maintainable code, you should investigate continuous integration tools in general; check out [Travis CI][26] and [Jenkins][27] in particular.

These are only a handful of the libraries available to check your Python code. If you have a favorite that's not on this list, please share it in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/7-python-libraries-more-maintainable-code

作者：[Jeff Triplett][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/laceynwilliams
[1]:https://www.python.org/dev/peps/pep-0020/
[2]:https://en.wikipedia.org/wiki/Lint_(software)
[3]:https://www.python.org/dev/peps/pep-0008/
[4]:https://www.pylint.org/
[5]:https://pylint.readthedocs.io/en/latest/user_guide/ide-integration.html
[6]:https://pylint.readthedocs.io/en/latest/user_guide/run.html#command-line-options
[7]:http://flake8.pycqa.org/en/latest/
[8]:http://flake8.pycqa.org/en/latest/user/configuration.html#configuration-locations
[9]:http://flake8.pycqa.org/en/latest/user/using-hooks.html
[10]:https://github.com/SublimeLinter/SublimeLinter-flake8
[11]:https://github.com/timothycrosley/isort
[12]:https://github.com/timothycrosley/isort#how-does-isort-work
[13]:https://github.com/timothycrosley/isort#using-isort
[14]:https://github.com/timothycrosley/isort#configuring-isort
[15]:https://github.com/timothycrosley/isort/wiki/isort-Plugins
[16]:https://github.com/hhatto/autopep8
[17]:https://github.com/hhatto/autopep8#id4
[18]:https://github.com/hhatto/autopep8#id5
[19]:https://github.com/google/yapf
[20]:https://github.com/google/yapf#usage
[21]:https://github.com/ambv/black
[22]:https://github.com/ambv/black#command-line-options
[23]:https://github.com/ambv/black#pyprojecttoml
[24]:https://coverage.readthedocs.io/en/latest/
[25]:https://coverage.readthedocs.io/en/latest/config.html
[26]:https://travis-ci.org/
[27]:https://jenkins.io/
