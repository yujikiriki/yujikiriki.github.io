# Sobre cómo hacemos software en S4N

Gracias por compartir. Dado que busca más experiencias al respecto, quisiera compartirle algunos hallazgos de mi camino que no necesariamente es el de alguien más. Ojalá le sean de utilidad.

    La metodología muta en el tiempo.

Tal y como uds concluyeron, seguir con la misma metodología que traían no lo mejor. Ahí hay una oportunidad de ahondar.

En mi experiencia, es insuficiente con medir las cuatro -ahora clásicas- métricas de Accelerate. Es el mejor comienzo, pero no es suficiente si quieren tener un método y unos equipos de cada día trabajen más mecánicamente, es decir, sin pensar en el proceso.

Si uno entiende que entregar sw es aplicar el método cientifico, entonces cada vez que recojan datos (en la retro, en la demo, por ejemplo) es útil sacar cambios en el método y así irla mutando u adaptando.

    La metodología depende de la madurez del equipo.

Si solo miden las 4 de Accelerate, se van a quedar ciegos de quiénes son y qué nivel de madurez tienen, se medirá el proceso y no el equipo y menos el individuo.

Es diferente la metodología de trabajo que lleva un equipo recién constituido a otro que lleva tiempo trabajando junta. Eso lo explican someramente en Team Topologies, pero se enfocan mucho en el tamaño del equipo en consecuencia de la carga cognitiva y el objetivo.

Entre más nuevo sea el equipo, más forma se necesita. A medida que el equipo a través de la toma de datos de las retros y demás fuentes de datos que dispongan, más irá mutando la metogología logrando que sea la metología la que se adapte al equipo y no al revés. Al revés solo sirve, de nuevo, para equipos nuevos.

Darle potestad a los equipos a que encuentren su forma de trabajar ideal a la luz de un objetivo medible es mejor que pedirles que cumplan con un mejor cycle time.

Eso implica que entre más maduro es un equipo, más rara será su metología o proceso de trabajo. Lo que uno quiere medir es el outcome y no el output (https://martinfowler.com/bliki/OutcomeOverOutput.html) lo cual está pegado, piel con piel con mi siguiente hallazgo.

    Pequeños equipos con un solo objetivo, autónomos y que toman decisiones por consenso.

Este es mi estado del arte. Después de leer Shape Up! (https://basecamp.com/shapeup) llegué a la conclusión que entre más maduro un equipo es, más se parecen a lo que proponen allí.

Una abstracta definición de un objetivo que se quiere alcanzar y que se pueda definir en una página y un equipo pequeño con la misión de entregarlo en 6 semanas.

No importa si cumplen con Scrum, con Kanban o con Shitty Agile For the Enterprise o SAFe (no maten al mensajero, fue Martin Fowler), lo importante es que sea un equipo pequeño, autónomo y que toma decisiones por consenso. De nuevo, esto solo aplica en mi opinión en equipos maduros.

    Team Topologies y Domain Distillation

Una de las brechas de Team Topologies es haber dejado abierta la pregunta de ¿y ahora qué? En ese sentido he encontrado que si se hace una buena destilación de subdominios, se mapean sobre un Wardley Map, se pueden escoger equipos especialmente diseñados para cada subdominio.

Esto quiere decir que si ya tengo equipos pequeños, autónomos, etc, antes de ponerme a clavarle una topología, debo entender quién es mi equipo. Es innovador, es un Town Planner ¿qué le gustra hacer? ¿cuál es su personalidad?

Con base en eso, uno puede armar equipos orientados a la génesis, muy experimentales, arriesgados y donde se necesita generar diferenciación en el mercado. También puedo crear equipos 100% town planners para aquellos subdominios estables o en mantenimiento.

Entonces, dependiendo de la necesidad estratégica, del tipo de trabajo que vayan a hacer y del tipo de estructura que use un equipo, se define la metodología y no al revés.

    CI/CD es el todo.

Creo que hay demasiada literatura de eso como para ponerme a escribir lo mismo.