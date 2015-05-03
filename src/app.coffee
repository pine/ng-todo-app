angular = require('angular')

# ---------------------------------------------------------

app = angular.module('todo', [
  require('angular-ui-router')
  ])

app.config require('./config/router')
app.controller 'ListController', require('./controller/ListController')
app.directive 'ngFocusOnChange', require('./directive/ngFocusOnChange')


module.exports = app