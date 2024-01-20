db.createCollection("proveedores");

db.proveedores.insertMany([
    {
        _id: 'f1767562e1a350000000001',
        nombre: "Rayban",
        direccion: "Av. Buenaventura 1335",
        telefono: "966431190",
        fax: "990673389",
        nif: "B34771229",
      },
      {
        _id: '65aa920d96da87544421e633',
        nombre: "Gucci",
        direccion: "Calle Esperanza 14",
        telefono: "977754985",
        nif: "A23781109",
      },
      {
        _id: '65aa920d96da87544421e634',
        nombre: "Prada",
        direccion: "Paseo del Remolino 46",
        telefono: "987563412",
        nif: "B22764532",
      },
      {
        _id: '65aa920d96da87544421e635',
        nombre: "Oakley",
        direccion: "Av. de los Deportes 789",
        telefono: "966123456",
        nif: "A12345678",
      },

]);
