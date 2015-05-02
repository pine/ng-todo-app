ListController = ($scope) ->
  $scope.items = []
  $scope.content = ''
  $scope.focus = true

  $scope.delete = (index) ->
    $scope.items.splice(index, 1)

  $scope.add = (e) ->
    # content is empty
    return unless $scope.content

    # on keypress
    if e and e.keyCode
      return unless e.keyCode == 13

    $scope.items.push
      content: $scope.content
      createdAt: new Date()

    $scope.content = ''
    $scope.focus = true


module.exports = [
  '$scope',
  ListController
]