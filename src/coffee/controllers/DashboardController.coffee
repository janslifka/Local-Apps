class Dashboard extends Controller
	constructor: ($scope, $window, $interval, modal, Apps, ServerStatus, Settings) ->
		$scope.editing = false
		$scope.apps = []
		$scope.appsLoaded = false
		$scope.settings = Settings.get()

		$scope.refreshApps = ->
			Apps.getAll((apps) ->
				$scope.apps = apps
			)

		$scope.refreshSettings = ->
			$scope.settings = Settings.get()

		$scope.openApp = (url) ->
			if (!$scope.editing)
				$window.location.href = url

		$scope.editApps = ->
			$scope.editing = true

		$scope.finishEditing = ->
			$scope.editing = false

		$scope.addApp = ->
			modal.open(
				scope: $scope
				templateUrl: 'templates/modal-app-form.html'
				controller: 'addAppController'
			)

		$scope.editApp = (app) ->
			$scope.app = copyAppData(app)

			modal.open(
				scope: $scope
				templateUrl: 'templates/modal-app-form.html'
				controller: 'editAppController'
			)

		$scope.removeApp = (app) ->
			$scope.app = copyAppData(app)

			modal.open(
				scope: $scope
				templateUrl: 'templates/modal-app-remove.html'
				controller: 'removeAppController'
			)

		$scope.openSettings = ->
			modal.open(
				scope: $scope
				templateUrl: 'templates/modal-settings.html'
				controller: 'settingsController'
			)

		copyAppData = (source) ->
			app =
				id: source.id
				name: source.name
				url: source.url
				icon: source.icon
			return app

		checkStatus = ->
			angular.forEach($scope.apps, (app) ->
				ServerStatus.check(app.url, (online) ->
					$scope.$apply(->
						app.offline = !online
					)
				)
			)

		Apps.getAll((apps) ->
			$scope.apps = apps
			$scope.appsLoaded = true
			checkStatus()
		)

		$interval(checkStatus, 5000)
