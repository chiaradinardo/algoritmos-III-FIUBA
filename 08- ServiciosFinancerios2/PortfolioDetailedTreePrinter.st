'From Cuis 6.0 [latest update: #5481] on 18 November 2022 at 5:19:47 pm'!
!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Solucion'!
Object subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: 'portfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'M 11/18/2022 15:38:47'!
initializeFor: aPortfolio

	portfolio := aPortfolio.! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'M 11/18/2022 15:48:33'!
print

	"|detailedReport|
	detailedReport := ''.
	
	portfolio accounts do:[:anAccount | detailedReport := detailedReport, String newLineString, String tab, anAccount name, String newLineString, String tab, String tab, 'Balance = ', anAccount balance asString, ' pesos'].	
	detailedReport := portfolio name,  detailedReport, String newLineString, String tab, 'balance = ', portfolio balance asString, ' pesos'."

	^self print: portfolio withIndentation: ''.! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'M 11/18/2022 17:15:09'!
print: anAccount withIndentation: anIndentation

	| reportString |
	reportString := ''.
	
	(anAccount isKindOf: ReceptiveAccount) ifTrue: [^anIndentation, anAccount name, String newLineString, anIndentation, String tab, 'Balance = ', anAccount balance asString, ' pesos'].
	
	(anAccount accounts isEmpty) ifTrue: [^anIndentation, anAccount name, String newLineString, anIndentation, String tab, 'Balance = ', anAccount balance asString, ' pesos'].
	
	anAccount accounts do: [:childAccount | reportString := reportString, String newLineString, (self print: childAccount withIndentation: String tab, anIndentation)].
	
	^ anIndentation, anAccount name, reportString, String newLineString, anIndentation, String tab, 'Balance = ', anAccount balance asString, ' pesos'.
	! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'M 11/18/2022 16:57:41'!
printReportOf: anAccount with: anIndentation

	| report |

	report := ''.

	anAccount transactions do: [ :aTransaction | aTransaction addToReport: (String newLineString, anIndentation, String tab, report)].
	
	report add: String newLineString, anIndentation, String tab, 'Balance = ', anAccount balance asString, ' pesos'.
	
	^ anIndentation, anAccount name, report.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioDetailedTreePrinter class' category: 'ServiciosFinancieros-Solucion'!
PortfolioDetailedTreePrinter class
	instanceVariableNames: ''!

!PortfolioDetailedTreePrinter class methodsFor: 'as yet unclassified' stamp: 'M 11/18/2022 15:38:34'!
for: aPortfolio 
	^self new initializeFor: aPortfolio.! !
