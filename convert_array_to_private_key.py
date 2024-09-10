import json
import base58
import hashlib

def pubkey_from_secret(secret_key):
    """Derive a 'public key' from the secret key."""
    return hashlib.sha256(secret_key).hexdigest()[:32]

# Lire le fichier de clé
with open('/root/.config/solana/id.json', 'r') as f:
    keypair_data = json.load(f)

# Convertir la clé privée en format base58
private_key = base58.b58encode(bytes(keypair_data)).decode()

# Générer une 'clé publique' à partir de la clé privée
# Note: Ceci n'est pas une vraie clé publique Solana, mais un substitut pour la démonstration
public_key = pubkey_from_secret(bytes(keypair_data))

print(f"Private Key: {private_key}")
print(f"Public Key: {public_key}")
