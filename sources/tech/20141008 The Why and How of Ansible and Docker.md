The Why and How of Ansible and Docker
================================================================================
There is a lot of interest from the tech community in both [Docker][1] and [Ansible][2], I am hoping that after reading this article you will share our enthusiasm. You will also gain a practical insight into using Ansible and Docker for setting up a complete server environment for a Rails application.

Many reading this might be asking, “Why don’t you just use Heroku?”. First of all, I can run Docker and Ansible on any host, with any provider. Secondly, I prefer flexibility over convenience. I can run anything in this manner, not just web applications. Last but not least, because I am a tinkerer at heart, I get a kick from understanding how all the pieces fit together. The fundamental building block of Heroku is the Linux Container. The same technology lies at the heart of Docker’s versatility. As a matter of fact, one of Docker’s mottoes is: “Containerization is the new virtualization”.

### Why Ansible? ###

After 4 years of heavy Chef usage, the **infrastructure as code** mentality becomes really tedious. I was spending most of my time with the code that was managing my infrastructure, not with the infrastructure itself. Any change, regardless how small, would require a considerable amount of effort for a relatively small gain. With [Ansible][3], there’s data describing infrastructure on one hand, and the constraints of the interactions between various components on the other hand. It’s a much simpler model that enables me to move quicker by letting me focus on what makes my infrastructure personal. Similar to the Unix model, Ansible provides simple modules with a single responsibility that can be combined in endless ways.

Ansible has no dependencies other than Python and SSH. It doesn’t require any agents to be set up on the remote hosts and it doesn’t leave any traces after it runs either. What’s more, it comes with an extensive, built-in library of modules for controlling everything from package managers to cloud providers, to databases and everything else in between.

### Why Docker? ###

[Docker][4] is establishing itself as the most reliable and convenient way of deploying a process on a host. This can be anything from mysqld to ![](Docker container as a VM. The)redis, to a Rails application. Just like git snapshots and distributes code in the most efficient way, Docker does the same with processes. It guarantees that everything required to run that process will be available regardless of the host that it runs on.

A common but understandable mistake is to treat a Docker container as a VM. The [Single Responsibility Principle][5] still applies, running a single process per container will give it a single reason to change, it will make it re-usable and easy to reason about. This model has stood the test of time in the form of the Unix philosophy, it makes for a solid foundation to build on.

### The Setup ###

Without leaving my terminal, I can have Ansible provision a new instance for me with any of the following: Amazon Web Services, Linode, Rackspace or DigitalOcean. To be more specific, I can have Ansible create a new DigitalOcean 2GB droplet in Amsterdam 2 region in precisely 1 minute and 25 seconds. In a further 1 minute and 50 seconds I can have the system setup with Docker and a few other personal preferences. Once I have this base system in place, I can deploy my application. Notice that I didn’t setup any database or programming language. Docker will handle all application dependencies.

Ansible runs all remote commands via SSH. My SSH keys stored in the local ssh-agent will be shared remotely during Ansible’s SSH sessions. When my application code will be cloned or updated on remote hosts, no git credentials will be required, the forwarded ssh-agent will be used to authenticate with the git host.

### Docker and application dependencies ###

I find it amusing that most developers are specific about the version of the programming language which their application needs, the version of the dependencies in the form of Python packages, Ruby gems or node.js modules, but when it comes to something as important as the database or the message queue, they just use whatever is available in the environment that the application runs. I believe this is one of the reasons behind the devops movement, developers taking responsibility for the application’s environment. Docker makes this task easier and more straightforward by adding a layer of pragmatism and confidence to the existing practices.

My application defines dependencies on processes such as MySQL 5.5 and Redis 2.8 by including the following `.docker_container_dependencies` file:

    gerhard/mysql:5.5
    gerhard/redis:2.8

The Ansible playbook will notice this file and will instruct Docker to pull the correct images from the Docker index and start them as containers. It also links these service containers to my application container. If you want to find out how Docker container linking works, refer to the [Docker 0.6.5 announcement][6].

