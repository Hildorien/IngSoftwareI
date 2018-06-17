!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:04'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #TusLibrosSystemTest category: #TusLibros!
TestCase subclass: #TusLibrosSystemTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosSystemTest methodsFor: 'Testing' stamp: 'Nacho 6/14/2018 21:16:31'!
test01TusLibrosSystemCannotCreateCartWhenUserDoesNotExist

	|tusLibrosSystem username password| 
	
	tusLibrosSystem  := testObjectsFactory newTusLibrosSystem.
	username:= testObjectsFactory anInvalidUser .
	password := testObjectsFactory aValidPassword.
		self 
		should: [tusLibrosSystem createCartWithUser: username andPassword: password.  ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = tusLibrosSystem usernameDoesNotExistErrorMessage .
			self assert:  tusLibrosSystem carts isEmpty .]! !

!TusLibrosSystemTest methodsFor: 'Testing' stamp: 'Nacho 6/14/2018 21:17:29'!
test02TusLibrosSystemCannotCreateCartWhenPasswordIsInvalid

	|tusLibrosSystem username password| 
	
	tusLibrosSystem  := testObjectsFactory newTusLibrosSystem.
	username:= testObjectsFactory aValidUser .
	password := testObjectsFactory anInvalidPassword .
		self 
		should: [tusLibrosSystem createCartWithUser: username andPassword: password.  ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = tusLibrosSystem invalidPasswordErrorMessage .
			self assert:  tusLibrosSystem carts isEmpty .]! !

!TusLibrosSystemTest methodsFor: 'Testing' stamp: 'Nacho 6/14/2018 21:35:18'!
test03TusLibrosSystemDoesNotRaiseErrorsOnValidCredentials
	| tusLibrosSystem username password |
	tusLibrosSystem _ testObjectsFactory newTusLibrosSystem.
	username _ testObjectsFactory aValidUser.
	password _ testObjectsFactory aValidPassword.
	self
		shouldnt: [
			tusLibrosSystem
				createCartWithUser: username
				andPassword: password ]
		raise: Error.! !

!TusLibrosSystemTest methodsFor: 'Testing' stamp: 'Nacho 6/16/2018 14:49:23'!
test04TusLibrosSystemCanAddItemsToCreatedCart
	| tusLibrosSystem username password cartId |
	tusLibrosSystem _ testObjectsFactory newTusLibrosSystem.
	username _ testObjectsFactory aValidUser.
	password _ testObjectsFactory aValidPassword.
	cartId  := tusLibrosSystem createCartWithUser: username andPassword: password.
	self
		shouldnt: [ tusLibrosSystem addToCart: cartId aQuantity: 1 ofBook: self aValidBook .
			 ]
		raise: Error.! !

!TusLibrosSystemTest methodsFor: 'Testing' stamp: 'Nacho 6/16/2018 14:50:10'!
test05TusLibrosSystemCannotAddItemsToNotCreatedCart
	| tusLibrosSystem cartId |
	tusLibrosSystem _ testObjectsFactory newTusLibrosSystem.
	cartId := tusLibrosSystem newCartId .
	self
		should: [ tusLibrosSystem addToCart: cartId aQuantity: 1 ofBook: self aValidBook .
			 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText  = tusLibrosSystem cartIdIsNotRegisteredErrorMessage ]! !

!TusLibrosSystemTest methodsFor: 'Testing' stamp: 'Nacho 6/16/2018 14:49:47'!
test06TusLibrosSystemCannotAddItemsNotSoldByStore
	| tusLibrosSystem username password cartId |
	tusLibrosSystem _ testObjectsFactory newTusLibrosSystem.
	username _ testObjectsFactory aValidUser.
	password _ testObjectsFactory aValidPassword.
	cartId  := tusLibrosSystem createCartWithUser: username andPassword: password.
	self
		should: [ tusLibrosSystem addToCart: cartId aQuantity: 1 ofBook: self aInvalidBook .
			 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText  = tusLibrosSystem itemOutOfCatalogErrorMessage]! !

!TusLibrosSystemTest methodsFor: 'Testing' stamp: 'Nacho 6/16/2018 14:37:22'!
test07TusLibrosSystemCannotListCartOfInvalidCart
	| tusLibrosSystem cartId |
	tusLibrosSystem _ testObjectsFactory newTusLibrosSystem.
	cartId := tusLibrosSystem newCartId .
	self
		should: [ tusLibrosSystem listCart: cartId.
			 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText  = tusLibrosSystem cartIdIsNotRegisteredErrorMessage ]! !

