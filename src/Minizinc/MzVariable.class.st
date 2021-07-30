Class {
	#name : #MzVariable,
	#superclass : #Object,
	#instVars : [
		'type',
		'value',
		'name'
	],
	#category : #'Minizinc-Bindings'
}

{ #category : #'instance creation' }
MzVariable class >> type: aString [ 
	
	^ self new
		type: aString;
		yourself
]

{ #category : #accessing }
MzVariable >> name [
	^ name
]

{ #category : #accessing }
MzVariable >> name: aString [ 
	
	name := aString 
]

{ #category : #operations }
MzVariable >> notEquals: aMzVariable [ 
	
	^ MzConstraint new
		leftOperand: self;
		operation: '!=';
		rightOperand: aMzVariable;
		yourself
]

{ #category : #generating }
MzVariable >> printMinizinc [
	
	^ name 
]

{ #category : #accessing }
MzVariable >> type [

	^ type
]

{ #category : #accessing }
MzVariable >> type: anObject [

	type := anObject
]

{ #category : #accessing }
MzVariable >> value [

	^ value
]

{ #category : #accessing }
MzVariable >> value: anObject [

	value := anObject
]

{ #category : #accessing }
MzVariable >> variables [
	
	^ { self }
]
