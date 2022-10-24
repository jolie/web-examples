import { Jo, JoHelp } from '@jolie/jo'

Jo.viewUser( { username: "john" } )
	.then( response => {
		document.getElementById( 'hello-webpack' ).innerText = `User found: name = ${response.name}, karma = ${response.karma}`
    } )
	.catch( JoHelp.parseError ).catch( alert );
