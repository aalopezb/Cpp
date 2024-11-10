#include <fcgi_stdio.h>
#include <iostream>

int main() {
    while (FCGI_Accept() >= 0) {
        std::cout << "Content-Type: text/html\r\n\r\n";
        std::cout << "<html><body><h1>Hello World from C++!</h1></body></html>";
    }
    return 0;
}
