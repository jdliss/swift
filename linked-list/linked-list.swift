
class Node {
    var data: String?
    var next: Node?

    init (data: String) {
        self.data = data
        self.next = nil
    }
}

class LinkedList {
    var head : Node?

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
          let currentNode = self.head!
          tail(currentNode).next = Node(data: data)
        }
    }

    func tail(currentNode: Node) -> Node {
        if currentNode.next == nil {
            return currentNode
        } else {
            return tail(currentNode.next!)
        }
    }
    
//    func printList(currentNode: Node?) {
//        if currentNode == nil && self.head != nil {
//            let currentNode = self.head
//            printList(currentNode!.next)
//        } else if currentNode!.data == nil || currentNode!.data! == "" {
//            print("List empty!")
//        } else {
//            printList(self.head!.next)
//        }
//    }

    func printList() {
        if self.head == nil || self.head!.data! == "" {
            print("Empty List")
        } else {
            printHelper(self.head!)
        }
    }

    func printHelper(currentNode: Node) {
        print(currentNode.data!)
        if currentNode.next != nil {
            printHelper(currentNode.next!)
        }
    }
    
    func find(data: String) -> Node {
        if self.head!.data! == data {
            return self.head!
        } else {
            return findHelper(self.head!.next!, data: data)
        }
    }
    
    func findHelper(currentNode: Node, data: String) -> Node{
        if currentNode.data! == data {
            return currentNode
        } else {
            return findHelper(currentNode.next!, data: data)
    
        }
    }
}


var list = LinkedList()
list.printList()

list.append("yoooo")
list.append("heyy")
list.append("lets gooo")
list.append("alriiiight")

list.printList()
print(list.tail(list.head!).data!)

var node = list.find("lets gooo")
print(node.data!)

