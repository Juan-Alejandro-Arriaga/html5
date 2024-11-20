# La forma de la locura

## PLACEHOLDER TEXT

##### Tabla de sitios web que soportan "*PLACEHOLDER*"
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
                3.7+
            </td>
            <td>
                4.0+
            </td>
            <td>
                4.0+
            </td>
            <td>
                11.0+
            </td>
            <td>
                4.0+
            </td>
            <td>
                -
            </td>
        </tr>
    </tbody>
</table>

El "*Placeholder*" es una manera de establecer texto de un campo de texto que sera visible siempre y cuando no este enfocado o haya texto sobre el.

Ejemplo de su implementación:

```html
    <form>
        <input name="q" placeholder="Search Bookmarks and History">
        <input type="submit" value="Search">
    </form>
```
## Campos de autoenfoque (AUTOFOCUS FIELDS)

##### Tabla de sitios web que soportan "*AUTOFOCUS*"

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
                4.0+
            </td>
            <td>
                3.0+
            </td>
            <td>
                10.0+
            </td>
            <td>
                -
            </td>
            <td>
                -
            </td>
        </tr>
    </tbody>
</table>

Algunos sitios web usan JS para enfocar inmediatamente algún campo de entrada del mismo, aunque algunas personas no les gusta tanto esta practica , por eso algunos navegadores ofrecen la opción de desactivar el "*auto enfoque*".

Aun así el siguiente código explica como configurar un campo de algún formulario para que se enfoque automáticamente.

```html
    <form>
        <input name="q" autofocus>
        <input type="submit" value="Search">
    </form>
```
En caso de que el navegador no admita el atributo `autofocus` solamente lo ignoraran y no habrá ningún otro cambio,en cambio existe la posibilidad de que el `autofocus` funcione en todos los navegadores ,con ayuda de un `<script>` :

```javascript
    <script>
        if(!"autofocus" in document.createElement("input")) {
           document.getElementById("auto").focus();
        };
    </script>
```

### Establecer el enfoque lo mas pronto posible

En ocasiones las paginas web esperan hasta que se activa el evento `window.onload` para colocar el enfoque, aunque este no se activa hasta que todas las imágenes del sitio de han cargado , afectando en ocasiones a algunos usuarios.

Para evitar esto existe la solución de establecer el enfoque durante algún evento personalizado tal como `$(document).ready()` perteneciente a "**JQuery**".

##### Ejemplo:
```html
    <head>
        <script src="jquery.min.js"></script>
        <script>
          $(document).ready(function() {
            if (!("autofocus" in document.createElement("input"))) {
              $("#q").focus();
            }
          });
        </script>
    </head>
    <body>
        <form name="f">
            <input 
                id="q" 
                autofocus
            >
            <input 
                type="submit" 
                value="Go"
            >
        </form>
    </body>
```
"**JQuery**" activa el evento `ready` personalizado tan pronto como el "*DOM*" de la página este disponible.

Como tercera opción se puede definir un evento propio tal como `autofocus_ready` ,siendo que podemos activarlo manualmente ,después de que el campo de enfoque automático este disponible.

##### Ejemplo:

```html
    <head>
        <script src=jquery.min.js></script>
        <script>
          $(document).bind('autofocus_ready', function() {
            if (!("autofocus" in document.createElement("input"))) {
              $("#q").focus();
            }
          });
        </script>
    </head>
    <body>
        <form name="f">
          <input id="q" autofocus>
          <script>$(document).trigger('autofocus_ready');</script>
          <input type="submit" value="Go">
        </form>
    </body>
```

## Dirección de correo electrónico (EMAIL)

Existen una gran cantidad de tipos de campos ,aunque los mas comunes son los siguientes:

<table>
    <thead>
        <tr>
            <th>
                Tipo de campo
            </th>
            <th>
                Código en HTML
            </th>
            <th>
                Notas
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                checkbox
            </td>
            <td>
                <code>
                    &lt;input type="checkbox"&gt;
                </code>
            </td>
            <td>
                Se puede activar o desactivar
            </td>
        </tr>
        <tr>
            <td>
                radio button
            </td>
            <td>
                <code>
                    &lt;input type="radio"&gt;
                </code>
            </td>
            <td>
                Puede ser agrupado con otras entradas
            </td>
        </tr>
        <tr>
            <td>
                password field
            </td>
            <td>
                <code>
                    &lt;input type="password"&gt;
                </code>
            </td>
            <td>
                Coloca puntos en lugar de caracteres mientras escribes
            </td>
        </tr>
        <tr>
            <td>
                drop-down lists
            </td>
            <td>
                <code>
                    &lt;select&gt;&lt;option&gt;
                </code>
            </td>
            <td>
                -
            </td>
        </tr>
        <tr>
            <td>
                file picker
            </td>
            <td>
                <code>
                    &lt;input type="file"&gt;
                </code>
            </td>
            <td>
                Aparece un cuadro de diálogo de "abrir archivo"
            </td>
        </tr>
        <tr>
            <td>
                submit button
            </td>
            <td>
                <code>
                    &lt;input type="submit"&gt;
                </code>
            </td>
            <td>
                -
            </td>
        </tr>
        <tr>
            <td>
                plain text
            </td>
            <td>
                <code>
                    &lt;input type="text"&gt;
                </code>
            </td>
            <td>
                El atributo de tipo se puede omitir
            </td>
        </tr>
    </tbody>
