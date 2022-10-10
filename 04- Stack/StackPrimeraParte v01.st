!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'as yet unclassified' stamp: 'IL 10/1/2022 19:24:17'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := Stack new.
	
	self assert: stack isEmpty! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 11:08:44'!
test02StackPopElementFromTheTop! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 11:06:44'!
test03StackPushElementAtTheTop! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 12:02:08'!
test04StackReturnLastElementWhenPop! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 11:39:28'!
test05StackPushElementAndStackIsNotEmpty
	
	| stack element |
	
	stack := Stack new.
	
	element := 'Chiara'.
	
	stack push: element.
	
	self deny: stack isEmpty.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 11:40:55'!
test06StackPopElementAndStackIsEmpty

	| stack element |
	
	stack := Stack new.
	
	element := 'Mateo'.
	
	stack push: element.
	
	self deny: stack isEmpty.
	
	stack pop.
	
	self assert: stack isEmpty.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 12:03:04'!
test07StackReturnsTop
! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 11:27:43'!
initialize
	elements := OrderedCollection new.! !

!Stack methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 11:33:06'!
isEmpty
	^ elements isEmpty! !

!Stack methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 11:42:46'!
pop
	^ elements removeLast! !

!Stack methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 11:39:51'!
push: anElement
	elements add: anElement.! !

!Stack methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 12:02:46'!
top
	^ elements at: (elements size).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Stack class' category: 'StackPrimeraParte'!
Stack class
	instanceVariableNames: 'initialize'!

!Stack class methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 11:28:21'!
new
	^ super new initialize! !
