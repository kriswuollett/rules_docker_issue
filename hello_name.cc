#include <iostream>
#include <cstdlib>

int main() {
    const char* name = std::getenv("NAME");
    std::cout << "hello " << (name ? name : "you") << std::endl;
    return 0;
}
