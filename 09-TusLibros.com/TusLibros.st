!classDefinition: #TusLibrosTest category: #TusLibros!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosTest methodsFor: 'testing' stamp: 'AL 6/4/2018 21:16:41'!
test01newCartIsEmpty
	
	| aCart |
	aCart _ Cart new.

	self assert: aCart isEmpty.
	! !

!TusLibrosTest methodsFor: 'testing' stamp: 'AL 6/4/2018 23:32:23'!
test02givenCartIsNotEmptyAfterAddingAnItem
	| aCart |
	aCart _ Cart new.
	aCart addItem: 123123.
	self deny: aCart isEmpty.
	self assert: (aCart includes: 123123).! !

!TusLibrosTest methodsFor: 'testing' stamp: 'AL 6/4/2018 23:32:41'!
test03diferentItemsCanBeAddedToCart
	| aCart |
	aCart _ Cart new.
	aCart addItem: 111.
	aCart addItem: 222.
	self deny: aCart isEmpty.
	self assert: (aCart includes: 111).
	self assert: (aCart includes: 222).! !

!TusLibrosTest methodsFor: 'testing' stamp: 'AL 6/4/2018 23:32:55'!
test04itemsCanBeAddedToCartMoreThanOnce
	| aCart |
	aCart _ Cart new.
	aCart addItem: 111.
	aCart addItem: 111.
	self deny: aCart isEmpty.
	self
		assert: (aCart quantityOf: 111)
		equals: 2.! !

!TusLibrosTest methodsFor: 'testing' stamp: 'AL 6/4/2018 23:31:50'!
test05canNotRemoveABookFromCartIfAbsent

	| aCart |
	aCart _ Cart new.
	aCart addItem: 222.
	
	self
		should: [ aCart remove: 111 ]
		raise: Error
		withExceptionDo: [ :anError |
			self deny: aCart isEmpty.
			self assert: anError messageText = Cart itemNotIncludedInCartErrorMessage .
			]! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'initialization' stamp: 'AL 6/4/2018 22:52:29'!
includes: aBook

	^items includes: aBook.! !

!Cart methodsFor: 'initialization' stamp: 'AL 6/4/2018 23:06:30'!
initialize

	items _ Bag new.! !


!Cart methodsFor: 'as yet unclassified' stamp: 'AL 6/4/2018 23:25:43'!
addItem: anItem

	items add: anItem.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'AL 6/4/2018 22:52:58'!
isEmpty
	
	^items isEmpty.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'AL 6/4/2018 21:23:19'!
items

	^items! !

!Cart methodsFor: 'as yet unclassified' stamp: 'AL 6/4/2018 23:25:55'!
quantityOf: anItem 
	
	^items occurrencesOf: anItem.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'AL 6/4/2018 23:29:44'!
remove: anItem

	^items remove: anItem ifAbsent: [ self error: self class itemNotIncludedInCartErrorMessage .] 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'error description' stamp: 'AL 6/4/2018 23:26:22'!
itemNotIncludedInCartErrorMessage
	^ 'El item a remover no esta en el carrito'.! !
