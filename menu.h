#ifndef SRC_MENU_H
#define SRC_MENU_H

#include <string>

#include "graph.h"
#include "graph_algorithms.h"

namespace newstd {
class Menu {
 public:
  Menu() : choose("1"), loaded(false){};
  ~Menu(){};
  void MainMenu();
  void SelectMethodToPrint();

 private:
  Graph graph;
  GraphAlgorithms algorithms;
  std::string choose;
  bool loaded;
};
}  // namespace newstd

#endif  // SRC_MENU_H
