require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms


# O(|E| + |V|) time total

def topological_sort(vertices)
  sorted = []
  top = []

  # O(|V|) time complexity
  vertices.each do |vert|
    if vert.in_edges.empty?
      top << vert
    end
  end

  #O(|E|) time
  until top.empty?
    current = top.pop
    sorted << current
    current.out_edges.each do |edge|
      edge.to_vertex.in_edges.delete(edge)
      if edge.to_vertex.in_edges.empty?
        top << edge.to_vertex
      end

    end
  end
  vertices.length > sorted.length ? [] : sorted
end
