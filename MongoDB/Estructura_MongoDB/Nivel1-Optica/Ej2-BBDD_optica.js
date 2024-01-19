db.createCollection("gafas");

db.gafas.insertMany
([
    {
      _idGafa: "GU125",
      marca: "Gucci",
      tipoMontura: "pasta",
      proveedor:[
        {
          nombre: "Gucci",
          direccion: "Calle Esperanza 14",
          telefono: "977754985",
          nif: "A23781109",
        },
      ],
      precio: 179,
      cliente: {
        "_id": {"$ref": "clientes", "$id": "f1767562e1a350000000001"}
      },
  },
    {
      _idGafa: "OA187",
      marca: "Oakley",
      tipoMontura: "flotante",
      proveedor: [
        {
          nombre: "Oakley",
          direccion: "Av. de los Deportes 789",
          telefono: "966123456",
          nif: "A12345678",
        },
      ],
      precio: 149,
      cliente: {
        "_id": {"$ref": "clientes", "$id": "65aa920d96da87544421e633"}
      },
    },
    {
      _idGafa: "RA328",
      marca: "Rayban",
      tipoMontura: "flotante",
      proveedor: [
        {
          nombre: "Rayban",
          direccion: "Av. Buenaventura 1335",
          telefono: "966431190",
          fax: "990673389",
          nif: "B34771229",
        },
      ],
      precio: 133,
      clientes:[
        {
          "_id": {"$ref": "clientes", "$id": "65aa964996da87544421e636"}
        },
        {
          "_id": {"$ref": "clientes", "$id": "65aa920d96da87544421e633"}
        },
      ]
    },
    {
      _idGafa: "NI125",
      marca: "Gucci",
      tipoMontura: "flotante",
      proveedor: [
        {
          nombre: "Gucci",
          direccion: "Av. del Deporte 246",
          telefono: "966789654",
          nif: "A24681357",
        },
      ],
      precio: 169,
      clientes:[
        {
          "_id": {"$ref": "clientes", "$id": "65aa920d96da87544421e635"}
        },
      ]
    },
    {
      _idGafa: "PA057",
      marca: "Prada",
      tipoMontura: "metalica",
      proveedor: [
        {
          nombre: "Prada",
          direccion: "Paseo del Remolino 46",
          telefono: "987563412",
          nif: "B22764532",
        },
      ],
      precio: 159,
      clientes:[
        {
          "_id": {"$ref": "clientes", "$id": "65aa964996da87544421e636"}
        },
        {
          "_id": {"$ref": "clientes", "$id": "65aa920d96da87544421e633"}
        },
      ]
    }
]);
