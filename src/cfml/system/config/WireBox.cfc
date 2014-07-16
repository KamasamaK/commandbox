component extends="wirebox.system.ioc.config.Binder" {
	
	function configure() {

		// auto scan locations
		wirebox.scanLocations = [
			'/commandbox/system'
		];

		// scope registration
		wirebox.scopeRegistration = {
			enabled = true,
			scope   = "application",
			key		= "wireBox"
		};

		// LogBox 
		wirebox.logBoxConfig = "commandbox.system.config.LogBox";
		
		// Map CONSTANTS
		var system					= createObject( "java", "java.lang.System" );
		var homeDir					= system.getProperty( 'user.home' ) & "/.CommandBox";
		var tempDir					= homedir & "/temp";
		var artifactDir				= homedir & "/artifacts";
		var userDir					= system.getProperty( "user.dir" );
		var commandHistoryFile		= homedir & "/.history-command";
		var REPLScriptHistoryFile 	= homedir & "/.history-repl-script";
		var REPLTagHistoryFile 		= homedir & "/.history-repl-tag";
		var cr						= system.getProperty( "line.separator" );
		
		map( 'system' ).toValue( system );
		map( 'homeDir' ).toValue( homeDir );
		map( 'tempDir' ).toValue( tempDir );
		map( 'userDir' ).toValue( userDir );
		map( 'artifactDir' ).toValue( artifactDir );
		map( 'commandHistoryFile' ).toValue( commandHistoryFile );
		map( 'REPLScriptHistoryFile' ).toValue( REPLScriptHistoryFile );
		map( 'REPLTagHistoryFile' ).toValue( REPLTagHistoryFile );
		map( 'cr' ).toValue( cr );

		// Map Java Classes
		map( 'commandHistoryFile@java' ).toJava( "jline.console.history.FileHistory" )
			.initWith( createObject( "java", "java.io.File" ).init( commandHistoryFile ) )
			.asSingleton();
			
		map( 'REPLScriptHistoryFile@java' ).toJava( "jline.console.history.FileHistory" )
			.initWith( createObject( "java", "java.io.File" ).init( REPLScriptHistoryFile ) )
			.asSingleton();
			
		map( 'REPLTagHistoryFile@java' ).toJava( "jline.console.history.FileHistory" )
			.initWith( createObject( "java", "java.io.File" ).init( REPLTagHistoryFile ) )
			.asSingleton();
		
		// Map Directories
		mapDirectory( '/commandbox/system/services' );
		mapDirectory( '/commandbox/system/util' );
		
	}
	
}