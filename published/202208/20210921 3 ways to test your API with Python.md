[#]: subject: "3 ways to test your API with Python"
[#]: via: "https://opensource.com/article/21/9/unit-test-python"
[#]: author: "Miguel Brito https://opensource.com/users/miguendes"
[#]: collector: "lujun9972"
[#]: translator: "Yufei-Yan"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14944-1.html"

用 Python 测试 API 的 3 种方式
=====

> 单元测试可能令人生畏，但是这些 Python 模块会使你的生活变得更容易。

![](https://img.linux.net.cn/data/attachment/album/202208/18/180800clp08p82pi838zrs.jpg)

在这个教程中，你将学到如何对执行 HTTP 请求代码的进行单元测试。也就是说，你将看到用 Python 对 API 进行单元测试的艺术。

单元测试是指对单个行为的测试。在测试中，一个众所周知的经验法则就是隔离那些需要外部依赖的代码。

比如，当测试一段执行 HTTP 请求的代码时，建议在测试过程中，把真正的调用替换成一个假的的调用。这种情况下，每次运行测试的时候，就可以对它进行单元测试，而不需要执行一个真正的 HTTP 请求。

问题就是，_怎样才能隔离这些代码？_

这就是我希望在这篇博文中回答的问题！我不仅会向你展示如果去做，而且也会权衡不同方法之间的优点和缺点。

要求：

  * [Python 3.8][2]
  * pytest-mock
  * requests
  * flask
  * responses
  * VCR.py

### 使用一个天气状况 REST API 的演示程序

为了更好的解决这个问题，假设你正在创建一个天气状况的应用。这个应用使用第三方天气状况 REST API 来检索一个城市的天气信息。其中一个需求是生成一个简单的 HTML 页面，像下面这个图片：

![web page displaying London weather][3]

*伦敦的天气，OpenWeatherMap。图片是作者自己制作的。*

为了获得天气的信息，必须得去某个地方找。幸运的是，通过 [OpenWeatherMap][2] 的 REST API 服务，可以获得一切需要的信息。

_好的，很棒，但是我该怎么用呢？_

通过发送一个 `GET` 请求到：`https://api.openweathermap.org/data/2.5/weather?q={city_name}&appid={api_key}&units=metric`，就可以获得你所需要的所有东西。在这个教程中，我会把城市名字设置成一个参数，并确定使用公制单位。

### 检索数据

使用 `requests` 模块来检索天气数据。你可以创建一个接收城市名字作为参数的函数，然后返回一个 JSON。JSON 包含温度、天气状况的描述、日出和日落时间等数据。

下面的例子演示了这样一个函数：

```
def find_weather_for(city: str) -> dict:
    """Queries the weather API and returns the weather data for a particular city."""
    url = API.format(city_name=city, api_key=API_KEY)
    resp = requests.get(url)
    return resp.json()
```

这个 URL 是由两个全局变量构成：

```
BASE_URL = "https://api.openweathermap.org/data/2.5/weather"
API = BASE_URL + "?q={city_name}&amp;appid={api_key}&amp;units=metric"
```

API 以这个格式返回了一个 JSON：

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

当调用 `resp.json()` 的时候，数据是以 Python 字典的形式返回的。为了封装所有细节，可以用 `dataclass` 来表示它们。这个类有一个工厂方法，可以获得这个字典并且返回一个 `WeatherInfo` 实例。

这种办法很好，因为可以保持这种表示方法的稳定。比如，如果 API 改变了 JSON 的结构，就可以在同一个地方（`from_dict` 方法中）修改逻辑。其他代码不会受影响。你也可以从不同的源获得信息，然后把它们都整合到 `from_dict` 方法中。

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
    def from_dict(cls, data: dict) -> "WeatherInfo":
        return cls(
            temp=data["main"]["temp"],
            temp_min=data["main"]["temp_min"],
            temp_max=data["main"]["temp_max"],
            desc=data["weather"][0]["main"],
            sunset=format_date(data["sys"]["sunset"]),
            sunrise=format_date(data["sys"]["sunrise"]),
        )
```

现在来创建一个叫做 `retrieve_weather` 的函数。使用这个函数调用 API，然后返回一个 `WeatherInfo`，这样就可创建你自己的 HTML 页面。

```
def retrieve_weather(city: str) -> WeatherInfo:
    """Finds the weather for a city and returns a WeatherInfo instance."""
    data = find_weather_for(city)
    return WeatherInfo.from_dict(data)
```

很好，我们的 app 现在有一些基础了。在继续之前，对这些函数进行单元测试。

### 1、使用 mock 测试 API

[根据维基百科][4]，<ruby>模拟对象<rt>mock object</rt></ruby>是通过模仿真实对象来模拟它行为的一个对象。在 Python 中，你可以使用 `unittest.mock` 库来<ruby>模拟<rt>mock</rt></ruby>任何对象，这个库是标准库中的一部分。为了测试 `retrieve_weather` 函数，可以模拟 `requests.get`，然后返回静态数据。

#### pytest-mock

在这个教程中，会使用 `pytest` 作为测试框架。通过插件，`pytest` 库是非常具有扩展性的。为了完成我们的模拟目标，要用 `pytest-mock`。这个插件抽象化了大量 `unittest.mock` 中的设置，也会让你的代码更简洁。如果你感兴趣的话，我在 [另一篇博文中][5] 会有更多的讨论。

_好的，言归正传，现在看代码。_

下面是一个 `retrieve_weather` 函数的完整测试用例。这个测试使用了两个 `fixture`：一个是由 `pytest-mock` 插件提供的 `mocker` fixture, 还有一个是我们自己的。就是从之前请求中保存的静态数据。

```
@pytest.fixture()
def fake_weather_info():
    """Fixture that returns a static weather data."""
    with open("tests/resources/weather.json") as f:
        return json.load(f)
```

```
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

如果运行这个测试，会获得下面的输出：

```
============================= test session starts ==============================
...[omitted]...
tests/test_weather_app.py::test_retrieve_weather_using_mocks PASSED      [100%]
============================== 1 passed in 0.20s ===============================
Process finished with exit code 0
```

很好，测试通过了！但是...生活并非一帆风顺。这个测试有优点，也有缺点。现在来看一下。

#### 优点

好的，有一个之前讨论过的优点就是，通过模拟 API 的返回值，测试变得简单了。将通信和 API 隔离，这样测试就可以预测了。这样总会返回你需要的东西。

#### 缺点

对于缺点，问题就是，如果不再想用 `requests` 了，并且决定回到标准库的 `urllib`，怎么办。每次改变 `find_weather_for` 的代码，都得去适配测试。好的测试是，当你修改代码实现的时候，测试时不需要改变的。所以，通过模拟，你最终把测试和实现耦合在了一起。

而且，另一个不好的方面是你需要在调用函数之前进行大量设置——至少是三行代码。

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

_我可以做的更好吗？_

是的，请继续看。我现在看看怎么改进一点。

### 使用 responses

用 `mocker` 功能模拟 `requests` 有点问题，就是有很多设置。避免这个问题的一个好办法就是使用一个库，可以拦截 `requests` 调用并且给它们 <ruby>打补丁<rt>patch</rt></ruby>。有不止一个库可以做这件事，但是对我来说最简单的是 `responses`。我们来看一下怎么用，并且替换 `mock`。

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

这个函数再次使用了我们的 `fake_weather_info` fixture。

然后运行测试：

```
============================= test session starts ==============================
...
tests/test_weather_app.py::test_retrieve_weather_using_responses PASSED  [100%]
============================== 1 passed in 0.19s ===============================
```

非常好！测试也通过了。但是...并不是那么棒。

#### 优点

使用诸如 `responses` 这样的库，好的方面就是不需要再给 `requests` <ruby>打补丁<rt>patch</rt></ruby>。通过将这层抽象交给库，可以减少一些设置。然而，如果你没注意到的话，还是有一些问题。

#### 缺点

和 `unittest.mock` 很像，测试和实现再一次耦合了。如果替换 `requests`，测试就不能用了。

### 2、使用适配器测试 API

_如果用模拟让测试耦合了，我能做什么？_

设想下面的场景：假如说你不能再用 `requests` 了，而且必须要用 `urllib` 替换，因为这是 Python 自带的。不仅仅是这样，你了解了不要把测试代码和实现耦合，并且你想今后都避免这种情况。你想替换 `urllib`，也不想重写测试了。

事实证明，你可以抽象出执行 `GET` 请求的代码。

_真的吗？怎么做？_

可以使用<ruby>适配器<rt>adapter</rt></ruby>来抽象它。适配器是一种用来封装其他类的接口，并作为新接口暴露出来的一种设计模式。用这种方式，就可以修改适配器而不需要修改代码了。比如，在 `find_weather_for` 函数中，封装关于 `requests` 的所有细节，然后把这部分暴露给只接受 URL 的函数。

所以，这个：

```
def find_weather_for(city: str) -> dict:
    """Queries the weather API and returns the weather data for a particular city."""
    url = API.format(city_name=city, api_key=API_KEY)
    resp = requests.get(url)
    return resp.json()
```

变成这样：

```
def find_weather_for(city: str) -> dict:
    """Queries the weather API and returns the weather data for a particular city."""
    url = API.format(city_name=city, api_key=API_KEY)
    return adapter(url)
```

然后适配器变成这样：

```
def requests_adapter(url: str) -> dict:
    resp = requests.get(url)
    return resp.json()
```

现在到了重构 `retrieve_weather` 函数的时候：

```
def retrieve_weather(city: str) -> WeatherInfo:
    """Finds the weather for a city and returns a WeatherInfo instance."""
    data = find_weather_for(city, adapter=requests_adapter)
    return WeatherInfo.from_dict(data)
```

所以，如果你决定改为使用 `urllib` 的实现，只要换一下适配器：

```
def urllib_adapter(url: str) -> dict:
    """An adapter that encapsulates urllib.urlopen"""
    with urllib.request.urlopen(url) as response:
        resp = response.read()
    return json.loads(resp)
```

```
def retrieve_weather(city: str) -> WeatherInfo:
    """Finds the weather for a city and returns a WeatherInfo instance."""
    data = find_weather_for(city, adapter=urllib_adapter)
    return WeatherInfo.from_dict(data)
```

_好的，那测试怎么做？_

为了测试 `retrieve_weather`, 只要创建一个在测试过程中使用的假的适配器：

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

如果运行测试，会获得：

```
============================= test session starts ==============================
tests/test_weather_app.py::test_retrieve_weather_using_adapter PASSED    [100%]
============================== 1 passed in 0.22s ===============================
```

#### 优点

这个方法的优点是可以成功将测试和实现解耦。使用<ruby>[依赖注入][6]<rt>dependency injection</rt></ruby>在测试期间注入一个假的适配器。你也可以在任何时候更换适配器，包括在运行时。这些事情都不会改变任何行为。

#### 缺点

缺点就是，因为你在测试中用了假的适配器，如果在实现中往适配器中引入了一个 bug，测试的时候就不会发现。比如说，往 `requests` 传入了一个有问题的参数，像这样：

```
def requests_adapter(url: str) -> dict:
    resp = requests.get(url, headers=<some broken headers>)
    return resp.json()
```

在生产环境中，适配器会有问题，而且单元测试没办法发现。但是事实是，之前的方法也会有同样的问题。这就是为什么不仅要单元测试，并且总是要集成测试。也就是说，要考虑另一个选项。

### 3、使用 VCR.py 测试 API

现在终于到了讨论我们最后一个选项了。诚实地说，我也是最近才发现这个。我用<ruby>模拟<rt>mock</rt></ruby>也很长时间了，而且总是有一些问题。`VCR.py` 是一个库，它可以简化很多 HTTP 请求的测试。

它的工作原理是将第一次运行测试的 HTTP 交互记录为一个 YAML 文件，叫做 `cassette`。请求和响应都会被序列化。当第二次运行测试的时候，`VCT.py` 将拦截对请求的调用，并且返回一个响应。

现在看一下下面如何使用 `VCR.py` 测试 `retrieve_weather`：

```
@vcr.use_cassette()
def test_retrieve_weather_using_vcr(fake_weather_info):
    weather_info = retrieve_weather(city="London")
    assert weather_info == WeatherInfo.from_dict(fake_weather_info)
```

_天呐，就这样？没有设置？`@vcr.use_cassette()` 是什么？_

是的，就这样！没有设置，只要一个 `pytest` 标注告诉 VCR 去拦截调用，然后保存 cassette 文件。

_cassette 文件是什么样？_

好问题。这个文件里有很多东西。这是因为 VCR 保存了交互中的所有细节。

```
interactions:
- request:
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
    uri: https://api.openweathermap.org/data/2.5/weather?q=London&appid=<YOUR API KEY HERE>&units=metric
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

_确实很多！_

真的！好的方面就是你不需要留意它。`VCR.py` 会为你安排好一切。

#### 优点

现在看一下优点，我可以至少列出五个：

  * 没有设置代码。
  * 测试仍然是分离的，所以很快。
  * 测试是确定的。
  * 如果你改了请求，比如说用了错误的 header，测试会失败。
  * 没有与代码实现耦合，所以你可以换适配器，而且测试会通过。唯一有关系的东西就是请求必须是一样的。

#### 缺点

再与模拟相比较，除了避免了错误，还是有一些问题。

如果 API 提供者出于某种原因修改了数据格式，测试仍然会通过。幸运的是，这种情况并不经常发生，而且在这种重大改变之前，API 提供者通常会给他们的 API 提供不同版本。

另一个需要考虑的事情是<ruby>就地<rt>in place</rt></ruby><ruby>端到端<rt>end-to-end</rt></ruby>测试。每次服务器运行的时候，这些测试都会调用。顾名思义，这是一个范围更广、更慢的测试。它们会比单元测试覆盖更多。事实上，并不是每个项目都需要使用它们。所以，就我看来，`VCR.py` 对于大多数人的需求来说都绰绰有余。

### 总结

就这么多了。我希望今天你了解了一些有用的东西。测试 API 客户端应用可能会有点吓人。然而，当武装了合适的工具和知识，你就可以驯服这个野兽。

在 [我的 Github][8] 上可以找到这个完整的应用。

_这篇文章最早发表在 [作者的个人博客][9]，授权转载_

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/unit-test-python

作者：[Miguel Brito][a]
选题：[lujun9972][b]
译者：[Yufei-Yan](https://github.com/Yufei-Yan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/miguendes
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://miguendes.me/how-i-set-up-my-python-workspace
[3]: https://opensource.com/sites/default/files/sbzkkiywh.jpeg
[4]: https://en.wikipedia.org/wiki/Mock_object
[5]: https://miguendes.me/7-pytest-plugins-you-must-definitely-use
[6]: https://stackoverflow.com/questions/130794/what-is-dependency-injection
[7]: https://api.openweathermap.org/data/2.5/weather?q=London&appid=
[8]: https://github.com/miguendes/tutorials/tree/master/testing_http
[9]: https://miguendes.me/3-ways-to-test-api-client-applications-in-python
