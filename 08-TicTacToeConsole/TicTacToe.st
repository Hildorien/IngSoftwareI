!classDefinition: #TicTacToeConsoleTest category: #TicTacToe!
TestCase subclass: #TicTacToeConsoleTest
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeConsoleTest methodsFor: 'as yet unclassified' stamp: 'Nacho 6/3/2018 17:15:30'!
test00ConsoleInitializesEmpty
	| aTicTacToeGame console |
	aTicTacToeGame _ self initializeGame .
	console _ self startConsoleWithGame: aTicTacToeGame .
	self assert: console isConsoleEmpty .! !

!TicTacToeConsoleTest methodsFor: 'as yet unclassified' stamp: 'Nacho 6/3/2018 17:16:43'!
test01ConsoleLogsPlayerXMove
	| aTicTacToeGame console |
	aTicTacToeGame _ self initializeGame .
	console _ self startConsoleWithGame: aTicTacToeGame .
	aTicTacToeGame markWithXAt: 2 @ 2.
	self
		assert: 'X marcó en 2@2'
		equals: console showLastMark .
	self
		assert: 'Estado: Jugando O'
		equals: console showState .! !

!TicTacToeConsoleTest methodsFor: 'as yet unclassified' stamp: 'Nacho 6/3/2018 17:17:23'!
test02ConsoleLogsPlayerOMove
	| aTicTacToeGame console |
	aTicTacToeGame _ self initializeGame .
	console _ self startConsoleWithGame: aTicTacToeGame .
	aTicTacToeGame markWithXAt: 2 @ 2.
	aTicTacToeGame markWithOAt: 1 @ 1.
	self
		assert: 'O marcó en 1@1'
		equals: console showLastMark .
	self
		assert: 'Estado: Jugando X'
		equals: console showState.! !

!TicTacToeConsoleTest methodsFor: 'as yet unclassified' stamp: 'Nacho 6/3/2018 22:00:33'!
test03ConsoleLogsLastPlay
	| aTicTacToeGame console |
	aTicTacToeGame _ self initializeGame .
	console _ self startConsoleWithGame: aTicTacToeGame .
	aTicTacToeGame markWithXAt: 2 @ 2.
	aTicTacToeGame markWithOAt: 1 @ 1.
	aTicTacToeGame markWithXAt: 1@3.
	console showConsoleLog .
	self
		assert: 'X marcó en 1@3'
		equals: console showLastMark .
	self
		assert: 'Estado: Jugando O'
		equals: console showState.! !

!TicTacToeConsoleTest methodsFor: 'as yet unclassified' stamp: 'Nacho 6/3/2018 17:18:24'!
test04ConsoleLogsPlayerXWinner
	| aTicTacToeGame console |
	aTicTacToeGame _ self initializeGame .
	console _ self startConsoleWithGame: aTicTacToeGame .
	aTicTacToeGame markWithXAt: 2 @ 2.
	aTicTacToeGame markWithOAt: 1 @ 1.
	aTicTacToeGame markWithXAt: 1 @ 3.
	aTicTacToeGame markWithOAt: 1 @ 2.
	aTicTacToeGame markWithXAt: 3 @ 1.
	self
		assert: 'X marcó en 3@1'
		equals: console showLastMark .
	self
		assert: 'Estado: Juego terminado - Ganó X!!'
		equals: console showState .! !

!TicTacToeConsoleTest methodsFor: 'as yet unclassified' stamp: 'Nacho 6/3/2018 17:18:56'!
test05ConsoleLogsPlayerOWinner
	| aTicTacToeGame console |
	aTicTacToeGame _ self initializeGame .
	console _ self startConsoleWithGame: aTicTacToeGame .
	aTicTacToeGame markWithXAt: 2 @ 2.
	aTicTacToeGame markWithOAt: 1 @ 1.
	aTicTacToeGame markWithXAt: 2 @ 3.
	aTicTacToeGame markWithOAt: 1 @ 2.
	aTicTacToeGame markWithXAt: 3 @ 1.
	aTicTacToeGame markWithOAt: 1 @ 3.
	self
		assert: 'O marcó en 1@3'
		equals: console showLastMark .
	self
		assert: 'Estado: Juego terminado - Ganó O!!'
		equals: console showState .! !

