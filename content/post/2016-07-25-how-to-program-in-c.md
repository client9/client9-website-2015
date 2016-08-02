+++
aliases = [ "20160725" ]
date = "2016-07-25"
title = "How to program in C"
+++

If you *must* program in C, here are a few references I've collected from
twitterverse.  It should keep you busy for the next few... years.   And even then
this only covers *the basics*.

<!--more-->

### How to C in 2016#

[How to C in 2016](https://matt.sh/howto-c) by [Matt
Stancliff](https://twitter.com/mattsta) is the article I wish I wrote when I
was in my prime C programming days and wish I had when I was starting out. 

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">How to C in 2016: <a href="https://t.co/zETGzqm4ut">https://t.co/zETGzqm4ut</a></p>&mdash; Matt Stancliff (@mattsta) <a href="https://twitter.com/mattsta/status/685194223612735490">January 7, 2016</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Update:  Matt as also written a guide on `const` rules [So You Think You Can const](https://matt.sh/sytycc) as well.

### A Critique

[A critique of "How to C in 2016" by
Matt](https://github.com/Keith-S-Thompson/how-to-c-response) adds or corrects
a lot of details.  I believe most of which has been integrated in the original
document.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">2/2 A response to &quot;How to C 2016&quot; by Keith Thompson cc <a href="https://twitter.com/mattsta">@mattsta</a> <a href="https://t.co/r0kjgkMcWG">https://t.co/r0kjgkMcWG</a> <a href="https://twitter.com/hashtag/c99?src=hash">#c99</a> <a href="https://twitter.com/hashtag/cpp?src=hash">#cpp</a></p>&mdash; Gaetan Juvin (@gtnjuvin) <a href="https://twitter.com/gtnjuvin/status/688088929917112320">January 15, 2016</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

### And another critique 

[Some notes C in 2016](
http://blog.erratasec.com/2016/01/some-notes-c-in-2016.html) by [Robert Graham
(@ErrataRob)](https://twitter.com/erratarob) and [David
Maynor(@Dave_Maynor)](https://twitter.com/dave_maynor) of [Errata
Security](http://blog.erratasec.com) is more higher level criticism and worth
reading.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Thoughts from <a href="https://twitter.com/ErrataRob">@ErrataRob</a> on How to C in 2016: <a href="https://t.co/V45ugSsyVP">https://t.co/V45ugSsyVP</a></p>&mdash; David Moore (@grajagandev) <a href="https://twitter.com/grajagandev/status/688814259434749952">January 17, 2016</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

###  Modern Memory Safety: C/C++ Vulnerability Discovery, Exploitation, Hardening

From the [README](https://github.com/struct/mms/blob/master/README.md)

  This repo contains the slides for a training course originally developed in
  2012. It has been delivered to many students since its creation. It's sold out
  at the Black Hat USA conference several years in a row. The content has gone
  through many iterations based on feedback from those classes. The original
  training focused mainly on browser vulnerability discovery and exploitation.
  This latest version still focuses on that but also covers more topics such as
  custom memory allocators, hardening concepts, and exploitation at a high
  level.

The full PDF is here:
https://github.com/struct/mms/blob/master/Modern_Memory_Safety_In_C_CPP.pdf

This covers C++ (even more things to remember) as well.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Because a hackers work week always starts late on a Friday night... <a href="https://t.co/PCfh3prRsL">https://t.co/PCfh3prRsL</a></p>&mdash; Chris Rohlf (@chrisrohlf) <a href="https://twitter.com/chrisrohlf/status/756641193958772736">July 23, 2016</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

### Note from Rich Felker

[Rich Felker](https://twitter.com/RichFelker) is the author of an excellent libc implementation [musl](http://www.musl-libc.org).

<blockquote class="twitter-tweet" data-conversation="none" data-lang="en"><p lang="en" dir="ltr">In C, you always have to check return values for functions that can fail. This is not hard. Other langs have other mechanisms eg exceptions.</p>&mdash; Rich Felker (@RichFelker) <a href="https://twitter.com/RichFelker/status/705419853327376385">March 3, 2016</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

### Notes from CopperheadOS

[CopperheadOS](https://copperhead.co/android/) is a "A hardened open-source operating system based on Android".  They also drop
tweets on how-to C.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">For brownie points, use -fsanitize=unsigned-integer-overflow too and mark the rare cases where overflow is intended using no_sanitize.</p>&mdash; CopperheadOS (@CopperheadOS) <a href="https://twitter.com/CopperheadOS/status/710334623465742337">March 17, 2016</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

### Final Thoughts

Wow!  You read all that?  Here's a final thought:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Behold the power of open source in a Speaker Series featuring <a href="https://twitter.com/adrianco">@adrianco</a> of <a href="https://twitter.com/BatteryVentures">@BatteryVentures</a> <a href="https://t.co/tITNtdZghJ">https://t.co/tITNtdZghJ</a> <a href="https://t.co/8IcYEea7Zo">pic.twitter.com/8IcYEea7Zo</a></p>&mdash; Heavybit (@heavybit) <a href="https://twitter.com/heavybit/status/705438362002391040">March 3, 2016</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

