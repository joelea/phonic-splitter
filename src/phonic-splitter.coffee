{contains, intersperse, flatten} = require('./lists')

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
