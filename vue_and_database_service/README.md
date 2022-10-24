# Jolie + vue

This is a a small show case on how to use Jolie to served Vue web application. Please see `backend.ol` for an example of creating a connection to Database with Jolie.

**Notice**: In this example, we use SQLite as a database, this required a presence of SQLite jdbc driver in `lib` directory. Make sure that you have the correct jdbc driver for the Database technology you are using.

## Project setup

Install npm/jpm dependencies

``` bash
npm install && jpm install
```

### Compiles and hot-reloads for development
``` bash
npm run serve # front-end only
```

``` bash
npm run watch # front-end build + serves by jolie
```

### Compiles and minifies for production
```
npm run build
```
