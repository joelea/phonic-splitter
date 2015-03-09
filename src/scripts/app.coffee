{split} = require('./phonic-splitter')
{parseUrl} = require('./urls')
$ = require('jquery')

format = (list) -> list.join(' - ')

$(document).ready ->
  url = parseUrl(window.location.href)
  if url.initial?
    $('#word-input').val(url.initial)
    window.onWordInput()


window.onWordInput = ->
  word = $('#word-input').val()
  result = $('#split-result')

  result.text(format(split(word)))
  result.fadeIn()

  return undefined