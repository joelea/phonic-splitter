contains = (string, substring) -> string.indexOf(substring) > -1
split = (word) ->
  if contains(word, 'ea')
    return flatten(intersperse(['ea'], word.split('ea').map(split)))
  else
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
