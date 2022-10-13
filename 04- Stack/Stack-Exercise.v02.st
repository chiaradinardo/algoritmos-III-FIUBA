!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements top size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!OOStack methodsFor: 'as yet unclassified' stamp: 'CDN 10/11/2022 20:58:54'!
isEmpty
	^ size = 0.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CDN 10/11/2022 21:27:17'!
pop
	|oldTop|
	oldTop := top.
	top := top next.
	size := size - 1.
	^ oldTop value.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CDN 10/11/2022 21:23:06'!
push: aString
	|newTop|
	newTop := Element newWithValue: aString.
	newTop attach: top.
	top := newTop. 
	size := size + 1.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'CDN 10/11/2022 21:01:59'!
top
	^ top value.! !


!OOStack methodsFor: 'initialization' stamp: 'CDN 10/11/2022 20:59:52'!
initialize
	top := Base new.
	size := 0.! !


!OOStack methodsFor: 'accessing' stamp: 'CDN 10/11/2022 20:59:33'!
size
	^ size.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'CDN 10/11/2022 21:29:32'!
find: aSentence
	^nil.! !


!classDefinition: #StackNode category: 'Stack-Exercise'!
Object subclass: #StackNode
	instanceVariableNames: 'value next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackNode methodsFor: 'as yet unclassified' stamp: 'CDN 10/11/2022 20:52:24'!
next
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackNode class' category: 'Stack-Exercise'!
StackNode class
	instanceVariableNames: ''!

!StackNode class methodsFor: 'as yet unclassified' stamp: 'CDN 10/11/2022 20:54:37'!
stackEmptyErrorDescription
	^ 'Stack is empty'! !


!classDefinition: #Base category: 'Stack-Exercise'!
StackNode subclass: #Base
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Base methodsFor: 'as yet unclassified' stamp: 'CDN 10/11/2022 21:04:45'!
attach: aNode

	! !

!Base methodsFor: 'as yet unclassified' stamp: 'CDN 10/11/2022 20:55:31'!
next
	^ self error: self class stackEmptyErrorDescription! !

!Base methodsFor: 'as yet unclassified' stamp: 'CDN 10/11/2022 21:01:13'!
value
	
	^ self error: self class stackEmptyErrorDescription.! !


!classDefinition: #Element category: 'Stack-Exercise'!
StackNode subclass: #Element
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Element methodsFor: 'as yet unclassified' stamp: 'CDN 10/11/2022 21:04:31'!
attach: aNode

	next := aNode.! !

!Element methodsFor: 'as yet unclassified' stamp: 'CDN 10/11/2022 21:17:26'!
initializeWith: anElement

	value := anElement! !

!Element methodsFor: 'as yet unclassified' stamp: 'CDN 10/11/2022 20:55:42'!
next
	^ next! !

!Element methodsFor: 'as yet unclassified' stamp: 'CDN 10/11/2022 21:01:27'!
value
	
	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Element class' category: 'Stack-Exercise'!
Element class
	instanceVariableNames: ''!

!Element class methodsFor: 'as yet unclassified' stamp: 'CDN 10/11/2022 21:20:18'!
newWithValue: aValue
	
	^ self new initializeWith: aValue! !
