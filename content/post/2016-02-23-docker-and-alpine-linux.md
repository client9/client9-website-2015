+++
date = "2016-02-23"
aliases = [ "20160223" ]
title = "Docker and Alpine Linux (and systemd)"
+++

This [comment](https://news.ycombinator.com/item?id=11000827) by the
[CTO of Docker](https://www.docker.com/company/management) on January
31, 2016 implied that [Docker](https://www.docker.com) was shifting
the default base images from [Ubuntu](http://www.ubuntu.com) to
[Alpine Linux](http://alpinelinux.org).  What's really going
on?<!--more-->

First note that this hasn't been confirmed (or denied) by
Docker-The-Company, so this is all speculation on my part.

## What's Alpine Linux?

Alpine Linux is a small Linux distribution that uses [musl
libc](http://www.musl-libc.org) and [busybox](https://busybox.net) for
all the common Linux command line tools.  These might not be the most
compatible since they intentionally restrict features, but it also
means it's small, and in general more secure (less surface area, less
cruft from decades of development).  Many users will never know the
difference, especially since Alpine comes with a package manager and all
the greatest hits of OSS are available.

As a Host OS, it uses a hardened [GRSecurity kernel](https://grsecurity.net), and
[OpenRC](https://wiki.gentoo.org/wiki/OpenRC) as a very small `init`
system (that's not SystemD, see below).

And as a Docker base image, it is only 5MB.

## Why is Docker looking at Alpine

Assuming it's true, there are some boring book-keeping reasons why
this makes sense and some more interesting long term reasons.

### To Save Resources

Docker is hosting these base images.  Using Alpine over Ubuntu means
40x reduction in resources being used (188MB Ubuntu vs. 5MB Alpine).
That's not just what Docker is hosting and sending over the network,
but also for your target machine as well.

They have no control over what Ubuntu does, and every LTS release
seems to add 100MB to the base EC2 AMI. They could work on "chopping
down" Ubuntu, but spending resources to fix a resource you don't
control isn't a long term strategy.  (Also, from personal experience,
trying to cut the fat off a full OS produces less-than-great results).

### Docker Best Practice

Using a full OS doesn't make much sense in a Docker world of "one
process per container".  Just having a full OS invites bad-practice to
creep in.

### Owning the Customer

Does Docker want to be writing how-to guides for Ubuntu?
Probably not.  Do they want to be sending their users off to
`ubuntu.com`?  Probably not.

### Strategic Control

The most important reason to shift to Alpine Linux is that Ubuntu
16.04 is the first [Ubuntu](http://www.canonical.com) "LTS" version
that uses the full stack of
[systemd](https://en.wikipedia.org/wiki/Systemd).  In case you missed
the memo, `systemd`, for better or worse, now ships on every major OS.
Ubuntu was on of the hold outs, but it [finally gave
in](http://www.markshuttleworth.com/archives/1316).  While the Linux
kernel manages machine resources (CPU, memory, etc), `systemd` manages
the processes or applications on the machine (TLDR). This makes it a very
critical part of the whole operating system. `systemd` is sponsored
(or outright controlled) by [RedHat](http://redhat.com/).

Since Docker-The-Runtime is a process and running containers are
more-or-less a special case of a process, `systemd` thinks the container
runtime should by under their purview.  From a post on the
[CoreOS](https://coreos.com/) blog:

>  ... it's a responsibility for systemd to integrate containers into
> the OS.  [Where systemd and Containers Meet: Q&A with Lennart
> Poettering](https://coreos.com/blog/qa-with-lennart-systemd/)
> Lennart Poettering, September 16, 2015

Given that, and after reading the full article, where does
Docker-The-Runtime fit in?  It doesn't.

Ubuntu 16 is due in April 2016 will run the full systemd stack. If
Docker continued with Ubuntu it would be shipping a technology that
has implicitly (?) said that Docker-the-Runtime is obsolete.  And every
other OS is shipping systemd as well. This is not a great position to
be in.

## Conclusion

To repeat, the Docker-The-Company has not confirmed anything about
Alpine Linux (and interestingly they haven't denied it either).  But I
were them, I'd sure be looking into something like Alpine Linux.  And
notice how Alpine Linux *does not* use systemd.

Regardless, this competition on "what is an Operating System" is great
for end users.  Innovation in the OS space has been sorely lacking.

Is Docker planning a host OS (running Docker-The-Runtime) ? Or just
using this as a guest OS (inside containers)? Or both?  Stay tuned to
find out!

Update: A colleague wrote in and said "Is Docker planning a host OS?"
Almost certainly :)"