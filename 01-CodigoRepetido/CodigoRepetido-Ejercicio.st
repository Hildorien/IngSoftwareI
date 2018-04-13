!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #IdiomTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #IdiomTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!IdiomTest methodsFor: 'testing' stamp: 'AL 4/12/2018 21:40:06'!
dadaUnaAccion: unaAccion retornarTalError: unError yRealizaLasVerificaciones: lasVerificaciones
	"comment stating purpose of message"

	| |
	unaAccion value
	on: unError
	do: lasVerificaciones.
	
	
	! !

!IdiomTest methodsFor: 'testing' stamp: 'AL 4/12/2018 21:29:29'!
givenAction: anAction doesNotTakeMoreThan: anAmountOfTime
"comment stating purpose of message"

	| actionTime |
	actionTime := self measureActionTime: anAction.
	
	^actionTime<anAmountOfTime.
	! !

!IdiomTest methodsFor: 'testing' stamp: 'AL 4/12/2018 20:57:28'!
measureActionTime: anAction
	"comment stating purpose of message"

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue.
	anAction value.
	millisecondsAfterRunning := Time millisecondClockValue.
	
	^millisecondsAfterRunning-millisecondsBeforeRunning! !

!IdiomTest methodsFor: 'testing' stamp: 'AL 4/12/2018 21:51:06'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook result |
	
	customerBook := CustomerBook  new.
	
	result := self givenAction: [customerBook addCustomerNamed: 'John Lennon'] doesNotTakeMoreThan: 50 * millisecond.

	self assert: result 
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'AL 4/12/2018 21:30:57'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook result paulMcCartney |
	
	customerBook := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	
	result := self givenAction: [customerBook removeCustomerNamed: 'Paul McCartney'] doesNotTakeMoreThan: 100 * millisecond.

	self assert: result.	
! !

!IdiomTest methodsFor: 'testing' stamp: 'AL 4/12/2018 21:52:19'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	"dadoUnaAccion: unaAccion retornaUnErrorDeTipo: unTipoDeError yEjecutaElClosure: unClosure"
	
	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!IdiomTest methodsFor: 'testing' stamp: 'AL 4/12/2018 21:47:39'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	"dadoUnaAccion: unaAccion retornaTalError: unError yRealizaLasVerificaciones: lasVerificaciones"
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:56'!
includesCustomerNamed: aName

	^customers includes: aName ! !

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:48'!
isEmpty
	
	^customers isEmpty  ! !


!CustomerBook methodsFor: 'initialization' stamp: 'HernanWilkinson 7/6/2011 17:42'!
initialize

	super initialize.
	customers := OrderedCollection new! !


!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:42'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:56'!
numberOfCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'HAW 4/14/2017 16:55:43'!
removeCustomerNamed: aName
 
	customers remove: aName ifAbsent: [ NotFound signal ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
