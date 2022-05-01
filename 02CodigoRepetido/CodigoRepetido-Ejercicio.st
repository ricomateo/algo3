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

!CustomerBookTest methodsFor: 'testing' stamp: 'nrm 5/1/2022 18:07:09'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| aCustomerBook |
	aCustomerBook _ CustomerBook new.	
	self assert: (self takesLessThan:(50 * millisecond)  inRunning:[aCustomerBook addCustomerNamed: 'John Lennon'] ).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nrm 5/1/2022 18:07:54'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	|  aCustomerBook aCustomer|
	aCustomerBook _ CustomerBook new.
	aCustomer _ 'Paul McCartney'.
	aCustomerBook addCustomerNamed: aCustomer.
	self assert: (self takesLessThan: (100 * millisecond)  inRunning: [aCustomerBook  removeCustomerNamed: aCustomer]).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nrm 5/1/2022 18:18:13'!
test03CanNotAddACustomerWithEmptyName
	| aCustomerBook |
	aCustomerBook _ CustomerBook new.
	self assert:(self run:[aCustomerBook addCustomerNamed: '']  
	if:Error  
	do: [ :anError |(anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage) and: (aCustomerBook isEmpty) ])
		! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nrm 5/1/2022 18:18:39'!
test04CanNotRemoveAnInvalidCustomer
	| aCustomerBook aCustomer |
	aCustomerBook _ CustomerBook new.
	aCustomer _ 'John Lennon'.
	aCustomerBook addCustomerNamed: aCustomer.
	self assert:( self run:[aCustomerBook removeCustomerNamed: 'Paul McCartney']  
	if:NotFound  
	do: [( aCustomerBook numberOfCustomers = 1)and:(aCustomerBook includesCustomerNamed: aCustomer) ]).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nrm 5/1/2022 18:03:55'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	| aCustomerBook aCustomer |
	aCustomerBook _ CustomerBook new.
	aCustomer _ 'Paul McCartney'.
	aCustomerBook addCustomerNamed: aCustomer.
	aCustomerBook suspendCustomerNamed: aCustomer.
	self assert:( self in:aCustomerBook  verifyNumberOfSuspendedCustomers:1  customerName: aCustomer).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nrm 5/1/2022 18:04:23'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	| aCustomerBook aCustomer |
	aCustomerBook _ CustomerBook new.
	aCustomer _ 'Paul McCartney'.
	aCustomerBook addCustomerNamed: aCustomer.
	aCustomerBook suspendCustomerNamed: aCustomer.
	aCustomerBook removeCustomerNamed: aCustomer.
	self deny:( self in:aCustomerBook  verifyNumberOfSuspendedCustomers:0  customerName: aCustomer).

	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nrm 5/1/2022 18:18:57'!
test07CanNotSuspendAnInvalidCustomer
	| aCustomerBook aCustomer |
	aCustomerBook _ CustomerBook new.
	aCustomer _ 'John Lennon'.
	aCustomerBook addCustomerNamed: aCustomer.
	self assert:(self run:[aCustomerBook suspendCustomerNamed: 'Ringo Starr']
	if:  CantSuspend
	do: [( aCustomerBook numberOfCustomers = 1)and:(aCustomerBook includesCustomerNamed: aCustomer) ])
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nrm 5/1/2022 18:19:04'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	| aCustomerBook aCustomer |
	aCustomerBook _ CustomerBook new.
	aCustomer _ 'John Lennon'.
	aCustomerBook addCustomerNamed: aCustomer.
	aCustomerBook suspendCustomerNamed: aCustomer.
	self assert:(self run:[aCustomerBook suspendCustomerNamed: aCustomer]  
	if:CantSuspend
	do: [( aCustomerBook numberOfCustomers = 1)and:(aCustomerBook includesCustomerNamed: aCustomer) ])
! !


