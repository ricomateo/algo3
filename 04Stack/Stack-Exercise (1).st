!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'mr 5/16/2022 16:18:51'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'mr 5/16/2022 16:15:36'!
test11CanNotPushWhenStackIsFull
	| stack  |
	
	stack := OOStack withLimit: 3.
	stack push: 'something'.
	stack push: 'hola'.
	stack push: 'chau'.
	
	self
		should: [ stack push: 'hola' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackFullErrorDescription ]! !

!OOStackTest methodsFor: 'test' stamp: 'mr 5/16/2022 16:16:34'!
test12LimitedStackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack withLimit: 2.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'mr 5/16/2022 16:17:35'!
test13PushAddElementsToTheLimitedStack

	| stack |
	
	stack := OOStack withLimit: 2.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'mr 5/16/2022 16:18:07'!
test14PopRemovesElementsFromTheLimitedStack

	| stack |
	
	stack := OOStack withLimit: 2.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'mr 5/16/2022 16:19:13'!
test15TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack withLimit: 2.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.! !

!OOStackTest methodsFor: 'test' stamp: 'mr 5/16/2022 16:19:47'!
test16LimitedStackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack withLimit: 2.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty ! !



!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'mr 5/15/2022 17:15:37'!
test01NoSentencesFoundInStack
	| stack sentenceFinder sentences |
	stack := OOStack new.
	stack push: 'the winter is ...'.
	stack push: 'the winter'.
	stack push: 'the'.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	sentences := sentenceFinder find: 'wint'.
	self assert: 0 equals: sentences size.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'mr 5/12/2022 16:40:30'!
test02SentencesFoundInStack
	| stack sentenceFinder sentences |
	stack := OOStack new.
	stack push: 'Winter'.
	stack push: 'hola'.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	sentences := sentenceFinder find: 'Wint'.
	self assert: sentences size equals: 1.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'mr 5/12/2022 16:33:39'!
test03NoSentencesFoundInStackWhenStackIsEmpty
	| stack sentenceFinder sentences |
	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	sentences := sentenceFinder find: 'Wint'.
	self assert: sentences size equals: 0.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'nrm 5/15/2022 16:09:03'!
test04FinderShouldFailWhenWrongPrefixGiven
	| stack sentenceFinder |
	stack := OOStack new.
	stack push:'winter'.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	self
		should: [ sentenceFinder find: 'w int' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefix ]
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'nrm 5/15/2022 16:09:29'!
test05FinderShouldFailWhenNoPrefixGiven
	| stack sentenceFinder |
	stack := OOStack new.
	stack push:'winter'.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	self
		should: [ sentenceFinder find: '' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefix ]! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'nrm 5/15/2022 16:11:12'!
test06FinderShouldFailWhenWrongPrefixTypeGiven
	| stack sentenceFinder |
	stack := OOStack new.
	stack push:'winter'.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	self
		should: [ sentenceFinder find: 1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefix ]! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'nrm 5/15/2022 16:24:11'!
test07NoSentencesFoundInStackBeacuseOfCaseSensitive
	| stack sentenceFinder sentences |
	stack := OOStack new.
	stack push: 'winter'.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	sentences := sentenceFinder find: 'Wint'.
	self assert: sentences size equals: 0.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'nrm 5/15/2022 16:28:24'!
test08StackNotModifiedWhenSearchingForSentences
	| stack sentenceFinder sentences |
	stack := OOStack new.
	stack push: 'Winter'.
	stack push: 'hola'.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	sentences := sentenceFinder find: 'Wint'.
	self assert: sentences size equals: 1.
	self assert: sentenceFinder stack = stack! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack state limit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'mr 5/16/2022 15:45:07'!
initialize
	stack := OrderedCollection new.
	state := Empty new.
	limit := -1.
! !

!OOStack methodsFor: 'initialization' stamp: 'mr 5/16/2022 16:06:01'!
initializeWithLimit: aStackLimit
	stack := OrderedCollection new.
	state := Empty new.
	limit := aStackLimit! !


!OOStack methodsFor: 'stack operations' stamp: 'nrm 5/12/2022 21:04:55'!
isEmpty
	^self size = 0.! !

!OOStack methodsFor: 'stack operations' stamp: 'mr 5/15/2022 17:41:41'!
pop
	state canPop: self.
	state := (State stateIfPop: self size) new.
	^stack removeLast.! !

