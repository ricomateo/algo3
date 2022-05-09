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

!NumeroTest methodsFor: 'tests' stamp: 'mr 5/6/2022 14:51:51'!
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

!Numero methodsFor: 'arithmetic operations' stamp: 'mr 5/6/2022 14:50:19'!
/ aDivisor

	self subclassResponsibility.! !

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


!Numero methodsFor: 'as yet unclassified' stamp: 'nrm 5/5/2022 20:36:33'!
beAddedToAFraccion: anAugend
	self subclassResponsibility.! !

!Numero methodsFor: 'as yet unclassified' stamp: 'nrm 5/5/2022 20:23:11'!
beAddedToAnEntero: anAugend
	self subclassResponsibility.! !

!Numero methodsFor: 'as yet unclassified' stamp: 'mr 5/6/2022 14:59:21'!
beDivisorToAFraccion: aDividend

	self subclassResponsibility.! !

!Numero methodsFor: 'as yet unclassified' stamp: 'mr 5/6/2022 14:51:28'!
beDivisorToAnEntero: aDividend
	
	self subclassResponsibility.! !

!Numero methodsFor: 'as yet unclassified' stamp: 'mr 5/6/2022 14:51:06'!
beMultipliedTAnEntero: aMultiplier
	
	self subclassResponsibility.! !

!Numero methodsFor: 'as yet unclassified' stamp: 'nrm 5/5/2022 20:59:49'!
beMultipliedToAFraccion: aMultiplier
	self subclassResponsibility.! !

!Numero methodsFor: 'as yet unclassified' stamp: 'nrm 5/6/2022 16:25:37'!
beSubtrahendToAFraccion: aMinuend
	^self subclassResponsibility.! !

!Numero methodsFor: 'as yet unclassified' stamp: 'nrm 5/6/2022 16:09:01'!
beSubtrahendToAnEntero: aMinuend 
	self subclassResponsibility.! !

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

!Entero methodsFor: 'arithmetic operations' stamp: 'nrm 5/5/2022 20:50:10'!
* aMultiplier 
	
	"(aMultiplier isKindOf: Entero) ifTrue: [
	^self class with: value * aMultiplier integerValue].
	(aMultiplier isKindOf: Fraccion) ifTrue:[
	^self*aMultiplier numerator / aMultiplier denominator]."

	^aMultiplier beMultipliedToAnEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'nrm 5/5/2022 20:26:01'!
+ anAdder 
	^ anAdder beAddedToAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'nrm 5/6/2022 16:07:01'!
- aSubtrahend 
	^ aSubtrahend beSubtrahendToAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'mr 5/6/2022 14:49:52'!
/ aDivisor
	
	^aDivisor beDivisorToAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'nrm 5/9/2022 17:11:10'!
fibonacci
"


	| one two |
	
	
	
	one := Entero with: 1.
	
	two := Entero with: 2.
	
	
	
	self isNegative ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	
	(self isZero or: [self isOne]) ifTrue: [^one].
	
	
	
	^ (self - one) fibonacci + (self - two) fibonacci"
	self subclassResponsibility 
	
		! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'nrm 5/9/2022 17:14:11'!
initializeWith: aValue 
	self subclassResponsibility ! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'nrm 5/9/2022 17:56:44'!
// aDivisor 
	
	^Entero with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'nrm 5/5/2022 20:30:13'!
beAddedToAFraccion: anAugend
	|newNumerator newDenominator|
	newNumerator := (anAugend numerator) + (anAugend denominator * self).
	newDenominator := anAugend denominator .
	^newNumerator / newDenominator ! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'nrm 5/9/2022 17:55:46'!
beAddedToAnEntero: anAugend
	^Entero with: anAugend integerValue + value.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'mr 5/6/2022 14:58:22'!
beDivisorToAFraccion: aDividend
	
	^aDividend numerator / (aDividend denominator * self).
	! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'mr 5/6/2022 14:49:12'!
beDivisorToAnEntero: aDividend
	
	^Fraccion with: aDividend over: self.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'nrm 5/5/2022 20:59:06'!
beMultipliedToAFraccion: aMultiplier
	^self * aMultiplier numerator / aMultiplier denominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'nrm 5/9/2022 17:55:30'!
beMultipliedToAnEntero: aMultiplier
	^Entero with: value * aMultiplier integerValue.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'nrm 5/6/2022 16:24:43'!
beSubtrahendToAFraccion: aMinuend
	^aMinuend numerator - aMinuend denominator * self / aMinuend denominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'nrm 5/9/2022 17:55:16'!
beSubtrahendToAnEntero: aMinuend 
	 ^Entero with: aMinuend integerValue - value.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'nrm 5/9/2022 17:55:00'!
greatestCommonDivisorWith: anEntero 
	
	^Entero with: (value gcd: anEntero integerValue)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'nrm 5/9/2022 17:47:49'!
