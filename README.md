**En este examen, los estudiantes aplicarán el conocimiento fundamental adquirido en el Módulo 2 desarrollando, desplegando y documentando su primer proyecto completo de smart contract.**

### **¿Por qué es importante?**

Este examen es un paso crítico en su camino como desarrollador Web3. No se trata solo de escribir Solidity, se trata de escribir contratos inteligentes _seguros, mantenibles y bien documentados_. Aplicarán mejores prácticas de desarrollo, patrones de seguridad que protegen protocolos del mundo real, y aprenderán a presentar su trabajo profesionalmente a través de GitHub.

Esta tarea práctica conecta la teoría con la aplicación, preparándolos para contribuciones y colaboraciones reales en el ecosistema Ethereum.

### **Objetivos del Examen**

*   Aplicar conceptos centrales de Solidity aprendidos en clase
    
*   Seguir patrones de seguridad
    
*   Usar comentarios y estructura limpia para mejorar la legibilidad y mantenibilidad del contrato
    
*   Desplegar un smart contract completamente funcional en una testnet
    
*   Crear un repositorio GitHub que documente y muestre su proyecto
    

### **Descripción de la Tarea y Requisitos**

**Su tarea es recrear el smart contract KipuBank con funcionalidad completa y documentación como se describe a continuación.**

**Características de KipuBank:**

*   Los usuarios pueden depositar tokens nativos (ETH) en una bóveda personal
    
*   Los usuarios pueden retirar fondos de su bóveda, pero solo hasta un **umbral fijo** por transacción, representado por una variable immutable
    
*   El contrato enforce un **límite global de depósito** (bankCap), establecido durante el despliegue
    
*   Las interacciones internas y externas deben seguir mejores prácticas de seguridad y declaraciones revert con errores personalizados claros si no se cumplen las condiciones
    
*   Los eventos deben emitirse tanto en depósitos como en retiros exitosos
    
*   El contrato debe llevar el registro del número de depósitos y retiros
    
*   El contrato debe tener al menos una función **external**, una **private**, y una **view**
    

**Prácticas de Seguridad a Seguir:**

*   Usar **errores personalizados** en lugar de strings de require
    
*   Respetar el patrón **checks-effects-interactions** y convenciones de nomenclatura
    
*   Usar modificadores donde sea apropiado para validar lógica
    
*   Manejar transferencias nativas de forma segura
    
*   Mantener variables de estado limpias, legibles y bien comentadas
    
*   Agregar comentarios NatSpec para cada función, error y variable de estado
    
*   Aplicar convenciones de nomenclatura apropiadas
    

### **Entregables**

**1\. URL del Repositorio GitHub** Un repo público llamado kipu-bank que contenga:

*   Su código de smart contract dentro de una carpeta /contracts con los siguientes componentes:
    
    *   Variables Immutable || Constant
        
    *   Variables de Storage
        
    *   Mapping
        
    *   Eventos
        
    *   Errores Personalizados
        
    *   Constructor
        
    *   Modificador
        
    *   Función External Payable
        
    *   Función Private
        
    *   Función External View
        
*   Un README.md bien estructurado que incluya:
    
    *   Descripción de qué hace el contrato
        
    *   Instrucciones de despliegue
        
    *   Cómo interactuar con el contrato
        

**2\. Dirección del Contrato Desplegado** En una testnet con código fuente verificado en un explorador de bloques.

Primer Deadline - > sabado 14 a media noche

Segundo Deadline - > lunes 16 a media noche
