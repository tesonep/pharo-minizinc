Class {
	#name : #MzRunner,
	#superclass : #Object,
	#instVars : [
		'engine'
	],
	#category : #'Minizinc-Bindings'
}

{ #category : #accessing }
MzRunner >> engine [

	^ engine
]

{ #category : #accessing }
MzRunner >> engine: anObject [

	engine := anObject
]

{ #category : #private }
MzRunner >> ensureWorkingDirectory [
	
	^ (FileLocator localDirectory / 'minizinc') ensureCreateDirectory
]

{ #category : #private }
MzRunner >> generateScriptFile: aString [

	| aFile |
	aFile := self ensureWorkingDirectory / 'script.mzn'.
	aFile ensureDelete.

	aFile writeStreamDo: [ :s | 
		(ZnCrPortableWriteStream on:s) nextPutAll: aString ].
	
	^ aFile
]

{ #category : #running }
MzRunner >> run: anInputFile [

	| arguments |
	arguments := engine ifNil: [ #(  ) ] ifNotNil: [ { '--solver'. engine } ].
	arguments := arguments copyWith: anInputFile resolve fullName.

	OSSUnixSubprocess new
		command: 'minizinc';
		arguments: arguments;
		workingDirectory: anInputFile parent resolve fullName;
		redirectStdout;
		redirectStderr;
		runAndWaitOnExitDo: [ :process :outString :errString | 
			^ outString withInternalLineEndings , errString withInternalLineEndings ]
]

{ #category : #running }
MzRunner >> runScript: aString [

	| aFileReference |
	aFileReference := self generateScriptFile: aString.
	
	^ self run: aFileReference
]
