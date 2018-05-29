!classDefinition: #TicTacToeTest category: #TicTacToStep21!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/28/2018 19:25:00'!
test01NewGameMustBeEmpty
	| game |
	game _ TicTacToe new.
	self assert: game Xs isEmpty.
	self assert: game Os isEmpty.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/28/2018 19:27:43'!
test02FirstTurnIsX
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	self
		assert: 1
		equals: game Xs size.
	self assert: (game Xs includes: 1 @ 1).
	self assert: game Os isEmpty.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/28/2018 19:30:32'!
test03MarksInTableMustBeSaved
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self
		assert: 1
		equals: game Xs size.
	self assert: (game Xs includes: 1 @ 1).
	self
		assert: 1
		equals: game Os size.
	self assert: (game Os includes: 2 @ 2).! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/28/2018 19:38:03'!
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
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: game Os isEmpty ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/28/2018 19:38:19'!
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
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/28/2018 21:28:47'!
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
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/28/2018 21:35:35'!
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
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: game Os isEmpty ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/28/2018 21:38:10'!
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
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: (game Xs includes: 3 @ 3).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'AL 5/28/2018 21:38:37'!
test10

	|game|
	
	game := TicTacToe new.

	game markWithXAt: 1@1.
	game markWithOAt: 2@1.
	game markWithXAt: 2@2.
	game markWithOAt: 3@3.
	
	self deny: game OHasWon.
	self deny: game XHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/28/2018 19:43:15'!
test11

	|game|
	
	game := TicTacToe new.

	game markWithXAt: 1@1.
	game markWithOAt: 2@1.
	game markWithXAt: 1@2.
	game markWithOAt: 3@3.
	game markWithXAt: 1@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/28/2018 19:43:48'!
test12

	|game|
	
	game := TicTacToe new.

	game markWithXAt: 2@1.
	game markWithOAt: 1@1.
	game markWithXAt: 2@2.
	game markWithOAt: 3@1.
	game markWithXAt: 2@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/28/2018 19:45:13'!
test13

	|game|
	
	game := TicTacToe new.

	game markWithXAt: 3@1.
	game markWithOAt: 1@1.
	game markWithXAt: 3@2.
	game markWithOAt: 2@1.
	game markWithXAt: 3@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/28/2018 19:45:47'!
test14

	|game|
	
	game := TicTacToe new.

	game markWithXAt: 1@1.
	game markWithOAt: 2@2.
	game markWithXAt: 2@1.
	game markWithOAt: 3@3.
	game markWithXAt: 3@1.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/28/2018 19:46:17'!
test15

	|game|
	
	game := TicTacToe new.

	game markWithXAt: 1@1.
	game markWithOAt: 2@1.
	game markWithXAt: 2@2.
	game markWithOAt: 2@3.
	game markWithXAt: 3@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/28/2018 19:48:03'!
test16

	|game|
	
	game := TicTacToe new.

	game markWithXAt: 3@1.
	game markWithOAt: 2@1.
	game markWithXAt: 2@2.
	game markWithOAt: 1@2.
	game markWithXAt: 1@3.
	
	
		self assert: game XHasWon.
		self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/28/2018 19:48:42'!
test17

	|game|
	
	game := TicTacToe new.

	game markWithXAt: 3@1.
	game markWithOAt: 1@1.
	game markWithXAt: 2@2.
	game markWithOAt: 1@2.
	game markWithXAt: 3@3.
	game markWithOAt: 1@3.
	
		self assert: game OHasWon.
		self deny: game XHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/28/2018 19:52:11'!
test18

	| game |
	
	game := TicTacToe new.
	
	game markWithXAt: 1@1.	
	game markWithOAt: 2@1.
	game markWithXAt: 1@2.
	game markWithOAt: 3@1.	
	game markWithXAt: 1@3.

	self 
		should: [ game markWithOAt: 3@1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 2 equals: game Os size.
			self assert: (game Os includes: 2@1).
			self assert: (game Os includes: 3@1) ]
			
			! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/28/2018 19:53:10'!
test19

	| game |
	
	game := TicTacToe new.
	
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.	
	game markWithXAt: 2@1.
	game markWithOAt: 1@2.
	game markWithXAt: 3@1.	
	game markWithOAt: 1@3.

	self 
		should: [ game markWithXAt: 3@2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 3 equals: game Xs size.
			self assert: (game Xs includes: 2@2).
			self assert: (game Xs includes: 2@1).
			self assert: (game Xs includes: 3@1) ]
			
			! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/28/2018 19:54:00'!
