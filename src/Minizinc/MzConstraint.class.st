Class {
	#name : #MzConstraint,
	#superclass : #MzValue,
	#instVars : [
		'leftOperand',
		'operation',
		'rightOperand',
		'selector'
	],
	#category : #'Minizinc-Bindings'
}

{ #category : #evaluating }
MzConstraint >> evaluate [
	
	^ leftOperand evaluate perform: self selector with: rightOperand evaluate
]

{ #category : #testing }
MzConstraint >> isConstant [
	
	^ false
]

{ #category : #accessing }
MzConstraint >> leftOperand: aMzVariable [ 
	
	leftOperand := aMzVariable 
]

{ #category : #accessing }
MzConstraint >> mzConstraintOnInterpreter: interpreter [
	
	^ self
]

{ #category : #accessing }
MzConstraint >> operation: aString [ 
	
	operation := aString 
]

{ #category : #generating }
MzConstraint >> printMinizinc [
	
	^ '(' , leftOperand printMinizinc , ' ' , operation asString , ' ', rightOperand printMinizinc , ')'
]

{ #category : #accessing }
MzConstraint >> rightOperand: aMzVariable [ 
	
	rightOperand := aMzVariable 
]

{ #category : #evaluating }
MzConstraint >> selector [

	^ selector ifNil: [operation asSymbol]
]

{ #category : #accessing }
MzConstraint >> selector: anObject [

	selector := anObject
]

{ #category : #accessing }
MzConstraint >> variables [
	
	^ leftOperand variables , rightOperand variables
]
