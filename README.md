![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Lab | Introducción a MySQL

## Introducción

Como experto en datos, trabajas en una empresa de concesionarios de automóviles que vende coches nuevos de diversas marcas y modelos. Tu empresa es pequeña y nueva, pero tiene sucursales en varios países. Desde la fundación de la empresa, tus colegas han vendido varios coches a los clientes. Ahora tu jefe se ha dado cuenta de que tu empresa necesita imperativamente una base de datos para mantener registros sobre los coches, vendedores, clientes y facturas. Tu jefe confía mucho en ti, por lo que te ha asignado el desafío de diseñar, crear y gestionar la base de datos.

## Desafío 1 - Diseñar la Base de Datos

Usando papel y lápiz (o software de computadora si eres hábil creando diagramas digitales), diseña una base de datos que cumpla con los requisitos mínimos de tu jefe. La información mínima que se debe registrar se describe a continuación:

1. **Coches** - por ejemplo, el número de identificación del vehículo (VIN), fabricante, modelo, año y color de los coches en el inventario de tu empresa.
2. **Clientes** - por ejemplo, la ID del cliente, nombre, número de teléfono, correo electrónico, dirección, ciudad, estado/provincia, país y código postal de los clientes.
3. **Vendedores** - por ejemplo, la ID del personal, nombre y la tienda de tu empresa.
4. **Facturas** - por ejemplo, el número de factura, fecha, coche, cliente y vendedor relacionado con cada venta de coche.

Antes de resolver este desafío, revisa tu lección sobre estructura y diseño de bases de datos y pregúntate:

* **¿Qué entidades y atributos deben incluirse en la base de datos?**
	* Para cada atributo, ¿qué tipo de datos es más adecuado?
	* Ten en cuenta que en MySQL típicamente cada tabla de entidad debe tener un ID numérico autoincremental. El ID autoincremental es diferente del ID del cliente o del personal.
	* También ten en cuenta que algunos atributos son obligatorios mientras que otros pueden estar en blanco.

* **¿Cuáles son las relaciones entre estas entidades? ¿Qué relaciones son uno a uno, uno a muchos, muchos a muchos?**

* **¿Cómo puedes usar claves foráneas para normalizar tu diseño de base de datos?**

El producto final de este desafío debería parecerse algo a lo de abajo, aunque no tiene que ser tan complicado:

![ERD](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/data-static/images/erd.png)

Si usas papel y lápiz para crear el diseño, toma una foto con tu teléfono y envía la imagen a ti mismo. Si usas software para crear el diagrama de la base de datos, exporta en formato de imagen (JPG o PNG). De cualquier manera, la imagen se presentará como uno de los entregables.

## Desafío 2 - Crear la Base de Datos y las Tablas

1. **Crea una base de datos MySQL para este laboratorio.** Puedes hacerlo en la línea de comandos de esta manera:

	```bash
	$ mysql -u your_username -p
	mysql> CREATE DATABASE lab_mysql;
	Query OK, 1 row affected (0.02 sec)
	mysql> USE lab_mysql;
	Database changed
	```

*Nota: Si has configurado una contraseña para el usuario de la base de datos, necesitas incluir `-p` en el comando de conexión de MySQL. Al presionar enter, MySQL te pedirá que introduzcas la contraseña. Si no configuraste una contraseña para el usuario de la base de datos, no necesitas incluir `-p` en el comando de conexión.*

1. **Ahora, basándote en el diseño de base de datos que creaste, escribe la consulta SQL para crear las tablas y columnas.** Usarás la instrucción `CREATE TABLE` para la cual puedes encontrar referencia [aquí](https://dev.mysql.com/doc/refman/8.0/en/creating-tables.html).

	Puedes probar tu instrucción `CREATE TABLE` tanto en la línea de comandos de SQL como en el software de base de datos que instalaste (por ejemplo, Sequel Pro o MySQL Workbench). Recuerda que después de crear cada tabla, necesitas eliminarla para probar la misma instrucción `CREATE TABLE` de nuevo.

1. **Después de escribir y probar todas las instrucciones, crea un archivo de texto con el nombre `create.sql`**. Al principio del archivo, indica qué base de datos quieres usar, por ejemplo:

	```mysql
	USE lab_mysql;
	```

1. **Luego de la declaración `USE`, escribe todas tus sentencias `CREATE TABLE`.** Necesitarás una declaración `CREATE TABLE` para cada tabla que decidas crear. Asegúrate de terminar cada declaración con un punto y coma.

Este archivo `.sql` será uno de tus entregables. Un archivo `.sql` es utilizado a menudo por ingenieros de software/datos para automatizar operaciones de bases de datos. Por ejemplo, para ejecutar todos los comandos en el archivo `create.sql`, simplemente puedes ejecutar `source create.sql;` en la línea de comandos de MySQL. Muchos lenguajes de programación como Python y PHP también pueden ejecutar archivos `.sql`.

## Desafío 3 - Poblando la Base de Datos

El propósito de *poblar la base de datos* es proporcionar algunos datos ficticios para una base de datos vacía para que el desarrollo de software pueda comenzar basado en estos datos ficticios. En este desafío crearás **`seeding.sql`** que inserta filas de datos ficticios en las tablas de tu nueva base de datos.

Usarás la sentencia `INSERT INTO` para este propósito. Puedes referirte a un tutorial [aquí](https://dev.mysql.com/doc/refman/8.0/en/insert.html).

Para tu conveniencia, te proporcionamos algunos datos ficticios de ejemplo. Estos datos ficticios pueden no funcionar directamente con tu base de datos dependiendo de cómo hayas diseñado tu base de datos. Puede que necesites cambiarlos a la forma apropiada.

### Coches

| ID | VIN | Fabricante | Modelo | Año | Color |
| --- | --- | --- | --- | --- | --- |
| 0 | 3K096I98581DHSNUP | Volkswagen | Tiguan | 2019 | Azul |
| 1 | ZM8G7BEUQZ97IH46V | Peugeot | Rifter | 2019 | Rojo |
| 2 | RKXVNNIHLVVZOUB4M | Ford | Fusion | 2018 | Blanco |
| 3 | HKNDGS7CU31E9Z7JW | Toyota | RAV4 | 2018 | Plata |
| 4 | DAM41UDN3CHU2WVF6 | Volvo | V60 | 2019 | Gris |
| 5 | DAM41UDN3CHU2WVF6 | Volvo | V60 Cross Country | 2019 | Gris |

### Clientes

| ID | ID de Cliente | Nombre | Teléfono | Correo | Dirección | Ciudad | Estado/Provincia | País | Postal |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 0 | 10001 | Pablo Picasso | +34 636 17 63 82 | - | Paseo de la Chopera, 14 | Madrid | Madrid | España | 28045 |
| 1 | 20001 | Abraham Lincoln | +1 305 907 7086 | - | 120 SW 8th St | Miami | Florida | Estados Unidos | 33130 |
| 2 | 30001 | Napoléon Bonaparte | +33 1 79 75 40 00 | - | 40 Rue du Colisée | París | Île-de-France | Francia | 75008 |

### Vendedores

| ID | ID de Personal | Nombre | Tienda |
| --- | --- | --- | --- |
| 0 | 00001 | Petey Cruiser | Madrid |
| 1 | 00002 | Anna Sthesia | Barcelona |
| 2 | 00003 | Paul Molive | Berlín |
| 3 | 00004 | Gail Forcewind | París |
| 4 | 00005 | Paige Turner | Mimia |
| 5 | 00006 | Bob Frapples | Ciudad de México |
| 6 | 00007 | Walter Melon | Ámsterdam |
| 7 | 00008 | Shonda Leer | São Paulo |

### Facturas

| ID | Número de Factura | Fecha | Coche | Cliente | Vendedor |
| --- | --- | --- | --- | --- | --- |
| 0 | 852399038 | 22-08-2018 | 0 | 1 | 3 |
| 1 | 731166526 | 31-12-2018 | 3 | 0 | 5 |
| 2 | 271135104 | 22-01-2019 | 2 | 2 | 7 |

## Desafío Adicional - Actualizar y Eliminar Registros de la Base de Datos

Ahora encuentras un error que necesitas corregir en tus datos existentes: en la tabla de Vendedores, escribiste erróneamente *Mimia* en lugar de *Miami* para Paige Turner. Además, has recibido las direcciones de correo electrónico de los tres clientes:

| Nombre | Correo |
| --- | ---|
| Pablo Picasso | ppicasso@gmail.com |
| Abraham Lincoln | lincoln@us.gov |
| Napoléon Bonaparte | hello@napoleon.me |

Crea **`update.sql`** para actualizar tus datos existentes.

Además, también encuentras una entrada duplicada del coche para el VIN `DAM41UDN3CHU2WVF6`. Quieres eliminar el coche ID #4 de la base de datos. Crea **`delete.sql`** para realizar la eliminación.

## Entregables

- Tu diagrama de estructura de base de datos en forma de imagen.

- `create.sql` y `seeding.sql`

- [OPCIONAL] `update.sql` y `delete.sql`

## Entrega

1. Al completar, añade los entregables a git, haz commit de los cambios, y envía a github. **Asegúrate de enviar a tu propio repositorio bifurcado.**

	```bash
	cd your-code
	git add .
	git commit -m "Soluciones de Lab MySQL"
	git push origin master
	```

1. Navega a tu repositorio bifurcado y crea una Solicitud de Extracción al repositorio de la clase.
	- Si no recuerdas cómo hacer esto, revisa la lección en el Prework titulada *Git Forking*.
	- Además, tu instructor y TA te proporcionarán soporte.

2. Crea una solicitud de extracción con un título siguiendo este formato:  **`[<lab_name>] <your_name>`**
  	- Por ejemplo, si el laboratorio es *lab-mysql* y tu nombre es *Marc Pomar*, el nombre de tu solicitud de extracción debería ser algo así como **`[lab-mysql] Marc Pomar`**.

3. ¡Si has creado la solicitud de extracción con éxito, has terminado! FELICIDADES :)

## References

- [Database seeding](https://en.wikipedia.org/wiki/Database_seeding)
- [MySQL Reference: Creating a Table](https://dev.mysql.com/doc/refman/8.0/en/creating-tables.html)
- [MySQL Reference: INSERT Syntax](https://dev.mysql.com/doc/refman/8.0/en/insert.html)
- [MySQL Reference: UPDATE Syntax](https://dev.mysql.com/doc/refman/8.0/en/update.html)
- [MySQL Reference: DELETE Syntax](https://dev.mysql.com/doc/refman/8.0/en/delete.html)