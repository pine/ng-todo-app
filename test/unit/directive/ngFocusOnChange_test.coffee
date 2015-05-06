describe 'Unit test: directive/ngFocusOnChange', ->
  sandbox = null
  
  $compile = null
  $rootScope = null
  $timeout = null
  
  # ---------------------------------------------------------------------------
  
  beforeEach ->
    sandbox = sinon.sandbox.create()
    
    angular.mock.module('todo')
    angular.mock.inject (_$compile_, _$rootScope_, _$timeout_) ->
      $compile = _$compile_
      $rootScope = _$rootScope_
      $timeout = _$timeout_
  
  
  afterEach ->
    sandbox.restore()
  
  # ---------------------------------------------------------------------------
  
  it 'should focus', (done) ->
    $scope = $rootScope.$new()
    elem = $compile('<input type="text" ng-focus-on-change="focus">')($scope)
    
    sandbox.stub elem[0], 'focus', -> done()
    
    $scope.focus = true
    $scope.$digest()
    $timeout.flush()
  
  
  it 'should set false when lost focus', ->
    $scope = $rootScope.$new()
    $scope.focus = true
    
    elem = $compile('<input type="text" ng-focus-on-change="focus">')($scope)
    
    elem.triggerHandler('blur')
    expect($scope.focus).to.be.false
  