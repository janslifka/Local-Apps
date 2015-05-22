class Dashboard extends Controller
	constructor: ($scope, $window, modal) ->
		$scope.editing = false

		$scope.apps = [
			name: 'My App 1'
			url: 'http://localhost/'
			online: true
		,
			name: 'My App 2'
			url: 'http://localhost/'
			online: true
		,
			name: 'My App 3'
			url: 'http://localhost/'
			online: false
		,
			name: 'My App 4'
			url: 'http://localhost/'
			online: true
		,
			name: 'My App 5'
			url: 'http://localhost/'
			online: true
		,
			name: 'My App 6'
			url: 'http://localhost/'
			online: false
		,
			name: 'My App 7'
			url: 'http://localhost/'
			online: true
		,
			name: 'My App 8'
			url: 'http://localhost/'
			online: true
		]

		$scope.openApp = (url) ->
			if (!$scope.editing)
				$window.location.href = url

		$scope.editApps = ->
			$scope.editing = true

		$scope.finishEditing = ->
			$scope.editing = false


		$scope.addApp = () ->
			modal.open(
				scope: $scope
				templateUrl: 'templates/modal-app-form.html'
				controller: 'addAppController'
			)

		$scope.editApp = () ->
			modal.open(
				scope: $scope
				templateUrl: 'templates/modal-app-form.html'
				controller: 'editAppController'
			)

		$scope.removeApp = () ->
			modal.open(
				scope: $scope
				templateUrl: 'templates/modal-app-remove.html'
			)

		$scope.openSettings = () ->
			modal.open(
				scope: $scope
				templateUrl: 'templates/modal-settings.html'
			)
