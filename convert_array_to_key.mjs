import { promises as fs } from 'fs';
import { Keypair } from '@solana/web3.js';
import bs58 from 'bs58';

// Fonction pour lire le fichier de clé
async function readKeyFile(path) {
    const data = await fs.readFile(path, 'utf-8');
    return JSON.parse(data);
}

// Chemin vers votre fichier de clé
const keyPath = '/root/.config/solana/id.json';

// Lire le fichier de clé
const keyData = await readKeyFile(keyPath);

// Créer un objet Keypair à partir des données
const keypair = Keypair.fromSecretKey(new Uint8Array(keyData));

// Obtenir la clé publique
const publicKey = keypair.publicKey.toBase58();

// Obtenir la clé privée
const privateKey = bs58.encode(keyData);

console.log(`Public Key: ${publicKey}`);
console.log(`Private Key: ${privateKey}`);