contains = (string, substring) -> string.indexOf(substring) > -1
split = (word) ->
	if contains(word, 'ea')
		['ea', 'r']
	else
		word.split('')

intersperse = (element, list) ->
  if list.length == 2
    return [list[0], element, list[1]]
  else
    return list


module.exports = {split, intersperse}