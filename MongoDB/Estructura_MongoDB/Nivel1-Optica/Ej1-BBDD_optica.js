db.createCollection("clientes");

db.clientes.insertMany([
  {
    _idCliente: 134,
    nombre: "Manuel Lopez Obrador",
    direccion: "Calle La Rambla, 123",
    telefono: "966341289",
    email: "manuelop@gmail.com",
    fechaRegistro: "2022-11-02",
    gafasCompradas: [
      {
        marca: "Rayban",
        graduacion: [0.75, 0.5],
        colorCristales: ["marron", "gris"],
        tipoMontura: "flotante",
        precio: 133,
      },
      {
        marca: "Gucci",
        graduacion: [1.25, 0.75],
        colorCristales: ["verde", "azul"],
        tipoMontura: "pasta",
        precio: 179,
      },
      {
        marca: "Prada",
        graduacion: [0.5, 0.25],
        colorCristales: ["marron", "gris"],
        tipoMontura: "pasta",
        precio: 159,
      },
    ],
  },
  {
    _idCliente: 246,
    nombre: "Maria Sanchez",
    direccion: "Calle Principal, 456",
    telefono: "966987654",
    email: "marias@gmail.com",
    fechaRegistro: "2022-10-20",
    gafasCompradas: [
      {
        marca: "Oakley",
        graduacion: [1.0, 0.75],
        colorCristales: ["negro", "gris"],
        tipoMontura: "flotante",
        precio: 149,
      },
      {
        marca: "Prada",
        graduacion: [0.25, 0.25],
        colorCristales: ["azul", "gris"],
        tipoMontura: "pasta",
        precio: 199,
      },
    ],
  },
  {
    _idCliente: 358,
    nombre: "Juan Perez",
    direccion: "Calle Secundaria, 789",
    telefono: "966654321",
    email: "juanperez@gmail.com",
    fechaRegistro: "2022-09-15",
    gafasCompradas: [
      {
        marca: "Nike",
        graduacion: [0.5, 0.5],
        colorCristales: ["verde", "gris"],
        tipoMontura: "flotante",
        precio: 169,
      },
      {
        marca: "Rayban",
        graduacion: [0.75, 0.75],
        colorCristales: ["marron", "gris"],
        tipoMontura: "metalica",
        precio: 159,
      },
    ],
  },
]);
