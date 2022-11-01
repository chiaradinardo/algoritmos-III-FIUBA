!classDefinition: #Tests category: 'MarsRover'!
TestCase subclass: #Tests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Tests methodsFor: 'as yet unclassified' stamp: 'M 11/1/2022 17:31:37'!
test01RoverLocationIsTheSameAfterEmptyCommand

	|rover|
	
	rover := Rover initializeWithLocation: 0@0 towards: North.
	rover executeMovementCommand: ''.
	self assert: rover location = (0@0).! !

!Tests methodsFor: 'as yet unclassified' stamp: 'M 11/1/2022 17:35:52'!
test02RoverDirectionIsTheSameAfterEmptyCommand

	|rover|
	
	rover := Rover initializeWithLocation: 0@0 towards: North.
	rover executeMovementCommand: ''.
	self assert: rover direction = North.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'M 11/1/2022 17:31:48'!
test03

	|rover|
	
	rover := Rover initializeWithLocation: 1@0 towards: North.
	rover executeMovementCommand: ''.
	self assert: rover location = (1@0).! !

!Tests methodsFor: 'as yet unclassified' stamp: 'M 11/1/2022 17:35:42'!
test04

	|rover|
	
	rover := Rover initializeWithLocation: 0@0 towards: South.
	rover executeMovementCommand: ''.
	self assert: rover direction = South.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'M 11/1/2022 17:32:04'!
test05

	|rover|
	
	rover := Rover initializeWithLocation: 0@0 towards: North.
	rover executeMovementCommand: 'f'.
	self assert: rover location = (0@1).! !

!Tests methodsFor: 'as yet unclassified' stamp: 'M 11/1/2022 17:32:13'!
test06

	|rover|
	
	rover := Rover initializeWithLocation: 0@0 towards: South.
	rover executeMovementCommand: 'f'.
	self assert: rover location = (0@-1).! !

!Tests methodsFor: 'as yet unclassified' stamp: 'M 11/1/2022 17:37:32'!
test07

	|rover|
	
	rover := Rover initializeWithLocation: 0@0 towards: East.
	rover executeMovementCommand: 'f'.
	self assert: rover location = (1@0).! !

!Tests methodsFor: 'as yet unclassified' stamp: 'M 11/1/2022 17:37:22'!
test08

	|rover|
	
	rover := Rover initializeWithLocation: 0@0 towards: West.
	rover executeMovementCommand: 'f'.
	self assert: rover location = (-1@0).! !


!classDefinition: #CardinalDirection category: 'MarsRover'!
Object subclass: #CardinalDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalDirection class' category: 'MarsRover'!
CardinalDirection class
	instanceVariableNames: ''!

!CardinalDirection class methodsFor: 'as yet unclassified' stamp: 'M 11/1/2022 17:38:44'!
move
	
	^self subclassResponsibility.! !


!classDefinition: #East category: 'MarsRover'!
CardinalDirection subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'MarsRover'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'as yet unclassified' stamp: 'M 11/1/2022 17:38:14'!
move

	^ (1@0).! !


!classDefinition: #North category: 'MarsRover'!
CardinalDirection subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'MarsRover'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'as yet unclassified' stamp: 'M 11/1/2022 17:33:37'!
move

	^ (0@1).! !


!classDefinition: #South category: 'MarsRover'!
CardinalDirection subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'MarsRover'!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'as yet unclassified' stamp: 'M 11/1/2022 17:33:42'!
move

	^(0@-1).! !


!classDefinition: #West category: 'MarsRover'!
CardinalDirection subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'MarsRover'!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'as yet unclassified' stamp: 'M 11/1/2022 17:38:29'!
move

	^ (-1@0).! !


!classDefinition: #Rover category: 'MarsRover'!
Object subclass: #Rover
	instanceVariableNames: 'location direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Rover methodsFor: 'as yet unclassified' stamp: 'M 11/1/2022 17:35:26'!
executeMovementCommand: aCommand

	(aCommand = 'f') ifTrue: [location := location + direction move.]
! !

!Rover methodsFor: 'as yet unclassified' stamp: 'M 11/1/2022 17:30:12'!
initializeWithLocation: aPoint towards: aCardinalDirection

	location := aPoint.
	direction := aCardinalDirection.! !


!Rover methodsFor: 'accessing' stamp: 'M 11/1/2022 17:07:02'!
direction
	^ direction.! !

!Rover methodsFor: 'accessing' stamp: 'M 11/1/2022 17:04:30'!
location

	^location.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Rover class' category: 'MarsRover'!
Rover class
	instanceVariableNames: ''!

!Rover class methodsFor: 'as yet unclassified' stamp: 'M 11/1/2022 17:33:13'!
initializeWithLocation: aLocation towards: aCardinalDirection

	^ Rover new initializeWithLocation: aLocation towards: aCardinalDirection.! !
