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

  $('#project_tag_list').tokenInput '/projects/tags.json',
    theme: 'facebook'
    minChars: 3
    allowCustomEntry: true
    allowFreeTagging: true
    preventDuplicates: true
    hintText: "Введите текст для поиска"
    searchingText: 'Поиск ...'
    noResultsText: 'Ничего не найдено'
    prePopulate: $('#project_tag_list').data('load')

$(document).ready(ready)
$(document).on('page:load', ready)
window.ready = ready
