import Foundation

struct Graph {
    private var vertices: Int
    
    // data
    private var adjMatrix: [[Bool]]
    
    // initializer takes vertices
    // creats a matrix and defaults to false
    
    init(vertices: Int) {
        self.vertices = vertices
        self.adjMatrix = Array(repeating: Array(repeating: false, count: vertices), count: vertices)
    }
    
    mutating func addEdge(source: Int, destination: Int) {
        // assuming this is undirected (bi-directional)
        adjMatrix[source][destination] = true
        adjMatrix[destination][source] = true
    }
    
    func printGraph() {
        var description = ""
        
        for destinationIndex in 0..<vertices {
            description.append("\(destinationIndex)")
        }
        description.append("\n")
        
        for sourceIndex in 0..<adjMatrix.count {
            description.append("\(sourceIndex): ")
            for hasConnection in adjMatrix[sourceIndex] {
                description.append(hasConnection ? "1" : "0")
                description.append(" ")
            }
            description.append("\n")
        }
        print(description)
    }
    
}

/*

 0---------1
 |       / |  \
 |    /    |    \
 |  /      |    / 2
 |/        |  /
 4---------3/
 
   0 1 2 3 4
0: 0 1 0 0 1
1: 1 0 1 1 1
2: 0 1 0 1 0
3: 0 1 1 0 1
4: 1 1 0 1 0
 
*/

var graph = Graph(vertices: 5)
graph.addEdge(source: 0, destination: 1)
graph.addEdge(source: 0, destination: 4)
graph.addEdge(source: 1, destination: 3)
graph.addEdge(source: 1, destination: 2)
graph.addEdge(source: 2, destination: 3)
graph.addEdge(source: 3, destination: 4)
graph.addEdge(source: 4, destination: 1)

graph.printGraph()

struct Edge {
    var source: Int
    var destination: Int
}

struct Node {
    var value: Int // weight
}

struct Graph2 {
    // data structure for graph
    private var adjList: [[Node]]
    
    init(edges: [Edge]) {
        
        // arr of arr: [[], [], []]
        self.adjList = Array(repeating: [Node](), count: edges.count)
        
        for edge in edges {  // 0(source) --> 1(destination)  => [[1]] index 0
            let destinationNode = Node(value: edge.destination)
            adjList[edge.source].append(destinationNode) // could be array of linkedList
        }
    }
    
    func printGraph() {
        for sourceIndex in 0..<adjList.count {
            for edge in adjList[sourceIndex] {
                print("\(sourceIndex) ---> \(edge.value)", terminator: " ")
            }
            print()
        }
    }
}

let edges = [
  Edge(source: 0, destination: 1),
  Edge(source: 0, destination: 4),
  
  Edge(source: 1, destination: 0),
  Edge(source: 1, destination: 2),
  Edge(source: 1, destination: 4),
  Edge(source: 1, destination: 3),
  
  Edge(source: 2, destination: 1),
  Edge(source: 2, destination: 3),
  
  Edge(source: 3, destination: 1),
  Edge(source: 3, destination: 2),
  Edge(source: 3, destination: 4),

  Edge(source: 4, destination: 0),
  Edge(source: 4, destination: 1),
  Edge(source: 4, destination: 3),
]

var graph2 = Graph2(edges: edges)

graph2.printGraph()

