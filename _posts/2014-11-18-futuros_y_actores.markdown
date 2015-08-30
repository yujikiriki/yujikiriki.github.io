---
layout: post
title: Futuros y actores en Scala y Akka
author: Miguel Vila, Yuji Kiriki
author_url: https://s3.amazonaws.com/bitacora/me.html
---

Tradicionalmente, construir aplicaciones que soporten concurrencia en la JVM siempre ha sido problema del servidor de aplicaciones. Pocas veces nos veíamos en la tarea de implementar o de pensar en problemas de semáforos, hilos y procesos y, cuando teníamos que hacerlo, es porque el servidor de aplicaciones no daba más.

El número de usuarios y de aplicaciones integradas de hoy nos ha llevado a buscar alternativas ligeras y más adecuadas para soportar crecimientos súbitos en la demanda de recursos, de conexiones y de la disponibilidad misma de las aplicaciones; permitiendo dar respuestas correctas en un tiempo tolerable.

Los Futuros en Scala (implementados [en](http://docs.scala-lang.org/overviews/core/futures.html) [varias](https://github.com/scalaz/scalaz) [librerías](https://twitter.github.io/finagle/)) y el modelo de actores en Akka, permiten modelar e implementar soluciones que aprovechan las características del hardware moderno: múltiples núcleos de procesamiento, centenas de miles de megas de memoria; redundando en la capacidad de soportar concurrencia aumentando su disponibilidad y comportamiento correcto.

Los beneficios no solo se miden a través del desempeño de una solución. El nivel de abstracción en el que se razona sobre Futuros o actores permite diseñar y escribir código concurrente y paralelo, de fácil lectura, que atiende la concurrencia de manera elegante y digerible.

Por estos hechos y razones, consideramos compartir una análisis a través de la cual puedan hacer la elección de la herramienta más adecuada para sus escenarios donde se presente concurrencia, proponiendo y promoviendo así el "fin de vida" de lo servidores de aplicaciones.

### Cuándo Actores

La mayor ventaja del modelo de actores sobre los futuros es su capacidad de mantener estado y protegerlo de la concurrencia. Si a esta propiedad se le suma su similitud con la noción de objetos del paradigma orientado a objetos (OO), las soluciones que se pueden implementar son simples y potentes.

Lo simple nace del fomento de la [simpatía semántica](https://s3.amazonaws.com/bitacora/2013/04/13/simpatia_semantica.html) al combinar el modelo de actores con los principios del diseño OO. Esta combinación puede entenderse como un [mutualismo](http://en.wikipedia.org/wiki/Mutualism_(biology)) donde, en la solución de software, el modelo de actores se ve fortalecido por OO y OO se ve enriquecido por el modelo de actores.

El mutualismo se fundamenta en la noción de estado de los actores y de los objetos. Al ser dos ideas análogas, se pueden aplicar los principios de OO en el diseño de los actores, siendo cada uno de ellos interpretados como objetos que protegen su encapsulamiento a través del intercambio de mensajes. 

En una [entrevista](http://www.drdobbs.com/architecture-and-design/interview-with-alan-kay/240003442?pgno=3), Alan Kay (para algunos el fundador del paradigma objetual), admite esta relación:

> **Binstock:** How do you view the Actor model?

> **Kay:** The first Smalltalk was presented at MIT, and Carl Hewitt and his folks, a few months later, wrote the first Actor paper. The difference between the two systems is that the Actor model retained more of what I thought were the good features of the object idea, whereas at PARC, we used Smalltalk to invent personal computing. It was actually a practical programming language as well as being interesting theoretically. I don't think there were too many practical systems done in Actors back then.

Cabe notar que OO es un paradigma de programación mientras que los actores son un modelo de computación. No obstante, la noción de estado sirve como articulador entre ellas.

Ahondando en esta relación por el lado OO, podemos hacer uso de las prácticas de _Domain-Driven Design_. Los patrones tácticos son fácilmente implementados en el modelo de actores permitiendo tener grafos de actores que modelan dominios de negocio. No solo ahí se fomenta el mutualismo. Si hacemos uso de los actores como [modelo de concurrencia para sistemas distribuidos](http://dspace.mit.edu/handle/1721.1/6952), podemos escribir aplicaciones de software que implementan modelos de dominio listos para soportar concurrencia y para ser distribuidos en una red. Quizás, esta última, sea la característica de más potencial de los actores sobre los futuros.

Otra ventaja de los actores sobre los futuros es la capacidad de distribuir trabajo sobre un sistema distribuido. A través de sus principios, el modelo de actores permite distribuir no solo concurrencia sino carga en varios nodos, permitiendo la presencia de procesamiento paralelo. No obstante, hay investigación de cómo tener funciones distribuidas.

Es necesario recordar que el modelo de actores no es un artefacto de la programación funcional. Sin embrago desde el punto de vista de la programación funcional, los actores adolecen de:

* No determinismo: no hay garantía en la entrega de mensajes entre actores.
* Implican side effects y tener una visión no local del sistema, lo que implica que no se puedan componer. 
* Los actores en Akka rechazan la unidad básica de modularidad: las funciones con efectos ```A => B``` por funciones con _side effects_ ```Any => Unit```.

### Cuándo Futuros

Los futuros son una abstracción que sirve para representar acciones asíncronas. Pueden ser vistos como un mecanismo para manejar asincronía [un nivel de abstracción por encima de usar _callbacks_](https://blog.jcoglan.com/2013/03/30/callbacks-are-imperative-promises-are-functional-nodes-biggest-missed-opportunity/). Citando a [Marius Eriksen](http://aboutwhichmorelater.tumblr.com/post/46862769549/futures-arent-ersatz-threads):

> Futures model the real world truthfully: A Future[T] represents a T-typed result, which may or may not be delivered at some time in the future, or which may fail altogether. Like real-world asynchronous operations, a future is always in one of 3 states: incomplete, completed successfully, or completed with a failure.

Existen diversas implementaciones de futuros en Scala: en la [librería estándar](http://www.scala-lang.org/api/2.11.4/#scala.concurrent.Future), y en librerias como akka, finagle y scalaz. Para efectos de esta entrada lo importante es que estas instancias implementan:

* Un constructor, que permite ejecutar asíncronamente un bloque de código y envolver su resultado en un futuro. 
* Las funciones map y flatMap que permiten manipular y componer futuros.

Los futuros presentan varias ventajas:

* Se pueden componer naturalmente. El API que se deriva de tener las funciones ```map``` y ```flatMap``` es bastante rico y permite secuenciar acciones asíncronas casi de la misma forma en la que uno maneja valores en un contexto síncrono (Esto claramente no es tan simple como suena: requiere un buen entendimiento del API de Futuros). La posiblidad de componer fácilmente Futuros parece ser la razón por la cuál Twitter se decantó por ellos y por eso construyó gran parte de su infraestructura en torno a [la idea de componer comportamiento a partir de funciones](http://monkey.org/~marius/funsrv.pdf). En contraste parece que [por ahora el equipo de ingeniería de Twitter no piensa usar actores](http://www.reddit.com/r/IAmA/comments/23s80n/we_work_on_open_source_at_twitter_ask_us_anything/ch03le5).

* Solo requieren una visión local del sistema: Teniendo un ```Future[A]``` solamente puedo crear un nuevo valor con una función ```A => B``` o una función ```A => Future[B]```. En cambio los actores requieren razonar como interactúa un sistema de actores, qué mensajes se le debe mandar a otro actor, qué mensajes debe manejar otro actor, etc. La modularidad de un actor depende en gran parte de un conocimiento implícito de como responde a ciertos mensajes. [Hay quienes piensan que la modularidad de una abstracción depende de que tanto permite](http://pchiusano.blogspot.com/2010/01/actors-are-not-good-concurrency-model.html) usar [funciones puras](http://en.wikipedia.org/wiki/Pure_function). Para ellos los _side effects_ perjudican la modularidad. La comunicación entre actores es un _side effect_ gigante y bajo esa perspectiva no son muy modulares. En cambio los futuros permiten usar funciones puras en sus transformaciones y por lo tanto permiten que sean reutilizados en contextos que no requieren un conocimiento implícito de la implementación. 

* En general los futuros están en consonancia con muchas  de las ideas de programación funcional. Empezando por el hecho de que exigen contener algún valor uno siempre se ve obligado a manejar transformaciones de ese valor sea con ```map``` o ```flatMap```. Esto no quiere decir que uno no pueda hacer futuros con _side effects_. Uno perfectamente puede crear un ```Future[Unit]```, es decir un ```Future``` sin valor dentro, por ejemplo: producto de haber imprimido en pantalla un resultado asíncrono. Entonces, si bien los Futuros no evitan que uno rompa las "reglas" de programación funcional, sí son un mecanismo de concurrencia que, a diferencia de los actores, permiten razonar sobre la transformación de un valor a partir de funciones puras. Adicionalmente los Futuros son inmutables en dos sentidos: por una parte cuando un Futuro se resuelve su valor no puede cambiar, lo que da pie a que una composición de futuros determine un grafo de ejecución y de transformación de valores. Por otra parte la mayoría del API de los Futuros no muta el estado sino que devuelve otro Futuro, lo que facilita razonar sobre ellos. En gran parte estas facilidades se dan por que los Futuros son [monadas](http://www.codecommit.com/blog/ruby/monads-are-not-metaphors).

* Otra ventaja, un poco relacionada con el anterior punto, es que los Futuros son declarativos. Permiten al usuario combinarlos sin que éste se preocupe de varias cosas: de qué estrategia usa el _pool de threads_ que lo está ejecutando o en qué momento se ejecuta la función que se pasa por parámetro, o como combinar múltiples Futuros sin importar cuál se resuelva primero, etc... En cambio los actores requieren un mayor grado de coordinación y por lo tanto dan mayor responsabilidad (y también libertad) al usuario.

Por último los futuros tienen una desventaja considerable, que tiene que ver con los casos de uso para los cuales fueron ideados. Los futuros no son adecuados para manejar estado: por ejemplo tener estado mutable que puede ser modificado por dos futuros distintos es una receta para hacer un desastre. En general este es un corolario del consabido consejo de no compartir recursos entre _threads_ distintos. Por lo tanto es difícil utilizar futuros para modelar aspectos del dominio, aspectos que por lo general requieren algún tipo de estado. En conclusión los futuros sirven para manejar concurrencia y paralelismo de funciones que carecen de estado dentro de una misma JVM. Cuando se quiere realizar distribución entre distintas maquinas o concurrencia protegiendo estado los actores representan una abstracción adecuada. 

### Conclusión

Los Actores y los Futuros son dos abstracciones útiles que permiten manejar concurrencia. El uso de uno no excluye automáticamente el uso del otro. Por el contrario, usualmente son colaborativos: e.g. un Actor puede despachar trabajo a un Futuro. 

En esta entrada analizamos las ventajas de cada uno y sus mejores casos de uso, pero cabe aclarar que el mundo de Scala es prolífico en abstracciones y hay muchas alternativas que pueden ser más adecuadas para ciertos casos de uso. Hay muchas que no mencionamos como [Iteratees](https://www.playframework.com/documentation/2.0/Iteratees), [scalaz-streams](https://github.com/scalaz/scalaz-stream) y la iniciativa de [Reactive Streams](http://www.reactive-streams.org/). 

El mundo de Scala y la JVM es rico, los actores y los Futuros son solo las primeras abstracciones que tenemos para explorar.

### Referencias

* [Your server as a function](http://monkey.org/~marius/funsrv.pdf)
* [Erlang Style Actors Are All About Shared State](http://james-iry.blogspot.com/2009/04/erlang-style-actors-are-all-about.html)
* [The Actor Model (everything you wanted to know, but were afraid to ask)](http://channel9.msdn.com/Shows/Going+Deep/Hewitt-Meijer-and-Szyperski-The-Actor-Model-everything-you-wanted-to-know-but-were-afraid-to-ask)
* [Actors are not a good concurrency model](http://pchiusano.blogspot.com/2010/01/actors-are-not-good-concurrency-model.html)
* [Don't use Actors for concurrency](http://www.chrisstucchio.com/blog/2013/actors_vs_futures.html)
* [Why I Don't Like Akka Actors](http://noelwelsh.com/programming/2013/03/04/why-i-dont-like-akka-actors/)
* [Actors, Green Threads and CSP On The JVM – No, You Can’t Have A Pony](http://boundary.com/blog/2014/09/03/no-you-cant-have-a-pony/)
* [Futures aren’t ersatz threads](http://aboutwhichmorelater.tumblr.com/post/46862769549/futures-arent-ersatz-threads)

