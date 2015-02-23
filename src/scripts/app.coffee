{split} = require('./phonic-splitter');
$ = require('jquery')

window.onWordInput = ->
  word = $('#word-input').val()
  alert(split(word))