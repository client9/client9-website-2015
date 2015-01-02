+++
date = "2014-12-31T15:10:54+09:00"
aliases = [ "20141231" ]
draft = true
title = "Linux Cloud Distros: Less is More"
+++

A cloud-based server distribution should be lean.  There is no
partially need for hardware drivers as everything is virtualized.  All
user-land packages are easily installed and provisioned by the end
user, so there is no need to be to provide them out of the box.
Really all a distribution needs to do is *boot* (with all that
entails) and *provide a minimal shell*.  Everything else is fluff.
The excess isnt just unnecessary, it also slows down boot times, and
provides a larger attack surface (i.e. more patching).

So how lean are common linux distribution? In Amazon's US-WEST-1
region, I fired up the a number of linux distributions and counted the
number of packages installed.


OS Distribution                 | AMI          | Packages
--------------------------------|--------------|----
SUSE Linux Enterprise Server 12 | ami-b95b4ffc | 724
Ubuntu 14.10 Utopic             | ami-b7515af2 | 461
Ubuntu Server 14.04 LTS         | ami-076e6542 | 450
Ubuntu 12.04 LTS Precise        | ami-b7515af2 | 396
Amazon Linux AMI 2014.09.1      | ami-4b6f650e | 361
Red Hat Enterprise Linux 7.0    | ami-33cdd876 | 347
Debian 8.0 (experimental)       | ami-17899452 | 271
CentOS 7                        | ami-33c1ca76 | 246
Fedora-Cloud-Base-20141203-21   | ami-970310d2 | 226
Debian 7.7                      | ami-b12e39f4 | 194

Notes:

* Ubuntu 12 is filled with stuff that doesnt belong on a (cloud) server: bluetooth drivers, wireless drives, NTFS.
* Ubunut 12 and 14 package up various X libraries, apparently for a graphic boot system.  Again not so useful in a cloud environment.
* Even after removing fluff from Ubuntu, it's still over 150 more packages than its matching Debian counter parts.
* Debian 8 added around 50 packages compared to Debian 7.  It also uses
  the notorious `systemd` but I think the increase in the number of
  packages is due to other structural changes to Debian 8 (see below).
* Debian 8 and Ubuntu 14 are a bit odd.  They provide two pythons and two
  libc versions that are essential for `cloudinit`.
* Febora has a cloud-based version?  Apparently, [I'm not the only one confused by it](http://www.infoworld.com/article/2843687/linux/red-hat-fedora-confuses-linux-users.html)

Obvioulsy there is more to deciding what OS to use than how small the
base install is, but it is a useful reflection of the goals and designs of the distribution.