!OOStack methodsFor: 'stack operations' stamp: 'mr 5/16/2022 16:05:12'!
push: anObjectToPush
	state canPush: self.
	state := (State stateIfPush: self size limit: limit) new.
	stack addLast: anObjectToPush.! !

!OOStack methodsFor: 'stack operations' stamp: 'mr 5/12/2022 14:41:42'!
size
	^stack size.! !

!OOStack methodsFor: 'stack operations' stamp: 'nrm 5/12/2022 21:10:32'!
top
	state canTop: self.
	^stack at: stack size.! !


!OOStack methodsFor: 'private' stamp: 'mr 5/12/2022 15:04:11'!
signalStackEmptyErrorDescription
	self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'private' stamp: 'mr 5/16/2022 15:37:42'!
signalStackFullErrorDescription
	self error: self class stackFullErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'mr 5/12/2022 14:49:35'!
stackEmptyErrorDescription
	^'Stack is empty'.! !

!OOStack class methodsFor: 'error descriptions' stamp: 'mr 5/16/2022 15:38:09'!
stackFullErrorDescription
	'Stack is full.'! !


!OOStack class methodsFor: 'as yet unclassified' stamp: 'mr 5/16/2022 16:16:00'!
withLimit: aStackLimit
	^OOStack new initializeWithLimit: aStackLimit.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack sentencesFound'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'sentence finder operations' stamp: 'mr 5/15/2022 18:16:03'!
find: aPrefix
	
	self isAValidPrefix: aPrefix.
	^self filterInCollection: aPrefix! !

!SentenceFinderByPrefix methodsFor: 'sentence finder operations' stamp: 'nrm 5/15/2022 16:29:22'!
stack
	^stack.! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'mr 5/12/2022 16:29:09'!
initializeWith: aStackWithStrings
	stack := aStackWithStrings.
	sentencesFound := OrderedCollection new.
	! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'mr 5/15/2022 18:13:14'!
assertPrefixHasSpace: aPrefix.
	^aPrefix includesSubString: ' '.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'mr 5/15/2022 18:12:35'!
assertPrefixIsEmpty: aPrefix.
	^aPrefix = ''.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'mr 5/15/2022 18:12:13'!
assertPrefixIsString: aPrefix.
	^aPrefix isKindOf: String.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'mr 5/15/2022 16:53:25'!
copyStackToAnOrderedCollection
	| anAuxiliaryStack collectionWithStackContent |
	anAuxiliaryStack := stack.
	collectionWithStackContent := OrderedCollection new.
	stack size timesRepeat: [
		collectionWithStackContent add: anAuxiliaryStack pop ].
	^collectionWithStackContent.
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'mr 5/15/2022 17:14:45'!
filterInCollection: aPrefix
	| auxiliaryCollection |
	auxiliaryCollection := self copyStackToAnOrderedCollection.
	sentencesFound := auxiliaryCollection select: [:aString | aString beginsWith: aPrefix].
	^sentencesFound.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'mr 5/15/2022 18:15:29'!
isAValidPrefix: aPrefix
	(self assertPrefixIsString: aPrefix) ifTrue:[
	((self assertPrefixIsEmpty: aPrefix) or:
	(self assertPrefixHasSpace: aPrefix)) ifTrue: [self signalInvalidPrefix ]]
	ifFalse: [self signalInvalidPrefix ].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'mr 5/12/2022 16:36:34'!
signalInvalidPrefix.
	self error: self class invalidPrefix.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'mr 5/12/2022 16:36:57'!
invalidPrefix
	'Invalid prefix.'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'mr 5/12/2022 15:49:58'!
with: aStackWithStrings
	
	^self new initializeWith: aStackWithStrings.! !


!classDefinition: #State category: 'Stack-Exercise'!
Object subclass: #State
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!State methodsFor: 'as yet unclassified' stamp: 'nrm 5/12/2022 20:53:45'!
canPop: aStack
	self subclassResponsibility ! !

!State methodsFor: 'as yet unclassified' stamp: 'mr 5/16/2022 15:32:20'!
canPush: aStack
	self subclassResponsibility.! !

!State methodsFor: 'as yet unclassified' stamp: 'mr 5/16/2022 15:31:44'!
canTop: astack
 	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'State class' category: 'Stack-Exercise'!
State class
	instanceVariableNames: ''!

!State class methodsFor: 'as yet unclassified' stamp: 'nrm 5/15/2022 16:01:45'!
isAValidStateForThisSize: aSizeValue
	self subclassResponsibility.! !

