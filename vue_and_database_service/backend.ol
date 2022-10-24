
from console import Console
from database import ConnectionInfo, Database

type Customer {
	customerId:string
	firstName:string
	lastName:string
	birthday:string
	streetAddress:string
	postalCode:string
	city:string
	email:string
	phoneNumber:string
}

type CustomersResponse {
	customers*: Customer
}

interface BackendInterface {
RequestResponse:
	getCustomers( void )( CustomersResponse )
}

service Backend {
    embed Console as console
    embed Database as database

	execution: concurrent

	inputPort Input {
		location: "local"
		interfaces: BackendInterface
	}
    
    init {
        println@console("initializing connection to database")()
        connect@database( {
            username= "",
            password= "",
            host= "",
            database= "./db/db.db",
            driver= "sqlite"
          } )( void )
        checkConnection@database()()
        println@console("successfully connect to the database")()
    }

	main {
		getCustomers()(res){
	        queryRequest =
	            "SELECT * FROM customers;";
	        query@database( queryRequest )( queryResponse );
            for ( customerRaw in queryResponse.row){
                res.customers[#res.customers] << {
                    birthday = customerRaw.birthday
                    firstName = customerRaw.firstName
                    lastName = customerRaw.lastName
                    phoneNumber = customerRaw.phoneNumber
                    streetAddress = customerRaw.streetAddress
                    city = customerRaw.city
                    postalCode = customerRaw.postalCode
                    customerId = customerRaw.customerId
                    email = customerRaw.email
                }
            }
		}
	}
}