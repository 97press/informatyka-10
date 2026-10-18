# Допоміжні функції курсу. Цей файл не потрібно змінювати.

set(COURSE_COMMON ${CMAKE_CURRENT_LIST_DIR})

# Програма = один .cpp + console_utf8.cpp (українські літери в консолі Windows).
function(course_program target source)
    add_executable(${target} ${source} ${COURSE_COMMON}/console_utf8.cpp)
endfunction()

# Тести «вхід → результат»: для кожного tests/<ціль>/NN.in має бути NN.ans.
# У CLion: конфігурація «All CTest» або Run → Run 'All CTest'.
function(course_tests target dir)
    file(GLOB inputs ${dir}/*.in)
    foreach(input ${inputs})
        get_filename_component(name ${input} NAME_WE)
        add_test(NAME ${target}_${name}
                 COMMAND ${CMAKE_COMMAND} -DEXE=$<TARGET_FILE:${target}> -DIN=${input}
                         -DANS=${dir}/${name}.ans -P ${COURSE_COMMON}/run_test.cmake)
    endforeach()
endfunction()
