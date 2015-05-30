class EditApp extends Controller
	constructor: ($scope, $controller, modalInstance, Apps) ->
		$scope.formTitle = 'Edit application'

		angular.extend(this, $controller('appFormController', $scope: $scope))

		$scope.saveApp = ->
			Apps.update($scope.app, ->
				$scope.refreshApps()
			)
			modalInstance.close()
