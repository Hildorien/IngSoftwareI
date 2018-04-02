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

!I class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 15:00:14'!
* unNumero
	
	^unNumero.! !

!I class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 15:00:18'!
+ unNumero

	^unNumero next.! !

!I class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 15:00:31'!
- unNumero
	
	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 15:00:40'!
next
	
	^II! !

!I class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 15:00:46'!
previous
	
	self error:  'No existe el anterior a I'.! !


!I class methodsFor: 'ErrorCodes' stamp: 'AL 4/2/2018 15:14:17'!
descripcionDeErrorDeNumerosNegativosNoSoportados
 
	^'Numeros negativos no soportados'.! !


!I class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 15:48:37'!
< unNumero

	^ (unNumero = I) not.! !

!I class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:10:24'!
<= unNumero
	
	^ true.! !

!I class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:14:54'!
igualOmasGrandeQue: unNumero
	
	^ unNumero = self.! !

!I class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 15:19:25'!
leRestoAl: unNumero

	^ unNumero previous.! !

!I class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 15:41:20'!
masGrandeQue: unNumero
	
	^ false.! !


!I class methodsFor: 'fileout' stamp: 'AL 4/2/2018 16:15:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading pourposes - Do not modify it"

	next := nil.! !


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

!II class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 15:01:04'!
* unNumero 
 
	^ (self previous*unNumero) + unNumero! !

!II class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 15:14:35'!
+ unNumeroDePeano

	^ self previous + unNumeroDePeano next! !

!II class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 15:18:15'!
- unNumero
	
	^ unNumero leRestoAl: self. 
	! !

!II class methodsFor: 'Axiomas' stamp: 'Nacho 3/22/2018 21:18:18'!
next
	next ifNil:
	[
		next := self cloneNamed:(self name, 'I').	
		next previous: self.
	].
	^next
	! !

!II class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 15:02:18'!
previous
	
	^previous! !


!II class methodsFor: 'Metodos' stamp: 'Nacho 3/24/2018 14:41:35'!
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

!II class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 15:42:59'!
< unNumero

	^ unNumero masGrandeQue: self.! !

!II class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 15:56:03'!
<= unNumero

	^ unNumero igualOmasGrandeQue: self.! !

!II class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 15:52:45'!
igualOmasGrandeQue: unNumero
	
	^ unNumero previous <= self previous.! !

!II class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 15:21:09'!
leRestoAl: unNumero

	^ unNumero previous - self previous! !

!II class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 15:52:21'!
masGrandeQue: unNumero
	
	^ unNumero previous < self previous.! !

!II class methodsFor: 'Metodos' stamp: 'Nacho 3/22/2018 21:25:56'!
previous: aNumber

	previous:= aNumber! !

!II class methodsFor: 'Metodos' stamp: 'Nacho 3/27/2018 18:19:12'!
removeAllNext

next ifNotNil:
[
	next removeAllNext.
	next removeFromSystem.
	next := nil.
].
! !



!II class methodsFor: 'fileout' stamp: 'AL 4/2/2018 16:15:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading pourposes - Do not modify it"

	next := III.
	previous := I.! !


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

!III class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 16:12:58'!
* unNumero 
 
	^ (self previous*unNumero) + unNumero! !

!III class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 16:12:58'!
+ unNumeroDePeano

	^ self previous + unNumeroDePeano next! !

!III class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 16:12:58'!
- unNumero
	
	^ unNumero leRestoAl: self. 
	! !

!III class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 16:12:58'!
next
	next ifNil:
	[
		next := self cloneNamed:(self name, 'I').	
		next previous: self.
	].
	^next
	! !

!III class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 16:12:58'!
previous
	
	^previous! !


!III class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:12:58'!
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

!III class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:12:58'!
< unNumero

	^ unNumero masGrandeQue: self.! !

!III class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:12:58'!
<= unNumero

	^ unNumero igualOmasGrandeQue: self.! !

!III class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:12:58'!
igualOmasGrandeQue: unNumero
	
	^ unNumero previous <= self previous.! !

!III class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:12:58'!
leRestoAl: unNumero

	^ unNumero previous - self previous! !

!III class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:12:58'!
masGrandeQue: unNumero
	
	^ unNumero previous < self previous.! !

!III class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:12:58'!
previous: aNumber

	previous:= aNumber! !

!III class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:12:58'!
removeAllNext

next ifNotNil:
[
	next removeAllNext.
	next removeFromSystem.
	next := nil.
].
! !


!III class methodsFor: 'fileout' stamp: 'AL 4/2/2018 16:15:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading pourposes - Do not modify it"

	next := IIII.
	previous := II.! !


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

!IIII class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 16:12:59'!
* unNumero 
 
	^ (self previous*unNumero) + unNumero! !

!IIII class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 16:12:59'!
+ unNumeroDePeano

	^ self previous + unNumeroDePeano next! !

!IIII class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 16:12:59'!
- unNumero
	
	^ unNumero leRestoAl: self. 
	! !

!IIII class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 16:12:59'!
next
	next ifNil:
	[
		next := self cloneNamed:(self name, 'I').	
		next previous: self.
	].
	^next
	! !

!IIII class methodsFor: 'Axiomas' stamp: 'AL 4/2/2018 16:12:59'!
previous
	
	^previous! !


!IIII class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:12:59'!
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

!IIII class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:12:59'!
< unNumero

	^ unNumero masGrandeQue: self.! !

!IIII class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:12:59'!
<= unNumero

	^ unNumero igualOmasGrandeQue: self.! !

!IIII class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:12:59'!
igualOmasGrandeQue: unNumero
	
	^ unNumero previous <= self previous.! !

!IIII class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:12:59'!
leRestoAl: unNumero

	^ unNumero previous - self previous! !

!IIII class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:12:59'!
masGrandeQue: unNumero
	
	^ unNumero previous < self previous.! !

!IIII class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:12:59'!
previous: aNumber

	previous:= aNumber! !

!IIII class methodsFor: 'Metodos' stamp: 'AL 4/2/2018 16:12:59'!
removeAllNext

next ifNotNil:
[
	next removeAllNext.
	next removeFromSystem.
	next := nil.
].
! !


!IIII class methodsFor: 'fileout' stamp: 'AL 4/2/2018 16:15:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading pourposes - Do not modify it"

	next := nil.
	previous := III.! !

I initializeCollaboratorsFromFile!
II initializeCollaboratorsFromFile!
III initializeCollaboratorsFromFile!
IIII initializeCollaboratorsFromFile!