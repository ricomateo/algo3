!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #PortfolioTreePrinterTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinterTest methodsFor: 'test' stamp: 'nrm 6/16/2022 16:49:56'!
test01ThePotfolioTreePrinterOnlyPrintsThePortfolioNameIFThePortfolioIsEmpty
	| familyPortfolio report |
	familyPortfolio := Portfolio named: 'Portfolio de la familia'.
	report := PortfolioTreePrinter for: familyPortfolio.
	self assert: report message equals: (OrderedCollection with: 'Portfolio de la familia')! !

!PortfolioTreePrinterTest methodsFor: 'test' stamp: 'nrm 6/16/2022 16:51:19'!
test02ThePorfolioTreePrinterPrintsTheNameOfAllTheReceptiveAccountsInPortfolio
	| familyPortfolio report account expectedReport |
	account := ReceptiveAccount named: 'Cuenta de Juan'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: account.
	report := PortfolioTreePrinter for: familyPortfolio.
	expectedReport := OrderedCollection new.
	expectedReport
		addLast: 'Portfolio de la familia';
		addLast: '	Cuenta de Juan'.
	self assert: report message equals: expectedReport.! !

!PortfolioTreePrinterTest methodsFor: 'test' stamp: 'nrm 6/16/2022 16:52:32'!
test03ThePortfolioTreePrinterAlsoPrintsPorfoliosInsedeTheMainPortfolio
	| familyPortfolio report account expectedReport sonPortfolio |
	account := ReceptiveAccount named: 'Cuenta de Juan'.
	sonPortfolio := Portfolio named: 'Portfolio de hijo' with: account. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with:sonPortfolio.
	report := PortfolioTreePrinter for: familyPortfolio.
	expectedReport := OrderedCollection new.
	expectedReport
		addLast: 'Portfolio de la familia';
		addLast: '	Portfolio de hijo';
		addLast: '		Cuenta de Juan'.
	self assert: report message equals: expectedReport.! !

!PortfolioTreePrinterTest methodsFor: 'test' stamp: 'nrm 6/16/2022 16:55:05'!
test04ThePortfolioTreePrinterWorksWithMultiplereceptiveAccountsAndPortfolios
	| familyPortfolio report expectedReport angiesAccount childrenPortfolio johnsAccount myAccount |
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	report := PortfolioTreePrinter for: familyPortfolio.
	expectedReport := OrderedCollection new.
	expectedReport
		addLast: 'Portfolio de la familia';
		addLast: '	Cuenta mia';
		addLast: '	Portfolio de hijos';
     		addLast: '		Cuenta de Juan';
      		addLast: '		Cuenta de Angeles'.
	self assert: report message equals: expectedReport.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #SummaryReportTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #SummaryReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!SummaryReportTest methodsFor: 'test' stamp: 'nrm 6/13/2022 20:12:59'!
test01WhenAnAccountHasNoTransactionsMessageOnlyContainsBalance
	|account report|
	account := ReceptiveAccount new.
	report:= SummaryReport for: account.
	self assert: report message first equals: 'Balance = 0 * pesos'.! !

!SummaryReportTest methodsFor: 'test' stamp: 'mr 6/16/2022 11:21:20'!
test02WhenAnAccountHasRegisteredADepositItAppearsInTheAccountSummary
	|account report expectedReport |
	account := ReceptiveAccount new.
	Deposit register: 50*peso on: account.
	expectedReport := OrderedCollection new.
	expectedReport
				addLast: 'Deposito por 50 * pesos';
				addLast: 'Balance = 50 * pesos'.
	
	report:= SummaryReport for: account.
	self assert: report message equals: expectedReport.! !

!SummaryReportTest methodsFor: 'test' stamp: 'mr 6/16/2022 11:21:45'!
test03WhenAnAccountHasRegisteredAWithdrawItAppearsInTheAccountSummary
	|account report expectedReport |
	account := ReceptiveAccount new.
	Withdraw register: 50*peso on: account.
	expectedReport := OrderedCollection new.
	expectedReport
				addLast: 'Extraccion por 50 * pesos';
				addLast: 'Balance = -50 * pesos'.
	
	report:= SummaryReport for: account.
	self assert: report message equals: expectedReport.! !

