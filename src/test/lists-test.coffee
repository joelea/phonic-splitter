expect = require('chai').expect

{split, intersperse, flatten} = require('../phonic-splitter')

describe 'intersperse', ->
  it 'should leave an empty list empty', ->
    expect(intersperse(1, [])).to.deep.equal([])

  it 'should leave a singleton list the same', ->
    expect(intersperse(2, [1])).to.deep.equal([1])

  it 'should put the element in the middle of a 2 element list', ->
    expect(intersperse(2, [1,3])).to.deep.equal([1,2,3])

  it 'should put multiple copies of the element into lists of more than 2 elements', ->
    expect(intersperse(2, [1,3,5,7])).to.deep.equal([1,2,3,2,5,2,7])

describe 'flatten', ->
  it 'should flatten an array', ->
    expect(flatten([[1], [2,3], [4]])).to.deep.equal([1,2,3,4])