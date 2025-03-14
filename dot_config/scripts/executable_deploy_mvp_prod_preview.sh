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
    "AWSAuthRuntimeService/APA/ProdPreviewBox/Prod"
    "AWSAuthRuntimeService/ALE/ProdPreviewBox/Prod"
    "AWSAuthRuntimeService/DCA-P/ProdPreviewBox/Prod"
    "AWSAuthRuntimeService/P1/LCK/ProdPreviewBox/Prod"
    "AWSAuthRuntimeService/LTW/ProdPreviewBox/Prod"
    "AWSAuthRuntimeService/NCL/ProdPreviewBox/Prod"
)

# Function to execute deployment
deploy() {
    local target=$1
    echo "Deploying to $target..."
    deployment_output=$($APOLLO_CMD deploy --version-set-revision "$VERSION_SET_REVISION" "$target")
    deployment_id=$(echo "$deployment_output" | jq -r '.deployment_id')
    echo "https://apollo.amazon.com/deployments/$deployment_id"
    echo "----------------------------------------"
}
# Execute deployments
for target in "${DEPLOYMENTS[@]}"; do
    deploy "$target"
done

echo "All deployments started!"
