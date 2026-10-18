#include <iostream>

int main() {
    int a{};
    int b{};

    std::cout << "Введіть два цілих числа: ";
    std::cin >> a >> b;

    std::cout << "Сума: " << a + b << '\n';
    std::cout << "Добуток: " << a * b << std::endl;

    return 0;
}
