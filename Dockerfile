FROM tiangolo/uvicorn-gunicorn-fastapi:python3.10

WORKDIR /app

# Copy requirements first for caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt --extra-index-url https://download.pytorch.org/whl/cpu

# Copy the entire app folder (including subfolders)
COPY ./app /app

# Set Python path (now /app contains main.py directly)
ENV PYTHONPATH=/app

# Verify the structure (debug)
RUN ls -la /app && \
    ls -la /app/routers

# Run from the /app directory where main.py lives
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
