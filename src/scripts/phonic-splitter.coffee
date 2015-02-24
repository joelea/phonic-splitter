{contains, intersperse, flatten, crossProduct} = require('./lists')
{alphabet, vowels, consonants} = require('./alphabet')

simpleGraphene = (letters) ->
  target: letters
  replacement: [letters]

magicE = (prefix) ->
  [vowel, consonant] = prefix
  return {
    target: vowel + consonant + 'e'
    replacement: [vowel + '_e', consonant]
  }

magicEPairs = crossProduct(vowels, consonants)
magicEGraphenes = magicEPairs.map(magicE)

threeLetterGraphemes = ["igh", "air", "ere", "ore", "dge", "tch", "isl", "ice"]
vowelPairs = crossProduct(vowels, vowels).map( ([a,b]) -> a + b )
vowelsWithY = vowels.map( (vowel) -> vowel + "y" )
rBasedGraphemes = ["or", "ar", "er"]
twoLetterGraphemes = ["ck", "ch", "dd", "ff", "ph", "gh", "gg",
                      "ge", "ll", "le", "mm", "mb", "or", "ar",
                      "er", "le", "sh", "ow", "nn", "kn", "pp",
                      "rr", "wr", "ss", "ce", "se", "sc", "tt",
                      "ve", "ve", "wh", "zz", "ze", "se", "sh",
                      "ch", "si", "ti", "ch", "th", "ng"]

magicEGraphenes = magicEPairs.map(magicE)

graphenes = flatten [
  threeLetterGraphemes.map(simpleGraphene),
  vowelPairs.map(simpleGraphene),
  vowelsWithY.map(simpleGraphene),
  rBasedGraphemes.map(simpleGraphene),
  magicEGraphenes,
  rBasedGraphemes.map(simpleGraphene),
  twoLetterGraphemes.map(simpleGraphene),
]

split = (word) ->
  for graphene in graphenes
    if contains(word, graphene.target)
      withoutGraphene = word.split(graphene.target)
      allButGrapheneSplit = withoutGraphene.map(split)
      grapheneReplaced = intersperse(graphene.replacement, allButGrapheneSplit)
      return flatten(grapheneReplaced)

  word.split('')


module.exports = {split}