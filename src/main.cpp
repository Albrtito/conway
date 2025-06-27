#include "add.h"
#include <SFML/Graphics.hpp>
#include <iostream>

int main() {
  int result = add(2, 3);

  std::cout << result << std::endl;

  // SFML 3.x syntax
  sf::RenderWindow window(sf::VideoMode({640u, 480u}), "SFML Application");
  sf::CircleShape shape;
  shape.setRadius(40.f);
  shape.setPosition({100.f, 100.f});
  shape.setFillColor(sf::Color::Cyan);

  while (window.isOpen()) {
    // SFML 3.x event handling
    while (auto event = window.pollEvent()) {
      if (event->is<sf::Event::Closed>()) {
        window.close();
      }
    }

    window.clear();
    window.draw(shape);
    window.display();
  }

  return 0;
}
