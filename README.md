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

### 2. Create and Activate Virtual Environment

```bash
python3 -m venv venv
source venv/bin/activate   # Linux/Mac
venv\Scripts\activate      # Windows
```

---

### 3. Install Dependencies

#### **Important: Manual PyTorch Installation**

Due to compatibility reasons, you need to install PyTorch manually before installing the rest of the dependencies.

1. **Edit `requirements.txt`**
   Remove these lines if present:

   ```
   torch==2.4.1+cpu
   torchvision==0.19.1+cpu
   ```

2. **Install PyTorch (CPU build)**

   ```bash
   pip install torch==2.6.0+cpu torchvision==0.21.0+cpu --index-url https://download.pytorch.org/whl/cpu
   ```

3. **Install Remaining Packages**

   ```bash
   pip install -r requirements.txt
   ```

---

### 4. Environment Variables

The application requires a `.env` file with configurations for Supabase and Gemini API keys.
**To obtain the `.env` file, contact the developer.**

---

### 5. Run the Application

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