test20

	| game |
	
	game := TicTacToe new.
	
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.	
	game markWithXAt: 1@3.
	game markWithOAt: 3@1.
	game markWithXAt: 2@1.	
	game markWithOAt: 2@3.
	game markWithXAt: 1@2.	
	game markWithOAt: 3@2.
	game markWithXAt: 3@3.
	
	self assert: game isOver.
	self deny: game XHasWon. 
	self deny: game OHasWon. 
	self assert: game isTied
! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/28/2018 19:55:43'!
test21

	| game |
	
	game := TicTacToe new.
	
	game markWithXAt: 2@2.
	game markWithOAt: 1@2.	
	game markWithXAt: 1@1.
	game markWithOAt: 2@1.
	game markWithXAt: 1@3.	
	game markWithOAt: 2@3.
	game markWithXAt: 3@2.	
	game markWithOAt: 3@1.
	game markWithXAt: 3@3.
	
	self assert: game isOver.
	self assert: game XHasWon. 
	self deny: game OHasWon. 
	self deny: game isTied
! !


!classDefinition: #OTurn category: #TicTacToStep21!
Object subclass: #OTurn
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!OTurn methodsFor: 'as yet unclassified' stamp: 'AL 5/28/2018 20:24:54'!
markWithOAt: aPosition

	game putOAt: aPosition.! !

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


!classDefinition: #State category: #TicTacToStep21!
Object subclass: #State
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

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

!XTurn methodsFor: 'as yet unclassified' stamp: 'AL 5/28/2018 21:02:59'!
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
	instanceVariableNames: 'os xs state winner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToe methodsFor: 'plays' stamp: 'AL 5/28/2018 21:19:26'!
markWithOAt: aPosition
	(xs includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	(os includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].

	state markWithOInGame: self at: aPosition.
	
	
	"
	self isGameOver ifTrue: [ self error: self class canNotPlayWhenGameIsOverErrorMessage ].
	state = #o ifFalse: [ self error: self class notXTurnErrorMessage ].
	(xs includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	(os includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	os add: aPosition.
	(self hasWin: os) ifTrue: [ ^ winner _ #o ].
	state _ #x.
	"! !

!TicTacToe methodsFor: 'plays' stamp: 'AL 5/28/2018 21:07:39'!
markWithXAt: aPosition
	
	(xs includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	(os includes: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	
	state markWithXInGame: self at: aPosition.
	
	"
	self isGameOver ifTrue: [ self error: self class canNotPlayWhenGameIsOverErrorMessage ].
	turn = #x ifFalse: [ self error: self class notXTurnErrorMessage ].
	(self hasWin: xs) ifTrue: [ ^ winner _ #x ].
	turn _ #o.
	"! !

!TicTacToe methodsFor: 'plays' stamp: 'AL 5/28/2018 21:14:51'!
putOAt: aPosition

	os add: aPosition.
	state _ XTurn new.

	
	! !

!TicTacToe methodsFor: 'plays' stamp: 'AL 5/28/2018 21:13:57'!
putXAt: aPosition

	xs add: aPosition.
	state _ OTurn new.

	
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


!TicTacToe methodsFor: 'result' stamp: 'jg 5/22/2018 12:21:33'!
OHasWon
	
	^winner = #o! !

!TicTacToe methodsFor: 'result' stamp: 'jg 5/22/2018 12:21:43'!
XHasWon
	
	^winner = #x! !

!TicTacToe methodsFor: 'result' stamp: 'jg 5/22/2018 13:17:25'!
isGameOver
	
	^winner = #x or: [ winner = #o ]! !

!TicTacToe methodsFor: 'result' stamp: 'jg 5/22/2018 15:07:08'!
isOver
	
	^self XHasWon or: [ self OHasWon or: [ self isTied ]]
! !

!TicTacToe methodsFor: 'result' stamp: 'jg 5/22/2018 15:06:57'!
isTied
	
	^xs size = 5 and: [ os size = 4 and: [ self XHasWon not ]] " and: [ self YHasWon not ]]]"! !


!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:01:34'!
Os

	^os copy.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:01:25'!
Xs

	^xs copy.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'AL 5/28/2018 21:05:22'!
initialize
	
	xs _ Set new.
	os _ Set new.
	
	state _ XTurn new.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'AL 5/28/2018 21:46:31'!
state
	
	^state.! !

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

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:20:12'!
positionTakenErrorMessage
	
	^'Position taken'! !
