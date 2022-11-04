!classDefinition: #Tests category: 'MarsRover'!
TestCase subclass: #Tests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Tests methodsFor: 'assertions' stamp: 'M 11/3/2022 19:26:23'!
assertNewRoverInLocation: aStartingLocation Pointing: aCardinalDirection movedTo: aFinalLocation afterCommand: aStringCommandSequence

	|rover|
	
	rover := Rover initializeWithLocation: aStartingLocation towards: aCardinalDirection.
	rover executeStringCommandSequence: aStringCommandSequence.
	self assert: rover location = aFinalLocation.! !

!Tests methodsFor: 'assertions' stamp: 'M 11/3/2022 19:32:26'!
assertNewRoverPointing: inicialCardinalDirection faces: newCardinalDirection afterStringCommand: aStringCommand

	|rover|
	
	rover := Rover initializeWithLocation: 0@0 towards: inicialCardinalDirection.
	rover executeStringCommandSequence: aStringCommand.
	self assert: rover direction = newCardinalDirection.! !


!Tests methodsFor: 'testing' stamp: 'M 11/3/2022 19:29:36'!
test01RoversLocationIsTheSameAfterEmptyCommand

	self assertNewRoverInLocation: 0@0 Pointing: North  movedTo: 0@0  afterCommand: ''.! !

!Tests methodsFor: 'testing' stamp: 'M 11/3/2022 19:33:10'!
test02RoverDirectionIsTheSameAfterEmptyCommand

	self assertNewRoverPointing: North faces: North afterStringCommand: ''.
! !

!Tests methodsFor: 'testing' stamp: 'M 11/3/2022 19:37:41'!
test03RoverPointingNorthMovesNorthAfterForwardCommand

	self assertNewRoverInLocation: 0@0 Pointing: North  movedTo: 0@1  afterCommand: 'f'.
! !

!Tests methodsFor: 'testing' stamp: 'M 11/3/2022 19:37:34'!
test04RoverPointingSouthMovesSouthAfterForwardCommand

	self assertNewRoverInLocation: -46@86 Pointing: South movedTo: -46@85  afterCommand: 'f'.
! !

!Tests methodsFor: 'testing' stamp: 'M 11/3/2022 19:37:29'!
test05RoverPointingEastMovesEastAfterForwardCommand

	self assertNewRoverInLocation: -827@-273 Pointing: East movedTo: -826@-273  afterCommand: 'f'.
! !

!Tests methodsFor: 'testing' stamp: 'M 11/3/2022 19:37:22'!
test06RoverPointingWestMovesWestAfterForwardCommand

	self assertNewRoverInLocation: 100@0 Pointing: West movedTo: 99@0  afterCommand: 'f'.
! !

!Tests methodsFor: 'testing' stamp: 'M 11/3/2022 19:37:58'!
test07RoverPointingEastMovesWestAfterSingleBackCommand

	self assertNewRoverInLocation: 0@0 Pointing: East movedTo: -1@0  afterCommand: 'b'.! !

!Tests methodsFor: 'testing' stamp: 'M 11/3/2022 19:37:04'!
test08RoverMovesCorrectlyAfterSeveralEqualCommands

	self assertNewRoverInLocation: 0@0 Pointing: South movedTo: 0@5  afterCommand: 'bbbbb'.! !

!Tests methodsFor: 'testing' stamp: 'M 11/3/2022 19:38:53'!
test09RoverMovesCorrectlyAfterSeveralDifferentCommands

	self assertNewRoverInLocation: 0@0 Pointing: West movedTo: -1@0  afterCommand: 'bbfbfff'.! !

!Tests methodsFor: 'testing' stamp: 'M 11/3/2022 19:45:31'!
test10RoverPointingNorthChangesDirectionEastAfterOneRotateRightCommand

	self assertNewRoverPointing: North faces: East afterStringCommand: 'r'.! !

!Tests methodsFor: 'testing' stamp: 'M 11/3/2022 20:20:57'!
test11RoverPointingWestChangesDirectionNorthAfterThreeRotateLeftCommand

	self assertNewRoverPointing: West faces: North afterStringCommand: 'lll'.! !

!Tests methodsFor: 'testing' stamp: 'M 11/3/2022 20:51:04'!
test12RoverRemainsUnchangedAfterInvalidCommand

	self assertNewRoverInLocation: 0@0 Pointing: North movedTo: 0@0 afterCommand: 'affb'.! !


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

