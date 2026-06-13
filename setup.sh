# CHeck if .env exists, if not create it with default values from .env.example
if [ ! -f .env ]; then
  cp .env.example .env
  echo ".env file created with default values. Please review and update it as needed."
else
  echo ".env file already exists. Skipping creation."
fi