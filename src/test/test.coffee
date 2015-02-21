split = require('../phonic-splitter').split
expect = require('chai').expect

describe 'phonicSplitter', ->
  it 'should split 1 letter words into a singleton list of the 1 letter', ->
    expect(split('a')).to.eql(['a'])