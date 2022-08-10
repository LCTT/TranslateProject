[#]: subject: "3 ways to test your API with Python"
[#]: via: "https://opensource.com/article/21/9/unit-test-python"
[#]: author: "Miguel Brito https://opensource.com/users/miguendes"
[#]: collector: "lujun9972"
[#]: translator: "Yufei-Yan"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

3 ways to test your API with Python
======
Unit testing can be daunting, but these Python modules will make your
life much easier.
![Puzzle pieces coming together to form a computer screen][1]

In this tutorial, you'll learn how to unit test code that performs HTTP requests. In other words, you'll see the art of API unit testing in Python.

Unit tests are meant to test a single unit of behavior. In testing, a well-known rule of thumb is to isolate code that reaches external dependencies.

For instance, when testing a code that performs HTTP requests, it's recommended to replace the real call with a fake call during test time. This way, you can unit test it without performing a real HTTP request every time you run the test.

The question is, _how can you isolate the code?_

Hopefully, that's what I'm going to answer in this post! I'll not only show you how to do it but also weigh the pros and cons of three different approaches.

Requirements:

  * [Python 3.8][2]
  * pytest-mock
  * requests
  * flask
  * responses
  * VCR.py



### Demo app using a weather REST API

To put this problem in context, imagine that you're building a weather app. This app uses a third-party weather REST API to retrieve weather information for a particular city. One of the requirements is to generate a simple HTML page, like the image below:

![web page displaying London weather][3]

The weather in London, OpenWeatherMap. Image is the author's own.

To get the information about the weather, you must find it somewhere. Fortunately, [OpenWeatherMap][2] provides everything you need through its REST API service.

_Ok, that's cool, but how can I use it?_

You can get everything you need by sending a `GET` request to: `https://api.openweathermap.org/data/2.5/weather?q={city_name}&appid={api_key}&units=metric`. For this tutorial, I'll parameterize the city name and settle on the metric unit.

### Retrieving the data

To retrieve the weather data, use `requests`. You can create a function that receives a city name as a parameter and returns a JSON. The JSON will contain the temperature, weather description, sunset, sunrise time, and so on.

The example below illustrates such a function:


```
def find_weather_for(city: str) -&gt; dict:
    """Queries the weather API and returns the weather data for a particular city."""
    url = API.format(city_name=city, api_key=API_KEY)
    resp = requests.get(url)
    return resp.json()
```

The URL is made up of two global variables:


```
BASE_URL = "<https://api.openweathermap.org/data/2.5/weather>"
API = BASE_URL + "?q={city_name}&amp;appid={api_key}&amp;units=metric"
```

The API returns a JSON in this format:


```
{
  "coord": {
    "lon": -0.13,
    "lat": 51.51
  },
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 16.53,
    "feels_like": 15.52,
    "temp_min": 15,
    "temp_max": 17.78,
    "pressure": 1023,
    "humidity": 72
  },
  "visibility": 10000,
  "wind": {
    "speed": 2.1,
    "deg": 40
  },
  "clouds": {
    "all": 0
  },
  "dt": 1600420164,
  "sys": {
    "type": 1,
    "id": 1414,
    "country": "GB",
    "sunrise": 1600407646,
    "sunset": 1600452509
  },
  "timezone": 3600,
  "id": 2643743,
  "name": "London",
  "cod": 200
```

The data is returned as a Python dictionary when you call `resp.json()`. In order to encapsulate all the details, you can represent them as a `dataclass`. This class has a factory method that gets the dictionary and returns a `WeatherInfo` instance.

This is good because you keep the representation stable. For example, if the API changes the way it structures the JSON, you can change the logic in just one place, the `from_dict` method. Other parts of the code won't be affected. You can even get information from different sources and combine them in the `from_dict` method!


```
@dataclass
class WeatherInfo:
    temp: float
    sunset: str
    sunrise: str
    temp_min: float
    temp_max: float
    desc: str

    @classmethod
    def from_dict(cls, data: dict) -&gt; "WeatherInfo":
        return cls(
            temp=data["main"]["temp"],
            temp_min=data["main"]["temp_min"],
            temp_max=data["main"]["temp_max"],
            desc=data["weather"][0]["main"],
            sunset=format_date(data["sys"]["sunset"]),
            sunrise=format_date(data["sys"]["sunrise"]),
        )
```

Now, you'll create a function called `retrieve_weather`. You'll use this function to call the API and return a `WeatherInfo` so you can build your HTML page.


```
def retrieve_weather(city: str) -&gt; WeatherInfo:
    """Finds the weather for a city and returns a WeatherInfo instance."""
    data = find_weather_for(city)
    return WeatherInfo.from_dict(data)
```

Good, you have the basic building blocks for our app. Before moving forward, unit test those functions.

### 1\. Testing the API using mocks

[According to Wikipedia][4], a mock object is an object that simulates the behavior of a real object by mimicking it. In Python, you can mock any object using the `unittest.mock` lib that is part of the standard library. To test the `retrieve_weather` function, you can then mock `requests.get` and return static data.

#### pytest-mock

For this tutorial, you'll use `pytest` as your testing framework of choice. The `pytest` library is very extensible through plugins. To accomplish our mocking goals, use `pytest-mock`. This plugin abstracts a bunch of setups from `unittest.mock` and makes your testing code very concise. If you are curious, I discuss more about it in [another blog post][5].

_Ok, enough talking, show me the code._

Here's a complete test case for the `retrieve_weather` function. This test uses two fixtures: One is the `mocker` fixture provided by the `pytest-mock` plugin. The other one is ours. It's just the static data you saved from a previous request.


```
@pytest.fixture()
def fake_weather_info():
    """Fixture that returns a static weather data."""
    with open("tests/resources/weather.json") as f:
        return json.load(f)

[/code] [code]

def test_retrieve_weather_using_mocks(mocker, fake_weather_info):
    """Given a city name, test that a HTML report about the weather is generated
    correctly."""
    # Creates a fake requests response object
    fake_resp = mocker.Mock()
    # Mock the json method to return the static weather data
    fake_resp.json = mocker.Mock(return_value=fake_weather_info)
    # Mock the status code
    fake_resp.status_code = HTTPStatus.OK

    mocker.patch("weather_app.requests.get", return_value=fake_resp)

    weather_info = retrieve_weather(city="London")
    assert weather_info == WeatherInfo.from_dict(fake_weather_info)
```

If you run the test, you get the following output:


```
============================= test session starts ==============================
...[omitted]...
tests/test_weather_app.py::test_retrieve_weather_using_mocks PASSED      [100%]
============================== 1 passed in 0.20s ===============================
Process finished with exit code 0
```

Great, your tests pass! But... Life is not a bed of roses. This test has pros and cons. I'll take a look at them.

#### Pros

Well, one pro already discussed is that by mocking the API's return, you make your tests easier. Isolate the communication with the API and make the test predictable. It will always return what you want.

#### Cons

As for cons, the problem is, what if you don't want to use `requests` anymore and decide to go with the standard library's `urllib`. Every time you change the implementation of `find_weather_for`, you will have to adapt the test. A good test doesn't change when your implementation changes. So, by mocking, you end up coupling your test with the implementation.

Also, another downside is the amount of setup you have to do before calling the function—at least three lines of code.


```
...
    # Creates a fake requests response object
    fake_resp = mocker.Mock()
    # Mock the json method to return the static weather data
    fake_resp.json = mocker.Mock(return_value=fake_weather_info)
    # Mock the status code
    fake_resp.status_code = HTTPStatus.OK
...
```

_Can I do better?_

Yes, please, follow along. I'll see now how to improve it a bit.

### Using responses

Mocking `requests` using the `mocker` feature has the downside of having a long setup. A good way to avoid that is to use a library that intercepts `requests` calls and patches them. There is more than one lib for that, but the simplest to me is `responses`. Let's see how to use it to replace `mock`.


```
@responses.activate
def test_retrieve_weather_using_responses(fake_weather_info):
    """Given a city name, test that a HTML report about the weather is generated
    correctly."""
    api_uri = API.format(city_name="London", api_key=API_KEY)
    responses.add(responses.GET, api_uri, json=fake_weather_info, status=HTTPStatus.OK)

    weather_info = retrieve_weather(city="London")
    assert weather_info == WeatherInfo.from_dict(fake_weather_info)
```

Again, this function makes use of our `fake_weather_info` fixture.

Next, run the test:


```
============================= test session starts ==============================
...
tests/test_weather_app.py::test_retrieve_weather_using_responses PASSED  [100%]
============================== 1 passed in 0.19s ===============================
```

Excellent! This test pass too. But... It's still not that great.

#### Pros

The good thing about using libraries like `responses` is that you don't need to patch `requests` ourselves. You save some setup by delegating the abstraction to the library. However, in case you haven't noticed, there are problems.

#### Cons

Again, the problem is, much like `unittest.mock`, your test is coupled to the implementation. If you replace `requests`, your test breaks.

### 2\. Testing the API using an adapter

_If by using mocks I couple our tests, what can I do?_

Imagine the following scenario: Say that you can no longer use `requests`, and you'll have to replace it with `urllib` since it comes with Python. Not only that, you learned the lesson of not coupling test code with implementation, and you want to avoid that in the future. You want to replace `urllib` and not have to rewrite the tests.

It turns out you can abstract away the code that performs the `GET` request.

_Really? How?_

You can abstract it by using an adapter. The adapter is a design pattern used to encapsulate or wrap the interface of other classes and expose it as a new interface. This way, you can change the adapters without changing our code. For example, you can encapsulate the details about `requests` in our `find_weather_for` and expose it via a function that takes only the URL.

So, this:


```
def find_weather_for(city: str) -&gt; dict:
    """Queries the weather API and returns the weather data for a particular city."""
    url = API.format(city_name=city, api_key=API_KEY)
    resp = requests.get(url)
    return resp.json()
```

Becomes this:


```
def find_weather_for(city: str) -&gt; dict:
    """Queries the weather API and returns the weather data for a particular city."""
    url = API.format(city_name=city, api_key=API_KEY)
    return adapter(url)
```

And the adapter becomes this:


```
def requests_adapter(url: str) -&gt; dict:
    resp = requests.get(url)
    return resp.json()
```

Now it's time to refactor our `retrieve_weather` function:


```
def retrieve_weather(city: str) -&gt; WeatherInfo:
    """Finds the weather for a city and returns a WeatherInfo instance."""
    data = find_weather_for(city, adapter=requests_adapter)
    return WeatherInfo.from_dict(data)
```

So, if you decide to change this implementation to one that uses `urllib`, just swap the adapters:


```
def urllib_adapter(url: str) -&gt; dict:
    """An adapter that encapsulates urllib.urlopen"""
    with urllib.request.urlopen(url) as response:
        resp = response.read()
    return json.loads(resp)

[/code] [code]

def retrieve_weather(city: str) -&gt; WeatherInfo:
    """Finds the weather for a city and returns a WeatherInfo instance."""
    data = find_weather_for(city, adapter=urllib_adapter)
    return WeatherInfo.from_dict(data)
```

_Ok, how about the tests?_

To test r`etrieve_weather`, just create a fake adapter that is used during test time:


```
@responses.activate
def test_retrieve_weather_using_adapter(
    fake_weather_info,
):
    def fake_adapter(url: str):
        return fake_weather_info

    weather_info = retrieve_weather(city="London", adapter=fake_adapter)
    assert weather_info == WeatherInfo.from_dict(fake_weather_info)
```

If you run the test you get:


```
============================= test session starts ==============================
tests/test_weather_app.py::test_retrieve_weather_using_adapter PASSED    [100%]
============================== 1 passed in 0.22s ===============================
```

#### Pros

The pro for this approach is that you successfully decoupled your test from the implementation. Use [dependency injection][6] to inject a fake adapter during test time. Also, you can swap the adapter at any time, including during runtime. You did all of this without changing the behavior.

#### Cons

The cons are that, since you're using a fake adapter for tests, if you introduce a bug in the adapter you employ in the implementation, your test won't catch it. For example, say that we pass a faulty parameter to `requests`, like this:


```
def requests_adapter(url: str) -&gt; dict:
    resp = requests.get(url, headers=&lt;some broken headers&gt;)
    return resp.json()
```

This adapter will fail in production, and the unit tests won't catch it. But truth to be told, you also have the same problem with the previous approach. That's why you always need to go beyond unit tests and also have integration tests. That being said, consider another option.

### 3\. Testing the API using VCR.py

Now it's finally the time to discuss our last option. I have only found about it quite recently, frankly. I've been using mocks for a long time and always had some problems with them. `VCR.py` is a library that simplifies a lot of the tests that make HTTP requests.

It works by recording the HTTP interaction the first time you run the test as a flat YAML file called a _cassette_. Both the request and the response are serialized. When you run the test for the second time, `VCR.py` will intercept the call and return a response for the request made.

Now see how to test `retrieve_weather` using `VCR.py below:`


```
@vcr.use_cassette()
def test_retrieve_weather_using_vcr(fake_weather_info):
    weather_info = retrieve_weather(city="London")
    assert weather_info == WeatherInfo.from_dict(fake_weather_info)
```

_Wow, is that it? No setup? What is that `@vcr.use_cassette()`?_

Yes, that's it! There is no setup, just a `pytest` annotation to tell VCR to intercept the call and save the cassette file.

_What does the cassette file look like?_

Good question. There's a bunch of things in it. This is because VCR saves every detail of the interaction.


```
interactions:
\- request:
    body: null
    headers:
      Accept:
      - '*/*'
      Accept-Encoding:
      - gzip, deflate
      Connection:
      - keep-alive
      User-Agent:
      - python-requests/2.24.0
    method: GET
    uri: [https://api.openweathermap.org/data/2.5/weather?q=London\&amp;appid=\][7]&lt;YOUR API KEY HERE&gt;&amp;units=metric
  response:
    body:
      string: '{"coord":{"lon":-0.13,"lat":51.51},"weather":[{"id":800,"main":"Clear","description":"clearsky","icon":"01d"}],"base":"stations","main":{"temp":16.53,"feels_like":15.52,"temp_min":15,"temp_max":17.78,"pressure":1023,"humidity":72},"visibility":10000,"wind":{"speed":2.1,"deg":40},"clouds":{"all":0},"dt":1600420164,"sys":{"type":1,"id":1414,"country":"GB","sunrise":1600407646,"sunset":1600452509},"timezone":3600,"id":2643743,"name":"London","cod":200}'
    headers:
      Access-Control-Allow-Credentials:
      - 'true'
      Access-Control-Allow-Methods:
      - GET, POST
      Access-Control-Allow-Origin:
      - '*'
      Connection:
      - keep-alive
      Content-Length:
      - '454'
      Content-Type:
      - application/json; charset=utf-8
      Date:
      - Fri, 18 Sep 2020 10:53:25 GMT
      Server:
      - openresty
      X-Cache-Key:
      - /data/2.5/weather?q=london&amp;units=metric
    status:
      code: 200
      message: OK
version: 1
```

_That's a lot!_

Indeed! The good thing is that you don't need to care much about it. `VCR.py` takes care of that for you.

#### Pros

Now, for the pros, I can list at least five things:

  * No setup code.
  * Tests remain isolated, so it's fast.
  * Tests are deterministic.
  * If you change the request, like by using incorrect headers, the test will fail.
  * It's not coupled to the implementation, so you can swap the adapters, and the test will pass. The only thing that matters is that you request is the same.



#### Cons

Again, despite the enormous benefits compared to mocking, there are still problems.

If the API provider changes the format of the data for some reason, the test will still pass. Fortunately, this is not very frequent, and API providers usually version their APIs before introducing such breaking changes. Also, unit tests are not meant to access the external API, so there isn't much to do here.

Another thing to consider is having end-to-end tests in place. These tests will call the server every time it runs. As the name says, it's a more broad test and slow. They cover a lot more ground than unit tests. In fact, not every project will need to have them. So, in my view, `VCR.py` is more than enough for most people's needs.

### Conclusion

This is it. I hope you've learned something useful today. Testing API client applications can be a bit daunting. Yet, when armed with the right tools and knowledge, you can tame the beast.

You can find the full app on [my GitHub][8].

* * *

_This article was originally published on the [author's personal blog][9] and has been adapted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/unit-test-python

作者：[Miguel Brito][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/miguendes
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://miguendes.me/how-i-set-up-my-python-workspace
[3]: https://opensource.com/sites/default/files/sbzkkiywh.jpeg
[4]: https://en.wikipedia.org/wiki/Mock_object
[5]: https://miguendes.me/7-pytest-plugins-you-must-definitely-use
[6]: https://stackoverflow.com/questions/130794/what-is-dependency-injection
[7]: https://api.openweathermap.org/data/2.5/weather?q=London\&appid=\
[8]: https://github.com/miguendes/tutorials/tree/master/testing_http
[9]: https://miguendes.me/3-ways-to-test-api-client-applications-in-python
