class RemoveApp extends Controller
	constructor: ($scope, modalInstance, Apps) ->
		$scope.remove = ->
			Apps.remove($scope.app.id, ->
				$scope.refreshApps()
			)
			modalInstance.close()