My application also comes with a Dockerfile which is specific about the Ruby Docker image that is required. As this is already built, the steps in my Dockerfile will have the guarantee that the correct Ruby version will be available to them.

    FROM howareyou/ruby:2.0.0-p353
    
    ADD ./ /terrabox
    
    RUN \
      . /.profile ;\
      rm -fr /terrabox/.git ;\
      cd /terrabox ;\
      bundle install --local ;\
      echo '. /.profile && cd /terrabox && RAILS_ENV=test bundle exec rake db:create db:migrate && bundle exec rspec' > /test-terrabox ;\
      echo '. /.profile && cd /terrabox && export RAILS_ENV=production && rake db:create db:migrate && bundle exec unicorn -c config/unicorn.rails.conf.rb' > /run-terrabox ;\
    # END RUN
    
    ENTRYPOINT ["/bin/bash"]
    CMD ["/run-terrabox"]
    
    EXPOSE 3000

The first step is to copy all my application’s code into the Docker image and load the global environment variables added by previous images. The Ruby Docker image for example will append PATH configuration which ensures that the correct Ruby version gets loaded.

Next, I remove the git history as this is not useful in the context of a Docker container. I install all the gems and then create a `/test-terrabox` command which will be run by the test-only container. The purpose of this is to have a “canary” which ensures that the application and all its dependencies are properly resolved, that the Docker containers are linked correctly and all tests pass before the actual application container will be started.

The command that gets run when a new web application container gets started is defined in the CMD step. The `/run-terrabox` command was defined part of the build process, right after the test one.

The last instruction in this application’s Dockerfile maps port 3000 from inside the container to an automatically allocated port on the host that runs Docker. This is the port that the reverse proxy or load balancer will use when proxying public requests to my application running inside the Docker container.

### Running a Rails application inside a Docker container ###

For a medium-sized Rails application, with about 100 gems and just as many integration tests running under Rails, this takes 8 minutes and 16 seconds on a 2GB and 2 core instance, without any local Docker images. If I already had Ruby, MySQL & Redis Docker images on that host, this would take 4 minutes and 45 seconds. Furthermore, if I had a master application image to base a new Docker image build of the same application, this would take a mere 2 minutes and 23 seconds. To put this into perspective, it takes me just over 2 minutes to deploy a new version of my Rails application, including dependent services such as MySQL and Redis.

I would like to point out that my application deploys also run a full test suite which alone takes about a minute end-to-end. Without intending, Docker became a simple Continuous Integration environment that leaves test-only containers behind for inspection when tests fail, or starts a new application container with the latest version of my application when the test suite passes. All of a sudden, I can validate new code with my customers in minutes, with the guarantee that different versions of my application are isolated from one another, all the way to the operating system. Unlike traditional VMs which take minutes to boot, a Docker container will take under a second. Furthermore, once a Docker image is built and tests pass for a specific version of my application, I can have this image pushed into a private Docker registry, waiting to be pulled by other Docker hosts and started as a new Docker container, all within seconds.

### Conclusion ###

Ansible made me re-discover the joy of managing infrastructures. Docker gives me confidence and stability when dealing with the most important step of application development, the delivery phase. In combination, they are unmatched.

To go from no server to a fully deployed Rails application in just under 12 minutes is impressive by any standard. To get a very basic Continuous Integration system for free and be able to preview different versions of an application side-by-side, without affecting the “live” version which runs on the same hosts in any way, is incredibly powerful. This makes me very excited, and having reached the end of the article, I can only hope that you share my excitement.

I gave a talk at the January 2014 London Docker meetup on this subject, [I have shared the slides on Speakerdeck][7].

For more Ansible and Docker content, subscribe to [The Changelog Weekly][8] — it ships every Saturday and regularly includes the week’s best links for both topics.

[Use the Draft repo][9] if you’d like to write a post like this for The Changelog. They’ll work with you through the process too.

Until next time, [Gerhard][a].

--------------------------------------------------------------------------------

via: http://thechangelog.com/ansible-docker/

作者：[Gerhard Lazu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://twitter.com/gerhardlazu
[1]:https://www.docker.io/
[2]:https://github.com/ansible/ansible
[3]:http://ansible.com/
[4]:http://docker.io/
[5]:http://en.wikipedia.org/wiki/Single_responsibility_principle
[6]:http://blog.docker.io/2013/10/docker-0-6-5-links-container-naming-advanced-port-redirects-host-integration/
[7]:https://speakerdeck.com/gerhardlazu/ansible-and-docker-the-path-to-continuous-delivery-part-1
[8]:http://thechangelog.com/weekly/
[9]:https://github.com/thechangelog/draft