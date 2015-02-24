{list} = require('./lists')

alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('')
vowels = 'aeiou'.split('')

isVowel = (letter) -> list(vowels).contains(letter)
isConsonant = (letter) => list(consonants).contains(letter)

consonants = alphabet.filter( (letter) -> not isVowel(letter) )

module.exports = {alphabet, vowels, consonants, isVowel, isConsonant}