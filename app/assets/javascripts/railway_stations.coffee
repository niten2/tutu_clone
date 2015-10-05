$(document).ready ->
  $('#new_railway_station').on 'submit', (event) ->
    event.preventDefault()

    form = $(this)
    title = $('#railway_station_name').val()
    id = $('div[id]').map(-> @id).get().join().substr(length - 2)
    id = +id + 1
    # console.log id


    # id = $("div[id]").map(function() { return this.id;  }).get().join().substr(length-2)
    # id = +id+1
    # id =

    # description = $('#todo_description').val()

    $.ajax
      url: form.attr('action')
      method: form.attr('method')
      data: 'railway_station':
        'name': title
      dataType: 'json'
      success: (data) ->
        # console.log data
        console.log id


        ul = $('.col-xs-9')
        todo = '<div class="col-xs-3"> ' + data.name + '</div>' + '<div class="col-xs-3"> ' + '<a href=/railway_station/>' + id + '</a>' + '</div>'


        ul.append todo
        $(':text').val ''

      error: ->
        console.log e
        console.log xhr
        console.log status
        console.log error
        # alert 'Server is broken!'


# 'name': "qqqqqqqqqqqqq"
# 'description': description



# alert 'Server is broken!'
# ul = $('ul')
# todo = '<li><b>' + data.title + '</b> - ' + data.description + '</li>'

# + '<br>' + '<div class="clearfix>"' + '</div>'
# return
