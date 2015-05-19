class Routes extends Config
	constructor: ($stateProvider, $urlRouterProvider) ->
		$urlRouterProvider.otherwise('/');

		$stateProvider
			.state 'dashboard',
				url: '^/'
				templateUrl: 'templates/dashboard.html',
				controller: 'dashboardController'
