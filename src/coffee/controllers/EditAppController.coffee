class EditApp extends Controller
	constructor: ($scope, modalInstance, Apps, $controller) ->
		$scope.formTitle = 'Edit application'

		angular.extend(this, $controller('appFormController', {$scope: $scope}))

		$scope.saveApp = ->
			Apps.update($scope.app, ->
				$scope.refreshApps()
			)

			modalInstance.close()
