{split} = require('./phonic-splitter')
{parseUrl} = require('./urls')
URI = require('URIjs')
$ = require('jquery')

format = (list) -> list.join(' - ')
wordInput = -> $('#word-input')

$(document).ready ->
  initialWord = URI(window.location.href).query(true).initial
  if initialWord
    wordInput().val(initialWord)
    window.onWordInput()

window.onWordInput = ->
  word = wordInput().val()
  result = $('#split-result')

  result.text(format(split(word)))
  result.fadeIn()

  return undefined