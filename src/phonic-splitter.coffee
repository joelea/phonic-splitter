contains = (string, substring) -> string.indexOf(substring) > -1
graphenes = ['air', 'ea']
split = (word) ->
  for graphene in graphenes
    if contains(word, graphene)
      return flatten(intersperse([graphene], word.split(graphene).map(split)))

  word.split('')

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


module.exports = {split, intersperse, flatten}
