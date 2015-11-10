$(document).ready ->
  $('a.edit_station').click (e) ->
    e.preventDefault()

    station_id = undefined
    form = undefined
    title = undefined

    station_id = $(this).data('stationId')
    form = $('#edit_railway_station_' + station_id)
    title = $('#railway_station_title_' + station_id)
    if !$(this).hasClass('cancel')
      $(this).html 'Назад'
      $(this).addClass 'cancel'
    else
      $(this).html 'Редактирование'
      $(this).removeClass 'cancel'
    form.toggle()
    title.toggle()
