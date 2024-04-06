# mysql-container-docker

In this repository I am testing recent knowledge about Docker and Data Volumes and the MySQL Method Select, so I will use a container with the configured MySQL.

# Creation Datas

- init-db1.sql
- init-db2.sql
- init-db3.sql
- init-db4.sql
- init-db5.sql

# Commands scripts

- Script-Queries-db1.sql
- Script-Queries-db2.sql
- Script-Queries-db3.sql
- Script-Queries-db4.sql
- Script-Queries-db5.sql


# Preparing the environment

You need the installed docker and the commands at Dockerfile to get the correct image of MySQL and the initial settings.
so that everything goes well:

- Use the extension of VSCode MySQL Management Tool (MMT)

- Dockerfile

- Create an Init.SQL file with its DB creation structure

-~ Docker Build -T MySQL -Image.// To create the MySQL image configured on dockerfile
-~ Docker Run -d -v $ (pwd)/db/date:/var/lib/mysql - -name mysql -container mysql-image // to start a new container with the specified MySQL image, while alsoConfigures a bind volume to persist mysql database data on the host (standard port: 3306)

- Now just create the connection with (MMT):
    Open the mysql workbench.
    Click on "New Connection" or "New Instance Connection".
    Fill in the connection details:
    Connection Name: A name for your connection (optional).
    HostName: Use localhost if you are connecting from the same computer where the docker is being executed.If you are connecting from another computer, use the IP address of the computer where the docker is being executed.
    Port: Use the mapped door you specified by starting the docker container, for example, 3306.
    User Name: The MySQL username you set during the configuration.
    Password: The MySQL password you set during the configuration.
    Click "Test Connection" to check that the connection is working properly.
    If everything is correct, click "OK" to save the connection and connect to the MySQL server.

# All ready
- Take the opportunity to create your scripts with your darling
- Click with the right button on the code and select Run MySQL Query and have fun




