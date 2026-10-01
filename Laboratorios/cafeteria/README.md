# Laboratorio: Mi Pedido de Cafetería

![alt text](image-2.png)
![alt text](image-3.png)
### Comprensión del código
**¿Cómo calcula el total y por qué conviene reutilizar ProductoPedido?**
El total se calcula multiplicando la cantidad actual de cada producto (almacenada en el estado) por su precio unitario fijo, y luego sumando los tres resultados en una función getter. Al estar conectada al método `setState`, esta suma se recalcula y la pantalla se redibuja en tiempo real cada vez que cambia una cantidad. 

Conviene reutilizar `ProductoPedido` porque elimina la duplicidad de código visual. En lugar de reescribir la misma fila tres veces, se crea un solo diseño estructurado que recibe el nombre, precio, cantidad y las funciones de los botones como parámetros. Esto facilita el mantenimiento, asegura coherencia visual y hace que la lectura de la pantalla principal sea más limpia.