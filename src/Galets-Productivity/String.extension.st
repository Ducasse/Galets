Extension { #name : 'String' }

{ #category : '*Galets-Productivity' }
String >> browse [
	
	| imps |
	imps := (SystemNavigation default allImplementorsOf: self asSymbol).
	(imps size = 1) 
		ifTrue: [ ^ (Smalltalk tools toolNamed: #browser) openOnMethod: imps first ].
	(imps size > 1)
		ifTrue: [ ^ (Smalltalk tools toolNamed: #messageList) browseImplementorsOf: self asSymbol inNameResolver: nil  ].
	super browse
]
