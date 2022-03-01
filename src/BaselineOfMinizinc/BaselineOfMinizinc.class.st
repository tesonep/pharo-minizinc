Class {
	#name : #BaselineOfMinizinc,
	#superclass : #BaselineOf,
	#category : #BaselineOfMinizinc
}

{ #category : #baselines }
BaselineOfMinizinc >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'OSSubprocess'
			with: [ 
			spec repository: 'github://pharo-contributions/OSSubprocess' ].
		spec
			package: 'Minizinc'
			with: [ spec requires: #( 'OSSubprocess' ) ].
		spec
			package: 'Minizinc-Tests'
			with: [ spec requires: #( 'Minizinc' ) ] ]
]