!TicTacToeConsoleTest methodsFor: 'as yet unclassified' stamp: 'Nacho 6/3/2018 17:19:44'!
test06ConsoleLogsATieGame
	| aTicTacToeGame console |
	aTicTacToeGame _ self initializeGame .
	console _ self startConsoleWithGame: aTicTacToeGame .
	aTicTacToeGame markWithXAt: 1 @ 3.
	aTicTacToeGame markWithOAt: 1 @ 2.
	aTicTacToeGame markWithXAt: 2 @ 1.
	aTicTacToeGame markWithOAt: 1 @ 1.
	aTicTacToeGame markWithXAt: 2 @ 2.
	aTicTacToeGame markWithOAt: 3 @ 1.
	aTicTacToeGame markWithXAt: 3 @ 3.
	aTicTacToeGame markWithOAt: 2 @ 3.
	aTicTacToeGame markWithXAt: 3 @ 2.
	self
		assert: 'X marcó en 3@2'
		equals: console showLastMark .
	self
		assert: 'Estado: Juego empatado!!'
		equals: console showState .! !

!TicTacToeConsoleTest methodsFor: 'as yet unclassified' stamp: 'Nacho 6/3/2018 22:10:43'!
test07ConsoleLogsAllPlays
	| aTicTacToeGame console |
	aTicTacToeGame _ self initializeGame.
	console _ self startConsoleWithGame: aTicTacToeGame.
	aTicTacToeGame markWithXAt: 2 @ 2.
	aTicTacToeGame markWithOAt: 1 @ 1.
	aTicTacToeGame markWithXAt: 1 @ 3.
	self
		assert: 'X marcó en 2@2
		Estado: Jugando O
		O marcó en 1@1
		Estado: Jugando X
		X marcó en 1@3
		Estado: Jugando O
		'
		equals: console showConsoleLog.! !


!TicTacToeConsoleTest methodsFor: 'initialize game' stamp: 'Nacho 6/3/2018 17:13:01'!
initializeGame 
	|game|
 ^game _ TicTacToe new.! !

!TicTacToeConsoleTest methodsFor: 'initialize game' stamp: 'Nacho 6/3/2018 17:14:06'!
startConsoleWithGame: aTicTacToe

	^(TicTacToeConsole new) initializeWith: aTicTacToe .! !


!classDefinition: #TicTacToeTest category: #TicTacToe!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/27/2017 17:25:54'!
functionalException

	^Error - MessageNotUnderstood! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 00:36:38'!
mark: positions

	positions withIndexDo: [ :aPosition :anIndex | anIndex odd ifTrue: [ game markWithXAt: aPosition ] ifFalse: [ game markWithOAt: aPosition ]]! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/26/2017 15:10:54'!
