// 🗒️NOTAS:
/*
1: el '1' indica que se muestre el campo mientras que si fuera '0' indica que no se muestre 
2: Al ser negativa entre mas alejado del 0(osea mayor sea el numero negativo) es menor ( -3 es menor a -1). la expresion 'coord.0' se refiere a la posicion de la "longitud" en el array(coord), que es la primera posicion.
3: $ne Not equal.
4: todos los valores de la latitud son positivos por eso la consulta no arroja ningun resultado (por eso tambien 'coord.1' pues busca en la segunda posicion del array 'coord').
5: '-1' ordena de forma Descendiente, mientras si hubiera sido '1' lo hubiera hecho de forma Ascendiente.
6: Con el operador $regex(patrón de búsqueda) a diferencia de sql en Mongodb hay que escribir los caracteres entre barras en lugar de entre comillas.
7: No hace falta poner '%' como en sql para especificar que encuentre el patron 'Reg' en cualquier parte del campo 'name'
8: El operador $in vendria a hacer lo mismo que el operador $or solo que mas simplificado
9: selecciona los documentos donde: el valor del campo especificado no está en la matriz especificada
10: El operador $elemMatch busca documentos que contengan un campo de matriz con al menos un elemento que coincida con todos los criterios de consulta especificados.
11: para indicar la posicion del array en la que se quiere buscar bastan con escribir: Nombre_Campo_Array.posicion_Array.Campo_Buscar.
12: El numero '1' indica que se debe ordenar de forma descendente, si se quiera hacer de forma ascendente habria que poner '-1'.
13: El operador busca documentos que contengan o no un campo específico, incluidos los documentos donde el valor del campo es nulo.
14: selecciona documentos donde el valor del campo es una instancia de los tipos BSON especificados.
*/


// 1.	Escribe una consulta para mostrar todos los documentos en la colección Restaurantes.

db.restaurantes.find();
// 2.	Escribe una consulta para mostrar el restaurant_id, name, borough y cuisine de todos los documentos en la colección Restaurantes.
db.restaurantes.find({}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }); //**nota 1
// 3.	Escribe una consulta para mostrar el restaurant_id, name, borough y cuisine, pero excluyendo el campo _id para todos los documentos en la colección Restaurantes.
db.restaurantes.find(
  {},
  { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
); //**1
// 4.	Escribe una consulta para mostrar restaurant_id, name, borough y zip code, pero excluyendo el campo _id para todos los documentos en la colección Restaurantes.
db.restaurantes.find(
  {},
  { _id: 0, restaurant_id: 1, name: 1, borough: 1, "address.zipcode": 1 }
); //**1
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
  { "grades.score": { $gt: 80, $lt: 100 } },
  { _id: 0, restaurant_id: 1, name: 1, borough: 1, "grades.score": 1 }
)
// 10.	Escribe una consulta para encontrar los restaurantes situados en una longitud inferior a -95.754168. 
db.restaurantes.find(
  { "address.coord.0": { $lt: -95.754168 } }, //**nota 2 */
  { _id: 0, restaurant_id: 1, name: 1, "address.coord": 1 }
)
// 11.	Escribe una consulta de MongoDB para encontrar los restaurantes que no cocinan comida 'American' y tienen algún score superior a 70 y latitud inferior a -65.754168.
db.restaurantes.find(
  {
    $and:
      [
        { cuisine: { $ne: "American " } }, //nota 3
        { "grades.score": { $gt: 70 } },
        { "address.coord.1": { $lt: -65.754168 } } //nota 4
      ]
  },
  { _id: 0, name: 1, cuisine: 1, "grades.score": 1, "address.coord": 1 }
)
// 12.	Escribe una consulta para encontrar los restaurantes que no preparan comida 'American ' y tienen algún score superior a 70 y que, además, se localizan en longitudes inferiores a -65.754168. Nota: Haz esta consulta sin utilizar operador $and.
db.restaurantes.find(
  {
    cuisine: { $ne: "American " }, //nota 3
    "grades.score": { $gt: 70 },
    "address.coord.0": { $lt: -65.754168 }
  },
  { _id: 0, name: 1, cuisine: 1, "grades.score": 1, "address.coord": 1 }
)
// 13.	Escribe una consulta para encontrar los restaurantes que no preparan comida 'American ', tienen alguna nota 'A' y no pertenecen a Brooklyn. Se debe mostrar el documento según la cuisine en orden descendente.
db.restaurantes.find(
  {
    cuisine: { $ne: "American " }, //nota 3
    "grades.grade": { $eq: "A" },
    borough: { $ne: "Brooklyn" }
  },
  { _id: 0, name: 1, cuisine: 1, "grades.grade": 1, borough: 1 }
).sort({ cuisine: -1 }) //nota 5
// 14.	Escribe una consulta para encontrar el restaurant_id, name, borough y cuisine para aquellos restaurantes que contienen 'Wil' en las tres primeras letras en su nombre.
db.restaurantes.find(
  { name: { $regex: /^Wil/ } }, //nota 6
  { _id: 0, restaurant_id: 1, name: 1, cuisine: 1, borough: 1 }
)
// 15.	Escribe una consulta para encontrar el restaurant_id, name, borough y cuisine para aquellos restaurantes que contienen 'ces' en las últimas tres letras en su nombre.
db.restaurantes.find(
  { name: { $regex: /ces$/ } }, //nota 6
  { _id: 0, restaurant_id: 1, name: 1, cuisine: 1, borough: 1 }
)
// 16.	Escribe una consulta para encontrar el restaurant_id, name, borough y cuisine para aquellos restaurantes que contienen 'Reg' en cualquier lugar de su nombre.
db.restaurantes.find(
  { name: { $regex: /Reg/ } }, //nota 6 y 7
  { _id: 0, restaurant_id: 1, name: 1, cuisine: 1, borough: 1 }
)
// 17.	Escribe una consulta para encontrar los restaurantes que pertenecen al Bronx y preparan platos americanos o chinos.
db.restaurantes.find
  (
    {
      $and:
        [
          { borough: "Bronx" },
          {
            cuisine:
              { $in: ["American ", "Chinese"] } // nota 8
          }
        ],
    },
    { _id: 0, name: 1, borough: 1, cuisine: 1 }
  );
