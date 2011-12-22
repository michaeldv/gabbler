# Copyright (c) 2011 Michael Dvorkin
#
# Gabbler is freely distributable under the terms of MIT license.
# See LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Testing Gabbler" do
  it "should generate a sentence" do
    gabbler = Gabbler.new
    gabbler.learn('The quick brown fox jumps over the lazy dog.')
    gabbler.sentence.should == 'The quick brown fox jumps over the lazy dog.'
  end

  it "should create the dictionary" do
    gabbler = Gabbler.new
    gabbler.learn('The quick brown fox jumps over the lazy dog. The quick red fox? The quick red fox runs!')
    dictionary = gabbler.instance_variable_get("@dictionary")

    dictionary.keys.size.should == 11
    dictionary.keys.should include [ "The",   "quick" ] # 1st sentence.
    dictionary.keys.should include [ "quick", "brown" ]
    dictionary.keys.should include [ "brown", "fox"   ]
    dictionary.keys.should include [ "fox",   "jumps" ]
    dictionary.keys.should include [ "jumps", "over"  ]
    dictionary.keys.should include [ "over",  "the"   ]
    dictionary.keys.should include [ "the",   "lazy"  ]
    dictionary.keys.should include [ "lazy",  "dog"   ]
    dictionary.keys.should include [ "quick", "red"   ] # 2nd sentence
    dictionary.keys.should include [ "red",   "fox"   ]
    dictionary.keys.should include [ "fox",   "runs"  ] # 3rd sentence

    dictionary[[ "The",   "quick" ]].should == [ "brown", "red", "red" ]
    dictionary[[ "brown", "fox"   ]].should == [ "jumps"               ]
    dictionary[[ "fox",   "jumps" ]].should == [ "over"                ]
    dictionary[[ "jumps", "over"  ]].should == [ "the"                 ]
    dictionary[[ "lazy",  "dog"   ]].should == [ "."                   ]
    dictionary[[ "over",  "the"   ]].should == [ "lazy"                ]
    dictionary[[ "quick", "brown" ]].should == [ "fox"                 ]
    dictionary[[ "the",   "lazy"  ]].should == [ "dog"                 ]
    dictionary[[ "quick", "red"   ]].should == [ "fox", "fox"          ]
    dictionary[[ "red",   "fox"   ]].should == [ "?", "runs"           ]
    dictionary[[ "fox",   "runs"  ]].should == [ "!"                   ]
  end

  it "should note start of sentences" do
    gabbler = Gabbler.new
    gabbler.learn('The quick brown fox jumps over the lazy dog. Lorem ipsum dolor sit ame? Proin aliquet metus eu tellus!')

    start = gabbler.instance_variable_get("@start")
    start.should == [ %w(The quick), %w(Lorem ipsum), %w(Proin aliquet) ]
  end

  it "should be able to unlearn" do
    gabbler = Gabbler.new
    gabbler.learn('The quick brown fox jumps over the lazy dog.')
    gabbler.unlearn!

    gabbler.instance_variable_get("@dictionary").should == {}
    gabbler.instance_variable_get("@start").should == []
  end
end
