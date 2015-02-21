var gulp = require('gulp');
var coffee = require('gulp-coffee');
var mocha = require('gulp-mocha');
var watch = require('gulp-watch');

var src = 'src';
var scripts = src + '/**/*.coffee';
var test = build + '/test/**/*.js';
var build = 'build';
var buildTest = build + '/test/**/*.js';

gulp.task('build', function() {
  return gulp.src(scripts)
             .pipe(coffee())
             .pipe(gulp.dest(build));
});

gulp.task('test', ['build'], function() {
  return gulp.src(buildTest)
             .pipe(mocha());
});

gulp.task('watch', function() {
    return watch(scripts, function () {
        gulp.start('test');
    });
});

gulp.task('default', ['build', 'test', 'watch' ], function() {});