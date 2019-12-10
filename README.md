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
    --url http://10.10.10.10:3000/sesiones \
    --header 'accept: application/json' \
    --header 'authorization: Bearer ' \
    --header 'content-type: application/json' \
    --data '{
    "data": {
      "type": "authentication",
      "attributes": {
  			"u": "gabbraneiro",
  			"p": "421954"
  		}
    }
  }'
  ```

  ```
  # POST /usuarios
  curl --request POST \
    --url http://10.10.10.10:3000/usuarios \
    --header 'accept: application/json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NzU5MjczMTJ9.xoYbtS5Laeo5AzVyYUXeorB5ZAah1HYhu76AE_Ni7Zg' \
    --header 'content-type: application/json' \
    --data '{
    "data": {
      "type": "user",
      "attributes": {
  			"username": "testing_ruby",
  			"password": "123xxx"			
  		}
    }
  }'
  ```

  ```
  # GET /productos
  curl --request GET \
    --url 'http://10.10.10.10:3000/productos?q=all' \
    --header 'accept: application/json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NzU2NTU4NTl9.YEvKsvWDDIwLWdEjkqYcr5XZq2ZCUdgOc5YGgz7T1AU' \
    --header 'content-type: application/json'
  ```

  ```
  # GET /productos/:codigo
  curl --request GET \
    --url http://10.10.10.10:3000/productos/ZED124386 \
    --header 'accept: application/json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NzU2NTU4NTl9.YEvKsvWDDIwLWdEjkqYcr5XZq2ZCUdgOc5YGgz7T1AU' \
    --header 'content-type: application/json'
  ```

  ```
  # GET /productos/:codigo/items
  curl --request GET \
    --url http://10.10.10.10:3000/productos/ZED124386/items \
    --header 'accept: application/json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NzU0ODI5MTJ9.zLmCS8UOXspblSqQBA4GdB9KdOSfbkxhGKoNwaiFsIA' \
    --header 'content-type: application/json'
  ```

  ```
  # POST /productos/:codigo/items
  curl --request POST \
    --url http://10.10.10.10:3000/productos/ZED124386/items \
    --header 'accept: application/json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NzU0ODI5MTJ9.zLmCS8UOXspblSqQBA4GdB9KdOSfbkxhGKoNwaiFsIA' \
    --header 'content-type: application/json' \
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
    --header 'accept: application/json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NzU5Mzg1NDZ9.7h9RhKrOtdunkb8dl8b7yy59fUxsBRCjlYK3eaV7pW8' \
    --header 'content-type: application/json'
  ```

  ```
  # GET /reservas/:id
  curl --request GET \
    --url http://10.10.10.10:3000/reservas/10 \
    --header 'accept: application/json' \
    --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NzU5Mzg1NDZ9.7h9RhKrOtdunkb8dl8b7yy59fUxsBRCjlYK3eaV7pW8' \
    --header 'content-type: application/json'
  ```

  ```
  # POST /reservas
  curl --request POST \
    --url http://10.10.10.10:3000/reservas \
    --header 'accept: application/json' \
    --header 'authorization: Bearer  eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NzU5NDA0MTB9.x44foR2x7WkxzZ5CrVvF7JCSxR5vS8WOf8-Yf3rC9-8' \
    --header 'content-type: application/json' \
    --data '{
  	"data": {
  		"type": "reservation",
  		"attributes": {
  			"date": "2019-07-05",
  			"client_id": 2,
  			"user_id": 2,
  			"reservation_details": [
  				{
  					"product_id": 4,
  					"quantity": 2
  				}
  			]
  		}
  	}
  }'
  ```

  ```
  # PUT /reservas:id/vender
  curl --request PUT \
    --url http://10.10.10.10:3000/reservas/30/vender \
    --header 'accept: application/json' \
    --header 'authorization: Bearer  eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NzU5NDA0MTB9.x44foR2x7WkxzZ5CrVvF7JCSxR5vS8WOf8-Yf3rC9-8' \
    --header 'content-type: application/json'
  ```


    ```
    # GET /ventas
    curl --request GET \
      --url http://10.10.10.10:3000/ventas \
      --header 'accept: application/json' \
      --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NzU5NDIyOTZ9.BWFozM_Ja5EFfculCeDpmRaQbwM4ToaVtWK5vLYdyP8' \
      --header 'content-type: application/json'
    ```

    ```
    # POST /ventas
    curl --request POST \
      --url http://10.10.10.10:3000/ventas \
      --header 'accept: application/json' \
      --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NzU5MjkwMDB9.oxaw3LAjMHfGuNrAxXb8lL8AwY-GF_tV5N0b86LOJTc' \
      --header 'content-type: application/json' \
      --data '{
      "data": {
        "type": "sell",
        "attributes": {
    			"date": "2019-07-05",
    			"client_id": 1,
    			"user_id": 2,
    			"sell_details": [
    				{"product_id":4, "quantity": 2}
    			]
    		}
      }
    }'
    ```