!TusLibrosSystemTest methodsFor: 'Testing' stamp: 'Nacho 6/16/2018 14:42:46'!
test08TusLibrosSystemListCartOfEmptyCartReturnsEmptyItems
| tusLibrosSystem username password cartId items|
	tusLibrosSystem _ testObjectsFactory newTusLibrosSystem.
	username _ testObjectsFactory aValidUser.
	password _ testObjectsFactory aValidPassword.
	cartId  := tusLibrosSystem createCartWithUser: username andPassword: password.
	items := tusLibrosSystem listCart: cartId .
	
	self assert: items isEmpty .! !

!TusLibrosSystemTest methodsFor: 'Testing' stamp: 'Nacho 6/16/2018 14:50:33'!
test09TusLibrosSystemListCartReturnsItemsCorrectly
| tusLibrosSystem username password cartId items|
	tusLibrosSystem _ testObjectsFactory newTusLibrosSystem.
	username _ testObjectsFactory aValidUser.
	password _ testObjectsFactory aValidPassword.
	cartId  := tusLibrosSystem createCartWithUser: username andPassword: password.
	tusLibrosSystem addToCart: cartId aQuantity: 2 ofBook: self aValidBook .
	items := tusLibrosSystem listCart: cartId .
		
	self assert: (items occurrencesOf: testObjectsFactory itemSellByTheStore ) = 2. 
	! !

!TusLibrosSystemTest methodsFor: 'Testing' stamp: 'imf 6/17/2018 15:46:35'!
test10TusLibrosSystemCannotCheckoutWithInvalidCart

| tusLibrosSystem cartId |
	tusLibrosSystem _ testObjectsFactory newTusLibrosSystemWithMerchantProcessor: self.
	cartId := tusLibrosSystem newCartId .
	self
		should: [ tusLibrosSystem  checkOutCart: cartId withCreditCard:  self aValidCreditCard on: self today ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText  = tusLibrosSystem cartIdIsNotRegisteredErrorMessage ].
		! !

!TusLibrosSystemTest methodsFor: 'Testing' stamp: 'imf 6/17/2018 15:51:44'!
test11TusLibrosSystemCannotCheckoutEmptyCart

| tusLibrosSystem username password cartId|
	tusLibrosSystem _ testObjectsFactory newTusLibrosSystemWithMerchantProcessor: self.
	username _ testObjectsFactory aValidUser.
	password _ testObjectsFactory aValidPassword.
	cartId  := tusLibrosSystem createCartWithUser: username andPassword: password.	
	self
		should: [ tusLibrosSystem  checkOutCart: cartId withCreditCard:  self aValidCreditCard on: self today ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText  = Cashier cartCanNotBeEmptyErrorMessage ].
		! !

!TusLibrosSystemTest methodsFor: 'Testing' stamp: 'imf 6/17/2018 15:59:41'!
test12TusLibrosSystemCannotCheckoutWithInvalidCreditCard

| tusLibrosSystem username password cartId|
	debitBehavior _ [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	tusLibrosSystem _ testObjectsFactory newTusLibrosSystemWithMerchantProcessor: self.
	username _ testObjectsFactory aValidUser.
	password _ testObjectsFactory aValidPassword.
	cartId  := tusLibrosSystem createCartWithUser: username andPassword: password.	
	tusLibrosSystem addToCart: cartId aQuantity: 1 ofBook: self aValidBook .
	self
		should: [ tusLibrosSystem  checkOutCart: cartId withCreditCard:  self anInvalidCreditCard on: self today ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText  = Cashier canNotChargeAnExpiredCreditCardErrorMessage ].
		! !

!TusLibrosSystemTest methodsFor: 'Testing' stamp: 'imf 6/17/2018 16:05:31'!
test13TusLibrosSystemDoesNotRaiseErrorsOnValidCheckout

| tusLibrosSystem username password cartId debitedAmount debitedCreditCard |
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmount := anAmount.
		debitedCreditCard := aCreditCard ].
	tusLibrosSystem _ testObjectsFactory newTusLibrosSystemWithMerchantProcessor: self.
	username _ testObjectsFactory aValidUser.
	password _ testObjectsFactory aValidPassword.
	cartId  := tusLibrosSystem createCartWithUser: username andPassword: password.	
	tusLibrosSystem addToCart: cartId aQuantity: 1 ofBook: self aValidBook .
		self
		shouldnt: [ tusLibrosSystem  checkOutCart: cartId withCreditCard:  self aValidCreditCard on: self today ]
		raise: Error.
		! !

