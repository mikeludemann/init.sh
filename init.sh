#!/bin/bash

echo "Checking and installing some applications with differents tools"
echo "In file 'applications.txt' are all applications which we install with node/npm (Global)"

apps=./applications.txt

if node -v > /dev/null; then
  if npm -v > /dev/null; then
    if [ -e "$apps" ]; then
      echo "File - applications.txt - exists"
      while read -r line
      do
        app=`echo $line | cut -d \; -f 1`
        npm install -g $app
      done < $apps
    else
      echo "File not exists"
    fi
  else
    echo "npm is not installed"
  fi
else
  echo "node is not installed"
fi

echo "Downloading Yarn with homebrew"
if brew -v > /dev/null; then
  brew install yarn
else
  echo "homebrew is not installed"
fi

echo "Downloading compass with gem by Ruby"
if gem -v > /dev/null; then
  gem install compass
else
  echo "gem or ruby is not installed"
fi

echo "Downloading meteor with curl"
if curl --version > /dev/null; then
  curl https://install.meteor.com/ | sh
else
  echo "curl is not installed"
fi

echo "Downloading PHPUnit and modified access and move to bin path"
if phpunit -version > /dev/null; then
  curl https://phar.phpunit.de/phpunit.phar -L -o phpunit.phar
  chmod +x phpunit.phar
  mv phpunit.phar /usr/local/bin/phpunit
else
  echo "PHPUnit is not installed"
fi

echo "Downloading version management with brew"
if git --version > /dev/null; then
  echo "git is already installed."
else
  echo "installing git."
  if brew -v > /dev/null; then
    echo "installing git and svn with brew"
    brew install git
    brew install svn
  else
    echo "brew is not installed"
  fi
fi

echo "Downloading node and npm with brew"
if brew --version > /dev/null; then
  echo "installing node and npm"
  brew install node
else
  echo "brew is not installed"
fi