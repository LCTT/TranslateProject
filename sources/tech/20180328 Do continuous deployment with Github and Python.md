translating by kimii
Do continuous deployment with Github and Python
======

![](https://fedoramagazine.org/wp-content/uploads/2018/03/cd-github-python-945x400.jpg)
Developers can create many useful services using Github’s webhooks. From triggering a CI job on a Jenkins instance to provisioning machines in the cloud, the possibilities are almost limitless. This tutorial shows how to use Python and the Flask framework to build a simple continuous deployment service.

The continuous deployment service in this example is a simple Flask application with a REST endpoint that will receive Github’s webhook requests. After validating each request to check that it comes from the correct Github repository, the service pulls changes to the local copy of the repository. That way every time a new commit is pushed to the remote Github repository, the local repository is automatically updated.

### Flask web service

It is easy to build a small web service with Flask. Here’s a look at the project structure.
```
├── app
│   ├── __init__.py
│   └── webhooks.py
├── requirements.txt
└── wsgi.py

```

First, create the application. The application code goes under the app directory.

Two files ( __init__.py and webhooks.py) compose the Flask application. The former has the code needed to create the Flask application and add configuration to it. The latter has the endpoints logic. This is where the app receives the data from the Github request.

Here is the app/__init__.py content:
```
import os
from flask import Flask

from .webhooks import webhook

def create_app():
 """ Create, configure and return the Flask application """

 app = Flask(__name__)
 app.config['GITHUB_SECRET'] = os.environ.get('GITHUB_SECRET')
 app.config['REPO_PATH'] = os.environ.get('REPO_PATH')
 app.register_blueprint(webhook)

 return(app)

```

The function creates two configuration variables:

  * **GITHUB_SECRET** holds a secret passphrase, used to authenticate the Github requests.
  * **REPO_PATH** holds the path of the repository to automatically update.



This code uses [Flask Blueprints][1] to organize the application endpoints. Using blueprints allows logical grouping of APIs, making applications easier to maintain. It is generally considered a good practice.

Here is the content of app/webhooks.py:
```
import hmac
from flask import request, Blueprint, jsonify, current_app
from git import Repo

webhook = Blueprint('webhook', __name__, url_prefix='')

@webhook.route('/github', methods=['POST'])
def handle_github_hook():
 """ Entry point for github webhook """

 signature = request.headers.get('X-Hub-Signature')
 sha, signature = signature.split('=')

 secret = str.encode(current_app.config.get('GITHUB_SECRET'))

 hashhex = hmac.new(secret, request.data, digestmod='sha1').hexdigest()
 if hmac.compare_digest(hashhex, signature):
 repo = Repo(current_app.config.get('REPO_PATH'))
 origin = repo.remotes.origin
 origin.pull('--rebase')

 commit = request.json['after'][0:6]
 print('Repository updated with commit {}'.format(commit))
 return jsonify({}), 200

```

First the code creates a new Blueprint webhook. Then it adds a new endpoint to the Blueprint using a Flask route. This route will be called by any POST request on the /github URL endpoint.

#### Verifying the request

When the service receives a request on this endpoint, it must first verify that the request comes from Github and from the correct repository. Github gives a signature in the request header X-Hub-Signature. This signature is generated using a secret (GITHUB_SECRET), the [HMAC][2] hex digest of the request body, and then hashed using the sha1 hash function.

To verify the request the service needs to calculate locally the signature and compare it to the signature received in the request header. This is done by the hmac.compare_digest function.

#### Custom hook logic

After validating the request, it can now be processd. This tutorial uses the [GitPython][3] module to interface with a git repository. From the GitPython module the Repo object is used to access the remote repository called origin. The service pulls the latest changes locally from the origin repository, also using the –rebase option to avoid issues with merges.

A debug print statement displays the short commit hash received from the request body. This example shows how to use the request body. For more details about the data available in the body, check [github’s documentation][4].

Finally the service returns a empty JSON string and a 200 status code. This tells Github’s webhook server the request was received.

### Deploying the service

To run the service, this example uses the [gunicorn][5] web server. First install the service dependencies. On a supported Fedora server, use this command with [sudo][6]:
```
sudo dnf install python3-gunicorn python3-flask python3-GitPython

```

Now edit the wsgi.py file used by gunicorn to run the service:
```
from app import create_app

application = create_app()

```

To deploy this service, clone this git [repository][7] or use your own git repository with this command:
```
git clone https://github.com/cverna/github_hook_deployment.git /opt/

```

The next step is to configure the environment variables needed by the service. Run these commands:
```
export GITHUB_SECRET=asecretpassphraseusebygithubwebhook
export REPO_PATH=/opt/github_hook_deployment/

```

This tutorial uses the webhook service Github repository, but you could use a different repository if you wish. Finally, start the webserver with these commands:
```
cd /opt/github_hook_deployment/
gunicorn --bind 0.0.0.0 wsgi:application --reload

```

These options bind the web server to the 0.0.0.0 ip address, meaning it will accept requests coming from any host. The –reload option ensures the web server restarts when the code changes. This is where the continuous deployment magic happens. Every Github request received pulls the latest change in the repository, and gunicorn detects these changes and automatically restarts the application.

**Note: **In order to receive the requests from github, the web service must be deployed on a server with a public IP address. An easy way to do this is to use your favorite cloud provider such as DigitalOcean, AWS, Linode, etc.

### Configure Github

The last part of this tutorial configures Github to send the webhook request to the web service. This is key to continuous deployment.

From your Github repository settings, select the Webhook menu and click on Add Webhook. Enter the following information:

  * **Payload URL:** The URL of the service, for example <http://public\_ip\_address:8000/github>
  * **Content type:** Select application/json
  * **Secret:** The **GITHUB_SECRET** environment variable defined earlier



Then click the Add Webhook button.

![][8]

Github will now send a request to the service every time a push event happens on this repository.

### Conclusion

This tutorial has shown you how to write a Flask based web service that receives requests from a Github webhook and does continuous deployment. You should now be able to build your own useful services using this tutorial as a starting base.

#### Like this:

Like

Loading...

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/continuous-deployment-github-python/

作者：[Author Archive;Author Website;Clément Verna][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:http://flask.pocoo.org/docs/0.12/blueprints/
[2]:https://en.wikipedia.org/wiki/HMAC
[3]:https://gitpython.readthedocs.io/en/stable/index.html
[4]:https://developer.github.com/v3/activity/events/types/#webhook-payload-example-26
[5]:http://gunicorn.org/
[6]:https://fedoramagazine.org/howto-use-sudo/
[7]:https://github.com/cverna/github_hook_deployment.git
[8]:https://fedoramagazine.org/wp-content/uploads/2018/03/Screenshot-2018-3-26-cverna-github_hook_deployment1.png
