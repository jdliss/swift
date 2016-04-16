import Node

class LinkedList {
  var head : Node?

  init() {
    self.head = nil
  }

  init(head: Node) {
    self.head = head
  }

  init(data: String) {
    self.head = Node(data)
  }

}
