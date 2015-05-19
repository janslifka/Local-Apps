module.exports = (grunt) ->
	jsLib = []
	cssLib = []

	grunt.initConfig
		pkg: grunt.file.readJSON('package.json')

		clean:
			before: ['dist']

			after: [
				'dist/coffee',
				'dist/style',
				'dist/main.js'
			]

		coffee:
			compile:
				files:
					'dist/main.js': ['dist/coffee/**/*.coffee']

		copy:
			main:
				files: [
					expand: true
					flatten: false
					cwd: 'src',
					src: ['manifest.json', 'background.js', 'images/**/*.*']
					dest: 'dist/'
				]

		cssmin:
			dist:
				files:
					'dist/<%= pkg.name %>.css': cssLib.concat(['dist/style/*.css'])

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
					'dist/<%= pkg.name %>.js': jsLib.concat(['dist/main.js'])

	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-cssmin'
	grunt.loadNpmTasks 'grunt-contrib-jade'
	grunt.loadNpmTasks 'grunt-contrib-sass'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-ng-annotate'
	grunt.loadNpmTasks 'grunt-ng-classify'

	grunt.registerTask 'build', ['clean:before', 'jade', 'copy', 'ngClassify', 'coffee', 'uglify', 'sass', 'cssmin', 'clean:after']
