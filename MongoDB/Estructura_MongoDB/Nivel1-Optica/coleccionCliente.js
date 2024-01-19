db.createCollection("clientes");

db.clientes.insertMany([
    {
        _id: '65aa964996da87544421e636',
        cliente_id: 134,
        nombre: "Manuel Lopez Obrador",
        direccion: "Calle La Rambla, 123",
        telefono: "966341289",
        email: "manuelop@gmail.com",
        fechaRegistro: "2022-11-02",
        _idClienteRecomendador: 122,
    },
    {
        _id: '65aa920d96da87544421e633',
        cliente_id: 246,
        nombre: "Maria Sanchez",
        direccion: "Calle Principal, 456",
        telefono: "966987654",
        email: "marias@gmail.com",
        fechaRegistro: "2022-10-20",
        cliente_idRecomendador: 133,    
    },
    {
        _id: '65aa920d96da87544421e635',
        nombre: "Juan Perez",
        direccion: "Calle Secundaria, 789",
        telefono: "966654321",
        email: "juanperez@gmail.com",
        fechaRegistro: "2022-09-15",
        cliente_idRecomendador: 122,
    }

]);