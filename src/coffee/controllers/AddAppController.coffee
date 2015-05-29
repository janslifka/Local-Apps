class AddApp extends Controller
	constructor: ($scope, modalInstance, Apps, $controller) ->
		$scope.app =
			name: ''
			url: ''
			icon: ''
		$scope.formTitle = 'Add application'

		angular.extend(this, $controller('appFormController', {$scope: $scope}))

		$scope.saveApp = ->
			Apps.save($scope.app, ->
				$scope.refreshApps()
			)

			modalInstance.close()
