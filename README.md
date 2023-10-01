![giphy](https://github.com/santimattius/dart_hexagonal_architecture_api/assets/22333101/c3dd2d48-2198-4911-a2c5-be195e2e4196)

# dart_hexagonal_architecture_api
Example project applying hexagonal architecture with Dart Frog

<p align="center">
  <img width="500" src="https://github.com/santimattius/kotlin-hexagonal-architecture/blob/master/images/arch_hexa.png?raw=true" alt="Layers"/>
</p>

## Layers

**Domain**

Concepts that are in our context (User, Product, Cart, etc), and business rules that are determined exclusively by us (
domain services),

**Application**

The application layer is where the use cases of our application live (register user, publish product, add product to
cart, etc).

**Infrastructure**

Code that changes based on external decisions. In this layer will live the implementations of the interfaces that we
will define a domain level. That is, we will rely on the SOLID DIP to be able to decouple from external dependencies.

## Application

### Check

```shell
./gradlew check
```

### Run applications

```shell
# 🏁 Start the dev server
dart_frog dev
```

## HealthCheck

```shell
curl --location --request GET 'http://localhost:8080/ping'
```

## Examples

**POST**

```shell
curl --location --request POST 'http://localhost:8080/product' \
--header 'Content-Type: application/json' \
--data-raw '{
    "id": "uuid"
    "name": "product name",
    "price": 120
}'
```

**GET**

Get all products

```shell
curl --location --request GET 'http://localhost:8080/product'
```

Get product by id

```shell
curl --location --request GET 'http://localhost:8080/product/9e6fcea9-237e-4055-ab31-95f90aac2f80'
```

## Frameworks
- [DartFrog](https://dartfrog.vgv.dev/)

