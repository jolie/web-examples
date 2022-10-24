import { Jor, JoHelp } from '@jolie/jo'

Jor["user/john"].get()
	.then( response => {
		document.getElementById( 'hello-webpack' ).innerText = `User found: name = ${response.name}, karma = ${response.karma}`
    } )
	.catch( JoHelp.parseError ).catch( alert );
