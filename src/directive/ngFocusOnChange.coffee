ngFocusOnChange = ($timeout, $parse) ->
  link: (scope, elem, attrs) ->
    model = $parse(attrs.ngFocusOnChange)
    
    scope.$watch model, (value) ->
      $timeout -> elem[0].focus() if value == true
    
    elem.bind 'blur', ->
      scope.$apply(model.assign(scope, false))


module.exports = [
  '$timeout',
  '$parse',
  ngFocusOnChange
]