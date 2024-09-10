import json
import base58
from solana.keypair import Keypair

# Lire le fichier de clé
with open('/root/.config/solana/id.json', 'r') as f:
    keypair_data = json.load(f)

# Créer un objet Keypair à partir des données
keypair = Keypair.from_secret_key(bytes(keypair_data))

# Obtenir la clé privée en format base58
private_key = base58.b58encode(keypair.secret_key).decode()

# Obtenir la clé publique en format base58
public_key = str(keypair.public_key)

print(f"Private Key: {private_key}")
print(f"Public Key: {public_key}")
