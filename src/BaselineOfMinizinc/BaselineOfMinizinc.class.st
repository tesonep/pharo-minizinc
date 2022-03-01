Class {
	#name : #BaselineOfMinizinc,
	#superclass : #BaselineOf,
	#category : #BaselineOfMinizinc
}

{ #category : #baselines }
BaselineOfMinizinc >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec package: 'Minizinc'.
		spec package: 'Minizinc-Tests' with: [ spec requires: #('Minizinc') ] ]
]
