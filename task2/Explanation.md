## Initial cost
In the initial variant, my main cost is in the networking, ec2 and database storage. 
I am assuming service has 10000 daily active users and based on that around network traffic and we have 50 mb of network traffic per user.

Based on that 500 GB of traffic comes in and out. Most of the images, etc are stored in s3 and RDS stores the relational database.

## Reduced cost
When reducing the cost, I reduced number of backups we are saving in the RDS database and amount of data we want to store. Also, I reduced the s3 storage and reduced the EC2  compute as we can scale up only in the time of peak traffic.

## Increased cost
In case of increasing the cost, I increased the RDS storage as well as the RDS backups. Also, as now we are using S3 heavily, I added Athena data store to query the user data for the data analysis team.
I also increased compute and added cache to make the website even more scalable.