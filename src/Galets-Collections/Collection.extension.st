Extension { #name : 'Collection' }

{ #category : '*Galets-Collections' }
Collection >> collect: aBlock aroundAndBetween: anElement [
	
	"(#( 'x y' 'k z' 'a' ) 
			collect: [:each | each ] 
			aroundAndBetween: '[') 
				>>> #( '[' 'x y' '[' 'k z' '[' 'a' '[')"
						
	| copy |
	copy := self species new: self size * 2 + 1.
	copy at: 1 put: anElement.
	self withIndexDo: [ :each :index | 
								copy at: index * 2 put: each.  
								copy at: index * 2 + 1 put: anElement.
								].
	copy at: copy size put: anElement.
	^ copy  
	
]
