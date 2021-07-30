Extension { #name : #Number }

{ #category : #'*Minizinc' }
Number >> asMzValue [

	^ MzConstant new
		  value: self;
		  yourself
]
