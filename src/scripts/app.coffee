{split} = require('./phonic-splitter')
{parseUrl} = require('./urls')
$ = require('jquery')

format = (list) -> list.join(' - ')
wordInput = -> $('#word-input')

$(document).ready ->
  url = parseUrl(window.location.href)
  if url.initial?
    wordInput().val(url.initial)
    window.onWordInput()

window.onWordInput = ->
  word = wordInput().val()
  result = $('#split-result')

  result.text(format(split(word)))
  result.fadeIn()

  return undefined