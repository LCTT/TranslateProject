[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (SPEED TEST: x86 vs. ARM for Web Crawling in Python)
[#]: via: (https://blog.dxmtechsupport.com.au/speed-test-x86-vs-arm-for-web-crawling-in-python/)
[#]: author: (James Mawson https://blog.dxmtechsupport.com.au/author/james-mawson/)

SPEED TEST: x86 vs. ARM for Web Crawling in Python
======

![][1]

Can you imagine if your job was to trawl competitor websites and jot prices down by hand, again and again and again? You’d burn your whole office down by lunchtime.

So, little wonder web crawlers are huge these days. They can keep track of customer sentiment and trending topics, monitor job openings, real estate transactions, UFC results, all sorts of stuff.

For those of a certain bent, this is fascinating stuff. Which is how I found myself playing around with [Scrapy][2], an open source web crawling framework written in Python.

Being wary of the potential to do something catastrophic to my computer while poking with things I didn’t understand, I decided to install it on my main machine but a Raspberry Pi.

And wouldn’t you know it? It actually didn’t run too shabby on the little tacker. Maybe this is a good use case for an ARM server?

Google had no solid answer. The nearest thing I found was [this Drupal hosting drag race][3], which showed an ARM server outperforming a much more expensive x86 based account.

That was definitely interesting. I mean, isn’t a web server kind of like a crawler in reverse? But with one operating on a LAMP stack and the other on a Python interpreter, it’s hardly the exact same thing.

So what could I do? Only one thing. Get some VPS accounts and make them race each other.

### What’s the Deal With ARM Processors?

ARM is now the most popular CPU architecture in the world.

But it’s generally seen as something you’d opt for to save money and battery life, rather than a serious workhorse.

It wasn’t always that way: this CPU was designed in Cambridge, England to power the fiendishly expensive [Acorn Archimedes][4]. This was the most powerful desktop computer in the world, and by a long way too: it was multiple times the speed of the fastest 386.

Acorn, like Commodore and Atari, somewhat ignorantly believed that the making of a great computer company was in the making of great computers. Bill Gates had a better idea. He got DOS on as many x86 machines – of the most widely varying quality and expense – as he could.

Having the best user base made you the obvious platform for third party developers to write software for; having all the software support made yours the most useful computer.

Even Apple nearly bit the dust. All the $$$$ were in building a better x86 chip, this was the architecture that ended up being developed for serious computing.

That wasn’t the end for ARM though. Their chips weren’t just fast, they could run well without drawing much power or emitting much heat. That made them a preferred technology in set top boxes, PDAs, digital cameras, MP3 players, and basically anything that either used a battery or where you’d just rather avoid the noise of a large fan.

So it was that Acorn spun off ARM, who began an idiosyncratic business model that continues to today: ARM doesn’t actually manufacture any chips, they license their intellectual property to others who do.

Which is more or less how they ended up in so many phones and tablets. When Linux was ported to the architecture, the door opened to other open source technologies, which is how we can run a web crawler on these chips today.

#### ARM in the Server Room

Some big names, like [Microsoft][5] and [Cloudflare][6], have placed heavy bets on the British Bulldog for their infrastructure. But for those of us with more modest budgets, the options are fairly sparse.

In fact, when it comes to cheap and cheerful VPS accounts that you can stick on the credit card for a few bucks a month, for years the only option was [Scaleway][7].

This changed a few months ago when public cloud heavyweight [AWS][8] launched its own ARM processor: the [AWS Graviton][9].

I decided to grab one of each, and race them against the most similar Intel offering from the same provider.

### Looking Under the Hood

So what are we actually racing here? Let’s jump right in.

#### Scaleway

Scaleway positions itself as “designed for developers”. And you know what? I think that’s fair enough: it’s definitely been a good little sandbox for developing and prototyping.

The dirt simple product offering and clean, easy dashboard guides you from home page to bash shell in minutes. That makes it a strong option for small businesses, freelancers and consultants who just want to get straight into a good VPS at a great price to run some crawls.

The ARM account we will be using is their [ARM64-2GB][10], which costs 3 euros a month and has 4 Cavium ThunderX cores. This launched in 2014 as the first server-class ARMv8 processor, but is now looking a bit middle-aged, having been superseded by the younger, prettier ThunderX2.

The x86 account we will be comparing it to is the [1-S][11], which costs a more princely 4 euros a month and has 2 Intel Atom C3995 cores. Intel’s Atom range is a low power single-threaded system on chip design, first built for laptops and then adapted for server use.

These accounts are otherwise fairly similar: they each have 2 gigabytes of memory, 50 gigabytes of SSD storage and 200 Mbit/s bandwidth. The disk drives possibly differ, but with the crawls we’re going to run here, this won’t come into play, we’re going to be doing everything in memory.

When I can’t use a package manager I’m familiar with, I become angry and confused, a bit like an autistic toddler without his security blanket, entirely beyond reasoning or consolation, it’s quite horrendous really, so both of these accounts will use Debian Stretch.

#### Amazon Web Services

In the same length of time as it takes you to give Scaleway your credit card details, launch a VPS, add a sudo user and start installing dependencies, you won’t even have gotten as far as registering your AWS account. You’ll still be reading through the product pages trying to figure out what’s going on.

There’s a serious breadth and depth here aimed at enterprises and others with complicated or specialised needs.

The AWS Graviton we wanna drag race is part of AWS’s “Elastic Compute Cloud” or EC2 range. I’ll be running it as an on-demand instance, which is the most convenient and expensive way to use EC2. AWS also operates a [spot market][12], where you get the server much cheaper if you can be flexible about when it runs. There’s also a [mid-priced option][13] if you want to run it 24/7.

Did I mention that AWS is complicated? Anyhoo..

The two accounts we’re comparing are [a1.medium][14] and [t2.small][15]. They both offer 2GB of RAM. Which begs the question: WTF is a vCPU? Confusingly, it’s a different thing on each account.

On the a1.medium account, a vCPU is a single core of the new AWS Graviton chip. This was built by Annapurna Labs, an Israeli chip maker bought by Amazon in 2015. This is a single-threaded 64-bit ARMv8 core exclusive to AWS. This has an on-demand price of 0.0255 US dollars per hour.

Our t2.small account runs on an Intel Xeon – though exactly which Xeon chip it is, I couldn’t really figure out. This has two threads per core – though we’re not really getting the whole core, or even the whole thread.

Instead we’re getting a “baseline performance of 20%, with the ability to burst above that baseline using CPU credits”. Which makes sense in principle, though it’s completely unclear to me what to actually expect from this. The on-demand price for this account is 0.023 US dollars per hour.

I couldn’t find Debian in the image library here, so both of these accounts will run Ubuntu 18.04.

### Beavis and Butthead Do Moz’s Top 500

To test these VPS accounts, I need a crawler to run – one that will let the CPU stretch its legs a bit. One way to do this would be to just hammer a few websites with as many requests as fast as possible, but that’s not very polite. What we’ll do instead is a broad crawl of many websites at once.

So it’s in tribute to my favourite physicist turned filmmaker, Mike Judge, that I wrote beavis.py. This crawls Moz’s Top 500 Websites to a depth of 3 pages to count how many times the words “wood” and “ass” occur anywhere within the HTML source.

Not all 500 websites will actually get crawled here – some will be excluded by robots.txt and others will require javascript to follow links and so on. But it’s a wide enough crawl to keep the CPU busy.

Python’s [global interpreter lock][16] means that beavis.py can only make use of a single CPU thread. To test multi-threaded we’re going to have to launch multiple spiders as seperate processes.

This is why I wrote butthead.py. Any true fan of the show knows that, as crude as Butthead was, he was always slightly more sophisticated than Beavis.

Splitting the crawl into multiple lists of start pages and allowed domains might slightly impact what gets crawled – fewer external links to other websites in the top 500 will get followed. But every crawl will be different anyway, so we will count how many pages are scraped as well as how long they take.

### Installing Scrapy on an ARM Server

Installing Scrapy is basically the same on each architecture. You install pip and various other dependencies, then install Scrapy from pip.

Installing Scrapy from pip to an ARM device does take noticeably longer though. I’m guessing this is because it has to compile the binary parts from source.

Once Scrapy is installed, I ran it from the shell to check that it’s fetching pages.

On Scaleway’s ARM account, there seemed to be a hitch with the service_identity module: it was installed but not working. This issue had come up on the Raspberry Pi as well, but not the AWS Graviton.

Not to worry, this was easily fixed with the following command:

```
sudo pip3 install service_identity --force --upgrade
```

Then we were off and racing!

### Single Threaded Crawls

The Scrapy docs say to try to [keep your crawls running between 80-90% CPU usage][17]. In practice, it’s hard – at least it is with the script I’ve written. What tends to happen is that the CPU gets very busy early in the crawl, drops a little bit and then rallies again.

The last part of the crawl, where most of the domains have been finished, can go on for quite a few minutes, which is frustrating, because at that point it feels like more a measure of how big the last website is than anything to do with the processor.

So please take this for what it is: not a state of the art benchmarking tool, but a short and slightly balding Australian in his underpants running some scripts and watching what happens.

So let’s get down to brass tacks. We’ll start with the Scaleway crawls.

| VPS       | Account | Time    | Pages  | Scraped    | Pages/Hour | €/million | pages |
| --------- | ------- | ------- | ------ | ---------- | ---------- | --------- | ----- |
| Scaleway  |         |         |        |            |            |           |       |
| ARM64-2GB | 108m    | 59.27s  | 38,205 | 21,032.623 | 0.28527    |           |       |
| --------- | ------- | ------- | ------ | ---------- | ---------- | --------- | ----- |
| Scaleway  |         |         |        |            |            |           |       |
| 1-S       | 97m     | 44.067s | 39,476 | 24,324.648 | 0.33011    |           |       |

I kept an eye on the CPU use of both of these crawls using [top][18]. Both crawls hit 100% CPU use at the beginning, but the ThunderX chip was definitely redlining a lot more. That means these figures understate how much faster the Atom core crawls than the ThunderX.

While I was watching CPU use in top, I could also see how much RAM was in use – this increased as the crawl continued. The ARM account used 14.7% at the end of the crawl, while the x86 was at 15%.

Watching the logs of these crawls, I also noticed a lot more pages timing out and going missing when the processor was maxed out. That makes sense – if the CPU’s too busy to respond to everything then something’s gonna go missing.

That’s not such a big deal when you’re just racing the things to see which is fastest. But in a real-world situation, with business outcomes at stake in the quality of your data, it’s probably worth having a little bit of headroom.

And what about AWS?

| VPS Account | Time         | Pages Scraped | Pages / Hour | $ / Million Pages |
| ----------- | ----         | ------------- | ------------ | ----------------- |
| a1.medium   | 100m 39.900s | 41,294        | 24,612.725   | 1.03605           |
| t2.small    | 78m 53.171s  | 41,200        | 31,336.286   | 0.73397           |

I’ve included these results for sake of comparison with the Scaleway crawls, but these crawls were kind of a bust. Monitoring the CPU use – this time through the AWS dashboard rather than through top – showed that the script wasn’t making good use of the available processing power on either account.

This was clearest with the a1.medium account – it hardly even got out of bed. It peaked at about 45% near the beginning and then bounced around between 20% and 30% for the rest.

What’s intriguing to me about this is that the exact same script ran much slower on the ARM processor – and that’s not because it hit a limit of the Graviton’s CPU power. It had oodles of headroom left. Even the Intel Atom core managed to finish, and that was maxing out for some of the crawl. The settings were the same in the code, the way they were being handled differently on the different architecture.

It’s a bit of a black box to me whether that’s something inherent to the processor itself, the way the binaries were compiled, or some interaction between the two. I’m going to speculate that we might have seen the same thing on the Scaleway ARM VPS, if we hadn’t hit the limit of the CPU core’s processing power first.

It was harder to know how the t2.small account was doing. The crawl sat at about 20%, sometimes going as high as 35%. Was that it meant by “baseline performance of 20%, with the ability to burst to a higher level”? I had no idea. But I could see on the dashboard I wasn’t burning through any CPU credits.

Just to make extra sure, I installed [stress][19] and ran it for a few minutes; sure enough, this thing could do 100% if you pushed it.

Clearly, I was going to need to crank the settings up on both these processors to make them sweat a bit, so I set CONCURRENT_REQUESTS to 5000 and REACTOR_THREADPOOL_MAXSIZE to 120 and ran some more crawls.

| VPS Account               | Time	           | Pages Scraped  | 	Pages/hr        | 	$/10000 Pages |
| -----------               | ----	           | -------------  | 	--------        | 	------------- |
| a1.medium	             | 46m 13.619s        | 	40,283     | 	52,285.047      | 	0.48771       |
| t2.small	              | 41m7.619s          | 	36,241	 | 52,871.857          | 	0.43501       |
| t2.small (No CPU credits) | 	73m 8.133s	 | 34,298         | 	28,137.8891	 | 0.81740           |

The a1 instance hit 100% usage about 5 minutes into the crawl, before dropping back to 80% use for another 20 minutes, climbing up to 96% again and then dropping down again as it was wrapping things up. That was probably about as well-tuned as I was going to get it.

The t2 instance hit 50% early in the crawl and stayed there for until it was nearly done. With 2 threads per core, 50% CPU use is one thread maxed out.

Here we see both accounts produce similar speeds. But the Xeon thread was redlining for most of the crawl, and the Graviton was not. I’m going to chalk this up as a slight win for the Graviton.

But what about once you’ve burnt through all your CPU credits? That’s probably the fairer comparison – to only use them as you earn them. I wanted to test that as well. So I ran stress until all the CPU credits were exhausted and ran the crawl again.

With no credits in the bank, the CPU usage maxed out at 27% and stayed there. So many pages ended up going missing that it actually performed worse than when on the lower settings.

### Multi Threaded Crawls

Dividing our crawl up between multiple spiders in separate processes offers a few more options to make use of the available cores.

I first tried dividing everything up between 10 processes and launching them all at once. This turned out to be slower than just dividing them up into 1 process per core.

I got the best result by combining these methods – dividing the crawl up into 10 processes and then launching 1 process per core at the start and then the rest as these crawls began to wind down.

To make this even better, you could try to minimise the problem of the last lingering crawler by making sure the longest crawls start first. I actually attempted to do this.

Figuring that the number of links on the home page might be a rough proxy for how large the crawl would be, I built a second spider to count them and then sort them in descending order of number of outgoing links. This preprocessing worked well and added a little over a minute.

It turned out though that blew the crawling time out beyond two hours! Putting all the most link heavy websites together in the same process wasn’t a great idea after all.

You might effectively deal with this by tweaking the number of domains per process as well – or by shuffling the list after it’s ordered. That’s a bit much for Beavis and Butthead though.

So I went back to my earlier method that had worked somewhat well:

| VPS Account        | Time        | Pages Scraped | Pages/hr    | €/10,000 pages |
| -----------        | ----        | ------------- | --------    | -------------- |
| Scaleway ARM64-2GB | 62m 10.078s | 36,158        | 34,897.0719 |        0.17193 |
| Scaleway 1-S       | 60m 56.902s | 36,725        | 36,153.5529 |        0.22128 |

After all that, using more cores did speed up the crawl. But it’s hardly a matter of just halving or quartering the time taken.

I’m certain that a more experienced coder could better optimise this to take advantage of all the cores. But, as far as “out of the box” Scrapy performance goes, it seems to be a lot easier to speed up a crawl by using faster threads rather than by throwing more cores at it.

As it is, the Atom has scraped slightly more pages in slightly less time. On a value for money metric, you could possibly say that the ThunderX is ahead. Either way, there’s not a lot of difference here.

### Everything You Always Wanted to Know About Ass and Wood (But Were Afraid to Ask)

After scraping 38,205 pages, our crawler found 24,170,435 mentions of ass and 54,368 mentions of wood.

![][20]

Considered on its own, this is a respectable amount of wood.

But when you set it against the sheer quantity of ass we’re dealing with here, the wood looks miniscule.

### The Verdict

From what’s visible to me at the moment, it looks like the CPU architecture you use is actually less important than how old the processor is. The AWS Graviton from 2018 was the winner here in single-threaded performance.

You could of course argue that the Xeon still wins, core for core. But then you’re not really going dollar for dollar anymore, or even thread for thread.

The Atom from 2017, on the other hand, comfortably bested the ThunderX from 2014. Though, on the value for money metric, the ThunderX might be the clear winner. Then again, if you can run your crawls on Amazon’s spot market, the Graviton is still ahead.

All in all, I think this shows that, yes, you can crawl the web with an ARM device, and it can compete on both performance and price.

Whether the difference is significant enough for you to turn what you’re doing upside down is a whole other question of course. Certainly, if you’re already on the AWS cloud – and your code is portable enough – then it might be worthwhile testing out their a1 instances.

Hopefully we will see more ARM options on the public cloud in near future.

### The Scripts

This is my first real go at doing anything in either Python or Scrapy. So this might not be great code to learn from. Some of what I’ve done here – such as using global variables – is definitely a bit kludgey.

Still, I want to be transparent about my methods, so here are my scripts.

To run them, you’ll need Scrapy installed and you will need the CSV file of [Moz’s top 500 domains][21]. To run butthead.py you will also need [psutil][22].

##### beavis.py

```
import scrapy
from scrapy.spiders import CrawlSpider, Rule
from scrapy.linkextractors import LinkExtractor
from scrapy.crawler import CrawlerProcess

ass = 0
wood = 0
totalpages = 0

def getdomains():

  moz500file = open('top500.domains.05.18.csv')

  domains = []
  moz500csv = moz500file.readlines()

  del moz500csv[0]

  for csvline in moz500csv:
    leftquote = csvline.find('"')    
    rightquote = leftquote + csvline[leftquote + 1:].find('"')
    domains.append(csvline[leftquote + 1:rightquote])

  return domains

def getstartpages(domains):
  
  startpages = []
  
  for domain in domains:
    startpages.append('http://' + domain)
  
  return startpages
  
class AssWoodItem(scrapy.Item):
  ass = scrapy.Field()
  wood = scrapy.Field()
  url = scrapy.Field()
  
class AssWoodPipeline(object):
  def __init__(self):
    self.asswoodstats = []

  def process_item(self, item, spider):
    self.asswoodstats.append((item.get('url'), item.get('ass'), item.get('wood')))
    
  def close_spider(self, spider):
    asstally, woodtally = 0, 0
    
    for asswoodcount in self.asswoodstats:
      asstally += asswoodcount[1]
      woodtally += asswoodcount[2]
      
    global ass, wood, totalpages
    ass = asstally
    wood = woodtally
    totalpages = len(self.asswoodstats)

class BeavisSpider(CrawlSpider):
  name = "Beavis"
  allowed_domains = getdomains()
  start_urls = getstartpages(allowed_domains)
  #start_urls = [ 'http://medium.com' ]
  custom_settings = {
    'DEPTH_LIMIT': 3,
    'DOWNLOAD_DELAY': 3,
    'CONCURRENT_REQUESTS': 1500,
    'REACTOR_THREADPOOL_MAXSIZE': 60,
    'ITEM_PIPELINES': { '__main__.AssWoodPipeline': 10 },
    'LOG_LEVEL': 'INFO',
    'RETRY_ENABLED': False,
    'DOWNLOAD_TIMEOUT': 30,
    'COOKIES_ENABLED': False,
    'AJAXCRAWL_ENABLED': True
  }
    
  rules = ( Rule(LinkExtractor(), callback='parse_asswood'), )
  
  def parse_asswood(self, response):
    if isinstance(response, scrapy.http.TextResponse):
      item = AssWoodItem()
      item['ass'] = response.text.casefold().count('ass')
      item['wood'] = response.text.casefold().count('wood')
      item['url'] = response.url
      yield item


if __name__ == '__main__':

  process = CrawlerProcess({
      'USER_AGENT': 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)'
  })

  process.crawl(BeavisSpider)
  process.start()

  print('Uhh, that was, like, ' + str(totalpages) + ' pages crawled.')
  print('Uh huhuhuhuh. It said ass ' + str(ass) + ' times.')
  print('Uh huhuhuhuh. It said wood ' + str(wood) + ' times.')
```

##### butthead.py

```
import scrapy, time, psutil
from scrapy.spiders import CrawlSpider, Rule, Spider
from scrapy.linkextractors import LinkExtractor
from scrapy.crawler import CrawlerProcess
from multiprocessing import Process, Queue, cpu_count

ass = 0
wood = 0
totalpages = 0
linkcounttuples =[]

def getdomains():

  moz500file = open('top500.domains.05.18.csv')

  domains = []
  moz500csv = moz500file.readlines()

  del moz500csv[0]

  for csvline in moz500csv:
    leftquote = csvline.find('"')    
    rightquote = leftquote + csvline[leftquote + 1:].find('"')
    domains.append(csvline[leftquote + 1:rightquote])

  return domains

def getstartpages(domains):
  
  startpages = []
  
  for domain in domains:
    startpages.append('http://' + domain)
  
  return startpages
  
class AssWoodItem(scrapy.Item):
  ass = scrapy.Field()
  wood = scrapy.Field()
  url = scrapy.Field()
  
class AssWoodPipeline(object):
  def __init__(self):
    self.asswoodstats = []

  def process_item(self, item, spider):
    self.asswoodstats.append((item.get('url'), item.get('ass'), item.get('wood')))
    
  def close_spider(self, spider):
    asstally, woodtally = 0, 0
    
    for asswoodcount in self.asswoodstats:
      asstally += asswoodcount[1]
      woodtally += asswoodcount[2]
      
    global ass, wood, totalpages
    ass = asstally
    wood = woodtally
    totalpages = len(self.asswoodstats)
          

class ButtheadSpider(CrawlSpider):
  name = "Butthead"
  custom_settings = {
    'DEPTH_LIMIT': 3,
    'DOWNLOAD_DELAY': 3,
    'CONCURRENT_REQUESTS': 250,
    'REACTOR_THREADPOOL_MAXSIZE': 30,
    'ITEM_PIPELINES': { '__main__.AssWoodPipeline': 10 },
    'LOG_LEVEL': 'INFO',
    'RETRY_ENABLED': False,
    'DOWNLOAD_TIMEOUT': 30,
    'COOKIES_ENABLED': False,
    'AJAXCRAWL_ENABLED': True
  }
    
  rules = ( Rule(LinkExtractor(), callback='parse_asswood'), )
  
  
  def parse_asswood(self, response):
    if isinstance(response, scrapy.http.TextResponse):
      item = AssWoodItem()
      item['ass'] = response.text.casefold().count('ass')
      item['wood'] = response.text.casefold().count('wood')
      item['url'] = response.url
      yield item

def startButthead(domainslist, urlslist, asswoodqueue):
  crawlprocess = CrawlerProcess({
      'USER_AGENT': 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)'
  })

  crawlprocess.crawl(ButtheadSpider, allowed_domains = domainslist, start_urls = urlslist)
  crawlprocess.start()
  asswoodqueue.put( (ass, wood, totalpages) )
  

if __name__ == '__main__':
  asswoodqueue = Queue()
  domains=getdomains()
  startpages=getstartpages(domains)
  processlist =[]
  cores = cpu_count()
  
  for i in range(10):
    domainsublist = domains[i * 50:(i + 1) * 50]
    pagesublist = startpages[i * 50:(i + 1) * 50]
    p = Process(target = startButthead, args = (domainsublist, pagesublist, asswoodqueue))
    processlist.append(p)
  
  for i in range(cores):
    processlist[i].start()
    
  time.sleep(180)
  
  i = cores
  
  while i != 10:
    time.sleep(60)
    if psutil.cpu_percent() < 66.7:
      processlist[i].start()
      i += 1
  
  for i in range(10):
    processlist[i].join()
  
  for i in range(10):
    asswoodtuple = asswoodqueue.get()
    ass += asswoodtuple[0]
    wood += asswoodtuple[1]
    totalpages += asswoodtuple[2]

  print('Uhh, that was, like, ' + str(totalpages) + ' pages crawled.')
  print('Uh huhuhuhuh. It said ass ' + str(ass) + ' times.')
  print('Uh huhuhuhuh. It said wood ' + str(wood) + ' times.')
```

--------------------------------------------------------------------------------

via: https://blog.dxmtechsupport.com.au/speed-test-x86-vs-arm-for-web-crawling-in-python/

作者：[James Mawson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.dxmtechsupport.com.au/author/james-mawson/
[b]: https://github.com/lujun9972
[1]: https://blog.dxmtechsupport.com.au/wp-content/uploads/2019/02/quadbike-1024x683.jpg
[2]: https://scrapy.org/
[3]: https://www.info2007.net/blog/2018/review-scaleway-arm-based-cloud-server.html
[4]: https://blog.dxmtechsupport.com.au/playing-badass-acorn-archimedes-games-on-a-raspberry-pi/
[5]: https://www.computerworld.com/article/3178544/microsoft-windows/microsoft-and-arm-look-to-topple-intel-in-servers.html
[6]: https://www.datacenterknowledge.com/design/cloudflare-bets-arm-servers-it-expands-its-data-center-network
[7]: https://www.scaleway.com/
[8]: https://aws.amazon.com/
[9]: https://www.theregister.co.uk/2018/11/27/amazon_aws_graviton_specs/
[10]: https://www.scaleway.com/virtual-cloud-servers/#anchor_arm
[11]: https://www.scaleway.com/virtual-cloud-servers/#anchor_starter
[12]: https://aws.amazon.com/ec2/spot/pricing/
[13]: https://aws.amazon.com/ec2/pricing/reserved-instances/
[14]: https://aws.amazon.com/ec2/instance-types/a1/
[15]: https://aws.amazon.com/ec2/instance-types/t2/
[16]: https://wiki.python.org/moin/GlobalInterpreterLock
[17]: https://docs.scrapy.org/en/latest/topics/broad-crawls.html
[18]: https://linux.die.net/man/1/top
[19]: https://linux.die.net/man/1/stress
[20]: https://blog.dxmtechsupport.com.au/wp-content/uploads/2019/02/Screenshot-from-2019-02-16-17-01-08.png
[21]: https://moz.com/top500
[22]: https://pypi.org/project/psutil/
