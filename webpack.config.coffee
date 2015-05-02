path = require('path')

module.exports =
  entry: './src/app.coffee'
  output:
    filename: 'bundle.js'
  module:
    loaders: [
      test: /\.coffee$/, loader: 'coffee-loader'
    ]
  
  resolve:
    extensions: ['', '.coffee', '.js']