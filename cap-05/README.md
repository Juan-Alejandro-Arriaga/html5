# Video en la web

## Contenedores de video

Los archivos de video como *"AVI"* o *"MP4"* son formatos de contenedores que definen como almace-nar cosas dentro de ellos.

Suelen tener varias pistas  y estas son:
* **"Audio"**:No contiene video
* **"Video"**:No contiene audio

Estas contienen marcadores con los cuales se sincronizan audio y video ,cada uno puede tener distintos metadatos ,al igual que los contenedores.

Algunos formatos de video mas populares son:

* **MPEG 4**:También conocido como .mp4 o .m4v basado en el antiguo contenedor QuickTime de Apple
* **Flash Video**:Con extensión .flv ,este era el único formato que Flash admitía ,sin embargo actualmente Flash ya soporta MPEG 4
* **Ogg**:Con extensión .ovg ,el video es llamado ***"Theora"*** y el audio es llamado ***"Vorbis"*** , este esta disponible para todos los sistemas operativos de fabrica como "*Linux*", "*Mac*" y "*Windows*".
* **WebM**: Esta destinado a su uso exclusivo con "*VP8 codec*" y "*Vorbis audio codec*" ,es compatible con ultimas versiones de "*Google Chome*", "*Mozilla Firefox*" y "*Opera*"
* **Audio Video Interleave**: Fue creado por Microsoft ,es el formato predeterminado para codificadores como *"MEncoder"*

## Video Codecs
El contenedor decide como almacenar las secuencias de video y audio en un mismo formato

Al reproducir un video , el navegador hace las siguientes cosas:
1. Averigua que pistas de video y audio están disponibles dentro del archivo.
1. Decodifica la transmisión de video y muestra una serie de imágenes en la pantalla.
1. Decodifica la transmisión de audio y envía el sonido a los altavoces.

El "*codec*" de video especifica como un algoritmo que codifica una secuencia de video ,es una combinación de las palabras "*codificador*" y "*decodificador*" ,para facilitar la reproducción de estos la mayoría de "*codecs*" usa trucos como almacenar solo las diferencias entre fotogramas.

Existen 2 tipos de "*codecs*" de video:
* **Con perdida**:Dentro de este la información se pierde durante la "*codificación*",sin embargo ofrecen excelentes tasa de comprensión suavizando bloques

* **Sin perdida**:Este tipo es muy grande para ser usado en la web

Los 3 "*codecs*" mas relevantes son "**H.264**","**Theora**" y "**VP8**"

### H.264
Se le conoce de distintas maneras como:
* "**MPEG-4 part 10**"
* "**MPEG-4 AVC**"
* "**MPEG-4 Advanced Video Coding**"

Tiene como objetivo proporcionar un "*codec*" para dispositivos con bajo ancho de banda y bajo consumo de CPU (teléfonos móviles) y para dispositivos de alto ancho de banda y bajo consumo de CPU (computadoras) 

La mayoría de dispositivos que no son PC reproducen video "**H.264**"  y tienen su propio chip para decodificar ya que su "*CPU*" principal no son los suficientemente capaces 

### Theora
Su tipo de video se puede incrustar en cualquier formato de contenedor ,lo común es "***Ogg***" , se puede reproducir en cualquier plataforma sin complementos específicos.

### VP8

Es un "*codec*" de video de "*0n2*" y produce una salida equivalente a "*H.264 High Profile*" con una "*decodificación*" sencilla equivalente a "*H.264 Baseline*"

En 2010 se abrieron las patentes para otorgar la licencia libre de regalías.

## Audio Codecs
Estos son algoritmos los cuales codifican una transmision de audio de igual manera con perdida y sin perdida.

El audio se usa en los lugares en los cuales el video no se utiliza el video, "*PBX Asterisk*" puede comprimir el habla humana a una fracción del tamaño de lo que haría algún otro "*codec*" , sin embargo debido a la falta de optimización nunca despegaron  en la web.

