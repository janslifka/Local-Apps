class Apps extends Factory
	constructor: ($indexedDB) ->
		service =
			save: (app, callback) ->
				$indexedDB.openStore('apps', (store) ->
					store.insert(app).then(->
						callback?()
					)
				)

			getAll: (callback) ->
				$indexedDB.openStore('apps', (store) ->
					store.getAll().then((apps) ->
						callback?(apps)
					)
				)


		return service