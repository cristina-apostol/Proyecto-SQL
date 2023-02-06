## Proyecto-SQL [Creación base de datos]

![holi](/images/Videoclub.png)

## Índice

1.[Contexto](#contexto)\
2.[Procedimiento](#procedimiento)\
3.[Consultas](#consultas)


<a name="Contexto"/>

## Contexto 

Un antiguo videoclub desea volver a ofrecer sus servicios al publico y decide contratar a un analista de datos para llevar a cabo la creación del esqueleto de su negocio.

Se parte de la raíz de que aun mantiene una antigua base de datos que contiene información relevante para el proyecto como el catalógo de películas que ofrece, su anterior cartera de clientes, antiguos inventarios y otra información importante para la investigación.

Por tanto, la idea de este proyecto es crear una nueva base de datos para la apertura de un nuevo videoclub, partiendo de la información facilitada por el cliente.

<a name="Procedimiento"/>

## Procedimiento

<details>

<summary>Importar antigua base de datos a Python</summary>

<br>

Se han importado a Python los siete archivos csv localizados en la carpeta data, que fueron los datos facilitados por el cliente de su antigua base de datos para comenzar a construir el esqueleto del nuevo negocio.
Estos archivos contenían las siguientes tablas:

- Actors

- Films

- Lenguage 

- Category

- Inventory

- Old_HDD

- Rental

<br></details>

<details>

<summary>Limpieza de datos</summary>

<br>

En este paso, se han analizado y explorado todas las tablas mencionadas anteriormente con diferentes métodos de la libreria de Pandas, de manera que se han conservado aquellas que tenían mayor relevancia para el futuro proyecto, y se ha realizado una limpieza de todos los datos que contenían para que el resultado fueran tablas con datos homogéneos.
 
En primer lugar, las tablas `actors`, `films`, `category` y `language` han conservado practicamente todos sus datos, excepto la columa last_update, que no era relevante para la estructrua de la base de datos.
Estas columnas contenian datos importantes como, el id de cada tabla, los nombres, idioma de las pelicuas y las categorias.

Por otro lado, en cuanto a la columna `inventory`, como solo contenía cierta cantidad del total de películas, concretamente 223, se han añadido las restantes de la tabla films que faltaban en inventory, ya que se ha considerado que si se ofrece en el catalógo de películas, se tendría al menos una de cada.

En cuanto a la tabla `old_HDD`,ofrecía información bastante valiosa ya que relacionaba actores con las diferentes películas en las que aparecían y su categoría. Por tanto se ha tomado esta tabla como base referencia para relacionar en SQL films-actors y films-category.

Por último, se ha decidio prescindir de los datos que contenía la tabla `rental`, aunque si se ha mantenido la estructura, puesto que al tratarse de un nuevo negocio estos datos partirían desde cero.


<br></details>


<details>

<summary>Creación base de datos con SQL</summary>

<br>

Tras la realización del paso anterior, se han exportado los datos a SQL y se ha llevado a cabo la creación del diseño que tendría la estructura del nuevo negocio, estableciendo las diferentes relaciones entre cada elemento, e incluyendo algunas tablas nuevas como `staff`, `store` y`customers` para almacenar nuevos datos, una vez inaugurado el local.

Como se ha comentado en el paso anterior, la tabla old_HDD, se ha divido en dos subtablas que serán las foreign keys de category, films y actors.


![holi](/images/esquema_base_datos.png)


<br></details>


<a name="Consultas"/>

## Consultas 

En este apartado, se van a presentar las diferentes querys que se han creado para ofrecer datos interesantes a analizar de la base de datos creada, que se pueden consultar en la carpeta sql.

Las consultas realizadas han sido las siguientes:

1. Cantidad de veces que un actor/actriz ha salido en una determinada categoria de película.

2. Cuantas unidades hay de cada película dentro de inventario.

3. La categoría con más frecuencia.

4. Sobre la categoría con más frecuencia, cual es la duración media de las películas.

5. Actor/actriz que más veces sale en las películas y con que frecuencia.

6. Sobre la actriz con la moda más alta, cuál es el género en el que mas aparece y la cantidad.

7. El coste más elevado por reemplazar una película en caso de extravío.
