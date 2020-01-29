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
  A continuacion se provee un esqueleto base para cada endpoint. En algunos casos se deberan editar y poner datos validos

   ```
  # POST /sesiones
  curl --request POST \
    --url https://tpi-ruby-gabbraneiro.herokuapp.com/sesiones \
    --header 'accept: application/vnd.api+json' \
    --header 'content-type: application/vnd.api+json' \
    --data '{
    "data": {
      "type": "authentication",
      "attributes": {
  			"u": "se_aprueba",
  			"p": "con_7"
  		}
    }
  }'
   ```

   ```
  # POST /usuarios
  curl --request POST \
    --url https://tpi-ruby-gabbraneiro.herokuapp.com/usuarios \
    --header 'accept: application/vnd.api+json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1ODAyMjA2NTh9.ZfazfUXjxDnvuv0xIAY8tqAJ-tW94_izWE-vUJOBmGk' \
    --header 'content-type: application/vnd.api+json' \
    --data '{
  	  "data": {
      "type": "user",
      "attributes": {
  			"username": "se_aprueba",
  			"password": "con_7"			
  		}
    }
  }'
   ```

   ```
  # GET /productos
  curl --request GET \
    --url https://tpi-ruby-gabbraneiro.herokuapp.com/productos \
    --header 'accept: application/vnd.api+json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1ODAxNjU2NjV9.fpUnOHn6QefKXt-9GkEKwqXSkX0n6erRDOHh1QDCbtQ' \
    --header 'content-type: application/vnd.api+json'
   ```

   ```
  # GET /productos/:codigo
  curl --request GET \
    --url http://10.10.10.10:3000/productos/XFS344531 \
    --header 'accept: application/vnd.api+json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1Nzk3MzY1MzF9.VRFXTq8lvpeqe14_n798Fy7GH_pW2HSWhdV8J4DJKvc' \
    --header 'content-type: application/vnd.api+json'
   ```

   ```
  # GET /productos/:codigo/items
  curl --request GET \
    --url http://10.10.10.10:3000/productos/XFS344531/items \
    --header 'accept: application/vnd.api+json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1Nzk2NTQxNzl9.jc9U_7BhVNrX1dxf7DwC7Ue7tRTHDeCqxYcnCC89Gxo' \
    --header 'content-type: application/vnd.api+json'
   ```

   ```
  # POST /productos/:codigo/items
  curl --request POST \
    --url http://10.10.10.10:3000/productos/XFS344531/items \
    --header 'accept: application/vnd.api+json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1Nzk2NTQxNzl9.jc9U_7BhVNrX1dxf7DwC7Ue7tRTHDeCqxYcnCC89Gxo' \
    --header 'content-type: application/vnd.api+json' \
    --data '{
  	"data": {
  		"attributes": {
  			"quantity": 2
  		}
  	}
  }'
   ```

   ```
  # GET /reservas
  curl --request GET \
    --url http://10.10.10.10:3000/reservas \
    --header 'accept: application/vnd.api+json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1Nzk2NTY5MTJ9.sdO10LaLWLRPBGzulhzfdeRv7bf4iDp2vbb6zgDXYFc' \
    --header 'content-type: application/vnd.api+json'
   ```

   ```
  # GET /reservas/:id
  curl --request GET \
    --url http://10.10.10.10:3000/reservas/1 \
    --header 'accept: application/vnd.api+json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1Nzk1NTc0NTF9.oDBSkuxUzUttsDINVvPTrrULRp8fXa7HqgBRCGIBwwI' \
    --header 'content-type: application/vnd.api+json'
   ```

   ```
  # POST /reservas
  curl --request POST \
    --url http://10.10.10.10:3000/reservas \
    --header 'accept: application/vnd.api+json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1ODAyMjU0MDd9.GOAalIIEU51GQUeS9Hxwa4uTYf0ZuVpgTYE-C-7km_A' \
    --header 'content-type: application/vnd.api+json' \
    --data '{
  	"data": {
  		"type": "reservation",
  		"attributes": {
  			"date": "2019-07-05",
  			"client_id": 2,
  			"user_id": 2,
  			"reservation_details": [
  				{
  					"product_id": 1,
  					"quantity": 2
  				}
  			]
  		}
  	}
  }'
   ```

   ```
  # PUT /reservas/:id/vender
  curl --request PUT \
    --url http://10.10.10.10:3000/reservas/7/vender \
    --header 'accept: application/vnd.api+json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1ODAyMjU0MDd9.GOAalIIEU51GQUeS9Hxwa4uTYf0ZuVpgTYE-C-7km_A' \
    --header 'content-type: application/vnd.api+json'
   ```

   ```
  # DELETE /reservas/;id
  curl --request DELETE \
    --url http://10.10.10.10:3000/reservas/1 \
    --header 'accept: application/vnd.api+json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1Nzk2NTc0NTV9.zpJ9n7kLzQnvs4oVK-e7JytFpx5cI6gfANcOx2cxyxA' \
    --header 'content-type: application/vnd.api+json'
  ```

  ```
    # GET /ventas
    curl --request GET \
    --url http://10.10.10.10:3000/ventas \
    --header 'accept: application/vnd.api+json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1ODAyMjU0MDd9.GOAalIIEU51GQUeS9Hxwa4uTYf0ZuVpgTYE-C-7km_A' \
    --header 'content-type: application/vnd.api+json'
  ```

  ```
    # GET /ventas/:Id
    curl --request GET \
    --url http://10.10.10.10:3000/ventas/2 \
    --header 'accept: application/vnd.api+json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1ODAyMjA2NTh9.ZfazfUXjxDnvuv0xIAY8tqAJ-tW94_izWE-vUJOBmGk' \
    --header 'content-type: application/vnd.api+json'
  ```

  ```
    # POST /ventas
    curl --request POST \
    --url http://10.10.10.10:3000/ventas \
    --header 'accept: application/vnd.api+json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1ODAyMjU0MDd9.GOAalIIEU51GQUeS9Hxwa4uTYf0ZuVpgTYE-C-7km_A' \
    --header 'content-type: application/vnd.api+json' \
    --data '{
        "data": {
            "type": "sell",
            "attributes": {
                "date": "2019-07-05",
                "client_id": 1,
                "user_id": 2,
                "sell_details": [
                {
                    "product_id":2,
                    "quantity": 1
                }
                ]
            }
        }
        }'
  ```
