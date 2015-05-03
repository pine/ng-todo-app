ListController = ($scope) ->
  $scope.items = []
  $scope.content = ''
  $scope.focus = true
  
  
  $scope.delete = (index) ->
    $scope.items.splice(index, 1)
    $scope.focus = true
  
  
  $scope.add = (event) ->
    # content is empty
    return unless $scope.content

    # on keypress
    if event and event.keyCode
      return unless event.keyCode == 13

    $scope.items.push
      content: $scope.content
      createdAt: new Date()

    $scope.content = ''
    $scope.focus = true


module.exports = [
  '$scope',
  ListController
]