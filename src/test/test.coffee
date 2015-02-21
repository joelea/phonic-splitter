{split, intersperse} = require('../phonic-splitter')
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

describe 'intersperse', ->
	it 'should leave an empty list empty', ->
		expect(intersperse([])).to.deep.equal([])

	it 'should leave a singleton list the same', ->
		expect(intersperse([])).to.deep.equal([])