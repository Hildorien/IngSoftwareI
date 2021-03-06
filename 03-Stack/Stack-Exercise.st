!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #BaseDePila category: #'Stack-Exercise'!
Object subclass: #BaseDePila
	instanceVariableNames: 'valor anterior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!BaseDePila methodsFor: 'metodos' stamp: 'nacho 4/25/2018 16:26:55'!
anterior
	^self error: OOStack stackEmptyErrorDescription.! !

!BaseDePila methodsFor: 'metodos' stamp: 'nacho 4/25/2018 17:19:00'!
initializeWith: aValue anLastElement: aStackableObject
	valor := aValue.
	anterior := self.
	^self.! !

!BaseDePila methodsFor: 'metodos' stamp: 'nacho 4/22/2018 22:55:10'!
valor
	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack size lastElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'metodos' stamp: 'nacho 4/25/2018 17:28:53'!
initialize
	stack := BaseDePila new.
	lastElement := stack.
	size := 0.
	^self.
	
	
	! !

!OOStack methodsFor: 'metodos' stamp: 'nacho 4/22/2018 19:42:08'!
isEmpty
 	
	^(size = 0).! !

!OOStack methodsFor: 'metodos' stamp: 'nacho 4/25/2018 17:01:59'!
pop
	|anElement|
	anElement := lastElement.
	size := size - 1.
	lastElement := anElement anterior.
	^anElement valor.
	
	! !

!OOStack methodsFor: 'metodos' stamp: 'nacho 4/25/2018 17:30:06'!
push: anElement
	| aApliar |
	aApliar _ StackableObjects new
		initializeWith: anElement
		anLastElement: lastElement.
	lastElement _ aApliar.
	size _ size + 1.! !

!OOStack methodsFor: 'metodos' stamp: 'nacho 4/22/2018 22:43:22'!
size
 
	^size.! !

!OOStack methodsFor: 'metodos' stamp: 'nacho 4/25/2018 16:33:24'!
top	
	^lastElement valor.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #StackableObjects category: #'Stack-Exercise'!
Object subclass: #StackableObjects
	instanceVariableNames: 'valor anterior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackableObjects methodsFor: 'metodos' stamp: 'nacho 4/25/2018 16:26:33'!
anterior 
	^anterior.! !

!StackableObjects methodsFor: 'metodos' stamp: 'nacho 4/25/2018 17:27:21'!
initializeWith: aValue anLastElement: aStackableObject
	valor := aValue.
	anterior := aStackableObject.
	^self.! !

!StackableObjects methodsFor: 'metodos' stamp: 'nacho 4/25/2018 17:31:29'!
valor
	^valor.! !
