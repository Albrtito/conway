#include "add.h"
#include <SFML/Graphics.hpp>
#include <iostream>

int main() {
  int result = add(2, 3);

  std::cout << result << std::endl;

  // SFML 2.x syntax
  sf::RenderWindow window(sf::VideoMode(640, 480), "SFML Application");
  sf::CircleShape shape;
  shape.setRadius(40.f);
  shape.setPosition(100.f, 100.f);
  shape.setFillColor(sf::Color::Cyan);

  while (window.isOpen()) {
    sf::Event event;
    while (window.pollEvent(event)) {
      if (event.type == sf::Event::Closed) {
        window.close();
      }
    }

    window.clear();
    window.draw(shape);
    window.display();
  }

  return 0;
}
