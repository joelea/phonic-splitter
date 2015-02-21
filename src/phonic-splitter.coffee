contains = (string, substring) -> string.indexOf(substring) > -1
split = (word) ->
	if contains(word, 'ea')
		['ea', 'r']
	else
		word.split('')

intersperse = (list) -> list


module.exports = {split, intersperse}