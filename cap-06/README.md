# Tú estas aquí (y también todos los demás)
Con la geolocalización es con la cual se determina en que parte del mundo te encuentras ya sea con tu dirección IP ,torre de telefonía móvil o algún dispositivo GPS.

## El API de Geolocalización 
Hace que puedas compartir tu ubicación , lo que es la latitud y longitud se pone a disposición de JS con diversos fines como encontrar negocios físicos o tu ubicación.

##### Tabla de navegadores que soportan la Geolocalización (Rescatada del libro)

<table>
    <thead>
        <tr>
            <th>
                IE
            </th>
            <th>
                Firefox
            </th>
            <th>
                Safari
            </th>
            <th>
                Chrome
            </th>
            <th>
                Opera
            </th>
            <th>
                Iphone
            </th>
            <th>
                Android
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                9.0+
            </td>
            <td>
                3.5+
            </td>
            <td>
                5.0+
            </td>
            <td>
                5.0+
            </td>
            <td>
                10.6+
            </td>
            <td>
                3.0+
            </td>
            <td>
                2.0+
            </td>
        </tr>
    </tbody>
</table>

## Enséñame el código
El "*API*" tiene su propiedad `navigator` y su objeto `.geolocation` , un ejemplo con eso seria:

    function get_location(){
        navigator.geolocation.getCurrentPosition(show_map);
    }
   
Este código no contiene alguna detección de errores,sin embargo se puede usar "*Modernizr*" para hacer ese trabajo.

    function get_location{
        if(Modernizr.geolocation){
            navigator.geolocation.getCurrentPosition(show_map);
        }else{
            //no native support; maybe try Gears?
        }
    }

La geolocalización es opcional y los navegadores no tomaran tu ubicación física sin tu consentimiento.

Lo que hace la siguiente función es para garantizar la obtención de la latitud y longitud mediante una llamada de devolución.
   
    function show_map(position){
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;
    }
    
El atributo "***coords***" tiene como propiedad la latitud y longitud el cual es la ubicación exacta del usuario.

##### Tabla de propiedades con valores (rescatada del libro de HTML5)


<table>
    <thead>
        <tr>
            <th>
                Property
            </th>
            <th>
                Type
            </th>
            <th>
                Notes
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                coords.latitude
            </td>
            <td>
                double
            </td>
            <td>
                decimal degrees
            </td>
        </tr>
        <tr>
            <td>
                coords.longitude
            </td>
            <td>
                double
            </td>
            <td>
                decimal.degrees
            </td>
        </tr>
        <tr>
            <td>
                coords.altitude
            </td>
            <td>
                double or null
            </td>
            <td>
                meters above the reference ellipsoid
            </td>
        </tr>
        <tr>
            <td>
                coords.accuracy
            </td>
            <td>
                double
            </td>
            <td>
                meters
            </td>
        </tr>
        <tr>
            <td>
                coords.altitudeAccuracy
            </td>
            <td>
                double or null 
            </td>
            <td>
                meters
            </td>
        </tr>
        <tr>
            <td>
                coords.heading
            </td>
            <td>
                double or null
            </td>
            <td>
                degrees clockwise from true north
            </td>
        </tr>
        <tr>
            <td>
                coords.speed
            </td>
            <td>
                double or null
            </td>
            <td>
                meters/second
            </td>
        </tr>
        <tr>
            <td>
                timestamp
            </td>
            <td>
                DOMTimeStamp
            </td>
            <td>
                like a Date() object
            </td>
        </tr>
    </tbody>
</table>

Las únicas propiedades que garantizan una devolución de datos son:
* **.latitude**
* **.longitude**
* **.accuracy**

## Manejo de errores

En el caso de que el usuario no permita acceder a la ubicación suele haber errores ,para resolver eso se crea una función donde se tome decisión de lo que hacer en esos casos

    navigator.geolocation.getCurrentPosition(show_map, handle_error);
    
La función se llamara con algún objeto de PositionError.

##### Tabla de PositionError Object (Rescatada del libro de HTML5)

