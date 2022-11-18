!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 13:46:49'!
test01AccountWithoutTransactionsHasAReportWithBalanceEqualsZero

	| account report |
	
	account := ReceptiveAccount new.
	
	report := AccountSummary for: account.
	
	self assert: 'Balance = 0 pesos' equals: report export.! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 13:46:49'!
test02AccountWithOnlyOneDepositHasAReportWithDepositAndBalanceEqualsToDepositAmount

	| account report |
	
	account := ReceptiveAccount new.
	
	Deposit register: 300 on: account. 
	
	report := AccountSummary for: account.
	
	self assert: 'Depósito por 300 pesos', String newLineString, 'Balance = 300 pesos' equals: report export.! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 13:46:49'!
test03AccountWithOnlyOneWithdrayHasAReportWithWithdrawAndBalanceEqualsWithdrawAmount

	| account report |
	
	account := ReceptiveAccount new.
	
	Withdraw register: 200 on: account. 
		
	report := AccountSummary for: account.
	
	self assert: 'Extracción por 200 pesos', String newLineString, 'Balance = -200 pesos' equals: report export.
! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 13:46:49'!
test04AccountThatOnlyTransfersMoneyHasAReportWithWithdrawAndBalanceEqualsTransferValue

	| senderAccount receiveAccount report |
	
	senderAccount := ReceptiveAccount new.
	
	receiveAccount := ReceptiveAccount new.
		
	Transfer amount: (200) from: senderAccount to: receiveAccount. 
		
	report := AccountSummary for: senderAccount.
	
	self assert: 'Salida por transferencia de 200 pesos', String newLineString, 'Balance = -200 pesos' equals: report export.
! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 13:46:49'!
test05AccountThatOnlyReceivesMoneyHasAReportWithDepositAndBalanceEqualsTransferValue

	| senderAccount receiveAccount report |
	
	senderAccount := ReceptiveAccount new.
	
	receiveAccount := ReceptiveAccount new.
		
	Transfer amount: (10) from: senderAccount to: receiveAccount. 
		
	report := AccountSummary for: receiveAccount.
	
	self assert: 'Entrada por transferencia de 10 pesos', String newLineString, 'Balance = 10 pesos' equals: report export.
! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 13:46:49'!
test06AccountWithSeveralTransfersHasAReportReflectingThem

	| senderAccount receiveAccount report |
	
	senderAccount := ReceptiveAccount new.
	
	receiveAccount := ReceptiveAccount new.
	
	Deposit register: 10 on: senderAccount.
		
	Transfer amount: (10) from: senderAccount to: receiveAccount. 
				
	report := AccountSummary for: senderAccount.
			
	self assert: 'Depósito por 10 pesos', String newLineString, 'Salida por transferencia de 10 pesos', String newLineString, 'Balance = 0 pesos' equals: report export.
! !


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


!classDefinition: #PortfolioTreePrinterTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 13:46:49'!
test01EmptyPortfolioWithEmptyNameOnlyHasEmptyStringInTreeReport

	|treeReport portfolio|
	
	portfolio := Portfolio named: ''.
	
	treeReport := PortfolioTreePrinter for: portfolio.
	
	self assert: treeReport export equals: ''! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 13:46:49'!
test02EmptyPortfolioWithNameOnlyHasNameInTreeReport

	|treeReport portfolio|
	
	portfolio := Portfolio named: 'Cosmo y Wanda'.
	
	treeReport := PortfolioTreePrinter for: portfolio.
	
	self assert: treeReport export equals: 'Cosmo y Wanda'! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 13:46:49'!
test03PortfolioWithOneAccountHasAccountsNameInTreeReport

	|treeReport portfolio account|
	
	portfolio := Portfolio named: 'Portfolio de Bob Esponja'.
	
	treeReport := PortfolioTreePrinter for: portfolio.
	
	account := ReceptiveAccount named: 'Cuenta de Gary'.
	
	portfolio add: account.
	
	self assert: treeReport export equals: 
	('Portfolio de Bob Esponja', String newLineString, String tab,'Cuenta de Gary').	! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 13:46:49'!
