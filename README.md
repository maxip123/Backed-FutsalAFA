# Futsal AFA - Backend

Este es el servidor de API REST para la plataforma de gestión de ligas de **Futsal AFA**, desarrollado en **Node.js** utilizando el framework **Express** y base de datos relacional **MySQL**.

## 🚀 Tecnologías Principales

*   **Entorno de Ejecución:** [Node.js](https://nodejs.org/) (ES Modules/CommonJS).
*   **Framework Web:** [Express](https://expressjs.com/) (para el enrutamiento y middleware).
*   **Base de Datos:** [MySQL](https://www.mysql.com/) (conectado mediante [mysql2](https://github.com/sidorares/node-mysql2)).
*   **Autenticación y Seguridad:** 
    *   [JSON Web Tokens (JWT)](https://jwt.io/) (para autenticación sin estado en endpoints protegidos).
    *   [bcrypt](https://github.com/kelektiv/node.bcrypt.js) (para hashing seguro de contraseñas).
    *   [Helmet](https://helmetjs.github.io/) (para proteger la API configurando varias cabeceras HTTP).
    *   [CORS](https://github.com/expressjs/cors) (para habilitar el intercambio de recursos de origen cruzado de manera controlada).
*   **Logger HTTP:** [Morgan](https://github.com/expressjs/morgan) (registro de peticiones en consola).
*   **Envío de Correos:** [Nodemailer](https://nodemailer.com/) (utilizado para el envío de enlaces de recuperación de contraseñas).

---

## 📁 Estructura del Proyecto

*   `config/`: Configuración y pool de conexión a la base de datos MySQL.
*   `controllers/`: Lógica de negocio (controladores de Sedes, Partidos, Equipos, Clasificaciones, etc.).
*   `Middleware/`: Middlewares globales y de autenticación (ej: validación de tokens JWT).
*   `routes/`: Definición de endpoints y asociación con sus respectivos controladores y middlewares.
*   `utils/`: Funciones auxiliares y herramientas compartidas (ej: utilidades de hash).
*   `services/`: Servicios adicionales (ej: configuración para el envío de correos).
*   `schema.sql`: Estructura y definición de las tablas de la base de datos.

---

## 🛠️ Instalación y Configuración

### 1. Prerrequisitos
Asegúrate de contar con [Node.js](https://nodejs.org/) y un servidor [MySQL](https://www.mysql.com/) en ejecución.

### 2. Base de Datos
Importa el esquema en tu instancia de MySQL para crear la estructura de tablas inicial:
```bash
mysql -u tu_usuario -p tu_base_de_datos < schema.sql
```

### 3. Variables de Envío (.env)
Crea un archivo `.env` en la raíz del directorio `backend` basándote en el archivo `.env.example` provisto:
```env
PORT=3000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=tu_contrasena
DB_NAME=futsal_afa
JWT_SECRET=tu_clave_secreta_para_jwt
EMAIL_USER=tu_correo@gmail.com
EMAIL_PASS=tu_contrasena_de_aplicacion
FRONTEND_URL=http://localhost:5173
```

### 4. Instalar Dependencias
```bash
npm install
```

### 5. Iniciar en Desarrollo
```bash
nodemon
```
El servidor backend se levantará por defecto en `http://localhost:3000/api`.