El "*codec de audio*" decodifica la transmisión de audio y las convierte en ondas que los altavoces convierten en sonido. 

Generalmente información de pierde durante el ciclo de "***grabación -> codificación -> decodificación -> escucha***" , debido a eso engañan a los oídos para que no haya rastro alguno de que falta alguna parte.

Los sistemas de sonido envolvente están compuestos por diversos canales con bocinas en lugares específicos los cuales hacen que al escuchar te sientas dentro de el ambiente que estas visualizando.

Los "*codecs de audio*" suelen manejar 2 canales de sonido izquierdo y derecho ,en la "*codificación*" ambos canales son almacenados en la misma secuencia de audio , en la "*decodificación*" cada canal se envía a su altavoz respectivo , algunos pueden manejar mas de 2 canales con un registro para poder enviarlos al altavoz correspondiente.

Lo "*codecs*" mas usados y comunes son:
* **MP3**
* **ACC**
* **Vorbis**

### Mpeg Audio Layer 3
Generalmente conocidos como "*MP3*" , solo pueden contener 2 canales de sonido y puede codificar a diferentes "*tasas de bits*" por ejemplo:
* **64kps**
* **128kps**
* **192kps**

 (*kps == kilobits por segundo*)

Entre mayor sea el numero de bits significa que los archivos serán mas grandes aun así no significa que mejore su calidad.

*"MP3"* permite una "*codificación*" de bits variable significando que algunas partes se comprimen mas que otras ,ademas que permiten una "*codificación*" de bits constantes.

### Advanced Audio Coding
Mayor conocido como "*ACC*" puede "*codificar*" hasta 48 canales de sonido, ademas que define múltiples perfiles los de "**baja complejidad**"
que permite reproducirse en dispositivos con "*CPU limitada*" y los perfiles mas altos ofrecen una mejor calidad de sonido.

### Vorbis
Se le suele llamar "*Ogg Vorbis*" (aunque esta mal dicho porque *ogg* es un contenedor), se puede incrustar en contenedores como:
* **Ogg**
* **WebM**
* **MP4**
* **MKV**

Y permite una cantidad arbitraria de canales de sonido.

Algunos "*codificadores y decodificadores*" de "*Vorbis*" son:
* **Ogg Convert (codificador)**
* **ffmpeg (decodificador)**

## Que funciona en la web
HTML5 contiene la etiqueta `<video>` que sirve para incrustar un video en la web ,con la capacidad de vincular varios archivos y el navegador decidirá cual ocupara. 

**Tablas rescatadas del libro de HTML5 de Mark Pilgrim**

### Compatibilidad con códecs de vídeo en los navegadores de lanzamiento
<table>
    <thead>
        <tr>
            <th>
                Codecs/Containers
            </th>
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
                Theora+Vorbis+Ogg
            </td>
            <td>
                -
            </td>
            <td>
                3.5+
            </td>
            <td>
                †
            </td>
            <td>
                5.0+
            </td>
            <td>
                10.5+
            </td>
            <td>
                -
            </td>
            <td>
                -
            </td>
        </tr>
        <tr>
            <td>
                H.264+AAC+MP4
            </td>
            <td>
                -
            </td>
            <td>
                -
            </td>
            <td>
                3.0+
            </td>
            <td>
                5.0-?‡
            </td>
            <td>
                -
            </td>
            <td>
                3.0+
            </td>
            <td>
                2.0+
            </td>
        </tr>
        <tr>
            <td>
                WebM
            </td>
            <td>
                -
            </td>
            <td>
                -
            </td>
            <td>
                †
            </td>
            <td>
                6.0+
            </td>
            <td>
                10.6+
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

