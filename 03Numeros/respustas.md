# Respuestas

## Aporte de los mensajes de DD

En un Double Dispatch, le enviamos un mensaje a un objeto en el cual enviamos un parámetro y luego dentro de ese objeto le mandamos al parámetro un mensaje con el objeto como parámetro. Esto nos permite trabajar sabiendo qué tipos de datos son los que tenemos que usar para nuestro método.

## Lógica de instanciado

Nos parece mejor tener la lógica de cómo instanciar un objeto en la misma clase del objeto, porque de esta forma no rompemos el encapsulamiento. Más allá de que se puedan crear objetos desde distintos lugares o de distintas formas, siempre van a llamar al método original de instanciación. 

## Nombres de las categorías de métodos

Para categorizar métodos estamos usando el criterio de nombrar las categorías por el rol que cumplen, en este caso a los métodos que implementamos los categorizamos en <arithmetic operations - private> ya que son métodos internos del objeto que no deberían ser usados por un externo.
  
## Subclass Responsibility

Sirve para indicar qué mensajes debería responder cualquier subclase de esa clase. Por ejemplo, en este ejercicio si se quisiera agregar la subclase <Complejo> ésta debería poder responder a los mensajes de su superclase. Además, sirve para indicar que la superclase es una clase abstracta.

## No rompas

Uno de los problemas trae, es que cada vez que se quiera modificar un objeto, si éste se ha usado rompiendo el encapsulamiento, cada vez que lo querramos volver a modificar vamos a tener que ir a cada una de los lugares en donde rompimos el encapsulamiento. Cosa que se podria evitar si mantuviéramos una buena heurística de diseño.