!SummaryReportTest methodsFor: 'test' stamp: 'mr 6/16/2022 11:22:52'!
test04WhenAnAccountTransfersToAnotherAccountItAppearsInTheAccountSummary
	|account report expectedReport otherAccount |
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	Transfer amount: 100*peso from: account to: otherAccount.
	expectedReport := OrderedCollection new.
	expectedReport
				addLast: 'Salida por transferencia de 100 * pesos';
				addLast: 'Balance = -100 * pesos'.
				
	report:= SummaryReport for: account.
	self assert: report message equals: expectedReport.! !

!SummaryReportTest methodsFor: 'test' stamp: 'mr 6/16/2022 11:23:22'!
test05WhenAnAccountReceivesATransferFromAnotherAccountItAppearsInTheAccountSummary
	|account report expectedReport otherAccount |
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	Transfer amount: 100*peso from: account to: otherAccount.
	expectedReport := OrderedCollection new.
	expectedReport
				addLast: 'Entrada por transferencia de 100 * pesos';
				addLast: 'Balance = 100 * pesos'.
				
	report:= SummaryReport for: otherAccount.
	self assert: report message equals: expectedReport.! !

!SummaryReportTest methodsFor: 'test' stamp: 'mr 6/16/2022 11:23:58'!
test06WhenAnAccountHasRegisteredMultipleTransactionsAllOfThemAppearInTheAccountSummary
	|account report expectedReport otherAccount |
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	Deposit register: 50*peso on: account.
	Withdraw register: 50*peso on: account.
	Transfer amount: 100*peso from: account to: otherAccount.
	Transfer amount: 100*peso from: otherAccount to: account.
	expectedReport := OrderedCollection new.
	expectedReport
				addLast: 'Deposito por 50 * pesos';
				addLast: 'Extraccion por 50 * pesos';
				addLast: 'Salida por transferencia de 100 * pesos';
				addLast: 'Entrada por transferencia de 100 * pesos';
				addLast: 'Balance = 0 * pesos'.
				
	report:= SummaryReport for: account.
	self assert: report message equals: expectedReport.! !

!SummaryReportTest methodsFor: 'test' stamp: 'mr 6/16/2022 11:19:57'!
test07APortfolioCanHaveASummaryreport
    |account report expectedReport otherAccount portfolio |
    account := ReceptiveAccount new.
    otherAccount := ReceptiveAccount new.
    portfolio := Portfolio with:account  with: otherAccount .
    Transfer amount: 100*peso from: account to: otherAccount.
    Transfer amount: 20*peso from: otherAccount to: account.
    expectedReport := OrderedCollection new.
    expectedReport
                addLast: 'Salida por transferencia de 100 * pesos';
                addLast: 'Entrada por transferencia de 20 * pesos';
                addLast: 'Entrada por transferencia de 100 * pesos';
                addLast: 'Salida por transferencia de 20 * pesos' ;
                addLast: 'Balance = 0 * pesos'.

    report:= SummaryReport for: portfolio .
    self assert: report message equals: expectedReport.! !


!classDefinition: #TransferNetReportTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferNetReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNetReportTest methodsFor: 'tests' stamp: 'mr 6/16/2022 11:25:40'!
test01WhenAnAccountHasNoTranfersTranferNetIs0
	|account report |
	account := ReceptiveAccount new.
	report := TransferNetReport for: account.
	
	self assert: report message equals: 'El reporte neto de transferencias es 0 * pesos'.! !

!TransferNetReportTest methodsFor: 'tests' stamp: 'mr 6/16/2022 11:31:20'!
test02WhenAnAccountHasTransferedToAnotherAccountItAffectsTheTransferNet
	|account report otherAccount |
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	Transfer amount: 100*peso from: account to: otherAccount.
	report := TransferNetReport for: account.
	
	self assert: report message equals: 'El reporte neto de transferencias es -100 * pesos'.! !

