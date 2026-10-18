cmake_minimum_required(VERSION 3.20)
project(informatyka10 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Попередження компілятора — наші помічники, не вимикаємо їх.
add_compile_options(-Wall -Wextra)

enable_testing()
include(common/course.cmake)

# Кожна програма — окрема ціль: виберіть її у списку конфігурацій угорі праворуч.
add_subdirectory(pryklady)
add_subdirectory(praktychni)
