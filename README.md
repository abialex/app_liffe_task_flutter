# 🌐 **Responsive Web Project for Activities**

This project is a responsive web application designed for users to:

- **Filter activities by categories.**
- **Join activities if vacancies are available.**
- Fully compatible with mobile and desktop devices, providing a smooth and modern user experience.

---

## 🚀 **Main Features**

1. **Clean Architecture:**  
   The project is divided into layers (`modules`, `database`, `config`, `common`) to ensure modularity, maintainability, and reusability.

   - Reusable widgets designed with the **Atomic Design** methodology.

2. **State Management with BLoC and Cubit:**  
   Implemented BLoC to efficiently handle state management and ensure a clear separation between business logic and UI.

3. **Responsive Design:**  
   Used **`LayoutBuilder`** to dynamically adapt widgets based on screen size, enabling seamless transitions between web and mobile views.

4. **Performance Optimization:**  
   Elevated the BLoC to the module level to maintain local states when switching between web and mobile views, improving performance.

5. **Problem-Solving:**  
   Solved an initial issue with changing `BottomNavigationBar` colors by encapsulating it within a **`MaterialApp`**, isolating theme changes.

6. **Final Results:**

   - Users can only join activities if vacancies are available.
   - The application is fully responsive, offering an optimal experience on both mobile and desktop devices.

7. **Future Improvements:**
   - Implement **dark mode** for a more personalized and modern user experience.

---

## 🛠️ **Technologies Used**

| Technology         | Purpose                           |
| ------------------ | --------------------------------- |
| **Flutter**        | Main framework                    |
| **BLoC and Cubit** | State management                  |
| **LayoutBuilder**  | Responsive design and UI adaption |
| **Atomic Design**  | Methodology for reusable widgets  |

--
## 📋 **How to Run the Project**

1. **Clone this repository:**
   ```bash
   git clone https://github.com/abialex/app_liffe_task_flutter.git
2. **Run this script**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
3. **Install dependencies**
   ```bash
   flutter pub get
4. **Run the application**
   ```bash
   flutter run -d chrome

