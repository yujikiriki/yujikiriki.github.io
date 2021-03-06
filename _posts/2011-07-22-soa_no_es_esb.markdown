---
layout: post
title: SOA != ESB
author: Yuji Kiriki
author_url: https://twitter.com/ykiriki
---
¿Qué opinan?

>Un bus de servicios empresariales es la columna vertebral de una arquitectura SOA, ya que es la aplicación encargada de administrar los servicios disponibles a través de las diferentes aplicaciones que hacen parte del ecosistema de la...

Cuando leí esta perla revisando esta [licitación](https://www.contratos.gov.co/archivospuc1/2011/DA/103002002/11-15-461398/DA_PROCESO_11-15-461398_103002002_2372832.pdf) no sabía si llorar, golpearme, reírme o hacerme el que nunca la había leído. ¿Columna vertical de qué? ¿Que administra qué? ¿Ecosistema de qué? Puro cuento de "Consultor de Preventa".

Lo que sí sabía era que tenía que escribir para desahogar esta sensación de impotencia y que mejor lugar que la bitácora.

### SOA y las cajas negras

No hay un tema más trillado que SOA. Lo curioso es que en Colombia seguimos tratando de meterle estupideces a ese estilo arquitectónico tan simple. "¡Se le tiene, se le tiene! Que el ESB, que el UDDI, que el BPM, que el gobierno de servicios!". Le metemos cuanta caja negra el "Consultor de Preventa" nos meta por los ojos a punta de tiquetes a Las Vegas, EEUU.

<img style="float:left" src="../../../imgs/combo.jpg"/>

No estoy en contra de las cajas negras. Solo quiero aclarar que si usted quiere orientar sus aplicaciones a servicios, lo que menos necesita son cajas negras. No necesita el triplecombo *BPM-ESB-UDDI* que si lo pide agrandado le enciman un BAM. Lo que usted necesita es respetar los principios sobre los que se fundamenta este estilo. Luego, con el tiempo y si así se evidencia, usted podrá ir adquiriendo las cajas negras que requiera. Todas menos el ESB y su hermano siamés de cráneo el UDDI.

### ¿Por qué?

Hace unos años, fui de los desocupados que me leí el libro ["Enterprise Service Bus: Theory in Practice"](http://goo.gl/tIJTG) de David Chappell. Cuando lo terminé no podía imaginar una aplicación orientada a servicios sin un ESB. A cualquier problema de integración, ¡pues qué más apropiado que un ESB! Podía tener un ESB perimetral para integraciones con sistemas externos, un ESB interno para la integración entre aplicaciones legadas y nuevas, otro ESB federado para las sucursales de la empresa, ¡Dios, eran épocas gloriosas! ¡Todos podemos hacer SOA! ¡Y tal como lo dijo el Consultor de Preventa no necesitamos DBA!

Luego la industria y las empresas que lo habían adoptado vieron cómo, poco a poco, estas versátiles estructuras iban creciendo, engordándose y volviéndose cada día más pesadas, más densas, más grasosas. Poco a poco empezamos a tenerle asco a meterle la mano a esas mediaciones inmantenibles de tres kilómetros llenas de invocaciones a servicios SOAP, de reglas de negocio y validaciones. Vimos cómo empezamos a tener problemas en determinar que debía ir en una mediación del ESB y qué en la capa de lógica de negocio. Y del asco pasamos al miedo y la paranoia. Ahí fue cuando nos estrellamos, SOA empezó a desinflarse, lo mataron mil veces y quedamos enterrados en el valle de las desilusiones.

Afortunadamente como con todo (próximamente también con cloud computing), después de la tormenta viene la calma. Las expectativas que tenían las empresas sobre SOA se ajustan a la realidad y nuestro medio se empezó a cuestionar ¿qué es realmente SOA? ¿Es SOAP web services? ¿Es ESBs y UDDIs?

Al respondernos nos dimos cuenta que el patrón de integración ESB escondía todas las porquerías de la divergencia en la semántica de los datos de la empresa. Nos dimos cuenta que no podíamos continuar escondiendo las falencias de gobierno de servicios en un UDDI. Nos dimos cuenta que SOA no era lo que nos vendieron. Nos dimos cuenta que para hacer servicios no necesitábamos más que disciplina y sentido común, no una caja negra de pandora que cuando la abriéramos dejaríamos salir todas las vergüenzas que producen las malas decisiones.

### ¿Y entonces qué?
Una arquitectura orientada a servicios se trata de eso: servicios. No cajas negras. SOA se fundamenta en la correcta definición y exposición de servicios que promueven el encapsulamiento de capacidades de negocio y la reutilización (y por derecha la interoperabilidad). No más no menos. El ESB se definió para integrar aplicaciones con tecnologías o datos disimiles y como ya expliqué es solo un patrón entre decenas de patrones más que pueden utilizarse para realizar esa misma tarea. Si leen entre líneas, les estoy afirmando _en su carita_ que SOA nunca habló de integración. Jamás. Y mucho menos que un patrón de integración fuera su columna vertebral.

### Nuestro problema era integración

¡Exactamente! No sé porqué le echaron la culpa a SOA de los proyectos fracasados si los problemas que buscaban resolver con el estilo eran de integración. Y por eso es que hay "Firmas De Consultoría", "Expertas en SOA", que construyen el tipo de licitaciones mediocres, irresponsables y risibles que inspiraron esta entrada a la bitácora.

Afortunadamente para el problema de la integración de aplicaciones hay muchísimas alternativas pues el problema no es nuevo. De hecho Hohpe y Woolf escribieron hace más de 8 años un [libro](http://goo.gl/ABfJ3) que solo habla de eso, de cómo integrar aplicaciones.

En cualquier caso en la siguiente sección les dejo luces de cómo pueden pasar de pensar "SOA sobre ESB como columna vertebral" (jajajaja no puedo evitar reírme mucho cada vez que leo eso) y las maneras _enterprisey_ de hacer integración a nivel organizacional.

### Alternativas para el ESB

En casi todos los escenarios para poder exponer servicios se necesita integrar servicios de otras aplicaciones o de aplicaciones de otras empresas. El ESB se creyó adecuado pues, según los vendedores de tecnología podían cumplir 4 responsabilidades: enrutamiento de mensajes, traducción de mensajes, transformación de protocolos y garantía en la calidad del servicio (a veces interpretada como la garantía de las transacciones distribuidas).

Por esta razón les presento tres alternativas evaluadas desde esos tres puntos de vista.

#### HTTP Proxy
HTTP es una tecnología para sistemas basados en red muy exitosa y la mayor evidencia de ello es Internet. Un proxy HTTP es un mecanismo tan sencillo que hasta los profesores de mi universidad entienden qué es y cómo funciona.

En el caso de esta alternativa, la única responsabilidad que actualmente tiene un ESB y que cubre el proxy es el enrutamiento, asumiendo que se van a estandarizar toda comunicación de aplicaciones sobre HTTP. La demás responsabilidades del ESB (traducción, transformación y QoS) se delegan en los puntos de integración.

Cada punto de integración será responsable de asumir toda la complejidad de entender y realizar peticiones sobre HTTP, bien sea utilizando servicios web SOAP, servicios web REST o RPC-POX o tramas o lo que quieran.

Esta opción es la más radical y ligera, pero es muy exitosa en organizaciones pequeñas y medianas y con pocas o ninguna aplicación legada. Reemplaza de golpe una responsabilidad del ESB y se olvida de tener un UDDI.

Un ejemplo de esta alternativa es utilizar el proxy HTTP Squid que es viejito pero muy sabroso.

#### Simple Message Bus
Esta es la opción más "robusta" empresarialmente hablando, pues se usa un Message-Oriented Middleware (MoM por sus siglas en inglés) con una capa envolvente que simplifica el uso de colas, tópicos y listeners de mensajes. Lo bonito de esta alternativa es que es posible garantizar entrega de mensajes entre aplicaciones y se puede realizar enrutamiento. Las demás responsabilidades (transformación y traducción de mensajes) se delegan a los nodos a integrar.

Tanto esta alternativa como la inmediatamente anterior dependen de la correcta definición de un lenguaje/vocabulario canónico que permita, a nivel del bus de mensajes, manejar conceptos únicos, forzando así que los nodos que se integran cumplan con este. De hecho tener un lenguaje/vocabulario canónico es la mejor práctica de integración posible; entendiendo que es muy difícil de lograr.

Esta alternativa debe ir acompañada de un framework que abstraiga los detalles del manejo de colas y tópicos del MoM y que facilite la implementación de los patrones de Hohpe como Apache Camel. Combinar ambas tecnologías permiten tener una solución muy ligera, de rápido desarrollo y que fomenta la estandarización en la comunicación entre las aplicaciones.

Un ejemplo de este enfoque es NServiceBus. Vale la pena leer qué hace y como lo hace. En Java lo mejor es utilizar un MoM como HornetQ que implementa NIO a través de Netty y de nuevo Apache Camel.

Se puede soñar un poco con esta alternativa y se puede pensar en estandarizar el protocolo a través del cual se envían y consumen mensajes logrando estandarizar todos los niveles de la integración. El protocolo ideal sería HTTP.

#### API REST

Es difícil separar esta opción de las anteriores. De hecho hace parte como de otra categoría o podría ser consecuencia de las dos anteriores. De todas maneras la propongo como la mejor opción para reemplazar un ESB en su totalidad.

La idea es crear un API de servicios RESTful por aplicación empresarial. Luego lo único que toca hacer es un utilizar los API de servicios desde una u otra aplicación.

Si lo piensan un poco se darán cuenta que las dos alternativas anteriores podrían ser los cómo de esta alternativa. De todas maneras lo dejo como una alternativa más.

### Conclusión

Las empresas que venden tecnologías empaquetadas abusan de las buenas ideas. Las violentan, mienten y les ponen palabras en la boca y eso solo le ha traído problemas a la industria y a los clientes. Y lo más triste es que lo han hecho toda su vida.

Cada vez que sale una nueva idea estos señores las acaban: ha pasado con SOA, ha pasado con la bases de datos orientadas a objetos, ha pasado con Web 2.0, ha pasado con BPM, ha pasado con los BAM, ha pasado con los portales y está pasando con computación en nube en todas sus presentaciones. Por favor, no se dejen engañar ¡usen su sentido común! Eso es lo único que los protegerá siempre.

Por otro lado duele el país al ver que las licitaciones del gobierno las construyen empresas irresponsables y Consultores que creen que al usar palabras sofisticadas, pomposas y rebuscadas pueden engañarnos a todos. Puede que a los honorables funcionarios públicos sí, pero aún somos muchos los que estamos en la disidencia luchando por la honestidad.

Y finalmente, todo bien, no vuelvan a decir que hacer SOA es tener un ESB.