!State class methodsFor: 'as yet unclassified' stamp: 'mr 5/16/2022 15:54:30'!
isAValidStateForThisSize: aSizeValue andThisLimit: aStackLimit
	self subclassResponsibility.! !

!State class methodsFor: 'as yet unclassified' stamp: 'nrm 5/15/2022 16:04:30'!
stateIfPop: aSizeValue
	^(self subclasses) detect: [:aSubclass|aSubclass isAValidStateForThisSize: (aSizeValue-1)].
	! !

!State class methodsFor: 'as yet unclassified' stamp: 'mr 5/16/2022 15:47:58'!
stateIfPush: aSizeValue
	^(self subclasses) detect: [:aSubclass|aSubclass isAValidStateForThisSize: (aSizeValue + 1)].! !

!State class methodsFor: 'as yet unclassified' stamp: 'mr 5/16/2022 15:53:57'!
stateIfPush: aSizeValue limit: aStackLimit
	^(self subclasses) detect: [:aSubclass | aSubclass isAValidStateForThisSize: (aSizeValue + 1) andThisLimit: aStackLimit].! !


!classDefinition: #Empty category: 'Stack-Exercise'!
State subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Empty methodsFor: 'as yet unclassified' stamp: 'nrm 5/15/2022 15:49:59'!
canPop: aStack
	aStack signalStackEmptyErrorDescription.
	! !

!Empty methodsFor: 'as yet unclassified' stamp: 'mr 5/16/2022 15:32:50'!
canPush: aStack
	! !

!Empty methodsFor: 'as yet unclassified' stamp: 'nrm 5/12/2022 20:56:21'!
canTop: aStack
	aStack signalStackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Empty class' category: 'Stack-Exercise'!
Empty class
	instanceVariableNames: ''!

!Empty class methodsFor: 'as yet unclassified' stamp: 'nrm 5/15/2022 16:03:25'!
isAValidStateForThisSize: aSizeValue
	^aSizeValue = 0
	! !

!Empty class methodsFor: 'as yet unclassified' stamp: 'mr 5/16/2022 15:54:56'!
isAValidStateForThisSize: aSizeValue andThisLimit: aStackLimit
	^false.
	! !


!classDefinition: #Full category: 'Stack-Exercise'!
State subclass: #Full
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Full methodsFor: 'as yet unclassified' stamp: 'mr 5/16/2022 15:31:58'!
canPop: aStack! !

!Full methodsFor: 'as yet unclassified' stamp: 'mr 5/16/2022 16:06:53'!
canPush: aStack
	aStack signalStackFullErrorDescription.! !

!Full methodsFor: 'as yet unclassified' stamp: 'mr 5/16/2022 15:32:02'!
canTop: aStack! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Full class' category: 'Stack-Exercise'!
Full class
	instanceVariableNames: ''!

!Full class methodsFor: 'as yet unclassified' stamp: 'mr 5/16/2022 15:41:14'!
isAValidStateForThisSize: aSizeValue
	^false.! !

!Full class methodsFor: 'as yet unclassified' stamp: 'mr 5/16/2022 15:55:21'!
isAValidStateForThisSize: aSizeValue andThisLimit: aStackLimit
	^aSizeValue = aStackLimit.! !


!classDefinition: #Loaded category: 'Stack-Exercise'!
State subclass: #Loaded
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Loaded methodsFor: 'as yet unclassified' stamp: 'nrm 5/15/2022 15:50:08'!
canPop: aStack
	! !

!Loaded methodsFor: 'as yet unclassified' stamp: 'mr 5/16/2022 15:34:05'!
canPush: aStack! !

!Loaded methodsFor: 'as yet unclassified' stamp: 'nrm 5/15/2022 15:39:55'!
canTop: aStack
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Loaded class' category: 'Stack-Exercise'!
Loaded class
	instanceVariableNames: ''!

!Loaded class methodsFor: 'as yet unclassified' stamp: 'mr 5/16/2022 15:40:39'!
isAValidStateForThisSize: aSizeValue
	^aSizeValue > 0.! !

!Loaded class methodsFor: 'as yet unclassified' stamp: 'mr 5/16/2022 15:55:58'!
isAValidStateForThisSize: aSizeValue andThisLimit: aStackLimit
	^aSizeValue < aStackLimit or: aStackLimit = -1.! !
