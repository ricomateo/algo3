# Respuestas ejercicio 01

## Sobre implementar funcionalidad

Al implementar las funcionalidades de los tests 01, 02 y 03, estos no pasaron a la primera, sino que tuvimos que hacer modificaciones para pasar cada prueba. Por ejemplo, para la prueba 01 declaramos un colaborador interno al que le asignamos el valor 0 y como no se modificaba siempre devolvía 0. Luego para el test 02 agregamos la funcionalidad ```reproduccionExitosa``` (sumaba huevos y consumía recursos). Nos parece que implementar una funcionalidad de esta manera facilita a la hora de programar el trabajo que se debe hacer ya que cada test implica dar un pequeño paso, y de esta forma se obtiene un feedback inmediato.

## Sobre código repetido

A nuestro juicio, no nos quedó código repetido. En nuestro modelo el hábitat es el responsable de ver si hay suficientes polillas u orugas y dejar un huevo, porque si no los diferentes objetos que representan los diferentes tipos de avispas deberían conocer múltiples métodos y colaboradores del hábitat. Tendría sentido que fuera de la otra forma porque es una representación más fiel a la realidad (la avispa es quien busca la comida y pone los huevos). Consideramos que la forma que usamos es mejor debido que preserva el encapsulamiento (por ejemplo, al reproducirse laAvispaPolly ésta no accede al colaborador interno de HabitatDeAvispas para saber si hay polillas, sino que le envía el mensaje hayPolillas y el HabitatDeAvispas es quien accede a cantidadDePolillas y luego le responde true o false).

## Sobre código repetido 2

Para guardar los huevos, creamos un colaborador para cada tipo de huevo (cantidadDeHuevosDePolly, etc..) y uno para la cantidad de huevos totales (cantidadDeHuevosDeAvispas). De esta forma no usamos ni diccionarios ni colecciones ya que buscábamos la solución más práctica a medida que avanzábamos a lo largo de los tests (como se nos mostró en la clase del jueves) por lo que nunca se nos llegó a plantear la opción de usar un diccionario o una colección. Creemos que fue lo más sencillo sin repetir código.
