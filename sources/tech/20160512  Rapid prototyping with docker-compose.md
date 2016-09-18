
Rapid prototyping with docker-compose
========================================

In this write-up we'll look at a Node.js prototype for **finding stock of the Raspberry PI Zero** from three major outlets in the UK. 

I wrote the code and deployed it to an Ubuntu VM in Azure within a single evening of hacking. Docker and the docker-compose tool made the deployment and update process extremely quick.

### Remember linking?

If you've already been through the [Hands-On Docker tutorial][1] then you will have experience linking Docker containers on the command line. Linking a Node hit counter to a Redis server on the command line may look like this:

```
$ docker run -d -P --name redis1
$ docker run -d hit_counter -p 3000:3000 --link redis1:redis
```

Now imagine your application has three tiers

- Web front-end
- Batch tier for processing long running tasks
- Redis or mongo database

Explicit linking through `--link` is just about manageable with a couple of containers, but can get out of hand as we add more tiers or containers to the application.

### Enter docker-compose

![](http://blog.alexellis.io/content/images/2016/05/docker-compose-logo-01.png)
>Docker Compose logo

The docker-compose tool is part of the standard Docker Toolbox and can also be downloaded separately. It provides a rich set of features to configure all of an application's parts through a plain-text YAML file.

The above example would look like this:

```
version: "2.0"  
services:  
  redis1:
    image: redis
  hit_counter:
    build: ./hit_counter
    ports:
     - 3000:3000
```

From Docker 1.10 onwards we can take advantage of network overlays to help us scale out across multiple hosts. Prior to this linking only worked across a single host. The `docker-compose scale` command can be used to bring on more computing power as the need arises.

>View the [docker-compose][2] reference on docker.com

### Real-world example: Raspberry PI Stock Alert

![](http://blog.alexellis.io/content/images/2016/05/Raspberry_Pi_Zero_ver_1-3_1_of_3_large.JPG)
>The new Raspberry PI Zero v1.3 image courtesy of Pimoroni

There is a huge buzz around the Raspberry PI Zero - a tiny microcomputer with a 1GHz CPU and 512MB RAM capable of running full Linux, Docker, Node.js, Ruby and many other popular open-source tools. One of the best things about the PI Zero is that costs only 5 USD. That also means that stock gets snapped up really quickly.

*If you want to try Docker or Swarm on the PI check out the tutorial below.*

>[Docker Swarm on the PI Zero][3]

### Original site: whereismypizero.com

I found a webpage which used screen scraping to find whether 4-5 of the most popular outlets had stock.

- The site contained a static HTML page
- Issued one XMLHttpRequest per outlet accessing /public/api/
- The server issued the HTTP request to each shop and performed the scraping

Every call to /public/api/ took 3 seconds to execute and using Apache Bench (ab) I was only able to get through 0.25 requests per second.

### Reinventing the wheel

The retailers didn't seem to mind whereismypizero.com scraping their sites for stock, so I set about writing a similar tool from the ground up. I had the intention of handing a much higher amount of requests per second through caching and de-coupling the scrape from the web tier. Redis was the perfect tool for the job. It allowed me to set an automatically expiring key/value pair (i.e. a simple cache) and also to transmit messages between Node processes through pub/sub.

>Fork or star the code on Github: [alexellis/pi_zero_stock][4]

If you've worked with Node.js before then you will know it is single-threaded and that any CPU intensive tasks such as parsing HTML or JSON could lead to a slow-down. One way to mitigate that is to use a second worker process and a Redis messaging channel as connective tissue between this and the web tier.

- Web tier
  -Gives 200 for cache hit (Redis key exists for store)
  -Gives 202 for cache miss (Redis key doesn't exist, so issues message)
  -Since we are only ever reading a Redis key the response time is very quick.
- Stock Fetcher
  -Performs HTTP request
  -Scrapes for different types of web stores
  -Updates a Redis key with a cache expire of 60 seconds
  -Also locks a Redis key to prevent too many in-flight HTTP requests to the web stores.
```
version: "2.0"  
services:  
  web:
    build: ./web/
    ports:
     - "3000:3000"
  stock_fetch:
    build: ./stock_fetch/
  redis:
    image: redis
```

*The docker-compose.yml file from the example.*

Once I had this working locally deploying to an Ubuntu 16.04 image in the cloud (Azure) took less than 5 minutes. I logged in, cloned the repository and typed in `docker compose up -d`. That was all it took - rapid prototyping a whole system doesn't get much better. Anyone (including the owner of whereismypizero.com) can deploy the new solution with just two lines:

```
$ git clone https://github.com/alexellis/pi_zero_stock
$ docker-compose up -d
```

Updating the site is easy and just involves a `git pull` followed by a `docker-compose up -d` with the `--build` argument passed along.

If you are still linking your Docker containers manually, try Docker Compose for yourself or my code below:

>Fork or star the code on Github: [alexellis/pi_zero_stock][5]

### Check out the test site

The test site is currently deployed now using docker-compose.

>[stockalert.alexellis.io][6]

![](http://blog.alexellis.io/content/images/2016/05/Screen-Shot-2016-05-16-at-22-34-26-1.png)

Preview as of 16th of May 2016

----------
via: http://blog.alexellis.io/rapid-prototype-docker-compose/

作者：[Alex Ellis][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://blog.alexellis.io/author/alex/
[1]: http://blog.alexellis.io/handsondocker
[2]: https://docs.docker.com/compose/compose-file/
[3]: http://blog.alexellis.io/dockerswarm-pizero/
[4]: https://github.com/alexellis/pi_zero_stock
[5]: https://github.com/alexellis/pi_zero_stock
[6]: http://stockalert.alexellis.io/

