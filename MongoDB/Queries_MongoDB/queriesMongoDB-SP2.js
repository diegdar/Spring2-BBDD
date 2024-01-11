db.restaurantes.find()
db.restaurantes.find({},{restaurant_id:1, name:1, borough:1, cuisine:1})
db.restaurantes.find({},{_id:0, restaurant_id:1, name:1, borough:1, cuisine:1})
db.restaurantes.find({},{_id:0, restaurant_id:1, name:1, borough:1, 'address.zipcode':1})
db.restaurantes.find({borough:"Bronx"}, {_id:0, restaurant_id:1, name:1, borough:1, 'address.zipcode':1})
db.restaurantes.find({borough:"Bronx"}, {_id:0, restaurant_id:1, name:1, borough:1, 'address.zipcode':1}, {limit:5})
db.restaurantes.find({borough:"Bronx"}, {_id:0, restaurant_id:1, name:1, borough:1, 'address.zipcode':1}, {skip:5, limit:5})
db.restaurantes.find({"grades.score":{$gt:90}}, {_id:0, restaurant_id:1, name:1, borough:1, "grades.score":1})
db.restaurantes.find({"grades.score":{$gt:80, $lt:100}}, { _id: 0, restaurant_id: 1, name: 1, borough: 1, "grades.score": 1 })
db.restaurantes.find( {"address.coord.0":{$lt:-95.754168}}, { _id: 0, restaurant_id: 1, name: 1, "address.coord":1})
db.restaurantes.find( { $and: [ { cuisine: { $ne: "American " } },  { "grades.score": { $gt: 70 } }, { "address.coord.1": { $lt: -65.754168 } } ] }, { _id: 0, name: 1, cuisine: 1, "grades.score": 1, "address.coord":1 })
db.restaurantes.find( {   cuisine: { $ne: "American " } , "grades.score": { $gt: 70 } , "address.coord.0": { $lt: -65.54168 } }, { _id: 0, name: 1, cuisine: 1, "grades.score": 1, "address.coord":1 } )
db.restaurantes.find({ cuisine: {$ne: "American "}, "grades.grade": {$eq: "A"}, borough: {$ne: "Brooklyn"} }, { _id: 0, name: 1, cuisine: 1, "grades.grade": 1, borough:1 }).sort({ cuisine: -1 });
db.restaurantes.find({name:{$regex:/^Wil/}}, {_id:0,restaurant_id:1,name:1,cuisine:1,borough:1});
db.restaurantes.find({name:{$regex:/ces$/}}, {_id:0,restaurant_id:1,name:1,cuisine:1,borough:1});
db.restaurantes.find({name:{$regex:/Reg/}}, {_id:0,restaurant_id:1,name:1,cuisine:1,borough:1});
db.restaurantes.find({ $and: [{ borough: "Bronx" }, { $or: [{ cuisine: "American " }, { cuisine: "Chinese" }] }]}).projection({_id: 0, name: 1, borough: 1, cuisine: 1});
db.restaurantes.find({borough: {$in: ["Staten Island", "Queens", "Bronx","Brooklyn"]}}, {_id: 0,restaurant_id:1, name: 1, borough: 1, cuisine: 1 });
db.restaurantes.find({borough: {$nin: ["Staten Island", "Queens", "Bronx", "Brooklyn"]}}, {_id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1}).limit(100);
db.restaurantes.find(  { "grades.score":{$lt:10}},  { _id: 0,restaurant_id:1, name: 1, borough: 1, cuisine: 1});
// Hay duda con esta consulta:🕰️21.	Escribe una consulta para encontrar el restaurant_id, name, borough y cuisine para aquellos restaurantes que preparan marisco ('seafood') excepto si son 'American ', 'Chinese' ; o el name del restaurante comienza con letras 'Wil'. Comentario: Si son 'seafoof' ya no podrian ser ni 'American ' ni 'Chinese', no?
db.restaurantes.find({$and:[{cusine:{$eq:"seafood"}},{name:{$ne:{$regex:/^Wil/}}}]},{_id:0,restaurant_id:1,name:1,borough:1,cuisine:1});
// Hay duda con esta consulta:🕰️22.	Escribe una consulta para encontrar el restaurant_id, name y grade para aquellos restaurantes que consigan un grade de "A" y un score de 11 con un ISODate "2014-08-11T00:00:00Z". Comentario: tienen que estar el grade, score e ISODate con los valores pedidos en la posicion del array del array o si se encuentran por separado tambien valen?
// SI DA IGUAL QUE ESTEN JUNTOS:
    db.restaurantes.find({$and:[{"grades.grade":{$eq:"A"}},{"grades.score":{$eq:11}},{"grades.date":{$eq:ISODate("2014-08-11T00:00:00Z")}}]},{_id:0,restaurant_id:1,name:1,grades:1});
//SI SE QUIERE QUE ESTEN JUNTOS:
    db.restaurantes.find({grades:{$elemMatch:{grade:"A",score:11,date:ISODate("2014-08-11T00:00:00Z")}}},{_id:0,restaurant_id:1,name:1,grades:1});
// 23:
db.restaurantes.find({$and:[{"grades.1.grade":{$eq:"A"}}, {"grades.1.score":{$eq:9}},{"grades.1.date": {$eq: ISODate("2014-08-11T00:00:00Z") } }]},{ _id: 0,restaurant_id:1, name: 1, grades:1}  );
// 24:
db.restaurantes.find({"address.coord.1":{$gt:42, $lt:52}},{ _id: 0,restaurant_id:1, name: 1, address:1, oord:1}  );
// 25:
db.restaurantes.find({},{ _id: 0, name: 1}).sort({name: 1});
// 26: 
db.restaurantes.find({},{ _id: 0, name: 1}).sort({name: -1});
// 27
db.restaurantes.find({},{ _id: 0, cuisine: 1, borough:1}).sort({cuisine:1, name: -1}) 
// 28:
db.restaurantes.find({"address.street":{$exists:true}},{_id:0,name:1,"address.street":1});
// 29
db.restaurantes.find({"address.coord":{$type:1}},{_id:0,"address.coord":1});
// 30:
db.restaurantes.find({"grades.score":{$mod:[7,0]}},{_id:0,restaurant_id:1,name:1,"grades.grade":1});
// 31:
db.restaurantes.find({name:{$regex:/mon/}},{_id:0,name:1,borough:1,"address.coord":1,cuisine:1});
// 32:
db.restaurantes.find({name:{$regex:/^Mad/}},{_id:0,name:1,borough:1,"address.coord":1,cuisine:1})  