$(document).ready ->
  $('.search_form').submit ->
    start_station = undefined
    end_station = undefined
    start_station = $(this).find('#start_station')
    end_station = $(this).find('#end_station')
    if start_station.val() == end_station.val()
      alert 'Выберите конечную станцию'
      return false
