---
layout: post
title: Senoidal de la entrega de productos
author: Yuji Kiriki
author_url: https://s3.amazonaws.com/bitacora/me.html
---

Es difícil resumir 9 años de aprendizaje en aplicar prácticas y costumbres ágiles en los productos de software que he construido con los equipos con los que he trabajado. No por la cantidad de aprendizaje, sino porque cada producto entregado tuvo condiciones y contextos únicos que para serle útil a un tercero, requeriría muchísimo esfuerzo contando cada detalle y justificando cada decisión tomada. 

Sin embargo, en esta entrada busco describir una forma eficiente de explicar los conceptos que considero relevantes de un proceso de software orientado a **entregar productos**: cadencia, aprendizaje, predictibilidad, generación de valor, iterativo e incremental. 

Estoy seguro que esta forma de explicar los conceptos es una amalgama de muchísimas fuentes que he leído durante los años. Por favor ayúdenme a identificar si estoy fusilando sin crédito a alguien.

## El senoidal

La gráfica presenta dos dimensiones: generación de valor de negocio (y) y tiempo (x).

<img style="margin-left: auto; margin-right: auto;" src="../../../imgs/value-graph.png" width="1100px" height="679px"/>

Cada onda de la senoidal representa el ciclo de entrega de valor de negocio en el tiempo. Eso quiere decir que a medida que se van completando ciclos, se va generando valor en el tiempo.

### Generación de valor

Cada onda que conforma la senoidal tiene como punto máximo de generación de valor una salida a producción del producto en construcción. Entre el punto 0 de generación de valor de cada onda y la salida a producción ocurren, podría ser, cada una de las ceremonias de Scrum: planeación, reunión diaria, etc. A medida que va pasando el tiempo, a través de la curva de la onda se va acumulando generación de valor mas no se ha generado valor.

Esto significa que la planeación tiene una generación de valor igual a cero. Codificar, crear pruebas, hacer reuniones diarias, etc, solo nos llevan a acumular valor mas no a entregarlo. El único punto de entrega tangible de valor se da en el máximo local de la función, es decir, cuando el producto sale a producción.

Esta representación implica que entre menos tiempo pase entre un _commit_ de un desarrollador hasta la puesta a producción de esas líneas de código, más rápido se le puede entregar valor al negocio.

También implica que cualquier mejora que se pueda hacer entre esos dos puntos fomentan la rápida generación de valor que es el fin último de un proceso de construcción de productos de software.

Eso quiere decir que prácticas como la automatización de actividades tales como pruebas unitarias, de aceptación, de capacidad, aprovisionamiento de infraestructura y demás inciden directamente en la generación de valor.

Según la gráfica, una actividad como el _backlog grooming_ solo nos ayuda para tomar impulso para la siguiente acumulación de valor mas no genera valor de negocio alguno.

Otra característica de la gráfica es que permite explicar por qué los ciclos de entrega a producción se deben hacer en ciclos cortos. Entre más tiempo pasa entre paso a producción y paso a producción (entre más grande es el intervalo en x) más acumulación de valor se hace pero menos se entrega al negocio.

En este último punto hay una relación bien curiosa: entre más se acumula valor en el tiempo, menos probable es que ese valor sea capitalizado por el negocio. 

### Cadencia

Dada la gráfica, es fácil explicar que el objetivo de un proceso de desarrollo valioso es hacer que la generación de valor sea frecuente y que en lo posible genere un valor de negocio incremental.

Mantener esta frecuencia generando un valor de negocio proporcional nos induce al ritmo que un equipo debe mantener para ser predecible.

Ser predecible es quizás una de las características más valiosas de un proceso incremental-iterativo, pues permite mitigar riesgos y alinear expectativas de los interesados (_stakeholders_) del producto (además de generar mucho aprendizaje).

Entre más alta sea la frecuencia de la gráfica más frecuentemente se entrega valor al negocio. Al obligar a un equipo a entregar de manera frecuente, el equipo debe desarrollar las habilidades y mecanismos que le permitan llegar alcanzar su inercia. Este "desarrollar" dependerá del aprendizaje que se pueda capitalizar en el ciclo.

Sin embargo se debe ser sabio a la hora de definir la razón entre generación de valor (dimensión en y) y el tiempo necesario para hacerlo (dimensión x), haciendo la cadencia sea una métrica de salud de un producto y un equipo.

La cadencia se representa en la gráfica como cada vez que la función toca dos 0 en el eje x. Si el intervalo de tiempo (_timebox_) es el mismo, se fomenta una cadencia comparable entre ciclo y ciclo.

### Aprendizaje

Si cada entrega a producción es el máximo local de generación de valor, cada vez que la gráfica toca 0 se considera que un ciclo de generación de valor ha terminado (muy seguramente con una retrospectiva). El área de cada ciclo puede considerarse el aprendizaje capitalizado por el equipo y su entorno.

Esto significa que, si solo si es el mismo equipo y el mismo entorno, así como la generación de valor, el aprendizaje se capitalizará con cada puesta a producción.

### Consecuencias de la gráfica

La primera consecuencia es que queda más simple explicarle al negocio porqué se deben automatizar todo tipo de actividades que estén entre la ceremonia de planeación y la salida a producción de la aplicación.

Cualquier traba (infraestructura, SOX, auditoria, etc) que se le ponga al ciclo va en detrimento de la generación de valor. No estoy diciendo que se deban eliminar, solo que todas esas trabas son altamente automatizables.

Segunda consecuencia es la necesidad de adquirir cadencia basada en ciclos de tiempo idénticos, capitalizando el aprendizaje generado entre salida a producción y salida a producción.

La tercera consecuencia es que toda actividad que no sea orientada a desplegar a producción se debe considerar como gasto y no inversión dentro del proceso de desarrollo. Cualquier ceremonia, reunión, actividad, mesa de trabajo, etc, que un proceso de desarrollo se invente va en detrimento de la generación de valor.








