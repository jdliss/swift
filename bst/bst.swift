class Node {
    var name: String
    var score: Int

    var lchild: Node!
    var rchild: Node!

    init(_ name: String, _ score: Int) {
        self.name = name
        self.score = score

        self.lchild = nil
        self.rchild = nil
    }

    func isLeaf() -> Bool {
        return self.rchild == nil && self.lchild == nil ? true : false
    }

}

class BST {
    var root: Node!

    init() {
        self.root = nil
    }

    init(_ node: Node) {
        self.root = node
    }

    init(_ name: String, _ score: Int) {
        self.root = Node(name, score)
    }

    func insert(name: String, _ score: Int) {
        if self.root == nil {
            self.root = Node(name, score)
        } else {
            if score > self.root.score {
                self.root.rchild == nil ? self.root.rchild = Node(name, score) : insertChild(name, score, self.root.rchild)
            } else {
                self.root.lchild == nil ? self.root.lchild = Node(name, score) : insertChild(name, score, self.root.lchild)
            }
        }
    }

    func insertChild(name: String, _ score: Int, _ currentNode: Node) {
        if score > currentNode.score {
            currentNode.rchild == nil ? currentNode.rchild = Node(name, score) : insertChild(name, score, currentNode.rchild)
        } else {
            currentNode.lchild == nil ? currentNode.lchild = Node(name, score) : insertChild(name, score, currentNode.lchild)
        }
    }

    func includes(name: String, _ score: Int) -> Bool {
        if self.root == nil {
            return false
        } else {
            if self.root.name == name && self.root.score == score {
                return true
            } else {
                if score > self.root.score {
                    return self.root.rchild == nil ? false : recurseIncludes(name, score, self.root.rchild)
                } else {
                    return self.root.lchild == nil ? false : recurseIncludes(name, score, self.root.lchild)
                }
            }
        }
    }

    func recurseIncludes(name: String, _ score: Int, _ currentNode: Node) -> Bool {
        if currentNode.name == name && currentNode.score == score {
            return true
        } else {
            if score > currentNode.score {
                return currentNode.rchild == nil ? false : recurseIncludes(name, score, currentNode.rchild)
            } else {
                return currentNode.lchild == nil ? false : recurseIncludes(name, score, currentNode.lchild)
            }
        }
    }

    func find(name: String, _ score: Int) -> Node! {
        if self.root == nil {
            return nil
        } else {
            if self.root.name == name && self.root.score == score {
                return self.root
            } else {
                if score > self.root.score {
                    return self.root.rchild == nil ? nil : recurseFind(name, score, self.root.rchild)
                } else {
                    return self.root.lchild == nil ? nil : recurseFind(name, score, self.root.lchild)
                }
            }
        }
    }

    func recurseFind(name: String, _ score: Int, _ currentNode: Node) -> Node! {
        if currentNode.name == name && currentNode.score == score {
            return currentNode
        } else {
            if score > currentNode.score {
                return currentNode.rchild == nil ? nil : recurseFind(name, score, currentNode.rchild)
            } else {
                return currentNode.lchild == nil ? nil : recurseFind(name, score, currentNode.lchild)
            }
        }
    }

    func nodeDepth(node: Node) -> Int! {
        return depth(node.name, node.score)
    }

    func depth(name: String, _ score: Int) -> Int! {
        if self.root == nil {
            return nil
        } else {
            if self.root.name == name && self.root.score == score {
                return 0
            } else {
                if score > self.root.score {
                    return self.root.rchild == nil ? 1 : 0 + recurseDepth(name, score, self.root.rchild)
                } else if score < self.root.score {
                    return self.root.lchild == nil ? 1 : 0 + recurseDepth(name, score, self.root.lchild)
                } else {
                    return nil
                }
            }
        }
    }

    func recurseDepth(name: String, _ score: Int, _ currentNode: Node) -> Int! {
        if currentNode.name == name && currentNode.score == score {
            return 1
        } else {
            if score > currentNode.score {
                return currentNode.rchild == nil ? 1 : 1 + recurseDepth(name, score, currentNode.rchild)
            } else if score < currentNode.score {
                return currentNode.lchild == nil ? 1 : 1 + recurseDepth(name, score, currentNode.lchild)
            } else {
                return nil
            }
        }
    }

    func height() -> Int! {
        if self.root == nil {
             return nil
        } else {
            if self.root.isLeaf() {
                return nodeDepth(self.root)
            } else {
                return recurseHeight(self.root)
            }
        }
    }

    func recurseHeight(currentNode: Node) -> Int {
        let right = currentNode.rchild == nil ? nodeDepth(currentNode) : recurseHeight(currentNode.rchild)
        let left = currentNode.lchild == nil ? nodeDepth(currentNode) : recurseHeight(currentNode.lchild)
        return right > left ? right : left
    }

    func leaves() -> Int! {
        if self.root == nil {
            return nil
        } else {
            if self.root.isLeaf() {
                return 1
            } else {
                var leaves = 0
                if self.root.rchild != nil {
                    leaves += recurseLeaves(self.root.rchild)
                }
                if self.root.lchild != nil {
                    leaves += recurseLeaves(self.root.lchild)
                }
                return leaves
            }
        }
    }

    func recurseLeaves(currentNode: Node) -> Int {
        if currentNode.isLeaf() {
            return 1
        } else {
            var temp = 0
            if currentNode.rchild != nil {
                temp += recurseLeaves(currentNode.rchild)
            }
            if currentNode.lchild != nil {
                temp += recurseLeaves(currentNode.lchild)
            }
          return temp
        }
    }

    func max() -> Node! {
        if self.root == nil {
            return nil
        } else {
            if self.root.isLeaf() {
                return self.root
            } else {
                return self.root.rchild == nil ? self.root : recurseMax(self.root.rchild)
            }
        }
    }

    func recurseMax(currentNode: Node) -> Node {
        return currentNode.rchild == nil ? currentNode : recurseMax(currentNode.rchild)
    }


    func min() -> Node! {
        if self.root == nil {
            return nil
        } else {
            if self.root.isLeaf() {
                return self.root
            } else {
                return self.root.lchild == nil ? self.root : recurseMin(self.root.lchild)
            }
        }
    }

    func recurseMin(currentNode: Node) -> Node {
        return currentNode.lchild == nil ? currentNode : recurseMin(currentNode.lchild)
    }
}

