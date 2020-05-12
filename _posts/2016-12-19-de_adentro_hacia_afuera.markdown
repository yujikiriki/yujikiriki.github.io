---
layout: post
title: De adentro hacia afuera
author: Yuji Kiriki
author_url: https://twitter.com/ykiriki
---

Las últimas semanas he tenido la oportunidad de participar activamente en la construcción de un producto estratégico para una [Fortune 500](http://beta.fortune.com/fortune500/) (F500). En esta entrada trato de dejar por escrito algunas ideas y hallazgos que pueden ser valiosas para alguien más.

## 1. Ecosistema
Una de las primeras cosas que evidencié fue el cambio de _liga_. En Colombia, el cambio de tecnologías y de método ha sido un camino poco agradable de transitar.

Culturas organizacionales basadas en el miedo han obstaculizado la capacidad de equivocarse y aprender en las empresas colombianas. Cada vez que hablo con un arquitecto "inquieto" lo primero que me dice es: "Es que Yuji, recuerde que esta empresa es muy grande, nosotros no podemos darnos el lujo de improvisar y equivocarnos".

Nadie quiere arriesgarse porque lo echan.

Es comprensible pero, al compararlo con este nuevo cliente, lo más evidente es que precisamente la inexistencia de la "Administración Orientada al Miedo" es lo que les ha permitido a estas empresas ser lo que son. Y, curiosamente, estas F500 pueden ser hasta 10 veces más grandes que la empresa más grande de Colombia.

Es interesante entonces saber que estas empresas son una apuesta continua a la innovación y a la creación. No a tener miedo porque de pronto mañana les quitan el pan de la boca.

### OSS
Esta orientación les facilita la toma de decisiones y la introducción de nuevas ideas. Por ejemplo, si a alguien se le ocurre construir una plataforma tecnológica, lo que quieren es usar sólo [OSS](https://en.wikipedia.org/wiki/Open-source_software), pues amarrarse a una tecnología propietaria les parece un riesgo. ¿Por qué un riesgo? Porque quedan 100% dependientes de un proveedor y no de una comunidad así que, a pesar de ser empresas del sector turístico, saben que deben volverse empresas de tecnología ([Disney](https://github.com/disney), por ejemplo).

### Gestión de proyectos
Otro ejemplo está en la gestión de proyectos. En Colombia las empresas y los gerentes de proyectos están empecinados en usar la frase "es que la junta nos está pidiendo una fecha". No les están pidiendo un resultado. No les están pidiendo alcanzar un indicador de éxito medible con **datos reales** con el producto en producción. Solo les interesa una fecha, lo que quizás, he llegado a pensar, les facilita "gestionar"; que al final del día se convierte en presionar al que toque.

Pareciera que esta noción de toma de decisiones basada en datos y no fechas de entrega de esta F500, le ha permitido enfocarse en lo fundamental: **crear valor**. No en cumplir un cronograma para que no los echen y demostrar "un resultado", culpando a otro si hay problemas.

### Una hipótesis
Estas empresas que fomentan la toma de riesgos crecen desmesuradamente. En la medida que toman riesgos, aprenden que lo fundamental es la creación de valor y la toma de decisiones basada en datos. Esto las lleva a ser altamente valoradas durante prolongados espacios de tiempo que lleva a que sus modelos de negocio se sofistiquen de manera tal que la escala de los problemas que deben atender son de una altísima complejidad.

Esta alta complejidad requiere de proveedores y tecnologías a la altura de estas necesidades, lo que lleva a que el mercado de proveedores a su alrededor crezca y madure.

Al crecer y madurar el mercado, los desarrolladores de software encuentran mejores oportunidades si y solo si están a la altura de esas necesidades, creando así un saludable ecosistema en el que el desarrollador no se la pasa preguntándose por qué no le pagan mejor.

En Colombia, en este particular, estamos _un poco muy jodidos_, pues el incitador de esta lógica es empresas que se orientan a la generación de valor, no a la "Gestión del Miedo".

Hay otras entonces que crean elegantes _Vicepresidencias de Innovación_, las cuales a veces terminan comprando cajas de nombres _trendy_ y basadas en OSS y en otros casos, con ejércitos de _Homeópatas Ágiles_ recomendando que todos los desarrolladores deben estar haciendo TDD, "Clean Code" y Scrum de Scrums basadas en SAFe y Pods. Pero de creación de valor, _nanay cucas_.

## 2. Escala

Empresas F500 pueden tener decenas de tiendas en decenas de países (Walmart por poner un ejemplo). Solo imaginen la complejidad de ese problema. Son decenas de miles de tiendas, con manejo sofisticado de inventarios, distribución y venta. Campañas de mercadeo localizadas, impuestos particularizados por estado y por país. Sólo imaginen la complejidad de crear un sistema de puntos de lealtad para todas esas tiendas con reglas particulares por mercado/ubicación. Obvio, eso no va a correr sobre una base de datos Oracle. Pero vaya uno a decirle eso a un arquitecto gestionado con miedo, por obvias razones se asusta porque de pronto salirse de esa caja implica que lo van a echar; "es que no se puede porque somos muy grandes".

Esta realidad me ha llevado a pensar que la escala de problemas que debemos resolver en Colombia son tan triviales que quizás con esa forma de pensar nos da y nos sobra. Por ejemplo, un reconocido banco envió comunicados a sus clientes notificando la indisponibilidad de su plataforma tecnológica tres domingos seguidos. Una obra de ingeniería que muy seguramente no es, necesariamente, colombiana.

Esta realidad también me ha llevado a pensar que la falta de problemas de alta complejidad y la inexistencia de un ecosistema de empresas proveedoras maduras ha impedido que el contexto mismo en el que se da esta realidad pueda cambiar.

Todo esto me lleva a concluir que en la medida en la que sigamos resolviendo problemas con mentalidad de país pobre y, en algunos casos, con un capital humano gestionado con el confort de la mediocridad, nos impide crear empresas lo suficientemente grandes que ofrezcan problemas suficientemente complejos que de alguna manera fomenten la creación de un ecosistema sano de oferta de servicios de primer mundo.

Quizás sea por las restricciones en las que vivimos. Pero también a veces pienso que es una excusa en la que nos revolcamos para no quitarnos la pereza de encima y poder opinar de cualquier tema sin hacer realmente nada al respecto.

## 3. Arquitectura empresarial

Toda maestría en ingeniería de software que se respete en Colombia dicta una clase de Arquitectura Empresarial. Históricamente esto me ha parecido el esfuerzo académico más inútil de todos.

Al no tener problemas lo suficientemente complejos como para requerir esta disciplina, estos arquitectos empresariales se dedican entonces a estorbar _estratégicamente_ los proyectos que necesitan salir a producción con decisiones gaseosas y de poco valor.

En esta F500 tengo la oportunidad de trabajar de cerca con un equipo de arquitectura empresarial. Los problemas que pueden llegar a resolver tienen la complejidad necesaria como para que este oficio tome valor.
Sin embargo, todos, empezando por el más veterano y jefe de los demás, escriben código y despliegan componentes a producción, lo que les permite embalarse si llegan a tomar una mala decisión por gaseosa o "pedo-sa", más bien. Y créanme cuando les digo que Zachmann y TOGAF y demás es en lo último en lo que piensan.

## Notas finales

Una de las primeras conclusiones que nacen es quizás que debemos cambiar el punto de referencia. Dejar de mirarnos el ombligo podría ser un buen principio, retándonos con lo que hacen las más tesas del mundo y no quedarnos mirando cómo no podemos porque somos "demasiado grandes".

También he podido concluir que las empresas colombianas tienen como ventaja haber crecido y haberse desarrollado en un ecosistema adverso, pues de alguna manera desarrollan capacidades que cuando el ecosistema es un poco más favorable, tienen la oportunidad de volverse dominantes de ese nuevo mercado.

### De la responsabilidad del colombiano de a pie
A veces pienso lo emocionante que sería saber que un transbordador espacial va a ser lanzado por la "Comisión Aeroespacial de San Andrés Islas". O que vamos a llenar de fincas solares las planicies de nuestros Llanos Orientales. O que vamos a llenar de gigantes hélices generadoras de energía eólica toda La Guajira. Y a veces pienso, por qué no, que Panaca logre ser la primera entidad con ánimo de lucro en clonar un chigüiro.

Estos "sueños húmedos" por el que cualquier colombiano debería sentir orgullo y sentir el corazón henchido, depende completamente de ustedes, cerebros brillantes y maravillosos. Depende de que se queden en Colombia creando, construyendo, cambiando, cuestionando, motivando, escribiendo, criticando, haciendo. Ojalá no solo opinando. Si seguimos esperando que empresas españolas, americanas, argentinas nos vendan su "innovación" no vamos a crear ecosistema, no habrá nunca cambio y no veo entonces cómo salgamos de pobres. Porque ser pobre no es falta de plata, es falta de ganas de demostrar que sí se puede.

(Si de alguna manera se siente identificado con esta responsabilidad y resulta que es usted un desarrollador de software, no dude en enviar su CV a info@s4n.co).

### Pregunta frecuente

Varios me han preguntado cómo llegamos a atender a este cliente. Se puede resumir en tres movimientos: el primero, haber sido lo suficientemente estúpidos como para hace 4 años creer que las tecnologías/lenguajes con las que se construían las aplicaciones empresariales eran insuficientes, grasosas e inocuas. El segundo, tener la suficiente obstinación para seguir expandiendo esa idea y tener clientes que habían llegado a la misma conclusión. El tercero, haber desarrollado métodos y prácticas que fueran sistemáticamente exitosas en contextos adversos en sentido común, método, presupuesto y tiempos.
