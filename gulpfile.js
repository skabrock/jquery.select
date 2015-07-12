var gulp = require('gulp');
var uglify = require('gulp-uglify');
var concat = require('gulp-concat');
var coffee = require('gulp-coffee');
var es = require('event-stream');
var sass = require('gulp-sass');

gulp.task('scripts', function() {
  var jsFromCoffee = gulp.src('src/javascripts/*.coffee')
    .pipe(coffee());
  var js = gulp.src('src/javascripts/*.js');

  return es.merge(jsFromCoffee, js)
  .pipe(concat('jquery.select.min.js'))
  .pipe(uglify())
  .pipe(gulp.dest('dist'));
});

gulp.task('scripts:watch', function() {
  gulp.watch('src/javascripts/*.{js,coffee}', ['scripts']);
});

gulp.task('sass', function () {
  return gulp.src('src/stylesheets/application.sass')
  .pipe(sass().on('error', sass.logError))
  .pipe(concat('jquery.select.css'))
  .pipe(gulp.dest('dist'));
});

gulp.task('sass:watch', function () {
  gulp.watch('src/stylesheets/*.{scss,sass}', ['sass']);
});
