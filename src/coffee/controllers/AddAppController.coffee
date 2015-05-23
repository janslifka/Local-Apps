class AddApp extends Controller
	constructor: ($scope, modalInstance) ->
		$scope.app = {}
		$scope.formTitle = 'Add application'

		$scope.appImage = ''
		$scope.appCroppedImage = ''
		$scope.appFileName = ''

		handleFileSelect = (e) ->
			file = document.querySelector('#file-input').files[0]
			$scope.appFileName = file.name
			reader = new FileReader()

			reader.onload = (e) ->
				$scope.$apply ($scope) ->
					$scope.appImage = e.target.result

			reader.readAsDataURL file

		angular
			.element document.querySelector 'body'
			.on 'change', document.querySelector('#file-input'), handleFileSelect

		$scope.saveApp = ->
			app =
				'name': $scope.app.name
				'url': $scope.app.url
				'icon': $scope.appCroppedImage

			console.log app
