'From Cuis 6.0 [latest update: #5481] on 18 November 2022 at 5:19:30 pm'!
!classDefinition: #PortfolioTreeDetailedPrinterTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTreeDetailedPrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreeDetailedPrinterTest methodsFor: 'as yet unclassified' stamp: 'M 11/18/2022 15:51:12'!
test01EmptyPortfolioWithEmptyNameOnlyHasEmptyStringAndZeroBalanceInDetailedTreeReport

	|treeReportDetailed portfolio|
	
	portfolio := Portfolio named: ''.
	
	treeReportDetailed := PortfolioDetailedTreePrinter for: portfolio.
	
	self assert: treeReportDetailed print equals: '', String newLineString, String tab, 'Balance = 0 pesos'! !

!PortfolioTreeDetailedPrinterTest methodsFor: 'as yet unclassified' stamp: 'M 11/18/2022 15:51:08'!
test02EmptyPortfolioWithOnlyHasNameAndZeroBalanceInDetailedTreeReport

	|treeReportDetailed portfolio|
	
	portfolio := Portfolio named: 'Portfolio de Dieguito Essaya'.
	
	treeReportDetailed := PortfolioDetailedTreePrinter for: portfolio.
	
	self assert: treeReportDetailed print equals: 'Portfolio de Dieguito Essaya', String newLineString, String tab, 'Balance = 0 pesos'.! !

!PortfolioTreeDetailedPrinterTest methodsFor: 'as yet unclassified' stamp: 'M 11/18/2022 15:50:59'!
test03PortfolioWithOneEmptyAccountHasAccountsNameAndZeroBalanceInDetailedTreeReport

	|treeReportDetailed portfolio account|
	
	portfolio := Portfolio named: 'Portfolio de Bob Esponja'.
	
	treeReportDetailed := PortfolioDetailedTreePrinter for: portfolio.
	
	account := ReceptiveAccount named: 'Cuenta de Gary'.
	
	portfolio add: account.
	
	self assert: treeReportDetailed print equals: 
	('Portfolio de Bob Esponja', String newLineString, String tab,'Cuenta de Gary', String newLineString, String tab, String tab, 'Balance = 0 pesos', String newLineString, String tab, 'Balance = 0 pesos').	! !

!PortfolioTreeDetailedPrinterTest methodsFor: 'as yet unclassified' stamp: 'M 11/18/2022 16:17:59'!
test04PortfolioWithTwoAccountsHasAccountsNamesAndBalancesInDetailedTreeReport

	|treeDetailedReport portfolio account1 account2|
	
	portfolio := Portfolio named: 'Portfolio de Bob Esponja'.
	
	treeDetailedReport := PortfolioDetailedTreePrinter for: portfolio.
	
	account1 := ReceptiveAccount named: 'Cuenta de Gary'.
	
	account2 := ReceptiveAccount named: 'Cuenta de Estrellita'.
	
	portfolio add: account1.
	
	portfolio add: account2.
	
	self assert: treeDetailedReport print equals: 
	('Portfolio de Bob Esponja', String newLineString, String tab,'Cuenta de Gary', String newLineString, String tab, String tab, 'Balance = 0 pesos', String newLineString, String tab,'Cuenta de Estrellita', String newLineString, String tab, String tab, 'Balance = 0 pesos', String newLineString, String tab, 'Balance = 0 pesos').	! !

!PortfolioTreeDetailedPrinterTest methodsFor: 'as yet unclassified' stamp: 'M 11/18/2022 16:18:29'!
test05PortfolioWithPortfolioWithAccountHasAllNamesCorrectlyIndentedInTreeReport

	| treeDetailedReport parentPortfolio childPortfolio account |
	
	parentPortfolio := Portfolio named: 'Portfolio del profesor Utonio'.
	
	childPortfolio := Portfolio named: 'Portfolio de las chicas superpoderosas'.
	
	account := ReceptiveAccount named: 'Cuenta de Bellota'.
	
	treeDetailedReport := PortfolioDetailedTreePrinter for: parentPortfolio.
	
	Deposit register: 0 on: account.
	
	parentPortfolio add: childPortfolio.
	
	childPortfolio add: account.
	
	self assert: treeDetailedReport print equals: ('Portfolio del profesor Utonio', String newLineString, String tab, 'Portfolio de las chicas superpoderosas', String newLineString, String tab, String tab, 'Cuenta de Bellota', String newLineString, String tab, String tab, String tab, 'Balance = 0 pesos', String newLineString, String tab, String tab, 'Balance = 0 pesos', String newLineString, String tab, 'Balance = 0 pesos').! !

