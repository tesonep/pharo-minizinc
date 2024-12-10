Class {
	#name : 'MzVariable',
	#superclass : 'MzValue',
	#instVars : [
		'type',
		'value',
		'name'
	],
	#category : 'Minizinc-Bindings',
	#package : 'Minizinc',
	#tag : 'Bindings'
}

{ #category : 'instance creation' }
MzVariable class >> type: aString [ 
	
	^ self new
		type: aString;
		yourself
]

{ #category : 'evaluating' }
MzVariable >> evaluate [
	
	^ self value
]

{ #category : 'accessing' }
MzVariable >> name [
	^ name
]

{ #category : 'accessing' }
MzVariable >> name: aString [ 
	
	name := aString 
]

{ #category : 'generating' }
MzVariable >> printMinizinc [
	
	^ name 
]

{ #category : 'generating' }
MzVariable >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: '(';
		nextPutAll: name asString;
		nextPutAll: ')'
]

{ #category : 'accessing' }
MzVariable >> removeRedundances [

	^ self
]

{ #category : 'printing' }
MzVariable >> sanitize [
	
	^ self
]

{ #category : 'accessing' }
MzVariable >> toString [

	^ 'Var(' , name , ')'
]

{ #category : 'accessing' }
MzVariable >> type [

	^ type
]

{ #category : 'accessing' }
MzVariable >> type: anObject [

	type := anObject
]

{ #category : 'accessing' }
MzVariable >> value [

	^ value
]

{ #category : 'accessing' }
MzVariable >> value: anObject [

	value := anObject
]

{ #category : 'accessing' }
MzVariable >> variables [
	
	^ { self }
]
