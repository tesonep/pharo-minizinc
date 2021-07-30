Class {
	#name : #MzConstant,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #Minizinc
}

{ #category : #generating }
MzConstant >> printMinizinc [
	
	^ value asString
]

{ #category : #accessing }
MzConstant >> value: anInteger [ 
	value := anInteger
]

{ #category : #accessing }
MzConstant >> variables [
	
	^ { }
]
