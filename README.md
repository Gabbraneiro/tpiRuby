# TPI - TTPS Ruby 2019 - UNLP
  Trabajo práctico integrador de Taller de Tecnologias de Produccion de Software(Ruby) - Facultad de informática UNLP

### Requisitos
  - Ruby 2.6.3 o posterior
  - MySQL
  - bundler


### Indicaciones para poner en funcionamiento la aplicación
  1. Clonar el repositorio. `git clone 'https://github.com/Gabbraneiro/tpiRuby.git'`
  2. Instalar las dependencias del proyecto. `bundle install`
  3. Poner en marcha figaro. `bundle exec figaro install`. Esto creara el archivo config/application.yml
  4. Editar el archivo config/application.yml y agregar los siguientes datos.
  ```yml
  database_user: # Usuario usado para conectarse a la Base de Datos.
  database_password: # Contraseña de dicho usuario.
  database_address: # Dirección IP de la Base de Datos.
  ```
  5. Crear la base de datos. `rake db:create`.
  6. Para crear las tablas de debe ejecutar las migraciones. `rake db:migrate`.
  7. Para agregar datos de prueba a la base de datos se debe ejecutar los seeders. `rake db:seed`.
    * Esto agregará 2 clientes, 14 condiciones frente al IVA, 2 usuarios, 20 productos y 10 items disponibles al primer producto creado.
    * Usuario de prueba generado: `username 'jn.cuesta.luengo', password: 'jncuesta'`

  8. Poner en marcha el servidor de rails `rails s`


### Comandos curl

  ```
  # POST /sesiones
  curl --request POST \
    --url http://localhost:3000/sesiones \
    --header 'authorization: Bearer ' \
    --header 'content-type: application/json' \
    --data '{
  	"u": "username",
  	"p": "password"
  }'
  ```
