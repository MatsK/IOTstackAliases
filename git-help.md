# Usefull commands to setup "git"
git init

git config -l

git config --global user.email="mats.o.karlsson@gmail.com"

git config --global user.name="matsk"


# Cache Token
git config --global credential.helper cache

# Remove cached token
git config --global unset credential.helper
