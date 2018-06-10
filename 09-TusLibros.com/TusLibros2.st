!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testSetupObjects'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'AL 6/9/2018 18:10:15'!
createCart
	
	^testSetupObjects createCart .! !

!CartTest methodsFor: 'support' stamp: 'AL 6/9/2018 18:10:27'!
defaultCatalog
	
	^testSetupObjects defaultCatalog .! !

!CartTest methodsFor: 'support' stamp: 'AL 6/9/2018 18:10:38'!
itemNotSellByTheStore
	
	^testSetupObjects itemNotSellByTheStore .! !

!CartTest methodsFor: 'support' stamp: 'AL 6/9/2018 18:10:52'!
itemSellByTheStore
		
	^testSetupObjects itemSellByTheStore .! !

!CartTest methodsFor: 'support' stamp: 'AL 6/9/2018 18:04:32'!
setUp

	testSetupObjects _ TestSetupObjects new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testSetupObjects'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 18:08:48'!
createCart
	
	^testSetupObjects createCart .! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 18:08:33'!
createExpiredCreditCard
	
	^testSetupObjects createExpiredCreditCard.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 18:08:55'!
createValidCreditCard
	
	^testSetupObjects createValidCreditCard .! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 18:09:17'!
defaultCatalog
	
	^testSetupObjects defaultCatalog .! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 18:09:38'!
itemNotSellByTheStore
	
	^testSetupObjects itemNotSellByTheStore .! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 18:09:50'!
itemSellByTheStore
	
	^testSetupObjects itemSellByTheStore .! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 18:04:22'!
setUp

	testSetupObjects _ TestSetupObjects new.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 17:59:57'!
test01aCashierCannotProcessAnEmptyCart
	| emptyCart |
	
	emptyCart _ self createCart.
		
	self
		should: [ Cashier for: emptyCart .]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier emptyCartCashierErrorMessage.
			].! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 17:26:21'!
test02aCashierCannotProcessACartWithExpiredCreditCard
	| aCart aCashier expiredCard |
	
	aCart _ self createCart.
	aCart add: self itemSellByTheStore .
	
	aCashier _ Cashier for: aCart.
	expiredCard _ self createExpiredCreditCard .
	
	self
		should: [ aCashier checkoutWithCreditCard: expiredCard. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = aCashier expiredCreditCardCheckoutErrorMessage. 
			].
		
		
	"tendriamos que asertar que no se hizo ningun pago? si todavia no tenemos un ente que los registre."! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 16:03:15'!
test03aCashierCanDoACheckoutForGivenPriceListAndCart
	| aCart aCashier priceList ticket |
	aCart _ self createCart.
	priceList _ Dictionary new.
	priceList
		at: self itemSellByTheStore
		put: 10 * dollar.
	aCashier _ Cashier for: priceList.
	aCart
		add: 2
		of: self itemSellByTheStore.
	ticket _ aCashier checkout: aCart.
	self
		assert: ticket
		equals: 20.! !


!classDefinition: #CreditCardTest category: #TusLibros!
TestCase subclass: #CreditCardTest
	instanceVariableNames: 'testSetupObjects'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'setup' stamp: 'AL 6/9/2018 18:06:42'!
createExpiredCreditCard
	
	^ testSetupObjects createExpiredCreditCard .
! !

!CreditCardTest methodsFor: 'setup' stamp: 'AL 6/9/2018 18:07:05'!
createInvalidNumberCreditCard
	
	^ testSetupObjects createInvalidNumberCreditCard .
! !

!CreditCardTest methodsFor: 'setup' stamp: 'AL 6/9/2018 18:07:18'!
createValidCreditCard
		
	^ testSetupObjects createValidCreditCard .
! !

!CreditCardTest methodsFor: 'setup' stamp: 'AL 6/9/2018 18:04:12'!
setUp

	testSetupObjects _ TestSetupObjects new.! !


!CreditCardTest methodsFor: 'testing' stamp: 'AL 6/9/2018 17:38:29'!
test01numberHasToBe16DigitsLong

	self
		should: [self createInvalidNumberCreditCard]
		raise: Error
		withExceptionDo: [ :Error | self assert: Error messageText = CreditCard invalidNumberErrorMessage]! !

!CreditCardTest methodsFor: 'testing' stamp: 'AL 6/9/2018 17:40:45'!
test02givenCreditCardWithExpiredDateHasExpired

	| card |
	
	card _ self createExpiredCreditCard. 
	
	self assert: card hasExpired.	! !

!CreditCardTest methodsFor: 'testing' stamp: 'AL 6/9/2018 17:40:57'!
test03givenCreditCardWithNotExpiredDateHasNotExpired
	| card |
	card _ self createValidCreditCard.
	self deny: card hasExpired.! !


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


