class Dashboard extends Controller
	constructor: ($scope, $window, modal, Apps, $interval, ServerStatus) ->
		$scope.editing = false
		$scope.apps = []

		$scope.refreshApps = ->
			Apps.getAll((apps) ->
				$scope.apps = apps
			)

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
			console.log(app)
			$scope.app =
				id: app.id
				name: app.name
				url: app.url
				icon: app.icon

			modal.open(
				scope: $scope
				templateUrl: 'templates/modal-app-form.html'
				controller: 'editAppController'
			)

		$scope.removeApp = ->
			modal.open(
				scope: $scope
				templateUrl: 'templates/modal-app-remove.html'
			)

		$scope.openSettings = ->
			modal.open(
				scope: $scope
				templateUrl: 'templates/modal-settings.html'
			)

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
			checkStatus()
		)

		$interval(checkStatus, 5000)

