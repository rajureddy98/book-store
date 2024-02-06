#!/bin/bash
cd bookstore-frontend-react-app
kubectl apply -f bookstore-frontend-react-app.yaml
cd ..
cd bookstore-eureka-discovery-service
kubectl apply -f bookstore-eureka-discovery-service.yaml
cd ..
cd bookstore-api-gateway-service
kubectl apply -f bookstore-api-gateway-service.yaml
cd ..
cd bookstore-account-service
kubectl apply -f bookstore-account-service.yaml
cd ..
cd bookstore-billing-service
kubectl apply -f bookstore-billing-service.yaml
cd ..
cd bookstore-catalog-service
kubectl apply -f bookstore-catalog-service.yaml
cd ..
cd bookstore-order-service
kubectl apply -f bookstore-order-service.yaml
cd ..
cd bookstore-payment-service
kubectl apply -f bookstore-payment-service.yaml
