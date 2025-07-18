from fastapi import FastAPI, File, UploadFile, HTTPException
from app.model import load_model, predict_image
from app.schemas import PredictionResponse
from fastapi.middleware.cors import CORSMiddleware
from app.utils.utils import read_imagefile, read_image
from app.routers import scan, disease, chat

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

try:
    model, class_labels = load_model()
except Exception as e:
    raise Exception(f"Failed to load model: {str(e)}")

@app.post("/predict", response_model=PredictionResponse)
async def predict(file: UploadFile = File(...)):
    try:
        image = read_image(await file.read())
        predicted_label, confidence = predict_image(image, model, class_labels)
        return {"label": predicted_label, "confidence": confidence}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Prediction failed: {str(e)}")
    
app.include_router(scan.router, prefix="/scan", tags=["Scan"])

app.include_router(disease.router, prefix="/diseases", tags=["Diseases"])

app.include_router(chat.router, prefix="/chat", tags=["Chat"])