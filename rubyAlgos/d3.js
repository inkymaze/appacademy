// myMap
//
// Implement the Array.prototype.map function in JavaScript.


// es5
Array.prototype.myMap = function(fun) {
  let result = [];
  this.forEach(function(el) {
    result.push(fun(el));
  });
  return result;
};

// es6

Array.prototype.myMap = function(fun) {
  let result = [];
  this.forEach((el) => {
    result.push(fun(el));
  });
  return result;
};



// Employees Query

// In a SQL db, you have two tables, an employees table and a departments table. Employees belong to only one department. Write a SQL query that, given a department name, finds all the employees in that department.
SELECT
  employees.*
FROM
  employees e

JOIN
  departments d ON e.departments_id = d.id
WHERE
  d.name = ?
