class Settings extends Factory
	constructor: (storage) ->
		defaultSettings =
			appsPerRow: 4

		if not storage.get('settings')
			storage.set('settings', angular.toJson(defaultSettings))

		service =
			get: ->
				settings = JSON.parse(storage.get('settings'))
				return settings

			save: (newSettings) ->
				storage.set('settings', angular.toJson(newSettings))

		return service
