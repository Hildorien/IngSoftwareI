!classDefinition: #I category: #'Workspace-Objects'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Workspace-Objects'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Workspace-Objects'!
I class
	instanceVariableNames: 'next'!

!I class methodsFor: 'axiomas' stamp: 'Nacho 3/24/2018 14:41:46'!
* unNumero
	^unNumero.! !

!I class methodsFor: 'axiomas' stamp: 'Nacho 3/22/2018 21:29:45'!
+ unNumero

^unNumero next.! !

!I class methodsFor: 'axiomas' stamp: 'Nacho 3/22/2018 21:00:22'!
next
	^II! !

!I class methodsFor: 'axiomas' stamp: 'Nacho 3/22/2018 21:07:23'!
previous
	self error:  'No existe el anterior a I'.! !

I instVarNamed: 'next' put: nil!

!classDefinition: #II category: #'Workspace-Objects'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Workspace-Objects'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Workspace-Objects'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:19'!
* unNumero 
	(unNumero = I)
	ifTrue: [ ^self]
	ifFalse: [		
		^self + (self + unNumero previous)
		].! !

!II class methodsFor: 'axiomas' stamp: 'Nacho 3/22/2018 21:11:08'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!II class methodsFor: 'axiomas' stamp: 'Nacho 3/24/2018 14:38:41'!
- unNumero
	(unNumero = I)
	ifTrue:[^self previous]
	ifFalse:[^self previous - unNumero previous].! !

!II class methodsFor: 'axiomas' stamp: 'Nacho 3/24/2018 14:41:35'!
/ unDenominador
|var|
	var:= self.
	(unDenominador = I)
	ifTrue:[^self]
	ifFalse:
	[
		[var > unDenominador] whileTrue:
			[
				var := var - unDenominador
			].
		^var.	
	].! !

!II class methodsFor: 'axiomas' stamp: 'Nacho 3/22/2018 21:18:18'!
next
	next ifNil:
	[
		next := self cloneNamed:(self name, 'I').	
		next previous: self.
	].
	^next
	! !

!II class methodsFor: 'axiomas' stamp: 'Nacho 3/22/2018 21:22:36'!
previous
	^previous! !

!II class methodsFor: 'axiomas' stamp: 'Nacho 3/22/2018 21:25:56'!
previous: aNumber

	previous:= aNumber! !

II instVarNamed: 'next' put: III!
II instVarNamed: 'previous' put: I!

!classDefinition: #III category: #'Workspace-Objects'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Workspace-Objects'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Workspace-Objects'!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
* unNumero 
	(unNumero = I)
	ifTrue: [ ^self]
	ifFalse: [		
		^self + (self + unNumero previous)
		].! !

!III class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!III class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
- unNumero
	(unNumero = I)
	ifTrue:[^self previous]
	ifFalse:[^self previous - unNumero previous].! !

!III class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
/ unDenominador
|var|
	var:= self.
	(unDenominador = I)
	ifTrue:[^self]
	ifFalse:
	[
		[var > unDenominador] whileTrue:
			[
				var := var - unDenominador
			].
		^var.	
	].! !

!III class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
next
	next ifNil:
	[
		next := self cloneNamed:(self name, 'I').	
		next previous: self.
	].
	^next
	! !

!III class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
previous
	^previous! !

!III class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
previous: aNumber

	previous:= aNumber! !

III instVarNamed: 'next' put: IIII!
III instVarNamed: 'previous' put: II!

!classDefinition: #IIII category: #'Workspace-Objects'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Workspace-Objects'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Workspace-Objects'!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
* unNumero 
	(unNumero = I)
	ifTrue: [ ^self]
	ifFalse: [		
		^self + (self + unNumero previous)
		].! !

!IIII class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIII class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
- unNumero
	(unNumero = I)
	ifTrue:[^self previous]
	ifFalse:[^self previous - unNumero previous].! !

!IIII class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
/ unDenominador
|var|
	var:= self.
	(unDenominador = I)
	ifTrue:[^self]
	ifFalse:
	[
		[var > unDenominador] whileTrue:
			[
				var := var - unDenominador
			].
		^var.	
	].! !

!IIII class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
next
	next ifNil:
	[
		next := self cloneNamed:(self name, 'I').	
		next previous: self.
	].
	^next
	! !

!IIII class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
previous
	^previous! !

!IIII class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
previous: aNumber

	previous:= aNumber! !

IIII instVarNamed: 'next' put: IIIII!
IIII instVarNamed: 'previous' put: III!

!classDefinition: #IIIII category: #'Workspace-Objects'!
DenotativeObject subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Workspace-Objects'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: #'Workspace-Objects'!
IIIII class
	instanceVariableNames: 'next previous'!

!IIIII class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
* unNumero 
	(unNumero = I)
	ifTrue: [ ^self]
	ifFalse: [		
		^self + (self + unNumero previous)
		].! !

!IIIII class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIII class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
- unNumero
	(unNumero = I)
	ifTrue:[^self previous]
	ifFalse:[^self previous - unNumero previous].! !

!IIIII class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
/ unDenominador
|var|
	var:= self.
	(unDenominador = I)
	ifTrue:[^self]
	ifFalse:
	[
		[var > unDenominador] whileTrue:
			[
				var := var - unDenominador
			].
		^var.	
	].! !

!IIIII class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
next
	next ifNil:
	[
		next := self cloneNamed:(self name, 'I').	
		next previous: self.
	].
	^next
	! !

!IIIII class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
previous
	^previous! !

!IIIII class methodsFor: 'axiomas' stamp: 'Nacho 3/26/2018 19:26:47'!
previous: aNumber

	previous:= aNumber! !

IIIII instVarNamed: 'next' put: nil!
IIIII instVarNamed: 'previous' put: IIII!