jQuery ($) ->
  window.NestedFormEvents::insertFields = (content, assoc, link) ->
    $tr = $(link).parents("tr")
    $(content).insertBefore $tr

  return