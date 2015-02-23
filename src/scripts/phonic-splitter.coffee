{contains, intersperse, flatten, crossProduct} = require('./lists')
{alphabet, vowels, consonants} = require('./alphabet')

magicEPairs = crossProduct(vowels, consonants)

simpleGraphene = (letters) ->
  target: letters
  replacement: [letters]

magicE = (prefix) ->
  [vowel, consonant] = prefix
  return {
    target: vowel + consonant + 'e'
    replacement: [vowel + '_e', consonant]
  }

graphenes = ['ay', 'sh', 'air', 'ea', 'ou', 'ice', 'isl', 'igh', 'er'].map(simpleGraphene)
                .concat(magicEPairs.map(magicE))

split = (word) ->
  for graphene in graphenes
    if contains(word, graphene.target)
      withoutGraphene = word.split(graphene.target)
      allButGrapheneSplit = withoutGraphene.map(split)
      grapheneReplaced = intersperse(graphene.replacement, allButGrapheneSplit)
      return flatten(grapheneReplaced)

  word.split('')


module.exports = {split}