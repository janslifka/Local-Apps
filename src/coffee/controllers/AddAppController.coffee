class AddApp extends Controller
	constructor: ($scope, $controller, modalInstance, Apps, DEFAULT_ICON) ->
		$scope.app =
			name: ''
			url: ''
			icon: DEFAULT_ICON
		$scope.formTitle = 'Add application'

		angular.extend(this, $controller('appFormController', $scope: $scope))

		$scope.saveApp = ->
			Apps.save($scope.app, ->
				$scope.refreshApps()
			)
			modalInstance.close()