// 18.	Escribe una consulta para encontrar el restaurant_id, name, borough y cuisine para aquellos restaurantes que pertenecen a Staten Island, Queens, Bronx o Brooklyn.
db.restaurantes.find
  (
    {
      borough:
        { $in: ["Staten Island", "Queens", "Bronx", "Brooklyn"] } //nota 8
    },
    { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
  );
// 19.	Escribe una consulta para encontrar el restaurant_id, name, borough y cuisine para aquellos restaurantes que NO pertenecen a Staten Island, Queens, Bronx o Brooklyn.
db.restaurantes.find
  (
    {
      borough:
      {
        $nin:
          ["Staten Island", "Queens", "Bronx", "Brooklyn"]
      } //nota 9        
    },
    { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
  );
// 20.	Escribe una consulta para encontrar el restaurant_id, name, borough y cuisine para aquellos restaurantes que consigan una nota menor que 10.
db.restaurantes.find
  (
    {
      "grades.score": { $lt: 10 }
    },
    { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1, "grades.score": 1 }
  );
// Hay duda con esta consulta:🕰️21.	Escribe una consulta para encontrar el restaurant_id, name, borough y cuisine para aquellos restaurantes que preparan marisco ('seafood') excepto si son 'American ', 'Chinese' ; o el name del restaurante comienza con letras 'Wil'. Comentario: Si son 'seafoof' ya no podrian ser ni 'American ' ni 'Chinese', no?
db.restaurantes.find
  (
    {
      $and:
        [
          { cusine: { $eq: "seafood" } },
          { name: { $ne: { $regex: /^Wil/ } } }
        ]
    },
    { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
  );
// Hay duda con esta consulta:🕰️22.	Escribe una consulta para encontrar el restaurant_id, name y grade para aquellos restaurantes que consigan un grade de "A" y un score de 11 con un ISODate "2014-08-11T00:00:00Z".
// SI DA IGUAL QUE ESTEN JUNTOS:
db.restaurantes.find
  (
    {
      $and:
        [
          { "grades.grade": { $eq: "A" } },
          { "grades.score": { $eq: 11 } },
          { "grades.date": { $eq: ISODate("2014-08-11T00:00:00Z") } }
        ]
    },
    { _id: 0, restaurant_id: 1, name: 1, grades: 1 }
  );
// SI SE QUIERE QUE ESTEN JUNTOS:
db.restaurantes.find(
  {
    grades: {
      $elemMatch: {//nota 10
        grade: "A",
        score: 11,
        date: ISODate("2014-08-11T00:00:00Z")
      }
    }
  },
  { _id: 0, restaurant_id: 1, name: 1, grades: 1 }
);

// 23.	Escribe una consulta para encontrar el restaurant_id, name y grades para aquellos restaurantes donde el 2 elemento del array de grades contiene un grade de "A" y un resultado 9 con un ISODate "2014-08-11T00:00:00Z".
db.restaurantes.find(
  {
    $and:
      [
        { "grades.1.grade": { $eq: "A" } }, //nota 11
        { "grades.1.score": { $eq: 9 } },
        { "grades.1.date": { $eq: ISODate("2014-08-11T00:00:00Z") } }
      ]
  },
  { _id: 0, restaurant_id: 1, name: 1, grades: 1 }
);
// 24.	Escribe una consulta para encontrar el restaurant_id, name, address y ubicación geográfica para aquellos restaurantes donde el segundo elemento del array coord contiene un valor entre 42 y 52.
db.restaurantes.find(
  { "address.coord.1": { $gt: 42, $lt: 52 } }
  ,
  { _id: 0, restaurant_id: 1, name: 1, address: 1, coord: 1 }
);
// 25.	Escribe una consulta para organizar los restaurantes por name en orden ascendente.
db.restaurantes.find({}, { _id: 0, name: 1 }).sort({ name: 1 }); //nota 12
// 26.	Escribe una consulta para organizar los restaurantes por nombre en orden descendente.
db.restaurantes.find({}, { _id: 0, name: 1 }).sort({ name: -1 }) //nota 12
// 27.	Escribe una consulta para organizar los restaurantes por el nombre de la cuisine en orden ascendente y por el barrio en orden descendente.
db.restaurantes.find({}, { _id: 0, cuisine: 1, borough: 1 }).sort({ cuisine: 1, name: -1 })
// 28.	Escribe una consulta para saber si las direcciones contienen la calle.
db.restaurantes.find(
  {
    "address.street": { $exists: true } //nota 13
  },
  { _id: 0, name: 1, "address.street": 1 }
)
// 29.	Escribe una consulta que seleccione todos los documentos en la colección de restaurantes donde los valores del campo coord es de tipo Double.
db.restaurantes.find(
  { "address.coord": { $type: 1 } }, //nota 14
  { _id: 0, "address.coord": 1 }
)
// 30.	Escribe una consulta que seleccione el restaurant_id, name y grade para aquellos restaurantes que devuelven 0 como residuo después de dividir alguno de sus scores por 7.
db.restaurantes.find(
  {
    "grades.score":
    {
      $mod: [7, 0]
    }
  },
  { _id: 0, restaurant_id: 1, name: 1, "grades.grade": 1 }
)
// Mostrando solo los 'scores':
  db.restaurantes.find(
    {
      "grades.score":
      {
        $mod: [7, 0]
      }
    },
    { _id: 0, "grades.score": 1 }
  )
// 31.	Escribe una consulta para encontrar el name de restaurante, borough, longitud, latitud y cuisine para aquellos restaurantes que contienen 'mon' en algún sitio de su name.
db.restaurantes.find(
  {
    name:
    {
      $regex: /mon/
    }
  },
  { _id: 0, name: 1, borough: 1, "address.coord": 1, cuisine: 1 }
)
// 32.	Escribe una consulta para encontrar el name de restaurante, borough, longitud, latitud y cuisine para aquellos restaurantes que contienen 'Mad' como primeras tres letras de su name.
db.restaurantes.find(
  {
    name:
    {
      $regex: /^Mad/
    }
  },
  { _id: 0, name: 1, borough: 1, "address.coord": 1, cuisine: 1 }
)
