class IndexedDB extends Config
	constructor: ($indexedDBProvider) ->
		$indexedDBProvider
			.connection('local-apps')
			.upgradeDatabase(1, (event, db, tx) ->
				objStore = db.createObjectStore('apps',
					keyPath: 'id'
					autoIncrement: true
				)
				objStore.createIndex('name_idx', 'name',
					unique: false
				)
			)