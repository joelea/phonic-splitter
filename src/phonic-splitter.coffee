{contains, intersperse, flatten} = require('./lists')
{alphabet, vowels, consonants} = require('./alphabet')

magicEPairs = flatten(
  for vowel in vowels
    for consonant in consonants
      {vowel, consonant}
  )

simpleGraphene = (letters) ->
  word: letters
  replacement: [letters]

magicE = (prefix) ->
  {vowel, consonant} = prefix
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