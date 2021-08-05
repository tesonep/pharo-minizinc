Class {
	#name : #MzConditional,
	#superclass : #MzValue,
	#instVars : [
		'if',
		'ifTrue',
		'ifFalse'
	],
	#category : #'Minizinc-Bindings'
}

{ #category : #accessing }
MzConditional >> if [

	^ if
]

{ #category : #accessing }
MzConditional >> if: anObject [

	if := anObject asMzValue
]

{ #category : #accessing }
MzConditional >> ifFalse [

	^ ifFalse
]

{ #category : #accessing }
MzConditional >> ifFalse: anObject [

	ifFalse := anObject asMzValue
]

{ #category : #accessing }
MzConditional >> ifTrue [

	^ ifTrue
]

{ #category : #accessing }
MzConditional >> ifTrue: anObject [

	ifTrue := anObject asMzValue
]

{ #category : #printing }
MzConditional >> printMinizinc [
	
	^ '(if' , if printMinizinc , ' then ' , ifTrue printMinizinc , ' else ', ifFalse printMinizinc , ' endif)'
]

{ #category : #accessing }
MzConditional >> variables [

	^ if variables, ifTrue variables, ifFalse variables
]