test04PortfolioWithTwoEmptyAccountsOnlyHasAccountsNamesInTreeReport

	|treeReport portfolio account1 account2|
	
	portfolio := Portfolio named: 'Portfolio de la familia Simpson'.
	
	treeReport := PortfolioTreePrinter for: portfolio.
	
	account1 := ReceptiveAccount named: 'Cuenta de Marge'.
	
	account2 := ReceptiveAccount named: 'Cuenta de Maggie'.
	
	portfolio add: account1.
	portfolio add: account2.
	
	self assert: treeReport export equals: ('Portfolio de la familia Simpson',String newLineString, String tab, 'Cuenta de Marge', String newLineString, String tab, 'Cuenta de Maggie').	! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 13:46:49'!
test05PortfolioWithPortfolioHasBothNamesInTreeReport

	| treeReport parentPortfolio childPortfolio |
	
	parentPortfolio := Portfolio named: 'Portfolio de las Chicas Super Poderosas'.
	
	childPortfolio := Portfolio named: 'Portfolio de Burbuja'.
	
	treeReport := PortfolioTreePrinter for: parentPortfolio.
	
	parentPortfolio add: childPortfolio.
	
	self assert: treeReport export equals: ('Portfolio de las Chicas Super Poderosas', String newLineString, String tab, 'Portfolio de Burbuja').! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 13:46:49'!
test06PortfolioWithPortfolioWithAccountHasAllNamesCorrectlyIndentedInTreeReport

	| treeReport parentPortfolio childPortfolio account |
	
	parentPortfolio := Portfolio named: 'Portfolio del profesor Utonio'.
	
	childPortfolio := Portfolio named: 'Portfolio de las chicas superpoderosas'.
	
	account := ReceptiveAccount named: 'Cuenta de Bellota'.
	
	treeReport := PortfolioTreePrinter for: parentPortfolio.
	
	parentPortfolio add: childPortfolio.
	
	childPortfolio add: account.
	
	self assert: treeReport export equals: ('Portfolio del profesor Utonio', String newLineString, String tab, 'Portfolio de las chicas superpoderosas', String newLineString, String tab, String tab, 'Cuenta de Bellota').! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 13:46:49'!
test07PortfolioWithMultiplePortfolioAndAccountsRepresentsAllNamesCorrectlyInTreeReport

	| treeReport parentPortfolio childPortfolio grandchildPortfolio account1 account2 account3 account4|
	
	parentPortfolio := Portfolio named: 'Portfolio padre'.
	
	childPortfolio := Portfolio named: 'Portfolio hijo'.
	
	grandchildPortfolio:= Portfolio named: 'Portfolio nieto'.
	
	account1 := ReceptiveAccount named: 'Cuenta hija'.
	
	account2 := ReceptiveAccount named: 'Cuenta nieta'. 
	
	account3 := ReceptiveAccount named: 'Cuenta bis-nieta 1'.
	
	account4 := ReceptiveAccount named: 'Cuenta bis-nieta 2'.
	
	treeReport := PortfolioTreePrinter for: parentPortfolio.
	
	parentPortfolio add: childPortfolio.
	
	parentPortfolio add: account1.
	
	childPortfolio add: grandchildPortfolio.
	
	childPortfolio add: account2.
	
	grandchildPortfolio add: account3.
	
	grandchildPortfolio add: account4.
	
	self assert: treeReport export equals: (	'Portfolio padre', String newLineString, String tab, 'Portfolio hijo', String newLineString, String tab, String tab, 'Portfolio nieto', String newLineString, String tab, String tab, String tab, 'Cuenta bis-nieta 1', String newLineString, String tab, String tab, String tab, 'Cuenta bis-nieta 2', String newLineString, String tab, String tab, 'Cuenta nieta', String newLineString, String tab, 'Cuenta hija').
	
	
	! !


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


!classDefinition: #TransferNetTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 13:46:49'!
test01AccountWithoutTransfersHasANetBalanceEqualsZero

	| account report |
	
	account := ReceptiveAccount new.
	
	report := TransferNet for: account.
	
	self assert: 'Balance neto = 0 pesos' equals: report export.! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 13:46:49'!
test02AccountWithDepositTransferAndDepositHasANetBalanceEqualsTransferValue

	| senderAccount report receiveAccount |
	
	senderAccount := ReceptiveAccount new.

	receiveAccount := ReceptiveAccount new.
	
	Transfer amount: 100 from: senderAccount to: receiveAccount. 
	
	Deposit register: 200 on: receiveAccount.
	
	report := TransferNet for: receiveAccount.
	
	self assert: 'Balance neto = 100 pesos' equals: report export.! !

