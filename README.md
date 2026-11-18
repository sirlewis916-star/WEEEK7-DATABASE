This assignment applies normalization to remove redundancy and improve data integrity.

*Question 1 - 1NF*
Converted the multi-valued Products column into atomic values. Each row now contains only one product per order.

*Question 2 - 2NF*
Removed partial dependency by splitting the table into two tables. 
Order information is stored separately from order items.
CustomerName now depends only on OrderID, and Quantity depends on the full key of OrderID and Product.