!TransferNetReportTest methodsFor: 'tests' stamp: 'mr 6/16/2022 11:31:52'!
test03WhenAnAccountHasReceivedATransferFromAnotherAccountItAffectsTheTransferNet
	|account report otherAccount |
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	Transfer amount: 100*peso from: account to: otherAccount.
	report := TransferNetReport for: otherAccount.
	
	self assert: report message equals: 'El reporte neto de transferencias es 100 * pesos'.! !

!TransferNetReportTest methodsFor: 'tests' stamp: 'mr 6/16/2022 11:36:25'!
test04WhenAnAccountHasMultipleTransfersAllOfThemAffectTheTransferNet
	|account report otherAccount |
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	Transfer amount: 100*peso from: account to: otherAccount.
	Transfer amount: 20*peso from: otherAccount to: account.	
	report := TransferNetReport for: account .
	
	self assert: report message equals: 'El reporte neto de transferencias es -80 * pesos'.! !

!TransferNetReportTest methodsFor: 'tests' stamp: 'mr 6/16/2022 11:34:19'!
test05WhenAnAccountHasRegisteredADepositItDoesNotAffectTheTransferNet
	|account report |
	account := ReceptiveAccount new.
	Deposit register: 80*peso on: account.
	report := TransferNetReport for: account .
	
	self assert: report message equals: 'El reporte neto de transferencias es 0 * pesos'.! !

!TransferNetReportTest methodsFor: 'tests' stamp: 'mr 6/16/2022 11:34:38'!
test06WhenAnAccountHasRegisteredAWithdrawItDoesNotAffectTheTransferNet
	|account report |
	account := ReceptiveAccount new.
	Withdraw register: 80*peso on: account.
	report := TransferNetReport for: account .
	
	self assert: report message equals: 'El reporte neto de transferencias es 0 * pesos'.! !

!TransferNetReportTest methodsFor: 'tests' stamp: 'mr 6/16/2022 11:34:57'!
test07TranferNetAlsoWorksInPortfolio
	|account report otherAccount portfolio |
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	portfolio:= Portfolio with: account .
	Deposit register: 80*peso on: account.
	Transfer amount: 100*peso from: account to: otherAccount.
	Transfer amount: 20*peso from: otherAccount to: account.	
	report := TransferNetReport for: portfolio.
	
	self assert: report message equals: 'El reporte neto de transferencias es -80 * pesos'.! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'mr 6/16/2022 12:21:11'!
initializeNamed: aName
	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := aName.! !


!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'mr 6/16/2022 12:37:47'!
name
	^name! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'nrm 6/16/2022 16:34:15'!
accept: aVisitor
	^aVisitor visitPortfolio: self tabs: 1! !

!Portfolio methodsFor: 'private' stamp: 'mr 6/16/2022 12:36:09'!
accounts
	^accounts copy.! !

!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!Portfolio class methodsFor: 'instance creation' stamp: 'mr 6/16/2022 12:20:29'!
named: aName 
	^self new initializeNamed: aName.! !

!Portfolio class methodsFor: 'instance creation' stamp: 'mr 6/16/2022 12:30:54'!
named: aName with: anAccount

	^self new initializeNamed: aName;
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'nrm 6/16/2022 14:18:53'!
named: aName with: anAccount with: anotherAccount 
	^self new initializeNamed: aName;
		add: anAccount;
		add: anotherAccount;
	 	yourself ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'mr 6/16/2022 12:28:14'!
initializeNamed: aName 
	super initialize.
	transactions := OrderedCollection new.
	name := aName.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'mr 6/12/2022 16:15:28'!
balance

	^transactions 
		inject: 0*peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'mr 6/16/2022 12:38:49'!
name
	^name! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'nrm 6/16/2022 16:33:42'!
accept: aVisitor
	^aVisitor visitReceptiveAccount: self tabs: 1! !

