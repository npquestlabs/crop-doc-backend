# CropDoc API

CropDoc is a backend service built with **FastAPI** for crop disease detection, AI-powered agricultural assistance, and scan history management. It integrates with Supabase for data storage and Gemini for intelligent chat responses.

---

## Features

- Plant disease diagnosis via image upload
- AI-powered chat assistant
- User authentication with JWT
- Scan history management
- Feedback on scan results

---

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/npquestlabs/crop-doc-backend.git
cd crop-doc-backend
```

### 2. Install Dependencies

Create a virtual environment and install requirements:

```bash
python3 -m venv venv
source venv/bin/activate   # For Linux/Mac
venv\Scripts\activate      # For Windows

pip install -r requirements.txt
```

---

### 3. Environment Variables

The application requires a `.env` file with configurations for Supabase and Gemini API keys.
**To obtain the `.env` file, contact the developer.**

---

### 4. Run the Application

Start the FastAPI server:

```bash
uvicorn app.main:app --reload
```

The API documentation will be available at:

- Swagger UI: `http://127.0.0.1:8000/docs`
- ReDoc: `http://127.0.0.1:8000/redoc`

---

## Testing Endpoints

### Authorization

Most endpoints require **Bearer Token** authentication.

#### How to Get a Token:

1. Navigate to the `test` folder.
2. Run the test script:

```bash
python test.py
```

3. Copy the generated JWT token from the output.

#### Authorize in Swagger:

- Open `http://127.0.0.1:8000/docs`
- Click the **Authorize** button
- Paste the JWT token in this format:

```
Bearer <your-token>
```

---

## Key Endpoints

### **Scan**

- `POST /scan/`
  Upload an image to detect disease and retrieve treatment suggestions.

### **History**

- `GET /scan/history`
  Get scan history for the authenticated user.

- `GET /scan/history/{id}`
  Get details of a specific scan.

- `DELETE /scan/history/{id}`
  Delete a scan record.

### **Feedback**

- `POST /scan/feedback`
  Add feedback for a scan result.

### **Diseases**

- `GET /disease/`
  Fetch all diseases.
- `GET /disease/{id}`
  Fetch a specific disease by ID.
- `GET /disease/search?query=...`
  Search diseases by name.
- `GET /disease/category?category=...`
  Filter diseases by category.

### **Chat**

- `POST /chat/message`
  Send a message for AI-powered farming advice.
  Response includes the answer and 3 suggested follow-up questions.

---

## Notes

- Ensure you use the provided JWT token for all authorized routes.
- The application currently supports **English** responses for chat; localization support will be added later.

---

### Next Steps:

- Add Docker support for containerized deployment.
- Implement persistent chat history (optional for MVP).
- Deploy to production environment.

---
