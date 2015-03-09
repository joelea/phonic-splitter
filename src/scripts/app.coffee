{split} = require('./phonic-splitter')
URI = require('URIjs')
$ = require('jquery')

format = (list) -> list.join(' - ')
wordInput = -> $('#word-input')
setInitialWord = (word) ->
  newUrl = URI(window.location.href).query(initial: word)
  history.pushState({}, "", newUrl)

$(document).ready ->
  initialWord = URI(window.location.href).query(true).initial
  if initialWord
    wordInput().val(initialWord)
    window.onWordInput()

window.onWordInput = ->
  word = wordInput().val()
  setInitialWord(word)
  result = $('#split-result')

  result.text(format(split(word)))
  result.fadeIn()

  return undefined