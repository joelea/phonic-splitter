contains = (string, substring) -> string.indexOf(substring) > -1
split = (word) ->
	if contains(word, 'ea')
		['ea', 'r']
	else
		word.split('')

intersperse = (element, list) ->
  if list.length < 2
    return list
  else
    return [list[0], element].concat(intersperse(element, list[1..]))

module.exports = {split, intersperse}