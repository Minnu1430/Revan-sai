# SMART CLASSIFIED AI
### Intelligent Newspaper Classified Extraction & Search Platform

Smart Classified AI is a full-stack web application designed to digitize classic newspaper classified pages. Users can upload scanned newspaper pages or PDFs, run an automated OCR process, structure the extracted advertisements using a specialized AI/NLP classification engine, and search the resulting digital archive using a premium, retro-themed newspaper UI with support for natural-language search queries.

---

## 🚀 Key Features

*   **Vintage Newspaper UI/UX**: Designed with a premium old-school aesthetic, incorporating Google Fonts (Playfair Display & Source Serif 4), double borders, multi-column articles, spotlight banners, and print-ready clippings.
*   **Dual-Mode OCR Engine**: Uses Tesseract.js to scan and extract text from JPG/PNG scans, and parses clean vector text from PDF editions automatically using a stream parser.
*   **Dual-Mode AI Classifier**:
    1.  **Gemini API**: Zero-shot extraction to parse Title, Category, Location, Phone, Email, Price, and Priority.
    2.  **Local NLP Parser**: A robust, zero-configuration regex and scoring engine that serves as a fallback if no Gemini API key is supplied.
*   **Smart Search**: Parses natural language search queries (e.g. *"Need 2BHK flat in Hyderabad below 60 lakhs"*) into structured database parameters (Location: Hyderabad, Category: Property, Budget: 60 Lakhs) using local rule parsers or Gemini API.
*   **Full Admin Suite**: Protected administrative dashboard to upload paper editions, supervise OCR log streams, correct AI classifications, toggle spotlights, and edit/delete listings.
*   **MySQL Backend**: Relational persistence linking accounts, editions, and classified listings with cascade handling.

---

## 📂 Project Structure

```text
Smart-Classified-AI/
├── database.sql           # Database schema and seed data
├── README.md              # Project documentation
│
├── backend/               # Node.js + Express backend
│   ├── server.js          # API Server entry point
│   ├── .env               # Server environment configurations
│   ├── db.js              # MySQL Connection configuration
│   ├── middleware/        # JWT Authentication checks
│   ├── controllers/       # Route request handlers
│   ├── routes/            # REST endpoint configurations
│   ├── services/          # Gemini API & Local NLP services
│   └── uploads/           # Directory where newspaper uploads are saved
│
└── frontend/              # Vite + React frontend
    ├── index.html         # Custom serif font loaders
    ├── vite.config.js     # Tailwind CSS compilation setup
    ├── src/
    │   ├── main.jsx       # App bootstrap
    │   ├── App.jsx        # Routing configuration
    │   ├── API/           # Axios HTTP client
    │   ├── components/    # Reusable UI widgets (Navbar)
    │   ├── styles/        # Tailwind v4 theme and style tokens
    │   └── pages/         # View components
```

---

## 🛠️ Installation & Setup

Follow these steps to launch the application on your local machine:

### 1. Database Configuration
1. Make sure your **MySQL server** is running (e.g. via XAMPP, Laragon, or standalone service).
2. Connect to your database console (using MySQL CLI, phpMyAdmin, or DBeaver) and run the SQL statements in the [database.sql](file:///c:/Users/Praneeth/Smart-Classified-AI/Smart-Classified-AI/database.sql) file to create the schema and populate seed data:
   ```bash
   # In terminal
   mysql -u root -p < database.sql
   ```
   *Note: This creates the database `smart_classified_ai` and seeds an admin user (`admin@classifieds.com` / `admin123`) and ten sample classifieds.*

### 2. Backend Setup
1. Navigate to the `backend` folder:
   ```bash
   cd backend
   ```
2. Install npm dependencies:
   ```bash
   npm install
   ```
3. Open [backend/.env](file:///c:/Users/Praneeth/Smart-Classified-AI/Smart-Classified-AI/backend/.env) and edit your MySQL credentials if they differ from the default (`root` / no password):
   ```env
   DB_PASSWORD=your_mysql_password
   GEMINI_API_KEY=your_gemini_api_key_optional
   ```
4. Start the server (runs on `http://localhost:5000`):
   ```bash
   npm run start
   ```

### 3. Frontend Setup
1. Open a new terminal and navigate to the `frontend` folder:
   ```bash
   cd frontend
   ```
2. Install npm dependencies:
   ```bash
   npm install
   ```
3. Start the Vite development server (runs on `http://localhost:5173`):
   ```bash
   npm run dev
   ```

---

## 🔒 Verification & Demo Guide

1.  **Browse Classifieds**: Open your browser at `http://localhost:5173`. You will see a premium newspaper dashboard filled with the seeded classifieds. Use the category tabs to filter ads, toggle between Card and Table view, or search.
2.  **Smart Search**: Type *"Need 2BHK flat in Hyderabad below 90 lakhs"* into the search box. Notice how the system filters the listings down.
3.  **Administrator Access**:
    *   Click **Login** in the top navigation.
    *   Enter **Email**: `admin@classifieds.com` and **Password**: `admin123`.
    *   Click **Enter Platform**. You will be redirected to the **Admin Control Center**.
4.  **Upload & OCR Processing**:
    *   Click **Upload New File**.
    *   Select a PDF or scanned newspaper image.
    *   Enter a newspaper name (e.g. *"Times of India"*) and date, then upload.
    *   In the OCR page, click **Run OCR**. Watch the real-time scanning animation and status logs update.
    *   Correct the parsed titles/prices or adjust categories, then click **Save Classifieds to DB**.
    *   Return to the home page to view your newly structured listings!
