# database-js-starter

A sample Node.js Express API built using the [PlanetScale serverless driver for JavaScript](https://planetscale.com/blog/introducing-the-planetscale-serverless-driver-for-javascript). It contains sample API endpoints that can be used to map to various operations on your PlanetScale database:

| API Method | SQL Action |
|---|---|
|`GET`| `SELECT`|
|`POST`| `INSERT`|
|`PUT`| `UPDATE`|
|`DELETE`| `DELETE`|

The main goal of this sample is to be used to gain an understanding of how to use the serverless driver in your own code.

For an in-depth explanation of how to use this repo, check the [associated article](https://planetscale.com/docs/tutorials/planetscale-serverless-driver-node-example) on the PlanetScale docs site.

## Set up the database

Before you can start the project, you should set up a database that can be used with the project. Create a database on PlanetScale named `travel_db`. Once the database has initialized, run the following command to create the necessary structures for the database and insert the sample dataset:

```bash
cd scripts
./seed-database.sh
```

## Start the API

To use the project, clone the repository down to your workstation and run the following commands:

```bash
npm install
npm start
```

You should receive a message stating that the API is running. 

## Test the API

The `tests.http` file can be used to test the various endpoints. It is designed to be used with the [VS Code Rest Client plugin](https://marketplace.visualstudio.com/items?itemName=humao.rest-client), although it can also be used as a reference in testing with alternate tools.

## Further reading

To learn more about the PlanetScale serverless driver for JavaScript, review the following articles:

- [Introducing the PlanetScale serverless driver for JavaScript](https://planetscale.com/blog/introducing-the-planetscale-serverless-driver-for-javascript)
- [The PlanetScale serverless driver for JavaScript documentation](https://planetscale.com/docs/tutorials/planetscale-serverless-driver)
