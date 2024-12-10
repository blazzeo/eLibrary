import { export_json, import_json } from "./json_handler.js"
console.log("TEST")

//const book = {
//  "book_id": null,
//  "title": "Test_book",
//  "total_pages": 228,
//  "rating": 4.5,
//  "isbn": "1234567890123",
//  "published_date": new Date(Date.now()).toISOString()
//}
//
//fetch('http://localhost:3000/api/addbook/', {
//  method: 'POST',
//  headers: {
//    'Content-Type': 'application/json',
//  },
//  body: JSON.stringify(book),
//})
//  .then(response => {
//    if (!response.ok) {
//      throw new Error('Network response was not ok');
//    }
//    return response.json();
//  })
//  .then(result => {
//    console.log('Success:', result);
//  })
//  .catch(error => {
//    console.error('Error:', error);
//  });

//import_json('export.json', 'books')
export_json('export.json', 'users')
