+++
date = "2016-02-05T16:01:07-08:00"
description = "How to handle a single value or an array for a single configuration element."
tags = ["golang"]
keywords = ["golang", "configuration"]
title = "Golang and Gracefully Handling Lists in Configuration Files"
+++

Most configuration files are processed using 'object unmarshaling' (or
deserialization) into internal data structures.  While this is easy
and fast, it's not very flexible for *configuration*.  In most cases
a "single value" and an element with a single value are treated
differently. <!--more-->

For example: (I'm using JSON as an example but I don't
recommend it for actual configuration file):

```go
type Bar struct {
    Order: []string
}
```

This is an error:

```json
{  "Order": "Yamazaki" }
```


Instead you have to use array notation:

```json
{  "Order": [ "Yamazaki" ]  }
```

That's awkward and error-prone if there is normally only one item.
The additional array markup obscures the actual data, and forces the
customer to understand your internal data structure.

However, you can allow both forms, by encapulating the internal
structure with one specifically for configuration.  And you can
provide a better error message when the input is completely wrong.


```
type BarConfig struct {
    ORder: interface{}
}

func NewFromConfig(c BarConfig) (*Bar, error) {
    newc := Bar{}
    switch c.Order.(type) {
    case []string:
        newc.Order = c.Order.([]string)
    case string:
        newc.Order - []string{c.Order.(string)}
    default:
        return nil, new.Errorf("Order should be a string, or an array of strings")
    }
    return &newc, nil
}
```

It's a lot of work bullet-proofing the configuration file, but
user-interface is hard, no matter where it is!  More Yamazaki for
everyone!

