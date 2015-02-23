{contains, intersperse, flatten, crossProduct} = require('./lists')
{alphabet, vowels, consonants} = require('./alphabet')

magicEPairs = crossProduct(vowels, consonants)

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
      withoutGraphene = word.split(graphene.word).map(split)
      grapheneReplaced = intersperse(graphene.replacement, withoutGraphene)
      return flatten(grapheneReplaced)

  word.split('')


module.exports = {split, intersperse, flatten}