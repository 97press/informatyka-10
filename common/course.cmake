# Допоміжні функції курсу. Цей файл не потрібно змінювати.

set(COURSE_COMMON ${CMAKE_CURRENT_LIST_DIR})

# Програма = один .cpp + console_utf8.cpp (українські літери в консолі Windows).
function(course_program target source)
    add_executable(${target} ${source} ${COURSE_COMMON}/console_utf8.cpp)
endfunction()

# Тести «вхід → результат»: для кожного tests/<ціль>/NN.in має бути NN.ans.
# Створює ціль check_<ціль>: збирає лише цю програму й проганяє лише її тести.
# У CLion: виберіть check_pr01_task2 у списку конфігурацій і натисніть Build (Ctrl + F9).
function(course_tests target dir label)
    file(GLOB inputs ${dir}/*.in)
    foreach(input ${inputs})
        get_filename_component(name ${input} NAME_WE)
        add_test(NAME ${target}_${name}
                 COMMAND ${CMAKE_COMMAND} -DEXE=$<TARGET_FILE:${target}> -DIN=${input}
                         -DANS=${dir}/${name}.ans -P ${COURSE_COMMON}/run_test.cmake)
        set_tests_properties(${target}_${name} PROPERTIES LABELS ${label})
    endforeach()
    add_custom_target(check_${target}
        COMMAND ${CMAKE_CTEST_COMMAND} -R "^${target}_[0-9]+$" --output-on-failure
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR} DEPENDS ${target} USES_TERMINAL VERBATIM)
endfunction()

# Ціль check_<практична>: збирає задачі однієї практичної й проганяє лише її тести.
function(course_check label)
    add_custom_target(check_${label}
        COMMAND ${CMAKE_CTEST_COMMAND} -L "^${label}$" --output-on-failure
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR} DEPENDS ${ARGN} USES_TERMINAL VERBATIM)
endfunction()

# Ціль zdaty_<практична>: пакує taskN.cpp у zdacha/prNN_prizvyshche_imia.zip (див. zdaty.cmake).
function(course_zdaty label)
    add_custom_target(zdaty_${label}
        COMMAND ${CMAKE_COMMAND} -DROOT=${CMAKE_SOURCE_DIR} -DPR=${label} -DSRC=${CMAKE_CURRENT_SOURCE_DIR}
                -P ${COURSE_COMMON}/zdaty.cmake
        USES_TERMINAL VERBATIM)
endfunction()
