# Flutter Code Challenge: SkyWatch

To set up and run the project, follow these steps:

1. Clone the repository to your local machine.
2. Ensure that you have Flutter version 3.13.9 installed on your machine.
3. Run the command `flutter pub get` to install project dependencies.
4. Run the command `flutter run` to start the project.

Regarding the architecture, the project follows the Clean Architecture, with the separation of layers into Presentation, Domain, and Data. The Presentation layer is responsible for the user interface, the Domain layer handles business logic, and the Data layer is responsible for data access. Additionally, the project employs the BLoC (Business Logic Component) state management architecture, which is responsible for managing the application state reactively and separately from the user interface.

Concerning testing, the project includes unit tests and widget tests. Unit tests are located in the `test/unit` folder, and widget tests are located in the `test/widget` folder. To run the tests, execute the command `flutter test`.

About the services used:

- OpenWeatherMap: A weather forecast service used to retrieve weather information.
- Firebase Storage: A file storage service used to store user videos.
- Firebase Firestore: A NoSQL database used to store information about user videos.