+++
date = "2014-01-17"
aliases = [ "20140117" ]
title = "Comparison of Linux Distributions on AWS EC2"
+++

How do various Linux distributions implement a operating system for
use in virtualized or cloud environments?  One (imperfect) proxy for size and
complexity is number of packages installed.  In Amazon's US-WEST-1
region, I fired up the a number of Linux distributions and counted the
number of packages installed.

OS Distribution                 | AMI          | Packages
--------------------------------|--------------|----
SUSE Linux Enterprise Server 12 | ami-b95b4ffc | 724
Ubuntu 14.10 Utopic             | ami-b7515af2 | 461
Ubuntu 14.04 LTS Precise        | ami-076e6542 | 450
Ubuntu 12.04 LTS Trusty         | ami-b7515af2 | 396
Amazon Linux AMI 2014.09.1      | ami-4b6f650e | 361
Red Hat Enterprise Linux 7.0    | ami-33cdd876 | 347
Debian 8.0 (experimental)       | ami-17899452 | 271
CentOS 7                        | ami-33c1ca76 | 246
Fedora-Cloud-Base-20141203-21   | ami-970310d2 | 226
Debian 7.7                      | ami-b12e39f4 | 194

Notes:

* Unsurprisingly, commerical-based distributions had more packages
  installed than more-community driven ones.  I'll let you decide if
  they add value or not.
* To be fair to SUSE, it specifically said it came with everything.
  With 724 packages installed by default, it better.
* Ubuntu 12 is filled with stuff that doesnt belong on a (cloud)
  server: bluetooth drivers, wireless drivers, NFS, etc.
* Ubunut 12 and 14 package up various X (the windows system) libraries, apparently for a
  graphic boot system.  Probably not so useful in a cloud environment.
* Even after removing fluff from Ubuntu 12 and 14, it's still over 150 more
  packages than its matching Debian counterparts.
* Debian 8 added around 50 packages compared to Debian 7.  It also uses
  the notorious `systemd` but I think the increase in the number of
  packages is due to other structural changes to Debian 8 (see below).
* Debian 8 and Ubuntu 14 are a bit odd.  They provide two pythons and
  two libc versions that are essential for `cloudinit`, but not sure
  why it is so complicated.
* Febora has a cloud-based version?  Apparently, [I'm not the only one confused by it](http://www.infoworld.com/article/2843687/Linux/red-hat-fedora-confuses-Linux-users.html)

## Not-Linux and Not-Quite Linux

* Of course, one doesn't have to run Linux either.  I launched a
  [FreeBSD ami](http://www.daemonology.net/freebsd-on-ec2/), and
  according to `pkg version` only 22 packages were added to the base
  install to make it run on Amazon's services (mostly around python
  and cloudinit which are optional).  I'm not an expert in FreeBSD but
  I certainly like the wholistic approach they use.
* Docker. Sure, but Docker still needs a host system, and a guest OS
  (or some type).  CoreOS is likely the first of many minimal OSs
  coming out in 2015.  One could argue that
  [CoreOS](https://coreos.com/) plus a single docker container such
  [phusion/baseimage-docker](https://github.com/phusion/baseimage-docker)
  is "better" than regular Ubuntu.

Obvioulsy there is more to deciding what OS to use than how small the
base install is, but it is a useful reflection of the goals and
designs of the distribution.
