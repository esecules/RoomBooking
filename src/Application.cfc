<cfcomponent output="false">
	<cfinclude template="wheels/functions.cfm">
</cfcomponent>

#!javascript

this.datasources["roombooking"] = {
    // required
    type: 'mysql'
    , host: 'localhost'
    , database: 'roombooking'
    , port: 3306
    , username: 'root'
    , password: "encrypted:42ef847bb4a51f79d64c1da70701506713f85d07fbd63e7642f64c2a17eaeff7"
}; 