</table>

Todos siguen funcionando en HTML5 ,aun así este implemento 13 nuevos tipos de campos completamente funcionales.

El primero que se menciona es el de correo ,que se ve así:
```html
    <form>
        <input type="email">
        <input 
            type="submit" 
            value="go"
        >
    </form>
```
Los navegadores que no llegarán a conocer ese tipo de entrada lo pasaran como un tipo "*text*" , ademas no existe una interfaz en particular para ese tipo de entrada , así que es complicado darse cuenta.

## Dirección Web

Las direcciones web o "*URL'S*" son otro tipo especializado de texto , los elementos como las diagonales son comunes, al igual que los puntos , sin embargo los espacios están prohibidos , y cada una tiene un sufijo de dominio como "*.com*" o "*.org*".

##### Ejemplo de como usar tipo "*URL*"

```html
    <input type="url">
```

## Números como cajas giratorias (Spinboxes)

Este te ayuda cuando ocupas algún dato numérico en especifico , el cual debe ser elegido por el usuario como por ejemplo algún numero múltiplo de 5 o dentro de un rango en particular, por ejemplo:

```html
    <input 
        max="10"
        min="0"
        step="2"
        type="number"
        value="6"
    >
```
Cada elemento sirve para algo:
*   **type**:Especifica que se trata de un tipo numérico.
*   **min**:Establece el valor mínimo que acepta.
*   **max**:Establece el valor máximo que acepta.
*   **step**:Establece los valores que se pueden aceptar en el rango, en el ejemplo , serian múltiplos de 2.
*   **value**:Es el valor predeterminado que tiene.

>Los atributos son opcionales dependiendo de las características para las que se requiera.

Tiene eventos JS como:

```javascript
    input.stepUp(n); //incrementa el valor dependiendo "n"
    input.stepDown(n) //decrementa el valor dependiendo "n"
    input.valueAsNumber //retorna el valor el cual esta en la caja
```

## Numeros como deslizadores (SLIDERS)

Estos son otra manera para representar valores de tipo numérico y su sintaxis es esta: 
```html
    <input 
        max="10"
        min="0"
        step="2"
        type="range"
        value="6"
    >
```

Los atributos son los mismos , solo que en este caso ,lo que cambia es la interfaz 

## Selectores de fecha (DATE PICKERS)

Con este se puede configurar para poder definir hasta 6 tipos de entrada que se puedan solicitar.

Sintaxis:
```html
    <input type="(tipo)">
```


##### Tabla de soporte de DATE PICKERS
<table>
    <thead>
        <tr>
            <th>
                Input
            </th>
            <th>
                Opera
            </th>
            <th>
                Algún otro navegador
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                type="date"
            </td>
            <td>
                9.0+
            </td>
            <td>
                -
            </td>
        </tr>
        <tr>
            <td>
                type="month"
            </td>
            <td>
                9.0+
            </td>
            <td>
                -
            </td>
        </tr>
        <tr>
            <td>
                type="week"
            </td>
            <td>
                9.0+
            </td>
            <td>
                -
            </td>
        </tr>
        <tr>
            <td>
                type="time"
            </td>
            <td>
                9.0+
            </td>
            <td>
                -
            </td>
        </tr>
        <tr>
            <td>
                type="datetime"
            </td>
            <td>
                9.0+
            </td>
            <td>
                -
            </td>
        </tr>
        <tr>
            <td>
                type="datetime-local"
            </td>
            <td>
                9.0+
            </td>
            <td>
                -
            </td>
        </tr>
    </tbody>
</table>

## Cajas de busqueda (SEARCH BOXES)
Estos se mostraran como cuadros de texto sin formato alguno en los navegadores que no los reconozcan.

Sintaxis:
```html
    <form>
        <input 
        name="q" 
        type="search"
    >
        <input 
        type="submit"
        value="find" 
    >
    </form>
```
## Selectores de color (COLOR PICKERS)
Permite elegir un color y devuelve la representación hexadecimal del color 

SINTAXIS:

```html
    <input type="color">
```

## Validación de formularios (FORM VALIDATION)

##### Soporte de validación de formularios
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
                10.0+
            </td>
            <td>
                9.0+
            </td>
            <td>
                -
            </td>
            <td>
                -
            </td>
        </tr>
    </tbody>
</table>

Las validaciones de entrada hacen que problemas comunes como el ingresar una dirección de correo electrónico se eviten.

Existen 2 problemas con la validación de correos en JS:
1.  Probablemente el 10% de los visitantes no tendrán habilitado JS
1.  Lo harás mal

Dentro de la validación de números tienen en cuenta los atributos "*min*" y "*max*", por lo que los navegadores no te permitirán enviar el formulario si ingresas un número demasiado grande.

Para desactivar la validación se usa `novalidate`:

```html
    <form novalidate>
        <input 
            id="addr"
            type="email" 
        >
        <input 
            type="submit" 
            value="Subscribe"
        >
    </form>
```

## Campos requeridos (REQUIRED FIELDS)
Son los campos donde se especifica que se necesita llenado para poder enviar el formulario.

SINTAXIS:
```html
    <input 
        required
        type="text" 
    >
```