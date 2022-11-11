!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'TDD' stamp: 'CDN 11/8/2022 20:21:40'!
test01PortfolioWithoutAccountsHasCeroBalance

	| portfolio |
	
	portfolio := Portfolio new. 
		
	self assert: portfolio balance equals: 0.! !

!PortfolioTest methodsFor: 'TDD' stamp: 'CDN 11/8/2022 21:12:02'!
test02PortfolioWithOneAccountHasThatAccountBalance

	| portfolio account |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account.
	
	portfolio addAnAccount: account.
		
	self assert: portfolio balance equals: 100 * peso.! !

!PortfolioTest methodsFor: 'TDD' stamp: 'CDN 11/8/2022 20:30:44'!
test03TheBalanceOfPortolioWithMultipleAccountsIsTheSumOfAllAccountBalances

	| portfolio account1 account2 |
	
	portfolio := Portfolio new.
	
	account1 := ReceptiveAccount new.
	
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account1.
	
	Deposit register: 200 * peso on: account2.
	
	portfolio addAnAccount: account1.
	
	portfolio addAnAccount: account2.
	
	self assert: portfolio balance equals: 300 * peso.! !

!PortfolioTest methodsFor: 'TDD' stamp: 'CDN 11/8/2022 21:07:22'!
test04EmptyPortfolioDoesNotRegisterADeposit

	| portfolio account deposit |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account.
	
	self deny: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'TDD' stamp: 'CDN 11/8/2022 21:08:00'!
test05PortfolioWithDepositedAccountRegistersTheDeposit

	| portfolio account deposit |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	
	portfolio addAnAccount: account.

	deposit := Deposit register: 100 * peso on: account.
	
	self assert: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'TDD' stamp: 'CDN 11/8/2022 21:08:59'!
test06EmptyPortfolioReturnsEmptyTransactionsCollections

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: (portfolio transactions) equals: OrderedCollection new.! !

!PortfolioTest methodsFor: 'TDD' stamp: 'CDN 11/8/2022 21:09:35'!
test07PortfolioWithWithdrawnAccountReturnsSaidWithdrawAsTransaction

	| portfolio account withdraw |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	
	portfolio addAnAccount: account.
	
	withdraw := Withdraw register: 100 * peso on: account.
		
	self assert: (portfolio transactions) equals: (OrderedCollection with: withdraw).! !


!PortfolioTest methodsFor: 'testing' stamp: 'M 11/11/2022 14:29:57'!
test08PortfolioWithChildPortfolioWithAccountHasTheSameBalanceAsAccount

	| parentPortfolio childPortfolio account |
	
	parentPortfolio := Portfolio new.
	
	childPortfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	
	Deposit register: 500 * peso on: account.
	
	childPortfolio addAnAccount: account.
	
	parentPortfolio addAnAccount: childPortfolio.
		
	self assert: parentPortfolio balance equals: 500 * peso.
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'M 11/11/2022 14:31:10'!
test09PortfolioWithPortfolioWithAccountHasTheSameTransactionsAsAccount

	| parentPortfolio childPortfolio account deposit |
	
	parentPortfolio := Portfolio new.
	
	childPortfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 500 * peso on: account.
	
	childPortfolio addAnAccount: account.
	
	parentPortfolio addAnAccount: childPortfolio.
		
	self assert: parentPortfolio transactions equals: (OrderedCollection with: deposit).
	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'M 11/11/2022 14:32:16'!
test10PortfolioWithPortfolioWithAccountHasRegisteredAccountsDeposit

	| parentPortfolio childPortfolio account deposit |
	
	parentPortfolio := Portfolio new.
	
	childPortfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 500 * peso on: account.
	
	childPortfolio addAnAccount: account.
	
	parentPortfolio addAnAccount: childPortfolio.
		
	self assert: (parentPortfolio hasRegistered: deposit).
	! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

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


!classDefinition: #TransferTests category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTests methodsFor: 'testing' stamp: 'cdn 11/11/2022 00:43:21'!
test01AnAccountTransfersAnAmountToAnAnotherAccount
	| senderAccount receivedAccount |
	
	senderAccount := ReceptiveAccount new.
	
	receivedAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: senderAccount.
	
	Transfer register: 100 * peso from: senderAccount to: receivedAccount.
	
	self assert: senderAccount balance equals: 0 * peso.
	self assert: receivedAccount balance equals: 100 * peso.! !

!TransferTests methodsFor: 'testing' stamp: 'cdn 11/11/2022 00:43:37'!
test02TransferHasAValue

	| senderAccount receivedAccount transfer |
	
	senderAccount := ReceptiveAccount new.
	
	receivedAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: senderAccount.
		
	transfer := Transfer register: 100 * peso from: senderAccount to: receivedAccount.
	
	self assert: transfer value equals: 100 * peso.! !

