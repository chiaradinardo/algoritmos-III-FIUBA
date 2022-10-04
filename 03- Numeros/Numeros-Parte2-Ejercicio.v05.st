!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'MA 9/30/2022 19:03:53'!
* aMultiplier 
	^aMultiplier multiplicarEntero: self.
	
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'MA 9/30/2022 18:44:43'!
+ anAdder 

	^anAdder sumarEntero: self.

! !

!Entero methodsFor: 'arithmetic operations' stamp: 'CDN 10/3/2022 21:38:19'!
- aSubtrahend 
	^ aSubtrahend esRestadoPorUnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'CDN 10/3/2022 21:34:59'!
/ aDivisor 
	^ aDivisor esDivididoPorUnEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'M 10/4/2022 00:15:18'!
fibonacci
	
	self subclassResponsibility.! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'M 10/4/2022 00:16:35'!
isNegative
	
	self subclassResponsibility. ! !

!Entero methodsFor: 'testing' stamp: 'M 10/4/2022 00:16:23'!
isOne
	
	self subclassResponsibility.! !

!Entero methodsFor: 'testing' stamp: 'M 10/4/2022 00:16:12'!
isZero
	
	self subclassResponsibility.! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'M 10/4/2022 00:14:42'!
// aDivisor 
	^aDivisor esDivididoEnteramentePorUnEntero: self
	
											"
											    __	
											 _ |_ | _ 
											   |O O|
									                	---| <   |----
											   |_-_ |
											  /      |
											/        |
														- Mate 									
											
											"! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'M 10/4/2022 00:09:55'!
esDivididoEnteramentePorUnEntero: unEntero

	^ Entero with: unEntero integerValue // value.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'CDN 10/3/2022 21:34:49'!
esDivididoPorUnEntero: unEntero

	^Fraccion with: unEntero over: self! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'CDN 10/3/2022 21:37:21'!
esDivididoPorUnaFraccion: unaFraccion

	^ unaFraccion numerator / (unaFraccion denominator * self)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'M 10/3/2022 23:47:17'!
esRestadoPorUnEntero: aEntero

	^ Entero with: (aEntero integerValue - value)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'CDN 10/3/2022 21:26:03'!
esRestadoPorUnaFraccion: unaFraccion

	^ (unaFraccion numerator - (self * unaFraccion denominator)) / unaFraccion denominator
	! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'M 10/3/2022 23:44:58'!
greatestCommonDivisorWith: anEntero 
	
	^Entero with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'M 10/3/2022 23:47:07'!
multiplicarEntero: unEntero

	 ^(Entero with: (value * unEntero integerValue))! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'CDN 10/3/2022 21:42:06'!
multiplicarFraccion: unaFraccion

	^ (self * unaFraccion numerator) / unaFraccion denominator! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'M 10/3/2022 23:46:51'!
sumarEntero: unEntero

	 ^Entero with: value + unEntero integerValue. ! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'MA 9/30/2022 18:57:13'!
sumarFraccion: unaFraccion
	
	| newNumerator |
	newNumerator := (self * unaFraccion denominator) + unaFraccion numerator.
	
	^ newNumerator / unaFraccion denominator.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'M 10/3/2022 23:24:12'!
esTuClase: aValue

	self subclassResponsibility.! !

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'M 10/3/2022 23:56:28'!
with: aValue 

	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^ (self subclasses detect: [:subclass | subclass esTuClase: aValue])new initializeWith: aValue.! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'as yet unclassified' stamp: 'M 10/3/2022 23:53:50'!
fibonacci

	^ Entero with: 1.! !

!Cero methodsFor: 'as yet unclassified' stamp: 'M 10/4/2022 00:17:49'!
isNegative

	^false.! !

!Cero methodsFor: 'as yet unclassified' stamp: 'M 10/4/2022 00:17:28'!
isOne
	
	^false.! !

!Cero methodsFor: 'as yet unclassified' stamp: 'M 10/4/2022 00:17:10'!
isZero

	^true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numeros-Parte2-Ejercicio'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'as yet unclassified' stamp: 'M 10/3/2022 23:19:11'!
esTuClase: aValue

	^aValue = 0.! !


!classDefinition: #MayoresAUno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #MayoresAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!MayoresAUno methodsFor: 'as yet unclassified' stamp: 'M 10/3/2022 23:55:36'!
fibonacci

	^ (self - (Entero with: 1)) fibonacci + (self - (Entero with: 2)) fibonacci.! !

!MayoresAUno methodsFor: 'as yet unclassified' stamp: 'M 10/4/2022 00:19:26'!
isNegative

	^false.! !

