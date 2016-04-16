
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
        } else if self.head!.next == nil {
            self.head!.next = Node(data: data)
        } else {
            appendHelper(self.head!.next!, data: data)
        }
    }

    func appendHelper(currentNode: Node, data: String) {
        if currentNode.next == nil {
            currentNode.next = Node(data: data)
        } else {
            appendHelper(currentNode.next!, data: data)
        }
    }

    func tail(currentNode: Node) -> Node {
        if currentNode.next == nil {
            return currentNode
        } else {
            return tail(currentNode.next!)
        }
    }

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
}


var list = LinkedList()

list.append("yoooo")
list.append("heyy")
list.append("lets gooo")
list.append("alriiiight")

list.printList()
print(list.tail(list.head!).data)
