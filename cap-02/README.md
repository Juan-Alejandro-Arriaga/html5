# Detectando características de HTML
HTML5 es tan fácil que no necesita de un soporte técnico, ya que cada quien puede ser su propio soporte.

Dentro de Html5 existe el **DOM**, que son todos los elementos que haya dentro del documento ya sean `<p> <a> <div>`

Cada una tiene características únicas como ejemplo ´<img>´ que hace que puedas colocar imágenes 

Nos dan 4 formas con las que podemos revisar si el navegador soporta esa propiedad:

1. Comprobar si existe esa propiedad en un objeto global
1. Crea un elemento y comprueba/investiga acerca si esa propiedad existe
1. Crea un elemento, y revisa si el método existe en ese elemento, después llama al método y checa si regresa el valor
1. Crea un elemento, añádele un valor, y checa si el elemento conservo el valor
    
        Ejemplo:
        los tipos de <input> que sean soportados
        
Hablan de ***Mordernizr*** el cual es un tipo soporte para archivos HTML5 y CSS3, para hacer uso de él se tiene que colocar:

`<script src="modernizr.min.js"></script>`

En la etiqueta `<head>`

##### El formato sería algo semejante a esto:

    <!DOCTYPE HTML>
    <HTML>
        <head>
            <meta charset="utf-8">
            <title>Dive into HTML5</title>
            <script src="modernizr.min.js"></script>
        </head>
    </HTML>
No hay necesidad de llamarlo , corre automáticamente, funciona de tal manera que, si al tu meter un Canva dentro de tu navegador este lo soportara , su propiedad *"Modernizr. canvas"* será ***true*** y si no es el caso será ***false***

    Ejemplo mostrado es este:
    
        if (Modernizr.canvas) {
             // A dibujar algunas formas!
        } else {
             // No son aptos los canvas :(
        }

### CANVAS
A resumidas cuentas en un mapa de bits, para representar diversos elementos como gráficos o imágenes sobre la marcha, con comandos de JavaScript es posible dibujar cualquier forma que se deseara 

En caso de que tu navegador lo soportara, todos los elementos `<Canva>` tendrán un método llamado getContext () y con este hará que solo exista si tu navegador soporta los *Canvas*
    
    Ejemplo: 
    (función) (Nombre de la f) 
        |               |            
        v               v            
    function    supports_canvas {
        return !!documen.createElement('canvas').getContext;
    }

Nota:

    "!!" estos sirven para forzar el resultado que sea un tipo Booleano
    
### Texto en los canvas

En caso de que el navegador no soporte los "Canva API" se creara un elemento para los `<canvas>` el cual solo tendrá propiedades básicas.

    Nos dan este ejemplo:
    
    function supports_canvas_text() {
    if (!supports_canvas()) { return false; }
    var dummy_canvas = document.createElement('canvas');
    var context = dummy_canvas.getContext('2d');
    return typeof context.fillText == 'function';
    }
    
    Nos muestra el elemento:
    
    if (!supports_canvas()) que es la funcion que se hizo anteriormente con esta se corrobora que soporte los canvas 
    Esto sirve para:
    
    var dummy_canvas = document.createElement('canvas');
    var context = dummy_canvas.getContext('2d');
    
    Crear el elemento <canva> y obtener lo que se dibujara
    
    Y el: 
    
    return typeof context.fillText == 'function'; 
                            ^
                            |
                            |
    Y al final solo chechar si tiene la funcion señalada para ver si funciona en caso de que si , es que si funciona
    
### VIDEO
HTML5 tiene un elemento que es `<video>` 

Este se puede usar sin necesidad de algun `<script>` 

Y si el navegador no lo soporta 

De igual manera que en los anteriores se puede usar Mordernizr para corroborar que el navegador soporta el elemento.


### Formatos de video
Debido a que existen distintos formatos de video , el navegador debe entender 

Nota:
Los formatos de video(lenguajes) se les nombran "codec"

