# Mini-App Flutter con Formulario Validado y Autenticación Firebase

## 📱 Descripción del Proyecto

Esta es una aplicación móvil desarrollada en Flutter que incluye un formulario de ingreso de datos personales con validación completa y sistema de autenticación usando Firebase Authentication.

## ✨ Características Principales

### 🔐 Autenticación Firebase
- **Registro de usuarios** con email y contraseña
- **Inicio de sesión** seguro
- **Validación de credenciales** con mensajes de error descriptivos
- **Manejo de estados de autenticación** automático
- **Cerrar sesión** funcional

### 📋 Formulario Validado
- **Campos requeridos:**
    - Nombre (obligatorio, no vacío)
    - Edad (obligatorio, número entero mayor que 0 y menor que 120)
    - Correo electrónico (formato válido con regex)

### 🎯 Validaciones Implementadas
- Campos no vacíos
- Formato de email válido
- Edad numérica y dentro de rango realista
- Contraseña mínima de 6 caracteres
- Mensajes de error específicos y claros

### 🔄 Manejo de Estado
- Uso explícito de `setState()` para actualizar la interfaz
- Estados de carga durante autenticación
- Actualización dinámica de datos mostrados
- Limpieza de formularios

## 🖼️ Capturas de Pantalla

### Pantalla de Login/Registro
La aplicación inicia con una pantalla de autenticación donde el usuario puede:
- Alternar entre modo registro e inicio de sesión
- Ingresar email y contraseña
- Ver mensajes de error o éxito
- Acceder con indicador de carga

### Pantalla Principal (Formulario)
Una vez autenticado, el usuario accede a:
- Mensaje de bienvenida personalizado
- Formulario de datos personales
- Validación en tiempo real
- Botones para enviar y limpiar
- Visualización de datos ingresados en tarjeta
- Opción de cerrar sesión

### Diálogo de Confirmación
Al enviar el formulario válido:
- AlertDialog muestra los datos ingresados
- Confirmación de que la información fue procesada
- Opción para cerrar el diálogo

## 🛠️ Uso de la Aplicación

### Primer Uso (Registro)
1. **Abrir la aplicación**
2. **Seleccionar "Registrarse"**
3. **Ingresar email y contraseña** (mínimo 6 caracteres)
4. **Presionar "Registrarse"**
5. **Esperar confirmación** de registro exitoso

### Inicio de Sesión
1. **Ingresar credenciales** registradas
2. **Presionar "Iniciar Sesión"**
3. **Acceder automáticamente** al formulario

### Llenar Formulario
1. **Completar todos los campos:**
    - Nombre completo
    - Edad (número entero positivo)
    - Email válido
2. **Presionar "Enviar"** para validar
3. **Ver datos** en el diálogo de confirmación
4. **Los datos se muestran** también en una tarjeta debajo del formulario

### Funciones Adicionales
- **Limpiar:** Vacía todos los campos del formulario
- **Cerrar Sesión:** Regresa a la pantalla de login

## 🔧 Configuración Técnica

### Dependencias Principales
```yaml
dependencies:
  flutter: sdk: flutter
  firebase_core: ^2.24.2     # Core de Firebase
  firebase_auth: ^4.15.3     # Autenticación
  cupertino_icons: ^1.0.2    # Iconos iOS
```

### Estructura del Código
- **`main.dart`**: Archivo principal con toda la lógica
- **`MyApp`**: Widget raíz de la aplicación
- **`AuthWrapper`**: Maneja el estado de autenticación
- **`LoginScreen`**: Pantalla de login/registro
- **`HomeScreen`**: Pantalla principal con formulario

### Validaciones Implementadas
```dart
// Validación de email
RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)

// Validación de edad
final age = int.tryParse(value);
if (age == null || age <= 0 || age > 120) return 'Error';

// Validación de campos vacíos
if (value == null || value.isEmpty) return 'Campo requerido';
```

## 🚀 Instalación y Ejecución

### Prerrequisitos
- Flutter SDK instalado
- Proyecto Firebase configurado
- Android Studio / VS Code

### Pasos para ejecutar
1. **Clonar el repositorio**
```bash
git clone [URL_DEL_REPOSITORIO]
cd mini-app-firebase
```

2. **Instalar dependencias**
```bash
flutter pub get
```

3. **Configurar Firebase**
    - Crear proyecto en Firebase Console
    - Habilitar Authentication
    - Descargar `google-services.json` (Android)
    - Descargar `GoogleService-Info.plist` (iOS)

4. **Ejecutar la aplicación**
```bash
flutter run
```

## 🏗️ Arquitectura y Patrones

### Estado con setState
- Manejo explícito del estado local
- Actualización de UI reactiva
- Control de estados de carga

### Separación de Responsabilidades
- **AuthWrapper**: Lógica de autenticación
- **LoginScreen**: UI y validación de login
- **HomeScreen**: Formulario y validación de datos

### Manejo de Errores
- Try-catch para operaciones Firebase
- Validación de formularios robusta
- Mensajes de error contextuales

## 📋 Cumplimiento de Requisitos

✅ **Formulario con validación completa**
✅ **Manejo de estado con setState**
✅ **Autenticación Firebase funcional**
✅ **Interfaz amigable y responsiva**
✅ **AlertDialog para mostrar datos**
✅ **Mensajes de bienvenida**
✅ **Código bien estructurado**
✅ **Documentación completa**

## 👨‍💻 Desarrollado Por
[Tu Nombre]
Módulo de Desarrollo de Aplicaciones Móviles

---
*Proyecto académico - Flutter + Firebase Authentication*