!classDefinition: #HabitatDeAvispas category: 'AvispasYAbejas'!
DenotativeObject subclass: #HabitatDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejas'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitatDeAvispas class' category: 'AvispasYAbejas'!
HabitatDeAvispas class
	instanceVariableNames: 'cantidadDeHuevosOrianaYOrnella cantidadDeOrugas huevosDeAvispas cantidadDePolillas cantidadDeHuevosDePolly'!

!HabitatDeAvispas class methodsFor: 'HabitantesYFuturo' stamp: 'nrm 4/22/2022 16:35:16'!
cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella
	^cantidadDeHuevosOrianaYOrnella.! !

!HabitatDeAvispas class methodsFor: 'HabitantesYFuturo' stamp: 'nrm 4/22/2022 16:42:18'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^cantidadDeHuevosDePolly! !

!HabitatDeAvispas class methodsFor: 'HabitantesYFuturo' stamp: 'nrm 4/21/2022 20:01:04'!
cantidadDeHuevosDeAvispas
	^huevosDeAvispas.! !

!HabitatDeAvispas class methodsFor: 'HabitantesYFuturo' stamp: 'nrm 4/21/2022 20:16:25'!
reproduccionExitosa
       self consumirRecursos.
	huevosDeAvispas :=huevosDeAvispas + 1.! !

!HabitatDeAvispas class methodsFor: 'HabitantesYFuturo' stamp: 'nrm 4/22/2022 16:46:43'!
reproduccionExitosaDeOrianaYOrnella
       self consumirOruga.
	cantidadDeHuevosOrianaYOrnella :=cantidadDeHuevosOrianaYOrnella + 1.! !

!HabitatDeAvispas class methodsFor: 'HabitantesYFuturo' stamp: 'nrm 4/22/2022 16:46:12'!
reproduccionExitosaDePolly
	self consumirPolilla.
	cantidadDeHuevosDePolly := cantidadDeHuevosDePolly + 1.
	! !


!HabitatDeAvispas class methodsFor: 'reseteo' stamp: 'nrm 4/22/2022 16:44:28'!
elInicioDeLosTiempos
huevosDeAvispas:=0.
cantidadDeOrugas:=0.
cantidadDePolillas:=0.
cantidadDeHuevosDePolly :=0.
cantidadDeHuevosOrianaYOrnella :=0.! !


!HabitatDeAvispas class methodsFor: 'recursos' stamp: 'nrm 4/21/2022 20:11:59'!
cantidadDeOrugas
	^cantidadDeOrugas! !

!HabitatDeAvispas class methodsFor: 'recursos' stamp: 'mr 4/22/2022 16:13:27'!
cantidadDePolillas
	^cantidadDePolillas! !

!HabitatDeAvispas class methodsFor: 'recursos' stamp: 'mr 4/22/2022 16:15:06'!
chequeoDeOrugas
	^( cantidadDeOrugas > 0).! !

!HabitatDeAvispas class methodsFor: 'recursos' stamp: 'mr 4/22/2022 16:16:18'!
chequeoDePolillas
	^(cantidadDePolillas > 0).! !

!HabitatDeAvispas class methodsFor: 'recursos' stamp: 'mr 4/22/2022 16:20:49'!
consumirOruga
          cantidadDeOrugas := cantidadDeOrugas -1.! !

!HabitatDeAvispas class methodsFor: 'recursos' stamp: 'mr 4/22/2022 16:19:18'!
consumirPolilla
	cantidadDePolillas := cantidadDePolillas - 1.! !

!HabitatDeAvispas class methodsFor: 'recursos' stamp: 'nrm 4/21/2022 20:17:30'!
consumirRecursos
          cantidadDeOrugas := cantidadDeOrugas -1.! !

!HabitatDeAvispas class methodsFor: 'recursos' stamp: 'nrm 4/21/2022 20:09:55'!
nuevaOruga
	cantidadDeOrugas := cantidadDeOrugas + 1.! !

!HabitatDeAvispas class methodsFor: 'recursos' stamp: 'mr 4/22/2022 16:12:06'!
nuevaPolilla
	cantidadDePolillas := cantidadDePolillas + 1.! !


!HabitatDeAvispas class methodsFor: '--** private fileout/in **--' stamp: 'nrm 4/22/2022 16:49:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeHuevosOrianaYOrnella := 1.
	cantidadDeOrugas := 0.
	huevosDeAvispas := 0.
	cantidadDePolillas := 1.
	cantidadDeHuevosDePolly := 0.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejas'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejas'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejas'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:52'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'nrm 4/22/2022 16:47:25'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^HabitatDeAvispas cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'nrm 4/22/2022 16:48:34'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^HabitatDeAvispas  cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'nrm 4/22/2022 16:41:40'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^HabitatDeAvispas cantidadDeHuevosConLaFirmaGeneticaDePolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'nrm 4/21/2022 19:45:57'!
habitat
	^HabitatDeAvispas! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'mr 4/22/2022 16:21:53'!
hacerQueElHabitatTengaLosRecursosSuficientes
	HabitatDeAvispas nuevaOruga.
	HabitatDeAvispas nuevaPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:28'!
laAvispaLara
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'nrm 4/21/2022 20:31:31'!
laAvispaOriana
	^avispasComeOrugas! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'mr 4/22/2022 16:03:26'!
laAvispaOrnella
	^avispasComeOrugas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'mr 4/22/2022 16:07:20'!
laAvispaPolly
	^laAvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'nrm 4/21/2022 20:33:40'!
queElHabitatTengaDosOrugasMas
	HabitatDeAvispas nuevaOruga.
	HabitatDeAvispas nuevaOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'mr 4/22/2022 16:23:14'!
queElHabitatTengaDosPolillasMas
	HabitatDeAvispas nuevaPolilla.
	HabitatDeAvispas nuevaPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'nrm 4/21/2022 20:08:21'!
queElHabitatTengaUnaOrugaMas
	HabitatDeAvispas nuevaOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'mr 4/22/2022 16:11:23'!
queElHabitatTengaUnaPolillaMas
	HabitatDeAvispas nuevaPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'nrm 4/21/2022 19:52:30'!
retrocederElHabitatAlInicioDeLosTiempos
	HabitatDeAvispas elInicioDeLosTiempos! !


!classDefinition: #avispasComeOrugas category: 'AvispasYAbejas'!
DenotativeObject subclass: #avispasComeOrugas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejas'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'avispasComeOrugas class' category: 'AvispasYAbejas'!
avispasComeOrugas class
	instanceVariableNames: ''!

!avispasComeOrugas class methodsFor: 'as yet unclassified' stamp: 'mr 4/22/2022 16:20:07'!
intentarReproducirse
	HabitatDeAvispas chequeoDeOrugas ifTrue: [ HabitatDeAvispas reproduccionExitosaDeOrianaYOrnella ].! !


!classDefinition: #laAvispaPolly category: 'AvispasYAbejas'!
DenotativeObject subclass: #laAvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejas'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'laAvispaPolly class' category: 'AvispasYAbejas'!
laAvispaPolly class
	instanceVariableNames: ''!

!laAvispaPolly class methodsFor: 'reproduccion' stamp: 'mr 4/22/2022 16:17:17'!
intentarReproducirse
	HabitatDeAvispas chequeoDePolillas ifTrue: [ HabitatDeAvispas reproduccionExitosaDePolly ].! !

HabitatDeAvispas initializeAfterFileIn!