!TusLibrosSystemTest methodsFor: 'Testing' stamp: 'imf 6/17/2018 17:52:21'!
test14TusLibrosSystemListPurchasesReturnsSalesFromGivenClient

| tusLibrosSystem username password cartId debitedAmount debitedCreditCard sales totalOfSale itemsPurchased ordenDeCompra|
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmount := anAmount.
		debitedCreditCard := aCreditCard ].
	tusLibrosSystem _ testObjectsFactory newTusLibrosSystemWithMerchantProcessor: self.
	username _ testObjectsFactory aValidUser.
	password _ testObjectsFactory aValidPassword.
	cartId  _ tusLibrosSystem createCartWithUser: username andPassword: password.	
	tusLibrosSystem addToCart: cartId aQuantity: 2 ofBook: self aValidBook .
	tusLibrosSystem  checkOutCart: cartId withCreditCard:  self aValidCreditCard on: self today.
	totalOfSale _ ((tusLibrosSystem carts at: cartId) total).
	itemsPurchased  _ (tusLibrosSystem carts at: cartId) getContents.
	ordenDeCompra  _ itemsPurchased add:totalOfSale .
	
	"sales _ tusLibrosSystem listPurchasesWithClientId: username andPassword: password. 
	
	self assert: sales includes: ordenDeCompra ."
	
		! !


!TusLibrosSystemTest methodsFor: 'setup' stamp: 'Nacho 6/16/2018 14:49:04'!
aInvalidBook  
  ^testObjectsFactory itemNotSellByTheStore .! !

!TusLibrosSystemTest methodsFor: 'setup' stamp: 'Nacho 6/16/2018 14:48:51'!
aValidBook  
  ^testObjectsFactory itemSellByTheStore .! !

!TusLibrosSystemTest methodsFor: 'setup' stamp: 'imf 6/17/2018 15:34:21'!
aValidCreditCard 
	^testObjectsFactory notExpiredCreditCard .! !

!TusLibrosSystemTest methodsFor: 'setup' stamp: 'imf 6/17/2018 15:36:28'!
aValidDate 
	^testObjectsFactory.! !

!TusLibrosSystemTest methodsFor: 'setup' stamp: 'imf 6/17/2018 15:34:41'!
aValidUser
	^testObjectsFactory aValidUser .! !

!TusLibrosSystemTest methodsFor: 'setup' stamp: 'imf 6/17/2018 15:53:36'!
anInvalidCreditCard 
	^testObjectsFactory expiredCreditCard ! !

!TusLibrosSystemTest methodsFor: 'setup' stamp: 'imf 6/17/2018 17:53:32'!
anotherValidBook  
  ^testObjectsFactory itemSellByTheStoreTwo.! !

!TusLibrosSystemTest methodsFor: 'setup' stamp: 'imf 6/17/2018 16:07:06'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !

!TusLibrosSystemTest methodsFor: 'setup' stamp: 'imf 6/17/2018 15:26:15'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [:anAmout :aCreditCard | ].! !

!TusLibrosSystemTest methodsFor: 'setup' stamp: 'imf 6/17/2018 15:46:21'!
today 
	^testObjectsFactory today .! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'Nacho 6/16/2018 14:32:38'!
getContents 
	^items copy.! !

!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total cartId username'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:07'!
createSale

	^ Sale of: total
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !

!Cashier methodsFor: 'checkout - private' stamp: 'imf 6/17/2018 16:30:24'!
registerSaleOn: aUserSales 
	 
	aUserSales add: self createSale .! !


!Cashier methodsFor: 'checkout' stamp: 'imf 6/17/2018 17:14:50'!
checkOut
	|userSales|
	
	userSales  _ salesBook at: username .
	
	self calculateTotal.
	self debitTotal.
	self registerSaleOn: userSales .
	
	^ total.! !


