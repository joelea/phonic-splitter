{split} = require('./phonic-splitter');
$ = require('jquery')

format = (list) -> list.join(' - ')

window.onWordInput = ->
  word = $('#word-input').val()
  result = $('#split-result')

  result.text(format(split(word)))
  result.fadeIn()

  return undefined