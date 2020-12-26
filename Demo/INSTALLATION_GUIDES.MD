# Eco Bike Rental App
Eco Bike Rental is a General Flutter Application for ITSS Software Development 2020.
## 1. Description
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.
## 2. Prerequisites
**Flutter SDK**
`https://flutter.dev/docs/get-started/install`

**Android Studio**
`https://developer.android.com/studio`

**Android or IOS Physical Device/Virtual Device**

## 3. Installing
### 3.1 Clone
Clone this repo to your local machine using `git clone`
### 3.2 Running the Application
#### 3.2.1 Using release app
- Move to /Programming/EcoBikeRentalApp.apk for a release version of our android app
#### 3.2.2 Using Android Studio
- First check for connected devices and installed flutter package with `flutter doctor`
- Connect your virtual device (From Android Studio) or connect with your physical device with Development Mode
- Install Required Packages with
```
flutter pub get
flutter pub upgrade
```
- Run `flutter run` or Press the Run Button on Android Studio

### 3.2.3 Additional Information
- If your app show 'Connect To Server Error', it might have some problem with our Database Server. You could deploy your own server to the VMs in `/Programming/db_api_subsystem` write in nodejs. We will guide you through some step for deploying your own Database & Backend Server
#### 3.2.3.1 Prerequisites
- NodeJS and PostgreSQL DBMS
#### 3.2.3.2 Running Server
- Running `npm install` to install all required packages
- Setting Database Connection (User,Password & Database) in .env file
- Running **init.sql** and **insert_data.sql** Script file to initialize Database Data & Table in your DBMS
- Running `npm start` for starting up the database.
- Deploying to Google App Engine Server: edit **app.yaml** file to deploy to your App Engine Instance.
## 4. Built with
- Flutter SDK

## 5. Documentation
### 5.1 API Documentation
* [Postman API Doc](hhttps://documenter.getpostman.com/view/8571496/TVsxB6dQ#0d575686-c55b-4a46-a527-3dc900d36840)
## Version
0.0.1
## Authors
- Trung Dung Vu
- Nguyen Xuan Hoang
- Nguyen Trung Nghia
- Nguyen Ngoc Quy