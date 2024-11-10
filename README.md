# Hello World - C++ 

## 📄 Project Description
This is a simple "Hello World" web application built using **C++**. The application listens on port `80` and returns a "Hello World from C++!" message when accessed.

## 🗂 Project Structure
cpp/ <br>
├── Dockerfile<br> 
├── hello.cpp <br>
├── fcgiwrap.conf <br>
├── nginx.conf <br>
└── README.md

## 🛠 Technologies Used
- C++
- Docker

## 🚀 How to Run

### 1. Build the Docker Image
docker build -t hello_cpp .
docker run -p 80:80 hello-world-cpp
Open your browser and navigate to: http://localhost

## Creator
https://github.com/aalopezb
