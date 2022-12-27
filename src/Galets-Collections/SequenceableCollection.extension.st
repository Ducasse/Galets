Extension { #name : #SequenceableCollection }

{ #category : #'*Galets-Collections' }
SequenceableCollection >> ifCutOn: isSplitterBlock doWithCutAndUncuts: aTwoArgBlock [
	"Applies aTwoArgBlock (with current splitter objects and previous unsplit objects) to the receiver.
	An optimised version could work with indexes to avoid creating intermediate collections."	
	
	| uncuts cut current |
	uncuts := OrderedCollection new. 
	1 to: self size do: [ :i |	
		current := (self at: i).	
		cut := isSplitterBlock value: current.
		cut
			ifFalse: [ uncuts addLast: current ] 
			ifTrue: [ 
					aTwoArgBlock value: current value: uncuts.
					uncuts := OrderedCollection new ]]
		
	
	 
]

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
