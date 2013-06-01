### Remarks

Just run it with no argument:

    ruby entry.rb

I confirmed the following implementations/platforms:

* ruby - version 1.0-971225 (i386-netbsd)
* ruby - version 1.1a9 (i386-netbsdelf)
* ruby 1.2(98/12/25) [i386-netbsdelf]
* ruby 1.4.6 (2000-08-16) [i386-netbsdelf]
* ruby 1.6.8 (2003-03-26) [i386-netbsdelf]
* ruby 1.8.7 (2008-05-28 patchlevel 5000) [i386-netbsdelf]
* ruby 1.9.3p392 (2013-02-22 revision 39386) [i386-netbsdelf]
* ruby 2.0.0p0 (2013-02-24 revision 39474) [i386-netbsdelf]
* ruby 2.1.0dev (2013-04-11 trunk 40225) [i386-netbsdelf]


### Description

An executable, succinct, and completely self descriptive haiku written in ruby.

* This program is just executable, and has no feature at all.
  So this is "the most Transcendental, Imbroglio Ruby program."
* This program exploits a kind of Ruby's design issue that a method does
  not check if it accepts block argument or not.
  Also, it reveals a spec-level bug that there is `is_a?` method but that
  there is not `is_an?`.
  So this illustrates "some of the subtleties (and design issues) of Ruby."
* This program works on almost all Ruby implementations.
  So this shows "the robustness and portability of Ruby interpreters."


### Internals

This exploits the fact that Ruby (foolishly) keeps the specs:

* A method does not check if it accepts block argument or not.
* An identifier that may be a method is not evaluated until it is needed.


### Limitation

* Unfortunately, it does not run on ruby version 0.49 because of extremely-different syntax.
* Also, it does not run on ruby version 0.95 because nil does not have `is_a?`.
