const Jo = require("@jolie/jo").Jo
const JoHelp = require("@jolie/jo").JoHelp

Jo.viewUser( { username: "john" } )
	.then( response => {
		document.getElementById( 'hello-webpack' ).innerText = `User found: name = ${response.name}, karma = ${response.karma}`
    } )
	.catch( JoHelp.parseError ).catch( alert );
