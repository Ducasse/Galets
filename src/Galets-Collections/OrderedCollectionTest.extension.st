Extension { #name : #OrderedCollectionTest }

{ #category : #'*Galets-Collections' }
OrderedCollectionTest >> testDoWithCutAndUncuts [

	| res |
	res := OrderedCollection new. 
	
	#(2 2 #east 1 1 1 #north 5 #east) asOrderedCollection
		ifCutOn: [ :s | s isSymbol ] 
		doWithCutAndUncuts: [ :cut :before | res addLast: cut; addAll: before ].
	
	self assert: res equals: #(#east 2 2 #north 1 1 1 #east 5) asOrderedCollection
]

{ #category : #'*Galets-Collections' }
OrderedCollectionTest >> testDoWithCutAndUncutsFirst [

	| res |
	res := OrderedCollection new. 
	
	#(#east 1 1 1 #north 5 #east) 
		ifCutOn: [ :s | s isSymbol ] 
		doWithCutAndUncuts: [ :cut :before | res addLast: cut; addAll: before ].
	
	self assert: res equals: #(#east #north 1 1 1 #east 5) asOrderedCollection
]

{ #category : #'*Galets-Collections' }
OrderedCollectionTest >> testDoWithCutAndUncutsLastNotCut [

	| res |
	res := OrderedCollection new. 
	
	#(2 2 #east 1 1 1 #north 5 #east 666) 
		ifCutOn: [ :s | s isSymbol ] 
		doWithCutAndUncuts: [ :cut :before | res addLast: cut; addAll: before ].
	
	self assert: res equals: #(#east 2 2 #north 1 1 1 #east 5) asOrderedCollection
]

{ #category : #'*Galets-Collections' }
OrderedCollectionTest >> testDoWithCutAndUncutsNoCut [

	| res |
	res := OrderedCollection new. 
	#(2 2 1 1 1 5) 
		ifCutOn: [ :s | s isSymbol ] 
		doWithCutAndUncuts: [ :cut :before | res addLast: cut; addAll: before ].
	
	self assert: res equals: #() asOrderedCollection
]