<table>
    <thead>
        <tr>
            <th>
                Propiety
            </th>
            <th>
                Type
            </th>
            <th>
                Notes
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                code
            </td>
            <td>
                short
            </td>
            <td>
                an enumerated value
            </td>
        </tr>
        <tr>
            <td>
                message
            </td>
            <td>
                DOMString
            </td>
            <td>
                not intended for end users
            </td>
        </tr>
    </tbody>
</table>

La propiedad "*code*" dará alguno de los siguientes resultados:

* **PERMISSION_DENIED**:Si el usuario niega la ubicación
* **POSITION_UNAVAILABLE**:En el caso de que la red no funcione 
* **TIMEOUT**:Cuando tarda demasiado en calcular la posición del usuario

##### FUNCIÓN

    function handle_error(err){
        if(err.code==1){
            //user said NO!
        }
    }
    
## Opciones, quiero opciones

Para localizar dispositivos móviles tienen 2 métodos para poder ser localizados:

1. El primer método:Se localiza por antenas celulares las cuales detecta las mas cercanas y triangula la posición , aun así no es tan exacta.

1. El segundo método utiliza hardware ,para comunicarse mediante un dispositivo "*GPS*" un chip generalmente, sin embargo este consume mucha energía.

Aun así todo depende de la aplicación que se use ya que hay algunas que no requieren tanta precisión para funcionar.

La función `getCurrentPosition()` también tiene un objeto llamado "*Position Options*" el cual se puede configurar, aunque son opcionales.

##### Ejemplo de implementación:

    navigator.geolocation.getCurrentPosition(show_map, handle_error,options);
    
    
##### Tabla de PositionOptions Object (Rescatada del libro de HTML5)

<table>
    <thead>
        <tr>
            <th>
                Number
            </th>
            <th>
                Property
            </th>
            <th>
                Type
            </th>
            <th>
                Default
            </th>
            <th>
                Notes
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                1
            </td>
            <td>
                <strong>  
                    enableHighAccuracy
                </strong>
            </td>
            <td>
                Boolean
            </td>
            <td>
                false
            </td>
            <td>
                true might be slower
            </td>
        </tr>
        <tr>
            <td>
                2
            </td>
            <td>
                <strong>
                    timeout
                </strong>
            </td>
            <td>
                long
            </td>
            <td>
                (no default)
            </td>
            <td>
                in milliseconds
            </td>
        </tr>
        <tr>
            <td>
                3
            </td>
            <td>
                maximunAge
            </td>
            <td>
                long
            </td>
            <td>
                0
            </td>
            <td>
                in milliseconds
            </td>
        </tr>
    </tbody>
</table>

Cada propiedad tiene su función y de cada una es:
* **enableHighAccuracy**: Esta permite que si el usuario de permiso de acceder a su ubicación exacta, esta función intentara proporcionarla.

* **timeout**: Esta es la que indica la cantidad de milisegundos que la pagina web esperara para obtener la ubicación ,iniciando cuando el usuario conceda el permiso de acceso.

* **maximunAge**: Esta hace que si el dispositivo tiene alguna posición almacenada en caché dependiendo la cantidad de tiempo que sea especificada como valor, si se encuentra dentro de ese rango, esa ubicación sera enviada por el mismo dispositivo.

##### Implementado quedaría así

    const options = {
        enableHighAccuracy: true , 
        timeout: 5000 ,
        maximunAge: 500 ,
    };
  
En caso de se ocupe continuamente la ubicación del usuario es mas viable ocupar `watchPosition()`

#### watchPosition() 
Usa la misma estructura de `getCurrentPosition()` la diferencia es que este realizara la llamada cada que el usuario cambie de ubicación.

Se complementa con `watchClear()` para dejar de observar el cambio de ubicación del usuario.

## Geo.js al rescate

Este es una biblioteca de JS de código abierto , el cual suaviza las diferencias entre los distintos "*geolocation API*". 
  
Para utilizarla se agregan 2 elementos `<script>` dentro del código:

`NOTA: Los <script> no se deben colocar en la etiqueta <head> ya que esto hace que pa pagina cargue mas lento`
    
```html
        <!DOCTYPE html>
        <html>
            <head>
                <meta 
                    charset="utf-8"
                >
                <title>
                    Dive into HTML5
                </title>
            </head>
            <body>
                <script 
                    src="gears_init.js"
                />
                <script 
                    src="geo.js"
                />
            </body>
        </html>
```
