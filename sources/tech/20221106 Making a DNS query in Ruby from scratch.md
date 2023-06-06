[#]: subject: "Making a DNS query in Ruby from scratch"
[#]: via: "https://jvns.ca/blog/2022/11/06/making-a-dns-query-in-ruby-from-scratch/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Making a DNS query in Ruby from scratch
======

Hello! A while back I wrote a post about [how to write a toy DNS resolver in Go][1].

In that post I left out “how to generate and parse DNS queries” because I thought it was boring, but a few people pointed out that they did not know how to parse and generate DNS queries and they were interested in how to do it.

This made me curious – how much work _is_ it do the DNS parsing? It turns out we can do it in a pretty nice 120-line Ruby program, which is not that bad.

So here’s a quick post on how to generate DNS queries and parse DNS responses! We’re going to do it in Ruby because I’m giving a talk at a Ruby conference soon, and this blog post is partly prep for that talk :). I’ve tried to keep it readable for folks who don’t know Ruby though, I’ve only used pretty basic Ruby code.

At the end we’re going to have a very simple toy Ruby version of `dig` that can look up domain names like this:

```

    $ ruby dig.rb example.com
    example.com    20314    A    93.184.216.34

```

The whole thing is about 120 lines of code, so it’s not _that_ much. (The final program is [dig.rb][2] if you want to skip the explanations and just read some code.) We won’t implement the “how a DNS resolver works” from the previous post because, well, we already did that. Let’s get into it!

Along the way I’m going to try to explain how you could figure out some of this stuff yourself if you were trying to figure out how DNS queries are formatted from scratch. Mostly that’s “poke around in Wireshark” and “read RFC 1035, the DNS RFC”.

### step 1: open a UDP socket

We need to actually _send_ our queries, so to do that we need to open a UDP socket. We’ll send our queries to `8.8.8.8`, Google’s DNS server.

Here’s the code to set up a UDP connection to `8.8.8.8`, port 53 (the DNS port).

```

    require 'socket'
    sock = UDPSocket.new

    sock.bind('0.0.0.0', 12345)
    sock.connect('8.8.8.8', 53)

```

##### a quick note on UDP

I’m not going to say too much about UDP here, but I will say that the basic unit of computer networking is the “packet” (a packet is a string of bytes), and in this program we’re going to do the simplest possible thing you can do with a computer network – send 1 packet and receive 1 packet in response.

So UDP is a way to send packets in the simplest possible way.

It’s the most common way to send DNS queries, though you can also use TCP or DNS-over-HTTPS instead.

##### step 2: copy a DNS query from Wireshark

Next: let’s say we have no idea how DNS works but we want to send a working query as fast as possible. The easiest way to get a DNS query to play with and make sure our UDP connection is working is to just copy one that already works!

So that’s what we’re going to do, using Wireshark (an incredible packet analysis tool)

The steps I used to this are roughly:

  1. Open Wireshark and click ‘capture’
  2. Enter `udp.port == 53` as a filter (in the search bar)
  3. Run `ping example.com` in my terminal (to generate a DNS query)
  4. Click on the DNS query (“Standard query A example.com”)
  5. Right click on “Domain Name System (query”) in the bottom left pane
  6. Click ‘Copy’ -> ‘as a hex stream’
  7. Now I have “b96201000001000000000000076578616d706c6503636f6d0000010001” on my clipboard, to use in my Ruby program. Hooray!



##### step 3: decode the hex stream and send the DNS query

Now we can send our DNS query to `8.8.8.8`! Here’s what that looks like: we just need to add 5 lines of code

```

    hex_string = "b96201000001000000000000076578616d706c6503636f6d0000010001"
    bytes = [hex_string].pack('H*')
    sock.send(bytes, 0)

    # get the reply
    reply, _ = sock.recvfrom(1024)
    puts reply.unpack('H*')

```

`[hex_string].pack('H*')` is translating our hex string into a byte string. At this point we don’t really know what this data _means_ but we’ll get there in a second.

We can also take this opportunity to make sure our program is working and is sending valid data, using `tcpdump`. How I did that:

  1. Run `sudo tcpdump -ni any port 53 and host 8.8.8.8` in a terminal tab
  2. In a different terminal tab, run [this Ruby program][3] (`ruby dns-1.rb`)



Here’s what the output looks like:

```

    $ sudo tcpdump -ni any port 53 and host 8.8.8.8
    08:50:28.287440 IP 192.168.1.174.12345 > 8.8.8.8.53: 47458+ A? example.com. (29)
    08:50:28.312043 IP 8.8.8.8.53 > 192.168.1.174.12345: 47458 1/0/0 A 93.184.216.34 (45)

```

This is really good - we can see the DNS request (“what’s the IP for `example.com`”) and the response (“it’s 93.184.216.34”). So everything is working. Now we just need to, you know, figure out how to generate and decode this data ourselves.

##### step 4: learn a little about how DNS queries are formatted

Now that we have a DNS query for `example.com`, let’s learn about what it means.

Here’s our query, formatted as hex.

```

    b96201000001000000000000076578616d706c6503636f6d0000010001

```

If you poke around in Wireshark, you’ll see that this query has 2 parts:

  * The **header** (`b96201000001000000000000`)
  * The **question** (`076578616d706c6503636f6d0000010001`)



##### step 5: make the header

Our goal in this step is to generate the byte string `b96201000001000000000000`, but with a Ruby function instead of hardcoding it.

So: the header is 12 bytes. What do those 12 bytes mean? If you look at Wireshark (or read [RFC 1035][4]), you’ll see that it’s 6 2-byte numbers concatenated together.

The 6 numbers correspond to the query ID, the flags, and then the number of questions, answer records, authoritative records, and additional records in the packet.

We don’t need to worry about what all those things are yet though – we just need to put in 6 numbers.

And luckily we know exactly which 6 numbers to put because our goal is to literally generate the string `b96201000001000000000000`.

So here’s a function to make the header. (note: there’s no `return` because you don’t need to write `return` in Ruby if it’s the last line of the function)

```

    def make_question_header(query_id)
      # id, flags, num questions, num answers, num auth, num additional
      [query_id, 0x0100, 0x0001, 0x0000, 0x0000, 0x0000].pack('nnnnnn')
    end

```

This is very short because we’ve hardcoded everything except the query ID.

##### what’s `nnnnnn`?

You might be wondering what `nnnnnn` is in `.pack('nnnnnn')`. That’s a format string telling `.pack()` how to convert that array of 6 numbers into a byte string.

[The documentation for `.pack` is here][5], and it says that `n` means “represent it as “16-bit unsigned, network (big-endian) byte order”.

16 bits is the same as 2 bytes, and we need to use network byte order because this is computer networking. I’m not going to explain byte order right now (though I do have a [comic attempting to explain it][6])

##### test the header code

Let’s quickly test that our `make_question_header` function works.

```

    puts make_question_header(0xb962) == ["b96201000001000000000000"].pack("H*")

```

This prints out “true”, so we win and we can move on.

##### step 5: encode the domain name

Next we need to generate the **question** (“what’s the IP for `example.com`?“). This has 3 parts:

  * the **domain name** (for example “example.com”)
  * the **query type** (for example “A” is for “IPv4 **A**ddress”
  * the **query class** (which is always the same, 1 is for **IN** is for **IN**ternet)



The hardest part of this is the domain name so let’s write a function to do that.

`example.com` is encoded in a DNS query, in hex, as `076578616d706c6503636f6d00`. What does that mean?

Well, if we translate the bytes into ASCII, it looks like this:

```

    076578616d706c6503636f6d00
     7 e x a m p l e 3 c o m 0

```

So each segment (like `example`) has its length (like 7) in front of it.

Here’s the Ruby code to translate `example.com` into `7 e x a m p l e 3 c o m 0`:

```

    def encode_domain_name(domain)
      domain
        .split(".")
        .map { |x| x.length.chr + x }
        .join + "\0"
    end

```

Other than that, to finish generating the question section we just need to append the type and class onto the end of the domain name.

##### step 6: write `make_dns_query`

Here’s the final function to make a DNS query:

```

    def make_dns_query(domain, type)
      query_id = rand(65535)
      header = make_question_header(query_id)
      question =  encode_domain_name(domain) + [type, 1].pack('nn')
      header + question
    end

```

[Here’s all the code we’ve written before in `dns-2.rb`][7] – it’s still only 29 lines.

##### now for the parsing

Now that we’ve managed to _generate_ a DNS query, we get into the hard part: the parsing. Again, we’ll split this into a bunch of different

  * parse a DNS header
  * parse a DNS name
  * parse a DNS record



The hardest part of this (maybe surprisingly) is going to be “parse a DNS name”.

##### step 7: parse the DNS header

Let’s start with the easiest part: the DNS header. We already talked about how it’s 6 numbers concatenated together.

So all we need to do is

  * read the first 12 bytes
  * convert that into an array of 6 numbers
  * put those numbers in a class for convenience



Here’s the Ruby code to do that.

```

    class DNSHeader
      attr_reader :id, :flags, :num_questions, :num_answers, :num_auth, :num_additional
      def initialize(buf)
        hdr = buf.read(12)
        @id, @flags, @num_questions, @num_answers, @num_auth, @num_additional = hdr.unpack('nnnnnn')
      end
    end

```

Quick Ruby note: `attr_reader` is a Ruby thing that means “make these instance variables accessible as methods”. So you can call `header.flags` to look at the `@flags` variable.

We can call this with `DNSHeader(buf)`. Not so bad.

Let’s move on to the hardest part: parsing a domain name.

##### step 8: parse a domain name

First, let’s write a partial version.

```

    def read_domain_name_wrong(buf)
      domain = []
      loop do
        len = buf.read(1).unpack('C')[0]
        break if len == 0
        domain << buf.read(len)
      end
      domain.join('.')
    end

```

This repeatedly reads 1 byte and then reads that length into a string until the length is 0.

This works great, for the first time we see a domain name (`example.com`) in our DNS response.

##### trouble with domain names: compression!

But the second time `example.com` appears, we run into trouble – in Wireshark, it says that the domain is represented cryptically as just the 2 bytes `c00c`.

This is something called **DNS compression** and if we want to parse any DNS responses we’re going to have to implement it.

This is luckily not **that** hard. All `c00c` is saying is:

  * The first 2 bits (`0b11.....`) mean “DNS compression ahead!”
  * The remaining 14 bits are an integer. In this case that integer is `12` (`0x0c`), so that means “go back to the 12th byte in the packet and use the domain name you find there”



If you want to read more about DNS compression, I found the [explanation in the DNS RFC][8] relatively readable.

##### step 9: implement DNS compression

So we need a more complicated version of our `read_domain_name` function

Here it is.

```

      domain = []
      loop do
        len = buf.read(1).unpack('C')[0]
        break if len == 0
        if len & 0b11000000 == 0b11000000
          # weird case: DNS compression!
          second_byte = buf.read(1).unpack('C')[0]
          offset = ((len & 0x3f) << 8) + second_byte
          old_pos = buf.pos
          buf.pos = offset
          domain << read_domain_name(buf)
          buf.pos = old_pos
          break
        else
          # normal case
          domain << buf.read(len)
        end
      end
      domain.join('.')

```

Basically what’s happening is:

  * if the first 2 bits are `0b11`, we need to do DNS compression. Then:
    * read the second byte and do a little bit arithmetic to convert that into the offset
    * save the current position in the buffer
    * read the domain name at the offset we calculated
    * restore our position in the buffer



This is kind of messy but it’s the most complicated part of parsing the DNS response, so we’re almost done!

##### step 10: parse a DNS query

You might think “why do we need to parse a DNS query? This is the response!”. But every DNS response has the original query in it, so we need to parse it.

Here’s the code for parsing the DNS query.

```

    class DNSQuery
      attr_reader :domain, :type, :cls
      def initialize(buf)
        @domain = read_domain_name(buf)
        @type, @cls = buf.read(4).unpack('nn')
      end
    end

```

There’s not very much to it: the type and class are 2 bytes each.

##### step 11: parse a DNS record

This is the exciting part – the DNS record is where our query data lives! The “rdata field” (“record data”) is where the IP address we’re going to get in response to our DNS query lives.

Here’s the code:

```

    class DNSRecord
      attr_reader :name, :type, :class, :ttl, :rdlength, :rdata
      def initialize(buf)
        @name = read_domain_name(buf)
        @type, @class, @ttl, @rdlength = buf.read(10).unpack('nnNn')
        @rdata = buf.read(@rdlength)
      end

```

We also need to do a little work to make the `rdata` field human readable. The meaning of the record data depends on the record type – for example for an “A” record it’s a 4-byte IP address, for but a “CNAME” record it’s a domain name.

So here’s some code to make the request data human readable:

```

      def read_rdata(buf, length)
        @type_name = TYPES[@type] || @type
        if @type_name == "CNAME" or @type_name == "NS"
          read_domain_name(buf)
        elsif @type_name == "A"
          buf.read(length).unpack('C*').join('.')
        else
          buf.read(length)
        end
      end

```

This function uses this `TYPES` hash to map the record type to a human-readable name:

```

    TYPES = {
      1 => "A",
      2 => "NS",
      5 => "CNAME",
      # there are a lot more but we don't need them for this example
    }

```

The most interesting part of `read_rdata` is probably the line `buf.read(length).unpack('C*').join('.')` – it’s saying “hey, an IP address is 4 bytes, so convert it into an array of 4 numbers and then join those with “.“s”.

##### step 12: finish parsing the DNS response

Now we’re ready to parse the DNS response!

Here’s some code to do that:

```

    class DNSResponse
      attr_reader :header, :queries, :answers, :authorities, :additionals
      def initialize(bytes)
        buf = StringIO.new(bytes)
        @header = DNSHeader.new(buf)
        @queries = (1..@header.num_questions).map { DNSQuery.new(buf) }
        @answers = (1..@header.num_answers).map { DNSRecord.new(buf) }
        @authorities = (1..@header.num_auth).map { DNSRecord.new(buf) }
        @additionals = (1..@header.num_additional).map { DNSRecord.new(buf) }
      end
    end

```

This mostly just calls the other functions we’ve written to parse the DNS response.

It uses this cute `(1..@header.num_answers).map` construction to create an array of 2 DNS records if `@header.num_answers` is 2. (which is maybe a _little_ bit of Ruby magic but I think it’s kind of fun and hopefully isn’t too hard to read)

We can integrate this code into our main function like this:

```

    sock.send(make_dns_query("example.com", 1), 0) # 1 is "A", for IP address
    reply, _ = sock.recvfrom(1024)
    response = DNSResponse.new(reply) # parse the response!!!
    puts response.answers[0]

```

Printing out the records looks awful though (it says something like `#<DNSRecord:0x00000001368e3118>`). So we need to write some pretty printing code to make it human readable.

##### step 13: pretty print our DNS records

We need to add a `.to_s` field to DNS records to make them have a nice string representation. This is just a 1-line method in `DNSRecord`:

```

      def to_s
        "#{@name}\t\t#{@ttl}\t#{@type_name}\t#{@parsed_rdata}"
      end

```

You also might notice that I left out the `class` field of the DNS record. That’s because it’s always the same (IN for “internet”) so I felt it was redundant. Most DNS tools (like real `dig`) will print out the class though.

##### and we’re done!

Here’s our final `main` function:

```

    def main
      # connect to google dns
      sock = UDPSocket.new
      sock.bind('0.0.0.0', 12345)
      sock.connect('8.8.8.8', 53)

      # send query
      domain = ARGV[0]
      sock.send(make_dns_query(domain, 1), 0)

      # receive & parse response
      reply, _ = sock.recvfrom(1024)
      response = DNSResponse.new(reply)
      response.answers.each do |record|
        puts record
      end

```

I don’t think there’s too much to say about this – we connect, send a query, print out each of the answers, and exit. Success!

```

    $ ruby dig.rb example.com
    example.com   18608   A   93.184.216.34

```

You can see the final program as a gist here: [dig.rb][2]. You could add more features to it if you want, like

  * pretty printing for other query types
  * options to print out the “authority” and “additional” sections of the DNS response
  * retries
  * making sure that the DNS response we see is _actually_ a response to the query we sent (the query ID has to match!



Also [you can let me know on Twitter][9] if I’ve made a mistake in this post somewhere – I wrote this pretty quickly so I probably got something wrong.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/11/06/making-a-dns-query-in-ruby-from-scratch/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/2022/02/01/a-dns-resolver-in-80-lines-of-go/
[2]: https://gist.github.com/jvns/1e5838a53520e45969687e2f90199770
[3]: https://gist.github.com/jvns/aa202b1edd97ae261715c806b2ba7d39
[4]: https://datatracker.ietf.org/doc/html/rfc1035#section-4.1.1
[5]: https://ruby-doc.org/core-3.0.0/Array.html#method-i-pack
[6]: https://wizardzines.com/comics/little-endian/
[7]: https://gist.github.com/jvns/3587ea0b4a2a6c20dcfd8bf653fc11d9
[8]: https://datatracker.ietf.org/doc/html/rfc1035#section-4.1.4
[9]: https://twitter.com/b0rk