!TransferTests methodsFor: 'testing' stamp: 'cdn 11/11/2022 01:05:05'!
test03CounterpartOfSenderAccountIsDeposit

	| senderAccount receivedAccount transfer counterpart |
	
	senderAccount := ReceptiveAccount new.
	
	receivedAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: senderAccount.
		
	transfer := Transfer register: 100 * peso from: senderAccount to: receivedAccount.
	
	counterpart := transfer getCounterpart: senderAccount.
	
	self assert: (counterpart isKindOf: Deposit).! !

!TransferTests methodsFor: 'testing' stamp: 'cdn 11/11/2022 01:05:39'!
test04CounterpartOfReceivedAccountIsWithdraw

	| senderAccount receivedAccount transfer counterpart |
	
	senderAccount := ReceptiveAccount new.
	
	receivedAccount := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: senderAccount.
		
	transfer := Transfer register: 100 * peso from: senderAccount to: receivedAccount.
	
	counterpart := transfer getCounterpart: receivedAccount.
	
	self assert: (counterpart isKindOf: Withdraw).! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'accessing' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'accessing' stamp: 'CDN 11/4/2022 19:47:13'!
addToBalance: aBalance
	
	^ aBalance + value! !

!Deposit methodsFor: 'accessing' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'accessing' stamp: 'CDN 11/4/2022 19:47:43'!
addToBalance: aBalance

	^ aBalance - value! !

!Withdraw methodsFor: 'accessing' stamp: 'CDN 11/4/2022 19:29:00'!
value

	^ value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'account balance accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'accesing' stamp: 'CDN 11/8/2022 20:28:44'!
balance
	
	| balanceCount |
	
	balanceCount := 0.
	
	accounts do: [ :anAccount | balanceCount := balanceCount + anAccount balance ].
	
	^ balanceCount.! !

!Portfolio methodsFor: 'accesing' stamp: 'CDN 11/8/2022 20:47:08'!
hasRegistered: aTransaction

	^ accounts anySatisfy:[ :anAccount |  anAccount hasRegistered: aTransaction].
	
! !

!Portfolio methodsFor: 'accesing' stamp: 'CDN 11/8/2022 21:04:50'!
transactions

	| transactions |
	
	transactions := OrderedCollection new.
	
	accounts do: [ :anAccount | anAccount transactions do: [ :aTransaction | transactions add: aTransaction]].
	
	^transactions.! !


!Portfolio methodsFor: 'initialization' stamp: 'CDN 11/8/2022 20:27:24'!
initialize

	balance := 0.
	accounts := OrderedCollection new.! !


!Portfolio methodsFor: 'handling' stamp: 'CDN 11/8/2022 20:26:27'!
addAnAccount: anAccount

	accounts add: anAccount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: 'balance'!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'CDN 11/8/2022 20:18:02'!
initialize

	^ self new initialize! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'CDN 11/4/2022 19:28:51'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'CDN 11/4/2022 19:48:13'!
balance
	| aBalance |
	
	aBalance := 0.
	
	transactions do: [ :aTransaction | 
		aBalance := aTransaction addToBalance: aBalance.
	].
	^ aBalance.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'CDN 11/4/2022 19:29:10'!
register: aTransaction

	transactions add: aTransaction! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdraw deposit senderAccount receivedAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'cdn 11/11/2022 00:50:25'!
initializeFor: anAmount from: aSenderAccount to: aReceivedAccount

	value := anAmount.
	
	senderAccount := aSenderAccount.
	
	receivedAccount := aReceivedAccount.
	
	withdraw := Withdraw register: anAmount on: aSenderAccount.
	
	deposit := Deposit register: anAmount on: aReceivedAccount.! !


!Transfer methodsFor: 'counterparts' stamp: 'cdn 11/11/2022 01:03:35'!
getCounterpart: aReceptiveAccount 

	( aReceptiveAccount = senderAccount ) ifTrue: [ ^ deposit ].
	
	^ withdraw! !

!Transfer methodsFor: 'counterparts' stamp: 'cdn 11/11/2022 00:41:55'!
getSenderCounterpart
	
	^ deposit! !


!Transfer methodsFor: 'evaluating' stamp: 'CDN 11/7/2022 20:30:34'!
value
	
	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'cdn 11/11/2022 00:40:13'!
register: anAmount from: aSenderAccount to: aReceivedAccount
	
	^ self new initializeFor: anAmount from: aSenderAccount to: aReceivedAccount
! !

Portfolio initialize!