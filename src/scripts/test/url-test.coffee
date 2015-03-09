expect = require('chai').expect
{parseUrl} = require('../urls')

describe 'parseUrl', ->
  it 'should contain a query parameter that is present', ->
    url = parseUrl 'www.home.com/foo?bar=11'