!CustomerBookTest methodsFor: 'auxiliary methods' stamp: 'nrm 5/1/2022 18:00:14'!
in:aCustomerBook verifyNumberOfSuspendedCustomers:expectedNumberOfSuspendedCustomers customerName: aName
	self
		assert: 0
		equals: aCustomerBook numberOfActiveCustomers.
	self
		assert: expectedNumberOfSuspendedCustomers 
		equals: aCustomerBook numberOfSuspendedCustomers.
	self
		assert: expectedNumberOfSuspendedCustomers 
		equals:aCustomerBook numberOfCustomers.
	^(aCustomerBook includesCustomerNamed: aName )! !

!CustomerBookTest methodsFor: 'auxiliary methods' stamp: 'nrm 5/1/2022 18:13:00'!
run: aCheckBlock if:anError do: aValidationBlock
	^[aCheckBlock value. self fail]
	on:anError
	do:aValidationBlock.
	
	! !

!CustomerBookTest methodsFor: 'auxiliary methods' stamp: 'nrm 5/1/2022 18:06:05'!
takesLessThan: amountOfTime inRunning: aBlock
	|aChronometer|	
	aChronometer := Chronometer new.
	aChronometer start.
	aBlock value.
	aChronometer end.
	^(aChronometer duration<amountOfTime )
! !


!classDefinition: #Chronometer category: 'CodigoRepetido-Ejercicio'!
Object subclass: #Chronometer
	instanceVariableNames: 'start end'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!Chronometer methodsFor: 'as yet unclassified' stamp: 'mateo 4/30/2022 18:40:41'!
duration
	^end - start.! !

!Chronometer methodsFor: 'as yet unclassified' stamp: 'mateo 4/30/2022 18:40:20'!
end
	end _ Time millisecondClockValue * millisecond.! !

!Chronometer methodsFor: 'as yet unclassified' stamp: 'mateo 4/30/2022 18:39:53'!
start
	start _ Time millisecondClockValue * millisecond.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'nrm 5/1/2022 17:53:08'!
includesCustomerNamed: aName
	^ (active includes: aName) or: [ suspended includes: aName ].! !

!CustomerBook methodsFor: 'testing'!
isEmpty
	^ active isEmpty and: [ suspended isEmpty ].! !


!CustomerBook methodsFor: 'initialization'!
initialize
	super initialize.
	active _ OrderedCollection new.
	suspended _ OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'nrm 5/1/2022 17:15:32'!
addCustomerNamed: aName
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	active add: aName.! !

!CustomerBook methodsFor: 'customer management'!
numberOfActiveCustomers
	^ active size.! !

!CustomerBook methodsFor: 'customer management'!
numberOfCustomers
	^ active size + suspended size.! !

!CustomerBook methodsFor: 'customer management'!
numberOfSuspendedCustomers
	^ suspended size.! !

!CustomerBook methodsFor: 'customer management' stamp: 'nrm 5/1/2022 17:23:25'!
removeCustomerNamed: aName
	active remove: aName 
	ifAbsent: [suspended remove: aName 
		ifAbsent: [^NotFound signal.]].
	^aName! !

!CustomerBook methodsFor: 'customer management'!
signalCustomerAlreadyExists
	self error: self class customerAlreadyExistsErrorMessage.! !

!CustomerBook methodsFor: 'customer management'!
signalCustomerNameCannotBeEmpty
	self error: self class customerCanNotBeEmptyErrorMessage.! !

!CustomerBook methodsFor: 'customer management' stamp: 'nrm 5/1/2022 17:22:47'!
suspendCustomerNamed: aName
	(active includes: aName) ifFalse: [ ^ CantSuspend signal ].
	active remove: aName.
	suspended add: aName.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages'!
customerAlreadyExistsErrorMessage
	^ 'Customer Already Exists'.! !

!CustomerBook class methodsFor: 'error messages'!
customerCanNotBeEmptyErrorMessage
	^ 'Customer Name Cannot Be Empty'.! !
