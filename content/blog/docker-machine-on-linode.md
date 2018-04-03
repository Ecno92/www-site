Title: Docker-machine on Linode: The hard way
Date: 2017-04-17 13:00
Modified: 2017-04-17 13:00
Tags: docker, docker-machine, linode, devops
category: tech
slug: docker-machine-linode-the-hard-way
authors: Therry van Neerven
description:   Setting up docker-machine on linode: The hard way.

A while ago I started to experiment with docker-machine: A tool that
allows you to create and manage a (virtual) machine running
docker-engine. Once you are connected to a docker-machine instance you
can easily manage containers in a very similar way as you use containers
locally.

I have quite good experiences with [Linode](https://www.linode.com/).
Their pricing is also quite attractive. For that reason I decided to set
up a docker-machine using Linode. For this I've used the "third party"
[docker-machine-linode
driver](https://github.com/taoh/docker-machine-linode) to setup the
machine. Aside from the fact that I had to compile the driver manually
it took care of everything.

While setting up the machine I discovered the [docker-machine generic
driver](https://docs.docker.com/machine/drivers/generic/). This driver
allows you to setup docker-machine on any (virtual) machine. Also on
Linode or any other (unsupported) cloud provider. This would avoid the
requirement to compile the docker-machine driver and it would introduce
the ability to pick a unsupported machine provider.

## Setting up a docker-machine: The hard way

**WARNING:**

This article gives some insights in how to setup a generic
docker-machine on Linode. It is not advised to set up a docker-machine
in this way. Use a docker-machine driver instead if available.

### Requirements

Before you start make sure you have installed the following:

-   [docker-machine](https://docs.docker.com/machine/install-machine/)
-   [Linode CLI](https://www.linode.com/docs/platform/linode-cli)

### Setup the stackscript

Linode comes by default with password authentication. This is a bad
default. Also I found out that Linode may have some issues with updating
Ubuntu. We will patch this with a stackscript. This script will be
executed on the first boot of the machine.

```bash
#! /bin/bash

# Disable password authentication
grep -q "ChallengeResponseAuthentication" /etc/ssh/sshd_config && sed -i "/^[^#]*ChallengeResponseAuthentication[[:space:]]yes.*/c\ChallengeResponseAuthentication no" /etc/ssh/sshd_config || echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config
grep -q "^[^#]*PasswordAuthentication" /etc/ssh/sshd_config && sed -i "/^[^#]*PasswordAuthentication[[:space:]]yes/c\PasswordAuthentication no" /etc/ssh/sshd_config || echo "PasswordAuthentication no" >> /etc/ssh/sshd_config

# Update the system can always update
printf "# Ensure that apt update works\nprecedence ::ffff:0:0/96  100\n" >> /etc/gai.conf
apt update && DEBIAN_FRONTEND=noninteractive apt -y upgrade

service ssh restart
```

Go to the new stackscript form:

    Linodes >> Manage StackScripts >> Add a new StackScript

Fill in all the fields and use the snippet from above to fill in the
*Script* field. Save the form and click on the edit button and check the
URL. The ID of the stackscript should be at the end of the URL.

### Create the linode machine

Setup virtual machine by executing the following commands. Be sure to
replace variables *({{VARIABLE}})* before executing the snippet in your
terminal.

`linode create {{MACHINE_NAME}} --location london --plan linode1024 --distribution 146 --stackscript {{STACKSCRIPT_ID}} --stackscriptjson '{"x":"x"}' --pubkey-file {{ABSOLUTE_PATH_OF_YOUR_PUBLIC_KEY}}`

There are two interesting arguments in this command:

-   **distribution**: 146, this is Ubuntu 16.04
-   **stackscriptjson**: Without dummy arguments the stackscript did not
    execute properly.
-   **pubkey-file**: docker-machine requires
    passwordless authentication.

Execute the command and in a few minutes your machine should be ready.

Use the following command to find the IP of the machine:

    linode show {{MACHINE_NAME}}

### Intermezzo: tweak the linode machine

Before we proceed we need to change the kernel on the machine. For some
reason the default Linode kernel does not work well with docker. We will
swap the Linode kernel for the Grub2 kernel through the Linode web
interface.

Go to the configuration edit form:

    Linodes >> {{MACHINE_NAME}} >> Edit (configuration profiles)

Change *Kernel (Boot settings)* to *Grub2*.

Restart the machine to apply the different kernel:

    linode restart {{MACHINE_NAME}}

### Transform the linode machine into a docker-machine

Creating a docker-machine on a machine without password authentication
is fairly easy.

```bash
docker-machine create \
         --driver generic \
         --generic-engine-port=2376 \
         --generic-ip-address={{MACHINE_IP}} \
         --generic-ssh-user=root \
         --generic-ssh-port=22 \
         {{MACHINE_NAME}}
```

Once the command finishes you should have a docker-machine running on
Linode. You should be able to find the machine using:

    docker-machine ls

### Test the new machine

Now you can start talking to the machine:

    eval $(docker-machine env {{MACHINE_NAME}})

Check what is running:

    docker ps

Say hello:

    docker run hello-world

And check the containers on the machine:

    docker ps -a

Use a different terminal. Executing the ps commands should give
different results in that terminal.
