Class {
	#name : #MzValue,
	#superclass : #Object,
	#category : #'Minizinc-Bindings'
}

{ #category : #operations }
MzValue >> + anOperand [ 

	^ MzConstraint new
		  leftOperand: self;
		  operation: '+';
		  rightOperand: anOperand asMzValue;
		  yourself
]

{ #category : #operations }
MzValue >> - anOperand [ 

	^ MzConstraint new
		  leftOperand: self;
		  operation: '-';
		  rightOperand: anOperand asMzValue;
		  yourself
]

{ #category : #converting }
MzValue >> asMzValue [
	^ self
]

{ #category : #operations }
MzValue >> equals: anOperand [

	^ MzConstraint new
		  leftOperand: self;
		  operation: '=';
		  rightOperand: anOperand asMzValue;
		  yourself
]

{ #category : #operations }
MzValue >> greaterOrEquals: aMzVariable [

	^ MzConstraint new
		  leftOperand: self;
		  operation: '>=';
		  rightOperand: aMzVariable asMzValue;
		  yourself
]

{ #category : #operations }
MzValue >> greaterThan: aMzVariable [ 
	
	^ MzConstraint new
		leftOperand: self;
		operation: '>';
		rightOperand: aMzVariable asMzValue;
		yourself
]

{ #category : #operations }
MzValue >> lessOrEquals: aMzVariable [ 
	
	^ MzConstraint new
		leftOperand: self;
		operation: '<=';
		rightOperand: aMzVariable asMzValue;
		yourself
]

{ #category : #operations }
MzValue >> lowerThan: aMzVariable [ 
	
	^ MzConstraint new
		leftOperand: self;
		operation: '<';
		rightOperand: aMzVariable asMzValue;
		yourself
]

{ #category : #operations }
MzValue >> notEquals: aMzVariable [ 
	
	^ MzConstraint new
		leftOperand: self;
		operation: '!=';
		rightOperand: aMzVariable;
		yourself
]

{ #category : #operations }
MzValue >> or: aMzConstraint [ 

	^ MzConstraint new
		leftOperand: self;
		operation: '\/';
		rightOperand: aMzConstraint asMzValue;
		yourself
]
