Extension { #name : 'Symbol' }

{ #category : '*Galets-Productivity' }
Symbol >> browse [
	
	| imps |
	imps := (SystemNavigation default allImplementorsOf: self).
	(imps size = 1) 
		ifTrue: [ ^ (Smalltalk tools toolNamed: #browser) openOnMethod: imps first ].
	super browse
]
