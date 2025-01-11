Class {
	#name : 'GalCollectionExtensionTest',
	#superclass : 'TestCase',
	#category : 'Galets-Collections',
	#package : 'Galets-Collections'
}

{ #category : 'tests - collect around and between' }
GalCollectionExtensionTest >> testCollectAroundAndBetween [

	self assert: (#( 'x y' 'k z' 'a' ) collect: [:each | each ] aroundAndBetween: '[') equals: 
#( '[' 'x y' '[' 'k z' '[' 'a' '[')
]

{ #category : 'tests - indexesOf' }
GalCollectionExtensionTest >> testIndexesOf [

	self assert: (#(33 4 33 33 5 6 7 ) indexesOf: 33) asArray equals:  #(1 3 4)
]

{ #category : 'tests - indexesOf' }
GalCollectionExtensionTest >> testIndexesOfNestedIsNotHandled [

	self assert: (#(33 4 #(33) 33 5 6 7 ) indexesOf: 33) asArray equals:  #(1  4)
]

{ #category : 'tests - indexesOf' }
GalCollectionExtensionTest >> testIndexesOfNotIn [

	self assert: (#(33 4 33 33 5 6 7 ) indexesOf: 666) asArray equals:  #()
]

{ #category : 'tests - indexesOf' }
GalCollectionExtensionTest >> testIndexesOfVariousElements [

	self assert: (#(33 4 #(33) 33 5 #(33) 7 ) indexesOf: #(33)) asArray equals:  #(3 6)
]

{ #category : 'tests - splitWithinOn' }
GalCollectionExtensionTest >> testSplitWithinOn [

	self assert: (('| x y | z k |') splitWithinOn: $|) asArray equals: #( ' x y ' ' z k ').
	self assert: (('| x y | z k ') splitWithinOn: $|) asArray equals: #( ' x y ' ' z k ').
	self assert: ((' x y | z k |') splitWithinOn: $|) asArray equals: #( ' x y ' ' z k ').
]

{ #category : 'tests - doTwoByTwo' }
GalCollectionExtensionTest >> testTwoByTwoEven [
	
	| o |
	o := OrderedCollection new. 
	#(10 1 20 2 30 3 40 4) doTwoByTwo: [ :f :s | o add: f + s ].
	self assert: o asArray equals: #(11 22 33 44)
]

{ #category : 'tests - doTwoByTwo' }
GalCollectionExtensionTest >> testTwoByTwoOdd [
	
	| o |
	o := OrderedCollection new. 
	#(10 1 20 2 30 3 40 4 50) doTwoByTwo: [ :f :s | o add: f + s ].
	self assert: o asArray equals: #(11 22 33 44)
]
