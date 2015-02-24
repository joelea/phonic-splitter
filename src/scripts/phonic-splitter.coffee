{contains, intersperse, flatten, crossProduct} = require('./lists')
{alphabet, vowels, consonants} = require('./alphabet')

createSimpleGrapheme = (letters) ->
  target: letters
  replacement: [letters]

magicE = (prefix) ->
  [vowel, consonant] = prefix
  return {
    target: vowel + consonant + 'e'
    replacement: [vowel + '_e', consonant]
  }

magicEPairs = crossProduct(vowels, consonants)
magicEgraphemes = magicEPairs.map(magicE)

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

magicEgraphemes = magicEPairs.map(magicE)

graphemes = flatten [
  threeLetterGraphemes.map(createSimpleGrapheme),
  vowelPairs.map(createSimpleGrapheme),
  vowelsWithY.map(createSimpleGrapheme),
  rBasedGraphemes.map(createSimpleGrapheme),
  magicEgraphemes,
  rBasedGraphemes.map(createSimpleGrapheme),
  twoLetterGraphemes.map(createSimpleGrapheme),
]

split = (word) ->
  for grapheme in graphemes
    if contains(word, grapheme.target)
      withoutgrapheme = word.split(grapheme.target)
      allButgraphemeSplit = withoutgrapheme.map(split)
      graphemeReplaced = intersperse(grapheme.replacement, allButgraphemeSplit)
      return flatten(graphemeReplaced)

  word.split('')


module.exports = {split}