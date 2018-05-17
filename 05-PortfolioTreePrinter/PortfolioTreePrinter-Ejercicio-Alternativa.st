!classDefinition: #PortfolioTest category: #'PortfolioTreePrinter-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	account := ReceptiveAccount new.

	self assert: 0 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:45'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 05:34'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/28/2017 15:22:46'!
test03_01WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	self assert: (Withdraw register: withdrawValue on: account) value equals: withdrawValue 
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:48'!
test04PortfolioBalanceIsSumOfManagedAccountsBalance

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	 	
	Deposit register: 100 on: account1.
	Deposit register: 200 on: account2.
		
	self assert:300 = complexPortfolio balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:53'!
test05PortfolioCanManagePortfolios

	| account1 account2 account3 complexPortfolio composedPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	Deposit register: 100 on:account1.
	Deposit register: 200 on: account2.
	Deposit register: 300 on: account3.

	self assert: 600 = composedPortfolio balance .! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/25/2017 20:14:36'!
test06ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account registers: deposit).
	self assert: (account registers: withdraw).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/25/2017 20:14:30'!
test07ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account registers: deposit).
	self deny: (account registers:withdraw).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:51'!
test08PortfolioKnowsTransactionsRegisteredByItsManagedAccounts 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
 	self assert: (composedPortfolio registers: deposit1).
	self assert: (composedPortfolio registers: deposit2).
	self assert: (composedPortfolio registers: deposit3).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:25'!
test08PortofolioKnowsTransactionsRegisteredByItsManagedAccounts 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
 	self assert: (composedPortfolio registers: deposit1).
	self assert: (composedPortfolio registers: deposit2).
	self assert: (composedPortfolio registers: deposit3).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:00'!
test10ReceptiveAccountManageItSelf 

	| account1 |
	account1 := ReceptiveAccount new.
		
	self assert: (account1 manages:account1).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:01'!
test11ReceptiveAccountDoNotManageOtherAccount

	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
		
	self deny: (account1 manages: account2).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:02'!
test12PortfolioManagesComposedAccounts

	| account1 account2 account3 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self assert: (complexPortfolio manages: account1).
	self assert: (complexPortfolio manages: account2).
	self deny: (complexPortfolio manages: account3).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:03'!
test13PortfolioManagesComposedAccountsAndPortfolios 

	| account1 account2 account3 complexPortfolio composedPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	self assert: (composedPortfolio manages: account1).
	self assert: (composedPortfolio manages: account2).
	self assert: (composedPortfolio manages: account3).
	self assert: (composedPortfolio manages: complexPortfolio).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:28'!
test14AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on:account1.
		
	self assert: 1=account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/18/2011 17:15'!
test15PortfolioTransactionsIsTheUnionOftsAccountsTransactions 

	| account1 account2 account3 complexPortfolio account composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
	self assert: 3 = composedPortfolio transactions size .
	self assert: (composedPortfolio transactions includes: deposit1).
	self assert: (composedPortfolio transactions includes: deposit2).
	self assert: (composedPortfolio transactions includes: deposit3).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:23'!
test16PortfolioKnowsItsAccountsTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1= (composedPortfolio transactionsOf:account1) size .
	self assert: ((composedPortfolio transactionsOf: account1) includes:deposit1).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:23'!
test17PortfolioKnowsItsPortfoliosTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 100 on: account2.
	Deposit register: 100 on: account3.
		
	self assert: 2 = (composedPortfolio transactionsOf:complexPortfolio) size .
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit1).
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit2).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:24'!
test18PortfolioCanNotAnswerTransactionsOfNotManagedAccounts 

	| account1 account2 account3 complexPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self 
		should: [ complexPortfolio transactionsOf:account3 ] 
		raise: Error 
		withExceptionDo: [ :accountNotManaged |
			self assert: Portfolio accountNotManagedMessageDescription = accountNotManaged messageText ]
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/8/2018 16:24:31'!
test19CanNotCreatePortfoliosWithRepeatedAccount 

	| account1 |

	account1 := ReceptiveAccount new.
	self 
		should: [ Portfolio with: account1 with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage  = invalidPortfolio messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:15'!
test20CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolio 

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.

	self 
		should: [ Portfolio with: complexPortfolio with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/8/2018 16:11:42'!
test20_01CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolioTwo

    | account1 account2 account3 complexPortfolio1 complexPortfolio2 |
    
    account1 := ReceptiveAccount new.
    account2 := ReceptiveAccount new.
    account3 := ReceptiveAccount new.    
    complexPortfolio1 := Portfolio with: account1 with: account2.
    complexPortfolio2 := Portfolio with: account3 with: account1.

    self 
        should: [ Portfolio with: complexPortfolio1 with: complexPortfolio2 ]
        raise: Error
        withExceptionDo: [ :invalidPortfolio |
            self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ] ! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 05:27'!
test21TransferShouldWithdrawFromFromAccountAndDepositIntoToAccount

	| fromAccount toAccount |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	Transfer register: 100 from: fromAccount to: toAccount.
		
	self assert: -100 = fromAccount balance.
	self assert:  100 = toAccount balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/28/2017 15:30:52'!
test21_01TransferIsReachedFromTransacctions

	| fromAccount toAccount transfer |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	transfer := Transfer register: 100 from: fromAccount to: toAccount.
		
	self assert:  100 = transfer value.
	self assert: fromAccount transactions first transfer equals: transfer.
	self assert: toAccount transactions first transfer equals: transfer.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/28/2017 15:27:01'!
test22AccountSummaryShouldProvideHumanReadableTransactionsDetail

	| fromAccount toAccount fromAccountLines toAccountLines|

	fromAccount := ReceptiveAccount new.
	toAccount := ReceptiveAccount new.
	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	
	fromAccountLines := self accountSummaryLinesOf: fromAccount.
	toAccountLines := self accountSummaryLinesOf: toAccount.
	
	self assert: 3 = fromAccountLines size.
	self assert: 'Deposito por 100' = (fromAccountLines at: 1).
	self assert: 'Extraccion por 50' = (fromAccountLines at: 2).
	self assert: 'Transferencia por -100' = (fromAccountLines at: 3).
	
	self assert: 1 = toAccountLines size.
	self assert: 'Transferencia por 100' = (toAccountLines at: 1).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!
test23ShouldBeAbleToBeQueryTransferNet

	| fromAccount toAccount |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	Transfer register: 250 from: toAccount to: fromAccount.
		
	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!
test24CertificateOfDepositShouldWithdrawInvestmentValue

	| account toAccount |
	account := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 1000 on: account.
	Withdraw register: 50 on: account.
	Transfer register: 100 from: account to: toAccount.
	CertificateOfDeposit register: 100 during: 30 at: 1/10 on: account.
		
	self assert: 100 =(self investmentNetOf:account).
	self assert: 750 = account balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!
test25ShouldBeAbleToQueryInvestmentEarnings

	| account investmentEarnings |
	account := ReceptiveAccount new. 
		
	CertificateOfDeposit register: 100 during: 30 at: 1/10 on: account.
	CertificateOfDeposit register: 100 during: 60 at: 15/100 on: account.

	investmentEarnings := 
		(100*((1/10)/360)*30) +
		(100*((15/100)/360)*60).
		
	self assert: investmentEarnings = (self investmentEarningsOf: account).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 8/13/2017 18:37:21'!
test26AccountSummaryShouldWorkWithCertificateOfDeposit

	| fromAccount toAccount lines |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	CertificateOfDeposit register: 1000 during: 30 at: 1/10 on: fromAccount.
		
	lines := self accountSummaryLinesOf: fromAccount.
		
	self assert: 4 = lines size.
	self assert: 'Deposito por 100' =  (lines at: 1).
	self assert: 'Extraccion por 50' =  (lines at: 2).
	self assert: 'Transferencia por -100' = (lines at: 3).
	self assert: 'Plazo fijo por 1000 durante 30 dias a una tna de 10%' = (lines at: 4).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!
test27ShouldBeAbleToBeQueryTransferNetWithCertificateOfDeposit

	| fromAccount toAccount |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	Transfer register: 250 from: toAccount to: fromAccount.
	CertificateOfDeposit register: 1000 during: 30 at: 1/10 on: fromAccount.
		
	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:29'!
test28PortfolioTreePrinterPrintsTheCompositeInDepthFirstOrder

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |
	
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new. 
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.

	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.
		
	lines := self portofolioTreeOf: composedPortfolio namingAccountWith: accountNames.
		
	self assert: 5 = lines size.
	self assert: 'composedPortfolio' = (lines at: 1).
	self assert: ' complexPortfolio' = (lines at: 2).
	self assert: '  account1' = (lines at: 3).
	self assert: '  account2' = (lines at: 4).
	self assert: ' account3' = (lines at: 5).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:30'!
test29ReversePortfolioTreePrinterPrintsTheCompositeStartingFromTheLeaves

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new. 
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.

	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.
		
	lines := self reversePortofolioTreeOf: composedPortfolio namingAccountWith: accountNames.
		
	self assert: 5 = lines size.
	self assert: ' account3' = (lines at: 1).
	self assert: '  account2' = (lines at: 2).
	self assert: '  account1' = (lines at: 3).
	self assert: ' complexPortfolio' = (lines at: 4).
	self assert: 'composedPortfolio' = (lines at: 5).
	! !


!PortfolioTest methodsFor: 'test support' stamp: 'Nacho 5/16/2018 21:00:36'!
accountSummaryLinesOf: aReceptiveAccount
	| accountPrinter |
	accountPrinter _ AccountSummaryVisitor new.
	^ accountPrinter accountSummaryOf: aReceptiveAccount.! !

!PortfolioTest methodsFor: 'test support' stamp: 'Nacho 5/16/2018 21:14:22'!
accountTransferNetOf: aReceptiveAccount
	| transferNet |
	transferNet _ TransferNetVisitor new initialize.
	^ transferNet transferNetOf: aReceptiveAccount.! !

!PortfolioTest methodsFor: 'test support' stamp: 'Nacho 5/16/2018 21:03:14'!
investmentEarningsOf: aReceptiveAccount
	| investmentEarning |
	investmentEarning _ InvestmentEarningsVisitor new initialize.
	^ investmentEarning investmentEarningsOf: aReceptiveAccount.! !

!PortfolioTest methodsFor: 'test support' stamp: 'Nacho 5/16/2018 21:10:44'!
investmentNetOf: aReceptiveAccount
	| investmentNet |
	investmentNet _ InvestmentNetVisitor new initialize.
	^ investmentNet investmentNetOf: aReceptiveAccount.! !

!PortfolioTest methodsFor: 'test support' stamp: 'Nacho 5/16/2018 21:21:56'!
portofolioTreeOf: aPortfolio namingAccountWith: aDictionary
	| portfolioPrinter |
	portfolioPrinter _ PortfolioPrinterVisitor new
		initializeWithPortfolio: aPortfolio
		andNamigAccountsWith: aDictionary.
	^ portfolioPrinter lines.! !

!PortfolioTest methodsFor: 'test support' stamp: 'Nacho 5/16/2018 21:22:29'!
reversePortofolioTreeOf: aPortfolio namingAccountWith: aDictionary
	^ (ReversePortfolioPrinterVisitor
		initializeWithPortfolio: aPortfolio
		andNamigAccountsWith: aDictionary) lines.! !


!classDefinition: #AccountTransaction category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransaction methodsFor: 'print' stamp: 'AL 5/14/2018 18:30:06'!
printTransaction: anAccountPrinter

	^self subclassResponsibility. ! !


!AccountTransaction methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/14/2011 06:48'!
value

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #CertificateOfDeposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #CertificateOfDeposit
	instanceVariableNames: 'value tna numberOfDays account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!CertificateOfDeposit methodsFor: 'initialization' stamp: 'nacho 5/13/2018 19:18:07'!
register:aValue during:aNumberOfDays at:aTna on: aReceptiveAccount
	
	value:= aValue.
	numberOfDays := aNumberOfDays.
	tna := aTna .
	account  := aReceptiveAccount .! !


!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 20:57:21'!
accept: aTransactionVisitor
	^ aTransactionVisitor visitCertificateOfDeposit: self.! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'nacho 5/15/2018 18:02:05'!
investmentEarning: anInvestmentEarning
	^anInvestmentEarning aCertificateOfDepositInvestmentEarning: ((value* (tna/360)) * numberOfDays). ! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'nacho 5/15/2018 17:44:05'!
investmentNet: anInvestmentNet
	^anInvestmentNet aCertificateofDepositInvestmentNet: value.! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'nacho 5/13/2018 20:00:00'!
modifyBalance: aBalance
	
	^aBalance - value.
! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'nacho 5/13/2018 19:18:44'!
numberOfDays 
	^numberOfDays .! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'nacho 5/13/2018 19:18:55'!
tna 
	^tna .! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'nacho 5/15/2018 18:14:00'!
transferNet: aTransferNet
	^ aTransferNet aZeroTransferNet .! !

!CertificateOfDeposit methodsFor: 'as yet unclassified' stamp: 'nacho 5/13/2018 19:19:04'!
value 	
	^value .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CertificateOfDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
CertificateOfDeposit class
	instanceVariableNames: ''!

!CertificateOfDeposit class methodsFor: 'as yet unclassified' stamp: 'nacho 5/13/2018 19:50:51'!
register:aValue during:aNumberOfDays at:aTna on: aReceptiveAccount
	
	|certificateDeposit|
	
	certificateDeposit := self new register: aValue during: aNumberOfDays at: aTna  on: aReceptiveAccount .
	aReceptiveAccount  register: certificateDeposit .
	^certificateDeposit .! !


!classDefinition: #Deposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'modifyAccount' stamp: 'nacho 5/10/2018 19:35:50'!
modifyBalance: aBalance
	
	^value + aBalance
! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 20:57:57'!
accept: aTransactionVisitor
	^ aTransactionVisitor visitDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'PortfolioTreePrinter-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'nacho 5/10/2018 19:19:28'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.	
	^ withdraw.! !


!classDefinition: #TransferDeposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferDeposit methodsFor: 'initialization' stamp: 'nacho 5/10/2018 20:51:56'!
withTransfer: aTransfer
	transfer := aTransfer.
	! !


!TransferDeposit methodsFor: 'nil' stamp: 'nacho 5/10/2018 21:18:12'!
modifyBalance: aBalance
	
	^transfer value + aBalance.! !

!TransferDeposit methodsFor: 'nil' stamp: 'nacho 5/10/2018 21:20:51'!
transfer 
	^transfer.! !


!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 20:59:42'!
accept: aTransactionVisitor
	^aTransactionVisitor visitTransferDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'class initialization' stamp: 'nacho 5/10/2018 20:54:48'!
for: aTransfer
 	^ self new withTransfer: aTransfer.! !

!TransferDeposit class methodsFor: 'class initialization' stamp: 'nacho 5/10/2018 20:58:47'!
register: aTransfer on: account

	| transferdeposit |
	
	transferdeposit := self for: aTransfer.
	account register: transferdeposit.	
	^ transferdeposit.! !


!classDefinition: #TransferWithdraw category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferWithdraw methodsFor: 'initialization' stamp: 'nacho 5/10/2018 20:52:03'!
withTransfer: aTransfer.
	transfer := aTransfer.
	
	! !


!TransferWithdraw methodsFor: 'nil' stamp: 'nacho 5/10/2018 21:18:25'!
modifyBalance: aBalance
	
	^aBalance - transfer value.
! !

!TransferWithdraw methodsFor: 'nil' stamp: 'nacho 5/10/2018 21:20:40'!
transfer 
	^transfer.! !


!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:00:03'!
accept: aTransactionVisitor
	^ aTransactionVisitor visitTransferWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'class initialization' stamp: 'nacho 5/10/2018 21:00:15'!
for: aTransfer
 	^ self new withTransfer: aTransfer.! !

!TransferWithdraw class methodsFor: 'class initialization' stamp: 'nacho 5/10/2018 21:00:52'!
register: aTransfer on: account

	| transferwithdraw |
	
	transferwithdraw := self for: aTransfer.
	account register: transferwithdraw.	
	^ transferwithdraw.! !


!classDefinition: #Withdraw category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !

!Withdraw methodsFor: 'initialization' stamp: 'nacho 5/15/2018 18:12:26'!
transferNet: aTransferNet
	^ aTransferNet aZeroTransferNet .! !


!Withdraw methodsFor: 'value' stamp: 'nacho 5/10/2018 19:21:04'!
value

	^ value ! !


!Withdraw methodsFor: 'modifyAccounts' stamp: 'nacho 5/10/2018 19:48:33'!
modifyBalance: aBalance
	
	^ aBalance - value.
! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:00:18'!
accept: aTransactionVisitor
	^aTransactionVisitor visitWithdraw: self.
	! !

!Withdraw methodsFor: 'as yet unclassified' stamp: 'nacho 5/15/2018 18:04:11'!
investmentEarning: anInvestmentEarning 
	^anInvestmentEarning aZeroInvestmentEarning .! !

!Withdraw methodsFor: 'as yet unclassified' stamp: 'nacho 5/15/2018 18:12:09'!
investmentNet: anInvestmentNet
	^anInvestmentNet aZeroInvestmentNet .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'nacho 5/10/2018 19:02:25'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #AccountTransactionVisitor category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransactionVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransactionVisitor methodsFor: 'visit messages' stamp: 'Nacho 5/16/2018 20:19:26'!
visitCertificateOfDeposit: aCertificateOfDeposit
	self subclassResponsibility .
! !

!AccountTransactionVisitor methodsFor: 'visit messages' stamp: 'Nacho 5/16/2018 20:19:40'!
visitDeposit: aDeposit
	self subclassResponsibility .
! !

!AccountTransactionVisitor methodsFor: 'visit messages' stamp: 'Nacho 5/16/2018 20:19:51'!
visitTransferDeposit: aDeposit
	self subclassResponsibility .
! !

!AccountTransactionVisitor methodsFor: 'visit messages' stamp: 'Nacho 5/16/2018 20:31:51'!
visitTransferWithdraw: aDeposit
	self subclassResponsibility .
! !

!AccountTransactionVisitor methodsFor: 'visit messages' stamp: 'Nacho 5/16/2018 20:32:05'!
visitWithdraw: aDeposit
	self subclassResponsibility .
! !


!classDefinition: #AccountSummaryVisitor category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor subclass: #AccountSummaryVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountSummaryVisitor methodsFor: 'print' stamp: 'Nacho 5/16/2018 21:20:51'!
visitCertificateOfDeposit: aCertificateOfDeposit
	
	^'Plazo fijo por ', ( (aCertificateOfDeposit value) printString) , ' durante ', ( (aCertificateOfDeposit numberOfDays) printString) , ' dias a una tna de ',   ( (100* (aCertificateOfDeposit tna )) printString )  ,'%'! !

!AccountSummaryVisitor methodsFor: 'print' stamp: 'Nacho 5/16/2018 20:42:45'!
visitDeposit: aDeposit
	^'Deposito por ', ((aDeposit value) printString).
	! !

!AccountSummaryVisitor methodsFor: 'print' stamp: 'Nacho 5/16/2018 20:49:21'!
visitTransferDeposit: aTransferDeposit
	^'Transferencia por ', ((aTransferDeposit transfer value) printString).! !

!AccountSummaryVisitor methodsFor: 'print' stamp: 'Nacho 5/16/2018 20:50:15'!
visitTransferWithdraw: aTransferWithdraw
	^'Transferencia por -', ((aTransferWithdraw transfer value) printString).! !

!AccountSummaryVisitor methodsFor: 'print' stamp: 'Nacho 5/16/2018 20:48:21'!
visitWithdraw: aWithdraw
	^'Extraccion por ', ((aWithdraw value) printString).! !


!AccountSummaryVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:09:29'!
accountSummaryOf: anAccount

	|summaryArray|
	summaryArray  := OrderedCollection new.
	anAccount transactions 
								do: [ :aTransaction | summaryArray add: (aTransaction accept: self) ].
								
	^summaryArray.! !


!classDefinition: #InvestmentEarningsVisitor category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor subclass: #InvestmentEarningsVisitor
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InvestmentEarningsVisitor methodsFor: 'initialization' stamp: 'nacho 5/13/2018 20:05:58'!
initialize 
	value:= 0.! !

!InvestmentEarningsVisitor methodsFor: 'initialization' stamp: 'nacho 5/13/2018 20:05:42'!
value 
	^value.! !


!InvestmentEarningsVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:09:57'!
investmentEarningsOf: anAccount 
		^anAccount transactions 
								inject: 0 
								into: [ :investmentValue :aTransaction | investmentValue + (aTransaction accept: self)].! !


!InvestmentEarningsVisitor methodsFor: 'Transactions - Interactions' stamp: 'Nacho 5/16/2018 21:08:15'!
visitCertificateOfDeposit: aCertificateOfDeposit
	^(((aCertificateOfDeposit value)* ((aCertificateOfDeposit tna)/360)) * (aCertificateOfDeposit numberOfDays)).! !

!InvestmentEarningsVisitor methodsFor: 'Transactions - Interactions' stamp: 'Nacho 5/16/2018 21:04:54'!
visitDeposit: aDeposit
	^0.! !

!InvestmentEarningsVisitor methodsFor: 'Transactions - Interactions' stamp: 'Nacho 5/16/2018 21:05:49'!
visitTransferDeposit: aTransferDeposit
	^0.! !

!InvestmentEarningsVisitor methodsFor: 'Transactions - Interactions' stamp: 'Nacho 5/16/2018 21:05:30'!
visitTransferWithdraw: aTransferWithdraw
	^0.! !

!InvestmentEarningsVisitor methodsFor: 'Transactions - Interactions' stamp: 'Nacho 5/16/2018 21:05:10'!
visitWithdraw: aWithdraw
	^0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvestmentEarningsVisitor class' category: #'PortfolioTreePrinter-Ejercicio'!
InvestmentEarningsVisitor class
	instanceVariableNames: ''!

!InvestmentEarningsVisitor class methodsFor: 'as yet unclassified' stamp: 'nacho 5/13/2018 20:06:32'!
initialize 
	^self new initialize.! !


!classDefinition: #InvestmentNetVisitor category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor subclass: #InvestmentNetVisitor
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InvestmentNetVisitor methodsFor: 'initialization' stamp: 'nacho 5/13/2018 19:42:07'!
initialize 
	value := 0.! !

!InvestmentNetVisitor methodsFor: 'initialization' stamp: 'nacho 5/13/2018 19:41:36'!
value 
	^value.! !


!InvestmentNetVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:13:36'!
investmentNetOf: anAccount 
	
	^anAccount transactions 
								inject: 0 
								into: [ :netValue :aTransaction | netValue + (aTransaction accept: self)].! !

!InvestmentNetVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:11:05'!
visitDeposit: aDeposit 
	^0.! !

!InvestmentNetVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:11:16'!
visitTransferDeposit: aTransferDeposit 
	^0.! !

!InvestmentNetVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:11:28'!
visitTransferWithdraw: aTransferWithdraw 
	^0.! !

!InvestmentNetVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:11:41'!
visitWithdraw: aWithdraw 
	^0.! !


!InvestmentNetVisitor methodsFor: 'Transaction-Interactions' stamp: 'Nacho 5/16/2018 21:13:09'!
visitCertificateOfDeposit: aCertificateOfDeposit
	^aCertificateOfDeposit value.	! !


!classDefinition: #TransferNetVisitor category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor subclass: #TransferNetVisitor
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferNetVisitor methodsFor: 'as yet unclassified' stamp: 'nacho 5/13/2018 18:40:06'!
initialize 
 value:= 0.! !

!TransferNetVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:14:35'!
transferNetOf: anAccount 
	^anAccount transactions
								inject: 0 
								into: [ :netValue :aTransaction | netValue + (aTransaction accept: self)].
					! !

!TransferNetVisitor methodsFor: 'as yet unclassified' stamp: 'nacho 5/13/2018 18:38:32'!
value 
 ^value.! !

!TransferNetVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:15:03'!
visitCertificateOfDeposit: aDeposit
	^0.! !

!TransferNetVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:14:56'!
visitDeposit: aDeposit
	^0.! !

!TransferNetVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:17:26'!
visitTransferDeposit: aTransferDeposit
	^ aTransferDeposit transfer value.! !

!TransferNetVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:16:58'!
visitTransferWithdraw: aTransferWithdraw
	^(-1*(aTransferWithdraw transfer value))! !

!TransferNetVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:16:02'!
visitWithdraw: aWithdraw
	^0.! !


!TransferNetVisitor methodsFor: 'TransactionInteractions' stamp: 'nacho 5/15/2018 17:01:02'!
aTransferDepositTransferNet:anAmount
	^anAmount! !

!TransferNetVisitor methodsFor: 'TransactionInteractions' stamp: 'nacho 5/15/2018 17:01:23'!
aTransferWithdrawTransferNet:anAmount
	^anAmount.! !

!TransferNetVisitor methodsFor: 'TransactionInteractions' stamp: 'nacho 5/15/2018 18:08:33'!
aZeroTransferNet
	^0.! !


!classDefinition: #AccountVisitor category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 22:10:09'!
visitPortfolio: aPortfolio
	self subclassResponsibility .! !

!AccountVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 22:10:27'!
visitReceptiveAccount: aReceptiveAccount
	self subclassResponsibility .! !


!classDefinition: #PortfolioPrinterVisitor category: #'PortfolioTreePrinter-Ejercicio'!
AccountVisitor subclass: #PortfolioPrinterVisitor
	instanceVariableNames: 'portfolio accountNames lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!PortfolioPrinterVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 22:12:57'!
lines 

	lines := OrderedCollection new. 
	
	portfolio accept: self.
	
	^lines.! !

!PortfolioPrinterVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:22:09'!
visitPortfolio: aPortfolio 
	lines add: ((' '), (accountNames at: aPortfolio)).
	(lines size = 1) 
		ifTrue:[
					|portfolioNameWITHOUTSPACE|					
					portfolioNameWITHOUTSPACE := (lines first) copyReplaceAll: ' ' with: ''.
					lines at:1 put: portfolioNameWITHOUTSPACE.
				].
	
	aPortfolio printPortfolioAccountsWith: self.! !

!PortfolioPrinterVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:22:18'!
visitReceptiveAccount: aReceptiveAccount 	
	
	( ((accountNames at:aReceptiveAccount) = (accountNames values) last) "| ((accountNames at:aReceptiveAccount) = (accountNames values) first)"  )
	ifTrue:[^lines add:((' '), (accountNames at:aReceptiveAccount)).]
	ifFalse:[^lines add:(('  '), (accountNames at:aReceptiveAccount)).]
	! !


!PortfolioPrinterVisitor methodsFor: 'initialization' stamp: 'nacho 5/15/2018 20:25:09'!
initializeWithPortfolio: aPortfolio andNamigAccountsWith: aDictionary
	portfolio  := aPortfolio .
	accountNames := aDictionary.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioPrinterVisitor class' category: #'PortfolioTreePrinter-Ejercicio'!
PortfolioPrinterVisitor class
	instanceVariableNames: ''!

!PortfolioPrinterVisitor class methodsFor: 'as yet unclassified' stamp: 'nacho 5/15/2018 20:25:52'!
initializeWithPortfolio: aPortfolio andNamigAccountsWith: aDictionary
	^self new initializeWithPortfolio: aPortfolio andNamigAccountsWith: aDictionary.! !


!classDefinition: #ReversePortfolioPrinterVisitor category: #'PortfolioTreePrinter-Ejercicio'!
AccountVisitor subclass: #ReversePortfolioPrinterVisitor
	instanceVariableNames: 'portfolio accountNames'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!ReversePortfolioPrinterVisitor methodsFor: 'initialization' stamp: 'Nacho 5/16/2018 16:31:22'!
initializeWithPortfolio: aPortfolio andNamigAccountsWith: aDictionary
	portfolio  := aPortfolio .
	accountNames := aDictionary.! !


!ReversePortfolioPrinterVisitor methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 21:21:56'!
lines
	^ (PortfolioPrinterVisitor
		initializeWithPortfolio: portfolio
		andNamigAccountsWith: accountNames) lines reverse.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReversePortfolioPrinterVisitor class' category: #'PortfolioTreePrinter-Ejercicio'!
ReversePortfolioPrinterVisitor class
	instanceVariableNames: ''!

!ReversePortfolioPrinterVisitor class methodsFor: 'initialization' stamp: 'Nacho 5/16/2018 16:31:41'!
initializeWithPortfolio: aPortfolio andNamigAccountsWith: aDictionary
	^self new initializeWithPortfolio: aPortfolio andNamigAccountsWith: aDictionary.! !


!classDefinition: #SummarizingAccount category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummarizingAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:34'!
manages: anAccount

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:34'!
registers: aTransaction

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:34'!
balance

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!
transactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/8/2018 16:46:26'!
anyManagedAccountManages: anAccount 

	^accounts anySatisfy: [ :managedAccount | (managedAccount manages: anAccount) or: [ anAccount manages: managedAccount ] ] ! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/8/2018 16:46:01'!
manages: anAccount

	^ self = anAccount  or: [ self anyManagedAccountManages: anAccount ]! !

!Portfolio methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 19:20'!
registers: aTransaction

	^ accounts anySatisfy: [ :anAccount | anAccount registers: aTransaction ]  ! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 8/13/2017 17:47:44'!
balance

	^ accounts sum: [ :account | account balance ]
! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 9/25/2017 19:40:20'!
transactions 

	^ accounts 
		inject: OrderedCollection new 
		into: [ :transactions :account | transactions addAll: account transactions. transactions ]
	! !

!Portfolio methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 19:27'!
transactionsOf: anAccount 

	^ (self manages: anAccount)
		ifTrue: [ anAccount transactions ] 
		ifFalse: [ self error: self class accountNotManagedMessageDescription]
	! !


!Portfolio methodsFor: 'variable inicialization' stamp: 'AL 5/7/2018 21:10:10'!
initializeWith: anAccount1 with: anAccount2
	
	accounts _ OrderedCollection new.
	accounts add: anAccount1.
	accounts add: anAccount2.
	! !


!Portfolio methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 19:19'!
initializeWithAll: aCollectionOfAccounts

	accounts := aCollectionOfAccounts   ! !


!Portfolio methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 22:12:00'!
accept: aPortfolioPrinter
	^aPortfolioPrinter visitPortfolio: self.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'nacho 5/15/2018 19:31:44'!
accounts 
	^accounts ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 22:14:21'!
printPortfolioAccountsWith: aPortfolioPrinter
	
	accounts do:[:anAccount | anAccount accept: aPortfolioPrinter]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'PortfolioTreePrinter-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:33:13'!
with: leftAccount with: rightAccount

	^ self withAll: (Array with: leftAccount with: rightAccount)! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:40:55'!
withAll: aCollectionOfAccounts

	self checkCreationPreconditions: aCollectionOfAccounts.
	
	^self new initializeWithAll: aCollectionOfAccounts ! !


!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!
check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts

	^ aCollectionOfAccounts do: [ :targetAccount | 
			(sourceAccount = targetAccount) not ifTrue: [ 
				(sourceAccount manages: targetAccount) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ] ] ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkAccountsAreUnique: aCollectionOfAccounts

	aCollectionOfAccounts asSet size = aCollectionOfAccounts size
		ifFalse: [ self error: self accountAlreadyManagedErrorMessage ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkCreationPreconditions: aCollectionOfAccounts

	self checkAccountsAreUnique: aCollectionOfAccounts.
	self checkNoCircularReferencesIn: aCollectionOfAccounts! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!
checkNoCircularReferencesIn: aCollectionOfAccounts

	aCollectionOfAccounts do: [ :sourceAccount | self check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts ]! !


!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:28'!
accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:27'!
accountNotManagedMessageDescription
	
	^ 'Account not managed'! !


!classDefinition: #ReceptiveAccount category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'nacho 5/10/2018 19:45:50'!
balance

	^ transactions inject: 0 into: [ :balance :transaction | transaction modifyBalance:balance ]! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'nacho 5/15/2018 18:44:17'!
manages: anAccount

	^ self = anAccount ! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:37'!
registers: aTtransaction

	^ transactions includes: aTtransaction 
! !


!ReceptiveAccount methodsFor: 'summary' stamp: 'nacho 5/15/2018 19:07:26'!
accountSummary 
	^transactions.! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'Nacho 5/16/2018 22:12:39'!
accept: aPortfolioPrinter
	^aPortfolioPrinter visitReceptiveAccount: self.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'nacho 5/15/2018 20:38:05'!
printAccount: aPortfolioPrinter
	^aPortfolioPrinter printReceptiveAccount: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: #'PortfolioTreePrinter-Ejercicio'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'nacho 5/8/2018 17:21:19'!
accountNotManagedMessageDescription

	^'Account not managed'.! !


!classDefinition: #Transfer category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value from to transferDeposit transferWithdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Transfer methodsFor: 'interactionsBetweenAccounts' stamp: 'nacho 5/10/2018 21:12:09'!
from 
 ^from.! !

!Transfer methodsFor: 'interactionsBetweenAccounts' stamp: 'nacho 5/10/2018 21:12:16'!
to
 ^to.! !

!Transfer methodsFor: 'interactionsBetweenAccounts' stamp: 'nacho 5/10/2018 21:12:45'!
transferDeposit
 ^transferDeposit .! !

!Transfer methodsFor: 'interactionsBetweenAccounts' stamp: 'nacho 5/10/2018 21:12:30'!
transferWithdraw 
 ^transferWithdraw .! !

!Transfer methodsFor: 'interactionsBetweenAccounts' stamp: 'nacho 5/10/2018 19:57:32'!
value 
	^value.! !


!Transfer methodsFor: 'initialization' stamp: 'nacho 5/10/2018 21:01:47'!
register: anAmount from: fromAccount to: toAccount.
	
	from := fromAccount.
	to := toAccount.
	value := anAmount.
	
	transferDeposit := TransferDeposit register:self on:toAccount.
	
	transferWithdraw := TransferWithdraw register:self on:fromAccount.
! !


!Transfer methodsFor: 'as yet unclassified' stamp: 'nacho 5/13/2018 17:35:32'!
printTransaction 
 
	^'Transferencia por ', (value printString ).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'PortfolioTreePrinter-Ejercicio'!
Transfer class
	instanceVariableNames: 'value'!

!Transfer class methodsFor: 'intitialization' stamp: 'nacho 5/10/2018 21:06:44'!
register: anAmount from: fromAccount to: toAccount.
 ^self new register: anAmount from: fromAccount to: toAccount.! !


!Transfer class methodsFor: 'nil' stamp: 'nacho 5/10/2018 19:57:44'!
value 
 ^value.! !

InvestmentEarningsVisitor initialize!