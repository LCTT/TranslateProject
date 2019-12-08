[#]: collector: (lujun9972)
[#]: translator: (hj24)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to write a Python web API with Flask)
[#]: via: (https://opensource.com/article/19/11/python-web-api-flask)
[#]: author: (Rachel Waston https://opensource.com/users/rachelwaston)

How to write a Python web API with Flask
======
Use Flask, one of the fastest-growing Python frameworks, to fetch data
from a server, in this quick tutorial.
![spiderweb diagram][1]

[Python][2] is a high-level, object-oriented programming language known for its simple syntax. It is consistently among the top-rated programming languages for building RESTful APIs.

[Flask][3] is a customizable Python framework that gives developers complete control over how users access data. Flask is a "micro-framework" based on Werkzeug's [WSGI][4] toolkit and Jinja 2's templating engine. It is designed as a web framework for RESTful API development.

Flask is one of the fastest-growing Python frameworks, and popular websites, including Netflix, Pinterest, and LinkedIn, have incorporated Flask into their development stacks. Here's an example of how Flask can permit users to fetch data from a server using the HTTP GET method.

### Set up a Flask application

First, create a structure for your Flask application. You can do this at any location on your system.


```
$ mkdir tutorial
$ cd tutorial
$ touch main.py
$ python3 -m venv env
$ source env/bin/activate
(env) $ pip3 install flask-restful
Collecting flask-restful
Downloading <https://files.pythonhosted.org/packages/17/44/6e49...8da4/Flask\_RESTful-0.3.7-py2.py3-none-any.whl>
Collecting Flask&gt;=0.8 (from flask-restful)
[...]
```

### Import the Flask modules

Next, import the **flask** module and its **flask_restful** library into your **main.py** code:


```
from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

class Quotes(Resource):
    def get(self):
        return {
            'William Shakespeare': {
                'quote': ['Love all,trust a few,do wrong to none',
                'Some are born great, some achieve greatness, and some greatness thrust upon them.']
        },
        'Linus': {
            'quote': ['Talk is cheap. Show me the code.']
            }
        }

api.add_resource(Quotes, '/')

if __name__ == '__main__':
    app.run(debug=True)
```

### Run the app

Flask includes a built-in HTTP server for testing. Test the simple API you built:


```
(env) $ python main.py
 * Serving Flask app "main" (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: on
 * Running on <http://127.0.0.1:5000/> (Press CTRL+C to quit)
```

Starting the development server starts your Flask application, which contains a method named **get** to respond to a simple HTTP GET request. You can test it using **wget** or **curl** or any web browser. The URL to use is provided in Flask's output after you start the server.


```
$ curl <http://localhost:5000>
{
    "William Shakespeare": {
        "quote": [
            "Love all,trust a few,do wrong to none",
            "Some are born great, some achieve greatness, and some greatness thrust upon them."
        ]
    },
    "Linus": {
        "quote": [
            "Talk is cheap. Show me the code."
        ]
    }
}
```

To see a more complex version of a similar web API using Python and Flask, navigate to the Library of Congress' [Chronicling America][5] website, which provides access to information about historic newspapers and digitized newspaper pages.

### Why use Flask?

Flask has several major benefits:

  1. Python is popular and widely used, so anyone who knows Python can develop for Flask.
  2. It's lightweight and minimalistic.
  3. Built with security in mind.
  4. Great documentation with plenty of clear, working example code.



There are also some potential drawbacks:

  1. It's lightweight and minimalistic. If you're looking for a framework with lots of bundled libraries and prefabricated components, this may not be your best option.
  2. If you have to build your own framework around Flask, you might find that the cost of maintaining your customization negates the benefit of using Flask.



If you're looking to build a web app or API, Flask is a good option to consider. It's powerful and robust, and the project documentation makes it easy to get started. Try it out, evaluate it, and see if it's right for your project.

Learn more in this lesson in Python exception handling and how to do it in a secure manner.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/python-web-api-flask

作者：[Rachel Waston][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rachelwaston
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web-cms-build-howto-tutorial.png?itok=bRbCJt1U (spiderweb diagram)
[2]: https://www.python.org/
[3]: https://palletsprojects.com/p/flask/
[4]: https://en.wikipedia.org/wiki/Web_Server_Gateway_Interface
[5]: https://chroniclingamerica.loc.gov/about/api
