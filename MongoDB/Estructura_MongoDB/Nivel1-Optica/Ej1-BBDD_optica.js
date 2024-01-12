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
      clientes:
      [
        {
          _idCliente: 134,
          nombre: "Manuel Lopez Obrador",
          direccion: "Calle La Rambla, 123",
          telefono: "966341289",
          email: "manuelop@gmail.com",
          fechaRegistro: "2022-11-02",
          _idClienteRecomendador: 122,      
        },        
      ]
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
      clientes:[
        {
          _idCliente: 246,
          nombre: "Maria Sanchez",
          direccion: "Calle Principal, 456",
          telefono: "966987654",
          email: "marias@gmail.com",
          fechaRegistro: "2022-10-20",
          _idClienteRecomendador: 133      
        },
        {
          
        }
      ]
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
          _idCliente: 134,
          nombre: "Manuel Lopez Obrador",
          direccion: "Calle La Rambla, 123",
          telefono: "966341289",
          email: "manuelop@gmail.com",
          fechaRegistro: "2022-11-02",
          _idClienteRecomendador: 122,      
        },
        {
          _idCliente: 358,
          nombre: "Juan Perez",
          direccion: "Calle Secundaria, 789",
          telefono: "966654321",
          email: "juanperez@gmail.com",
          fechaRegistro: "2022-09-15",
          _idClienteRecomendador: 122,      
        }
      ]
    },
    {
      _idGafa: "NI125",
      marca: "Nike",
      tipoMontura: "flotante",
      proveedor: [
        {
          nombre: "Nike",
          direccion: "Av. del Deporte 246",
          telefono: "966789654",
          nif: "A24681357",
        },
      ],
      precio: 169,
      clientes:[
        {
          _idCliente: 358,
          nombre: "Juan Perez",
          direccion: "Calle Secundaria, 789",
          telefono: "966654321",
          email: "juanperez@gmail.com",
          fechaRegistro: "2022-09-15",
          _idClienteRecomendador: 122,      
        }
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
          _idCliente: 134,
          nombre: "Manuel Lopez Obrador",
          direccion: "Calle La Rambla, 123",
          telefono: "966341289",
          email: "manuelop@gmail.com",
          fechaRegistro: "2022-11-02",
          _idClienteRecomendador: 122,      
        },
        {
          _idCliente: 246,
          nombre: "Maria Sanchez",
          direccion: "Calle Principal, 456",
          telefono: "966987654",
          email: "marias@gmail.com",
          fechaRegistro: "2022-10-20",
          _idClienteRecomendador: 133,      
        }
      ]
    }
]);
