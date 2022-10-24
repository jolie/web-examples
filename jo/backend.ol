type ViewUserRequest { username: string }
type User {
	name: string
	karma: int
}

interface BackendInterface {
RequestResponse:
	viewUser( ViewUserRequest )( User ) throws UserNotFound( string )
}

service Backend {
	execution: concurrent

	inputPort Input {
		location: "local"
		interfaces: BackendInterface
	}

	init {
		users << {
			john << {
				name = "John"
				karma = 20
			}
			jane << {
				name = "Jane"
				karma = 42
			}
		}
	}

	main {
		viewUser( request )( response ) {
			if( is_defined( users.(request.username) ) ) {
				response -> users.(request.username)
			} else {
				throw( UserNotFound, "Could not find user with username " + request.username )
			}
		}
	}
}