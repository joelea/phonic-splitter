head = (list) -> list[0]
tail = (list) -> list[1..]

string = (string) -> contains: (substring) ->
  string.indexOf(substring) > -1

list = (list) -> contains: (element) ->
  list.indexOf(element) > -1

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

module.exports = {
  string,
  list,
  intersperse,
  flatten,
  crossProduct,
  head,
  tail,
}