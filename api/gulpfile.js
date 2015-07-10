var gulp = require('gulp');
var yaml = require('gulp-yaml');
var concat_json = require("gulp-concat-json");

gulp.task('default', function(){
    gulp.src('./yaml/*.yml')
      .pipe(yaml())
      .pipe(gulp.dest('./json/'))
})

gulp.task('concat', function(){
    gulp.src("json/*.json")
        .pipe(concat_json("api.json"))
        .pipe(gulp.dest("."));
})
