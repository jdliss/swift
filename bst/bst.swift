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
}

class BST {
    var root: Node!
    
    init() {}
    
    init(_ node: Node) {
        self.root = node
    }
    
    init(name: String, _ score: Int) {
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
}




var bst = BST(Node("root node", 50))
bst.insert("1st lchild", 40)
print(bst.root.lchild.name)
bst.insert("1st rchild", 60)
print(bst.root.rchild.name)
