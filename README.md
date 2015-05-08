ng-todo-app
-----------

[![Build Status](https://img.shields.io/travis/pine613/ng-todo-app/master.svg?style=flat-square)](https://travis-ci.org/pine613/ng-todo-app)
[![Dependency Status](https://img.shields.io/david/pine613/ng-todo-app.svg?style=flat-square)](https://david-dm.org/pine613/ng-todo-app)
[![devDependency Status](https://img.shields.io/david/dev/pine613/ng-todo-app.svg?style=flat-square)](https://david-dm.org/pine613/ng-todo-app#info=devDependencies)

This is the todo app that I created to learn AngularJS.

## Development environment

 - [Node.js](https://nodejs.org/) (v0.10.x, or v0.12.x)
 - [CoffeeScript](http://coffeescript.org/)
 - [Less](http://lesscss.org/)
 - [Jade](http://jade-lang.com/)
 - [gulp.js](http://gulpjs.com/)
 - [webpack](http://webpack.github.io/)
 - [Karma](http://karma-runner.github.io/)
 - [Nightwatch.js](http://nightwatchjs.org/) (Selenium wrapper)


## Dependencies

 - [AngularJS](https://angularjs.org/)
 - [AngularUI Router](https://github.com/angular-ui/ui-router)
 - [Lo-dash](https://lodash.com/)


## Build

```
$ npm install
$ npm run build
```

## Test
The tests depend [Mocha](http://mochajs.org/) and [Chai](http://chaijs.com/).

### Unit test
The tests run by [Karma](http://karma-runner.github.io/) with [PhantomJS](http://phantomjs.org/).

```
$ npm install
$ npm test
```


### Integration test
The tests run by [Nightwatch.js](http://nightwatchjs.org/) with [PhantomJS](http://phantomjs.org/).

```
$ npm install
$ npm run build
$ npm run webserver &
$ npm run integration-test
```


## License
MIT License<br />
Copyright (c) 2015 Pine Mizune
