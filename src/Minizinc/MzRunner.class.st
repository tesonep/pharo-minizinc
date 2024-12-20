Class {
	#name : 'MzRunner',
	#superclass : 'Object',
	#instVars : [
		'engine',
		'timeout'
	],
	#category : 'Minizinc-Bindings',
	#package : 'Minizinc',
	#tag : 'Bindings'
}

{ #category : 'running' }
MzRunner >> compile: anInputFile [

	| arguments fznFile |
	
	fznFile := anInputFile withExtension: 'fzn'.
	
	arguments := { '-c'. '--output-to-file'. fznFile resolve fullName. anInputFile resolve fullName }.
	self runMinizincWithArguments: arguments inWorkingDirectory: anInputFile parent.
	^ fznFile

]

{ #category : 'accessing' }
MzRunner >> engine [

	^ engine
]

{ #category : 'accessing' }
MzRunner >> engine: anObject [

	engine := anObject
]

{ #category : 'private' }
MzRunner >> ensureWorkingDirectory [
	
	^ (FileLocator localDirectory / 'minizinc') ensureCreateDirectory
]

{ #category : 'private' }
MzRunner >> generateScriptFile: aString [

	| aFile |
	aFile := self ensureWorkingDirectory / 'script.mzn'.
	aFile ensureDelete.

	aFile writeStreamDo: [ :s | 
		(ZnCrPortableWriteStream on:s) nextPutAll: aString ].
	
	^ aFile
]

{ #category : 'running' }
MzRunner >> initialize [

	super initialize.
	
	timeout := 60 seconds
]

{ #category : 'running' }
MzRunner >> run: anInputFile [

	| arguments fznScript |
	fznScript := anInputFile withExtension: 'fzn'.
	arguments := engine
		ifNil: [ #(  ) ]
		ifNotNil: [ { '--solver'. engine } ].
	arguments := arguments copyWith: anInputFile fullName.
	arguments := arguments, { 
		'--output-fzn-to-file'.
		fznScript fullName }.

	^ [ self runMinizincWithArguments: arguments inWorkingDirectory: anInputFile parent]
			ensure: [ fznScript ensureDelete ] 
	

]

{ #category : 'running' }
MzRunner >> runMinizincWithArguments: arguments inWorkingDirectory: aWorkingDirectory [

	| osSubProcess totalOut totalError maxTime |

	maxTime := DateAndTime now + timeout.
	
	totalOut := String new writeStream.
	totalError := String new writeStream.

	[osSubProcess := OSSUnixSubprocess new.
	 osSubProcess
		command: 'minizinc';
		arguments: arguments;
		workingDirectory: aWorkingDirectory resolve fullName;
		redirectStdout;
		redirectStderr;
		runAndWaitPollingEvery: (Delay forMilliseconds: 50) 
		doing: [ :process :outStream :errStream |  
			| read | 
			read := outStream upToEnd.
			totalOut nextPutAll: read.
			read := errStream upToEnd.
			totalError nextPutAll: read.
			
			DateAndTime now > maxTime ifTrue: [ OSSTimeout signal: 'Process timeout' ]
		]
		onExitDo: [ :process :outStream :errStream  |
			process closeAndCleanStreams.
			^ totalOut contents withInternalLineEndings , totalError contents withInternalLineEndings
		]] on: OSSTimeout do: [ :e | osSubProcess ifNotNil: #kill. e pass ].
	

]

{ #category : 'running' }
MzRunner >> runScript: aString [

	| aFileReference |
	aFileReference := self generateScriptFile: aString.
	^ [ self run: aFileReference ]
		  on: OSSTimeout
		  do: [ :e | 
			  MzTimeoutException new
				  script: aString;
				  signal ]
]

{ #category : 'accessing' }
MzRunner >> timeout: aDuration [ 
	timeout := aDuration
]
