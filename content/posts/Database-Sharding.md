---
title: Database Sharding
date: 2023-07-10T15:10:43+05:30
draft: false
---

# What is Database Sharding

Sharding is a type of database partitioning that separates large databases into smaller, faster, more easily managed parts. These smaller parts are called data shards. The word shard means "a small part of a whole."



## Horizontal Vs vertical sharding:
 
To achieve sharding, the rows or columns of a larger database table are split into multiple smaller tables.

When we split using rows : Horizontal Sharding

When we split using columns : Vertical Sharding


## Horizontal sharding. 
When each new table has the same schema but unique rows, it is known as horizontal sharding. In this type of sharding, more machines are added to an existing stack to spread out the load, increase processing speed and support more traffic. This method is most effective when queries return a subset of rows that are often grouped together.

## Vertical sharding.
When each new table has a schema that is a faithful subset of the original table's schema, it is known as vertical sharding. It is effective when queries usually return only a subset of columns of the data.



### Original data set :

| Student ID | Name    | Age | Major             | Hometown         |
|------------|---------|-----|-------------------|------------------|
| 1          | Amy     | 21  | Economics         | Austin           |
| 2          | Jack    | 20  | History           | San Francisco    |
| 3          | Matthew | 22  | Political Science | New York City    |
| 4          | Priya   | 19  | Biology           | Gary             |
| 5          | Ahmed   | 19  | Philosophy        | Boston           |


### Horizontal Sharding

#### shard 1

| Student ID | Name | Age | Major     | Hometown        |
|------------|------|-----|-----------|-----------------|
| 1          | Amy  | 21  | Economics | Austin          |
| 2          | Jack | 20  | History   | San Francisco   |


#### shard 2

| Student ID | Name    | Age | Major             | Hometown        |
|------------|---------|-----|-------------------|-----------------|
| 3          | Matthew | 22  | Political Science | New York City   |
| 4          | Priya   | 19  | Biology           | Gary            |
| 5          | Ahmed   | 19  | Philosophy        | Boston          |


### Vertical Sharding

#### shard 1

| Student ID | Name | Age |
|------------|------|-----|
| 1          | Amy  | 21  |
| 2          | Jack | 20  |


#### shard 2

| Student ID | Major   |
|------------|---------|
| 1          | Economics |
| 2          | History |


#### shard 3

| Student ID | Hometown     |
|------------|--------------|
| 1          | Austin        |
| 2          | San Francisco |



# Benifits of Sharding 

* Horizontal scaling, also known as scaling out, enables flexible database design and is beneficial for parallel processing.
* It provides near-limitless scalability for intense workloads and big data requirements.
        Horizontal sharding optimizes the use of compute resources across a cluster for every query.
        Query resolution is faster as each machine has to scan fewer rows.

* Vertical sharding enhances a single machine's capacity by increasing RAM, storage, and CPU capacity.

* Sharded databases offer higher availability and mitigate the impact of outages.
        
* During an outage, only the portions of an application relying on the missing data chunks become unusable.
        Backup shards are replicated to additional nodes, minimizing damage from outages.
        Applications without sharded databases may experience complete unavailability during an outage.

* Sharding increases the read/write throughput when operations are limited to a single shard.

# Types of sharding

## Range-Based Sharding:

* Range-Based Sharding involves partitioning data based on a specific range of values.
* The shard key, which is a chosen attribute or column, determines the range for each shard.
* Data is distributed to different shards based on the values falling within the defined ranges.
* This approach is particularly useful when data can be naturally grouped or sorted based on a range, such as dates, numerical values, or geographical regions.
* For example, in a customer database, you can shard data based on the customer's last name initial, where each shard stores data for a specific range of last name initials (e.g., shard 1 for A-F, shard 2 for G-M, etc.).

## Hash-Based Sharding:

* Hash-Based Sharding involves distributing data across shards using a hash function.
* The shard key value is input into a hash function, which generates a hash value.
* The hash value determines the shard where the data will be stored.
* Hash-Based Sharding ensures an even distribution of data across shards and minimizes hotspots.
* This method works well when the distribution of data is not inherently ordered or when you want to achieve a uniform distribution of data across shards.
* For example, if you have a user database, you can use the user ID as the shard key and apply a hash function to determine which shard the user's data will be stored on.

## Directory-Based Sharding

* Directory-Based Sharding, also known as lookup-based sharding, involves using a directory or mapping table to determine the shard for a given key.
* Each entry in the directory maps a key to its corresponding shard.
* When a query or operation is performed, the directory is consulted to determine the shard responsible for handling that particular key.
* This approach provides flexibility in managing shard assignments and allows for dynamic scaling and rebalancing of data across shards.
* Directory-Based Sharding can be useful when the sharding criteria are not based on simple ranges or hash functions, but rather on more complex business logic or dynamically changing attributes.


## Strength and Consideration and which one is best

**Range-Based Sharding:**

- **Strengths:**
  - Well-suited for data that can be naturally grouped or sorted based on ranges.
  - Enables efficient range-based queries and analysis.

- **Considerations:**
  - Requires careful selection of the shard key to ensure balanced data distribution.
  - May encounter challenges when the data distribution is not evenly distributed across ranges.

**Hash-Based Sharding:**

- **Strengths:**
  - Provides a uniform distribution of data across shards, minimizing hotspots.
  - Well-suited for scenarios where the distribution of data is not inherently ordered.

- **Considerations:**
  - Can be challenging to perform range-based queries efficiently.
  - Requires consideration of hash collisions and their impact on performance.

**Directory-Based Sharding:**

- **Strengths:**
  - Offers flexibility and dynamic scalability in managing shard assignments.
  - Allows for complex business logic and dynamic changes in shard assignments.

- **Considerations:**
  - Introduces additional overhead due to the need to consult the directory for shard lookups.
  - Requires maintenance of the directory and its synchronization with shard assignments.

It's important to note that the "best" sharding technique will depend on your specific use case, data characteristics, scalability requirements, and query patterns. Consider the following factors when making a decision:

- Data Distribution: Analyze how your data is naturally distributed and identify any existing patterns or ranges that can be leveraged for sharding.
- Query Patterns: Consider the types of queries performed on your data and assess how well each sharding technique aligns with those query patterns.
- Scalability Requirements: Evaluate the scalability needs of your application and determine which sharding technique can provide the desired scalability and performance.
- Flexibility and Maintenance: Consider the trade-offs between flexibility, maintenance, and complexity associated with each sharding technique.

In practice, a combination of sharding techniques may be used depending on the specific requirements of different data sets or entities within your application. It's recommended to thoroughly analyze your requirements, experiment, and benchmark the different techniques to determine the most suitable approach for your specific use case.