!CardinalDirection class methodsFor: 'as yet unclassified' stamp: 'M 11/3/2022 19:51:55'!
ninetyDegreesLeft

	self subclassResponsibility.! !

!CardinalDirection class methodsFor: 'as yet unclassified' stamp: 'M 11/3/2022 19:44:50'!
ninetyDegreesRight

	self subclassResponsibility.! !

!CardinalDirection class methodsFor: 'as yet unclassified' stamp: 'M 11/3/2022 18:41:31'!
versor
	
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

!East class methodsFor: 'as yet unclassified' stamp: 'M 11/3/2022 19:59:10'!
ninetyDegreesLeft

	^North.! !

!East class methodsFor: 'as yet unclassified' stamp: 'M 11/3/2022 19:43:52'!
ninetyDegreesRight

	^South.! !

!East class methodsFor: 'as yet unclassified' stamp: 'M 11/3/2022 18:41:31'!
versor

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

!North class methodsFor: 'as yet unclassified' stamp: 'M 11/3/2022 19:59:20'!
ninetyDegreesLeft

	^West.! !

!North class methodsFor: 'as yet unclassified' stamp: 'M 11/3/2022 19:44:03'!
ninetyDegreesRight

	^East.! !

!North class methodsFor: 'as yet unclassified' stamp: 'M 11/3/2022 18:41:31'!
versor

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

!South class methodsFor: 'as yet unclassified' stamp: 'M 11/3/2022 20:19:05'!
ninetyDegreesLeft

	^West.! !

!South class methodsFor: 'as yet unclassified' stamp: 'M 11/3/2022 19:44:10'!
ninetyDegreesRight

	^West.! !

!South class methodsFor: 'as yet unclassified' stamp: 'M 11/3/2022 18:41:31'!
versor

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

!West class methodsFor: 'as yet unclassified' stamp: 'M 11/3/2022 20:19:14'!
ninetyDegreesLeft

	^North.! !

!West class methodsFor: 'as yet unclassified' stamp: 'M 11/3/2022 19:44:26'!
ninetyDegreesRight

	^North.! !

!West class methodsFor: 'as yet unclassified' stamp: 'M 11/3/2022 18:41:31'!
versor

	^ (-1@0).! !


!classDefinition: #Rover category: 'MarsRover'!
Object subclass: #Rover
	instanceVariableNames: 'location direction commands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Rover methodsFor: 'initialization' stamp: 'CDN 11/4/2022 00:10:53'!
initializeWithLocation: aPoint towards: aCardinalDirection

	location := aPoint.
	direction := aCardinalDirection.
	
	commands := Dictionary new.
	
	self initializeCommands.! !


!Rover methodsFor: 'accessing' stamp: 'M 11/1/2022 17:07:02'!
direction
	^ direction.! !

!Rover methodsFor: 'accessing' stamp: 'M 11/1/2022 17:04:30'!
location

	^location.! !


!Rover methodsFor: 'commands' stamp: 'M 11/3/2022 20:45:06'!
executeStringCommandSequence: aStringCommandSequence

	(aStringCommandSequence size = 0) ifFalse: [
	(self executeSingleCharacterCommand: (String with: aStringCommandSequence first)) ifFalse: [^nil].
	self executeStringCommandSequence: (aStringCommandSequence allButFirst).
	].! !


!Rover methodsFor: 'private' stamp: 'CDN 11/4/2022 00:09:55'!
executeSingleCharacterCommand: aStringCommand

	(aStringCommand = 'f' or: aStringCommand = 'b' or: aStringCommand = 'r' or: aStringCommand = 'l') ifFalse: [^false].
	(commands at: aStringCommand) value.
	
	^true.! !

!Rover methodsFor: 'private' stamp: 'CDN 11/4/2022 00:10:36'!
initializeCommands

	commands at: 'f' put: [location := location + direction versor].
	commands at: 'b' put: [location := location - direction versor].
	commands at: 'r' put: [direction := direction ninetyDegreesRight].
	commands at: 'l' put: [direction := direction ninetyDegreesLeft].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Rover class' category: 'MarsRover'!
Rover class
	instanceVariableNames: ''!

!Rover class methodsFor: 'as yet unclassified' stamp: 'M 11/1/2022 17:33:13'!
initializeWithLocation: aLocation towards: aCardinalDirection

	^ Rover new initializeWithLocation: aLocation towards: aCardinalDirection.! !
