var gulp = require('gulp'),
    install = require('gulp-install'),
    conflict = require('gulp-conflict'),
    template = require('gulp-compile-handlebars'),
    inquirer = require('inquirer');
    _ = require('lodash');

gulp.task('default', function (done) {
  inquirer.prompt([
    {type: 'input', name: 'name', message: 'Give your app a name', default: gulp.args.join(' ')},
    {type: 'confirm', name: 'moveon', message: 'Continue?'}
  ],
  function (answers) {
    if (!answers.moveon) {
      return done();
    }
    options = {
      helpers : {
        capital: function(str){
          return _.chain(str).camelCase().capitalize().value();
        },
        kebab: function(str){
          return _.chain(str).kebabCase().value();
        },
        human: function(str){
          return str.split('-').join(' ');
        },
        start: function(str){
          return _.chain(str).startCase().value();
        }
      }
    }

    data = {
      name: answers.name.toLowerCase()
    }

    gulp.src(__dirname + '/templates/**/*', { dot: true })
      .pipe(template(data, options))
      .pipe(conflict('./'))
      .pipe(gulp.dest('./'))
      .pipe(install())
      .on('end', function () {
        done();
      })
      .resume();
  });
});
