Class {
	#name : #MzSolver,
	#superclass : #Object,
	#instVars : [
		'constraints',
		'script',
		'result',
		'variables'
	],
	#category : #Minizinc
}

{ #category : #'adding constraints' }
MzSolver >> addConstraint: aMzConstraint [ 
	
	constraints add: aMzConstraint 
]

{ #category : #generating }
MzSolver >> extractVariables [

	| uniqueVariables |
	variables := Dictionary new.
	uniqueVariables := constraints flatCollect: [ :aConstraint | aConstraint variables ] as: Set.

	uniqueVariables do: [ :each | 
		each name: 'v' , variables size asString.
		variables at: each name put: each ]. 
]

{ #category : #generating }
MzSolver >> generateScript [

	^ String streamContents: [ :s | 
		  variables values do: [ :e | 
			  s
				  nextPutAll: 'var ';
				  nextPutAll: e type;
				  nextPutAll: ': ';
				  nextPutAll: e name;
				  nextPutAll: ';';
				  lf ].

		  constraints do: [ :e | 
			  s
				  nextPutAll: 'constraint ';
				  nextPutAll: e printMinizinc;
				  nextPutAll: ';';
				  lf ].

		  s
			  nextPutAll: 'solve satisfy;';
			  lf.

		  s nextPutAll: 'output ["'.

		  variables
			  do: [ :e | 
				  s
					  nextPutAll: e name;
					  nextPutAll: '=\(';
					  nextPutAll: e name;
					  nextPutAll: ')';
					  nextPutAll: '\n ' ].

		  s
			  nextPutAll: '"];';
			  lf ]
]

{ #category : #initialization }
MzSolver >> initialize [

	super initialize.
	constraints := OrderedCollection new
]

{ #category : #parsing }
MzSolver >> parseResults: aString [

	| strings name value |
	(aString lines allButLast: 2) do: [ :each | 
		strings := each trimBoth substrings: '='.
		name := strings at: 1.
		value := NumberParser parse: (strings at: 2).

		(variables at: name) value: value ]
]

{ #category : #solving }
MzSolver >> satisfy [
	
	self extractVariables.
	script := self generateScript.
	result := MzRunner new runScript: script.
	self parseResults: result
]