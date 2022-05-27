!classDefinition: #Tests category: 'Mars Rover'!
TestCase subclass: #Tests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Tests methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 15:15:23'!
test01
	|newRover|
	newRover := MarsRover new.
	self assert: newRover position equals: 0@0.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 15:24:36'!
test02
	|newRover|
	newRover := MarsRover new.
	self assert: newRover direction equals: #(1,0,0,0).! !

!Tests methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:38:02'!
test03
	|newRover|
	newRover := MarsRover new.
	newRover  excecuteCommand: 'f'.
	self assert: newRover position equals: 0@1.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:38:13'!
test04
	|newRover|
	newRover := MarsRover new.
	newRover  excecuteCommand: 'b'.
	self assert: newRover position equals: 0@-1.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 15:40:06'!
test05
	|newRover|
	newRover := MarsRover new.
	newRover  excecuteCommand: 'l'.
	self assert: newRover direction equals: #(0,0,0,1).! !

!Tests methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 15:43:06'!
test06
	|newRover|
	newRover := MarsRover new.
	newRover  excecuteCommand: 'r'.
	self assert: newRover direction equals: #(0,0,1,0).! !

!Tests methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:38:33'!
test07
	|newRover|
	newRover := MarsRover new.
	newRover  excecuteCommand: 'fl'.
	self assert: newRover direction equals: #(0,0,0,1).
	self assert: newRover position equals: 0@1.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:05:16'!
test08
	|newRover|
	newRover := MarsRover new.
	newRover  excecuteCommand: 'll'.
	self assert: newRover direction equals: #(0,1,0,0).! !

!Tests methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:39:24'!
test09
	|newRover|
	newRover := MarsRover new.
	newRover  excecuteCommand: 'fflblbrl'.
	self assert: newRover direction equals: #(0,1,0,0).
	self assert: newRover position equals: 1@3.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:50:31'!
test10
	|newRover|
	newRover := MarsRover new.
	newRover  excecuteCommand: 'fflblbrlDllffrrbb'.
	self assert: newRover direction equals: #(0,1,0,0).
	self assert: newRover position equals: 1@3.! !


!classDefinition: #Compass category: 'Mars Rover'!
Object subclass: #Compass
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Compass methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:27:51'!
changeDirectionLeft
	self subclassResponsibility ! !

!Compass methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:31:10'!
changeDirectionRight
	self subclassResponsibility ! !

!Compass methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:27:11'!
direction
	self subclassResponsibility ! !

!Compass methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:46:31'!
vectorDirector
	self subclassResponsibility ! !


!classDefinition: #East category: 'Mars Rover'!
Compass subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!East methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:16:39'!
changeDirectionLeft
	^North new.! !

!East methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:28:49'!
changeDirectionRight
	^South new! !

!East methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:17:18'!
direction
	^#(0,0,1,0)! !

!East methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:47:01'!
vectorDirector
	^1@0! !


!classDefinition: #North category: 'Mars Rover'!
Compass subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!North methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:17:42'!
changeDirectionLeft
	^West new.! !

!North methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:29:16'!
changeDirectionRight
	^East new.! !

!North methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:18:10'!
direction
	^#(1,0,0,0)! !

!North methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:47:18'!
vectorDirector
	^0@1! !


!classDefinition: #South category: 'Mars Rover'!
Compass subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!South methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:18:45'!
changeDirectionLeft
	^East new.! !

!South methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:29:36'!
changeDirectionRight
	^West new.! !

!South methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:19:09'!
direction
	^#(0,1,0,0)! !

!South methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:47:40'!
vectorDirector
	^0@-1! !


!classDefinition: #West category: 'Mars Rover'!
Compass subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!West methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:19:33'!
changeDirectionLeft
	^South new.! !

!West methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:29:50'!
changeDirectionRight
	^North new.! !

!West methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:23:59'!
direction
	^#(0,0,0,1)! !

!West methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:47:54'!
vectorDirector
	^-1@0! !


!classDefinition: #MarsRover category: 'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'position' stamp: 'nrm 5/27/2022 16:20:53'!
direction
	^direction direction.! !

!MarsRover methodsFor: 'position' stamp: 'nrm 5/27/2022 16:55:52'!
excecuteCommand: aCommandString 
	|index auxiliarPosition auxiliarDirection|
	index:=0.
	[index < (aCommandString size)] whileTrue:
	[index:= index + 1.
	auxiliarPosition := position .
	auxiliarDirection := direction .
	(aCommandString at:index)=$f ifTrue: [position:= position + direction vectorDirector ].
	(aCommandString at:index)=$b ifTrue: [position:= position - direction vectorDirector ].
	(aCommandString at:index)=$l ifTrue: [direction:= direction changeDirectionLeft ].
	(aCommandString at:index)=$r ifTrue: [direction:= direction changeDirectionRight].
	((auxiliarPosition = position ) and: (auxiliarDirection = direction )) ifTrue:[index:= aCommandString size.].]! !

!MarsRover methodsFor: 'position' stamp: 'nrm 5/27/2022 15:35:09'!
position
	^position.! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'nrm 5/27/2022 16:20:35'!
initialize
	position := 0@0.
	direction := North new.! !
