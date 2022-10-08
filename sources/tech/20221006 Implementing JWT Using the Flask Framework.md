[#]: subject: "Implementing JWT Using the Flask Framework"
[#]: via: "https://www.opensourceforu.com/2022/10/implementing-jwt-using-the-flask-framework/"
[#]: author: "Anchal Agarwal https://www.opensourceforu.com/author/anchal-agarwal/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Implementing JWT Using the Flask Framework
======
*JSON web token, abbreviated as JWT, uses JSON objects as tokens. This article is an introduction to JWT and how to implement it using the Flask framework. It assumes you have a basic knowledge of Flask.*

A token, as defined in Wikipedia, is an object that represents the right to perform some action. In client server architecture, the server generates a signed token and stores it in the client browser. Just like a cookie, the client has to pass this token with each request it makes to the server. The server then verifies the signature of the token and grants access to client requests on that basis. A token contains all the data within itself so that the server doesn’t need to record any of the client data. It simply authorises client requests by relying on the validity of the token.

### What is JWT?

JSON web token, abbreviated as JWT, uses JSON objects as tokens. JWT comprises three parts separated by dots (.). These are listed below.

* Header: This consists of two parts — the signing algorithm used (like HMAC or RSA) and the type of token, which by default is JWT.
* Payload: This part contains the claims and any additional data that needs to be encoded.

Header and payload are Base64Url encoded.

* Signature: A signature is created by supplying the encoded header and payload along with a secret key to the algorithm specified in the header. A signature verifies that the message hasn’t changed along the way.

To read more about JWT, you can refer to the official documentation at https://jwt.io/introduction.

Note that the token is only encoded and not encrypted. Thus, storing passwords inside a token can cause a security breach.

### Implementing JWT with various encoding algorithms using Flask

HS256: This is a very popular algorithm since it is easy to implement. The secret key used here is a long sequence of characters such that it cannot be easily identified.

*Step 1:* First, install the pyjwt package using pip:

```
pip install pyjwt
```

> Note: Make sure to activate the virtual environment, if any, in your project before installing the package. |

Step 2: Create a file as app.py and paste the code given below:

```
from flask import Flask, session, url_for, redirect
import jwt
import datetime
import time

app = Flask(__name__)
app.secret_key = ‘super secret key’
base_url = “http://127.0.0.1:5000”
secret_key = “mysecret”

@app.route(‘/’)
@app.route(‘/<result>’)
def home(result=None):
return f”””<html>
<body>
<center>
<h2>Welcome</h2>
<hr>
<a href=”{base_url}/generate”>Get token</a><br><br>
<a href=”{base_url}/validate”>Show details</a>
<p>Result - {result}</p>
</center>
</body>
</html>”””

@app.route(‘/generate’)
def generate_token():
try:
payload = {
‘sub’:’bob’,
‘iat’: datetime.datetime.utcnow(),
‘exp’: datetime.datetime.utcnow() + datetime.timedelta(days=0,seconds=60)
}
token = jwt.encode(payload, secret_key,algorithm=’HS256’)
session[‘jwt_token’]=token
except Exception as e:
return redirect(url_for(‘home’, result=”Error 400”))

return redirect(url_for(‘home’, result=”Token Generated successfully!!”))

@app.route(‘/validate’)
def validate_and_show():
try:
token = session.get(‘jwt_token’)
decode = jwt.decode(token, secret_key,algorithms=[“HS256”])
return redirect(url_for(‘home’, result=decode[‘sub’]))
except:
return redirect(url_for(‘home’, result=”Invalid token”))

if __name__ == ‘__main__’:
app.run(debug=True)
```

So what does this code do?

1. First, it imports a JWT package along with a few classes required for our Flask application.

2. Then it declares a secret key, which will be used later in the encoding and decoding of the JWT.

3. base_url is the server name. Since I have run it locally, the URL is of localhost.

4. After this, it declares three APIs.

* home is used for displaying the home page to the user. The home page is very simple. It contains a welcome message, a link to generate new tokens and a link to details. Details will be visible to the user only if it is authenticated. A user will have to generate a token first to view the details. Any successful attempt messages or invalid token messages will be shown to the user adjacent to the result paragraph.
* generate_token is used for generating a token. JWT has a function encode that accepts three parameters — payload, secret key and algorithm — used for encoding. The payload here is hard coded for explanatory purposes; in real applications we take the user input, and then these inputs become part of the token payload.

The payload is a dictionary containing three values. ‘sub’ is used to denote the name of the person whose details this token contains. ‘iat’ denotes the time when the token is created. ‘exp’ denotes the expiration time for this token. These are registered claims predefined in JWT. So make sure you do not spell these variables.

Here the token will expire within 1 minute after it is generated.

Now this token needs to be stored in the client browser. For that I used httpOnly cookies to prevent XSS attacks. Flask provides a configuration value SESSION_COOKIE_HTTPONLY, which controls whether cookies are set to be httpOnly. By default its value is ‘True’. So there is no need to change anything in this step.

I used a session class to store this token in the user browser. I have enclosed all the code in a try block. Any exception will display a 400 error to the user; otherwise, it will display a ‘Token generated successfully’ message.

Validate_and_show is used to validate the token signature and display details only if the signature is verified. When the client requests this API, its cookies will also be sent to the server along with the request. The token is first extracted from the cookies and then decoded using the same secret_key used for encoding. The decode function takes a different argument as algorithms, which is a list of algorithms since the server can expect different types of tokens from the client.

If everything works well, the API will extract the user name from the token and display it to the client. Here, ‘bob’ will be displayed to the user.

| - |
| :- |
| Note: When the token expires or any character of a token string gets changed, the signature will fail and an invalid token message will be displayed to users when they try to look for the details again. |

*RS256:* The disadvantage of HS256 is that we need the secret key both while encoding and decoding the token. Thus it needs to be present on each server that is handling the authentication. This makes the key less secure.

In RS256, we use a public private key pair as a secret key. A private key is used to sign the token and the public key is used to verify the signature of the token. This private key is kept for the server that has generated it while the public key can be shared with anyone in the world. Anyone having this public key can verify the validity of the token.

The following code shows how to use the RS256 encoding algorithm:

```
from flask import Flask, session, url_for, redirect
import jwt
import datetime
import time

app = Flask(__name__)
app.secret_key = ‘super secret key’
base_url = “http://127.0.0.1:5000”
private_key_name = ‘jwt_key’
public_key_name = ‘jwt_key.pub’

@app.route(‘/’)
@app.route(‘/<result>’)
def home(result=None):
    return f”””<html>
        <body>
            <center>
                <h2>Welcome</h2>
                <hr>
                <a href=”{base_url}/generate”>Get token</a><br><br>
                <a href=”{base_url}/validate”>Show details</a>
                <p>Result - {result}</p>
            </center>
        </body>
    </html>”””

@app.route(‘/generate’)
def generate_token():
    try:
        payload = {
            ‘sub’:’bob’,
            ‘iat’: datetime.datetime.utcnow(),
            ‘exp’: datetime.datetime.utcnow() + datetime.timedelta(days=0,seconds=60)
        }

    with open(private_key_name) as f:
        private_key = f.read()

        token = jwt.encode(payload, private_key, algorithm=’RS256’)
        session[‘jwt_token’]=token
    except Exception as e:
        return redirect(url_for(‘home’, result=”Error 400”))

    return redirect(url_for(‘home’, result=”Token Generated successfully!!”))

@app.route(‘/validate’)
def validate_and_show():
    try:
        token = session.get(‘jwt_token’)
        with open(public_key_name) as f:
        public_key = f.read()
        decode = jwt.decode(token, public_key,algorithms=[“RS256”])
        return redirect(url_for(‘home’, result=decode[‘sub’]))
    except:
        return redirect(url_for(‘home’, result=”Invalid token”))


if __name__ == ‘__main__’:
    app.run(debug=True)
```

This code is similar to the code explained in HS256. A few changes that I have made are as follows.

1. First, a new public private key pair using the ssh-keygen command is generated. Do read the tutorial at https://www.ssh.com/academy/ssh/keygen to learn about ssh-keygen commands.
2. In the generate_token API, the private key file is read and passed to the encode method as a secret key. Also, the algorithm name is RS256.
3. In the validate_and_show API, the public key of the same pair is read and passed to the decode method as a secret key. The algorithms list will contain ‘RS256’ in it.

This application works the same way as described in the case of HS256. But in comparison to HS256, the secret key is more secure.

I hope this article has given you the information you need to get started with implementing JWT in your application.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/10/implementing-jwt-using-the-flask-framework/

作者：[Anchal Agarwal][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/anchal-agarwal/
[b]: https://github.com/lkxed
