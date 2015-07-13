$.fn.selectbox = (options)->
  settings = $.extend
    theme: 'standard'
  , options

  this.map (i, item)->

    constructor = ->

      $select_title = $('<div>',
        class: 'select-title'
        text: item.options[item.selectedIndex].text
      )

      $select_arrow = $('<div/>',
        class: 'select-arrow'
      )

      $select_current = $('<div/>',
        class: 'select-current'
      ).append($select_title).append($select_arrow)

      $select_list = $('<ul/>',
        class: 'select-list'
      )

      $.each item.options, ->
        $select_list.append $('<li/>',
          class: 'select-option'
          text: this.text
        ).on 'click', (e)->
          e.stopPropagation()
          $clicked_option = e.target.closest('.select-option')
          $select_title.text $clicked_option.innerHTML
          $select_list.fadeOut(100)

      $select_wrapper = $('<div/>',
        tabindex: -1
        class: 'select-wrapper'
      ).on('click', ->
        $select_list.fadeIn(0)
        $(this).focus().on 'blur', ->
          $select_list.fadeOut(100)
      ).append($select_current
      ).append($select_list)

      return $select_wrapper

    $(this).after(constructor()).remove()

$ ->
  $('.jquery-select').selectbox()
