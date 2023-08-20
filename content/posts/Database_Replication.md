---
title: Database Replication'
date: 2023-06-18T15:10:44+05:30
draft: false
---

# Understanding Database Replication in System Design

## Introduction

Database replication is a technique used to maintain the same data across different databases. The primary goal is to ensure data reliability, redundancy, and availability. In system design, replication is crucial for preventing data loss, load balancing, and improving local data access speed. It is a fundamental concept often discussed during interviews related to system design.

## Database Replication Types

There are three main types of database replication:

* **[Master-Slave Replication:](#deep-dive-into-master-slave-replication)** One database acts as the 'master', and the rest act as 'slaves'. The master database performs all the write operations, while the slave databases synchronize with the master database to reflect the changes. This type of replication solves the issue of maintaining data redundancy.
* **[Master-Master Replication:](#master-master-replication)** In this type of replication, all databases can handle both read and write operations. Any changes in one database are synchronized across all others. This type of replication is beneficial for load balancing and failover solutions.
* **[Multi-Master Replication:](#multi-master-replication)** A step further than the Master-Master Replication, Multi-Master allows multiple databases to accept write operations, and changes are synchronized across all databases. This configuration can handle more substantial traffic but comes with the complexity of conflict resolution.

## Deep Dive into Master-Slave Replication
[![Image of Master-Slave Replication](https://www.karanpratapsingh.com/_next/image?url=%2Fstatic%2Fcourses%2Fsystem-design%2Fchapter-II%2Fdatabase-replication%2Fmaster-slave-replication.png&w=3840&q=75)](https://www.karanpratapsingh.com/_next/image?url=%2Fstatic%2Fcourses%2Fsystem-design%2Fchapter-II%2Fdatabase-replication%2Fmaster-slave-replication.png&w=3840&q=75)

This is an image of Master-Slave Replication.

In Master-Slave Replication, the 'master' database takes up all write operations, while 'slave' databases replicate data from the master for reading. This technique helps scale read operations and provides data redundancy, but it has a single point of failure – the master database.

The steps involved in Master-Slave Replication are:

1. Configuring the Master Database: The master database is set up to record changes made to its data.
2. Setting Up the Slave Database: The slave database connects to the master to retrieve the master's binary log position and the corresponding database state.
3. Replicating Data: The slave database requests the master database for data newer than the slave's current position in the binary log.
4. Synchronization: The slave database syncs with the master database at regular intervals, retrieving and executing the operations that the master database has recorded in its binary log.

### Advantages

1. Backups of the entire database of relatively no impact on the master.
2. Applications can read from the slave(s) without impacting the master.
3. Slaves can be taken offline and synced back to the master without any downtime.

### Disadvantages

1. Replication adds more hardware and additional complexity.
2. Downtime and possibly loss of data when a master fails.
3. All writes also have to be made to the master in a master-slave architecture.
4. The more read slaves, the more we have to replicate, which will increase replication lag.

## Master-Master Replication
[![Image of Master-Master Replication](https://www.karanpratapsingh.com/_next/image?url=%2Fstatic%2Fcourses%2Fsystem-design%2Fchapter-II%2Fdatabase-replication%2Fmaster-master-replication.png&w=3840&q=75)](https://www.karanpratapsingh.com/_next/image?url=%2Fstatic%2Fcourses%2Fsystem-design%2Fchapter-II%2Fdatabase-replication%2Fmaster-master-replication.png&w=3840&q=75)

This is an image of Master-Master Replication.

In Master-Master Replication, two databases serve as masters, where both can handle read and write operations. If one fails, the system can still operate without any data loss. However, it does add a layer of complexity due to potential write conflicts.

The steps involved in Master-Master Replication are:

1. Configuring the Primary Master: The primary master is configured to record changes and synchronize with the secondary master.
2. Setting Up the Secondary Master: The secondary master replicates the primary master's data and records its changes.
3. Synchronization: Both databases sync with each other at regular intervals, making sure that they have the same data.
4. Failover: In case of one master failing, the other can still handle both read and write operations, providing high availability.

### Advantages

1. Applications can read from both masters.
2. Distributes write load across both master nodes.
3. Simple, automatic, and quick failover.

### Disadvantages

1. Not as simple as master-slave to configure and deploy.
2. Either loosely consistent or have increased write latency due to synchronization.
3. Conflict resolution comes into play as more write nodes are added and as latency increases.

## Multi-Master Replication
[![Image of Master-Master Replication](https://user-images.githubusercontent.com/4745789/139211714-fc9266bd-ca22-48c4-9095-c6bff0ae99e6.png)](https://user-images.githubusercontent.com/4745789/139211714-fc9266bd-ca22-48c4-9095-c6bff0ae99e6.png)

This is an image of Master-Master Replication.

Multi-Master Replication is an extension of Master-Master Replication where more than two databases can handle write operations. This configuration provides high availability, improved write scalability, and geographical distribution of data.

However, it does come with its challenges such as managing write conflicts and maintaining data consistency.

### Advantages

1. Enhanced Load Handling Capacity

Multi-master replication is an effective solution when a database cluster becomes a bottleneck due to increased write traffic. A single node has both theoretical and practical scaling limitations, and it's essential to distribute the load across multiple nodes. In a multi-master setup, multiple master nodes accept incoming write requests, enhancing the capacity to handle increased write requests. 

2. Data Redundancy

Creating a consistent, secondary copy of the master database that also accepts write requests is a common use case for multi-master replication. This may sound complex, but such a requirement is common in real-world scenarios. By maintaining a second copy, you ensure data availability even if one master node fails.

3. Avoiding Single Point of Failure (SPoF)

A master node, like any other in a database cluster, is prone to crashes. If a single master node that accepts all write requests crashes, it could lead to significant downtime. Multi-master replication eliminates this single point of failure. If one master node crashes, other master nodes can continue to handle write requests, ensuring uninterrupted operation of the cluster.

4. Lower Latencies Across Geographies

For businesses with clients spread across various geographical locations, write latencies can increase if all writes have to be directed to a single master node. With multi-master replication, you can set up master nodes in different regions, closer to the users. This setup helps minimize write latencies as client requests can be served from the closest master node, enhancing user experience.

5.  Facilitates Seamless Database Upgrades

Database upgrades are an inevitable part of system maintenance, but executing these upgrades can be challenging. It's essential to test business logic on a newer version before rolling it out for production use. Multi-master replication allows you to maintain an older version of your database for production while keeping a second updated database for testing. Both databases are kept in sync and can accept write operations. This approach not only facilitates testing but also allows for incremental traffic shifting from the old to the new version, minimizing disruption in case of failure.

### Disadvantages 

1. Eventual Consistency and Loss of ACID Guarantees

Multi-master replication operates asynchronously, which means updates made on one master node may take some time to reflect on other master nodes, resulting in eventual consistency. Consequently, a relational database running in multi-master mode loses its ACID (Atomicity, Consistency, Isolation, Durability) guarantees, a potential problem for applications that require immediate consistency.

2. Performance Degradation

In multi-master replication, every update made on one master node needs to be replicated across all other master nodes. This constant data movement can significantly burden network bandwidth, potentially leading to sluggish network performance at scale.

3. Conflict Resolution

A significant challenge of running a database in multi-master mode is dealing with write conflicts. Since all master nodes accept write operations, there may be situations where the same entity is updated on multiple master nodes simultaneously, leading to conflicts during syncing. Resolving these conflicts becomes a crucial aspect of managing a multi-master setup.

The approach to conflict resolution varies based on specific use cases and business logic. Some applications might discard the entire sequence of conflicting writes, while others might adopt a "last write wins" strategy. Ultimately, it's the responsibility of the business logic and use case to define the steps to be taken upon a conflict.


## Conclusion

Database replication is a core part of system design that improves performance, provides redundancy, and ensures high availability. Choosing the right type of replication depends on the specific needs of your system – the volume of read/write operations, data consistency requirements, acceptable latency, etc. However, remember that replication also adds complexity to your system, so a well-thought-out strategy is essential to manage it effectively.

This tutorial is a high-level overview of Database Replication in System Design. Further reading into each of the replication types and their implementation can provide deeper insights into their advantages, trade-offs, and use cases. Additionally, learning about sharding, partitioning, and other data management techniques can complement your understanding of database replication.


