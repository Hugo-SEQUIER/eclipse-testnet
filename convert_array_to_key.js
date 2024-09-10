const fs = require('fs');
const { Keypair } = require('@solana/web3.js');

// Fonction pour lire le fichier de clé
function readKeyFile(path) {
    return JSON.parse(fs.readFileSync(path, 'utf-8'));
}

// Chemin vers votre fichier de clé
const keyPath = '/root/.config/solana/id.json';

// Lire le fichier de clé
const keyData = readKeyFile(keyPath);

// Créer un objet Keypair à partir des données
const keypair = Keypair.fromSecretKey(new Uint8Array(keyData));

// Obtenir la clé publique
const publicKey = keypair.publicKey.toBase58();

// Obtenir la clé privée
const privateKey = Buffer.from(keypair.secretKey).toString('base64');

console.log(`Public Key: ${publicKey}`);
console.log(`Private Key: ${privateKey}`);