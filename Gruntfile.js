/**
 * Garabatos Grunt
 *
 * Then run `grunt`.
 */


/* global module:false */
module.exports = function(grunt) {
  var port = grunt.option('port') || 8000;
  // Project configuration
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
            '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
            '* http://<%= pkg.homepage %>/\n' +
            '* Copyright (c) <%= grunt.template.today("yyyy") %> ' +
            '<%= pkg.author.name %>; Licensed MIT */',
    uglify: {
      options: {
        banner: '<%= banner %>\n'
      },
      build: {
        files: {
          'themes/garabatos/js/application.min.js': 
          [
            "vendor/reveal.js/js/reveal.js",
            'vendor/bower_components/foundation/js/vendor/modernizr.js',
            "vendor/bower_components/foundation/js/foundation.js",
            "vendor/simplecart-js/simpleCart.js",
            "vendor/src/application.js"
          ]
        }
      }
    },

    libsass: { 
      options: {
        loadPath: ["vendor/foundation/bower_components/foundation/scss"]
      },
      myTarget: {
          src: 'themes/garabatos-new/scss/style.scss',
          dest: 'themes/garabatos-new/css/style.css'
      }
    },

    cssmin: {
      compress: {
        files: {
          'themes/garabatos-new/css/style.min.css': 
          [ 
            // "js/foundation/css/foundation.css",
            // "js/fontello/css/fontello.css",
            // "js/fontello/css/animation.css",
            // "themes/garabatos/css/style.css",
            "themes/garabatos-new/css/style.css"
          ]
        }
      }
    },

    jshint: {
      options: {
        curly: false,
        eqeqeq: true,
        immed: true,
        latedef: true,
        newcap: true,
        noarg: true,
        sub: true,
        undef: true,
        eqnull: true,
        browser: true,
        expr: true,
        jquery: true,
        globals: {
          $: false,
          head: false,
          module: false,
          console: false,
          unescape: false
        }
      },
      files: [ 'Gruntfile.js' /*, 'themes/garabatos/js/application.min.js' */]
    },

    connect: {
      server: {
        options: {
          port: port,
          base: '.'
        }
      }
    },

    watch: {
      main: {
        files: [ 'Gruntfile.js', 'vendor/src/application.js', 'themes/garabatos-new/scss/*.scss' ],
        tasks: 'default'
      }
    }

  });

  // Dependencies
  grunt.loadNpmTasks( 'grunt-contrib-qunit' );
  grunt.loadNpmTasks( 'grunt-contrib-jshint' );
  grunt.loadNpmTasks( 'grunt-contrib-cssmin' );
  grunt.loadNpmTasks( 'grunt-contrib-uglify' );
  grunt.loadNpmTasks( 'grunt-contrib-watch' );
  grunt.loadNpmTasks( 'grunt-libsass' );
  // grunt.loadNpmTasks( 'grunt-contrib-connect' );
  // grunt.loadNpmTasks( 'grunt-zip' );

  // Default task
  grunt.registerTask( 'default', [ 'jshint', 'libsass', 'cssmin', 'uglify', 'watch' ] );

  // Theme task
  // grunt.registerTask( 'themes', [ 'sass' ] );

  // Package presentation to archive
  // grunt.registerTask( 'package', [ 'default', 'zip' ] );

  // Serve presentation locally
  grunt.registerTask( 'serve', [ 'connect', 'watch' ] );

  // Run tests
  grunt.registerTask( 'test', [ 'jshint', 'qunit' ] );

};