!PortfolioTreeDetailedPrinterTest methodsFor: 'as yet unclassified' stamp: 'M 11/18/2022 16:19:06'!
test06PortfolioWithMultiplePortfolioAndAccountsRepresentsAllNamesCorrectlyInTreeReport

	| treeDetailedReport parentPortfolio childPortfolio grandchildPortfolio account1 account2 account3 account4|
	
	parentPortfolio := Portfolio named: 'Portfolio padre'.
	
	childPortfolio := Portfolio named: 'Portfolio hijo'.
	
	grandchildPortfolio:= Portfolio named: 'Portfolio nieto'.
	
	account1 := ReceptiveAccount named: 'Cuenta hija'.
	
	account2 := ReceptiveAccount named: 'Cuenta nieta'. 
	
	account3 := ReceptiveAccount named: 'Cuenta bis-nieta 1'.
	
	account4 := ReceptiveAccount named: 'Cuenta bis-nieta 2'.
	
	treeDetailedReport := PortfolioDetailedTreePrinter for: parentPortfolio.
	
	parentPortfolio add: childPortfolio.
	
	parentPortfolio add: account1.
	
	childPortfolio add: grandchildPortfolio.
	
	childPortfolio add: account2.
	
	grandchildPortfolio add: account3.
	
	grandchildPortfolio add: account4.
	
	
	self assert: treeDetailedReport print equals: (	'Portfolio padre', String newLineString, String tab, 'Portfolio hijo', String newLineString, String tab, String tab, 'Portfolio nieto', String newLineString, String tab, String tab, String tab, 'Cuenta bis-nieta 1', String newLineString, String tab, String tab, String tab, String tab, 'Balance = 0 pesos', String newLineString, String tab, String tab, String tab, 'Cuenta bis-nieta 2', String newLineString, String tab, String tab, String tab, String tab, 'Balance = 0 pesos', String newLineString, String tab, String tab, String tab, 'Balance = 0 pesos', String newLineString, String tab, String tab, 'Cuenta nieta', String newLineString, String tab, String tab, String tab, 'Balance = 0 pesos', String newLineString, String tab, String tab, 'Balance = 0 pesos', String newLineString, String tab, 'Cuenta hija', String newLineString, String tab, String tab, 'Balance = 0 pesos', String newLineString, String tab, 'Balance = 0 pesos').
	
	! !

!PortfolioTreeDetailedPrinterTest methodsFor: 'as yet unclassified' stamp: 'M 11/18/2022 16:16:30'!
test07PortfolioWithMultiplePortfolioAndAccountsRepresentsAllNamesCorrectlyInTreeReport

	| treeDetailedReport parentPortfolio childPortfolio grandchildPortfolio account1 account2 account3 account4|
	
	parentPortfolio := Portfolio named: 'Portfolio padre'.
	
	childPortfolio := Portfolio named: 'Portfolio hijo'.
	
	grandchildPortfolio:= Portfolio named: 'Portfolio nieto'.
	
	account1 := ReceptiveAccount named: 'Cuenta hija'.
	
	account2 := ReceptiveAccount named: 'Cuenta nieta'. 
	
	account3 := ReceptiveAccount named: 'Cuenta bis-nieta 1'.
	
	account4 := ReceptiveAccount named: 'Cuenta bis-nieta 2'.
	
	treeDetailedReport := PortfolioDetailedTreePrinter for: parentPortfolio.
	
	parentPortfolio add: childPortfolio.
	
	parentPortfolio add: account1.
	
	childPortfolio add: grandchildPortfolio.
	
	childPortfolio add: account2.
	
	grandchildPortfolio add: account3.
	
	grandchildPortfolio add: account4.
	
	Deposit register: 100 on: account3.
	Deposit register: 200 on: account4.
	Deposit register: -200 on: account2.
	Deposit register: 200 on: account1.
	
	self assert: treeDetailedReport print equals: (	'Portfolio padre', String newLineString, String tab, 'Portfolio hijo', String newLineString, String tab, String tab, 'Portfolio nieto', String newLineString, String tab, String tab, String tab, 'Cuenta bis-nieta 1', String newLineString, String tab, String tab, String tab, String tab, 'Balance = 100 pesos', String newLineString, String tab, String tab, String tab, 'Cuenta bis-nieta 2', String newLineString, String tab, String tab, String tab, String tab, 'Balance = 200 pesos', String newLineString, String tab, String tab, String tab, 'Balance = 300 pesos', String newLineString, String tab, String tab, 'Cuenta nieta', String newLineString, String tab, String tab, String tab, 'Balance = -200 pesos', String newLineString, String tab, String tab, 'Balance = 100 pesos', String newLineString, String tab, 'Cuenta hija', String newLineString, String tab, String tab, 'Balance = 200 pesos', String newLineString, String tab, 'Balance = 300 pesos').
	
	! !

!PortfolioTreeDetailedPrinterTest methodsFor: 'as yet unclassified' stamp: 'M 11/18/2022 16:21:34'!
test08PortfolioWithAccountHasAccountsNameAndCorrectBalanceInDetailedTreeReport

	|treeReportDetailed portfolio account|
	
	portfolio := Portfolio named: 'Portfolio de Bob Esponja'.
	
	treeReportDetailed := PortfolioDetailedTreePrinter for: portfolio.
	
	account := ReceptiveAccount named: 'Cuenta de Gary'.
	
	Deposit register: 100 on: account.
	
	portfolio add: account.
	
	self assert: treeReportDetailed print equals: 
	('Portfolio de Bob Esponja', String newLineString, String tab,'Cuenta de Gary', String newLineString, String tab, String tab, 'deposito por 100 pesos', String newLineString, String tab, String tab, 'Balance = 100 pesos', String newLineString, String tab, 'Balance = 100 pesos').	! !
