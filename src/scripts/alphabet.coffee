{contains} = require('./lists')

alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('')
vowels = 'aeiou'.split('')

isVowel = (letter) -> contains(letter, vowels)
isConsonant = (letter) => contains(letter, consonants)

consonants = alphabet.filter( (letter) -> not isVowel(letter) )

module.exports = {alphabet, vowels, consonants, isVowel, isConsonant}