// Цей файл не потрібно змінювати.
// Він автоматично вмикає UTF-8 у консолі Windows ще до запуску main(),
// щоб українські літери виводилися й вводилися правильно.
// На Linux і macOS файл нічого не робить.

#ifdef _WIN32
#include <windows.h>

namespace {
struct ConsoleUtf8 {
    ConsoleUtf8() {
        SetConsoleOutputCP(CP_UTF8);
        SetConsoleCP(CP_UTF8);
    }
};

const ConsoleUtf8 consoleUtf8;
}  // namespace
#endif
