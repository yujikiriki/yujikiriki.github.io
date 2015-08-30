---
layout: post
title: Consistencia
author: Yuji Kiriki
author_url: https://s3.amazonaws.com/bitacora/me.html
---

Entender cómo funciona la consistencia en un sistema distribuido es quizas la herramienta más versatil para diseñar e implementar aplicaciones de software tolerantes a fallas, escalables y de desempeño adecuado.

Pienso que es importante escribir sobre la consistencia debido a que su entendimiento común puede facilitar y enriquecer discusiones de diseño y arquitectura entre las personas. Su mal entendimiento puede llevar a un equipo de trabajo creer en soluciones místicas gobernadas por leyes "superiores" a la matemática.

La intención de esta entrada es tratar de resumir un considerable número de papers, artículos y blogs que he leído durante los últimos meses, esperando hacer justicia a los distintos autores. 

### Definición

Para esta entrada la consistencia no será considerada un atributo de calidad de un sistema dado que, basandose en el catalogo de atributos de calidad del _Software Engineering Institute_ (SEI) en su reporte técnico CMU/SEI-95-TR-021 de 1995, esta no se encuentra definida.

Que la consistencia no sea tratada como atributo de calidad tiene sentido pues según vayamos ahondando en su definición, lo que coloquialmente buscamos y consideramos "consistencia" es realmente que un sistema manifieste propiedades de integridad y confidencialidad de la información. No obstante, si se detalla de definición de integridad se puede concluir que la integridad asume la consistencia.

Lo que sí podemos decir es que la consistencia trata sobre las operaciones (transacciones) que se realizan sobre un dato o sobre un conjunto de datos, según el modelo de consistencia del que se está hablando.

Cuando se habla sobre la consistencia se debe hablar sobre los distintos modelos de consistencia, más que sobre la consistencia _per se_. En general se reconocen dos tipos de modelo de consistencia: modelo de consistencia fuerte y modelo de consistencia debil.

Un modelo de consistencia establece un contrato entre el desarrollador de un sistema y el sistema donde, si el desarrollador sigue las reglas del sistema, el sistema le garantizará que los resultados de las operaciones realizadas sobre sus datos sea predecible[1](http://en.wikipedia.org/wiki/Consistency_model).

Hablar sobre los modelos de consistenia más populares: causal, secuencial, serializable, eventual, etc.
