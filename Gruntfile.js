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

    uglify: {
      options: {
        banner: '<%= meta.banner %>\n'
      },
      build: {
        files: {
          'themes/garabatos/js/application.min.js': 
          [
            'js/foundation/js/vendor/modernizr.js',
            'js/foundation/js/vendor/jquery.js',
            "js/foundation/js/foundation.min.js",
            "js/reveal.js/lib/js/head.min.js",
            "js/reveal.js/js/reveal.min.js",
            "js/simplecart-js/simpleCart.min.js",
            "js/src/application.js"
          ]
        }
      }
    },

    cssmin: {
      compress: {
        files: {
          'themes/garabatos/css/style.min.css': 
          [ 
            'themes/garabatos/css/style.css' ,
            "js/foundation/css/foundation.css",
            "js/reveal.js/css/reveal.min.css",
            "$themes/garabatos/css/style.css",
            "js/fontello/css/fontello.css",
            "js/fontello/css/animation.css"
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
        globals: {
          head: false,
          module: false,
          console: false,
          unescape: false
        }
      },
      files: [ 'Gruntfile.js', 'themes/garabatos/js/application.min.js' ]
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
        files: [ 'Gruntfile.js', 'js/src/application.js', 'themes/garabatos/css/style.css' ],
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
  grunt.loadNpmTasks( 'grunt-contrib-sass' );
  grunt.loadNpmTasks( 'grunt-contrib-connect' );
  grunt.loadNpmTasks( 'grunt-zip' );

  // Default task
  grunt.registerTask( 'default', [ 'jshint', 'cssmin', 'uglify', 'qunit' ] );

  // Theme task
  // grunt.registerTask( 'themes', [ 'sass' ] );

  // Package presentation to archive
  // grunt.registerTask( 'package', [ 'default', 'zip' ] );

  // Serve presentation locally
  grunt.registerTask( 'serve', [ 'connect', 'watch' ] );

  // Run tests
  grunt.registerTask( 'test', [ 'jshint', 'qunit' ] );

};
