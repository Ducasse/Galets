Class {
	#name : #BaselineOfGalets,
	#superclass : #BaselineOf,
	#category : #BaselineOfGalets
}

{ #category : #baselines }
BaselineOfGalets >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			package: #'Galets-Collections' ]
]
