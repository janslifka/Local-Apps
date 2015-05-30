class Settings extends Controller
	constructor: ($scope, modalInstance, Settings) ->
		$scope.newSettings = Settings.get()

		$scope.save = ->
			Settings.save($scope.newSettings)
			$scope.refreshSettings()
			modalInstance.close()
