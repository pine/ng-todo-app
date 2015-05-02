router = ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('/')
  
  $stateProvider
    .state 'list',
      url: '/'
      templateUrl: '/view/list.html'
      controller: 'ListController'

module.exports = [
  '$stateProvider',
  '$urlRouterProvider',
  router
]