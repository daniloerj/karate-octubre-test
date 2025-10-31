@ignore
Feature: obtener un token de autenticación
  This feature obtiene un token de autenticación para usar en otras pruebas
  API Endpoint: /api/token

Scenario:
#obtener un token
  Given url  baseUrl
  And path 'posts',6
  And header Content-Type = 'application/json'
  When method get
  Then status 200
  And def authToken = response.title
  * print authToken