!MayoresAUno methodsFor: 'as yet unclassified' stamp: 'M 10/4/2022 00:20:54'!
isOne

	^false.! !

!MayoresAUno methodsFor: 'as yet unclassified' stamp: 'M 10/4/2022 00:19:03'!
isZero

	^false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MayoresAUno class' category: 'Numeros-Parte2-Ejercicio'!
MayoresAUno class
	instanceVariableNames: ''!

!MayoresAUno class methodsFor: 'as yet unclassified' stamp: 'M 10/3/2022 23:19:59'!
esTuClase: aValue

	^aValue > 1.! !


!classDefinition: #Negativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Negativo methodsFor: 'as yet unclassified' stamp: 'M 10/3/2022 23:02:59'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription.! !

!Negativo methodsFor: 'as yet unclassified' stamp: 'M 10/4/2022 00:20:10'!
isNegative

	^true.! !

!Negativo methodsFor: 'as yet unclassified' stamp: 'M 10/4/2022 00:20:43'!
isOne

	^false.! !

!Negativo methodsFor: 'as yet unclassified' stamp: 'M 10/4/2022 00:19:59'!
isZero

	^false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Negativo class' category: 'Numeros-Parte2-Ejercicio'!
Negativo class
	instanceVariableNames: ''!

!Negativo class methodsFor: 'as yet unclassified' stamp: 'M 10/3/2022 23:20:39'!
esTuClase: aValue

	^aValue < 0.! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'as yet unclassified' stamp: 'M 10/3/2022 23:54:48'!
fibonacci

	^Entero with: 1.! !

!Uno methodsFor: 'as yet unclassified' stamp: 'M 10/4/2022 00:21:06'!
isNegative

	^false.! !

!Uno methodsFor: 'as yet unclassified' stamp: 'M 10/4/2022 00:21:27'!
isOne

	^true.! !

!Uno methodsFor: 'as yet unclassified' stamp: 'M 10/4/2022 00:21:40'!
isZero

	^false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numeros-Parte2-Ejercicio'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'as yet unclassified' stamp: 'M 10/3/2022 23:20:10'!
esTuClase: aValue

	^aValue = 1! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CDN 10/3/2022 21:42:22'!
* aMultiplier 

	^ aMultiplier multiplicarFraccion: self

	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'MA 9/30/2022 18:56:35'!
+ anAdder 
	^anAdder sumarFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CDN 10/3/2022 21:26:23'!
- aSubtrahend 
	
	^ aSubtrahend esRestadoPorUnaFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CDN 10/3/2022 21:37:57'!
/ aDivisor 

	^ aDivisor esDivididoPorUnaFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CDN 10/3/2022 21:31:46'!
esDivididoPorUnEntero: unEntero
	
	^ unEntero * ( self class with: denominator over: numerator)
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CDN 10/3/2022 21:36:18'!
esDivididoPorUnaFraccion: unaFraccion

	^ (unaFraccion numerator * denominator) / (unaFraccion denominator * numerator)
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CDN 10/3/2022 21:17:53'!
esRestadoPorUnEntero: unEntero

	^ ((unEntero * denominator) - numerator) / denominator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CDN 10/3/2022 21:24:46'!
esRestadoPorUnaFraccion: unaFraccion

	| newDenominator newNumerator |
	
	newNumerator := (unaFraccion numerator * denominator) - (unaFraccion denominator * numerator).
	newDenominator := unaFraccion denominator * denominator.
	
	^newNumerator / newDenominator 
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'MA 9/30/2022 19:10:25'!
multiplicarEntero: unEntero

	^(self numerator * unEntero value) / denominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'CDN 10/3/2022 21:41:25'!
multiplicarFraccion: unaFraccion

	^ (numerator * unaFraccion numerator) / (denominator * unaFraccion denominator)! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'MA 9/30/2022 18:43:01'!
sumarEntero: unEntero

	^((self denominator) * unEntero value + self numerator) / self denominator.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'MA 9/30/2022 18:53:14'!
sumarFraccion: unaFraccion

|newNumerator newDenominator|
newNumerator := ((numerator * unaFraccion denominator) + (denominator * unaFraccion numerator)).
newDenominator := (denominator * unaFraccion denominator).
^ (newNumerator / newDenominator).! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'MA 9/30/2022 15:01:02'!
isNegative
	
	^ (numerator < 0)! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'M 10/4/2022 00:13:33'!
esDivididoEnteramentePorUnEntero: unEntero

	^ unEntero * (denominator / numerator )! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'NR 9/23/2018 23:45:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
