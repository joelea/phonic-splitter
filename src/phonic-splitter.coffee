contains = (string, substring) -> string.indexOf(substring) > -1
simpleGraphene = (letters) ->
  word: letters
  replacement: letters

graphenes = ['ay', 'sh', 'air', 'ea', 'ou', 'ice', 'isl', 'igh', 'er'].map(simpleGraphene)

split = (word) ->
  for graphene in graphenes
    if contains(word, graphene.word)
      return flatten(intersperse([graphene.replacement], word.split(graphene.replacement).map(split)))

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
