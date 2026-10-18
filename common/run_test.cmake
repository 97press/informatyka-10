# Запускає програму EXE з даними IN і порівнює виведення з ANS.
# Пробіли в кінці рядків і порожні рядки в кінці не враховуються.
execute_process(COMMAND ${EXE} INPUT_FILE ${IN} OUTPUT_VARIABLE out RESULT_VARIABLE code TIMEOUT 5)
file(READ ${ANS} expected)
foreach(var out expected)
    string(REPLACE "\r" "" ${var} "${${var}}")
    string(REGEX REPLACE "[ \t]+\n" "\n" ${var} "${${var}}")
    string(REGEX REPLACE "[ \t\n]+$" "" ${var} "${${var}}")
endforeach()
if(NOT code EQUAL 0)
    message(FATAL_ERROR "Програма завершилася з помилкою (код ${code}).")
endif()
if(NOT out STREQUAL expected)
    # NOTICE друкує текст як є; FATAL_ERROR позначає тест як непройдений.
    message(NOTICE "--- Очікувалося:\n${expected}\n--- Ваша програма вивела:\n${out}\n---")
    message(FATAL_ERROR "Неправильна відповідь.")
endif()
