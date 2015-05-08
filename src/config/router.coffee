router = ($stateProvider, $urlRouterProvider) ->
  $stateProvider
    .state 'list',
      url: '/'
      templateUrl: 'view/list.html'
  
  $urlRouterProvider.otherwise('/')


module.exports = [
  '$stateProvider',
  '$urlRouterProvider',
  router
]