Automated Docker-based Rails deployments
================================================================================
![](http://cocoahunter.com/content/images/2015/01/docker3.jpeg)

[TL;DR] This is the third post in a series of 3 on how my company moved its infrastructure from PaaS to Docker based deployment.

- [First part][1]: where I talk about the process we went thru before approaching Docker;
- [Second part][2]: where I explain how setting up a private registry for in house secure deployments.

----------

In this final part we will see how to automate the whole deployment process with a real world (though very basic) example.

### Basic Rails app ###

Let's dive into the topic right away and bootstrap a basic Rails app. For the purpose of this demonstration I'm going to use Ruby 2.2.0 and Rails 4.1.1

From the terminal run:

    $ rvm use 2.2.0
    $ rails new  && cd docker-test

Let's create a basic controller:

    $ rails g controller welcome index

...and edit `routes.rb` so that the root of the project will point to our newly created welcome#index method:

    root 'welcome#index'  

Running `rails s` from the terminal and browsing to [http://localhost:3000][3] should bring you to the index page. We're not going to make anything fancier to the app, it's just a basic example to prove that when we'll build and deploy the container everything is working.

### Setup the webserver ###

We are going to use Unicorn as our webserver. Add `gem 'unicorn'` and `gem 'foreman'` to the Gemfile and bundle it up (run `bundle install` from the command line).

Unicorn needs to be configured when the Rails app launches, so let's put a **unicorn.rb** file inside the **config** directory. [Here is an example][4] of a Unicorn configuration file. You can just copy & paste the content of the Gist.

Let's also add a Procfile with the following content inside the root of the project so that we will be able to start the app with foreman:

    web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb  

If you now try to run the app with **foreman start** everything should work as expected and you should have a running app on [http://localhost:5000][5]

### Building a Docker image ###

Now let's build the image inside which our app is going to live. In the root of our Rails project, create a file named **Dockerfile** and paste in it the following:

    # Base image with ruby 2.2.0
    FROM ruby:2.2.0
    
    # Install required libraries and dependencies
    RUN apt-get update && apt-get install -qy nodejs postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*
    
    # Set Rails version
    ENV RAILS_VERSION 4.1.1
    
    # Install Rails
    RUN gem install rails --version "$RAILS_VERSION"
    
    # Create directory from where the code will run 
    RUN mkdir -p /usr/src/app  
    WORKDIR /usr/src/app
    
    # Make webserver reachable to the outside world
    EXPOSE 3000
    
    # Set ENV variables
    ENV PORT=3000
    
    # Start the web app
    CMD ["foreman","start"]
    
    # Install the necessary gems 
    ADD Gemfile /usr/src/app/Gemfile  
    ADD Gemfile.lock /usr/src/app/Gemfile.lock  
    RUN bundle install --without development test
    
    # Add rails project (from same dir as Dockerfile) to project directory
    ADD ./ /usr/src/app
    
    # Run rake tasks
    RUN RAILS_ENV=production rake db:create db:migrate  

Using the provided Dockerfile, let's try and build an image with the following command[1][7]:

    $ docker build -t localhost:5000/your_username/docker-test .

And again, if everything worked out correctly, the last line of the long log output should read something like:

    Successfully built 82e48769506c  
    $ docker images
    REPOSITORY                                       TAG                 IMAGE ID            CREATED              VIRTUAL SIZE  
    localhost:5000/your_username/docker-test         latest              82e48769506c        About a minute ago   884.2 MB  

Let's try and run the container!

    $ docker run -d -p 3000:3000 --name docker-test localhost:5000/your_username/docker-test

You should be able to reach your Rails app running inside the Docker container at port 3000 of your boot2docker VM[2][8] (in my case [http://192.168.59.103:3000][6]).

### Automating with shell scripts ###

Since you should already know from the previous post3 how to push your newly created image to a private regisitry and deploy it on a server, let's skip this part and go straight to automating the process.

We are going to define 3 shell scripts and finally tie it all together with rake.

### Clean ###

Every time we build our image and deploy we are better off always clean everything. That means the following:

- stop (if running) and restart boot2docker;
- remove orphaned Docker images (images that are without tags and that are no longer used by your containers).

Put the following into a **clean.sh** file in the root of your project.

    echo Restarting boot2docker...  
    boot2docker down  
    boot2docker up
    
    echo Exporting Docker variables...  
    sleep 1  
    export DOCKER_HOST=tcp://192.168.59.103:2376  
    export DOCKER_CERT_PATH=/Users/user/.boot2docker/certs/boot2docker-vm  
    export DOCKER_TLS_VERIFY=1
    
    sleep 1  
    echo Removing orphaned images without tags...  
    docker images | grep "<none>" | awk '{print $3}' | xargs docker rmi  

Also make sure to make the script executable:

    $ chmod +x clean.sh

### Build ###

The build process basically consists in reproducing what we just did before (docker build). Create a **build.sh** script at the root of your project with the following content:

    docker build -t localhost:5000/your_username/docker-test .  

Make the script executable.

### Deploy ###

Finally, create a **deploy.sh** script with this content:

    # Open SSH connection from boot2docker to private registry
    boot2docker ssh "ssh -o 'StrictHostKeyChecking no' -i /Users/username/.ssh/id_boot2docker -N -L 5000:localhost:5000 root@your-registry.com &" &
    
    # Wait to make sure the SSH tunnel is open before pushing...
    echo Waiting 5 seconds before pushing image.
    
    echo 5...  
    sleep 1  
    echo 4...  
    sleep 1  
    echo 3...  
    sleep 1  
    echo 2...  
    sleep 1  
    echo 1...  
    sleep 1
    
    # Push image onto remote registry / repo
    echo Starting push!  
    docker push localhost:5000/username/docker-test  

If you don't understand what's going on here, please make sure you've read thoroughfully [part 2][9] of this series of posts.

Make the script executable.

### Tying it all together with rake ###

Having 3 scripts would now require you to run them individually each time you decide to deploy your app:

1. clean
1. build
1. deploy / push

That wouldn't be much of an effort, if it weren't for the fact that developers are lazy! And lazy be it, then!

The final step to wrap things up, is tying the 3 parts together with rake. 

To make things even simpler you can just append a bunch of lines of code to the end of the already present Rakefile in the root of your project. Open the Rakefile file - pun intended :) - and paste the following:

    namespace :docker do  
      desc "Remove docker container"
      task :clean do
        sh './clean.sh'
      end
    
      desc "Build Docker image"
      task :build => [:clean] do
        sh './build.sh'
      end
    
      desc "Deploy Docker image"
      task :deploy => [:build] do
        sh './deploy.sh'
      end
    end  

Even if you don't know rake syntax (which you should, because it's pretty awesome!), it's pretty obvious what we are doing. We have declared 3 tasks inside a namespace (docker).

This will create the following 3 tasks:

- rake docker:clean
- rake docker:build
- rake docker:deploy

Deploy is dependent on build, build is dependent on clean. So every time we run from the command line

    $ rake docker:deploy

All the script will be executed in the required order. 

### Test it ###

To see if everything is working, you just need to make a small change in the code of your app and run

    $ rake docker:deploy

and see the magic happening. Once the image has been uploaded (and the first time it could take quite a while), you can ssh into your production server and pull (thru an SSH tunnel) the docker image onto the server and run. It's that easy!

Well, maybe it takes a while to get accustomed to how everything works, but once it does, it's almost (almost) as easy as deploying with Heroku.

P.S. As always, please let me have your ideas. I'm not sure this is the best, or the fastest, or the safest way of doing devops with Docker, but it certainly worked out for us.

- make sure to have **boot2docker** up and running.
- If you don't know your boot2docker VM address, just run `$ boot2docker ip`
- if you don't, you can read it [here][10]

--------------------------------------------------------------------------------

via: http://cocoahunter.com/2015/01/23/docker-3/

作者：[Michelangelo Chasseur][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://cocoahunter.com/author/michelangelo/
[1]:http://cocoahunter.com/docker-1
[2]:http://cocoahunter.com/2015/01/23/docker-2/
[3]:http://localhost:3000/
[4]:https://gist.github.com/chasseurmic/0dad4d692ff499761b20
[5]:http://localhost:5000/
[6]:http://192.168.59.103:3000/
[7]:http://cocoahunter.com/2015/01/23/docker-3/#fn:1
[8]:http://cocoahunter.com/2015/01/23/docker-3/#fn:2
[9]:http://cocoahunter.com/2015/01/23/docker-2/
[10]:http://cocoahunter.com/2015/01/23/docker-2/