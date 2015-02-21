var gulp = require('gulp');
var coffee = require('gulp-coffee');
var mocha = require('gulp-mocha');
var watch = require('gulp-watch');
var clean = require('gulp-clean');

var src = 'src';
var scripts = src + '/**/*.coffee';
var test = build + '/test/**/*.js';
var build = 'build';
var buildTest = build + '/test/**/*.js';

gulp.task('clean', function() {
  return gulp.src(build, {read: false})
             .pipe(clean());
});

gulp.task('build', ['clean'], function() {
  return gulp.src(scripts)
             .pipe(coffee())
             .pipe(gulp.dest(build));
});

gulp.task('test', ['build'], function() {
  return gulp.src(buildTest)
             .pipe(mocha({reporter: 'mocha-osx-reporter'}));
});

gulp.task('niceTest', ['build'], function() {
  return gulp.src(buildTest)
             .pipe(mocha({reporter: 'spec'}));
});

gulp.task('watch', function() {
    return watch(scripts, function () {
        gulp.start('test');
    });
});

gulp.task('default', ['build', 'test', 'watch' ], function() {});