with: aValue 
	
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	(self subclasses) do:
	[:aSubclass|(aSubclass  isSimilarTo:aValue) ifTrue: [^aSubclass  new initializeWith: aValue ].].
	! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'as yet unclassified' stamp: 'nrm 5/9/2022 16:58:20'!
fibonacci
	| one |
	one := Entero with: 1.
	^ one! !

!Cero methodsFor: 'as yet unclassified' stamp: 'nrm 5/9/2022 17:13:32'!
initializeWith: aValue 
	
	value := 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numeros-Parte2-Ejercicio'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'as yet unclassified' stamp: 'nrm 5/9/2022 17:45:32'!
isSimilarTo: aValue
	^aValue = 0.! !


!classDefinition: #EnteroMayorAUno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroMayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroMayorAUno methodsFor: 'as yet unclassified' stamp: 'nrm 5/9/2022 16:57:32'!
fibonacci
	| one two |
	one := Entero with: 1.
	
	two := Entero with: 2.
	^ (self - one) fibonacci + (self - two) fibonacci! !

!EnteroMayorAUno methodsFor: 'as yet unclassified' stamp: 'nrm 5/9/2022 17:07:14'!
initializeWith: aValue 
	
	value := aValue! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroMayorAUno class' category: 'Numeros-Parte2-Ejercicio'!
EnteroMayorAUno class
	instanceVariableNames: ''!

!EnteroMayorAUno class methodsFor: 'as yet unclassified' stamp: 'nrm 5/9/2022 17:45:41'!
isSimilarTo: aValue
	^aValue > 1.! !


!classDefinition: #EnteroNegativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroNegativo methodsFor: 'as yet unclassified' stamp: 'nrm 5/9/2022 16:48:30'!
fibonacci
	self error: Entero negativeFibonacciErrorDescription! !

!EnteroNegativo methodsFor: 'as yet unclassified' stamp: 'nrm 5/9/2022 17:07:04'!
initializeWith: aValue 
	
	value := aValue! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroNegativo class' category: 'Numeros-Parte2-Ejercicio'!
EnteroNegativo class
	instanceVariableNames: ''!

!EnteroNegativo class methodsFor: 'as yet unclassified' stamp: 'nrm 5/9/2022 17:45:49'!
isSimilarTo: aValue
	^aValue < 0.! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'as yet unclassified' stamp: 'nrm 5/9/2022 16:49:07'!
fibonacci
	^self! !

!Uno methodsFor: 'as yet unclassified' stamp: 'nrm 5/9/2022 17:13:42'!
initializeWith: aValue 
	
	value := 1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numeros-Parte2-Ejercicio'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'as yet unclassified' stamp: 'nrm 5/9/2022 17:45:55'!
isSimilarTo: aValue
	^aValue = 1.! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'nrm 5/5/2022 20:57:28'!
* aMultiplier
	
	"(aMultiplier isKindOf: Fraccion) ifTrue:[
	^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)].
	(aMultiplier isKindOf: Entero) ifTrue:[
	^aMultiplier * numerator / denominator.]"
	^aMultiplier beMultipliedToAFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'nrm 5/5/2022 20:34:32'!
+ anAdder 
	^anAdder beAddedToAFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'nrm 5/6/2022 16:24:16'!
- aSubtrahend 
	
	^aSubtrahend beSubtrahendToAFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'mr 5/6/2022 14:58:47'!
/ aDivisor 

	^aDivisor beDivisorToAFraccion: self.! !


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


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'nrm 5/5/2022 20:33:16'!
beAddedToAFraccion: anAugend
	|newNumerator newDenominator|
	newNumerator := (anAugend numerator *  denominator) + (anAugend denominator *  numerator).
	newDenominator := anAugend denominator *  denominator.
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'nrm 5/5/2022 20:23:41'!
beAddedToAnEntero: anAugend
	^anAugend value * self denominator + self numerator/self denominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'mr 5/6/2022 14:57:20'!
beDivisorToAFraccion: aDividend

	^(aDividend numerator * self denominator) / (aDividend denominator * self numerator).! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'mr 5/6/2022 14:48:02'!
beDivisorToAnEntero: aDividend
	
	^Fraccion with: aDividend * self denominator over: self numerator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'nrm 5/5/2022 20:55:21'!
beMultipliedToAFraccion: aMultiplier
	^(aMultiplier numerator * numerator) / (aMultiplier denominator * denominator).! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'nrm 5/5/2022 20:48:21'!
beMultipliedToAnEntero: aMultiplier

	^aMultiplier * self numerator / self denominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'nrm 5/6/2022 16:22:21'!
beSubtrahendToAFraccion: aMinuend
	^((aMinuend numerator *  denominator) - (aMinuend denominator * numerator))/(aMinuend denominator * denominator).! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'nrm 5/6/2022 16:05:23'!
beSubtrahendToAnEntero: aMinuend 
	^aMinuend * (denominator) - (numerator)/denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'nrm 5/9/2022 18:09:22'!
with: aDividend over: aDivisor
	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	
	aDividend isZero ifTrue: [ ^aDividend ].
	
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
