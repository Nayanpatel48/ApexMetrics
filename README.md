### To run `web` client : `flutter run -d web-server`

### To run server : `uvicorn app.main:app --reload`

## Tools used:

### Front End

Fultter
Riverpod

### Back End

FastAPI
Pydantic
SQLAlchemy
Postgresql

### db username :postgres

### db password :123456789

### hostname : localhost

### port : 5432

### Create New Flutter Project = flutter create <project_name>

### Check Flutter SDK Version = flutter --version

### Check Connected Devices = flutter devices

### Create Virtual Environment = python3 -m venv venv

### Activate Virtual Environment = source ./venv/bin/activate

### Run fastapi server on Different Port = uvicorn main:app --host 0.0.0.0 --reload

### Check Process on Port 8000 = lsof -i :8000

### Kill the Process = kill -9 <PID> (replace <PID> with process ID from output)

### Build Runner (Code Generation) = flutter pub run build_runner build --delete-conflicting-outputs

### to run on web server (website) : flutter run -d web-server
