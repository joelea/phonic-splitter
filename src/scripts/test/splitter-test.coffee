{split} = require('../phonic-splitter')
expect = require('chai').expect

equivalent = (word, splitWord) ->
  it "#{word} -> #{splitWord}", ->
    expect(split(word)).to.eql(splitWord)

describe 'phonicSplitter', ->
  equivalent('a', ['a'])
  equivalent('at', ['a', 't'])
  equivalent('cat', ['c', 'a', 't'])
  equivalent('cat', ['c', 'a', 't'])
  equivalent('ear', ['ea', 'r'])
  equivalent('spear', ['s', 'p', 'ea', 'r'])
  equivalent('spair', ['s', 'p', 'air'])
  equivalent('shear', ['sh', 'ea', 'r'])
  equivalent('says', ['s', 'ay', 's'])
  equivalent('louder', ['l', 'ou', 'd', 'er'])
  equivalent('iceland', ['ice', 'l', 'a', 'n', 'd'])
  equivalent('island', ['isl', 'a', 'n', 'd'])
  equivalent('high', ['h', 'igh'])
  equivalent('though', ['th', 'ough'])
  equivalent('shine', ['sh', 'i_e', 'n'])
  equivalent('shone', ['sh', 'o_e', 'n'])
  equivalent('lobe', ['l', 'o_e', 'b'])