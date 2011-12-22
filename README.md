## Gabbler ##
Gabbler is a Ruby library that generates pseudo-random phrases. Any coherent
text file with adequate number of sentences could serve as Gabbler's training
set. Once trained, Gabbler produces pseudo-random sentences based on the
original text.

### Installation ###
    # Installing as Ruby gem
    $ gem install gabbler

    # Cloning the repository
    $ git clone git://github.com/michaeldv/gabbler.git

### Usage Example ###

    $ cat > holmes.rb
    require "gabbler"                         # Require the gem.
    gabbler = Gabbler.new                     # Create new Gabbler instance.
    story = File.read("./sample/holmes.txt")  # Read first chapter of 'A study in Scarlet'.
    gabbler.learn(story)                      # Make Gabbler learn about Sherlock Holmes.
    10.times { puts gabbler.sentence }        # Generate ten pseudo-rando sentences.
    gabbler.unlearn!                          # Forget Sherlock Holmes.
    gabbler.learn(story.reverse)              # Teach Gabbler about semloH kcolrehS.
    puts gabbler.sentence                     # .dezama eB
    ^D
    $ ruby holmes.rb
    This is very piquant.
    You perceive that the resulting mixture has the appearance of pure water.
    How on earth did you know that?
    If you like, we shall drive round together after luncheon.
    Now we have the Sherlock Holmes' test, and there will no longer be any difficulty.    
    I followed, however, with many other officers who were in the enemy's country.    
    This was a lofty chamber, lined and littered with countless bottles.
    My companion smiled an enigmatical smile.
    Did you never ask him what he was going in for?
    So is the microscopic examination for blood corpuscles.    
    senil esoht no repap a trats thgim uoY.

### Running Specs ###

    $ gem install rspec           # RSpec 2.x is the requirement.
    $ rake spec                   # Run the entire spec suite.

### Note on Patches/Pull Requests ###
* Fork the project on Github.
* Make your feature addition or bug fix.
* Add specs for it, making sure $ rake spec is all green.
* Commit, do not mess with Rakefile, version, or history.
* Send me a pull request.

### License ###

    Copyright (c) 2011 Michael Dvorkin
    twitter.com/mid
    %w(mike dvorkin.net) * "@" || %w(mike fatfreecrm.com) * "@"
    Released under the MIT license. See LICENSE file for details.
