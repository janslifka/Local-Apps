class ServerStatus extends Factory
	constructor: ->
		service =

			check: (url, callback) ->
				xhr = new XMLHttpRequest()
				xhr.open('HEAD', url, true)
				xhr.onreadystatechange = (event) ->
					response = event.target
					if response.readyState is 4
						if response.status is 0
							online = false
						else
							online = true

						callback?(online)
				xhr.send()

		return service
