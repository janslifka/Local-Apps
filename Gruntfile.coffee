module.exports = (grunt) ->
	jsLib = [
		'bower_components/jquery/dist/jquery.js',
		'bower_components/bootswatch-dist/js/bootstrap.js',
		'bower_components/angular/angular.js',
		'bower_components/angular-ui-router/release/angular-ui-router.js',
	]

	jsLibAnnotate = [
		'bower_components/angular-bs-modal/dist/js/angular-bs-modal.js'
	]

	cssLib = [
		'bower_components/bootswatch-dist/css/bootstrap.css',
		'bower_components/font-awesome/css/font-awesome.css'
	]

	grunt.initConfig
		pkg: grunt.file.readJSON('package.json')

		clean:
			before: ['dist']

			after: [
				'dist/coffee',
				'dist/style',
				'dist/temp-js'
			]

		coffee:
			compile:
				files:
					'dist/temp-js/main.js': ['dist/coffee/**/*.coffee']

		copy:
			main:
				files: [
					expand: true
					flatten: false
					cwd: 'src'
					src: ['manifest.json', 'background.js', 'images/**/*']
					dest: 'dist/'
				,
					expand: true
					flatten: true
					src: ['bower_components/font-awesome/fonts/*']
					dest: 'dist/fonts'
				]

		cssmin:
			dist:
				files:
					'dist/css/<%= pkg.name %>.css': cssLib.concat(['dist/style/*.css'])

		jade:
			compile:
				options:
					data:
						debug: false
				files: [
					cwd: 'src/'
					src: '**/*.jade'
					dest: 'dist/'
					expand: true
					ext: '.html'
				]

		ngAnnotate:
			app:
				files:
					'dist/temp-js/lib.js': jsLibAnnotate

		ngClassify:
			app:
				files: [
					cwd: 'src/coffee'
					src: '**/*.coffee'
					dest: 'dist/coffee'
					expand: true
				]
				options:
					appName: 'local-apps'

		sass:
			dist:
				options:
					style: 'compressed'
					sourcemap: 'none'

				files: [
					expand: true
					cwd: 'src/sass'
					src: ['*.sass']
					dest: 'dist/style'
					ext: '.css'
				]

		uglify:
			dist:
				files:
					'dist/js/<%= pkg.name %>.js': jsLib.concat(['dist/temp-js/lib.js', 'dist/temp-js/main.js'])

		watch:
			files: ['src/**/*']
			tasks: ['build']

	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-cssmin'
	grunt.loadNpmTasks 'grunt-contrib-jade'
	grunt.loadNpmTasks 'grunt-contrib-sass'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-ng-annotate'
	grunt.loadNpmTasks 'grunt-ng-classify'

	grunt.registerTask 'build', ['clean:before', 'jade', 'copy', 'ngClassify', 'coffee', 'ngAnnotate', 'uglify', 'sass', 'cssmin', 'clean:after']
