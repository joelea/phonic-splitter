contains = (string, substring) -> string.indexOf(substring) > -1

intersperse = (element, list) ->
  if list.length < 2
    return list
  else
    return [list[0], element].concat(intersperse(element, list[1..]))

flatten = (list) ->
  if list.length == 0
    return []
  else if list.length < 1
    return list[0]
  else
    return list[0].concat(flatten(list[1..]))

crossProduct = (as, bs) -> flatten(
  for a in as
    for b in bs
      [a, b]
  )

module.exports = {contains, intersperse, flatten, crossProduct}