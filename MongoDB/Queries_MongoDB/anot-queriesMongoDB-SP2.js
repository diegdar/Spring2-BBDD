// 🗒️NOTAS:
/*
1º: el '1' indica que se muestre el campo mientras que si fuera '0' indica que no se muestre 
2º: Al ser negativa entre mas alejado del 0(osea mayor sea el numero negativo) es menor ( -3 es menor a -1). la expresion 'coord.0' se refiere a la posicion de la "longitud" en el array(coord), que es la primera posicion.
3º: $ne Not equal.
4º: todos los valores de la latitud son positivos por eso la consulta no arroja ningun resultado (por eso tambien 'coord.1' pues busca en la segunda posicion del array 'coord').
5º: '-1' ordena de forma Descendiente, mientras si hubiera sido '1' lo hubiera hecho de forma Ascendiente.
6º: Con el operador $regex(patrón de búsqueda) a diferencia de sql en Mongodb hay que escribir los caracteres entre barras en lugar de entre comillas.
7º: No hace falta poner '%' como en sql para especificar que encuentre el patron 'Reg' en cualquier parte del campo 'name'
8º: El operador $in vendria a hacer lo mismo que el operador $or solo que mas simplificado
*/


// 1.	Escribe una consulta para mostrar todos los documentos en la colección Restaurantes.

db.restaurantes.find();
// 2.	Escribe una consulta para mostrar el restaurant_id, name, borough y cuisine de todos los documentos en la colección Restaurantes.
db.restaurantes.find({}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }); //**nota 1º
// 3.	Escribe una consulta para mostrar el restaurant_id, name, borough y cuisine, pero excluyendo el campo _id para todos los documentos en la colección Restaurantes.
db.restaurantes.find(
    {},
    { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
); //**1º
// 4.	Escribe una consulta para mostrar restaurant_id, name, borough y zip code, pero excluyendo el campo _id para todos los documentos en la colección Restaurantes.
db.restaurantes.find(
    {},
    { _id: 0, restaurant_id: 1, name: 1, borough: 1, "address.zipcode": 1 }
); //**1º
// 5.	Escribe una consulta para mostrar todos los restaurantes que están en el Bronx.
db.restaurantes.find(
    { borough: "Bronx" },
    { _id: 0, restaurant_id: 1, name: 1, borough: 1, "address.zipcode": 1 }
);
// 6.	Escribe una consulta para mostrar los primeros 5 restaurantes que están en el Bronx.
db.restaurantes.find(
    { borough: "Bronx" },
    { _id: 0, restaurant_id: 1, name: 1, borough: 1, "address.zipcode": 1 },
    { limit: 5 }
);
// 7.	Escribe una consulta para mostrar los 5 restaurantes después de saltar los primeros 5 que sean del Bronx.
db.restaurantes.find(
    { borough: "Bronx" },
    { _id: 0, restaurant_id: 1, name: 1, borough: 1, "address.zipcode": 1 },
    { skip: 5, limit: 5 }
);
// 8.	Escribe una consulta para encontrar los restaurantes que tienen algún 'score' mayor de 90.
db.restaurantes.find(
    { "grades.score": { $gt: 90 } },
    { _id: 0, restaurant_id: 1, name: 1, borough: 1, "grades.score": 1 }
);
// 9.	Escribe una consulta para encontrar los restaurantes que tienen un resultado mayor que 80 pero menos que 100.
db.restaurantes.find(
    {"grades.score":{$gt:80, $lt:100}},
    { _id: 0, restaurant_id: 1, name: 1, borough: 1, "grades.score": 1 }
)
// 10.	Escribe una consulta para encontrar los restaurantes situados en una longitud inferior a -95.754168. 
db.restaurantes.find(
    {"address.coord.0":{$lt:-95.754168}}, //**nota 2º */
    { _id: 0, restaurant_id: 1, name: 1, "address.coord":1}
)
// 11.	Escribe una consulta de MongoDB para encontrar los restaurantes que no cocinan comida 'American' y tienen algún score superior a 70 y latitud inferior a -65.754168.
db.restaurantes.find(
    {
        $and:
        [
            { cuisine: { $ne: "American " } }, //nota 3º
            { "grades.score": { $gt: 70 } }, 
            { "address.coord.1": { $lt: -65.754168 } } //nota 4º
        ]
    },
    { _id: 0, name: 1, cuisine: 1, "grades.score": 1, "address.coord":1 }
)
// 12.	Escribe una consulta para encontrar los restaurantes que no preparan comida 'American ' y tienen algún score superior a 70 y que, además, se localizan en longitudes inferiores a -65.754168. Nota: Haz esta consulta sin utilizar operador $and.
db.restaurantes.find(
    {
        cuisine: { $ne: "American " } , //nota 3º
        "grades.score": { $gt: 70 } , 
        "address.coord.0": { $lt: -65.754168 }
    },
    { _id: 0, name: 1, cuisine: 1, "grades.score": 1, "address.coord":1 }
)
// 13.	Escribe una consulta para encontrar los restaurantes que no preparan comida 'American ', tienen alguna nota 'A' y no pertenecen a Brooklyn. Se debe mostrar el documento según la cuisine en orden descendente.
db.restaurantes.find(
    {
        cuisine: { $ne: "American " } , //nota 3º
        "grades.grade": { $eq: "A" } , 
        borough: { $ne: "Brooklyn" }
    },
    { _id: 0, name: 1, cuisine: 1, "grades.grade": 1, borough:1 }
).sort({cuisine:-1}) //nota 5º
// 14.	Escribe una consulta para encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que contienen 'Wil' en las tres primeras letras en su nombre.
db.restaurantes.find(
    {   name: {$regex:/^Wil/} }, //nota 6º
    {   _id: 0, restaurante_id: 1, name: 1, cuisine: 1, borough:1 }
)
// 15.	Escribe una consulta para encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que contienen 'ces' en las últimas tres letras en su nombre.
db.restaurantes.find(
    {   name: {$regex:/ces$/} }, //nota 6º
    {   _id: 0, restaurante_id: 1, name: 1, cuisine: 1, borough:1 }
)
// 16.	Escribe una consulta para encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que contienen 'Reg' en cualquier lugar de su nombre.
db.restaurantes.find(
    {   name: {$regex:/Reg/} }, //nota 6 y 7º
    {   _id: 0, restaurante_id: 1, name: 1, cuisine: 1, borough:1 }
)
// 17.	Escribe una consulta para encontrar los restaurantes que pertenecen al Bronx y preparan platos americanos o chinos.
db.restaurantes.find
(
  {
    $and: 
    [
        { borough: "Bronx" }, 
        { cuisine: 
            { $in: ["American ", "Chinese"] } // nota 8º
        }
    ],
  },
  { _id: 0, name: 1, borough: 1, cuisine: 1 }
);