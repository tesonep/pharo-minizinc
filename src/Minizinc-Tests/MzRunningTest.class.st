Class {
	#name : #MzRunningTest,
	#superclass : #TestCase,
	#category : #'Minizinc-Tests'
}

{ #category : #tests }
MzRunningTest >> coloringAustralia [

	^ '% Colouring Australia using nc colours
int: nc = 3;

var 1..nc: wa;   var 1..nc: nt;  var 1..nc: sa;   var 1..nc: q;
var 1..nc: nsw;  var 1..nc: v;   var 1..nc: t;

constraint wa != nt;
constraint wa != sa;
constraint nt != sa;
constraint nt != q;
constraint sa != q;
constraint sa != nsw;
constraint sa != v;
constraint q != nsw;
constraint nsw != v;
solve satisfy;

output ["wa=\(wa)\t nt=\(nt)\t sa=\(sa)\n",
        "q=\(q)\t nsw=\(nsw)\t v=\(v)\n",
         "t=", show(t),  "\n"];'
]

{ #category : #tests }
MzRunningTest >> expectedAustralia [

	^ 'wa=3	 nt=2	 sa=1
q=3	 nsw=2	 v=3
t=1
----------
'
]

{ #category : #tests }
MzRunningTest >> testRunScript [

	| runner result |
	runner := MzRunner new.
	result := runner runScript: self coloringAustralia.
	
	self assert: result equals: self expectedAustralia
]

{ #category : #tests }
MzRunningTest >> testSolvingAustralia [

	| solver wa nsw nt v sa t q |
	solver := MzSolver new.

	wa := MzVariable type: '1..3'.
	nsw := MzVariable type: '1..3'.
	nt := MzVariable type: '1..3'.
	v := MzVariable type: '1..3'.
	sa := MzVariable type: '1..3'.
	t := MzVariable type: '1..3'.
	q := MzVariable type: '1..3'.

	solver addConstraint: (wa notEquals: nt).
	solver addConstraint: (wa notEquals: sa).
	solver addConstraint: (nt notEquals: sa).
	solver addConstraint: (nt notEquals: q).
	solver addConstraint: (sa notEquals: q).
	solver addConstraint: (sa notEquals: nsw).
	solver addConstraint: (sa notEquals: v).
	solver addConstraint: (q notEquals: nsw).
	solver addConstraint: (nsw notEquals: v).

	solver satisfy.

	self assert: (wa value ~= nt value).	
	self assert: (wa value ~= sa value).	
	self assert: (nt value ~= sa value).
	self assert: (nt value ~= q value).
	self assert: (sa value ~= q value).	
	self assert: (sa value ~= nsw value).
	self assert: (sa value ~= v value).
	self assert: (q value ~= nsw value).
	self assert: (nsw value ~= v value).
]
