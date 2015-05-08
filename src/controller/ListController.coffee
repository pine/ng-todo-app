class ListController
  constructor: ->
    @items = []
    @content = ''
    @focus = true
  
  
  delete: (index) ->
    @items.splice(index, 1)
    @focus = true
  
  
  add: (event) ->
    # content is empty
    return unless @content

    # on keypress
    if event and event.keyCode
      return unless event.keyCode == 13

    @items.push
      content: @content
      createdAt: new Date()

    @content = ''
    @focus = true


module.exports = [
  ListController
]