!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'mr 6/9/2022 15:20:58'!
test01PortfolioBalanceIsZeroWhenPortfolioIsEmpty
	| portfolios |
	
	portfolios:= Portfolio new.
	
	self assert: 0 equals: portfolios numberOfAccounts.
	self assert: 0*peso equals: portfolios balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'mr 6/9/2022 16:33:59'!
test02WhenAPortfolioContainsAccountsTheBalanceIsTheSumOfTheAccountsBalance
	| account otherAccount portfolios |
	
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	Deposit register: 50*peso on: account .
	Transfer register: 20*peso from: account  to: otherAccount .
	
	portfolios:= Portfolio new.
	portfolios add: account.
	portfolios add: otherAccount .! !

!PortfolioTest methodsFor: 'tests' stamp: 'mr 6/9/2022 16:33:59'!
test03WhenAnAccountInAPortfolioMakesATransactionThePortfolioRegistersIt
	| account otherAccount portfolios deposit |
	
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	
	portfolios:= Portfolio new.
	portfolios add: account.
	portfolios add: otherAccount .
	deposit:= Deposit register: 50*peso on: account .
	
	self assert: (portfolios hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'mr 6/9/2022 16:33:59'!
test04PortfolioCanReturnAllTheTransactionsFromAnAccount
	| account otherAccount portfolios |
	
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	
	portfolios:= Portfolio new.
	portfolios add: account.
	portfolios add: otherAccount .
	Deposit register: 50*peso on: account .
	Withdraw register: 10*peso on: account.
	
	self assert: (portfolios transactionsFrom: account ) equals: account transactions .! !

!PortfolioTest methodsFor: 'tests' stamp: 'mr 6/9/2022 16:33:59'!
test05PortfolioBalanceWorksIfThePortfolioContainsAnotherPortfolio
	| account otherAccount portfolios otherPortfolio|
	
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	
	portfolios:= Portfolio new.
	otherPortfolio := Portfolio new.
	portfolios add: account.
	otherPortfolio add: otherAccount .
	Deposit register: 50*peso on: account .
	Deposit register: 50*peso on: otherAccount.
	portfolios add: otherPortfolio.
	
	self assert: 100*peso equals: portfolios balance.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'mr 6/9/2022 16:33:59'!
test06TheTransactionsFromAnAccountCanBeSearchWithinAPortfolio
	| account otherAccount portfolios otherPortfolio accountSearch |
	
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	
	portfolios:= Portfolio new.
	otherPortfolio := Portfolio new.
	portfolios add: account.
	otherPortfolio add: otherAccount .
	Deposit register: 50*peso on: account .
	Deposit register: 50*peso on: otherAccount.
	portfolios add: otherPortfolio.
	accountSearch := portfolios transactionsFrom: otherAccount.
	
	self assert: accountSearch equals: otherAccount transactions! !

!PortfolioTest methodsFor: 'tests' stamp: 'mr 6/9/2022 16:33:59'!
test07WhenAnAccountInAPortfolioMakesATransactionThePortfolioRegistersItEvenWhenItIsWhitinAnotherPortfolio
	| account otherAccount portfolios otherPortfolio deposit |
	
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	
	portfolios:= Portfolio new.
	otherPortfolio := Portfolio new.
	portfolios add: account.
	otherPortfolio add: otherAccount .
	Deposit register: 50*peso on: account .
	deposit := Deposit register: 50*peso on: otherAccount.
	portfolios add: otherPortfolio.
	
	self assert: (portfolios hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'mr 6/9/2022 16:48:56'!
test08APortfolioCanNotAddTheSameAccountTwice
	| account portfolios |
	
	account := ReceptiveAccount new.
	
	portfolios := Portfolio new.
	portfolios add: account.
	portfolios add: account.
	
	self assert: 1 equals: portfolios numberOfAccounts.! !

!PortfolioTest methodsFor: 'tests' stamp: 'mr 6/9/2022 16:49:36'!
test09APortfolioCanNotAddAnAccountAlreadyIncludedInOtherPortfolioPreviouslyAdded
	| account portfolios otherPortfolios |
	
	account := ReceptiveAccount new.
	
	portfolios := Portfolio new.
	otherPortfolios := Portfolio new.
	otherPortfolios add: account.
	portfolios add: otherPortfolios.
	
	portfolios add: account.
	
	self assert: 1 equals: portfolios numberOfAccounts.! !

!PortfolioTest methodsFor: 'tests' stamp: 'mr 6/9/2022 16:50:07'!
test10APortfolioCanNotIncludeItself
	| account portfolios |
	
	account := ReceptiveAccount new.
	
	portfolios := Portfolio new.
	
	portfolios add: account.
	portfolios add: portfolios.
	
	self assert: 1 equals: portfolios numberOfAccounts.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'mr 6/6/2022 14:47:28'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	account := ReceptiveAccount new.
	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'mr 6/6/2022 14:47:42'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
	
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'mr 6/6/2022 14:47:55'!
test03WithdrawDecreasesBalanceOnTransactionValue 
	| account |
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.

	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'mr 6/6/2022 14:48:09'!
test04WithdrawValueMustBePositive 
	| account withdrawValue |
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'mr 6/6/2022 14:48:20'!
test05ReceptiveAccountKnowsRegisteredTransactions 
	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'mr 6/6/2022 14:48:31'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions
	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'mr 6/6/2022 14:48:43'!
test07AccountKnowsItsTransactions 
	| account deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'mr 6/9/2022 14:36:22'!
test08ATranferIncreasesTheValueOnOneAccountAndDecreasesOnTheOther
	| account otherAccount  |
	
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	Transfer register: 50*peso from: account to: otherAccount.
	
	self assert: 50*peso equals: (otherAccount transactions first) value.
	self assert: 50*peso equals: (account transactions first) value.
	
	self assert: 50*peso equals: otherAccount balance .
	self assert: -50*peso equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'nrm 6/6/2022 20:21:58'!
test09ATransferWithNotPositiveValueFailsToExecute
	| account otherAccount  |
	
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	
	self should: [Transfer register: -50*peso from: account to: otherAccount.]
		raise: [:anError | anError messageText = Transfer invalidValueError].
	
	self assert: 0*peso equals: account balance.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'nrm 6/6/2022 20:19:40'!
test10BothPartsOfATranferKnewEachOther
	| account otherAccount  transactions otherTransactions |
	
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	
	Transfer register: 50*peso from: account to: otherAccount.
	transactions :=	 account transactions.
	otherTransactions :=	 otherAccount transactions.
	self assert: transactions first counterpart equals: otherTransactions first.
	self assert: otherTransactions first counterpart equals: transactions first.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'nrm 6/3/2022 00:25:18'!
value 
	^value ! !

!AccountTransaction methodsFor: 'value' stamp: 'nrm 6/3/2022 00:25:57'!
valueToBalance
	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'initialization' stamp: 'nrm 6/3/2022 00:24:56'!
initializeFor: aValue

	value := aValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'mr 6/6/2022 15:40:28'!
register: aValue on: account
	| transaction |
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'value' stamp: 'nrm 6/3/2022 00:22:59'!
valueToBalance
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'mr 6/6/2022 15:40:14'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferReceiver category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferReceiver
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferReceiver methodsFor: 'counterparts' stamp: 'mr 6/6/2022 16:08:02'!
addCounterpart: aTransferPart
	counterpart := aTransferPart ! !

!TransferReceiver methodsFor: 'counterparts' stamp: 'mr 6/6/2022 16:08:42'!
counterpart
	^counterpart ! !


!TransferReceiver methodsFor: 'value' stamp: 'mr 6/6/2022 16:06:55'!
valueToBalance

	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferReceiver class' category: 'ServiciosFinancieros-Ejercicio'!
TransferReceiver class
	instanceVariableNames: ''!

!TransferReceiver class methodsFor: 'instance creation' stamp: 'mr 6/6/2022 16:24:25'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferSender category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferSender
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferSender methodsFor: 'counterparts' stamp: 'mr 6/6/2022 16:08:11'!
addCounterpart: aTransferPart
	counterpart := aTransferPart ! !

!TransferSender methodsFor: 'counterparts' stamp: 'mr 6/6/2022 16:08:36'!
counterpart
	^counterpart ! !


!TransferSender methodsFor: 'value' stamp: 'mr 6/6/2022 16:06:43'!
valueToBalance
	^value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferSender class' category: 'ServiciosFinancieros-Ejercicio'!
TransferSender class
	instanceVariableNames: ''!

!TransferSender class methodsFor: 'instance creation' stamp: 'mr 6/6/2022 16:24:28'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'value' stamp: 'nrm 6/3/2022 00:22:36'!
valueToBalance
	^value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'mr 6/6/2022 15:52:25'!
for: aValue
	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main protocol' stamp: 'mr 6/9/2022 16:33:59'!
add: aReceptiveAccount

	(self includesAccount: aReceptiveAccount ) ifFalse: [
	accounts addLast: aReceptiveAccount]! !

!Portfolio methodsFor: 'main protocol' stamp: 'mr 6/9/2022 16:36:55'!
balance
	^accounts sum: [:anAccount | anAccount balance] ifEmpty: [0].
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'nrm 6/6/2022 20:47:43'!
hasRegistered: aTransaction
	^accounts anySatisfy: [:anAccount| anAccount hasRegistered: aTransaction ].
! !

!Portfolio methodsFor: 'main protocol' stamp: 'nrm 6/6/2022 20:35:41'!
numberOfAccounts
	^accounts size! !

!Portfolio methodsFor: 'main protocol' stamp: 'mr 6/9/2022 16:34:32'!
transactionsFrom: aReceptiveAccount 
	^(self searchAccount: aReceptiveAccount) transactions .! !


!Portfolio methodsFor: 'private' stamp: 'mr 6/9/2022 16:36:21'!
includesAccount: aReceptiveAccount
	| auxiliaryAccount |
	auxiliaryAccount := self searchAccount: aReceptiveAccount.
	^auxiliaryAccount = aReceptiveAccount.
	! !

!Portfolio methodsFor: 'private' stamp: 'mr 6/9/2022 16:45:47'!
searchAccount: aReceptiveAccount 
	(accounts do: [:anAccount| (anAccount isKindOf: Portfolio)
		ifTrue: [
			^anAccount searchAccount: aReceptiveAccount ]
		ifFalse: [
			(anAccount = aReceptiveAccount ) ifTrue: [^anAccount ]]])
	! !


!Portfolio methodsFor: 'initialization' stamp: 'mr 6/9/2022 16:36:05'!
initialize
	accounts := OrderedCollection 	new.
	! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'mr 6/6/2022 14:48:55'!
initialize
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'nrm 6/6/2022 16:47:50'!
balance
	^transactions sum:[:aTransaction |aTransaction valueToBalance]ifEmpty: [ 0 ].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'mr 6/6/2022 14:47:04'!
hasRegistered: aTransaction
	^ transactions includes: aTransaction
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'mr 6/9/2022 15:55:15'!
register: aTransaction
	transactions add: aTransaction
	
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'mr 6/9/2022 14:58:25'!
transactions
	^ transactions copy! !



!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'nrm 6/6/2022 20:22:09'!
register: aValue from: aReceptiveAccount to: otherReceptiveAccount
	
	| receiver sender |
	
	(aValue <= 0) ifTrue: [self error: self  invalidValueError].
	receiver := TransferReceiver register: aValue on: otherReceptiveAccount. 
	sender := TransferSender register: aValue on: aReceptiveAccount.
	
	receiver addCounterpart: sender.
	sender addCounterpart: receiver.

	! !


!Transfer class methodsFor: 'errors' stamp: 'nrm 6/6/2022 16:58:51'!
invalidValueError
	^'Invalid value error.'! !