!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'mr 6/16/2022 12:27:46'!
named: aName
	^self new initializeNamed: aName ! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'private' stamp: 'mr 6/16/2022 11:49:00'!
accept: aVisitor
	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'private' stamp: 'mr 6/16/2022 11:44:35'!
accept: aVisitor
	^aVisitor visitDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'private' stamp: 'mr 6/16/2022 11:52:13'!
accept: aVisitor
	^aVisitor visitTransferDepositLeg: self.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'private' stamp: 'mr 6/16/2022 11:52:29'!
accept: aVisitor
	^aVisitor visitTransferWithdrawLeg: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'private' stamp: 'mr 6/16/2022 11:51:56'!
accept: aVisitor
	^aVisitor visitWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Report category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Report
	instanceVariableNames: 'account message'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Report methodsFor: 'initialization' stamp: 'nrm 6/12/2022 17:04:30'!
initializeWith: anAccount
	self subclassResponsibility ! !


!Report methodsFor: 'main Protocol' stamp: 'nrm 6/12/2022 17:04:51'!
message
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'ServiciosFinancieros-Solucion'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'instance creation' stamp: 'nrm 6/12/2022 17:05:35'!
for: anAccount
	^self new initializeWith: anAccount.
	! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
Report subclass: #PortfolioTreePrinter
	instanceVariableNames: 'portfolio tabs visitor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'nrm 6/16/2022 16:35:30'!
initializeFor: aPortfolio
	portfolio := aPortfolio.
	message := OrderedCollection new.
	visitor := PortfolioTreePrinterVisitor new.! !


!PortfolioTreePrinter methodsFor: 'main Protocol' stamp: 'nrm 6/16/2022 16:37:29'!
message
	message add: portfolio name.
	(portfolio accounts) do: [:anAccount | (anAccount isKindOf: Portfolio )
		ifTrue:[message addAllLast: (visitor visit: anAccount)].
		(anAccount isKindOf: ReceptiveAccount )
		ifTrue:[message addLast: (visitor visit: anAccount)].
		].
	^message
	"^(portfolio accounts) inject: message addingAll: [ :anAccount | (anAccount isKindOf: Portfolio )
		ifTrue:[message addAllLast: (visitor visit: anAccount)].
		(anAccount isKindOf: ReceptiveAccount )
		ifTrue:[message addLast: (visitor visit: anAccount)]]"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancieros-Solucion'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'instance creation' stamp: 'mr 6/16/2022 12:21:38'!
for: aPortfolio 
	^self new initializeFor: aPortfolio ! !


!classDefinition: #SummaryReport category: 'ServiciosFinancieros-Solucion'!
Report subclass: #SummaryReport
	instanceVariableNames: 'visitor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!SummaryReport methodsFor: 'initialization' stamp: 'mr 6/16/2022 11:54:55'!
initializeWith: anAccount
	account := anAccount .
	message := OrderedCollection new.
	visitor := SummaryReportVisitor new.! !


!SummaryReport methodsFor: 'main Protocol' stamp: 'mr 6/16/2022 11:56:26'!
message
	account transactions do:
	[:aTransaction | message addLast: (visitor visit: aTransaction) ].
	
	message addLast: ('Balance = ' append: (account balance) asString).
	^message
! !


!classDefinition: #TransferNetReport category: 'ServiciosFinancieros-Solucion'!
Report subclass: #TransferNetReport
	instanceVariableNames: 'visitor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNetReport methodsFor: 'initialization' stamp: 'mr 6/16/2022 12:03:47'!
initializeWith: anAccount
	account := anAccount .
	message := 'El reporte neto de transferencias es '.
	visitor := TransferNetReportVisitor new.! !


!TransferNetReport methodsFor: 'main Protocol' stamp: 'mr 6/16/2022 12:03:19'!
message
	| netValue |
	netValue := (account transactions)
		sum: [:aTransaction | visitor visit: aTransaction ] ifEmpty: [0*peso].
	^message append: netValue asString.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !


