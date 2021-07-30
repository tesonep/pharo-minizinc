Class {
	#name : #MzRunner,
	#superclass : #Object,
	#category : #'Minizinc-Bindings'
}

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

	OSSUnixSubprocess new
		command: 'minizinc';
		arguments: { anInputFile resolve fullName };
		workingDirectory: anInputFile parent resolve fullName;
		redirectStdout;
		runAndWaitOnExitDo: [ :process :outString | ^ outString withInternalLineEndings ]
]

{ #category : #running }
MzRunner >> runScript: aString [

	| aFileReference |
	aFileReference := self generateScriptFile: aString.
	
	^ self run: aFileReference
]
