#!/bin/bash

# Script to install Go programming language on Linux

# Define Go version and URL
GO_VERSION="1.23.2"  # Desired version
GO_TAR="go${GO_VERSION}.linux-amd64.tar.gz"
GO_URL="https://go.dev/dl/${GO_TAR}"

# Check if wget is installed
if ! command -v wget &> /dev/null
then
    echo "wget could not be found, please install it first."
    exit 1
fi

# Download Go
echo "Downloading Go version ${GO_VERSION}..."
wget -q "${GO_URL}" -O "${GO_TAR}"

# Remove any previous installations of Go
echo "Removing previous Go installation (if any)..."
sudo rm -rf /usr/local/go

# Extract the downloaded tarball
echo "Extracting Go..."
sudo tar -C /usr/local -xzf "${GO_TAR}"

# Add Go to the PATH
echo "Setting up Go environment..."
{
    echo "export PATH=\$PATH:/usr/local/go/bin"
} >> ~/.bashrc

# Load the new PATH
source ~/.bashrc

# Clean up
echo "Cleaning up..."
rm "${GO_TAR}"

# Verify installation
echo "Verifying Go installation..."
go version

echo "Go installation completed successfully!"

