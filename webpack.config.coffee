path = require('path')

module.exports =
  output:
    filename: 'bundle.js'
  module:
    loaders: [
      test: /\.coffee$/, loader: 'coffee-loader'
    ]
  
  resolve:
    extensions: ['', '.coffee', '.js']