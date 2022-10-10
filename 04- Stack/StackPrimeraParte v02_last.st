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

!StackTest methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 18:10:59'!
test02StackPopElementFromTheTop

	| stack element1 element2 |
	
	stack := Stack new.
	
	element1 := 'Hola'.
	element2 := 'Don Pepito'.
	
	stack push: element1.
	self assert: stack pop equals: element1.
	
	stack push: element2.
	self assert: stack pop equals: element2.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 18:10:06'!
test03StackPushElementAtTheTop
	
	| stack element1 element2 |
	
	stack := Stack new.
	
	element1 := 'Hola'.
	element2 := 'Don Pepito'.
	
	stack push: element1.
	self assert: stack top equals: element1.
	
	stack push: element2.
	self assert: stack top equals: element2.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 18:07:10'!
test04StackReturnLastElementWhenPop
	
	| stack element |
	
	stack := Stack new.
	
	element := 'Algoritmos III'.
	
	stack push: element.
	
	self assert: (stack pop) equals: element.! !

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

!StackTest methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 18:02:06'!
test07StackReturnsTop

	| stack element |
	
	stack := Stack new.
	
	element := 1.
	
	stack push: element.
	
	self assert: stack top equals: element.
	
	
! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 18:06:02'!
test08StackReturnsTopWhenStackHasMoreThanOneElement

	| stack element1 element2 |
	
	stack := Stack new.
	
	element1 := 1.
	element2 := 2.
	
	stack push: element1.
	stack push: element2.
	
	self assert: stack top equals: element2.
	self deny: (stack top = element1).
	
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

!Stack methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 17:58:56'!
top
	^ elements last! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Stack class' category: 'StackPrimeraParte'!
Stack class
	instanceVariableNames: 'initialize'!

!Stack class methodsFor: 'as yet unclassified' stamp: 'CDN 10/10/2022 11:28:21'!
new
	^ super new initialize! !
