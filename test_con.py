import os
import requests

# Remplace ICI par l'URL de ton API (tu la vois sur le portail Questrade, section 'API Setup')
# Ça ressemble souvent à : https://api01.iq.questrade.com
base_url = "https://api01.iq.questrade.com" 

api_key = os.environ.get('QUESTRADE_API_KEY')
headers = {"Authorization": f"Bearer {api_key}"}

try:
    # On ajoute /v1/accounts à l'URL de base
    response = requests.get(f"{base_url}/v1/accounts", headers=headers)
    print(f"Code HTTP: {response.status_code}")
    print(f"Réponse: {response.text}")
except Exception as e:
    print(f"Erreur: {e}")

input("Appuie sur Entrée pour quitter...")