Translating by gaoliu ...

20 Awesome Docker Containers for a Desktop User
================================================================================
Greetings to everyone, today we'll list out some awesome Desktop Apps that we can run using Docker Containers in our very own Desktop running Docker. Docker is an Open Source project that provides an open platform to pack, ship and run any application as a lightweight container. It has no boundaries of Language support, Frameworks or packaging system and can be run anywhere, anytime from a small home computers to high-end servers. It makes them great building blocks for deploying and scaling web apps, databases, and back-end services without depending on a particular stack or provider. It is basically used by the developers, Ops and Engineers as it is easy, fast and handy tool for testing or deploying their products but we can also use Docker for our Desktop usage to run a desktop apps out of the box.

So here are some awesome 10 Desktop Application Docker images that we can run with Docker.

### 1. Lynx ###

Lynx is a all time favorite text-based web browser which is a lot familiar to most of the people running Linux. It is the oldest web browser currently in general use and development. To run Lynx, run the following command.

    $ docker run -it \
    --name lynx \
    jess/lynx

### 2. Irssi ###

Irssi is an awesome IRC Client which is based on Text Interface. To run Irssi using docker, we'll need to run the following commands in a docker installed desktop computer.

    docker run -it --name my-irssi -e TERM -u $(id -u):$(id -g) \
    -v $HOME/.irssi:/home/user/.irssi:ro \
    -v /etc/localtime:/etc/localtime:ro \
    irssi

### 3. Chrome ###

Chrome is an awesome GUI-based web browser developed by Google and is based on Open Source Project Chromium. Google Chrome is widely used, fast and secure web browser that are very much familiar to most of the people who surf internet. We can run Chrome using docker by running the following command.

    $ docker run -it \
    --net host \
    --cpuset 0 \
    --memory 512mb \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $HOME/Downloads:/root/Downloads \
    -v $HOME/.config/google-chrome/:/data \
    -v /dev/snd:/dev/snd --privileged \
    --name chrome \
    jess/chrome

### 4. Tor Browser ###

Tor Browser is a web browser which support anonymous features. It enables us freedom to surf website or services blocked by a particular organization or ISPs. It prevents somebody watching our Internet connection from learning what we do on internet and our exact location. To run Tor Browser, run the following command.

    $ docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v /dev/snd:/dev/snd --privileged \
    --name tor-browser \
    jess/tor-browser

### 5. Firefox Browser ###

Firefox Browser is a free and open source web browser which is developed by Mozilla Foundation. It is run by Gecko and SpiderMonkey engines. Firefox Browser has a lot of new features and is specially known for its performance and security.

    $ docker run -d \
    --name firefox \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    kennethkl/firefox

### 6. Rainbow Stream ###

Rainbow Stream is a terminal based Twitter Client featuring real time tweetstream, compose, search , favorite and much more fun directly from terminal. To run Rainbow Stream, run the following command.

    $ docker run -it \
    -v /etc/localtime:/etc/localtime \
    -v $HOME/.rainbow_oauth:/root/.rainbow_oauth \
    -v $HOME/.rainbow_config.json:/root/.rainbow_config.json \
    --name rainbowstream \
    jess/rainbowstream

### 7. Gparted ###

Gparted is an open source software which allows us to partition disks. Now enjoy partitioning from a docker container. To run gparted, we'll need to run the following command.

    $ docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    --device /dev/sda:/dev/sda \ # mount the device to partition
    --name gparted \
    jess/gparted

### 8. GIMP Editor ###

GIMP stands for Gnu Image Manipulation Program which is an awesome tool on Linux for graphics, image editing platform. It is a freely distributed piece of software for such tasks as photo retouching, image composition and image authoring.

    $ docker run -it \
    --rm -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    jarfil/gimp-git

### 9. Thunderbird ###

Thunderbird is also a free and open source email application which is developed and maintained by Mozilla Foundation. It has tons of features that an email application software should have. Thunderbird is really easy to setup and customize. To run Thunderbird in a Docker environment, run the following command.

    $ docker run -d \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -u docker \
    -v $HOME/docker-data/thunderbird:/home/docker/.thunderbird/ \
    yantis/thunderbird thunderbird

### 10. Mutt ###

Mutt is a text based email client which has bunches of cool features including color support, IMAP, POP3, SMTP support, mail storing support and much more. To run Mutt out of the box using docker, we'll need to run the following command.

    $ docker run -it \
    -v /etc/localtime:/etc/localtime \
    -e GMAIL -e GMAIL_NAME \
    -e GMAIL_PASS -e GMAIL_FROM \
    -v $HOME/.gnupg:/home/user/.gnupg \
    --name mutt \
    jess/mutt