!Cart methodsFor: 'assertions' stamp: 'AL 6/9/2018 18:16:05'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


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
	instanceVariableNames: 'cart catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'evaluating' stamp: 'AL 6/9/2018 18:22:54'!
checkoutWithCreditCard: aCreditCard
 
	aCreditCard hasExpired ifTrue: [^ Error signal: self expiredCreditCardCheckoutErrorMessage . ].! !


!Cashier methodsFor: 'initialization' stamp: 'AL 6/9/2018 17:15:48'!
for: aCart

	cart _ aCart.! !


!Cashier methodsFor: 'error handling' stamp: 'AL 6/9/2018 17:03:07'!
emptyCartCheckoutErrorMessage
	^ 'No se puede procesar un carrito vacio'.! !

!Cashier methodsFor: 'error handling' stamp: 'AL 6/9/2018 17:08:12'!
expiredCreditCardCheckoutErrorMessage

	^'No se puede transaccionar con una tarjeta vencida.'! !


!Cashier methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 17:25:55'!
cart

	^cart.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'class initialization' stamp: 'AL 6/9/2018 17:56:56'!
emptyCartCashierErrorMessage

	^ 'No se puede procesar un carrito vacio'! !

!Cashier class methodsFor: 'class initialization' stamp: 'AL 6/9/2018 17:56:37'!
for: aCart
	
	aCart isEmpty ifTrue: [^Error signal: self emptyCartCashierErrorMessage.].
		
	^self new for: aCart .! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'owner number expirationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'AL 6/9/2018 17:00:34'!
initializeWithOwner: anOwnerName withNumber: aCreditCardNumber withExpirationDate: anExpirationDateInMothAndYear

	owner _ anOwnerName.
	number _ aCreditCardNumber.
	expirationDate  _ anExpirationDateInMothAndYear.
	! !


!CreditCard methodsFor: 'accessing' stamp: 'AL 6/9/2018 16:28:15'!
expirationDate

	^expirationDate .! !

!CreditCard methodsFor: 'accessing' stamp: 'AL 6/9/2018 16:27:58'!
number

	^number.! !

!CreditCard methodsFor: 'accessing' stamp: 'AL 6/9/2018 16:27:40'!
owner

	^owner.! !


!CreditCard methodsFor: 'evaluating' stamp: 'AL 6/9/2018 17:06:41'!
hasExpired
	|today|
	
	today _ Date today .
	
	^(expirationDate yearNumber < today yearNumber ) or: [(expirationDate yearNumber = today yearNumber) and: [ expirationDate monthIndex < today monthIndex ]].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 17:39:33'!
invalidNumberErrorMessage	
	^ 'La tarjeta debe tener 16 digitos' .
	
	
	! !

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 17:40:32'!
withOwner: aName withNumber: aCreditCardNumber withExpirationDate: anExpirationDateInMonthAndYear
	
	(aCreditCardNumber size = 16) ifFalse: [^Error signal: self invalidNumberErrorMessage ].
	
	^ self new initializeWithOwner: aName withNumber: aCreditCardNumber withExpirationDate: anExpirationDateInMonthAndYear .
	
	
	! !


!classDefinition: #TestSetupObjects category: #TusLibros!
Object subclass: #TestSetupObjects
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TestSetupObjects methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 18:08:10'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!TestSetupObjects methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 18:02:43'!
createExpiredCreditCard
	
	| today expirationDate |
	
	today _ Date today.
	
	expirationDate _ Month month: ((today monthIndex) -1) year: (today yearNumber). 
	
	^ CreditCard withOwner: 'Pepe Sanchez' withNumber: '4509990134218721' withExpirationDate: expirationDate.

	! !

!TestSetupObjects methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 18:02:52'!
createInvalidNumberCreditCard
	
	| today expirationDate |
	
	today _ Date today.
	
	expirationDate _ Month month: ((today monthIndex) + 5) year: (today yearNumber). 
	
	^ CreditCard withOwner: 'Pepe Sanchez' withNumber: '4518721' withExpirationDate: expirationDate.
! !

!TestSetupObjects methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 18:03:02'!
createValidCreditCard
	
	| today expirationDate |
	
	today _ Date today.
	
	expirationDate _ Month month: ((today monthIndex) + 5) year: (today yearNumber). 
	
	^ CreditCard withOwner: 'Pepe Sanchez' withNumber: '4509990134218721' withExpirationDate: expirationDate.

	
	! !

!TestSetupObjects methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 18:21:18'!
defaultCatalog
	|catalog|
	
	catalog _ Dictionary new.
	catalog at: self itemSellByTheStore put: 5.
	
	^ catalog.! !

!TestSetupObjects methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 18:04:51'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!TestSetupObjects methodsFor: 'as yet unclassified' stamp: 'AL 6/9/2018 18:04:43'!
itemSellByTheStore
	
	^ 'validBook'! !