### Compatibilidad con códecs de vídeo en los próximos navegadores
<table>
    <thead>
        <tr>
            <th>
                Codecs/Containers
            </th>
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
                Theora+Vorbis+Ogg
            </td>
            <td>
                -
            </td>
            <td>
                3.5+
            </td>
            <td>
                †
            </td>
            <td>
                5.0+
            </td>
            <td>
                10.5+
            </td>
            <td>
                -
            </td>
            <td>
                -
            </td>
        </tr>
        <tr>
            <td>
                H.264+AAC+MP4
            </td>
            <td>
                9.0+
            </td>
            <td>
                -
            </td>
            <td>
                3.0+
            </td>
            <td>
                -
            </td>
            <td>
                -
            </td>
            <td>
                3.0+
            </td>
            <td>
                2.0+
            </td>
        </tr>
        <tr>
            <td>
                WebM
            </td>
            <td>
                9.0+
            </td>
            <td>
                4.0+
            </td>
            <td>
                †
            </td>
            <td>
                6.0+
            </td>
            <td>
                10.6+
            </td>
            <td>
                -
            </td>
            <td>
                2.3‡
            </td>
        </tr>
    </tbody>
</table>

<br>

### Codificación de video con MIRO VIDEO CONVERTER
Es un programa de código abierto para "*codificar*" videos en múltiples formatos ,admite todos los formatos de salida mencionados, funciona para MacOs X y para Windows.

### Codificación de video Ogg con Firefrogg
Firefogg es una extensión de Firefox de código abierto. Para utilizarla, deberá instalar Mozilla Firefox 3.5 o posterior y, a continuación, visitar "*firefogg.org.*"

## Batch Encoding Ogg Video with ffmpeg2theora

"*ffmpeg2Theora*" es una aplicacion de código abierto para codificar videos "*Ogg*" siendo que puede usar cualquier tipo de video como entrada.

Para usarlo debe llamarlo desde la linea de comandos, posee una diversa cantidad de indicadores para comandos (para verlos todos escribir `ffmpeg2theora --help`)

## Codificación de video H.264 con Handbrake
La forma mas sencilla de "*codificación*" con "*H.264*" es usando "*HandBrake*"

Existen 2 versiones 
* **Gráfica**
* **Linea de comandos**

## Batch Encoding H.264 Video with HandBrake
"*HandBrake*" tiene su versión de línea de comandos ,para leer sobre ellos se debe escribir `HandBrakeCLI --help`  

Un ejemplo de comando seria:
* `--preset "X"`:donde "X" es el nombre de algún preajuste de "*HandBrake*"

## At last ,The MARKUP
Existen 2 formas de incluir un video a pagina web ambas implican el uso de la etiqueta `<video>` por ejemplo:

#### **Con solo 1 archivo de video**
```html  
    <video 
        src="pr6.webm"
    />
```    
Se debe establecer el ancho y el alto en la etiqueta ,el navegador centrara el video dentro del cuadro definido por la etiqueta `<video>` sin dejar que se estire o se aplaste.

Con HTML, CSS y JS puedes crear tu propia interfaz de controles para los videos ya que de forma predeterminada no contiene controles , así que nos da la posibilidad de nosotros crearlos o usar los ya hechos por el navegador. 

Hay 2 atributos opcionales:
* **Preload**: Descarga el archivo de video al instante que carga la pagina.
* **Autoplay**: Hace que el archivo de video se comience a reproducir al instante que termine de descargarlo.

Sin embargo se pueden usar funciones de JS para realizar esas acciones

####  **Con 3 archivos de video**
```html 
    <video>
        <source 
            src="pr6.mp4"  
            type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"'
        >
        <source 
            src="pr6.webm" 
            type='video/webm; codecs="vp8, vorbis"'
        >
        <source 
            src="pr6.ogv"  
            type='video/ogg; codecs="theora, vorbis"'
        >
    </video>
```
Explicado eso quedaría así:

* `<source>`:Vincula a un solo archivo de video
    * `scr="pr6.mp4"`:Se usa para vincular el archivo
    * `type="'video/mp4; codecs="avc1.42E01E, mp4a.40.2"'"`:Especifica el formato del contenedor ,el "*codec*" del video y el "*codec*" del audio