import Foundation

/*
 GRAPHS
 
 Vertex - Circle
 Edges - lines
 
 directed - edges w direction
 undirected - no direction
 
 Singapore (Vertex) - [Tokyo, HK] (Adjacency list / adjacency matrix)
 */

func simplifyPath(_ path: String) -> String {
    
    let arrStr = path.split(separator: "/")
    var stack = [String]()
    
    for char in arrStr {
        if char == "." {continue}
        if char == ".." {
            if !stack.isEmpty {
                stack.removeLast()
            }
        } else {
            stack.append((String(char)))
        }
    }
    
    print(stack)
    
    return "/" + stack.joined(separator: "/")
    
}

simplifyPath("/home//foo/")

public class Vertex {
    var key: String
    
    public init(key: String) {
        self.key = key
    }
    
    deinit {}
}

public class Edge {
    let source: Vertex
    let target: Vertex
    var weight: Int
    
    init(from source: Vertex, to target: Vertex, weight: Int = 0) {
        self.source = source
        self.target = target
        self.weight = weight
    }
    
    deinit {}
}

public protocol Graph {
    
    func addEdge(_ edge: Edge)
    func edges(of vertex: Vertex) -> [Edge]
    func neighbors(of vertex: Vertex) -> [Vertex]
    
}

public class UndirectedGraph: Graph {
    private var index = Dictionary<String, Array<Edge>>()
    
    public func addEdge(_ edge: Edge) {
        index[edge.source.key, default: []].append(edge)
        if edge.source.key != edge.target.key {
            index[edge.target.key, default: []].append(edge)
        }
    }
    
    public func edges(of vertex: Vertex) -> [Edge] {
        return index[vertex.key, default: []]
    }
    
    public func neighbors(of vertex: Vertex) -> [Vertex] {
        return edges(of: vertex).map {
            $0.source.key == vertex.key ? $0.target : $0.source
        }
    }
}

public class DirectedGraph: Graph {
    private var sourceIndex = Dictionary<String, Array<Edge>>()
    private var targetIndex = Dictionary<String, Array<Edge>>()
    
    public func addEdge(_ edge: Edge) {
        sourceIndex[edge.source.key, default: []].append(edge)
        targetIndex[edge.target.key, default: []].append(edge)
    }
    
    public func edges(source: Vertex) -> [Edge] {
        return sourceIndex[source.key, default: []]
    }
    
    public func edges(target: Vertex) -> [Edge] {
        return targetIndex[target.key, default: []]
    }
    
    public func edges(of vertex: Vertex) -> [Edge] {
        return edges(source: vertex) + edges(target: vertex)
    }
    
    public func targets(of vertex: Vertex) -> [Vertex] {
        return edges(source: vertex).map { $0.target }
    }
    
    public func sources(of vertex: Vertex) -> [Vertex] {
        return edges(target: vertex).map { $0.source }
    }
    
    public func neighbors(of vertex: Vertex) -> [Vertex] {
        return sources(of: vertex) + targets(of: vertex)
    }
}

func testGraph(_ graph: Graph) {
    let a = Vertex(key: "a")
    let b = Vertex(key: "b")
    let c = Vertex(key: "c")
    let d = Vertex(key: "d")
    graph.addEdge(Edge(from: a, to: b))
    graph.addEdge(Edge(from: b, to: c))
    graph.addEdge(Edge(from: c, to: a))
    graph.addEdge(Edge(from: a, to: d))
    graph.addEdge(Edge(from: a, to: a))
    
    if let directedGraph = graph as? DirectedGraph {
        print("Targets of vertex a:")
        directedGraph.targets(of: a).forEach { print($0.key) }
        print("Sources of vertex a:")
        directedGraph.sources(of: a).forEach { print($0.key) }
    } else {
        print("Neighbors of vertex a:")
        graph.neighbors(of: a).map { print($0.key) }
    }
}

testGraph(DirectedGraph())
testGraph(UndirectedGraph())
