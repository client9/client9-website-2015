+++
date = "2016-02-23"
aliases = [ "20160223" ]
title = "Docker and Alpine Linux: What's really going on?"
+++

The [comment](https://news.ycombinator.com/item?id=11000827) by the
CTO of Docker on January 31, 2016 implied that Docker was shifting
the default base images from Ubuntu to Alpine Linux.  What's really
going on?  <!--more-->

## What's Alpine Linux?

Alpine Linux is a small Linux distribution that uses [musl
libc](http://www.musl-libc.org) and [busybox](https://busybox.net) for
all the common Linux command line tools.  These might not be the most
compatibile since they intentionally restrict features, but it also
means it's small, and in general more secure (less surface area, less
cruft from decades of development).  Many users will never know the
difference, especially since it comes with a package manager and all
the greatest hits of OSS are available.

As a Host OS, it uses a hardened [GRSecurity kernel](https://grsecurity.net), and
[OpenRC](https://wiki.gentoo.org/wiki/OpenRC) as a very small `init`
system (that's not SystemD, see below).

And as a Docker base image, it is only 5MB.

## Why is Docker looking at Alpine

Assuming it's true, there are some boring booking keep reasons why this
makes sense and some more interesting long term reasons.

### To Save Resources

Docker is hosting these base images.  Using Alpine over Ubuntu means
40x reduction in resources being used (188MB Ubuntu vs. 5MB Alpine).
That's not just what Docker is hosting and sending over the network,
but also for your target machine as well.

They have no control over what Ubuntu does, and every LTS release
seems to add 100MB to the base EC2 AMI. They could work on "chopping
down" Ubuntu, but that spending resources fixing a resource you don't
control isn't a long term strategy.  (From personal experience, trying
to cut the fat off a full OS produces less-than-great results).

### Best Practice and Owning the Customer

Using a full OS doesn't make much sense in a docker world of "one
process per container".  Just having a full OS invites bad-practice to
creep in.

### Owning the Customer

Does Docker want to be writing how-to guides for Ubutnu?
Probably not.  Do they want to be sending their users off to
`ubuntu.com`?  Probably not.

### Strategic Control

The most important reason to shift to Alpine Linux is that SystemD
ships on Ubuntu 16.  In case you missed the memo, SystemD, for better
or worse, now ships on every major OS.  Ubuntu was on of the hold
outs, but it gave in.  The TLDR on is that the Linux Kernel manages
machine resources (CPU, memory, etc), but SystemD manages the
processes or applications on the machine.  SystemD is sponsored (or
outright controled) by [RedHat](http://redhat.com/).

Since Docker-The-Runtime is a process and running containers are
more-or-less a special case of a process, SystemD thinks the container
runtime should by under their perview.  From a post on the
[CoreOS](https://coreos.com/) blog:

>  ... it's a responsibility for systemd to integrate containers into
> the OS.  [Where systemd and Containers Meet: Q&A with Lennart
> Poettering](https://coreos.com/blog/qa-with-lennart-systemd/)
> Lennart Poettering, September 16, 2015

Given that, and after reading the full article, where does
Docker-The-Runtime fit in?  It doesn't.

Ubuntu 16 is due in April 2016 will run the full systemd stack. If Docker
continued with Ubuntu it would be shipping a technology that has
implicity (?) said that Docker-the-Runtime is obsolete.

## Conclusion

To repeat, the Docker-The-Company has not confirmed anything about
Alpine Linux (and interestly they havent denied it either).  But I
were them, I'd sure be looking into something like Alpine Linux.

Regardless, this competition on "what is an Operating System" is great
for end users.  Innovation in the OS space has been sorely lacking.

Is Docker planning a host OS (running Docker-The-Runtime) ? Or just
using this as a guest OS (inside containers)? Or both?  Stay tuned to
find out!
