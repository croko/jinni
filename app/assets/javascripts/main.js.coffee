ready = ->
  window.NestedFormEvents::insertFields = (content, assoc, link) ->
    $tr = $(link).parents("tr")
    $(content).insertBefore $tr
    return

  $('#lightbox a').nivoLightbox({
    effect: 'fall'
  });

  $('.datepicker').datetimepicker({
    language: 'ru',
    pickTime: false
  })

$(document).ready(ready)
$(document).on('page:load', ready)
window.ready = ready
