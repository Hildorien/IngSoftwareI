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

!I class methodsFor: 'Metodos' stamp: 'Nacho 3/24/2018 14:41:46'!
* unNumero
	^unNumero.! !

!I class methodsFor: 'Metodos' stamp: 'Nacho 3/22/2018 21:29:45'!
+ unNumero

^unNumero next.! !

!I class methodsFor: 'Metodos' stamp: 'Nacho 3/27/2018 18:48:48'!
- unNumero
	self error: 'Numeros negativos no soportados'.! !

!I class methodsFor: 'Metodos' stamp: 'Nacho 3/27/2018 18:51:14'!
descripcionDeErrorDeNumerosNegativosNoSoportados
 ^'Numeros negativos no soportados'.! !

!I class methodsFor: 'Metodos' stamp: 'Nacho 3/22/2018 21:00:22'!
next
	^II! !

!I class methodsFor: 'Metodos' stamp: 'Nacho 3/22/2018 21:07:23'!
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

!II class methodsFor: 'Metodos' stamp: 'Nacho 3/26/2018 19:26:19'!
* unNumero 
	(unNumero = I)
	ifTrue: [ ^self]
	ifFalse: [		
		^self + (self + unNumero previous)
		].! !

!II class methodsFor: 'Metodos' stamp: 'Nacho 3/22/2018 21:11:08'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!II class methodsFor: 'Metodos' stamp: 'Nacho 3/24/2018 14:38:41'!
- unNumero
	(unNumero = I)
	ifTrue:[^self previous]
	ifFalse:[^self previous - unNumero previous].! !

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

!II class methodsFor: 'Metodos' stamp: 'Nacho 3/22/2018 21:18:18'!
next
	next ifNil:
	[
		next := self cloneNamed:(self name, 'I').	
		next previous: self.
	].
	^next
	! !

!II class methodsFor: 'Metodos' stamp: 'Nacho 3/22/2018 21:22:36'!
previous
	^previous! !

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

II instVarNamed: 'next' put: nil!
II instVarNamed: 'previous' put: I!

!classDefinition: #PeanoTest category: #'Workspace-Objects'!
DenotativeObject subclass: #PeanoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Workspace-Objects'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PeanoTest class' category: #'Workspace-Objects'!
PeanoTest class
	instanceVariableNames: ''!

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 12:51:26'!
test01UnoMasUnSumandoEsElProximoDelSumando

	Assert that: I + II isEqualTo: II next.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:11:40'!
test02NumerosMayoresaUnoSumanBien

	Assert that: II + II isEqualTo: IIII.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:12:19'!
test03UnNumeroMenosUnoEsElPrevioDelNumero

	Assert that: II - I isEqualTo: II previous.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:15:11'!
test04NumerosMayoresaUnoRestanBien

	Assert that: IIII - II isEqualTo: II.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 12:51:02'!
test05RestaNoSoportaNumerosNegativos

	Assert should: [ I - II ] signal: Error withDescription: I descripcionDeErrorDeNumerosNegativosNoSoportados.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:15:53'!
test06UnNumeroMultiplicadoPorUnoEsIgualAlNumero

	Assert that: II * I isEqualTo: II.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:16:23'!
test07NumerosMayoresaUnoMultiplicanBien

	Assert that: II * II isEqualTo: IIII.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:16:46'!
test08UnoMultiplicadoUnoEsIgualAUno

	Assert that: I * I isEqualTo: I.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:01:58'!
test09NumerosMayoresaUnoDividenBien

	Assert that: IIII / II isEqualTo: II.
! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:17:28'!
test10UnNumeroDivididoUnoEsIgualAlNumero

	Assert that: II / I isEqualTo: II.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:17:38'!
test11UnoDivididoUnoEsIgualAUno

	Assert that: I / I isEqualTo: I.! !

!PeanoTest class methodsFor: 'as yet unclassified' stamp: 'ARM 3/26/2018 13:17:59'!
test12DivisionNoSoportaDividirPorUnNumeroMayor

	Assert should: [ III /  IIII ] signal: Error withDescription: II descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor.
	
	Assert should: [ I /  II] signal: Error withDescription: I descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
! !
