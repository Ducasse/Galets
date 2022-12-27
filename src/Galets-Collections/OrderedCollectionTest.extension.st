Extension { #name : #OrderedCollectionTest }

{ #category : #'*Galets-Collections' }
OrderedCollectionTest >> testIfCutDoWithCutAndUncuts [

	| res |
	res := OrderedCollection new. 
	
	#(2 2 #east 1 1 1 #north 5 #east) asOrderedCollection
		ifCutOn: [ :s | s isSymbol ] 
		doWithCutAndUncuts: [ :cut :before | res addLast: cut; addAll: before ]
		finally: [ :u | res addAll: u ].
	
	self assert: res equals: #(#east 2 2 #north 1 1 1 #east 5) asOrderedCollection
]

{ #category : #'*Galets-Collections' }
OrderedCollectionTest >> testIfCutDoWithCutAndUncutsFirst [

	| res |
	res := OrderedCollection new. 
	
	#(#east 1 1 1 #north 5 #east) 
		ifCutOn: [ :s | s isSymbol ] 
		doWithCutAndUncuts: [ :cut :before | res addLast: cut; addAll: before ]
		finally: [ :u | res addAll: u ].
	
	self assert: res equals: #(#east #north 1 1 1 #east 5) asOrderedCollection
]

{ #category : #'*Galets-Collections' }
OrderedCollectionTest >> testIfCutDoWithCutAndUncutsLast [

	| res |
	res := OrderedCollection new. 
	
	#(#east 1 1 1 #north 5 #east 666) 
		ifCutOn: [ :s | s isSymbol ] 
		doWithCutAndUncuts: [ :cut :before | res addLast: cut; addAll: before ]
		finally: [ :u | res addAll: u ].
	
	self assert: res equals: #(#east #north 1 1 1 #east 5 666) asOrderedCollection
]

{ #category : #'*Galets-Collections' }
OrderedCollectionTest >> testIfCutDoWithCutAndUncutsNoCut [

	| res |
	res := OrderedCollection new. 
	#(2 2 1 1 1 5) 
		ifCutOn: [ :s | s isSymbol ] 
		doWithCutAndUncuts: [ :cut :before | res addLast: cut; addAll: before ]
		finally: [ :u | res addAll: u ].
	
	self assert: res equals: #(2 2 1 1 1 5) asOrderedCollection
]
