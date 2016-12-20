#Supervisor Alfred Integration

alfred can help you manage your supervisor processes

![](http://i.imgur.com/QpJYoQ3.png)


After installing supervisor, create a link to the path - write in terminal:
```
ln -s "/usr/local/bin/supervisorctl" `which supervisorctl`
```

run ` /usr/local/bin/supervisorctl --help` and see if it returnes help message.
if it does, the alfred workflow can run!

[Download](https://github.com/mobilizeio/env/raw/master/Supervisor.alfredworkflow) the workflow and add it to alfred
to configure the workflow, open alfred box and type `confenv`

![](http://i.imgur.com/lefnDQO.png)

setup your REPOSITORY_PATH to the absolute path of your repository

![REPOSITORY_PATH](http://i.imgur.com/4Xai3Zy.png)

###Now we are all set!

##Alfred workflow Usage
type `env` into the alfred box
the first time you will enter this, you will get this results - which means that the superv is not started.

![](http://i.imgur.com/lJxJIQA.png)

you can hit enter to start the supervisord
after the daemon is started, you can see the list of the processes and the statuses of them

![](http://i.imgur.com/QpJYoQ3.png)

###Now everything is really up and running!

