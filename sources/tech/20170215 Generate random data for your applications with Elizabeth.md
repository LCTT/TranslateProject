translating---geekpi

Generate random data for your applications with Elizabeth
============================================================


 ![Generate random data for your applications with Elizabeth](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/osdc_520x292_opendata_0613mm.png?itok=mzC0Tb28 "Generate random data for your applications with Elizabeth") 
Image by : Opensource.com

 _Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. _ 

No, I've not had my article hijacked by a [Lorem ipsum][2] generator. For this month's Nooks & Crannies column, I found an interesting little Python library to help developers generate random data for their applications. It's called [Elizabeth][3].

Written by Líkið Geimfari, and licensed under the MIT license, Elizabeth has a set of 18 data providers in 21 different locales that you can use to generate random information, including names and personal characteristics, addresses, text data, transportation information, networking and Internet social media data, numbers, and much more. Installation requires [Python 3.2][4] or higher, and you can either install it using **pip**, or from the **git** repository.

For my test drive, I installed with pip, on a fresh [Debian][5] Jessie box. You'll need to **apt-get install python3-pip**, which will install Python and needed dependencies. Then **pip install elizabeth**, and you're ready to use it.

Just for giggles, let's generate some random data on a person in the Python interactive interpreter:

```
>>> from elizabeth import Personal
>>> p=Personal('en')
>>> p.full_name(gender="male")
'Elvis Herring'
>>> p.blood_type()
'B+'
>>> p.credit_card_expiration_date()
'09/17'
>>> p.email(gender='male')
'jessie7517@gmail.com'
>>> p.favorite_music_genre()
'Ambient'
>>> p.identifier(mask='13064########')
'1306420450944'
>>> p.sexual_orientation()
'Heterosexual'
>>> p.work_experience()
39
>>> p.occupation()
'Senior System Designer'
>>>
```

Using it in your code works just the same way—create an object, and then call the methods you want to fill in your data.

There are 18 different generator tools built into Elizabeth, and adding a new one is not at all difficult; you just have to define the routines that get the data from a JSON collection of values. Here's some random text string generation, again in the interpreter:

```
>>> from elizabeth import Text
>>> t=Text('en')
>>> t.swear_word()
'Rat-fink'
>>> t.quote()
'Let them eat cake.'
>>> t.words(quantity=20)
['securities', 'keeps', 'accessibility', 'barbara', 'represent', 'hentai', 'flower', 'keys', 'rpm', 'queen', 'kingdom', 'posted', 'wearing', 'attend', 'stack', 'interface', 'quite', 'elementary', 'broadcast', 'holland']
>>> t.sentence()
'She spent her earliest years reading classic literature, and writing poetry.'
```

It's not a difficult exercise to use Elizabeth to populate a [SQLite][6] or other database you might need for development or testing. The introductory documentation gives an example for a medical application using the [Flask][7] lightweight web framework.

I'm very impressed with Elizabeth—it's super-fast, lightweight, easily extensible, and the community, while small, is active and engaged. As of this writing, there have been 25 committers to the project, and issues are being handled swiftly. The [full documentation][8] for Elizabeth is easy to read and follow, and provides an extensive API reference, at least for US English.

I tried tinkering with the links to find if documentation was available in other languages, but I didn't have any success. Because the APIs are different in non-English locales, documenting those variations would be extremely helpful for users. To be fair, it's not terribly hard to read the code and find out what methods are available, even if your Python-fu is not strong. Another glaring lack, for me, was the lack of Arabic or Hebrew locale test data. These are notable right-to-left languages, and for developers who are trying to internationalize their application, proper handling of these languages is a major hurdle. Tools like Elizabeth that can assist with that effort are great to have.

For developers needing sample data for their applications, Elizabeth is a valuable tool, and for those trying to create truly multilingual, localizable applications, it could be a treasure.

--------------------------------------------------------------------------------

作者简介：

D Ruth Bavousett - D Ruth Bavousett has been a system administrator and software developer for a long, long time, getting her professional start on a VAX 11/780, way back when. She spent a lot of her career (so far) serving the technology needs of libraries, and has been a contributor since 2008 to the Koha open source library automation suite.Ruth is currently a Perl Developer at cPanel in Houston, and also serves as chief of staff for two cats.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/2/elizabeth-python-library

作者：[D Ruth Bavousett][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/druthb
[1]:https://opensource.com/article/17/2/elizabeth-python-library?rate=kuXZVuHCdEv_hrxRnK1YQctlsTJeFJLcVx3Nf2VIW38
[2]:https://en.wikipedia.org/wiki/Lorem_ipsum
[3]:https://github.com/lk-geimfari/elizabeth
[4]:https://www.python.org/
[5]:https://www.debian.org/
[6]:https://sqlite.org/
[7]:https://flask.pocoo.org/
[8]:http://elizabeth.readthedocs.io/en/latest/index.html
[9]:https://opensource.com/user/36051/feed
[10]:https://opensource.com/article/17/2/elizabeth-python-library#comments
[11]:https://opensource.com/users/druthb