### 11. Skype ###

Skype is an instant messaging, video calling software which is not open source but can be run awesome in linux. We can run Skype using Docker Containers too. To run Skype using a docker, run the following command.

    $ docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v /dev/snd:/dev/snd --privileged \
    -e DISPLAY="unix$DISPLAY" \
    tianon/skype

### 12. Cathode ###

Cathode is a beautiful fully customizable terminal app with a look inspired by classic computers. We can run Cathode by running the below command.

    $ docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    --name cathode \
    jess/1995

### 13. LibreOffice ###

LibreOffice is a powerful office suite which is free and open source and is maintained by The Document Foundation. It has clean interface and is a powerful tools that lets us unleash our creativity and grow our productivity. LibreOffice embeds several applications that make it the most powerful Free & Open Source Office suite on the market.

    $docker run \
    -v $HOME/Documents:/home/libreoffice/Documents:rw \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e uid=$(id -u) -e gid=$(id -g) \
    -e DISPLAY=unix$DISPLAY --name libreoffice \
    chrisdaish/libreoffice

### 14. Spotify ###

Spotify gives us instant access to millions of songs from old favorites to the latest hits. To listen our favorite songs using docker, run the following command.

    $ docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v /dev/snd:/dev/snd --privileged \
    --name spotify \
    jess/spotify

### 15. Audacity ###

Audacity is free and open source cross-platform software for recording and editing sounds. Audacity can be used for post-processing of all types of audio, including podcasts by adding effects such as normalization, trimming, and fading in and out. To run Audacity, we'll need to run the following command in a terminal or shell.

    $ docker run --rm \
    -u $(id -u):$(id -g) \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v /dev/snd:/dev/snd \
    -v "$HOME:$HOME" \
    -w "$HOME" \
    -e DISPLAY="unix$DISPLAY" \
    -e HOME \
    $(find /dev/snd/ -type c | sed 's/^/--device /') \
    knickers/audacity

### 16. Eclipse ###

Eclipse is an integrated development environment (IDE). It contains a base workspace and an extensible plug-in system for customizing the environment. It is mostly used to develop Java Based Applications.

    $ docker run -v ~/workspace/:/home/eclipse/workspace/ \
    -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -d leesah/eclipse

### 17. VLC Media Player ###

VLC is a free and open source cross-platform multimedia player and framework that plays most multimedia files as well as DVDs, Audio CDs, VCDs, and various streaming protocols. VLC Media Player is developed and maintained by VideoLAN Organization. To run VLC in docker environment, run the following command.

    $ docker run -v\
    $HOME/Documents:/home/vlc/Documents:rw \
    -v /dev/snd:/dev/snd --privileged \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e uid=$(id -u) -e gid=$(id -g) \
    -e DISPLAY=unix$DISPLAY --name vlc \
    chrisdaish/vlc

### 18. Vim Editor ###

Vim is a highly configurable text-based text editor built to enable efficient text editing. It is an improved version of the vi editor distributed with most UNIX systems.

    $ docker run -i -t --name my-vim -v ~/:/home/dev/src haron/vim

### 19. Inkscape ###

Inkscape is a free and open-source vector graphics editor. It can create, edit vector graphics such as illustrations, diagrams, line arts, charts, logos and even complex paintings. Inkscape's primary vector graphics format is Scalable Vector Graphics (SVG) version 1.1. It can import from or export to several other formats as well but all editing workflow must inevitably occur within the constraints of SVG format.

    $docker build -t rasch/inkscape --rm .
    $ docker run --rm -e DISPLAY \
    -u inkscaper
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.Xauthority:/home/inkscaper/.Xauthority \
    --net=host rasch/inkscape

### 20. Filezilla ###

Filezilla is a free FTP solution application software. It supports FTP, SFTP, FTPS protocols. It is a powerful file management tool for client side. It is an awesome open source FTP project which is highly reliable and easy to use.

    $ xhost +si:localuser:$(whoami)
    $ docker run \
    -d \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -u docker \
    -v /:/host \
    -v $HOME/docker-data/filezilla:/home/docker/.config/filezilla/ \
    yantis/filezilla filezilla

### Conclusion ###

Running desktop application software using Docker is really an awesome experience. Docker is really an awesome platform for fast and easy development, shipping and deployment of software and packages in any place from home to office to production areas. Running desktop apps with docker is a cool way to try out the apps without really installing it into the host filesystem. So, if you have any questions, comments, feedback please do write on the comment box below and let us know what stuffs needs to be added or improved. Thank You! Enjoy with Docker :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/20-docker-containers-desktop-user/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/