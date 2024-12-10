Class {
	#name : 'MzUnaryExpression',
	#superclass : 'MzValue',
	#instVars : [
		'operation',
		'operand'
	],
	#category : 'Minizinc-Bindings',
	#package : 'Minizinc',
	#tag : 'Bindings'
}

{ #category : 'accessing' }
MzUnaryExpression >> operand [

	^ operand
]

{ #category : 'accessing' }
MzUnaryExpression >> operand: anObject [

	operand := anObject
]

{ #category : 'accessing' }
MzUnaryExpression >> operation [

	^ operation
]

{ #category : 'accessing' }
MzUnaryExpression >> operation: aString [ 
	
	operation := aString 
]

{ #category : 'generating' }
MzUnaryExpression >> printMinizinc [
	
	^ '(' , operation asString , '(', operand printMinizinc , '))'
]

{ #category : 'accessing' }
MzUnaryExpression >> variables [
	
	^ operand variables
]
