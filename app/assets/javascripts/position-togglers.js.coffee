schedule = ->
  $pills = $('.togglers')
  $closers = $('.js-close-media')
  $players = $('.js-player')
  $draftCount = $('.js-draft-count')
  allPlayers = '.all'

  $pills.on 'click', ->
    target = $(this).find('a').data('position')

    if target == allPlayers
      $players.removeClass('hidden')
    else
      $toShow = $(target)
      $toHide = $players.not(target)
      $toShow.removeClass('hidden')
      $toHide.addClass('hidden')

  $closers.on 'click', ->
    $target = $(this).closest('.js-player')
    $target.addClass('permanent-hidden')
    currentDraftCount = parseInt($draftCount.text())
    $draftCount.text(currentDraftCount + 1)


$(document).ready schedule
$(document).on "page:load", schedule
