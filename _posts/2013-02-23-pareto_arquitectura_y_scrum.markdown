---
layout: post
title: Arquitectura, DDD y Scrum.
author: Yuji Kiriki
author_url: http://yujikiriki.com/me.html
---

Después de haber experimentado el curso de certificación en Scrum developer (CSD) quedé con una duda: dónde meter los ejercicios de arquitectura de software para los proyectos de mis clientes.

Pido que no me malinterpreten, considero que Scrum como metodología de construcción de software es madura, honesta, acertada y efectiva a la hora de construir software. En este momento me es difícil imaginar otra manera de ejecutar proyectos de software.

Sin embargo, estoy acostumbrado a realizar ciclos completos de [Architecture Tradeoff Analysis Method](http://www.sei.cmu.edu/architecture/tools/evaluate/atam.cfm) (ATAM) o [Software Architecture Analysis Method](http://www.sei.cmu.edu/library/abstracts/whitepapers/icse16.cfm) (SAAM) combinándolos con [Attribute-Driven Design Method](http://www.sei.cmu.edu/architecture/tools/define/add.cfm) (ADD) para llegar a definiciones arquitectónicas adecuadas para los retos que tienen las empresas en sus aplicaciones estratégicas. 

Cuando pongo sobre la mesa Scrum y ADD la cosa se complica, más aún si, como algunos sabrán, soy fiel creyente de los buenos resultados de hacer DDD cuando tengo que enfrentarme a un dominio complejo.

Afirmo que se complica porque, según aprendí, la forma adecuada de diseñar en las metodologías ágiles es vía TDD. Como desarrolladores tenemos que ir descubriendo el diseño de nuestra aplicación a través de la implementación de pruebas unitarias, siguiendo juiciosamente el ciclo _Red/Green/Refactor_.

### Diseño != Arquitectura

Para que mi lector entienda hacia dónde voy, es fundamental entender que  diseñar es distinto a arquitectar. 

Arquitectura de software es la colección de decisiones fundamentales sobre una solución de software que buscan cumplir o alcanzar los atributos de calidad esperados por los _stakeholders_.

Diseño de software es el ejercicio de modelar una abstracción del mundo real en término de objetos y sus relaciones. Siendo estrictos, en esta entrada sólo me interesa el diseño de software orientado a objetos.

Con estas definiciones podemos dejar a un lado la presunción de que a través de TDD se busca o pretende arquitectar.

### ¿Me olvido de arquitectar?

Obviamente no. Como decía el instructor del curso, Scrum sólo es un marco de trabajo para construir y entregar software. La etapa de arquitectura entonces, deberá ser previa a la ejecución misma del primer Sprint del proyecto que tenga como objetivo realizar el primer _Review_ del producto de software, sin caer, evidentemente, en un [_Big Design Up Front_](http://en.wikipedia.org/wiki/Big_Design_Up_Front) (BDUF).

Los ejercicios de ATAM, SAAM o ADD están orientados a arquitectar, así que no existe forma de estar haciendo BDUF, precisamente por la "D" de _Design_.

### Las coincidencias de DDD y Scrum

Como mencioné, soy fiel creyente de DDD por los positivos resultados que he obtenido al enfrentarme a dominios de negocio complejos. Como también dije, me encanta Scrum. Curiosamente he descubierto varios puntos de coincidencia entre ambas que presento y aclaro a continuación.

Cuando un equipo tiene en sus manos un preciso _Lenguaje Ubicuo_ acompañado por diagramas de _Modelos de Dominio_ y diagramas de _Contextos Delimitados_, se obtiene gran poder y capacidad de entender. No solo eso, el código resultado de un buen diseño con DDD representa exactamente el problema, logrando veracidad, exactitud y transparencia entre la abstracción del mundo real y el código fuente de la aplicación de software.

DDD propone realizar _Diseño Estratégico_, el cual habla de los _Contextos Delimitados_ y cómo lograr encontrarlos, definirlos y respetarlos buscando construir subdominios cohesivos fácilmente mantenibles.

Todas las actividades que DDD propone parecieran entonces BDUF, pues estos artefactos se construyen previo a la implementación misma del producto de software. Lo curioso es que para llegar a buenos artefactos DDD, se requiere tener muy cerca a lo que en DDD se denomina, el _Experto de Negocio_. Si lo pasamos al _Lenguaje Ubicuo_ de Scrum, las responsabilidades que tiene este experto de negocio de DDD no son más que un subconjunto de las responsabilidades del _Product Owner_ (P.O).

Por ejemplo, para que un P.O pueda realizar una adecuada priorización del _Product Backlog_ y para poder saber qué historias de usuario son las de mayor valor para el negocio, éste debe conocer muy bien el dominio de negocio. Para DDD un _Experto de Negocio_ no es más que eso, la persona de la cual se realizará la _destilación_ de conocimiento para llegar a una buena definición del _Modelo de Dominio_.

Con base en la anterior coincidencia y entendiendo el poder comunicativo del _Lenguaje Ubicuo_, puedo aseverar que la mejor manera de escribir las historias de usuario es en términos del mismo, siendo este un artefacto meramente DDD.

Adicionalmente, que todo nuestro equipo (incluyendo el P.O) conozca y entienda nuestro _Modelo de Dominio_ es sin lugar a dudas un habilitador y un claro _radiador de información_ para la metodología Scrum, el cual, en palabras de Evans, debe ir evolucionando conforme la aplicación va cambiando, algo que debe realizarse de manera muy iterativa.

De esta manera afirmo que DDD no pretende que el _Modelo de Dominio_ se defina en una sola sentada de varias semanas. DDD pretende que nosotros como desarrolladores evolucionemos el _Modelo de Dominio_ y el _Lenguaje Ubicuo_ a medida que _destilamos_ conocimiento de nuestro P.O.

Considero que no hay mejor momento para _destilar_ conocimiento de dominio que en la etapa de definición de las historias de usuario que definirán el _Product Backlog_ y, poco a poco, irlos perfeccionando cuando el equipo tenga la necesidad de hacerlo, finalmente el P.O / _Experto de negocio_ debe estar allí para ellos.

Por otro lado, el resultado del _Diseño Estratégico_ no puede catalogarse como un artefacto de diseño sino de arquitectura pues su adecuada definición está orientada a facilitar y fomentar atributos de calidad tales como evolutividad, mantenibilidad y facilidad de integración.

### TDD y el Modelo de Dominio

La capacidad de ir descubriendo el diseño de un componente a medida que se  construyen pruebas unitarias es una poderosa promesa de TDD. Sin embargo, considero que partiendo de un _Modelo de Dominio_ se logra un pareto de diseño muy interesante que explico a continuación.

El _Modelo de Dominio_ representa el 20% de profundidad de un diseño detallado tradicional, pues este no contiene ni definición de métodos, contratos o atributos de las entidades. No obstante, ese 20% de profundidad es suficiente para influenciar el 80% de las decisiones de diseño que se pueden tomar como resultado de hacer TDD juiciosamente (por ejemplo, los patrones tácticos de DDD). Tengo que admitir que los anteriores porcentajes son sacados, literalmente de la manga, pero al usarlos como metáfora me permiten explicar mi punto.

Con este acercamiento, podemos combinar lo mejor del mundo de DDD con lo mejor de TDD.

### Conclusión

Con esta entrada pretendía ubicar los ejercicios de arquitectura en un proyecto ejecutado con Scrum. Igualmente buscaba exponer los efectos multiplicadores de combinar DDD y Scrum a través de sus claras coincidencias. Espero haber logrado mi objetivo.

¿Qué opinan?
