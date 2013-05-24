# override $.event.special['every mouse event type'].handle method
for type in [ 'click', 'dblclick', 'focusout', 'hover', 'mousedown',
              'mouseenter', 'mouseleave', 'mousemove', 'mouseout',
              'mouseover', 'mouseup' ]
  do ->
    special = $.event.special[type]
    special = $.event.special[type] = {} unless special?
    { handle } = special

    $.extend special,
      handle: ({ handleObj: { handler }, target }) ->
        { enabled } = $.data target
        return if enabled is false
        if handle?
          handle.apply this, arguments
        else
          handler.apply this, arguments

$.fn.extend enabled: (value) ->
  for el in @
    data = $.data el
    return data.enabled ? true unless value?
    if data.enabled isnt value
      data.enabled = value
      data.button?.updateEnabled()
  @

