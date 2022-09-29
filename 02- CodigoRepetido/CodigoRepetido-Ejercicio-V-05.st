!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'MA 9/24/2022 15:10:09'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook timer timeItTook|
	
	customerBook := CustomerBook new.
	
	timer := Timer new.
	timeItTook := timer takeTime: [customerBook addCustomerNamed: 'John Lennon'.].

	self assert: timeItTook isLowerThan: (50* millisecond).
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MA 9/24/2022 15:15:17'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook timer timeItTook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'PaulMcCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	
	timer := Timer new.
	timeItTook := timer takeTime: [customerBook removeCustomerNamed: paulMcCartney].
	
	self assert: timeItTook isLowerThan: (100 * millisecond).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MA 9/24/2022 15:02:00'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CDN 9/26/2022 23:49:25'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	self should: [ customerBook removeCustomerNamed: 'Paul McCartney'] raise: NotFound.
	
	self assert: customerBook hasAmountOfCustomers: 1.
	self assert: (customerBook includesCustomerNamed: johnLennon).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MA 9/24/2022 15:33:37'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: customerBook
 	hasAmountOfActiveCustomers: 0
 	hasAmountOfSuspendedCustomers: 1
 	hasAmountOfTotalCustomers: 1.

	self assert: (customerBook includesCustomerNamed: paulMcCartney).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MA 9/24/2022 15:32:12'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: customerBook
 	hasAmountOfActiveCustomers: 0
 	hasAmountOfSuspendedCustomers: 0
 	hasAmountOfTotalCustomers: 0.

	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CDN 9/26/2022 23:48:48'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	self should: [ customerBook suspendCustomerNamed: 'Ringo Starr' ] raise: CantSuspend.
	
	self assert: customerBook hasAmountOfCustomers: 1.
	self assert: (customerBook includesCustomerNamed: johnLennon).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'CDN 9/26/2022 23:48:37'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	self should: [  customerBook suspendCustomerNamed: johnLennon. ] raise: CantSuspend.
	
	self assert: customerBook hasAmountOfCustomers: 1.
	
	self assert: (customerBook includesCustomerNamed: johnLennon).! !


!CustomerBookTest methodsFor: 'auxiliar' stamp: 'CDN 9/26/2022 23:47:59'!
assert: customerBook
 hasAmountOfActiveCustomers: amountOfActiveCustomers
 hasAmountOfSuspendedCustomers: amountofSuspendedCustomers 
 hasAmountOfTotalCustomers: amountofCustomers

	self assert: amountOfActiveCustomers equals: customerBook numberOfActiveCustomers.
	self assert: amountofSuspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: customerBook hasAmountOfCustomers: amountofCustomers.! !

!CustomerBookTest methodsFor: 'auxiliar' stamp: 'CDN 9/26/2022 23:47:22'!
assert: aCustomerBook hasAmountOfCustomers: anAmount
	
	self assert: anAmount equals: aCustomerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'auxiliar' stamp: 'MA 9/24/2022 14:49:46'!
assert: amountOfTime isLowerThan: timeLimit

	self assert: amountOfTime < timeLimit.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'MA 9/27/2022 13:41:11'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'MA 9/27/2022 13:45:32'!
addCustomerNamed: aName	
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	active add: aName.! !

!CustomerBook methodsFor: 'customer management' stamp: 'MA 9/27/2022 13:45:44'!
numberOfActiveCustomers
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'MA 9/27/2022 13:45:58'!
numberOfCustomers
	^ self numberOfActiveCustomers + self numberOfSuspendedCustomers! !

!CustomerBook methodsFor: 'customer management' stamp: 'MA 9/27/2022 13:45:52'!
numberOfSuspendedCustomers
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'CDN 9/26/2022 23:27:30'!
removeCustomerNamed: aName 	
	active remove: aName 
	ifAbsent: [ suspended remove: aName 
	ifAbsent: [ ^ NotFound signal ] ].! !

!CustomerBook methodsFor: 'customer management' stamp: 'MA 9/27/2022 13:46:21'!
signalCustomerAlreadyExists 
	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'MA 9/27/2022 13:46:26'!
signalCustomerNameCannotBeEmpty 
	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'MA 9/27/2022 13:47:18'!
suspendCustomerNamed: aName 
	(active includes: aName) ifFalse: [^CantSuspend signal].
	self removeCustomerNamed: aName.
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !


!classDefinition: #Timer category: 'CodigoRepetido-Ejercicio'!
Object subclass: #Timer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!Timer methodsFor: 'as yet unclassified' stamp: 'MA 9/24/2022 14:28:23'!
takeTime: aBlock
	| millisecondsBeforeRunning millisecondsAfterRunning|
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	
	aBlock value.
	
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	^ millisecondsAfterRunning - millisecondsBeforeRunning! !
