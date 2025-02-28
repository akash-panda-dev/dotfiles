#!/bin/bash

# Check if version-set-revision parameter is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <version-set-revision>"
    echo "Example: $0 AWSAuthRuntimeService/development-mainline-2-11@B6301667006"
    exit 1
fi

VERSION_SET_REVISION=$1
APOLLO_CMD="/apollo/env/ApolloCommandLine/bin/apollo"

# Array of deployment targets
DEPLOYMENTS=(
    "AWSAuthRuntimeService/DUB/Alpha"
    "AWSAuthRuntimeService/HKG/Alpha"
    "AWSAuthRuntimeService/IAD/Alpha"
    "AWSAuthRuntimeService/IAD/OneBox/Alpha"
    "AWSAuthRuntimeService/IAD/Beta"
    "AWSAuthRuntimeService/IAD/Gamma"
    "AWSAuthRuntimeService/DUB/Gamma"
    "AWSAuthRuntimeService/HKG/Gamma"
    "AWSAuthRuntimeService/IAD-IA/3/Prod"
)

# Function to execute deployment
deploy() {
    local target=$1
    echo "Deploying to $target..."
    $APOLLO_CMD deploy --version-set-revision "$VERSION_SET_REVISION" "$target"
    echo "----------------------------------------"
}

# Execute deployments
for target in "${DEPLOYMENTS[@]}"; do
    deploy "$target"
done

echo "All deployments started!"
