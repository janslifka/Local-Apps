class AppForm extends Controller
	constructor: ($scope) ->
		$scope.appImage = ''
		$scope.appCroppedImage = ''
		$scope.appFileName = ''

		uploaded = false

		handleFileSelect = (e) ->
			file = document.querySelector('#file-input').files[0]
			$scope.appFileName = file.name
			reader = new FileReader()

			reader.onload = (e) ->
				$scope.$apply(($scope) ->
					$scope.appImage = e.target.result
					uploaded = true
				)

			reader.readAsDataURL(file)

		angular
			.element(document.querySelector('body'))
			.on('change', '#file-input', handleFileSelect)

		$scope.$watch('appCroppedImage', ->
			if uploaded
				$scope.app.icon = $scope.appCroppedImage
		)
