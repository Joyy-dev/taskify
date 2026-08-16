# Taskify

Taskify is a full-stack task management application featuring a modern cross-platform mobile frontend and a robust backend API.

## 🚀 Technologies Used

### Frontend (Flutter)
The mobile application is built using the Flutter framework, enabling high performance on both iOS and Android.

- **Framework**: [Flutter](https://flutter.dev/) (SDK: ^3.9.2)
- **State Management & Routing**: [GetX](https://pub.dev/packages/get)
- **Networking**: [Dio](https://pub.dev/packages/dio)
- **Local Storage**: [GetStorage](https://pub.dev/packages/get_storage)
- **Notifications**: [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications)
- **Other**: intl, uuid, timezone

### Backend (Node.js)
The backend is a RESTful API built with Node.js and Express, designed for security, speed, and scalability.

- **Runtime**: [Node.js](https://nodejs.org/)
- **Framework**: [Express](https://expressjs.com/)
- **Database ORM**: [Prisma](https://www.prisma.io/)
- **Database Engine**: PostgreSQL (`pg`)
- **Authentication**: JWT (`jsonwebtoken`) and `bcrypt` for password hashing
- **Security & Logging**: `helmet`, `cors`, `morgan`
- **Validation**: [Zod](https://zod.dev/)

## 📂 Project Structure

This is a monorepo containing both the frontend and the backend applications:

```text
taskify/
├── backend/    # Node.js Express server + Prisma API
└── frontend/   # Flutter mobile application
```

## 🛠️ Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Node.js](https://nodejs.org/) (v16 or higher recommended)
- PostgreSQL Database

### Backend Setup

1. Navigate to the backend directory:
   ```bash
   cd backend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Set up your environment variables:
   Create a `.env` file in the `backend` directory based on your configuration. You'll need at least `DATABASE_URL` and JWT secrets.
4. Run Prisma migrations:
   ```bash
   npx prisma migrate dev
   ```
5. Start the development server:
   ```bash
   npm run dev
   ```
   *(Note: ensure you have a `dev` script in your `package.json` utilizing `nodemon`, or run `npx nodemon src/server.js`)*

### Frontend Setup

1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the application:
   ```bash
   flutter run
   ```

## 📝 License

This project is licensed under the ISC License.
