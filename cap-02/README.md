# Detectando caracteriticas de HTML
HTML5 es tan facil que no necesita de un soporte tecnico, ya que cada quien puede ser su propio soporte.

Dentro de Html5 existe el **DOM** ,que son todos los elementos que haya dentro del documento ya sean `<p> <a> <div>`

Cada una tiene caracteristicas unicas como ejemplo ´<img>´ que hace que puedas colocar imagenes 

Nos dan 4 formas con las que podemos revisar si el navegador soporta esa propiedad:

1. Comprobar si existe esa propiedad en un objeto global
1. Crea un elemento y comprueba/investiga acerca si esa propiedad existe
1. Crea un elemento ,y revisa si el metodo existe en ese elemento ,despues llama al metodo y checa si regresa el valor
1. Crea un elemento , añadele un valor ,y checa si el elemento conservo el valor
    
        Ejemplo:
        los tipos de <input> que sean soportados
        
Hablan de ***Mordernizr*** el cual es un tipo soporte para archivos HTML5 y CSS3, para hacer uso de el se tiene que colocar:

`<script src="modernizr.min.js"></script>`

En la etiqueta `<head>`

##### El formato seria algo semejate a esto:

    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="utf-8">
            <title>Dive into HTML5</title>
            <script src="modernizr.min.js"></script>
        </head>
    </html>
No hay necesidad de llamarlo , corre automaticamente,funciona de tal manera que si al tu meter un Canva dentro de tu navegador este lo soportara , su propiedad *"Modernizr.canvas"* sera ***true*** y si no es el caso sera ***false***

    Ejemplo mostrado es este:
    
        if (Modernizr.canvas) {
             // A dibujar algunas formas!
        } else {
             // No son aptos los canvas :(
        }

### CANVAS
A resumidas cuentas en un mapa de bits ,para reprensar diversos elementos como graficos o imagenes sobre la marcha, con comandos de Javascript es posible dibujar cualquier forma que se deseara 

En caso de que tu navegador lo soportara , todos los elementos `<canva>` tendran un metodo llamado getContext() y con este hara que solo exista si tu navegador soporta los *Canvas*
    
    Ejemplo: 
    (funcion)    (Nombre de la f)   ({})
        |               |            |
        v               v            v
    function    supports_canvas      {
        return !!documen.createElement('canvas').getContext;
    }

Nota:

    "!!" estos sirven para forzar el resultado que sea un tipo Booleano
    
##### Texto en los canvas

En caso de que el navegador no soporte los "canva API" se creara un elemento para los `<canvas>` el cual solo tendra propiedades basicas.

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
    
##### VIDEO
HTML5 tiene un elemento que es `<video>` 

Este se puede usar sin necesidad de algun `<script>` 

Y si el navegador no lo soporta 

De igual manera que en los anteriores se puede suar Mordenizr para corroborar que el navegador soporta el elemento.


##### Formatos de video
Debido a que existen distitnos formatos de video , el navegador debe entender 

Nota:
Los formatos de video(lenguajes) se les nombran "codec"

Y cada codec cuesta dinero debido a la licentcia que tienen


Los formatos de video tienen una funcion de nombre 
**.canPlayType()** la cual regresa un valor tipo cadena dependiendo si puede o no reproducir el video

* "*probably*" Puede reproducirlo
* "*maybe*" Esta 50/50 que pueda reproducirlo
* ""(vacio)  No lo puede reproducir


 *return v.canPlayType('video/ogg; codecs="theora, vorbis"');*
 Esta funcion lo que dice es que si puede reproducir los videos theora y vorbis en un contenedor de Ogg
 
 De igual manera se puede hacer todo esto con Modernizr para facilitar toda la escritura de codigo.
 
##### Almacenamiento Local
Nos hablan de las "*Cookies*" que son informacion del usuario que se almacenan en la pagina web gracias a javascript , funciona cuando se carga la pagina 

En caso de que el navegador no soporte este tipo de almacenamiento lo que se almacena sera indefinido

Esta funcion generara un excepcion si las "*cookies*" estan desabilitadas

    function supports_local_storage() {
    try {
       return 'localStorage' in window && window['localStorage'] !== null;
    } catch(e){
     return false;
     }
    }
    
De igual manera se puede usar Mordernizr


##### Trabajadores de la web
 
 