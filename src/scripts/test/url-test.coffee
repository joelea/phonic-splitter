expect = require('chai').expect
{parseUrl} = require('../urls')

describe 'parseUrl', ->
  it 'should contain a query parameter that is present', ->
    url = parseUrl 'www.home.com/foo?bar=11'
    expect(url.bar).to.eql('11')

  it 'should contain a boolean query parameter', ->
    url = parseUrl 'www.home.com/foo?bar=true'
    expect(url.bar).to.be.true

  it 'should split out multiple params', ->
    url = parseUrl 'www.home.com/foo?hello=world&bar=true'
    expect(url.bar).to.be.true
    expect(url.hello).to.eql('world')