!Cashier methodsFor: 'initialization' stamp: 'imf 6/17/2018 17:13:48'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook cartId: aCartId forUser: aUsername
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook.
	
	cartId := aCartId.
	
	username := aUsername .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'imf 6/17/2018 17:09:02'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook	cartId: aCartId for: aUsername.
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook cartId: aCartId forUser: aUsername .! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:47'!
initializeTotal: aTotal

	total := aTotal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:47'!
of: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeTotal: aTotal ! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !


!StoreTestObjectsFactory methodsFor: 'tusLibros system' stamp: 'Nacho 6/14/2018 20:48:30'!
defaultDatabase 
	^ Dictionary new
		at: self aValidUser put: self aValidPassword;
		yourself ! !

!StoreTestObjectsFactory methodsFor: 'tusLibros system' stamp: 'imf 6/17/2018 15:20:52'!
newTusLibrosSystem
	^ TusLibrosSystem
		withUsersRegister: self defaultDatabase Catalog: self defaultCatalog MerchantProccesor:  self SalesBook: self defaultSalesBook .! !

!StoreTestObjectsFactory methodsFor: 'tusLibros system' stamp: 'imf 6/17/2018 15:24:06'!
newTusLibrosSystemWithMerchantProcessor: aMerchantProcessor
	^ TusLibrosSystem
		withUsersRegister: self defaultDatabase Catalog: self defaultCatalog MerchantProccesor:  aMerchantProcessor SalesBook: self defaultSalesBook .! !


!StoreTestObjectsFactory methodsFor: 'user' stamp: 'Nacho 6/14/2018 20:49:50'!
aValidPassword
	^'valid password'.! !

!StoreTestObjectsFactory methodsFor: 'user' stamp: 'Nacho 6/14/2018 20:49:13'!
aValidUser 
	^'Pepe Sanchez'.! !

!StoreTestObjectsFactory methodsFor: 'user' stamp: 'Nacho 6/14/2018 21:13:33'!
anInvalidPassword
	^'Invalid password'.! !

!StoreTestObjectsFactory methodsFor: 'user' stamp: 'Nacho 6/14/2018 21:13:18'!
anInvalidUser 
	^'Invalid user'.! !


!StoreTestObjectsFactory methodsFor: 'cashier' stamp: 'imf 6/17/2018 16:21:00'!
defaultSalesBook 

	^ Dictionary new.! !


!classDefinition: #TusLibrosSystem category: #TusLibros!
Object subclass: #TusLibrosSystem
	instanceVariableNames: 'catalog carts lastCartId registerUsers merchantProcessor salesBook usersId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosSystem methodsFor: 'cart creation' stamp: 'Nacho 6/16/2018 13:52:08'!
addNewCartSessionWithId: aCartId andCart: aCart. 
	carts at:aCartId put: aCart.! !

!TusLibrosSystem methodsFor: 'cart creation' stamp: 'imf 6/17/2018 17:03:37'!
createCartWithUser: aUsername andPassword: aPassword 
	|aCartId |
	self assertIsValidUsername: aUsername andPassword: aPassword.
	aCartId  := self newCartId.
	self addNewCartSessionWithId:  aCartId andCart: (Cart acceptingItemsOf: catalog).
	
	self registerCartId: aCartId for: aUsername.
	
	^aCartId.! !

!TusLibrosSystem methodsFor: 'cart creation' stamp: 'Nacho 6/16/2018 13:42:27'!
newCartId 
	lastCartId  := lastCartId  +1.
	^lastCartId .! !


!TusLibrosSystem methodsFor: 'initialization' stamp: 'imf 6/17/2018 17:26:03'!
initializeSalesBookWith: aUsernameList
	| aSalesBook | 
	
	aSalesBook  _ Dictionary  new.
	aUsernameList do:[ :aUsername | aSalesBook at: aUsername put: ( OrderedCollection new)].
	^ aSalesBook.! !

!TusLibrosSystem methodsFor: 'initialization' stamp: 'imf 6/17/2018 17:26:42'!
initializeWithUsers: aRegisterList Catalog: aCatalog MerchantProcessor: aMerchantProcessor SalesBook: aSalesBook.
	registerUsers _ aRegisterList .
	catalog _ aCatalog.
	merchantProcessor _ aMerchantProcessor .
	salesBook  _ (self initializeSalesBookWith: (aRegisterList keys)).
	lastCartId _ 0.
	carts _ Dictionary new.
	usersId  _ Dictionary new.! !

