Class {
	#name : 'MzValue',
	#superclass : 'Object',
	#category : 'Minizinc-Bindings',
	#package : 'Minizinc',
	#tag : 'Bindings'
}

{ #category : 'operations' }
MzValue >> * anOperand [ 

	^ MzConstraint new
		  leftOperand: self;
		  operation: '*';
		  rightOperand: anOperand asMzValue;
		  yourself
]

{ #category : 'operations' }
MzValue >> + anOperand [ 

	^ MzConstraint new
		  leftOperand: self;
		  operation: '+';
		  rightOperand: anOperand asMzValue;
		  yourself
]

{ #category : 'operations' }
MzValue >> - anOperand [ 

	^ MzConstraint new
		  leftOperand: self;
		  operation: '-';
		  rightOperand: anOperand asMzValue;
		  yourself
]

{ #category : 'operations' }
MzValue >> / anOperand [ 

	^ MzConstraint new
		  leftOperand: self;
		  operation: '/';
		  rightOperand: anOperand asMzValue;
		  yourself
]

{ #category : 'operations' }
MzValue >> // anOperand [ 
	
	"(-x div y) - if (-9 div 4) < 0 then 1 else 0 endif;"
	^ (self div: anOperand)
		- (MzConditional new
			if: ((self div: anOperand) lowerThan: 0);
			ifTrue: 1;
			ifFalse: 0;
			yourself)
]

{ #category : 'operations' }
MzValue >> \\ anOperand [ 
	
	"abs(abs((y * abs((x div y) - x // y))) - abs(x))
		* if y < 0 then -1 else 1 endif"
	
	^ ((anOperand * ((self div: anOperand) - (self // anOperand)) abs) abs
		- self abs) abs
			* (MzConditional new
				if: (anOperand lowerThan: 0);
				ifTrue: -1;
				ifFalse: 1;
				yourself)
]

{ #category : 'operations' }
MzValue >> abs [

	^ MzUnaryExpression new
		operation: 'abs';
		operand: self;
		yourself
]

{ #category : 'operations' }
MzValue >> and: anOperand [
 
	^ MzConstraint new
		  leftOperand: self;
		  operation: '/\';
		  rightOperand: anOperand asMzValue;
		  yourself
]

{ #category : 'converting' }
MzValue >> asMzValue [
	^ self
]

{ #category : 'accessing' }
MzValue >> bitAnd: aMzConstraint [ 

	"TODO: Implement me"
	^ nil
	"MzConstraint new
		leftOperand: self;
		operation: '/\';
		rightOperand: aMzConstraint asMzValue;
		yourself"
]

{ #category : 'accessing' }
MzValue >> bitOr: aMzConstraint [ 

	"TODO: Implement me"
	^ nil
	"MzConstraint new
		leftOperand: self;
		operation: '\/';
		rightOperand: aMzConstraint asMzValue;
		yourself"
]

{ #category : 'operations' }
MzValue >> div: anOperand [

	^ MzConstraint new
		  leftOperand: self;
		  operation: 'div';
		  selector: #//;
		  rightOperand: anOperand asMzValue;
		  yourself
]

{ #category : 'operations' }
MzValue >> equals: anOperand [

	^ MzConstraint new
		  leftOperand: self;
		  operation: '=';
		  rightOperand: anOperand asMzValue;
		  yourself
]

{ #category : 'operations' }
MzValue >> greaterOrEquals: aMzVariable [

	^ MzConstraint new
		  leftOperand: self;
		  operation: '>=';
		  rightOperand: aMzVariable asMzValue;
		  yourself
]

{ #category : 'operations' }
MzValue >> greaterThan: aMzVariable [ 
	
	^ MzConstraint new
		leftOperand: self;
		operation: '>';
		rightOperand: aMzVariable asMzValue;
		yourself
]

{ #category : 'operations' }
MzValue >> lessOrEquals: aMzVariable [ 
	
	^ MzConstraint new
		leftOperand: self;
		operation: '<=';
		rightOperand: aMzVariable asMzValue;
		yourself
]

{ #category : 'operations' }
MzValue >> lowerThan: aMzVariable [ 
	
	^ MzConstraint new
		leftOperand: self;
		operation: '<';
		rightOperand: aMzVariable asMzValue;
		yourself
]

{ #category : 'operations' }
MzValue >> mod: anOperand [ 
	
	^ MzConstraint new
		  leftOperand: self;
		  operation: 'mod';
		  rightOperand: anOperand asMzValue;
		  yourself
]

{ #category : 'operations' }
MzValue >> notEquals: anOperand [

	^ (MzConstraint new
		   leftOperand: self;
		   operation: '>';
		   rightOperand: anOperand asMzValue;
		   yourself) or: (MzConstraint new
			   leftOperand: self;
			   operation: '<';
			   rightOperand: anOperand asMzValue;
			   yourself)
]

{ #category : 'operations' }
MzValue >> or: aMzConstraint [ 

	^ MzConstraint new
		leftOperand: self;
		operation: '\/';
		rightOperand: aMzConstraint asMzValue;
		yourself
]
