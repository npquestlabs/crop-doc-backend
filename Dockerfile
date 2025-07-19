FROM tiangolo/uvicorn-gunicorn-fastapi:python3.10

WORKDIR /app

# Copy requirements first (caching optimization)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt --extra-index-url https://download.pytorch.org/whl/cpu

# Copy ONLY the app directory contents
COPY ./app /app

# Set Python path to look in /app
ENV PYTHONPATH=/app

# Verify the structure
RUN ls -la /app && \
    ls -la /app/utils

# Run from root of app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
