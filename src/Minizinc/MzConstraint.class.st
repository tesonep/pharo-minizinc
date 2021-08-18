Class {
	#name : #MzConstraint,
	#superclass : #MzValue,
	#instVars : [
		'leftOperand',
		'operation',
		'rightOperand'
	],
	#category : #'Minizinc-Bindings'
}

{ #category : #evaluating }
MzConstraint >> evaluate [
	
	^ leftOperand evaluate perform: operation asSymbol with: rightOperand evaluate
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

{ #category : #accessing }
MzConstraint >> variables [
	
	^ leftOperand variables , rightOperand variables
]
