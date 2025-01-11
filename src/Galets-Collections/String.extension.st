Extension { #name : 'String' }

{ #category : '*Galets-Collections' }
String >> splitWithinOn: aCharacter [
	"Split and return the substrings without the argument, aCharacter."
	"(('| x y | z k |') splitWithinOn: $|) asArray >>> #( ' x y ' ' z k ')"
	
	^ self findBetweenSubstrings: { aCharacter }
]
