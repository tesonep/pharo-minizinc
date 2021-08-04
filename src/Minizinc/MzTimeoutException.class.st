Class {
	#name : #MzTimeoutException,
	#superclass : #Error,
	#instVars : [
		'script'
	],
	#category : #Minizinc
}

{ #category : #accessing }
MzTimeoutException >> script [
	^ script
]

{ #category : #accessing }
MzTimeoutException >> script: aString [ 
	script := aString
]
