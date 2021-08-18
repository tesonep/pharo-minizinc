Class {
	#name : #MzConstant,
	#superclass : #MzValue,
	#instVars : [
		'value'
	],
	#category : #Minizinc
}

{ #category : #evaluating }
MzConstant >> evaluate [
	
	^ value
]

{ #category : #generating }
MzConstant >> printMinizinc [
	
	^ value asString
]

{ #category : #accessing }
MzConstant >> value [
	^ value
]

{ #category : #accessing }
MzConstant >> value: anInteger [ 
	value := anInteger
]

{ #category : #accessing }
MzConstant >> variables [
	
	^ { }
]
