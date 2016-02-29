+++
date = "2016-02-21"
aliases = [ "20160221" ]
title = "XML, JSON, YAML, TOML for Configuration"
+++

In an ideal world, your application wouldn't need a configuration
file.  Perhaps everything can be passed in using flags or environment
variables.  Perhaps it can pull down configuration over the network.
But assuming you *do* need a configuration file, that can be read and
written by humans, what format should it be in?

TLDR: Use [TOML](https://github.com/toml-lang/toml), and still looking
for an even simpler format.
<!--more-->

### XML

No.  Certainly not if humans are suppose either read or write it.

More seriously, unless you are already reading and writing XML for
another purpose, I wouldn't link in an XML parser just for the sake of
configuration or even object state. XML is quiet complicated, and even
in mature libraries such as libxml2, serious security bugs are still
being found.  In 2015, [11 CVE vulnerabilities were found in
libxml2](https://www.cvedetails.com/vulnerability-list/vendor_id-1962/product_id-3311/Xmlsoft-Libxml2.html)
That's a lot for a *configuration file format*.  Avoid it if you can.

### JSON

[JSON](http://json.org/) needs no introduction.

Pros:

* Everyone knows it
* Typically [built-in](https://golang.org/pkg/encoding/json/)
* Well-known
* Editor support and reformatters commonly available.

Cons:

* While a lot better than XML it is still a bit difficult to write.
* Keys need to be quoted.
* Values need to be quoted
* No hanging commas, `diff` unfriendly
* Comments are not supported.

You can solve the last two by stripping comments and dangling commas
before sending to the JSON parser.  However to do it right is tricky
and the end result is non-standard.

Conclusion: JSON is not recommended for configuration although certainly fine
as a hack. JSON is best for object serialization.

### YAML

According to [yaml.org](https://yaml.org): "YAML is a human friendly data serialization
standard for all programming languages".  Already we have the first
warning that YAML is not a good fit: the requirements for "data
serialization" are not the same as those for "configuration".

Pros:
* For simple cases it *looks* great and is easy to read and write
* It's a super-set of JSON (yes, YAML parsers will also parse a pure JSON file as well)
* Don't need to quote keys or values
* Comments are supported
* Good language and editor support

Cons:
* The [specification](http://www.yaml.org/spec/1.2/spec.html) is 97-pages long.
* The "cheat sheet" will cause most readers an aneurysm.
* Anything more complicated that simple key/value pairs is very hard to write and debug.
* It's a superset of JSON - this means there are two ways of specifying the same configuration.
* Due to white space rules, it may or may not be easy to cut-n-paste.

Conclusion: For *simple* configurations YAML is really nice.  But
sadly YAML seems to have added all the mistakes of XML into
JSON. Using YAML also means linking in highly non-trivial pieces of
code -- in fact it might be the *most* complicated code you are using
it.  That smells wrong for a configuration file.

I saw a few times on the Internets, "I like YAML since I can express
really complicated data structures in my configuration".  Now you have
two problems: your configuration is too complicated, and your
implementation is too complicated.  Your poor users.

It would be nice if there was a YAML-light implementation.  However I
don't know of any.

### TOML

You might be less familiar with TOML.  The main [TOML
specification](https://github.com/toml-lang/toml) is a good start, and
[Nate Finch](https://github.com/natefinch) wrote even more on it
https://npf.io/2014/08/intro-to-toml/

Pros:

* More simple
* Appears to have good language and editor support
* Order of stanzas does not matter
* Easy to cut-n-paste
* Keys do not need to be quoted
* All whitespace is optional
* You can have comments
* Good language and editor support (and improving)

Cons:

* All string values must be quoted (like JSON)
* "lists of objects" can be verbose depending on your data structure
* Notation of `[array]` vs `[[array of tables]]` (note single versus
  double brackets) might be confusing for end-users.  It makes sense,
  but also might be a source of errors.

Conclusion:

Over-all I'm net-positive on TOML, but like all things there are some
design decisions that have tradeoffs.

JSON/YAML/XML represent object hierarchy through nested
configuration. In TOML, configuration files are only 1-level deep, and
hierarchy is explicitly listed.  This means TOML is great for "spare
configuration" where you have many possible sections, perhaps deeply
needed.  You can configure a specific item very quickly and clearly,
e.g.

TOML configuration is 1-level deep, but can represent a deeply nested structure.
```toml
[foo.bar.xyz.abc]
name = "nickg"
```

Compared to JSON:

```json
{"foo": {"bar": {"xyz": {"abc": {"name": "nickg" }}}}}
```

Ideally you don't have such a complicated configuration in the first
place, but sometimes it makes sense.  This also means that some types
of configuration will expand or contract when switching to TOML.  You
may wish to change your object model (or abstract it) so your TOML
file is easier to understand.

TOML is whitespace insensitive, everywhere.  While that's great in
general, in also means strings need to always be in quotes.  Arrays
and values must be comma separated (like JSON but not like YAML). If
your configuration is string-heavy, this might be annoying relative to
YAML.

### Conclusion

If you are targeting end-users that can handle JSON, then TOML should
be an obvious choice.  If you are targeting perhaps-less-sophisticated
users and using YAML, it's less obvious if TOML is a good fit.  For
some projects I'm still looking for a YAML-lite configuration style.

Go forth and configure!
