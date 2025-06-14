# 🏦 KipuBank - ETH Deposit and Withdrawal Vault

**KipuBank** es un contrato inteligente en Solidity que permite a los usuarios depositar y retirar ETH bajo ciertas restricciones, garantizando la seguridad del contrato y el control de los fondos. Está desarrollado como parte del Módulo 2 del curso Web3, aplicando buenas prácticas de Solidity y manejo de errores personalizados.

---

## 📜 Descripción

KipuBank actúa como una bóveda personal de ETH para cada usuario, donde se puede:

- Depositar ETH
- Retirar ETH con un límite por transacción (`withdrawLimit`)
- Consultar el balance personal
- Controlar el número de depósitos y retiros por usuario
- Obtener estadísticas por usuario (total de: balance, depósitos y retiros)

---

## 🚀 Instrucciones de Despliegue

> Estas instrucciones asumen que estás usando **Remix**.

1. Abre [Remix IDE](https://remix.ethereum.org/)
2. Crea un nuevo archivo llamado `KipuBank.sol` y pega el código del contrato
3. Compila el contrato usando el compilador 0.8.20
4. En la pestaña **Deploy & Run Transactions**:
   - Selecciona el entorno `Injected Provider - Metamask`
   - Selecciona la red **Sepolia Testnet**
   - Ingresa los parámetros del constructor:
     - `bankCap`: por ejemplo `10000000000000000000` (10 ETH)
     - `withdrawLimit`: por ejemplo `1000000000000000000` (1 ETH)
   - Haz clic en **Deploy**
5. Copia la dirección del contrato desplegado y verifica el contrato en [Sepolia Etherscan](https://sepolia.etherscan.io/)

---

## 🧪 Cómo interactuar con el contrato

### Funciones disponibles

#### `deposit()` (payable)
Deposita ETH al contrato, siempre y cuando el total no supere el `bankCap`.
- Incrementa el balance del usuario y su contador de depósitos

#### `withdraw(uint256 amount)`
Permite retirar un monto de ETH dentro del `withdrawLimit` y que el usuario tenga suficiente balance.
- Reduce el balance del usuario y suma a su contador de retiros

#### `getBalance(address user) → uint256`
Devuelve el balance de un usuario específico.

#### `depositCount(address) → uint256`
Devuelve la cantidad de depósitos realizados por un usuario.

#### `withdrawalCount(address) → uint256`
Devuelve la cantidad de retiros realizados por un usuario.

---

## 📍 Contrato desplegado

- 🧾 Dirección: [`0xf7770a85a3003AEc8eb17Bab1fC1C2AedfB0eBFc`](https://sepolia.etherscan.io/address/0xf7770a85a3003AEc8eb17Bab1fC1C2AedfB0eBFc)
- 🌐 Red: **Sepolia Testnet**

---

## 📦 Herramientas utilizadas

- Remix IDE
- Solidity 0.8.20
- Sepolia Testnet
- Etherscan (verificación de contrato)
