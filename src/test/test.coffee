split = require('../phonic-splitter').split
expect = require('chai').expect

equivalent = (word, splitWord) ->
  it "#{word} -> #{splitWord}", ->
    expect(split(word)).to.eql(splitWord)

describe 'phonicSplitter', ->
  equivalent('a', ['a'])
  equivalent('at', ['a', 't'])
  equivalent('cat', ['c', 'a', 't'])
