sudo apt update && sudo apt upgrade -y

# Install Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
source ~/.bashrc
nvm install 20
node -v

echo
echo '---- Nodejs installed ----'
echo

npm install -g yarn

# Install Solana CLI
sh -c "$(curl -sSfL https://release.anza.xyz/stable/install)"
export PATH="/root/.local/share/solana/install/active_release/bin:$PATH"
source ~/.bashrc
solana --version


echo
echo '---- Solana Installed ----'
echo

# Solana config
solana config set --url https://staging-rpc.dev2.eclipsenetwork.xyz
solana-keygen new -o /root/.config/solana/id.json
apt-get install -y python3-pip
pip install json base58 solana
solana airdrop 10

echo
echo '---- Your Private Key (to export on a Wallet Manager) ----'
python3 convert_array_to_private_key.py
echo '---- Your Private Key (to export on a Wallet Manager) ----'
echo
echo '---- Solana Configured ----'
echo

yarn install

# Private Key Setup
echo "Provide an ETH Private Key (I recommand to use a fresh account to prevent any risk) : "
read private_key

# Enregistrer la clé publique dans un fichier
echo $private_key > private-key.txt

echo "Your private has been stored in private-key.txt"
echo "We need it to sign the bridge"
echo "Also you need to have at least 0.02 ETH on Sepolia network on this address"
echo "Please enter the destination Eclipse public key:"
read PUBLIC_KEY_ECLIPSE


node bin/cli.js -k private-key.txt -d $PUBLIC_KEY_ECLIPSE -a 0.02 --sepolia

echo "0.02 ETH has been bridged from Sepolia to Eclipse"