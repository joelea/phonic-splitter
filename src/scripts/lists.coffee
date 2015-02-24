head = (list) -> list[0]
tail = (list) -> list[1..]

contains = (string, substring) -> string.indexOf(substring) > -1

intersperse = (element, list) ->
  if list.length < 2 then return list

  return [head(list), element].concat(intersperse(element, tail(list)))

flatten = (list) ->
  if list.length == 0 then return []

  return list[0].concat(flatten(list[1..]))

crossProduct = (as, bs) -> flatten(
  for a in as
    for b in bs
      [a, b]
  )

module.exports = {contains, intersperse, flatten, crossProduct}