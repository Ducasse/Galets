Extension { #name : #SequenceableCollection }

{ #category : #'*Galets-Collections' }
SequenceableCollection >> indexesOf: anObject [  
	"Return all the indexes of the argument in the receiver."
	"(#(33 4 33 33 5 6 7 ) indexesOf: 33) asArray >>>  #(1 3 4)"
	
	| indexes |
	indexes := OrderedCollection new. 
	"we do not use an array because we do not know the size upfront"
	self withIndexDo: [ :each :index | 
					each = anObject
						ifTrue: [ indexes add: index ]
					 ].
	^ indexes
]
