!classDefinition: #TusLibrosTest category: #TusLibros!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: 'aCart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosTest methodsFor: 'testing' stamp: 'AL 6/6/2018 20:34:53'!
test01newCartIsEmpty

	self assert: aCart isEmpty.
	! !

!TusLibrosTest methodsFor: 'testing' stamp: 'AL 6/6/2018 20:35:52'!
test02givenCartIsNotEmptyAfterAddingAnItem

	aCart addItem: 1.
	self deny: aCart isEmpty.
	self assert: (aCart contains: 1).! !

!TusLibrosTest methodsFor: 'testing' stamp: 'AL 6/6/2018 20:40:01'!
test03diferentItemsCanBeAddedToCart

	aCart addItem: 1.
	aCart addItem: 2.
	self deny: aCart isEmpty.
	self assert: (aCart contains: 1).
	self assert: (aCart contains: 2).! !

!TusLibrosTest methodsFor: 'testing' stamp: 'AL 6/6/2018 20:40:57'!
test04itemsCanBeAddedToCartMoreThanOnce

	aCart addItem: 1.
	aCart addItem: 1.
	self deny: aCart isEmpty.
	self
		assert: (aCart quantityOf: 1)
		equals: 2.! !

!TusLibrosTest methodsFor: 'testing' stamp: 'AL 6/6/2018 20:41:12'!
test05canNotRemoveABookFromCartIfAbsent

	aCart addItem: 2.
	
	self
		should: [ aCart remove: 1 ]
		raise: Error
		withExceptionDo: [ :anError |
			self deny: aCart isEmpty.
			self assert: anError messageText = Cart itemNotIncludedInCartErrorMessage .
			]! !

!TusLibrosTest methodsFor: 'testing' stamp: 'AL 6/6/2018 20:41:48'!
test06removingASingleUnitOfAnItemReducesItsQuantityByOne

	aCart addItem: 2.
	aCart addItem: 2.
	aCart addItem: 1.
	
	aCart remove: 2.
	aCart remove: 2.
	aCart remove: 1.

	
	self deny: (aCart contains: 1).
	self deny: (aCart contains: 2).
	self assert: aCart isEmpty .

		! !

!TusLibrosTest methodsFor: 'testing' stamp: 'AL 6/6/2018 20:42:11'!
test07CartIsEmptyAfterRemovingAllItems

	aCart addItem: 2.
	aCart addItem: 2.
	aCart addItem: 1.
	aCart remove: 2.
	aCart remove: 2.
	aCart remove: 1.
	self
		assert: (aCart quantityOf: 2)
		equals: 0.! !

!TusLibrosTest methodsFor: 'testing' stamp: 'AL 6/6/2018 20:45:10'!
test08itemOutsideCatalogCanNotBeAddedToCart

	self
		should: [ aCart addItem: 5. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: aCart isEmpty.
			self assert: anError messageText = Cart itemNotIncludedInCatalogErrorMessage ].! !


!TusLibrosTest methodsFor: 'setup' stamp: 'AL 6/6/2018 20:38:41'!
setUp
	|catalog|
	
	catalog _ Set new.
	catalog add: 1.
	catalog add: 2.
	catalog add: 3.
	
	aCart _ Cart forCatalog: catalog.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'items catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'initialization' stamp: 'AL 6/4/2018 23:06:30'!
initialize

	items _ Bag new.! !

!Cart methodsFor: 'initialization' stamp: 'AL 6/6/2018 20:26:34'!
initializeWithCatalog: aCatalog
	
	catalog _ aCatalog.
	items _ Bag new.! !


!Cart methodsFor: 'adding' stamp: 'AL 6/6/2018 20:39:54'!
addItem: anItem
	
	(catalog includes: anItem) ifFalse: [self error: self class itemNotIncludedInCatalogErrorMessage .].
	items add: anItem.! !


!Cart methodsFor: 'removing' stamp: 'AL 6/4/2018 23:29:44'!
remove: anItem

	^items remove: anItem ifAbsent: [ self error: self class itemNotIncludedInCartErrorMessage .] 
! !


!Cart methodsFor: 'inspecting' stamp: 'AL 6/6/2018 19:50:08'!
contains: aBook
	^ items includes: aBook.! !

!Cart methodsFor: 'inspecting' stamp: 'AL 6/4/2018 22:52:58'!
isEmpty
	
	^items isEmpty.! !

!Cart methodsFor: 'inspecting' stamp: 'AL 6/4/2018 21:23:19'!
items

	^items! !

!Cart methodsFor: 'inspecting' stamp: 'AL 6/4/2018 23:25:55'!
quantityOf: anItem 
	
	^items occurrencesOf: anItem.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'error description' stamp: 'AL 6/4/2018 23:26:22'!
itemNotIncludedInCartErrorMessage
	^ 'El item a remover no esta en el carrito'.! !

!Cart class methodsFor: 'error description' stamp: 'AL 6/6/2018 20:29:26'!
itemNotIncludedInCatalogErrorMessage
	^ 'El item no esta en el catalogo'.! !


!Cart class methodsFor: 'instance creation' stamp: 'AL 6/6/2018 20:32:09'!
forCatalog: aCatalog

	^self new initializeWithCatalog: aCatalog! !