!TransferNetTest methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 13:46:49'!
test03PortfolioWithAccountWithWithdrawTransferAndDepositHasANetBalanceEqualsTransferValue

	| portfolio senderAccount report receiveAccount |
	
	senderAccount := ReceptiveAccount new.

	receiveAccount := ReceptiveAccount new.
	
	portfolio := Portfolio new.
	
	portfolio add: senderAccount.
	
	Transfer amount: 100 from: senderAccount to: receiveAccount. 
	
	Withdraw register: 200 on: senderAccount.
	
	report := TransferNet for: portfolio.
	
	self assert: 'Balance neto = -100 pesos' equals: report export.! !


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


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'accessing' stamp: 'CDN 11/18/2022 13:55:41'!
addToReport: aReport
	
	^ self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'LL 7/1/2021 03:21:03'!
initialize

	accounts := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'M 11/16/2022 22:59:28'!
initializeNamed: aName

	accounts := OrderedCollection new.
	name := aName.! !


!Portfolio methodsFor: 'main protocol' stamp: 'M 11/16/2022 23:19:06'!
accounts
	
	^ accounts copy.! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'M 11/16/2022 23:05:55'!
name
	
	^name.! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'LL 7/1/2021 03:21:12'!
add: accountToAdd
	
	accounts add: accountToAdd.
	! !


!Portfolio methodsFor: 'accessing' stamp: 'CDN 11/18/2022 13:56:21'!
addToReport: aReport

	aReport addPortfolio: self.! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

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


!Portfolio class methodsFor: 'instance creation' stamp: 'M 11/16/2022 22:58:50'!
named: aName
	^self new initializeNamed: aName.! !


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

!ReceptiveAccount methodsFor: 'initialization' stamp: 'M 11/16/2022 23:12:59'!
initializeNamed: aName 
	name := aName.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'M 11/16/2022 23:22:40'!
name
	^name.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'accessing' stamp: 'CDN 11/18/2022 13:56:45'!
addToReport: aReport

	aReport addReceptiveAccount: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'M 11/16/2022 23:12:41'!
named: aName
	^self new initializeNamed: aName.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'accessing' stamp: 'CDN 11/18/2022 13:55:00'!
addToBalance: aReport
	
	^ self subclassResponsibility.! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


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


!Deposit methodsFor: 'accessing' stamp: 'CDN 11/16/2022 18:36:11'!
addToReport: aReport

	aReport addDepositOnReport: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


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


!TransferLeg methodsFor: 'accessing' stamp: 'CDN 11/18/2022 13:53:57'!
addToReport: aReport
	
	^ self subclassResponsibility.! !

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

!TransferDepositLeg methodsFor: 'accessing' stamp: 'CDN 11/16/2022 18:38:56'!
addToReport: aReport
	
	aReport addTransferDepositLegOnReport: self.! !

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'CDN 11/16/2022 18:39:14'!
addToReport: aReport
	
	aReport addTransferWithdrawLegOnReport: self.! !

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


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


!Withdraw methodsFor: 'as yet unclassified' stamp: 'CDN 11/16/2022 18:39:34'!
addToReport: aReport
	
	aReport addWithdrawOnReport: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
Object subclass: #PortfolioTreePrinter
	instanceVariableNames: 'portfolio report i'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 16:47:45'!
addPortfolio: aPortfolio

	| childReport |
	
	childReport := PortfolioTreePrinter for: aPortfolio.
	
	report := report, i, (childReport printWithIndentation: String tab).
	
! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 16:44:28'!
addReceptiveAccount: aReceptiveAccount

	report := report, i, aReceptiveAccount name.! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 16:41:07'!
export
	
	^ self printWithIndentation: ''.

	! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 16:29:01'!
initializeFor: aPortfolio
	portfolio := aPortfolio.
	
	report := ''.
	
	i := String newLineString, String tab.! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 16:06:42'!
print: anAccount withIndentation: anIndentation

	| reportString |
	reportString := ''.
	
	(anAccount isKindOf: ReceptiveAccount) ifTrue: [^anIndentation, anAccount name].
	(anAccount accounts isEmpty) ifTrue: [^ anIndentation, anAccount name].
	anAccount accounts do: [:childAccount | reportString := reportString, String newLineString, (self print: childAccount withIndentation: String tab, anIndentation)].
	^ anIndentation, anAccount name, reportString.
	! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 16:41:02'!