!classDefinition: #Visitor category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Visitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Visitor methodsFor: 'main Protocol' stamp: 'nrm 6/16/2022 16:45:04'!
visit: anAccount
	self subclassResponsibility ! !


!classDefinition: #PortfolioTreePrinterVisitor category: 'ServiciosFinancieros-Solucion'!
Visitor subclass: #PortfolioTreePrinterVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinterVisitor methodsFor: 'private' stamp: 'nrm 6/16/2022 16:38:36'!
visitPortfolio: aPortfolio tabs: tabs
	| aux miString |
	miString := ''.
	tabs timesRepeat: [miString := miString , '	'].
	aux:= OrderedCollection with: miString,aPortfolio name.
	(aPortfolio accounts) do: [:anAccount| (anAccount isKindOf: Portfolio )
		ifTrue:[aux addAllLast: (self visitPortfolio: anAccount tabs:tabs+1)].
		(anAccount isKindOf: ReceptiveAccount )
		ifTrue:[aux addLast: (self visitReceptiveAccount:anAccount tabs:tabs+1)].].
	^aux! !

!PortfolioTreePrinterVisitor methodsFor: 'private' stamp: 'nrm 6/16/2022 16:27:48'!
visitReceptiveAccount: anAccount tabs: tabs
	| miString |
	miString := ''.
	tabs timesRepeat: [miString := miString , '	'].
	^miString,anAccount name! !


!PortfolioTreePrinterVisitor methodsFor: 'main Protocol' stamp: 'nrm 6/16/2022 16:17:23'!
visit: anAccount
	^anAccount accept: self! !


!classDefinition: #SummaryReportVisitor category: 'ServiciosFinancieros-Solucion'!
Visitor subclass: #SummaryReportVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!SummaryReportVisitor methodsFor: 'private' stamp: 'mr 6/16/2022 11:49:57'!
visitDeposit: aDeposit
	^'Deposito por ' append: aDeposit value asString. 
		 ! !

!SummaryReportVisitor methodsFor: 'private' stamp: 'mr 6/16/2022 11:52:43'!
visitTransferDepositLeg: aTransferLegDeposit
	^'Entrada por transferencia de ' append: aTransferLegDeposit value asString
	! !

!SummaryReportVisitor methodsFor: 'private' stamp: 'mr 6/16/2022 11:52:52'!
visitTransferWithdrawLeg: aTransferLegWithdraw
	^'Salida por transferencia de ' append: aTransferLegWithdraw value asString! !

!SummaryReportVisitor methodsFor: 'private' stamp: 'mr 6/16/2022 11:50:30'!
visitWithdraw: aWithdraw
	^'Extraccion por ' append: aWithdraw value asString
	! !


!SummaryReportVisitor methodsFor: 'main Protocol' stamp: 'mr 6/16/2022 11:48:42'!
visit: aTransaction
	
	^aTransaction accept: self.! !


!classDefinition: #TransferNetReportVisitor category: 'ServiciosFinancieros-Solucion'!
Visitor subclass: #TransferNetReportVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNetReportVisitor methodsFor: 'private' stamp: 'mr 6/16/2022 12:04:35'!
visitDeposit: aDeposit
	^0*peso! !

!TransferNetReportVisitor methodsFor: 'private' stamp: 'mr 6/16/2022 12:02:02'!
visitTransferDepositLeg: aTransferDepositLeg
	^aTransferDepositLeg value! !

!TransferNetReportVisitor methodsFor: 'private' stamp: 'mr 6/16/2022 12:02:18'!
visitTransferWithdrawLeg: aTransferWithdrawLeg
	^aTransferWithdrawLeg value negated! !

!TransferNetReportVisitor methodsFor: 'private' stamp: 'mr 6/16/2022 12:04:42'!
visitWithdraw: aWithdraw
	^0*peso! !


!TransferNetReportVisitor methodsFor: 'main Protocol' stamp: 'mr 6/16/2022 11:57:09'!
visit: aTransaction
	^aTransaction accept: self.! !
