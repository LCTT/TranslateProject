[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10807-1.html)
[#]: subject: (Tracking the weather with Python and Prometheus)
[#]: via: (https://opensource.com/article/19/4/weather-python-prometheus)
[#]: author: (Moshe Zadka  https://opensource.com/users/moshez)

使用 Python 和 Prometheus 跟踪天气
======

> 创建自定义 Prometheus 集成以跟踪最大的云端提供商：地球母亲。

![Tree clouds][1]

开源监控系统 [Prometheus][2] 集成了跟踪多种类型的时间序列数据，但如果没有集成你想要的数据，那么很容易构建一个。一个经常使用的例子使用云端提供商的自定义集成，它使用提供商的 API 抓取特定的指标。但是，在这个例子中，我们将与最大云端提供商集成：地球。

幸运的是，美国政府已经测量了天气并为集成提供了一个简单的 API。获取红帽总部下一个小时的天气预报很简单。

```
import requests
HOURLY_RED_HAT = "<https://api.weather.gov/gridpoints/RAH/73,57/forecast/hourly>"
def get_temperature():
    result = requests.get(HOURLY_RED_HAT)
    return result.json()["properties"]["periods"][0]["temperature"]
```

现在我们已经完成了与地球的集成，现在是确保 Prometheus 能够理解我们想要内容的时候了。我们可以使用 [Prometheus Python 库][3]中的 gauge 创建一个注册项：红帽总部的温度。


```
from prometheus_client import CollectorRegistry, Gauge
def prometheus_temperature(num):
    registry = CollectorRegistry()
    g = Gauge("red_hat_temp", "Temperature at Red Hat HQ", registry=registry)
    g.set(num)
    return registry
```

最后，我们需要以某种方式将它连接到 Prometheus。这有点依赖 Prometheus 的网络拓扑：是 Prometheus 与我们的服务通信更容易，还是反向更容易。

第一种是通常建议的情况，如果可能的话，我们需要构建一个公开注册入口的 Web 服务器，并配置 Prometheus 收刮（scrape）它。

我们可以使用 [Pyramid][4] 构建一个简单的 Web 服务器。

```
from pyramid.config import Configurator
from pyramid.response import Response
from prometheus_client import generate_latest, CONTENT_TYPE_LATEST
def metrics_web(request):
    registry = prometheus_temperature(get_temperature())
    return Response(generate_latest(registry),
                               content_type=CONTENT_TYPE_LATEST)
config = Configurator()
config.add_route('metrics', '/metrics')
config.add_view(metrics_web, route_name='metrics')
app = config.make_wsgi_app()
```

这可以使用任何 Web 网关接口（WSGI）服务器运行。例如，假设我们将代码放在 `earth.py` 中，我们可以使用 `python -m twisted web --wsgi earth.app` 来运行它。

或者，如果我们的代码连接到 Prometheus 更容易，我们可以定期将其推送到 Prometheus 的[推送网关][5]。

```
import time
from prometheus_client import push_to_gateway
def push_temperature(url):
    while True:
        registry = prometheus_temperature(get_temperature())
        push_to_gateway(url, "temperature collector", registry)
        time.sleep(60*60)
```

这里的 URL 是推送网关的 URL。它通常以 `:9091` 结尾。

祝你构建自定义 Prometheus 集成成功，以便跟踪一切！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/weather-python-prometheus

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_tree_clouds.png?itok=b_ftihhP (Tree clouds)
[2]: https://prometheus.io/
[3]: https://github.com/prometheus/client_python
[4]: https://trypyramid.com/
[5]: https://github.com/prometheus/pushgateway
