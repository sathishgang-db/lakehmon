
![GitHub repo size](https://img.shields.io/github/repo-size/sathishgang-db/lakehmon?style=for-the-badge)
![Framework](https://img.shields.io/badge/FRAMEWORK-FLUTTER-blue?style=for-the-badge&logo=Flutter)
![Platform](https://img.shields.io/badge/Platform-MacOS-blueviolet?style=for-the-badge&logo=Apple)
![Platform](https://img.shields.io/badge/Platform-Web-green?style=for-the-badge&logo=appveyor)


# Lakehmon -- The Monster in the Lakehouse
The repo shows how you can build cross platform applications with [Flutter](flutter.dev) , [fastAPI](https://fastapi.tiangolo.com/) and the Databricks APIs. Specifically, we use Databricks Serverless Serving capability to demonstrate the features of this web/desktop application. 

The web applications requires the intermediary - i.e. FASTAPI service to collect and send requests out to databricks while the desktop application does not. You can choose to try out the application in either way or both. 

[Click here for a Quick Cross-Platform Demo](https://www.youtube.com/watch?v=kYHJo_7FRcU)

For reference,here's the complete architecture which assumes that you'd need the backend service

Architecture:
![Architecture](image.png)

To reproduce demo:
1. Install Flutter locally
    -  On [Mac](https://docs.flutter.dev/get-started/install/macos#system-requirements). Go through the install guide until `flutter doctor` to ensure flutter is set up properly.
2. Clone repo to your machine
3. From the terminal `flutter run -d chrome`
4. Make sure the [backend service](https://github.com/sathishgang-db/lakehmon-backend) is running. If not, close the [repo](https://github.com/sathishgang-db/lakehmon-backend) & follow the steps on the repo's readme.
5. Enjoy the demo!
