# Naves Espaciales

En un futuro distante, donde las actividades se derrollan en un ambiente interplanetario, nos piden un sistema que modele distintas naves y su comportamiento ante una amenaza.

## 1. Las naves

De las naves conocemos su velocidad, medida en _kms/seg_; y, por ahora, nos pidieron modelar los siguientes tipos:

- **Naves de carga**: nos interesa saber la masa de la carga que está transportando, medida en kg. Se desea saber si la nave está sobrecargada, que sucede cuando su carga excede 100 toneladas; y si está excedida de velocidad. Sabemos este tipo de naves que están excedidas de velocidad cuando viajan a más de 100.000 kms/seg. Cuando estas naves reciben una amenaza tienen un protocolo de deshacerse de toda su carga, dejándola vacía. Además, estas naves reciben controles ocasionales sobre las rutas para garantizar que se cumplan las normas vigentes; cuando se acerca un control y la nave está en falta (sobrecargada y excededida de velocidad) lo toman como una amenaza y llevan a cabo el protocolo asignado.

- **Naves de pasajeros**: lleva consigo una determinada cantidad de personas, más una tripulación de 4 personas. Cuando estas naves reciben una amenaza simplemente activan su alarma de emergencia. Se desea conocer la velocidad máxima legal a la que puede viajar, que es de 300.000 kms/seg divido la cantidad de personas dentro de la nave (pasajeras + tripulación), además se descuenta 200 kms/seg más si hay más de 100 pasajeros, por cuestiones de seguridad. Además se necesita poder determinar si la nave está en peligro, lo que sucede cuando va más rápido que su velocidad máxima legal o la alarma de emergencia está encendida.

- **Naves de combate**: pueden emitir mensajes y tiene 2 modos: _en reposo_ o _ataque_. Sabemos que al viajar a menos de 10.000 kms/seg y estar en modo ataque la nave es invisible para los enemigos. Al recibir una amenaza, si está en reposo emite el mensaje `"¡RETIRADA!"` y el modo ataque emite el mensaje `"Enemigo encontrado"`.

### Ejercicio

Analizar si el código predeterminado debe reestructurarse mediante alguna herencia. En caso que si, modificarlo y justificar.

## 2. Propulsión

Al código predeterminado se le debe incorporar la función que permite que todas las naves se puedan _propulsar_. Esto aumenta su velocidad en 20.000 kms/seg, pero nunca puede superar los 300.000 kms/seg, siendo este su máximo alcanzable.

### Escenario de prueba 

Testear que una nave de carga sin velocidad al propulsarse queda con una velocidad de 20.000 kms/seg. Y que una nave de pasajeros que viaja a 290.000 kms/seg al propulsarse queda viajando a 300.000 kms/seg.

## 3. Residuos radioactivos

Agregar al modelo un nuevo tipo de nave, las de **carga de residuos radioactivos**. Estas son un tipo de nave de carga, que puede sellarse al vacío para evitar esparcir residuos radioactivos por todo el espacio. Por esto mismo, al recibir una amenaza no deben liberar su carga, sino que deben reducir su velocidad a 0, dispuestos a entregar la nave.

### Escenario de prueba 

Construir una nave que transporta 5.000 kg de residuos radioactivos sellados al vacío a 10.000 kms/seg y testear que al recibir una amenaza frenan pero su carga sigue siendo la misma.

## 4. Preparación para el viaje

Hacer que todas las naves se puedan preparar para viajar. Esto hace que aumenten su velocidad 15.000 kms/seg (teniendo la restricción de la velocidad máxima posible de 300.000kms/s). 

Además de eso ocurre lo siguiente:

  - las naves que cargan residuos radioactivos se cierran al vacío.
  - y las de combate, si se encuentran en modo ataque, emiten el mensaje `"Volviendo a la base"`, mientras que si están en reposo emiten el mensaje `"Saliendo en misión"` y se ponen en modo ataque.

### Escenario de prueba 

 - Una nave de pasajeros que viaja a 290.000 kms/seg al prepararse para viajar queda con velocidad de 300.000 kms/seg.
 - Una nave de residuos radiactivos sin velocidad y que **no** está sellada al prepararse para viajar queda con velocidad de 15.000 kms/seg y sellada al vacío.
 - Una nave de combate en modo ataque sin velocidad al prepararse para viajar emite el mensaje `"Volviendo a la base"` y queda con velocidad de 15.000 kms/seg
 - Una nave de combate en modo reposo sin velocidad al prepararse para viajar emite el mensaje `"Saliendo en misión"`, queda en modo ataque y con velocidad de 15.000 kms/seg

## 5. Enfrentar enemigo

 Hacer que una nave se encuentre con un enemigo. Esto les hace recibir una amenaza, sufriendo los efectos particulares de cada nave, y luego se propulsan para intentar escapar.


### Escenario de prueba 

Testear que una nave de pasajeros sin velocidad al encontrarse con un enemigo queda con velocidad de 20.000 kms/seg y su alarma en caso de emergencia activada.

Para pensar: ¿Hace falta testear más casos?
