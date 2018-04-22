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


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'size topElement previousStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'AL 4/22/2018 17:13:30'!
initialize

	^ EmptyStack new.	
	
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AL 4/22/2018 17:12:12'!
isEmpty
 	
	self subclassResponsibility.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AL 4/22/2018 17:12:35'!
pop
	
	self subclassResponsibility.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AL 4/22/2018 17:12:57'!
push: anElement
	
	self subclassResponsibility.
! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AL 4/22/2018 17:13:11'!
size
 
	self subclassResponsibility.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'AL 4/22/2018 17:13:22'!
top

	self subclassResponsibility.	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #EmptyStack category: #'Stack-Exercise'!
OOStack subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStack methodsFor: 'initialization' stamp: 'AL 4/22/2018 17:26:19'!
initialize

	^ self! !


!EmptyStack methodsFor: 'methods' stamp: 'AL 4/22/2018 16:35:02'!
isEmpty

	^ true.	! !

!EmptyStack methodsFor: 'methods' stamp: 'AL 4/22/2018 16:47:44'!
pop
	
	^ self stackEmptyErrorDescription.! !

!EmptyStack methodsFor: 'methods' stamp: 'AL 4/22/2018 17:28:22'!
push: anElement

	^ NotEmptyStack new initializeWithPreviousStack: self withSize: 0 andNewElement: anElement.! !

!EmptyStack methodsFor: 'methods' stamp: 'AL 4/22/2018 16:54:48'!
size
	
	^ 0.! !

!EmptyStack methodsFor: 'methods' stamp: 'AL 4/22/2018 16:55:35'!
top

	^ self stackEmptyErrorDescription.! !


!classDefinition: #NotEmptyStack category: #'Stack-Exercise'!
OOStack subclass: #NotEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyStack methodsFor: 'methods' stamp: 'AL 4/22/2018 17:33:38'!
pop
	
	^ previousStack! !

!NotEmptyStack methodsFor: 'methods' stamp: 'AL 4/22/2018 17:07:34'!
push: anElement

	^ NotEmptyStack initializeWithPreviousStack: self withSize: size andNewElement: anElement.

	! !

!NotEmptyStack methodsFor: 'methods' stamp: 'AL 4/22/2018 17:02:32'!
size

	^ size.! !

!NotEmptyStack methodsFor: 'methods' stamp: 'AL 4/22/2018 17:02:27'!
top

	^ topElement.! !


!NotEmptyStack methodsFor: 'initialization' stamp: 'AL 4/22/2018 17:32:25'!
initializeWithPreviousStack: aStack withSize: aSize andNewElement: anElement

	size := aSize + 1.
	previousStack := aStack.
	topElement := anElement.
	! !


!NotEmptyStack methodsFor: 'as yet unclassified' stamp: 'AL 4/22/2018 16:35:16'!
isEmpty
	
	^false! !
