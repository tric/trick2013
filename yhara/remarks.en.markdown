### Remarks

Just run it with no argument:

    ruby entry.rb

I confirmed the following implementations/platforms:

* ruby 2.0.0p0 (2013-02-24 revision 39474) [x86\_64-darwin12.2.1]

### Description

Show a URL related to the topic of this script

### Internals

This program exploits some facts:
* `ruby` as a local variable and `ruby` as a method can coexist,
* we can define the same constant names if we separate name space, and
* we can define the same method names if we separate classes.

My favorite fragment is:

    ruby.ruby.ruby.ruby.ruby{|ruby, _ruby|`

See `encode.rb` for how to encode a string (not so difficult).
I guess a great golfer could make it much shorter...

No obfuscation but naming is not done.

### Limitation

ruby 2.0 only because I wanted use `%i`.

reference: http://ja.wikipedia.org/wiki/Buffalo_buffalo_Buffalo_buffalo_buffalo_buffalo_Buffalo_buffalo
