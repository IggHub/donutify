# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.onload = ->
  donutContainer = document.getElementById('donut-attributes')
  donutContainer.addEventListener 'click', (e) ->
    address = e.target.parentNode.childNodes[11].innerText

    return
  return
