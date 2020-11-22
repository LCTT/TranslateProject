[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use Serializers in the Django Python web framework)
[#]: via: (https://opensource.com/article/20/11/django-rest-framework-serializers)
[#]: author: (Renato Oliveira https://opensource.com/users/renato-oliveira)

How to use Serializers in the Django Python web framework
======
Serialization transforms data into a format that can be stored or
transmitted and then reconstructs it for use. DRF has the best-known
serializers.
![Net catching 1s and 0s or data in the clouds][1]

Serialization is the process of transforming data into a format that can be stored or transmitted and then reconstructing it. It's used all the time when developing applications or storing data in databases, in memory, or converting it into files.

I recently helped two junior developers at [Labcodes][2] understand serializers, and I thought it would be good to share my approach with Opensource.com readers.

Suppose you're creating software for an e-commerce site and you have an Order that registers the purchase of a single product, by someone, at a price, on a date:


```
class Order:
    def __init__(self, product, customer, price, date):
        self.product = product
        self.customer = customer
        self.price = price
        self.date = date
```

Now, imagine you want to store and retrieve order data from a key-value database. Luckily, its interface accepts and return dictionaries, so you need to convert your object into a dictionary:


```
def serialize_order(order):
    return {
        'product': order.product,
        'customer': order.customer,
        'price': order.price,
        'date': order.date
    }
```

And if you want to get some data from that database, you can get the dict data and turn that into your Order object:


```
def deserialize_order(order_data):
    return Order(
        product=order_data['product'],
        customer=order_data['customer'],
        price=order_data['price'],
        date=order_data['date'],
    )
```

This is pretty straightforward to do with simple data, but when you need to deal with complex objects made of complex attributes, this approach doesn't scale well. You also need to handle the validation of different types of fields, and that's a lot of work to do manually.

That's where frameworks' serializers are handy. They allow you to create serializers with little boilerplates that will work for your complex cases.

[Django][3] comes with a serialization module that allows you to "translate" Models into other formats:


```
from django.core import serializers

serializers.serialize('json', Order.objects.all())
```

It covers the most-used cases for web applications, such as JSON, YAML, and XML. But you can also use third-party serializers or create your own. You just need to register it in your settings.py file:


```
# settings.py
SERIALIZATION_MODULES = {
    'my_format': appname.serializers.MyFormatSerializer,
}
```

To create your own `MyFormatSerializer`, you need to implement the `.serialize()` method and accept a queryset and extra options as params:


```
class MyFormatSerializer:
    def serialize(self, queryset, **options):
        # serious serialization happening
```

Now you can serialize your queryset to your new format:


```
from django.core import serializers

serializers.serialize('my_format', Order.objects.all())
```

You can use the options parameters to define the behavior of your serializer. For example, if you want to define that you're going to work with nested serialization when dealing with `ForeignKeys` or you just want that data to return its primary keys, you can pass a `flat=True` param as an option and deal with that within your method:


```
class MyFormatSerializer:
    def serializer(self, queryset, **options):
        if options.get('flat', False):
            # don't recursively serialize relationships
        # recursively serialize relationships
```

One way to use Django serialization is with the `loaddata` and `dumpdata` management commands.

### DRF serializers

In the Django community, the [Django REST framework][4] (DRF) offers the best-known serializers. Although you can use Django's serializers to build the JSON you'll respond to in your API, the one from the REST framework comes with nice features that help you deal with and easily validate complex data.

In the Order example, you could create a serializer like this:


```
from restframework import serializers

class OrderSerializer(serializers.Serializer):
    product = serializers.CharField(max_length=255)
    customer = serializers.CharField(max_lenght=255)
    price = serializers.DecimalField(max_digits=5, decimal_places=2)
    date = serializers.DateField()
```

And easily serialize its data:


```
order = Order('pen', 'renato', 10.50, date.today())
serializer = OrderSerializer(order)

serializer.data
# {'product': 'pen', 'customer': 'renato', 'price': '10.50', 'date': '2020-08-16'}
```

To be able to return an instance from data, you need to implement two methods—create and update:


```
from rest_framework import serializers

class OrderSerializer(serializers.Serializer):
    product = serializers.CharField(max_length=255)
    customer = serializers.CharField(max_length=255)
    price = serializers.DecimalField(max_digits=5, decimal_places=2)
    date = serializers.DateField()

    def create(self, validated_data):
        # perform order creation
        return order

    def update(self, instance, validated_data):
       # perform instance update
       return instance
```

After that, you can create or update instances by calling `is_valid()` to validate the data and `save()` to create or update an instance:


```
serializer = OrderSerializer(**data)
## to validate data, mandatory before calling save
serializer.is_valid()
serializer.save()
```

### Model serializers

When serializing data, you often need to do it from a database, therefore, from your models. A ModelSerializer, like a ModelForm, provides an API to create serializers from your models. Suppose you have an Order model:


```
from django.db import models

class Order(models.Model):
    product = models.CharField(max_length=255)
    customer = models.CharField(max_length=255)
    price = models.DecimalField(max_digits=5, decimal_places=2)
    date = models.DateField()    
```

You can create a serializer for it like this:


```
from rest_framework import serializers

class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = '__all__'
```

Django automatically includes all model fields in the serializer and creates the `create` and `update` methods.

### Using serializers in class-based views (CBVs)

Like Forms with Django's CBVs, serializers integrate well with DRFs. You can set the `serializer_class` attribute so that the serializer will be available to the view:


```
from rest_framework import generics

class OrderListCreateAPIView(generics.ListCreateAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
```

You can also define the `get_serializer_class()` method:


```
from rest_framework import generics

class OrderListCreateAPIView(generics.ListCreateAPIView):
    queryset = Order.objects.all()
   
    def get_serializer_class(self):
        if is_free_order():
            return FreeOrderSerializer
        return OrderSerializer
```

There are other methods in CBVs that interact with serializers. For example, [get_serializer()][5] returns an already-instantiated serializer, while [get_serializer_context()][6] returns the arguments you'll pass to the serializer when creating its instance. For views that create or update data, there are `create` and `update` that validate the data with the `is_valid` method to be saved, and [perform_create][7] and [perform_update][8] that call the serializer's save method.

### Learn more

For other resources, see my friend André Ericson's [Classy Django REST Framework][9] website. It is a [Classy Class-Based Views][10] REST Framework version that gives you an in-depth inspection of the classes that compose DRF. Of course, the official [documentation][11] is an awesome resource.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/django-rest-framework-serializers

作者：[Renato Oliveira][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
