db.createCollection("clientes");

db.clientes.insertMany([
  {
    cliente_id: 134,
    nombre: "Manuel Lopez Obrador",
    direccion: "Calle La Rambla, 123",
    telefono: "966341289",
    email: "manuelop@gmail.com",
    fechaRegistro: "2022-11-02",
    cliente_idRecomendador: 122,
    gafasCompradas: [
      {
        marca: "Rayban",
        graduacion: [0.75, 0.5],
        colorCristales: ["marron", "gris"],
        tipoMontura: "flotante",
        colorMontura: "gris",
        _idEmpleadoVenta: 32,
        fechaVenta: "2022-11-02",
        precio: 133,
        proveedor: {
          "_id": {"$ref": "proveedores", "$id": "f1767562e1a350000000001"}
        },
      },
      {
        marca: "Gucci",
        graduacion: [1.25, 0.75],
        colorCristales: ["verde", "azul"],
        tipoMontura: "pasta",
        colorMontura: "negro",
        _idEmpleadoVenta: 12,
        fechaVenta: "2022-03-13",
        precio: 179,
        proveedor: {
          "_id": {"$ref": "proveedores", "$id": "65aa920d96da87544421e633"}
        },
      },
      {
        marca: "Prada",
        graduacion: [0.5, 0.25],
        colorCristales: ["marron", "gris"],
        tipoMontura: "wayfarer",
        colorMontura: "blanco",
        _idEmpleadoVenta: 22,
        fechaVenta: "2021-08-03",
        precio: 159,
        proveedor: {
          "_id": {"$ref": "proveedores", "$id": "65aa920d96da87544421e634"}
        },
      },
    ],
  },
  {
    cliente_id: 246,
    nombre: "Maria Sanchez",
    direccion: "Calle Principal, 456",
    telefono: "966987654",
    email: "marias@gmail.com",
    fechaRegistro: "2022-10-20",
    cliente_idRecomendador: 133,
    gafasCompradas: [
      {
        marca: "Oakley",
        graduacion: [1.0, 0.75],
        colorCristales: ["negro", "gris"],
        tipoMontura: "flotante",
        colorMontura: "negro",
        _idEmpleadoVenta: 32,
        fechaVenta: "2022-10-20",
        precio: 149,
        proveedor: {
          "_id": {"$ref": "proveedores", "$id": "65aa920d96da87544421e635"}
        },
      },
      {
        marca: "Prada",
        graduacion: [0.25, 0.25],
        colorCristales: ["azul", "gris"],
        tipoMontura: "pasta",
        colorMontura: "negro",
        _idEmpleadoVenta: 12,
        fechaVenta: "2022-01-05",
        precio: 199,
        proveedor: {
          "_id": {"$ref": "proveedores", "$id": "65aa920d96da87544421e634"}
        },
      },
    ],
  },
  {
    cliente_id: 358,
    nombre: "Juan Perez",
    direccion: "Calle Secundaria, 789",
    telefono: "966654321",
    email: "juanperez@gmail.com",
    fechaRegistro: "2022-09-15",
    cliente_idRecomendador: 122,
    gafasCompradas: [
      {
        marca: "Gucci",
        graduacion: [0.5, 0.5],
        colorCristales: ["verde", "gris"],
        tipoMontura: "flotante",
        colorMontura: "negro",
        _idEmpleadoVenta: 22,
        fechaVenta: "2022-09-15",
        precio: 169,
        proveedor: {
          "_id": {"$ref": "proveedores", "$id": "65aa920d96da87544421e633"}
        },
      },
      {
        marca: "Rayban",
        graduacion: [0.75, 0.75],
        colorCristales: ["marron", "gris"],
        tipoMontura: "metalica",
        colorMontura: "negro",
        _idEmpleadoVenta: 32,
        fechaVenta: "2022-06-20",
        precio: 159,
        proveedor: {
          "_id": {"$ref": "proveedores", "$id": "f1767562e1a350000000001"}
        },
      },
    ],
  },
]);
