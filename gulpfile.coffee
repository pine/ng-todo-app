_ = require('lodash')

gulp = require('gulp')
$ = require('gulp-load-plugins')()


# ---------------------------------------------------------

runWebpack = (prod) ->
  gulp.src 'src/app.coffee'
    .pipe $.webpack(require('./webpack.config'))
    .pipe $.if(prod, $.uglify())


runJade = (prod) ->
  gulp.src ['src/**/*.jade', '!src/layout/**/*.jade']
    .pipe $.jade()
    .pipe $.if(prod, $.htmlmin())


runLess = (prod) ->
  gulp.src 'src/app.less'
    .pipe $.less()
    .pipe $.autoprefixer()
    .pipe $.if(prod, $.cssmin())
    .pipe $.rename('bundle.css')


# ---------------------------------------------------------

gulp.task 'webpack', ->
  runWebpack()
    .pipe gulp.dest('dist')

gulp.task 'webpack-prod', ->
  runWebpack(true)
    .pipe gulp.dest('dist')


gulp.task 'jade', ->
  runJade()
    .pipe gulp.dest('dist')

gulp.task 'jade-prod', ->
  runJade(true)
    .pipe gulp.dest('dist')


gulp.task 'less', ->
  runLess()
    .pipe gulp.dest('dist')

gulp.task 'less-prod', ->
  runLess(true)
    .pipe gulp.dest('dist')


gulp.task 'coffeelint', ->
  gulp.src ['*.coffee', 'src/**/*.coffee']
    .pipe $.coffeelint()
    .pipe $.coffeelint.reporter()


gulp.task 'webserver', ->
  gulp.src('dist')
    .pipe $.webserver
      livereload: true
      open: false


# ---------------------------------------------------------

gulp.task 'watch', ['build', 'webserver'], ->
  gulp.watch 'src/**/*.coffee', ['webpack']
  gulp.watch 'src/**/*.jade', ['jade']
  gulp.watch 'src/**/*.less', ['less']


# ---------------------------------------------------------

gulp.task 'build', ['webpack', 'jade', 'less']
gulp.task 'build-prod', ['webpack-prod', 'jade-prod', 'less-prod']

gulp.task 'lint', ['coffeelint']
gulp.task 'test', ['lint']
gulp.task 'default', ['watch']