Y cada codec cuesta dinero debido a la licencia que tienen


Los formatos de video tienen una funcion de nombre 
**.canPlayType()** la cual regresa un valor tipo cadena dependiendo si puede o no reproducir el video

* "*probably*" Puede reproducirlo
* "*maybe*" Esta 50/50 que pueda reproducirlo
* ""(vacio)  No lo puede reproducir


 *return v.canPlayType('video/ogg; codecs="theora, vorbis"');*
 Esta funcion lo que dice es que si puede reproducir los videos theora y vorbis en un contenedor de Ogg
 
 De igual manera se puede hacer todo esto con Modernizr para facilitar toda la escritura de codigo.
 
### Almacenamiento Local
Nos hablan de las "*Cookies*" que son información del usuario que se almacenan en la página web gracias a JavaScript , funciona cuando se carga la pagina 

En caso de que el navegador no soporte este tipo de almacenamiento lo que se almacena será indefinido

Esta funcion generara una excepción si las "*cookies*" están deshabilitadas

    function supports_local_storage() {
    try {
       return 'localStorage' in window && window['localStorage'] !== null;
    } catch(e){
     return false;
     }
    }
    
De igual manera se puede usar Mordernizr


### Trabajadores de la web
 
 Estos permiten que en el fondo permita correr diferentes "*threads*" al mismo tiempo 

Esos permiten hacer cálculos matemáticos super complejos y algunas otras cosas mientras la página está controlada por el usuario con "*clicks* y *scrolling*"


Existe la funcion ***Worker*** el cual si el navegador no soporta el **Web Worker API** este será indefinido

    Funcion para ver si lo soporta:
       function supports_web_workers() {
            return !!window.Worker;
       }

De igual manera Modernizr se puede usar.



### Aplicaciones Fuera de línea

En HTML5 se pueden crear páginas web sin necesidad de estar conectado a una red de internet

Incluso pueden funcionar algunas aplicaciones ya que algunas descargan ciertas funcionalidades solo que mientras no estes conectado a alguna red de internet los cambios que hagas no se guardaran.


### Geolocalización
Es la manera con la que sabes en que parte del mundo estas y para saberlo esta la dirección IP o el GPS que calcula la latitud y altitud

Tiene su propiedad *geolcation*

En esta funcion si el navegador no soporta *geolocation API* devolvera un valor indefinido

        function supports_geolocation() {
         return !!navigator.geolocation;
        }
        
Igual se puede usar Mordernizr

### Tipos de entradas

Generalmente se pueden usar para formularios y hay muchos tipos de estos como por ejemplo botones, cajas de texto, y muchos tipos mas


De igual manera se pueden crear con Js esta funcion es para crear el elemento
 var i = document.createElement("input");

Y también se le pueden añadir atributos

### Placeholder Text

Estos son textos que están dentro de las cajas de texto que se coloquen ,aparecerán siempre y cuando estos estén vacíos aparecerá el texto.

### Enfoque automático del formulario

Con Js es posible hacer que un elemento en este caso un input resalte entre los demás del texto como por ejemplo al darle clic en la barra de búsqueda de Google, esta cambia de color resaltando en el texto

Esta funcion coloca el foco de atención al elemento

        function supports_input_autofocus() {
        var i = document.createElement('input');
        return 'autofocus' in i;
        }
Y si el navegador no lo soporta no se realizará la acción del autofocus

De igual manera se puede usar Modernizr

### Micro Data
Estos sirven para poder añadir algunas pequeñas cosas a la página web como por ejemplo señalar cosas sobre el autor o no tan extensas 


De igual manera tienen una propiedad que es el *getText()* y si el navegador no lo soporta este será indefinido

    Funcion:
    function supports_microdata_api() {
      return !!document.getItems;
    }
En este caso Modernizr no soporta este tipo de formato

### Historial del API
Hace que se pueda manipular el historial de navegación mediante scripts, así una *URL* puede seguir haciendo su trabajo como identificador único para el recurso actual
