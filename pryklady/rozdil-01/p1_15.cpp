#include <iostream>

int main() {
    int students{};
    int seatsPerBus{};

    std::cin >> students >> seatsPerBus;

    int buses = (students + seatsPerBus - 1) / seatsPerBus;
    int freeSeats = buses * seatsPerBus - students;

    std::cout << "Автобусів: " << buses << '\n';
    std::cout << "Вільних місць: " << freeSeats << '\n';

    return 0;
}