!TusLibrosSystem methodsFor: 'initialization' stamp: 'imf 6/17/2018 17:04:09'!
registerCartId: aCartId for: aUsername.
	usersId at:aCartId  put: aUsername .! !


!TusLibrosSystem methodsFor: 'accessing' stamp: 'imf 6/17/2018 14:48:21'!
cartWithId: cartId
	^ carts at: cartId.! !

!TusLibrosSystem methodsFor: 'accessing' stamp: 'Nacho 6/14/2018 20:54:01'!
carts 
 ^carts .! !


!TusLibrosSystem methodsFor: 'assertions' stamp: 'Nacho 6/16/2018 14:15:08'!
assertCartIsRegisteredWith: aCartId
	self.
	(carts includesKey: aCartId) ifFalse: [ self error: self cartIdIsNotRegisteredErrorMessage ].! !

!TusLibrosSystem methodsFor: 'assertions' stamp: 'imf 6/17/2018 14:45:37'!
assertIsValidUsername: aUsername andPassword: aPassword
	self.
	(registerUsers includesKey: aUsername)
		ifTrue: [
			(registerUsers at: aUsername) = aPassword ifFalse: [ self error: self invalidPasswordErrorMessage ]]
		ifFalse: [ self error: self usernameDoesNotExistErrorMessage ].! !


!TusLibrosSystem methodsFor: 'error messages' stamp: 'Nacho 6/16/2018 14:15:08'!
cartIdIsNotRegisteredErrorMessage
	^ 'cart id is not registered'.! !

!TusLibrosSystem methodsFor: 'error messages' stamp: 'Nacho 6/14/2018 21:04:56'!
invalidPasswordErrorMessage 
	^ 'Invalid password'.! !

!TusLibrosSystem methodsFor: 'error messages' stamp: 'Nacho 6/16/2018 14:22:33'!
itemOutOfCatalogErrorMessage 
	^ (Cart new) invalidItemErrorMessage.! !

!TusLibrosSystem methodsFor: 'error messages' stamp: 'Nacho 6/14/2018 21:05:35'!
usernameDoesNotExistErrorMessage 
	^'username does not exist'.! !


!TusLibrosSystem methodsFor: 'cart modification' stamp: 'imf 6/17/2018 14:48:21'!
addToCart: cartId aQuantity: anAmount ofBook: aBook
	| aCart |
	self assertCartIsRegisteredWith: cartId.
	aCart _ self cartWithId: cartId.
	aCart
		add: anAmount
		of: aBook.! !


!TusLibrosSystem methodsFor: 'cart accesing' stamp: 'imf 6/17/2018 17:14:23'!
checkOutCart: cartId withCreditCard: aCreditNumber on: aDate
	| aCart aCashier aUsername |
	
	self assertCartIsRegisteredWith: cartId.
	aUsername _ usersId  at: cartId .
	aCart _ self cartWithId: cartId.
	aCashier _ Cashier
		toCheckout: aCart
		charging: aCreditNumber
		throught: merchantProcessor
		on: aDate
		registeringOn: salesBook
		cartId: cartId
		for: aUsername .
		
	aCashier checkOut.! !

!TusLibrosSystem methodsFor: 'cart accesing' stamp: 'imf 6/17/2018 14:48:21'!
listCart: cartId
	| aCart |
	self assertCartIsRegisteredWith: cartId.
	aCart _ self cartWithId: cartId.
	^ aCart getContents.! !


!TusLibrosSystem methodsFor: 'purchases' stamp: 'imf 6/17/2018 17:56:51'!
listPurchases: aUsername and: aPassword 
 
 " Asertar que el usuario esta en el salesbook".! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosSystem class' category: #TusLibros!
TusLibrosSystem class
	instanceVariableNames: ''!

!TusLibrosSystem class methodsFor: 'initialization' stamp: 'imf 6/17/2018 15:12:12'!
withUsersRegister: aDatabase Catalog: aCatalog MerchantProccesor: aMerchantProcessor SalesBook: aSalesBook
	^ self new
		initializeWithUsers: aDatabase
		Catalog: aCatalog
		MerchantProcessor: aMerchantProcessor 
		SalesBook: aSalesBook .! !
