Louis-Philippe Véronneau -
======
I've been watching [Critical Role][1]1 for a while now and since I've started my master's degree I haven't had much time to sit down and watch the show on YouTube as I used to do.

I thus started listening to the podcasts instead; that way, I can listen to the show while I'm doing other productive tasks. Pretty quickly, I grew tired of manually downloading every episode each time I finished the last one. To make things worst, the podcast is hosted on PodBean and they won't let you download episodes on a mobile device without their app. Grrr.

After the 10th time opening the terminal on my phone to download the podcast using some `wget` magic I decided enough was enough: I was going to write a dumb script to download them all in one batch.

I'm a little ashamed to say it took me more time than I had intended... The PodBean website uses semi-randomized URLs, so I could not figure out a way to guess the paths to the hosted audio files. I considered using `youtube-dl` to get the DASH version of the show on YouTube, but Google has been heavily throttling DASH streams recently. Not cool Google.

I then had the idea to use iTune's RSS feed to get the audio files. Surely they would somehow be included there? Of course Apple doesn't give you a simple RSS feed link on the iTunes podcast page, so I had to rummage around and eventually found out this is the link you have to use:
```
https://itunes.apple.com/lookup?id=1243705452&entity=podcast

```

Surprise surprise, from the json file this links points to, I found out the main Critical Role podcast page [has a proper RSS feed][2]. To my defense, the RSS button on the main podcast page brings you to some PodBean crap page.

Anyway, once you have the RSS feed, it's only a matter of using `grep` and `sed` until you get what you want.

Around 20 minutes later, I had downloaded all the episodes, for a total of 22Gb! Victory dance!

Video clip loop of the Critical Role doing a victory dance.

### Script

Here's the bash script I wrote. You will need `recode` to run it, as the RSS feed includes some HTML entities.
```
# Get the whole RSS feed
wget -qO /tmp/criticalrole.rss http://criticalrolepodcast.geekandsundry.com/feed/

# Extract the URLS and the episode titles
mp3s=( $(grep -o "http.\+mp3" /tmp/criticalrole.rss) )
titles=( $(tail -n +45 /tmp/criticalrole.rss | grep -o "<title>.\+</title>" \
 | sed -r 's@</?title>@@g; s@ @\\@g' | recode html..utf8) )

# Download all the episodes under their titles
for i in ${!titles[*]}
do
 wget -qO "$(sed -e "s@\\\@\\ @g" <<< "${titles[$i]}").mp3" ${mp3s[$i]}
done

```

1 - For those of you not familiar with Critical Role, it's web series where a group of voice actresses and actors from LA play Dungeons & Dragons. It's so good even people like me who never played D&D can enjoy it..

--------------------------------------------------------------------------------

via: https://veronneau.org/downloading-all-the-critical-role-podcasts-in-one-batch.html

作者：[Louis-Philippe Véronneau][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://veronneau.org/
[1]:https://en.wikipedia.org/wiki/Critical_Role
[2]:http://criticalrolepodcast.geekandsundry.com/feed/