test01GameStartsWithAnEmptyBoarAndPlayingX

	"I initialize it on each test and not in the setUp to facilitate the restar of the test - Hernan"
	
	game _ TicTacToe new.

	self assertXIsMarkedOn: {} andOOn: {}.
	self assertIsPlayingX.
	
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 00:34:36'!
test02AfterMarkingWithXGameKeepsMarkAndNextPlayerIsO

	game _ TicTacToe new.
	
	self mark: {1@1}.

	self assertXIsMarkedOn: {1@1} andOOn: {}.
	self assertIsPlayingO

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 00:37:08'!
test03AfterMarkingWithOGameKeepsMarkAndNextPlayerIsY

	game _ TicTacToe new.

	self mark: { 1 @ 1. 2 @ 2 }.

	self assertXIsMarkedOn: {1@1} andOOn: {2@2}.
	self assertIsPlayingX.

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 13:12:22'!
test04CanNotMarkWithXWhenLastMarkWasX

	game _ TicTacToe new.
	
	self mark: { 1@1 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 00:37:50'!
test05CanNotMarkWithOWhenLastMarkWasO

	game _ TicTacToe new.

	self mark: {1@1. 2@2 }.

	self
		should: [ game markWithOAt: 3 @ 3 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe notOTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 00:38:01'!
test06CanNotMarkWithXAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.

	self mark: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 00:38:10'!
test07CanNotMarkWithXAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	self mark: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 13:12:37'!
test08CanNotMarkWithOAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.
	
	self mark: { 1@1 }.
	
	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 00:38:26'!
test09CanNotMarkWithOAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	self mark: {1@1. 2@2. 3@3 }.

	self
		should: [ game markWithOAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1. 3@3} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 00:39:11'!
test10XWinsWhenCompletesRowNumber1

	game _ TicTacToe new.

	self mark: {1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self assertXWon.
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 00:41:32'!
test11XWinsWhenCompletesRowNumber2

	game _ TicTacToe new.

	self mark: {2@1. 1@1. 2@2. 3@1. 2@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 00:42:03'!
test12XWinsWhenCompletesRowNumber3

	game _ TicTacToe new.

	self mark: {3@1. 1@1. 3@2. 2@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 00:42:38'!
test13XWinsWhenCompletesAColumn

	game _ TicTacToe new.

	self mark: { 1@1. 2@2. 1@2. 3@3. 1@3}.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 00:43:12'!
test14XWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	self mark: { 1@1. 1@2. 2@2. 1@3. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 00:43:49'!
test15XWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	self mark: { 1@3. 1@2. 2@2. 2@1. 3@ 1 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 00:44:47'!
test16OWinsWhenCompletesARow

	game _ TicTacToe new.

	self mark: {2@1. 1@1. 2@2. 1@2. 3@1. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 13:05:38'!
test17OWinsWhenCompletesAColumn

	game _ TicTacToe new.

	self mark: { 2@2. 1@1. 3@3. 1@2. 2@3. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 13:06:14'!
test18OWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	self mark: { 3@2. 1@3. 1@2. 2@2. 1@1. 3@1 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 13:06:54'!
test19OWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	self mark: {1@2. 1@1. 1@3. 2@2. 2@1. 3@3 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 13:07:26'!
test20OCanNotPlayWhenXWon

	game _ TicTacToe new.

	self mark: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markWithOAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 13:08:08'!
test21XCanNotPlayWhenOWon

	game _ TicTacToe new.

	self mark: { 2@2. 1@1. 2@1. 1@2. 3@1. 1@3 }.

	self
		should: [ game markWithXAt: 3 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: { 2@2. 2@1. 3@1 } ]
		! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 13:08:59'!
test22GameCanEndUpTied

	game _ TicTacToe new.

	self mark: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self assertGameIsTied! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 13:09:47'!
test23XCanWinOnLastEmptyPosition

	game _ TicTacToe new.

	self mark: { 2@2. 1@2. 1@1. 2@1. 1@3. 2@3. 3@2. 3@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 13:10:47'!
test24CanNotPlayWhenGameIsTied

	game _ TicTacToe new.

	self mark: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'JG 5/12/2018 13:23:11'!
test25CanNotMarkOutsideBoard

	game _ TicTacToe new.

	#(0 4) do: [ :aPositionComponent |
		self assertCanNotMarkAt: aPositionComponent @ 1.
		self assertCanNotMarkAt: 1 @ aPositionComponent ].
	! !


!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:06'!
assertCanNotMarkAt: aPosition

	self assertCanNotMarkUsing: [ game markWithXAt: aPosition ].
	self assertCanNotMarkUsing: [ game markWithOAt: aPosition ].
	
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:29'!
assertCanNotMarkUsing: aMarkingClosure

	self
		should: aMarkingClosure 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionOutsideBoardErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:14'!
assertGameIsNotOver

	self deny: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:48'!
assertGameIsOver
	
	self assert: game isOver.

	self deny: game isPlayingX.
	self deny: game isPlayingO.
		
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:40:41'!
assertGameIsTied

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self assert: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:13:05'!
assertIsPlayingO
	
	self deny: game isPlayingX.
	self assert: game isPlayingO.
	self assertGameIsNotOver ! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:05'!
assertIsPlayingX
		
	self assert: game isPlayingX.
	self deny: game isPlayingO.
	self assertGameIsNotOver.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:38:07'!
assertOIsMarkedOn: oPositions
		
	self assert: oPositions size equals: game playerOPositions size.
	self assert: (game playerOPositions difference: oPositions) isEmpty.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:32:18'!
assertOWon

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.
	self deny: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:56'!
assertXIsMarkedOn: xPositions

	self assert: xPositions size equals: game playerXPositions size.
	self assert: (game playerXPositions difference: xPositions) isEmpty.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:44'!
assertXIsMarkedOn: xPositions andOOn: oPositions
 
	self assertXIsMarkedOn: xPositions.
	self assertOIsMarkedOn: oPositions.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:30'!
assertXWon
	
	self assertGameIsOver.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.
! !


!classDefinition: #TicTacToeViewerTests category: #TicTacToe!
TestCase subclass: #TicTacToeViewerTests
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeViewerTests methodsFor: 'Testing' stamp: 'Nacho 6/3/2018 17:24:05'!
test00ViewerInitializesEmpty
	| aTicTacToeGame viewer |
	aTicTacToeGame _ self initializeGame .
	viewer _ (TicTacToeViewer new) initializeWith: aTicTacToeGame .
	self assert: viewer isViewerEmpty .! !

!TicTacToeViewerTests methodsFor: 'Testing' stamp: 'Nacho 6/3/2018 17:24:23'!
test01ViewerDrawsXPlayerMove
	| aTicTacToeGame viewer |
	aTicTacToeGame _ self initializeGame .
	viewer _ (TicTacToeViewer new) initializeWith: aTicTacToeGame .
	aTicTacToeGame markWithXAt: 2 @ 2.
	

	self
		assert: viewer showGrid 
		equals: '| ''-'' ''-'' ''-'' |
| ''-'' ''X'' ''-'' |
| ''-'' ''-'' ''-'' |
'  .


	self
		assert: viewer showNextPlaying 
		equals: 'Playing O'.! !

!TicTacToeViewerTests methodsFor: 'Testing' stamp: 'Nacho 6/3/2018 17:24:41'!
test02ViewerDrawsOPlayerMove
	| aTicTacToeGame viewer |
	aTicTacToeGame _ self initializeGame .
	viewer _ (TicTacToeViewer new) initializeWith: aTicTacToeGame .
	aTicTacToeGame markWithXAt: 2 @ 2.
	aTicTacToeGame markWithOAt: 1 @ 1.
	self
		assert: viewer showGrid 
		equals: '| ''O'' ''-'' ''-'' |
| ''-'' ''X'' ''-'' |
| ''-'' ''-'' ''-'' |
' .
	self
		assert: viewer showNextPlaying 
		equals: 'Playing X'.! !

!TicTacToeViewerTests methodsFor: 'Testing' stamp: 'Nacho 6/3/2018 17:25:02'!
test03ViewerDrawsAllMoves
	| aTicTacToeGame viewer |
	aTicTacToeGame _ self initializeGame .
	viewer _ (TicTacToeViewer new) initializeWith: aTicTacToeGame .
	aTicTacToeGame markWithXAt: 2@2.
	aTicTacToeGame markWithOAt: 3@1.
	aTicTacToeGame markWithXAt: 1@1.
	self
		assert: viewer showGrid 
		equals: '| ''X'' ''-'' ''O'' |
| ''-'' ''X'' ''-'' |
| ''-'' ''-'' ''-'' |
' .
	self
		assert: viewer showNextPlaying 
		equals: 'Playing O'.! !

!TicTacToeViewerTests methodsFor: 'Testing' stamp: 'Nacho 6/3/2018 17:25:51'!
test04ViewerDrawsXPlayerWinner
	| aTicTacToeGame viewer |
	aTicTacToeGame _ self initializeGame .
	viewer _ (TicTacToeViewer new) initializeWith: aTicTacToeGame .
	aTicTacToeGame markWithXAt: 2@2.
	aTicTacToeGame markWithOAt: 1@2.
	aTicTacToeGame markWithXAt: 1@1.
	aTicTacToeGame markWithOAt: 1@3.
	aTicTacToeGame markWithXAt: 3@3.
	self
		assert: viewer showGrid 
		equals: '| ''X'' ''-'' ''-'' |
| ''O'' ''X'' ''-'' |
| ''O'' ''-'' ''X'' |
' .
	self
		assert: viewer showNextPlaying 
		equals: 'X Won!!'.! !

!TicTacToeViewerTests methodsFor: 'Testing' stamp: 'Nacho 6/3/2018 17:26:24'!
test05ViewerDrawsOPlayerWinner
	| aTicTacToeGame viewer |
	aTicTacToeGame _ self initializeGame .
	viewer _ (TicTacToeViewer new) initializeWith: aTicTacToeGame .
	aTicTacToeGame markWithXAt: 2 @ 2.
	aTicTacToeGame markWithOAt: 1 @ 1.
	aTicTacToeGame markWithXAt: 2 @ 3.
	aTicTacToeGame markWithOAt: 1 @ 2.
	aTicTacToeGame markWithXAt: 3 @ 1.
	aTicTacToeGame markWithOAt: 1 @ 3.
	self
		assert: viewer showGrid 
		equals: '| ''O'' ''-'' ''X'' |
| ''O'' ''X'' ''-'' |
| ''O'' ''X'' ''-'' |
' .
	self
		assert: viewer showNextPlaying 
		equals: 'O Won!!'.! !

!TicTacToeViewerTests methodsFor: 'Testing' stamp: 'Nacho 6/3/2018 17:27:03'!
test06ViewerDrawsATiedGame
	| aTicTacToeGame viewer |
	aTicTacToeGame _ self initializeGame .
	viewer _ (TicTacToeViewer new) initializeWith: aTicTacToeGame .
	aTicTacToeGame markWithXAt: 1 @ 3.
	aTicTacToeGame markWithOAt: 1 @ 2.
	aTicTacToeGame markWithXAt: 2 @ 1.
	aTicTacToeGame markWithOAt: 1 @ 1.
	aTicTacToeGame markWithXAt: 2 @ 2.
	aTicTacToeGame markWithOAt: 3 @ 1.
	aTicTacToeGame markWithXAt: 3 @ 3.
	aTicTacToeGame markWithOAt: 2 @ 3.
	aTicTacToeGame markWithXAt: 3 @ 2.
	self
		assert: viewer showGrid 
		equals: '| ''O'' ''X'' ''O'' |
| ''O'' ''X'' ''X'' |
| ''X'' ''O'' ''X'' |
' .
	self
		assert: viewer showNextPlaying 
		equals: 'Game Tied!!'.! !


!TicTacToeViewerTests methodsFor: 'initialize Game' stamp: 'Nacho 6/3/2018 17:22:10'!
initializeGame
	|game|	
	^game _ TicTacToe new.! !

!TicTacToeViewerTests methodsFor: 'initialize Game' stamp: 'Nacho 6/3/2018 17:22:59'!
startViewerWithGame: aTicTacToeGame
	|viewer|
	^viewer _ (TicTacToeViewer new) initializeWith: aTicTacToeGame .! !


!classDefinition: #TicTacToe category: #TicTacToe!
Object subclass: #TicTacToe
	instanceVariableNames: 'state playerOPositions playerXPositions console viewer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToe methodsFor: 'initialization' stamp: 'Nacho 6/3/2018 17:08:07'!
initialize
	playerXPositions _ OrderedCollection new.
	playerOPositions _ OrderedCollection new.
	state _ PlayingX for: self.
	console := (TicTacToeConsole new) initializeWith: self.
	viewer := (TicTacToeViewer  new) initializeWith: self.
	! !


!TicTacToe methodsFor: 'marking board' stamp: 'HAW 10/27/2017 10:30:17'!
markWithOAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithOAt: aPosition.! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 10/27/2017 10:24:49'!
markWithXAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithXAt: aPosition.! !


!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/25/2017 15:41:25'!
add: aPosition to: positions nextPlayerState: nextPlayingState winnerState: winnerState

	positions add: aPosition.
	state := (self stateAfterAddingTo: positions with: nextPlayingState and: winnerState) for: self
	! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/25/2017 15:35:08'!
assertIsFree: aPosition

	(self isTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/27/2017 10:26:10'!
assertIsInBoardBounds: aPosition

	(aPosition between: 1@1 and: 3@3) ifFalse: [ self error: self class positionOutsideBoardErrorMessage ]! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'Nacho 6/3/2018 17:08:58'!
markWithOWhenPlayingOAt: aPosition
	self assertIsFree: aPosition.
	self
		add: aPosition
		to: playerOPositions
		nextPlayerState: PlayingX
		winnerState: PlayerOWon.
		
	console playerOMarkedAt: aPosition.
	viewer playerOMarkedAt: aPosition.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOWhenPlayingXAt: aPosition
	self error: self class notOTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXWhenPlayingOAt: aPoint
	self error: self class notXTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'Nacho 6/3/2018 17:09:06'!
markWithXWhenPlayingXAt: aPosition
	self assertIsFree: aPosition.
	self
		add: aPosition
		to: playerXPositions
		nextPlayerState: PlayingO
		winnerState: PlayerXWon.
		
	console playerXMarkedAt: aPosition.
	viewer playerXMarkedAt: aPosition.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:44:57'!
stateAfterAddingTo: positions with: nextPlayingState and: winnerState

	(self hasWin: positions) ifTrue: [ ^ winnerState ].
	self shouldBeTiedWhenNoOneWon ifTrue: [ ^ GameTied ].

	^ nextPlayingState.! !


!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ state hasPlayerOWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ state hasPlayerXWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 13:32:14'!
isOver
	
	^state isOver! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:01'!
isTied
	
	^ state isTied! !


!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:38'!
isPlayingO
	
	^state isPlayingO! !

!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:14'!
isPlayingX
	
	^state isPlayingX ! !


!TicTacToe methodsFor: 'testing board positions' stamp: 'HAW 10/25/2017 15:50:52'!
isTaken: aPosition
	^ (playerXPositions includes: aPosition) or: [ playerOPositions includes: aPosition ].! !


!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:16'!
playerOPositions
	^ playerOPositions copy.! !

!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:32'!
playerXPositions
	^ playerXPositions copy.! !


!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:22:42'!
has: positions threeOf: aPositionComponent

	^(positions collect: aPositionComponent) asBag contents values includes: 3 
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:09:34'!
hasCompletedColumn: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition x ]
	
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:25:55'!
hasCompletedDiagonal: positions 
	
	^(self hasUpDiagonal: positions) or: [self hasDownDiagonal: positions]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:10:47'!
hasCompletedLine: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition y ]
! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 5/31/2018 00:25:48'!
hasCompletedStraightLine: positions
	
	^(self hasCompletedColumn: positions) or: [self hasCompletedLine: positions ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasUpDiagonal: positions
	
	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:26:17'!
hasWin: positions

	^positions size >= 3 and: [ (self hasCompletedStraightLine: positions) or: [ self hasCompletedDiagonal: positions ]].
		
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:44:42'!
shouldBeTiedWhenNoOneWon

	^ playerXPositions size = 5 and: [ playerOPositions size = 4 ].! !


!TicTacToe methodsFor: 'suscribers' stamp: 'Nacho 6/3/2018 15:01:05'!
addConsole: aTicTacConsole 
	console := aTicTacConsole .! !

!TicTacToe methodsFor: 'suscribers' stamp: 'Nacho 6/3/2018 15:01:32'!
addViewer: aTicTacViewer 
	console := aTicTacViewer.! !


!TicTacToe methodsFor: 'as yet unclassified' stamp: 'Nacho 6/3/2018 18:27:56'!
state 
	^state.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToe!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notOTurnErrorMessage
	
	^'Not O''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notXTurnErrorMessage
	
	^'Not X''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/27/2017 10:26:31'!
positionOutsideBoardErrorMessage
	
	^'Position is outside board'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #TicTacToeConsole category: #TicTacToe!
Object subclass: #TicTacToeConsole
	instanceVariableNames: 'log game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeConsole methodsFor: 'initialization' stamp: 'Nacho 6/3/2018 17:09:54'!
initializeWith: aTicTacToe 
	log := OrderedCollection new.
	game := aTicTacToe.
	game addConsole: self.! !


!TicTacToeConsole methodsFor: 'accesing' stamp: 'Nacho 5/31/2018 19:33:24'!
log
	^log! !

!TicTacToeConsole methodsFor: 'accesing' stamp: 'Nacho 6/3/2018 18:34:17'!
nextGameState
	^ game state printStateInSpanish.! !


!TicTacToeConsole methodsFor: 'as yet unclassified' stamp: 'Nacho 6/3/2018 18:30:26'!
playerOMarkedAt: aPosition
	
	log add: 'O marcó en ' , aPosition printString .
	log add: 'Estado: ' , self nextGameState. ! !

!TicTacToeConsole methodsFor: 'as yet unclassified' stamp: 'Nacho 6/3/2018 18:30:37'!
playerXMarkedAt: aPosition.
	
	log add: 'X marcó en ' , aPosition printString .
	log add: 'Estado: ' , self nextGameState.! !


!TicTacToeConsole methodsFor: 'printing' stamp: 'Nacho 6/3/2018 15:39:15'!
isConsoleEmpty 
	^log isEmpty .! !

!TicTacToeConsole methodsFor: 'printing' stamp: 'Nacho 6/3/2018 22:06:58'!
showConsoleLog	
	^log inject: '' into:[:aStream :elem | aStream , elem , '
		']. ! !

!TicTacToeConsole methodsFor: 'printing' stamp: 'Nacho 6/3/2018 15:37:12'!
showLastMark 
	^(self log at: self log size - 1).! !

!TicTacToeConsole methodsFor: 'printing' stamp: 'Nacho 6/3/2018 15:38:01'!
showState 
	^self log last.! !


!classDefinition: #TicTacToeState category: #TicTacToe!
Object subclass: #TicTacToeState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerOWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerXWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isOver
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isTied
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingO
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingX
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	self subclassResponsibility.! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	self subclassResponsibility.! !


!TicTacToeState methodsFor: 'initialization' stamp: 'HAW 10/25/2017 13:05:13'!
initializeFor: aGame

	game := aGame ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeState class' category: #TicTacToe!
TicTacToeState class
	instanceVariableNames: ''!

!TicTacToeState class methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:05:29'!
for: aTicTacToe 
	
	^self new initializeFor: aTicTacToe ! !


!classDefinition: #GameOverState category: #TicTacToe!
TicTacToeState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameOverState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 11:53:57'!
isOver
	
	^true! !


!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:23'!
isPlayingO
	
	^false! !

!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:27'!
isPlayingX
	
	^false! !


!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !


!classDefinition: #GameTied category: #TicTacToe!
GameOverState subclass: #GameTied
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:49'!
isTied
	
	^true! !


!GameTied methodsFor: 'watchers' stamp: 'Nacho 6/3/2018 18:35:10'!
printStateInEnglish
	^ 'Game Tied!!'.! !

!GameTied methodsFor: 'watchers' stamp: 'Nacho 6/3/2018 18:34:17'!
printStateInSpanish
	^ 'Juego empatado!!'.! !


!classDefinition: #PlayerOWon category: #TicTacToe!
GameOverState subclass: #PlayerOWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ true.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:06:24'!
isTied
	
	^false! !


!PlayerOWon methodsFor: 'watchers' stamp: 'Nacho 6/3/2018 18:35:32'!
printStateInEnglish
	^ 'O Won!!'.! !

!PlayerOWon methodsFor: 'watchers' stamp: 'Nacho 6/3/2018 18:34:17'!
printStateInSpanish
	^ 'Juego terminado - Ganó O!!'.! !


!classDefinition: #PlayerXWon category: #TicTacToe!
GameOverState subclass: #PlayerXWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ true.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:25:44'!
isTied
	
	^false! !


!PlayerXWon methodsFor: 'watchers' stamp: 'Nacho 6/3/2018 18:35:50'!
printStateInEnglish
	^ 'X Won!!'.! !

!PlayerXWon methodsFor: 'watchers' stamp: 'Nacho 6/3/2018 18:34:17'!
printStateInSpanish
	^ 'Juego terminado - Ganó X!!'.! !


!classDefinition: #PlayingState category: #TicTacToe!
TicTacToeState subclass: #PlayingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:10'!
hasPlayerOWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:17'!
hasPlayerXWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:26'!
isOver
	
	^false! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:52'!
isTied
	
	^false! !


!classDefinition: #PlayingO category: #TicTacToe!
PlayingState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:36'!
isPlayingO
	
	^true! !

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:27'!
isPlayingX
	
	^false! !


!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:45'!
markWithOAt: aPosition
	game markWithOWhenPlayingOAt: aPosition.! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXAt: aPosition
	game markWithXWhenPlayingOAt: aPosition.! !


!PlayingO methodsFor: 'watchers' stamp: 'Nacho 6/3/2018 18:36:08'!
printStateInEnglish
	^ 'Playing O'.! !

!PlayingO methodsFor: 'watchers' stamp: 'Nacho 6/3/2018 18:34:16'!
printStateInSpanish
	^ 'Jugando O'.! !


!classDefinition: #PlayingX category: #TicTacToe!
PlayingState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:50'!
isPlayingO
	
	^false! !

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:23'!
isPlayingX
	
	^true! !


!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOAt: aPosition
	game markWithOWhenPlayingXAt: aPosition.! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:46'!
markWithXAt: aPosition
	game markWithXWhenPlayingXAt: aPosition.! !


!PlayingX methodsFor: 'watcher' stamp: 'Nacho 6/3/2018 18:36:30'!
printStateInEnglish
	^ 'Playing X'.! !

!PlayingX methodsFor: 'watcher' stamp: 'Nacho 6/3/2018 18:34:17'!
printStateInSpanish
	^ 'Jugando X'.! !


!classDefinition: #TicTacToeViewer category: #TicTacToe!
Object subclass: #TicTacToeViewer
	instanceVariableNames: 'display game grid'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeViewer methodsFor: 'initialization' stamp: 'Nacho 6/3/2018 17:10:11'!
initializeWith: aTicTacToe 

	display := OrderedCollection new.
	game := aTicTacToe.
	grid _ Array2D newSize: 3@3.
	grid fillWithArrayOfArrays: #(#('-' '-' '-')  #('-' '-' '-')  #('-' '-' '-')).
	game addViewer: self.! !


!TicTacToeViewer methodsFor: 'accesing' stamp: 'Nacho 5/31/2018 21:29:15'!
display 
	^display .! !


!TicTacToeViewer methodsFor: 'as yet unclassified' stamp: 'AL 6/3/2018 14:11:02'!
drawMark: aPlayerMark At: aPosition.

	grid at: aPosition put: aPlayerMark.
	display add: (grid print) asString . ! !

!TicTacToeViewer methodsFor: 'as yet unclassified' stamp: 'Nacho 6/3/2018 18:37:37'!
nextGameState
	^ game state printStateInEnglish.! !

!TicTacToeViewer methodsFor: 'as yet unclassified' stamp: 'Nacho 6/3/2018 18:38:09'!
playerOMarkedAt: aPosition
	
	self drawMark: 'O'At: aPosition.
	display add: self nextGameState.! !

!TicTacToeViewer methodsFor: 'as yet unclassified' stamp: 'Nacho 6/3/2018 18:38:19'!
playerXMarkedAt: aPosition.
	
	self drawMark: 'X' At: aPosition .
	display add: self nextGameState.! !


!TicTacToeViewer methodsFor: 'printing' stamp: 'Nacho 6/3/2018 15:39:45'!
isViewerEmpty 
 ^display isEmpty.! !

!TicTacToeViewer methodsFor: 'printing' stamp: 'Nacho 6/3/2018 15:31:52'!
showGrid
^(self display at: (self display size - 1)).! !

!TicTacToeViewer methodsFor: 'printing' stamp: 'Nacho 6/3/2018 15:35:04'!
showNextPlaying 
 ^self display last.! !
