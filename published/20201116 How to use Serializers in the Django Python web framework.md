[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12900-1.html)
[#]: subject: (How to use Serializers in the Django Python web framework)
[#]: via: (https://opensource.com/article/20/11/django-rest-framework-serializers)
[#]: author: (Renato Oliveira https://opensource.com/users/renato-oliveira)

如何在 Python Web 框架 Django 中使用序列化器
======

> 序列化用于将数据转换为方便存储或传输的格式，然后将其重新构建以供使用。DRF 是最具有知名的序列化器。

![](https://img.linux.net.cn/data/attachment/album/202012/08/220845q5tz7cfftze5oem5.jpg)

序列化是将数据转换为可以存储或传输的格式，然后对其进行重新构建的过程。在开发应用程序或将数据存储在数据库、内存或将其转换为文件时，一直会用到它。

我最近帮助 [Labcodes][2] 的两名初级开发人员理解序列化器，我想也可以与诸位读者分享一下我的方法。

假设你正在编写一个电子商务网站，你有一个订单，该订单记录了某人在某个日期以某种价格购买了一个产品：

```
class Order:
    def __init__(self, product, customer, price, date):
        self.product = product
        self.customer = customer
        self.price = price
        self.date = date
```

现在，假设你想从一个键值数据库中存储和检索订单数据。幸运的是，它的接口可以接受和返回字典，因此你需要将对象转换成字典：

```
def serialize_order(order):
    return {
        'product': order.product,
        'customer': order.customer,
        'price': order.price,
        'date': order.date
    }
```

如果你想从数据库中获取一些数据，你可以获取字典数据并将其转换为订单对象（`Order`）：

```
def deserialize_order(order_data):
    return Order(
        product=order_data['product'],
        customer=order_data['customer'],
        price=order_data['price'],
        date=order_data['date'],
    )
```

这对于简单的数据非常直接了当，但是当你需要处理一些由复杂属性构成的复杂对象时，这种方法就无法很好地扩展。你还需要处理不同类型字段的验证，这需要手工完成大量工作。

此时框架的序列化可以很方便的派上用场。它们使你可以创建带有少量模板的序列化器，这将适用于复杂的情况。

[Django][3] 提供了一个序列化模块，允许你将模型“转换”为其它格式：

```
from django.core import serializers

serializers.serialize('json', Order.objects.all())
```

它涵盖了 Web 应用程序最常用的种类，例如 JSON、YAML 和 XML。但是你也可以使用第三方序列化器或创建自己的序列化器。你只需要在 `settings.py` 文件中注册它：

```
# settings.py
SERIALIZATION_MODULES = {
    'my_format': appname.serializers.MyFormatSerializer,
}
```

要创建自己的 `MyFormatSerializer`，你需要实现 `.serialize()` 方法并接受一个查询集和其它选项作为参数：

```
class MyFormatSerializer:
    def serialize(self, queryset, **options):
        # serious serialization happening
```

现在，你可以将查询集序列化为新格式：

```
from django.core import serializers

serializers.serialize('my_format', Order.objects.all())
```

你可以使用选项参数来定义序列化程序的行为。例如，如果要定义在处理 `ForeignKeys` 时要使用嵌套序列化，或者只希望数据返回其主键，你可以传递一个 `flat=True` 参数作为选项，并在方法中处理：

```
class MyFormatSerializer:
    def serializer(self, queryset, **options):
        if options.get('flat', False):
            # don't recursively serialize relationships
        # recursively serialize relationships
```

使用 Django 序列化的一种方法是使用 `loaddata` 和 `dumpdata` 管理命令。

### DRF 序列化器

在 Django 社区中，[Django REST 框架][4]（DRF）提供了最著名的序列化器。尽管你可以使用 Django 的序列化器来构建将在 API 中响应的 JSON，但 REST 框架中的序列化器提供了更出色的功能，可以帮助你处理并轻松验证复杂的数据。

在订单的例子中，你可以像这样创建一个序列化器：

```
from restframework import serializers

class OrderSerializer(serializers.Serializer):
    product = serializers.CharField(max_length=255)
    customer = serializers.CharField(max_lenght=255)
    price = serializers.DecimalField(max_digits=5, decimal_places=2)
    date = serializers.DateField()
```

轻松序列化其数据：

```
order = Order('pen', 'renato', 10.50, date.today())
serializer = OrderSerializer(order)

serializer.data
# {'product': 'pen', 'customer': 'renato', 'price': '10.50', 'date': '2020-08-16'}
```

为了能够从数据返回实例，你需要实现两个方法：`create` 和 `update`：

```
from rest_framework import serializers

class OrderSerializer(serializers.Serializer):
    product = serializers.CharField(max_length=255)
    customer = serializers.CharField(max_length=255)
    price = serializers.DecimalField(max_digits=5, decimal_places=2)
    date = serializers.DateField()

    def create(self, validated_data):
        # 执行订单创建
        return order

    def update(self, instance, validated_data):
       # 执行实例更新
       return instance
```

之后，你可以通过调用 `is_valid()` 来验证数据，并通过调用 `save()` 来创建或更新实例：

```
serializer = OrderSerializer(**data)
## 若要验证数据，在调用 save 之前必须执行
serializer.is_valid()
serializer.save()
```

### 模型序列化器

序列化数据时，通常需要从数据库（即你创建的模型）进行数据处理。`ModelSerializer` 与 `ModelForm` 一样，提供了一个 API，用于从模型创建序列化器。假设你有一个订单模型：

```
from django.db import models

class Order(models.Model):
    product = models.CharField(max_length=255)
    customer = models.CharField(max_length=255)
    price = models.DecimalField(max_digits=5, decimal_places=2)
    date = models.DateField()    
```

你可以像这样为它创建一个序列化器：

```
from rest_framework import serializers

class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = '__all__'
```

Django 会自动在序列化器中包含所有模型字段，并创建 `create` 和 `udpate` 方法。

### 在基于类的视图（CBV）中使用序列化器

像 Django CBV 中的 `Forms` 一样，序列化器可以很好地与 DRF 集成。你可以设置 `serializer_class` 属性，方便序列化器用于视图：

```
from rest_framework import generics

class OrderListCreateAPIView(generics.ListCreateAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
```

你也可以定义 `get_serializer_class()` 方法：

```
from rest_framework import generics

class OrderListCreateAPIView(generics.ListCreateAPIView):
    queryset = Order.objects.all()
   
    def get_serializer_class(self):
        if is_free_order():
            return FreeOrderSerializer
        return OrderSerializer
```

在 CBV 中还有其它与序列化器交互的方法。例如，[get_serializer()][5] 返回一个已经实例化的序列化器，[get_serializer_context()][6] 返回创建实例时传递给序列化器的参数。对于创建或更新数据的视图，有 `create` 和 `update`，它们使用 `is_valid` 方法验证数据，还有 [perform_create][7] 和 [perform_update][8] 调用序列化器的 `save` 方法。

### 了解更多

要了解更多资源，参考我朋友 André Ericson 的[经典 Django REST 框架][9]网站。它是一个[基于类的经典视图][10]的 REST 框架版本，可让你深入查看组成 DRF 的类。当然，官方[文档][11]也是一个很棒的资源。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/django-rest-framework-serializers

作者：[Renato Oliveira][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/renato-oliveira
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_analytics_cloud.png?itok=eE4uIoaB (Net catching 1s and 0s or data in the clouds)
[2]: http://www.labcodes.com.br
[3]: https://www.djangoproject.com/
[4]: https://www.django-rest-framework.org/
[5]: http://www.cdrf.co/3.9/rest_framework.generics/CreateAPIView.html#get_serializer
[6]: http://www.cdrf.co/3.9/rest_framework.generics/CreateAPIView.html#get_serializer_context
[7]: http://www.cdrf.co/3.9/rest_framework.generics/CreateAPIView.html#perform_create
[8]: http://www.cdrf.co/3.9/rest_framework.generics/RetrieveUpdateAPIView.html#perform_update
[9]: http://www.cdrf.co/
[10]: https://ccbv.co.uk/
[11]: https://www.django-rest-framework.org/api-guide/serializers/#serializers
