### Remarks

Run:

    cp entry.rb alice.rb
    cp entry.rb bob.rb
    ruby alice.rb bob.rb

I confirmed the following platforms.

* ruby 2.0.0p0 (2013-02-24 revision 39474) [x86\_64-linux]
* ruby 1.9.3p194 (2012-04-20 revision 35410) [x86\_64-linux]
* ruby 1.9.3p327 (2012-11-10 revision 37606) [x86\_64-darwin10.8.0]

### Description

This is a "battle quine system" based on [Elo rating](http://en.wikipedia.org/wiki/Elo_rating_system).

In this system, a player is a quine whose code shape represents its rate.
As you see, `entry.rb` is a player with rate 1500.
A new player is created by just copying `entry.rb`.

    cp entry.rb alice.rb
    cp entry.rb bob.rb

By invoking the player and passing another player as an command-line argument, you can make them fight.
For example, the following command means "`alice.rb` beats `bob.rb`".

    ruby alice.rb bob.rb

The command updates each rate.  You will see new `alice.rb` and new `bob.rb` in trun.

One more thing.  If you invoke ruby with `-i` option, it prints only new alice.rb code, and update bob.rb in place.

    ruby -i alice.rb bob.rb

### Internals

* formatting code
* cheat OCR
* calculating Elo rating
* abuse of -i

### Limitation

* known bug: it will not work when the rate has five or more digits.
