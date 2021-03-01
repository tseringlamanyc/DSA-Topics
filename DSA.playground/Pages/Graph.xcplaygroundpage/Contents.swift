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
    var weight: Int? = nil
}

struct Node {
    var value: Int // weight
    var weight: Int? = nil
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

//let edges = [
//  Edge(source: 0, destination: 1),
//  Edge(source: 0, destination: 4),
//
//  Edge(source: 1, destination: 0),
//  Edge(source: 1, destination: 2),
//  Edge(source: 1, destination: 4),
//  Edge(source: 1, destination: 3),
//
//  Edge(source: 2, destination: 1),
//  Edge(source: 2, destination: 3),
//
//  Edge(source: 3, destination: 1),
//  Edge(source: 3, destination: 2),
//  Edge(source: 3, destination: 4),
//
//  Edge(source: 4, destination: 0),
//  Edge(source: 4, destination: 1),
//  Edge(source: 4, destination: 3),
//]
//
//var graph2 = Graph2(edges: edges)
//
//graph2.printGraph()

extension Graph2 {
    
    func dfs(source: Int) {
        var visited: Set<Int> = []
        var stack = [Int]()
        
        stack.append(source)
        visited.insert(source)
        
        while !stack.isEmpty {
            let source = stack.removeLast()
            print("\(source)", terminator: " ")
            
            for neighborNode in adjList[source] {
                
                if !visited.contains(neighborNode.value) {
                    visited.insert(neighborNode.value)
                    stack.append(neighborNode.value)
                }
                
            }
        }
    }
}


let edges = [
    Edge(source: 0, destination: 1),
    Edge(source: 0, destination: 3),
    
    Edge(source: 1, destination: 0),
    Edge(source: 1, destination: 2),
    
    Edge(source: 2, destination: 1),
    Edge(source: 2, destination: 3),
    
    Edge(source: 3, destination: 0),
    Edge(source: 3, destination: 2),
]

var graph2 = Graph2(edges: edges)

graph2.dfs(source: 0)

print()

let matrix = [
  [1, 2, 3, 4,],
  [5, 6, 7, 8],
  [9, 10, 11, 12],
  [13, 14, 15, 16]
]
// 1 5 9 13 14 10 6 2 3 7 11 15 16 12 8 4

func dfs(_ grid: [[Int]]) {
    
    // in dfs always keep track (eg visited set)
    var grid = grid
    
    // keep track by (bool, or arbitarary value)
    for row in 0..<grid.count {
        for col in 0..<grid[row].count {
           helperdfs(&grid, row, col)
        }
    }
}

func helperdfs(_ grid: inout [[Int]], _ row: Int, _ col: Int) {
    // set boundaries
    /*
     have we seen the cell before
     is the row within the limits of the array
     is the col within the limits of the array
     */
    
    let height = grid.count // number of rows
    let length = grid[0].count // number of elements in a row
    
    if row < 0 || col < 0 || row >= height || col >= length || grid[row][col] == 0 {return}
    
    print("\(grid[row][col])", terminator: " ")
    
    // mark the cell as seen
    grid[row][col] = 0
    
    // perform dfs on each direction in the grid recursively
    helperdfs(&grid, row + 1, col)
    helperdfs(&grid, row - 1, col)
    helperdfs(&grid, row, col + 1)
    helperdfs(&grid, row, col - 1)
}

dfs(matrix)
