# Module 2

| Session | My Homework |
| ------ | ------ |
| Session 1 | - |
| Session 2 | - |
| Session 3 | [Code](https://github.com/edinugroho/GenerasiGigih/tree/main/Module%202/Session%203) |

## Summary

### Session 1

HTTP method, routing, and rendering
HTTP method is a method for acessing object from HTTP protocols. REST API is a standart architecture with reserved by HTTP method, there available an object and verb. Object is a data within the body or in a header, verb is a action can do with object. 

This is verb and method for example case
| action | verb | object | explain |
| ------ | ---- | ------ | --------|
| create | POST | /resrourant | endpoint to post or store a restourant object |
| get | GET | /restourant | endpoint to get all restourant data |
| put | PUT | /restourant/12 | endpoint to update or edit an object with id 12 |
| delete | DELETE | /restourant/12/menu/4 | endpoint for delete a menu with id 4 in restourant with id 12 | 

There are available many framework in ruby language, there are one of the most popular [Ruby on Rails](https://rubyonrails.org/). In this session we also learn about framework, there is a [Sinatra](http://sinatrarb.com/). Sinatra is a microframework, it fit to understand how to use an HTTP method works.

### Session 2

Database, ERD, and DDL
Database is a organized data or in another word database is a set of data. From fata we can modeling it to entity, Entity is thing who can identifying one and another. Entity has properties called attribute. one of attribute is filled by unique value thats called primary key. The requirements for the primary key are unique, never changed, and not null.

Cardinality is maximum row can relate another entity row, Some types of cardinality are as follows :
 - one to one
 - one to many 
 - many to many

After know entities, attributes, and cardinality we can make a design of database, the design is called ERD or entity relationship diagrams. ERD is used for more easily modeling a database and how entity related with another entity. After the design, we can implement it to database system. A creating this database is called DDL or data definition language.

### Session 3

Data Manipulation Language
DML or Data Manipulation Language is a way for manipulating row in a database, it contains deleting, edit, or inserting a data. 

Different types of SQL JOINs:
 - INNER JOIN : Returns records that have matching values in both tables.
 - LEFT JOIN : Returns all record from the left table, and the matched records from the right table.
 - Right Join : Return all records from the right table, and the matched records from the left table.