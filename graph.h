#ifndef SRC_newstd_GRAPH_H
#define SRC_newstd_GRAPH_H

#include <fstream>
#include <iostream>
#include <string>
#include <vector>

namespace newstd {
class Graph {
 public:
  Graph() : size_(0){};
  ~Graph(){};

  void LoadGraphFromFile(std::string filename);
  void ExportGraphToDot(std::string filename);
  std::vector<std::vector<double> > GetMatrix() { return matrix_; }
  int GetVertexCount() { return size_; }

 private:
  int size_;
  std::vector<std::vector<double> > matrix_;
};
}  // namespace newstd

#endif  // SRC_newstd_GRAPH_H
