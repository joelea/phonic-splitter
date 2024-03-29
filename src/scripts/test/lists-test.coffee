{intersperse, flatten, crossProduct, list, string} = require('../lists')
expect = require('chai').expect

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

describe 'crossProduct', ->
  it 'should combine singleton arrays into a single array', ->
    expect(crossProduct([1], [2])).to.deep.equal([[1,2]])

  it 'should combine arrays', ->
    expect(crossProduct([1,2], [3,4])).to.deep.equal([[1,3], [1,4], [2,3], [2,4]])

describe 'contains', ->
  it 'should be false if a list does not contain the element', ->
    expect(list([1,2,3]).contains(4)).to.be.false

  it 'should be true if a list does contain the element', ->
    expect(list([1,2,3]).contains(2)).to.be.true

  it 'should detect missing letters in strings', ->
    expect(string('123').contains('4')).to.be.false

  it 'should detect present letters in strings', ->
    expect(string('123').contains('2')).to.be.true

  it 'should detect present substrings in strings', ->
    expect(string('1234').contains('23')).to.be.true

  it 'should detect missing substrings in strings', ->
    expect(string('1234').contains('24')).to.be.false
