_ = require('lodash')

require('angular')
require('angular-mocks')

require('../../src/app')


tests = require.context('./', true, /_test$/)
_.each tests.keys(), (key) -> tests(key)