printWithIndentation: anIndentation

	report := report, portfolio name.

	i := i, anIndentation.
	
	portfolio accounts do: [ :anAccount |
		anAccount addToReport: self. ].
	
	^ report
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancieros-Solucion'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'instance creation' stamp: 'M 11/16/2022 23:00:12'!
for: aPortfolio 
	^self new initializeFor: aPortfolio.! !


!classDefinition: #Report category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Report methodsFor: 'as yet unclassified' stamp: 'CDN 11/18/2022 13:46:49'!
export 
	
	^ self subclassResponsibility.! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
Report subclass: #AccountSummary
	instanceVariableNames: 'receptiveAccount report'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'transactions' stamp: 'CDN 11/16/2022 18:37:45'!
addDepositOnReport: aDeposit

	report add: 'Depósito por ', aDeposit value asString, ' pesos'.! !

!AccountSummary methodsFor: 'transactions' stamp: 'CDN 11/16/2022 18:43:04'!
addTransferDepositLegOnReport: aTransferDepositLeg

	report add: 'Entrada por transferencia de ', aTransferDepositLeg value asString, ' pesos'.
! !

!AccountSummary methodsFor: 'transactions' stamp: 'CDN 11/16/2022 18:42:25'!
addTransferWithdrawLegOnReport: aTransferWithdrawLeg

	report add: 'Salida por transferencia de ', aTransferWithdrawLeg value asString, ' pesos'.! !

!AccountSummary methodsFor: 'transactions' stamp: 'CDN 11/16/2022 18:41:44'!
addWithdrawOnReport: aWithdraw

	report add: 'Extracción por ', aWithdraw value asString, ' pesos'! !


!AccountSummary methodsFor: 'accessing' stamp: 'CDN 11/18/2022 13:46:49'!
export

	| transactions | 
			
	transactions := receptiveAccount transactions.

	transactions do: [ :aTransaction | aTransaction addToReport: self 	].
	
	report add: 'Balance = ', receptiveAccount balance asString, ' pesos'.
	
	^ String newLineString join: report.! !


!AccountSummary methodsFor: 'initialization' stamp: 'CDN 11/16/2022 17:38:53'!
initializeFor: aReceptiveAccount 

	receptiveAccount := aReceptiveAccount.
	
	report := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancieros-Solucion'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'CDN 11/16/2022 00:46:17'!
for: aReceptiveAccount 
	^ self new initializeFor: aReceptiveAccount ! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Solucion'!
Report subclass: #TransferNet
	instanceVariableNames: 'receptiveAccount balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNet methodsFor: 'accessing' stamp: 'CDN 11/18/2022 13:46:49'!
export
			
	receptiveAccount transactions do: [ :aTransaction | aTransaction addToReport: self ].
	
	^ 'Balance neto = ', balance asString, ' pesos'.! !


!TransferNet methodsFor: 'initilization' stamp: 'CDN 11/16/2022 19:46:10'!
initializeFor: aReceptiveAccount 
	
	receptiveAccount := aReceptiveAccount.
	
	balance := 0.! !


!TransferNet methodsFor: 'transactions' stamp: 'CDN 11/16/2022 19:54:43'!
addDepositOnReport: aDeposit

	balance := balance + 0.! !

!TransferNet methodsFor: 'transactions' stamp: 'CDN 11/16/2022 19:55:53'!
addTransferDepositLegOnReport: aTransferDepositLeg

	balance := aTransferDepositLeg affectBalance: balance.! !

!TransferNet methodsFor: 'transactions' stamp: 'CDN 11/16/2022 19:55:43'!
addTransferWithdrawLegOnReport: aTransferWithdrawLeg

	balance := aTransferWithdrawLeg affectBalance: balance.! !

!TransferNet methodsFor: 'transactions' stamp: 'CDN 11/16/2022 19:54:51'!
addWithdrawOnReport: aWithdraw

	balance := balance + 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: 'ServiciosFinancieros-Solucion'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'instance creation' stamp: 'CDN 11/16/2022 18:57:58'!
for: aReceptiveAccount 
	
	^ self new initializeFor: aReceptiveAccount ! !


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
