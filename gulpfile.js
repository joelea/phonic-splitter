var gulp = require('gulp');
var coffee = require('gulp-coffee');
var mocha = require('gulp-mocha');
var watch = require('gulp-watch');
var clean = require('gulp-clean');
var gutil = require('gulp-util');
var connect = require('gulp-connect');
var source = require('vinyl-source-stream');
var buffer = require('vinyl-buffer');
var browserify = require('browserify');

var src = 'src';
var scripts = src + '/**/*.coffee';
var build = './build';
var buildScripts = build + '/scripts';
var buildTest = buildScripts + '/test/**/*.js';
var buildDist = build + '/dist';

var bundler = browserify(build + '/scripts/app.js');

var bundle = function() {
  return bundler.bundle()
    .on('error', gutil.log.bind(gutil, 'Browserify Error'))
    .pipe(source('bundle.js'))
    .pipe(gulp.dest(buildDist));
};

gulp.task('serve', ['dist'], function() {
  connect.server({
    root: buildDist
  });
});

gulp.task('bundle', ['build'], function() {
  return bundler.bundle()
    .on('error', gutil.log.bind(gutil, 'Browserify Error'))
    .pipe(source('scripts/bundle.js'))
    .pipe(gulp.dest(buildDist));
});

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
             .pipe(mocha({}));
});

gulp.task('html', ['clean'], function() {
  return gulp.src(src + '/**/*.html')
             .pipe(gulp.dest(buildDist));

});

gulp.task('dist', ['bundle', 'html'], function() {});
gulp.task('onChange', ['test', 'dist']);

gulp.task('watch', function() {
    return watch(scripts, function () {
      gulp.start('onChange');
    });
});

gulp.task('default', ['watch', 'test', 'serve'], function() {});