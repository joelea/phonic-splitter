keyOf = (queryParam) -> queryParam.split('=')[0]
valueOf = (queryParam) ->
  rawValue = queryParam.split('=')[1]
  if rawValue == 'true' then return true
  if rawValue == 'false' then return false
  return rawValue

parseUrl = (url) ->
  returnObject = {}
  queryParams = url.slice(url.indexOf('?') + 1)
  queryParams.split('&').map (queryParam) -> returnObject[keyOf(queryParam)] = valueOf(queryParam)
  return returnObject

module.exports = {parseUrl}