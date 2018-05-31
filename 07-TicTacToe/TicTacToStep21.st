!classDefinition: #TicTacToeTest category: #TicTacToStep21!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/31/2018 14:16:40'!
test01NewGameMustBeEmpty
	| game |
	game _ TicTacToe new.
	self assert: game numberOfXPlays = 0.
	self assert: game numberOfOPlays = 0.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/31/2018 14:17:17'!
test01bGivenANewGameFirstPlayMustBeAnX
	| game |
	game _ TicTacToe new.
	self
		assert: game isXTurn.
	self
		deny: game isOTurn.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/31/2018 14:18:28'!
test03MarksInTableMustBeSaved
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self
		assert: 1
		equals: game numberOfXPlays .
	self assert: (game isThereAnXIn: 1 @ 1).
	self
		assert: 1
		equals: game numberOfOPlays .
	self assert: (game isThereAnOIn: 2 @ 2).! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/31/2018 14:19:02'!
test04XShouldNotPlayTwiceInARow
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe notXTurnErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game numberOfXPlays .
			self assert: (game isThereAnXIn: 1 @ 1).
			self assert: game numberOfOPlays = 0].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/31/2018 14:19:39'!
test05OShouldNotPlayTwiceInARow
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self
		should: [ game markWithOAt: 3 @ 3 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe notXTurnErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game numberOfXPlays .
			self assert: (game isThereAnXIn: 1 @ 1).
			self
				assert: 1
				equals: game numberOfOPlays .
			self assert: (game isThereAnOIn: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/31/2018 14:30:06'!
test05b_XPlayerRowPositionShouldBeLessThan3
	| game |
	game _ TicTacToe new.
	self
		should: [ game markWithXAt: 4 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe playOutOfBoundsMessage 
				equals: anError messageText.
			self
				assert: game numberOfXPlays = 0.
			].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/31/2018 14:26:41'!
test06PlaysShouldBeInDifferentPositions
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self
		should: [ game markWithXAt: 1 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game numberOfXPlays .
			self assert: (game isThereAnXIn: 1 @ 1).
			self
				assert: 1
				equals: game numberOfOPlays .
			self assert: (game isThereAnOIn: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/31/2018 14:27:02'!
test08XsAndOsPositionsShouldNotOverlap
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game numberOfXPlays .
			self assert: (game isThereAnXIn: 1 @ 1).
			self assert: game numberOfOPlays = 0].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/31/2018 14:27:41'!
test09SamePlayerPositionsShouldNotOverlap
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	game markWithXAt: 3 @ 3.
	self
		should: [ game markWithOAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 2
				equals: game numberOfXPlays .
			self assert: (game isThereAnXIn: 1 @ 1).
			self assert: (game isThereAnXIn: 3 @ 3).
			self
				assert: 1
				equals: game numberOfOPlays .
			self assert: (game isThereAnOIn: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/29/2018 22:35:34'!
test10NeitherPlayerWinsIfGameNotFinished
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 3 @ 3.
	self deny: game OHasWon.
	self deny: game XHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/29/2018 22:41:19'!
test11APlayerWinsByCompletingFirstRowAndTheOtherLoses
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 3 @ 3.
	game markWithXAt: 1 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/29/2018 22:42:00'!
test12APlayerWinsByCompletingSecondRowAndTheOtherLoses
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 2 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/29/2018 22:42:38'!
test13APlayerWinsByCompletingThirdRowAndTheOtherLoses
	| game |
	game _ TicTacToe new.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 3 @ 2.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 3 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/29/2018 22:43:23'!
test14APlayerWinsByCompletingFirstColumnAndTheOtherLoses
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 3 @ 3.
	game markWithXAt: 3 @ 1.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/29/2018 22:52:55'!
test15APlayerWinsByCompletingDownDiagonalAndTheOtherLoses
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 3 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/29/2018 22:53:11'!
test16APlayerWinsByCompletingUpDiagonalAndTheOtherLoses
	| game |
	game _ TicTacToe new.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 1 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/29/2018 22:50:52'!
test17APlayerWinsByCompletingSecondColumnAndTheOtherLoses
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 3 @ 3.
	game markWithXAt: 3 @ 2.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/29/2018 22:51:35'!
test18APlayerWinsByCompletingThirdColumnAndTheOtherLoses
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 2 @ 2.
	game markWithXAt: 2 @ 3.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 3 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/31/2018 14:28:34'!
test19OCannotPlayIfXAlreadyWon
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 1 @ 3.
	self
		should: [ game markWithOAt: 3 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
			self
				assert: 2
				equals: game numberOfOPlays .
			self assert: (game isThereAnOIn: 2 @ 1).
			self assert: (game isThereAnOIn: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/31/2018 14:29:00'!
test20XCannotPlayIfOAlreadyWon
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 1 @ 3.
	self
		should: [ game markWithXAt: 3 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
			self
				assert: 3
				equals: game numberOfXPlays .
			self assert: (game isThereAnXIn: 2 @ 2).
			self assert: (game isThereAnXIn: 2 @ 1).
			self assert: (game isThereAnXIn: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/29/2018 23:14:08'!
test21TableIsFullButNeitherPlayerWonThenItsATie
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 3 @ 2.
	game markWithXAt: 3 @ 3.
	self assert: game isOver.
	self deny: game XHasWon.
	self deny: game OHasWon.
	self assert: game isTied.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/29/2018 23:13:14'!
test21TableIsFullWithAWinningXThenXWonAndOLoses
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 3 @ 2.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 3 @ 3.
	self assert: game isOver.
	self assert: game XHasWon.
	self deny: game OHasWon.
	self deny: game isTied.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/31/2018 15:25:43'!
test22GameStateChangesAfterXPlayerMarksTheBoard
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	self
		assert: game isOTurn! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/31/2018 15:26:49'!
test23GameStateChangesAfterOPlayerMarksTheBoard
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self
		assert: game isXTurn! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/31/2018 15:33:17'!
test24GameStateChangesAfterAPlayerWinsAndTheOtherLoses
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 3 @ 3.
	game markWithXAt: 1 @ 3.
	self assert: game isXPlayerTheWinner.! !


!classDefinition: #OTurn category: #TicTacToStep21!
Object subclass: #OTurn
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!OTurn methodsFor: 'as yet unclassified' stamp: 'AL 5/28/2018 21:19:44'!
markWithOInGame: aGame at: aPosition
	aGame putOAt: aPosition.! !

!OTurn methodsFor: 'as yet unclassified' stamp: 'AL 5/28/2018 21:26:09'!
markWithXInGame: aGame at: aPosition.

	^ aGame error: aGame class notXTurnErrorMessage.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OTurn class' category: #TicTacToStep21!
OTurn class
	instanceVariableNames: ''!

!OTurn class methodsFor: 'as yet unclassified' stamp: 'AL 5/28/2018 20:25:40'!
with: aGame

	^ self new initializeWith: aGame! !


!classDefinition: #OWon category: #TicTacToStep21!
Object subclass: #OWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!OWon methodsFor: 'as yet unclassified' stamp: 'AL 5/29/2018 23:02:03'!
markWithOInGame: aGame at: aPosition.

	self error: aGame class canNotPlayWhenGameIsOverErrorMessage.! !

!OWon methodsFor: 'as yet unclassified' stamp: 'AL 5/29/2018 22:59:42'!
markWithXInGame: aGame at: aPosition.

	self error: aGame class canNotPlayWhenGameIsOverErrorMessage.! !


!classDefinition: #State category: #TicTacToStep21!
Object subclass: #State
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!State methodsFor: 'as yet unclassified' stamp: 'AL 5/29/2018 23:21:19'!
markWithOInGame: aGame at: aPosition
	
	self subclassResponsibility.! !

!State methodsFor: 'as yet unclassified' stamp: 'AL 5/28/2018 21:06:25'!
markWithXInGame: aGame at: aPosition
	
	self subclassResponsibility.! !


!classDefinition: #XTurn category: #TicTacToStep21!
State subclass: #XTurn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!XTurn methodsFor: 'as yet unclassified' stamp: 'AL 5/28/2018 21:27:34'!
markWithOInGame: aGame at: aPosition

	^ aGame error: aGame class notXTurnErrorMessage.! !

!XTurn methodsFor: 'as yet unclassified' stamp: 'AL 5/29/2018 23:00:56'!
markWithXInGame: aGame at: aPosition
	aGame putXAt: aPosition.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XTurn class' category: #TicTacToStep21!
XTurn class
	instanceVariableNames: ''!

!XTurn class methodsFor: 'as yet unclassified' stamp: 'AL 5/28/2018 20:23:54'!
with: aGame

	^ self new initializeWith: aGame! !


!classDefinition: #TicTacToe category: #TicTacToStep21!
Object subclass: #TicTacToe
	instanceVariableNames: 'os xs state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToe methodsFor: 'plays' stamp: 'AL 5/29/2018 23:14:32'!
markWithOAt: aPosition

	state markWithOInGame: self at: aPosition.
	(self OHasWon) ifTrue: [state _ OWon new]
					    ifFalse: [state _ XTurn new].
! !

!TicTacToe methodsFor: 'plays' stamp: 'AL 5/29/2018 23:14:41'!
markWithXAt: aPosition
		
	state markWithXInGame: self at: aPosition.
	(self XHasWon) ifTrue: [state _ XWon new]
					    ifFalse: [ state _ OTurn new].	
! !

!TicTacToe methodsFor: 'plays' stamp: 'AL 5/31/2018 14:25:03'!
putOAt: aPosition
	
	(self isPlayOutOfBounds: aPosition) ifTrue: [self error: self playOutOfBoundsMessage ].	
	(self isPositionAlreadyTaken: aPosition) ifTrue: [self error: self class positionTakenErrorMessage].	
	os add: aPosition.

	
	! !

!TicTacToe methodsFor: 'plays' stamp: 'AL 5/31/2018 14:34:11'!
putXAt: aPosition

	(self isPlayOutOfBounds: aPosition) ifTrue: [self error: self class playOutOfBoundsMessage ].	
	(self isPositionAlreadyTaken: aPosition) ifTrue: [self error: self class positionTakenErrorMessage].	
	xs add: aPosition.

	
	! !


!TicTacToe methodsFor: 'table state' stamp: 'jg 5/22/2018 12:51:23'!
hasCompletedColumn: positions
	
	^ (1 to: 3) anySatisfy: [ :y | (positions count: [ :position | position y = y ]) = 3 ]! !

!TicTacToe methodsFor: 'table state' stamp: 'jg 5/22/2018 12:36:01'!
hasCompletedRow: positions

	^ (1 to: 3) anySatisfy: [ :x | (positions count: [ :posicion | posicion x = x ]) = 3 ]! !

!TicTacToe methodsFor: 'table state' stamp: 'jg 5/22/2018 12:56:21'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]
! !

!TicTacToe methodsFor: 'table state' stamp: 'jg 5/22/2018 13:02:13'!
hasUpDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'table state' stamp: 'jg 5/22/2018 13:01:53'!
hasWin: positions

	^(self hasCompletedRow: positions)
		or: [(self hasCompletedColumn: positions) 
				or: [(self hasDownDiagonal: positions)
					or: [(self hasUpDiagonal: positions)]]]


! !

!TicTacToe methodsFor: 'table state' stamp: 'Nacho 5/31/2018 15:31:02'!
isOPlayerTheWinner
	^ self state class = OWon. ! !

!TicTacToe methodsFor: 'table state' stamp: 'AL 5/31/2018 14:09:32'!
isOTurn
	^ self state class = OTurn. ! !

!TicTacToe methodsFor: 'table state' stamp: 'AL 5/31/2018 14:32:04'!
isPlayOutOfBounds: aPosition
	
	|outsideRowLimits outsideColumnLimits|
	
	outsideRowLimits _ aPosition x < 1 or: [aPosition x > 3].
	outsideColumnLimits _ aPosition  y < 1 or: [aPosition y > 3].
	
	^ outsideRowLimits or: [outsideColumnLimits].! !

!TicTacToe methodsFor: 'table state' stamp: 'AL 5/29/2018 23:07:58'!
isPositionAlreadyTaken: aPosition
	
	^ (os includes: aPosition) or: [xs includes: aPosition].! !

!TicTacToe methodsFor: 'table state' stamp: 'Nacho 5/31/2018 15:30:53'!
isXPlayerTheWinner
	^ self state class = XWon. ! !

!TicTacToe methodsFor: 'table state' stamp: 'AL 5/31/2018 14:09:24'!
isXTurn
	^ self state class = XTurn. ! !

!TicTacToe methodsFor: 'table state' stamp: 'AL 5/29/2018 23:18:29'!
state
	^ state. ! !


!TicTacToe methodsFor: 'result' stamp: 'AL 5/29/2018 22:33:11'!
OHasWon
	
	^ self hasWin: os.! !

!TicTacToe methodsFor: 'result' stamp: 'AL 5/29/2018 22:40:35'!
XHasWon
	
	^ self hasWin: xs.! !

!TicTacToe methodsFor: 'result' stamp: 'jg 5/22/2018 15:07:08'!
isOver
	
	^self XHasWon or: [ self OHasWon or: [ self isTied ]]
! !

!TicTacToe methodsFor: 'result' stamp: 'AL 5/29/2018 23:17:45'!
isTied
	
	^xs size = 5 and: [ os size = 4 and: [ self XHasWon not ]] and: [ self OHasWon not ].! !


!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:01:34'!
Os

	^os copy.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:01:25'!
Xs

	^xs copy.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'AL 5/31/2018 14:14:07'!
isThereAnOIn: aPosition
	^ self Os includes: aPosition.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'AL 5/31/2018 14:14:34'!
isThereAnXIn: aPosition
	^ self Xs includes: aPosition.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'AL 5/31/2018 14:16:14'!
numberOfOPlays
	^ self Os size.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'AL 5/31/2018 14:16:09'!
numberOfXPlays
	^ self Xs size.! !


!TicTacToe methodsFor: 'initialization' stamp: 'AL 5/28/2018 21:05:22'!
initialize
	
	xs _ Set new.
	os _ Set new.
	
	state _ XTurn new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToStep21!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:15:31'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:26:38'!
notXTurnErrorMessage

	^'Not X turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'AL 5/31/2018 14:20:10'!
playOutOfBoundsMessage
	
	^'Play is out of bounds'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:20:12'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #XWon category: #TicTacToStep21!
Object subclass: #XWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!XWon methodsFor: 'as yet unclassified' stamp: 'AL 5/29/2018 22:58:29'!
markWithOInGame: aGame at: aPosition.

	self error: aGame class canNotPlayWhenGameIsOverErrorMessage.! !

!XWon methodsFor: 'as yet unclassified' stamp: 'AL 5/29/2018 23:01:56'!
markWithXInGame: aGame at: aPosition.

	self error: aGame class canNotPlayWhenGameIsOverErrorMessage.! !
