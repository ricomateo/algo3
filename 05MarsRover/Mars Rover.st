!classDefinition: #Tests category: 'Mars Rover'!
TestCase subclass: #Tests
	instanceVariableNames: 'marsRover south north west east'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Tests methodsFor: 'as yet unclassified' stamp: 'mr 5/30/2022 16:08:07'!
setUp
	marsRover := MarsRover new.
	south := South new.
	north := North new.
	west := West new.
	east := East new.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'mr 5/30/2022 16:08:30'!
test01MarsRoversPositionEquals00WhenCreated

	self assert: marsRover position equals: 0@0.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'mr 5/30/2022 16:10:30'!
test02MarsRoverDirectionIsNorthWhenCreated

	self assert: marsRover direction equals: north direction.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'mr 5/30/2022 16:10:49'!
test03CommandFMovesTheMarsRoverForward

	marsRover  excecuteCommand: 'f'.
	self assert: marsRover position equals: 0@1.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'mr 5/30/2022 16:11:12'!
test04CommandBMovesTheMarsRoverBackwards

	marsRover  excecuteCommand: 'b'.
	self assert: marsRover position equals: 0@-1.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'mr 5/30/2022 16:11:34'!
test05CommandLRotatesTheMarsRover90DegreesToTheLeft

	marsRover excecuteCommand: 'l'.
	self assert: marsRover direction equals: west direction.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'mr 5/30/2022 16:11:54'!
test06CommandLRotatesTheMarsRover90DegreesToTheRight

	marsRover excecuteCommand: 'r'.
	self assert: marsRover direction equals: east direction.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'mr 5/30/2022 16:12:08'!
test07TheMarsRoverReceivesTheSameCommandMultipleTimes

	marsRover excecuteCommand: 'll'.
	self assert: marsRover direction equals: south direction.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'mr 5/30/2022 16:09:11'!
test08TheMarsRoverReceivesMultipleCommandsAtOnce

	marsRover excecuteCommand: 'fflblbrl'.
	self assert: marsRover direction equals: south direction.
	self assert: marsRover position equals: 1@3.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'mr 5/30/2022 16:12:42'!
test09MarsRoverExecutesTheCommandStringUntilInvalidCharacterIsFound

	marsRover excecuteCommand: 'fflblbrlDllffrrbb'.
	self assert: marsRover direction equals: south direction.
	self assert: marsRover position equals: 1@3.! !


!classDefinition: #Direction category: 'Mars Rover'!
Object subclass: #Direction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Direction methodsFor: 'information' stamp: 'nrm 5/27/2022 16:27:11'!
direction
	self subclassResponsibility ! !

!Direction methodsFor: 'information' stamp: 'mr 5/30/2022 16:01:52'!
leftDirection
	self subclassResponsibility ! !

!Direction methodsFor: 'information' stamp: 'mr 5/30/2022 16:02:11'!
rightDirection
	self subclassResponsibility ! !

!Direction methodsFor: 'information' stamp: 'nrm 5/27/2022 16:46:31'!
vectorDirector
	self subclassResponsibility ! !


!classDefinition: #East category: 'Mars Rover'!
Direction subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!East methodsFor: 'information' stamp: 'nrm 5/27/2022 16:17:18'!
direction
	^#(0,0,1,0)! !

!East methodsFor: 'information' stamp: 'mr 5/30/2022 16:01:52'!
leftDirection
	^North new.! !

!East methodsFor: 'information' stamp: 'mr 5/30/2022 16:02:11'!
rightDirection
	^South new! !

!East methodsFor: 'information' stamp: 'nrm 5/27/2022 16:47:01'!
vectorDirector
	^1@0! !


!classDefinition: #North category: 'Mars Rover'!
Direction subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!North methodsFor: 'information' stamp: 'nrm 5/27/2022 16:18:10'!
direction
	^#(1,0,0,0)! !

!North methodsFor: 'information' stamp: 'mr 5/30/2022 16:01:52'!
leftDirection
	^West new.! !

!North methodsFor: 'information' stamp: 'mr 5/30/2022 16:02:11'!
rightDirection
	^East new.! !

!North methodsFor: 'information' stamp: 'nrm 5/27/2022 16:47:18'!
vectorDirector
	^0@1! !


!classDefinition: #South category: 'Mars Rover'!
Direction subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!South methodsFor: 'information' stamp: 'nrm 5/27/2022 16:19:09'!
direction
	^#(0,1,0,0)! !

!South methodsFor: 'information' stamp: 'mr 5/30/2022 16:01:52'!
leftDirection
	^East new.! !

!South methodsFor: 'information' stamp: 'mr 5/30/2022 16:02:11'!
rightDirection
	^West new.! !

!South methodsFor: 'information' stamp: 'nrm 5/27/2022 16:47:40'!
vectorDirector
	^0@-1! !


!classDefinition: #West category: 'Mars Rover'!
Direction subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!West methodsFor: 'information' stamp: 'nrm 5/27/2022 16:23:59'!
direction
	^#(0,0,0,1)! !

!West methodsFor: 'information' stamp: 'mr 5/30/2022 16:01:52'!
leftDirection
	^South new.! !

!West methodsFor: 'information' stamp: 'mr 5/30/2022 16:02:12'!
rightDirection
	^North new.! !

!West methodsFor: 'information' stamp: 'nrm 5/27/2022 16:47:54'!
vectorDirector
	^-1@0! !


!classDefinition: #MarsRover category: 'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction commands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'direction' stamp: 'nrm 5/27/2022 16:20:53'!
direction
	^direction direction.! !


!MarsRover methodsFor: 'commands' stamp: 'nrm 6/2/2022 14:41:10'!
excecuteCommand: aCommandString 
	| characters commandToExecute |
	characters := self convertCommandStringToCommandCollection: aCommandString.
	characters do: [:aCharacter | commandToExecute := commands at: aCharacter.
		commandToExecute value ]! !


!MarsRover methodsFor: 'position' stamp: 'nrm 5/27/2022 15:35:09'!
position
	^position.! !


!MarsRover methodsFor: 'initialization' stamp: 'mr 5/30/2022 15:07:26'!
initialize
	position := 0@0.
	direction := North new.
	commands := Dictionary new.
	self setCommands.
	! !

!MarsRover methodsFor: 'initialization' stamp: 'mr 5/30/2022 15:07:12'!
setCommands

	commands at: $f put: [self moveForward ].
	commands at: $b put: [self moveBackward ].
	commands at: $l put: [self rotateLeft ].
	commands at: $r put: [self rotateRight ]! !


!MarsRover methodsFor: 'private' stamp: 'nrm 6/2/2022 14:40:32'!
convertCommandStringToCommandCollection: aStringToConvert
	| collection |
	collection := OrderedCollection new.
	aStringToConvert do: [:aCharacter| (commands includesKey: aCharacter) ifTrue: [collection addLast: aCharacter ] ifFalse:[^ collection] ].
	^ collection.! !

!MarsRover methodsFor: 'private' stamp: 'mr 5/30/2022 14:57:26'!
moveBackward

	^ position:= position - direction vectorDirector! !

!MarsRover methodsFor: 'private' stamp: 'mr 5/30/2022 14:56:48'!
moveForward

	^ position:= position + direction vectorDirector! !

!MarsRover methodsFor: 'private' stamp: 'mr 5/30/2022 16:01:52'!
rotateLeft

	^ direction:= direction leftDirection! !

!MarsRover methodsFor: 'private' stamp: 'mr 5/30/2022 16:02:12'!
rotateRight

	^ direction:= direction rightDirection! !
