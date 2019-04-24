[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tracking the weather with Python and Prometheus)
[#]: via: (https://opensource.com/article/19/4/weather-python-prometheus)
[#]: author: (Moshe Zadka  https://opensource.com/users/moshez)

Tracking the weather with Python and Prometheus
======
Create a custom Prometheus integration to keep track of the biggest
cloud provider of all: Mother Earth.
![Tree clouds][1]

Open source monitoring system [Prometheus][2] has integrations to track many types of time-series data, but if you want an integration that doesn't yet exist, it's easy to build one. An often-used example is a custom integration with a cloud provider that uses the provider's APIs to grab specific metrics. In this example, though, we will integrate with the biggest cloud provider of all: Earth.

Luckily, the US government already measures the weather and provides an easy API for integrations. Getting the weather forecast for the next hour at Red Hat headquarters is simple.


```
import requests
HOURLY_RED_HAT = "<https://api.weather.gov/gridpoints/RAH/73,57/forecast/hourly>"
def get_temperature():
result = requests.get(HOURLY_RED_HAT)
return result.json()["properties"]["periods"][0]["temperature"]
```

Now that our integration with Earth is done, it's time to make sure Prometheus can understand what we are saying. We can use the [Prometheus Python library][3] to create a registry with one _gauge_ : the temperature at Red Hat HQ.


```
from prometheus_client import CollectorRegistry, Gauge
def prometheus_temperature(num):
registry = CollectorRegistry()
g = Gauge("red_hat_temp", "Temperature at Red Hat HQ", registry=registry)
g.set(num)
return registry
```

Finally, we need to connect this to Prometheus in some way. That depends a little on the network topology for Prometheus: whether it is easier for Prometheus to talk to our service, or whether the reverse is easier.

The first case is the one usually recommended, if possible, so we need to build a web server exposing the registry and then configure Prometheus to _scrape_ it.

We can build a simple web server with [Pyramid][4].


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

This can be run with any Web Server Gateway Interface (WSGI) server. For example, we can use **python -m twisted web --wsgi earth.app** to run it, assuming we put the code in **earth.py**.

Alternatively, if it is easier for our code to connect to Prometheus, we can push it to Prometheus's [Push gateway][5] periodically.


```
import time
from prometheus_client import push_to_gateway
def push_temperature(url):
while True:
registry = prometheus_temperature(get_temperature())
push_to_gateway(url, "temperature collector", registry)
time.sleep(60*60)
```

The URL is the one for the Push gateway; it often ends in **:9091**.

Good luck building your own custom Prometheus integration so you can track all the things!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/weather-python-prometheus

作者：[Moshe Zadka ][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_tree_clouds.png?itok=b_ftihhP (Tree clouds)
[2]: https://prometheus.io/
[3]: https://github.com/prometheus/client_python
[4]: https://trypyramid.com/
[5]: https://github.com/prometheus/pushgateway
