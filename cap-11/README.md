# Manipulando la historia por diversión y ganancias

## El "¿Por qué?"

La "*API de historial*" esta diseñada para garantizar que la *URL* sigan siendo útiles en aplicaciones web con muchos `<script>`.

Al momento de cambiar la *URL*, incluyendo el cambio por "*script*" se realiza una actualizacion completa de la pagina ,requiriendo tiempo y recursos ,además que se descarga todo el contenido de la nueva pagina.

Para evitar eso la "*Api de historial*" hace que no se active una actualización completa de la pagina ,en cambio solo se descargue la mitad o lo necesario.

##### Situación
Tengo 2 paginas y se requiere navegar en paginas "A" y
"B" dentro iniciando su navegación en "A"
quiere ir a la pagina "B" , pero en lugar de 
actualizar la pagina completa , realiza los siguientes pasos:
1.  Carga las partes de la pagina que son diferentes a la anterior , puede ser una "*URL*" oculta o un parámetro de consulta (*al final el usuario no lo veria*).
1.  Cambiar el contenido modificado(*Se puede necesitar un restablecimiento de los controladores*).  
1.  Actualiza la barra de ubicación con la nueva *URL*.

Después de todos estos procesos si se realizaron correctamente la pagina terminara con un "*DOM*" idéntico al de la pagina B.

## El cómo? (THE HOW)
El "*API*" de historial son diversos métodos y su compatibilidad es la siguiente:

##### Tabla de compatibilidad
<table>
    <thead>
        <tr>
            <th>
                IE
            </th>
            <th>
                FIREFOX
            </th>
            <th>
                SAFARI
            </th>
            <th>
                CHROME
            </th>
            <th>
                OPERA
            </th>
            <th>
                IPHONE
            </th>
            <th>
                ANDROID
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                -
            </td>
            <td>
                4.0+
            </td>
            <td>
                5.0+
            </td>
            <td>
                8.0+
            </td>
            <td>
                11.50+
            </td>
            <td>
                4.2.1+
            </td>
        </tr>
    </tbody>
</table>

En base al ejemplo del libro de <a href="https://diveinto.html5doctor.com/examples/history/fer.html">"Dive into dogs"</a> muestra como las fotos de actualizarán en vez de actualizar completamente la pagina, actualizando también la "*URL*" 

##### Ejemplo del código:
```html
    <aside id="gallery">
      <p class="photonav">
        <a 
            href="casey.html"
            id="photonext" 
        >
            Next >
        </a>
        <a 
            href="adagio.html"
            id="photoprev" 
        >
            < Previous
        </a>
      </p>
      <figure id="photo">
        <img 
            alt="Fer" 
            height="375"
            id="photoimg" 
            src="gallery/1972-fer-500.jpg"
            width="500" 
        >
        <figcaption>
            Fer, 1972
        </figcaption>
      </figure>
    </aside>
```

Este es el código el cual muestra la imagen.

La función que añade las acciones es esta:
```javascript
    function setupHistoryClicks() {
      addClicker(document.getElementById("photonext"));
      addClicker(document.getElementById("photoprev"));
    }
```
Este añade el evento "*click*" a cada elemento `<a>` haciendo que ejecuten acciones al momento de darles "*click*".

Dentro de la siguiente función "*addClicker()*" se toma un elemento `<a>` y agrega un controlador de "*click*".

```javascript
    function addClicker(link) {
      link.addEventListener("click", function(e) {
        swapPhoto(link.href); //Esta hace la magia
        history.pushState(null, null, link.href);
        e.preventDefault();
      }, 
```
La función "*swapPhoto()*" realiza 2 pasos de los 3 que son:
1.  Toma parte de la "*URL*" y construye una nueva "*URL*" la cual solo contiene el marcado que se requiere para la siguiente foto.

##### Primera parte de swapPhoto()
```javascript
    function swapPhoto(href) {
        var req = new XMLHttpRequest();
        req.open(
            "GET",
            "http://diveintohtml5.org/examples/history/gallery/"
            +
            href.split("/").pop(),
            false
        );
        req.send(null);
```

2.  Esta parte otra de la función inserta el marcado recientemente descargado en la página actual.
```javascript
        if (req.status == 200) {
            document.getElementById("gallery").innerHTML = req.responseText;
            setupHistoryClicks();
            return true;
        }
        return false;
    }
```
La llamada la función "*setupHistoryClicks()*" hace que se reinicien los contadores de "*click*".

La configuracion de "*innerHTML*" elimina los rastros de enlaces antiguos y controladores de eventos.

3. El tercer paso de este proceso consiste en configurar la "*URL*" en la barra del navegador sin actualizar la pagina, y para eso es la siguiente línea.

```javascript
    history.pushState(null, null, link.href);
```
Dentro de "*history.pushState()*" hay 3 parámetros:
*   El primer dato es el **estado** ,este devuelve al navegador eventos "*popstate*"

*   El título puede ser cualquier cadena.

*   La "*ULR*" es la que se desea que aparezca en la barra de navegación.

Ahora para hacer el "*botón de regreso*" de igual manera tiene que ser simulado y para eso existe el evento "*popstate*".

##### Añadiendo el evento popstate
```javascript
    window.addEventListener("popstate", function(e) {
        swapPhoto(location.pathname);
    }
```
Esta cambia la "*URL*" de la página actual a la "*URL*" anterior.

En resumen todo lo que hizo este proceso es navegar entre 2 paginas hacia delante y hacia atrás sin actualizar la pagina completamente. 