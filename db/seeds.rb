# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Tipos de responsables
if VatCondition.all.empty?
  VatCondition.create([
      {code: 1, description: "IVA Responsable Inscripto"},
      {code: 2, description: "IVA Responsable no Inscripto"},
      {code: 3, description: "IVA no Responsable"},
      {code: 4, description: "IVA Sujeto Exento"},
      {code: 5, description: "Consumidor Final"},
      {code: 6, description: "Responsable Monotributo"},
      {code: 7, description: "Sujeto no Categorizado"},
      {code: 8, description: "Proveedor del Exterior"},
      {code: 9, description: "Cliente del Exterior"},
      {code: 10, description: "IVA Liberado – Ley Nº 19.640"},
      {code: 11, description: "IVA Responsable Inscripto – Agente de Percepción"},
      {code: 12, description: "Pequeño Contribuyente Eventual"},
      {code: 13, description: "Monotributista Social"},
      {code: 14, description: "Pequeño Contribuyente Eventual Social"}
  ]);
end
# Creacion de productos
if Product.all.empty?
  (1..20).each do |i|
    Product.create({
      code: (0...3).map { rand(9) }.join + (0...6).map { (65 + rand(26)).chr }.join,
      description: "Producto #{i}",
      detail: "Descripcion ampliada del producto numero #{i}",
      amount: rand(0.0..9999.0).truncate(2)
    })
  end
end

# Creacion de usuarios
if User.all.empty?
  User.create([
    {
      username: 'user_1',
      password: 'mypassword'
    },
    {
      username: 'gabbraneiro',
      password: '421954'
    }
  ])
end

# Creacion de clientes
if Client.all.empty?
  Client.create([
    {
      cuit_cuil: '23384547893',
      email: 'patricio.fontanet@edu.ar',
      denomination: 'Patricio Fontanet',
      vat_condition: VatCondition.find_by(code: 5)
    },
    {
      cuit_cuil: '20378954413',
      email: 'ana.tijoux@edu.ar',
      denomination: 'Ana Tijoux',
      vat_condition: VatCondition.find_by(code: 9)
    }
  ])
end
