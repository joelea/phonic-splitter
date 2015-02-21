var gulp = require('gulp');
var coffee = require('gulp-coffee');
var mocha = require('gulp-mocha');

var src = 'src/';
var scripts = src + '/**/*.coffee';
var test = build + '/test/**/*.js';
var build = 'build';
var buildTest = build + '/test/**/*.js';

gulp.task('coffee', function() {
  return gulp.src(scripts)
             .pipe(coffee())
             .pipe(gulp.dest(build));
});

gulp.task('test', ['coffee'], function() {
  gulp.src(buildTest)
      .pipe(mocha());
});

gulp.task('default', function() {
  //
});