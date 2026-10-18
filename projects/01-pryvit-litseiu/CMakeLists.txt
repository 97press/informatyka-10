cmake_minimum_required(VERSION 3.20)
project(pryvit LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Попередження компілятора — наші помічники, не вимикаємо їх.
add_compile_options(-Wall -Wextra)

# console_utf8.cpp вмикає UTF-8 у консолі Windows.
add_executable(pryvit main.cpp console_utf8.cpp)
