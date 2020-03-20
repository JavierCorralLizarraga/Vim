# Vim
Que puedo aconsejar para aprender vim
* Lee la documentación de forma constante donde te atores, es bastante buena y bien estructurada 
* Haz una cheatsheet con los comandos basicos 
* Obligate a usar los comandos de vim (no las flechitas)
* Prueba con los setups de otras personas

### vimrc
Este es mi archivo __.vimrc__ con toda mi configuración, lo que hace cada linea estara comentado justo despues de esta

Si no saben que es un vimrc [aqui](https://vim.fandom.com/wiki/Open_vimrc_fil) pueden encontrarlo

Para instalarlo dependiendo de su version de vim, puede ser necesario que creen el archivo en su path con este nombre especifico o solo modificar el que tiene ya de template

Entre las features mas relevantes que tiene son:
 1. conteo de lineas relativo (dice el numero de la linea donde estas parado y el numero de lineas entre la que estas actualmente y cualquier otra en el archivo) 
 2. soporte para el clipboard de windows (usualmente vim usa su propio buffer para copiar y pegar, pero con lo configure de forma que si presionas __\y__ se copia todo tambien al buffer de windows y si quieres pegar algo del buffer de windows es cuestion de utilizar __\p__
 3. navegacion por guias
  * mi vim tiene varios snippets para trabajar con markdown y tener soporte para el ambiente de latex en algunos de los sabores de markdown, y muchos de ellos al tener lugares a los que tengo que ir despues de haber insertado el texto que le da estructura al comando tienen guias para poder acceder a estos espacios de forma mas sencilla, especificamente presionando seguidamente 2 veces la tecla de _espacio_
 4. acceso sencillo al vimrc para modificaciones rapidas
  * suelo hacer pequeños cambios en mi vimrc con frecuencia, especialmente cuando estaba desarrollando mis snippets para latex, para esto cree un snippet para acceder a mi vimrc de forma rapida tan solo presionando __\vim__ 
