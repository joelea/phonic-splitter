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

alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('')
vowels = 'aeiou'.split('')
consonants = alphabet.filter( (letter) -> not contains(letter, vowels))
magicEPairs = flatten(vowels.map (vowel) -> vowel + consonant for consonant in consonants)

simpleGraphene = (letters) ->
  word: letters
  replacement: [letters]

magicE = (prefix) ->
  [vowel, consonant] = prefix
  return {
    word: vowel + consonant + 'e'
    replacement: [vowel + '_e', consonant]
  }

graphenes = ['ay', 'sh', 'air', 'ea', 'ou', 'ice', 'isl', 'igh', 'er'].map(simpleGraphene)
                .concat(magicEPairs.map(magicE))

split = (word) ->
  for graphene in graphenes
    if contains(word, graphene.word)
      return flatten(intersperse(graphene.replacement, word.split(graphene.word).map(split)))

  word.split('')




module.exports = {split, intersperse, flatten}
