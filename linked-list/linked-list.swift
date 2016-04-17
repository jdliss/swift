
class Node {
    var data: String!
    var next: Node!

    init (data: String) {
        self.data = data
        self.next = nil
    }
}

class LinkedList {
    var head : Node!

    init() {
        self.head = nil
    }

    init(head: Node) {
        self.head = head
    }

    init(str: String) {
        self.head = Node(data: str)
    }

    func append(data: String) {
        if self.head == nil {
            self.head = Node(data: data)
        } else {
          let currentNode = self.head
          tail(currentNode).next = Node(data: data)
        }
    }

    func tail(currentNode: Node) -> Node {
        if currentNode.next == nil {
            return currentNode
        } else {
            return tail(currentNode.next)
        }
    }

    func printList() {
        if self.head == nil || self.head.data == "" {
            print("Empty List")
        } else {
            recursivePrint(self.head)
        }
    }

    func recursivePrint(currentNode: Node) {
        print(currentNode.data)
        if currentNode.next != nil {
            recursivePrint(currentNode.next)
        }
    }
    
    func find(data: String) -> Node! {
        if self.head.data == data {
            return self.head
        } else {
            return recursiveFind(self.head.next, data: data)
        }
    }
    
    func recursiveFind(currentNode: Node, data: String) -> Node! {
        if currentNode.data == data {
            return currentNode
        } else if currentNode.next != nil {
            return recursiveFind(currentNode.next, data: data)
        } else {
            return nil
        }
    }
    
    func delete(data: String) {
        if self.head.data == data {
            if self.head.next == nil {
                self.head = nil
            } else {
                self.head = self.head.next
            }
        } else {
            resursiveDelete(self.head, data: data)
        }
    }
    
    func resursiveDelete(currentNode: Node, data: String) {
        if currentNode.next.data == data {
            currentNode.next = currentNode.next.next
        } else if currentNode.next != nil {
            resursiveDelete(currentNode.next, data: data)
        }
    }
    
    func findParent(startNode: Node, findNode: Node) -> Node! {
        if startNode === findNode {
            return nil
        } else {
            return recursiveFindParent(self.head, findNode: findNode)
        }
    }
    
    func recursiveFindParent(currentNode: Node, findNode: Node) -> Node {
        if currentNode.next === findNode {
            return currentNode
        } else {
            return recursiveFindParent(currentNode.next, findNode: findNode)
        }
    }
    
    func pop() -> Node! {
        if self.head == nil {
            return nil
        } else {
            let tail = self.tail(self.head)
            self.findParent(self.head, findNode: tail).next = nil
            return tail
        }
    }
}


var list = LinkedList()
print("Printing empty list")
list.printList()

list.append("yoooo")
list.append("dooooope")
list.append("lets gooo")
list.append("alriiiight")
print("\nprinting list after appending 4 nodes")
list.printList()

print("\nprinting tail node")
print(list.tail(list.head).data)

print("\nfinding node 'lets gooo'")
let node = list.find("lets gooo")
print(node.data)

print("\nfinding node 'sdgsdg'")
let badNode = list.find("sdgsdg")
if badNode == nil {
    print("node not found (nil)")
} else {
    print("something went wrong")
}

print("\nprinting list after deleting 'lets gooo' node")
list.delete("lets gooo")
list.printList()

print("\nfinding parent of 'yoooo'")
let noParentNode: Node! = list.findParent(list.head, findNode: list.find("yoooo"))
if noParentNode != nil {
    print(noParentNode.data)
} else {
    print("No parent")
}

print("\nfinding parent of 'dooooope'")
let parentNode: Node! = list.findParent(list.head, findNode: list.find("dooooope"))
if parentNode != nil {
    print(parentNode.data)
} else {
    print("No parent")
}

print("\nprinting popped node (should be 'alriiiight')")
print(list.pop().data)

print("\nprinting popped node (should be 'dooooope')")
print(list.pop().data)

var newList = LinkedList()

print("\nattempting to pop from empty list")
let emptyPop = newList.pop()

if emptyPop == nil {
    print("Nothing popped")
} else {
    print("something went wrong")
}
