describe 'Unit test: controller/ListController', ->
  $controller = null
  
  beforeEach ->
    angular.mock.module('todo')
    angular.mock.inject (_$controller_) ->
      $controller = _$controller_
  
  # ---------------------------------------------------------------------------
  
  describe '#constructor', ->
    it 'should be empty', ->
      list = $controller('ListController')
      
      expect(list.items).to.be.an('array')
      expect(list.content).to.be.empty
    
    
    it 'should focus', ->
      list = $controller('ListController')
      
      expect(list.focus).to.be.true
  
  # ---------------------------------------------------------------------------
  
  describe '#delete', ->
    it 'should delete item', ->
      list = $controller('ListController')
      
      list.items.push( content: '0', createdAt: new Date() )
      list.items.push( content: '1', createdAt: new Date() )
      list.items.push( content: '2', createdAt: new Date() )
      
      list.delete(1)
      
      expect(list.items[0]).to.have.property('content').that.is.a.string('0')
      expect(list.items[1]).to.have.property('content').that.is.a.string('2')
  
  # ---------------------------------------------------------------------------
  
  describe '#add', ->
    it 'should add item', ->
      list = $controller('ListController')
      
      list.content = '0'
      list.add()
      
      expect(list.items).to.have.length(1)
      expect(list.items[0]).to.have.property('content').that.is.a.string('0')
      expect(list.items[0]).to.have.property('createdAt').that.is.instanceof(Date)
      expect(list.content).to.be.a.string('')
