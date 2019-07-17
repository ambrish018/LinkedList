import UIKit

var str = "Hello, playground"

class Node<Element> {
    var data : Element
    var next : Node<Element>?
    init(value:Element) {
        self.data = value
    }
}

class LinkedList<Element> {
    var head : Node<Element>?

    var isEmpty : Bool {
        if head == nil {
            return true
        }
        return false
    }
    
    var first : Node<Element>? {
        return head
    }
    var last : Node<Element>? {
        if var h = head {
            while h.next != nil {
                h = h.next!
            }
            return h
        }else{
            return nil
        }
    }
    
    func append(value:Element) {
        let newNode = Node(value: value)
        
        if var h = head {
            while h.next != nil {
                h = h.next!
            }
            h.next = newNode
        }else{
            head = newNode
        }
    }
    
    func removeLast() -> Element?  {
        if var h = head {
        if var next = head?.next {
            var prev_node = h
            while h.next != nil {
                prev_node = h
                h = h.next!
            }
            prev_node.next = nil
            return h.data
        }else{
            head = nil
            return h.data
            }
        }
        return nil
    }
}

var obj = LinkedList<String>()
obj.append(value: "amrbish")
obj.append(value: "amrbish1")
obj.append(value: "amrbish2")


print(obj.isEmpty,obj.removeLast(),obj.removeLast(),obj.removeLast(),obj.first?.data)


//********************** Doubly LinkedList*******************

class DNode<Element:Comparable> : Equatable{
    var data : Element
    var next : DNode?
    var Previous : DNode?
    init(value:Element) {
        self.data = value
    }
    static func == (lhs: DNode, rhs: DNode) -> Bool {
        return lhs.data == rhs.data
        }
    
   
}
class DoublyLinkedList<Element:Comparable>: Sequence, IteratorProtocol {
    var head : DNode<Element>?
    var isEmpty : Bool {
        return head == nil
    }
   internal var temp : DNode<Element>?
   internal var isLast = false
    func next() -> DNode<Element>? {
        if isLast == false {
        if  temp != nil {
            if temp?.next != nil {
            
            defer {
                    temp = temp?.next!
                }
            //print("-->>\(temp?.data)")
                
            return temp
            }else{
                isLast = true
               // print("-->>\(temp?.data)")

                return temp
            }
            
        }else{
            temp = first
            defer {
                temp = temp?.next!
            }
            return temp

            }}else{
            isLast = false
            temp = nil
            return nil
        }
        //return nil
    }
    
    
    var first: DNode<Element>? {
        return head
    }
    
    func append(value:Element) {
        let newNode = DNode(value: value)
        if var  h = head {
            while h.next != nil {
                h = h.next!
            }
            h.next = newNode
            newNode.Previous = h
        }else{
            head = newNode
        }
    }
    
    func goNext(fromElement:Element) -> Element? {
        if var h = head {
            while h.next != nil  {
                h = h.next!
                if h.data == fromElement {
                    
                    return goNext(node: h)?.data
                }
            }
        }
        return nil
    }
    
    func goPrevious(fromElement:Element) -> Element? {
        if var h = head {
            while h.next != nil  {
                h = h.next!
                if h.data == fromElement {
                    
                    return goBack(node: h)?.data
                }
            }
        }
        return nil
    }
    
    func insert(element:Element,afterElement:Element ){
        if var h = head {
            while h.next != nil  {
                h = h.next!
                if h.data == afterElement {
                    let newNode = DNode(value: element)
                    let temp = h.next
                    temp?.Previous = newNode
                    h.next = newNode
                    newNode.next = temp
                    newNode.Previous = h
                    
                    break
                }
            }
        }
    }
    
   internal func goNext(node:DNode<Element>)->DNode<Element>?{
        if let next = node.next {
            return next
        }
        return nil
    }
   internal func goBack(node:DNode<Element>) ->DNode<Element>?{
        if let prev = node.Previous {
            return prev
        }
        
        return nil
    }
    
}

let songQueue = DoublyLinkedList<String>()
songQueue.append(value: "Track1")
songQueue.append(value: "Track2")
songQueue.append(value: "Track3")
//songQueue.append(value: "Track4")
songQueue.append(value: "Track5")
songQueue.append(value: "Track6")
songQueue.append(value: "Track7")

songQueue.insert(element: "Track4",afterElement:"Track3")
for item in songQueue {
    print(item.data)
}


print(songQueue.isEmpty,songQueue.first?.next?.next?.next?.next?.Previous?.data)


