# app_liffe_task_flutter

A new Flutter project.
ESPAÑOL
Enfoque Técnico

1. Arquitectura y Organización
   Arquitectura limpia: El proyecto se dividió en capas (modules, database, config, common) para garantizar modularidad y reusabilidad.
   Metodología Atomic Design: Utilicé este enfoque para construir widgets reutilizables de manera organizada, asegurando consistencia y fácil mantenimiento.
2. Simulación de Datos y Gestión de Estado
   Datos: Los datos fueron simulados con valores hardcodeados.
   Gestión de Estado: Utilicé BLoC y Cubit para separar la lógica de negocio de la interfaz, facilitando la escalabilidad y el control del estado.
3. Responsividad
   Implementé el widget LayoutBuilder para adaptar dinámicamente los diseños según el tamaño de la pantalla. Esto permitió transiciones fluidas entre vistas de escritorio y móvil.
4. Manejo de Datos Entre Plataformas
   BLoC a nivel de módulo: Para optimizar el rendimiento, el estado se gestionó a nivel de módulo en lugar de a nivel de proyecto. Esto permitió mantener los datos consistentes al cambiar entre vistas.
5. Solución de Problemas
   Se presentó un problema inicial con los colores del BottomNavigationBar. La solución fue encapsularlo dentro de un MaterialApp, lo que permitió manejar el tema de forma aislada.
6. Resultado Final
   La aplicación:
   Permite unirse a actividades si hay vacantes.
   Es completamente responsiva para dispositivos móviles y escritorio.
7. Mejoras Futuras
   Implementación de un modo oscuro para ofrecer una experiencia visual más personalizada y moderna.

ENGLISH
Technical Approach

8. Architecture and Organization
   Clean architecture: The project was divided into layers (modules, database, configuration, common) to ensure modularity and reusability.
   Atomic Design Methodology: I used this approach to build reusable widgets in an organized manner, ensuring consistency and easy maintenance.
9. Data Simulation and State Management
   Data: Data were simulated with coded values.
   State Management: Used BLoC and Cubit to separate the business logic from the interface, facilitating scalability and state control.
10. Responsiveness
    Implemented LayoutBuilder widget to dynamically adapt layouts based on screen size. This allows for seamless transitions between desktop and mobile views.
11. Data Management Between Platforms
    Module-level BLoC: To optimize performance, state was managed at the module level instead of the project level. This allowed data to be kept consistent when switching between views.
12. Troubleshooting
    There was an initial problem with the colors of BottomNavigationBar. The solution was to encapsulate it within a MaterialApp, which allowed the theme to be handled in isolation.
13. Final Result
    The application:
    Allows you to join activities if there are vacancies.
    It is fully responsible for mobile and desktop devices.
14. Future Improvements
    Implementation of a dark mode to offer a more personalized and modern visual experience.
