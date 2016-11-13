#!/bin/bash
echo "Welcome, image builder for Intellij on Docker"
echo "=============================================="
echo ""

echo "Ingrese un nombre para su imagen"
read image_name

echo "Building image........ (this will take some time)"
docker build -t "$image_name" .