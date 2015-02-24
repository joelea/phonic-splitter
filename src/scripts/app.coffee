{split} = require('./phonic-splitter');
$ = require('jquery')

format = (list) -> list.join(' - ')

window.onWordInput = ->
  word = $('#word-input').val()
  $('#split-result').text(format(split(word)))
  return undefined