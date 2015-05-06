describe 'Unit test: controller/ListController', ->
  $controller = null
  
  beforeEach ->
    angular.mock.module('todo')
    angular.mock.inject (_$controller_) ->
      $controller = _$controller_
  
  # ---------------------------------------------------------------------------
  
  describe '$scope', ->
    it 'should be empty', ->
      $scope = {}
      ListController = $controller('ListController', $scope: $scope)
      
      expect($scope.items).to.be.empty
      expect($scope.content).to.be.empty
    
    
    it 'should focus', ->
      $scope = {}
      ListController = $controller('ListController', $scope: $scope)
      
      expect($scope.focus).to.be.true
  
  # ---------------------------------------------------------------------------
  
  describe '$scope.delete', ->
    it 'should delete item', ->
      $scope = {}
      ListController = $controller('ListController', $scope: $scope)
      
      $scope.items.push( content: '0', createdAt: new Date() )
      $scope.items.push( content: '1', createdAt: new Date() )
      $scope.items.push( content: '2', createdAt: new Date() )
      
      $scope.delete(1)
      
      expect($scope.items[0]).to.have.property('content').that.is.a.string('0')
      expect($scope.items[1]).to.have.property('content').that.is.a.string('2')
  
  # ---------------------------------------------------------------------------
  
  describe '$scope.add', ->
    it 'should add item', ->
      $scope = {}
      ListController = $controller('ListController', $scope: $scope)
      
      $scope.content = '0'
      $scope.add()
      
      expect($scope.items).to.have.length(1)
      expect($scope.items[0]).to.have.property('content').that.is.a.string('0')
      expect($scope.items[0]).to.have.property('createdAt').that.is.instanceof(Date)
      expect($scope.content).to.be.a.string('')
